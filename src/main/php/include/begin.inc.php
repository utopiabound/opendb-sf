<?php
/* 	
    Open Media Collectors Database
    Copyright (C) 2001-2012 by Jason Pell

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

// Set error reporting to something OpenDb is capable of handling
if (!defined('E_DEPRECATED')) {
	define('E_DEPRECATED', 0);
}
error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);

// In case session handler error
//ini_set('session.save_handler', 'files'); 

// PLEASE DO NOT CHANGE THIS AS ITS AN INTERNAL VARIABLE FOR USE IN INSTALLER and other functions.
define('__OPENDB_RELEASE__', '2.0.0B1');
define('__OPENDB_TITLE__', 'OpenDb');

include_once("lib/fileutils.php");
include_once("lib/config.php");
include_once("lib/database.php");

if (opendb_file_exists("include/local.config.php")) {
	include_once("include/local.config.php");
}

// create database regardless of configuration
$OPENDB_DATABASE = new Database($CONFIG_VARS['db_server']);

$OPENDB_CONFIGURATION = new Configuration($OPENDB_DATABASE);

if (is_array($CONFIG_VARS)) {
	if (is_array($CONFIG_VARS['session_handler'])) {
		$OPENDB_CONFIGURATION->setGroup('session_handler', $CONFIG_VARS['session_handler']);
	}
}

include_once("lib/http.php");
include_once("lib/utils.php");

include_once("lib/auth.php");
include_once("lib/session.php");
include_once("lib/theme.php");
include_once("lib/language.php");
include_once("lib/menu.php");

include_once("lib/OpenDbBrowserSniffer.class.php");

// OpenDb will not work with this on!!!
if (get_magic_quotes_runtime()) {
	set_magic_quotes_runtime(false);
}

// Only if $PHP_SELF is not already defined.
if (!isset($PHP_SELF)) {
	// get_http_env is a OpenDb function!
	$PHP_SELF = get_http_env('PHP_SELF');
}

// We want all the HTTP variables into the $HTTP_VARS array, so
// we can reference everything from the one place.
// any upload files will be in new post php 4.1 $_FILES array
if (!empty($_GET)) {
	// fixes for XSS vulnerabilities reported in OpenDb 1.0.6
	// http://secunia.com/advisories/31719
	$HTTP_VARS = strip_tags_array($_GET);
} else if (!empty($_POST)) {
	$HTTP_VARS = $_POST;
}

// Strip all slashes from this array.
if (get_magic_quotes_gpc()) {
	$HTTP_VARS = stripslashes_array($HTTP_VARS);
}

//define a global browser sniffer object for use by theme and elsewhere
$_OpendbBrowserSniffer = new OpenDbBrowserSniffer();

// defaults where no database access		    
$_OPENDB_THEME = 'default';
$_OPENDB_LANGUAGE = 'ENGLISH';

if ($OPENDB_DATABASE->isConnected()) {
	// Cache often used configuration entries
	$CONFIG_VARS['logging'] = get_opendb_config_var('logging');

	// Buffer output for possible pushing through ob_gzhandler handler
	if (is_gzip_compression_enabled($PHP_SELF)) {
		ob_start('ob_gzhandler');
	}

	// Restrict cookie to site host and path.
	if (get_opendb_config_var('site', 'restrict_session_cookie_to_host_path') === TRUE) {
		session_set_cookie_params(0, get_site_path(), get_site_host());
	}

	if (get_opendb_config_var('session_handler', 'enable') === TRUE) {
		require_once("lib/dbsession.php");

		if (strtolower(ini_get('session.save_handler')) == 'user' || ini_set('session.save_handler', 'user')) {
			session_set_save_handler('db_session_open', 'db_session_close', 'db_session_read', 'db_session_write', 'db_session_destroy', 'db_session_gc');
		} else {
			opendb_logger(OPENDB_LOG_ERROR, __FILE__, NULL, 'Cannot set session.save_handler to \'user\'');
		}
	}

	// We want to start the session here, so we can get access to the $_SESSION properly.
	session_start();

	//allows specific pages to overide themes
	if (is_exists_theme($_OVRD_OPENDB_THEME)) {
		$_OPENDB_THEME = $_OVRD_OPENDB_THEME;
	} else {
		unset($_OPENDB_THEME);

		if (strlen(get_opendb_session_var('user_id')) > 0 && get_opendb_config_var('user_admin', 'user_themes_support') !== FALSE) {
			$user_theme = fetch_user_theme(get_opendb_session_var('user_id'));

			if (is_exists_theme($user_theme)) {
				$_OPENDB_THEME = $user_theme;
			}
		}

		if (strlen($_OPENDB_THEME) == 0) {
			if (is_exists_theme(get_opendb_config_var('site', 'theme'))) {
				$_OPENDB_THEME = get_opendb_config_var('site', 'theme');
			} else {
				$_OPENDB_THEME = 'default';
			}
		}
	}

	if (is_exists_language($_OVRD_OPENDB_LANGUAGE)) {
		$_OPENDB_LANGUAGE = $_OVRD_OPENDB_LANGUAGE;
	} else {
		unset($_OPENDB_LANGUAGE);

		if (strlen(get_opendb_session_var('user_id')) > 0 && get_opendb_config_var('user_admin', 'user_language_support') !== FALSE) {
			$user_language = fetch_user_language(get_opendb_session_var('user_id'));

			if (is_exists_language($user_language)) {
				$_OPENDB_LANGUAGE = $user_language;
			}
		}

		if (strlen($_OPENDB_LANGUAGE) == 0) {
			if (is_exists_language(get_opendb_config_var('site', 'language'))) {
				$_OPENDB_LANGUAGE = strtoupper(get_opendb_config_var('site', 'language'));
			} else {
				$_OPENDB_LANGUAGE = fetch_default_language();
			}
		}
	}
}

if ($HTTP_VARS['mode'] == 'job') {
	$_OPENDB_THEME = '';
}

if (strlen($_OPENDB_THEME) > 0) {
	include_once("theme/$_OPENDB_THEME/theme.php");
}
?>
