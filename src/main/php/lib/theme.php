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

include_once("lib/user.php");
include_once("lib/utils.php");
include_once("lib/fileutils.php");
include_once("lib/language.php");
include_once("lib/cssparser/cssparser.php");
include_once("lib/rss.php");
include_once("lib/scripts.php");

function get_opendb_site_theme() {
	global $_OPENDB_THEME;

	return $_OPENDB_THEME;
}

function get_content_type_charset() {
	$contentType = "text/html";

	$charSet = get_opendb_config_var('themes', 'charset');
	if (strlen($charSet) > 0) {
		$contentType .= ";charset=" . $charSet;
	}

	return $contentType;
}

function _theme_header($title = NULL, $inc_menu = TRUE) {
	global $PHP_SELF;
	global $HTTP_VARS;

	if (function_exists('theme_header')) {
		header("Cache-control: no-store");
		header("Pragma: no-store");
		header("Expires: 0");

		if (is_site_public_access()) {
			$user_id = NULL;
		} else {
			$user_id = get_opendb_session_var('user_id');
		}

		$include_menu = ($inc_menu !== FALSE && $inc_menu !== 'N' ? TRUE : FALSE);
		if (!$include_menu && strlen($HTTP_VARS['mode']) == 0) {
			$HTTP_VARS['mode'] = 'no-menu';
		}

		$pageId = basename($PHP_SELF, '.php');

		return theme_header($pageId, $title, $include_menu, $HTTP_VARS['mode'], $user_id);
	} else {
		return NULL;
	}
}

function _theme_footer() {
	global $PHP_SELF;

	$user_id = get_opendb_session_var('user_id');
	if (is_site_public_access()) {
		$user_id = NULL;
	}

	$pageId = basename($PHP_SELF, '.php');

	if (function_exists('theme_footer')) {
		return theme_footer($pageId, $user_id);
	} else {
		return NULL;
	}
}

function get_theme_javascript($pageid) {
	$scripts[] = 'common.js';
	$scripts[] = 'date.js';
	$scripts[] = 'forms.js';
	$scripts[] = 'listings.js';
	$scripts[] = 'marquee.js';
	$scripts[] = 'search.js';
	$scripts[] = 'tabs.js';
	$scripts[] = 'validation.js';

	if ($pageid == 'admin') {
		$scripts[] = 'overlibmws/overlibmws.js';
		$scripts[] = 'overlibmws/overlibmws_function.js';
		$scripts[] = 'overlibmws/overlibmws_iframe.js';
		$scripts[] = 'overlibmws/overlibmws_hide.js';
		$scripts[] = 'admin/tooltips.js';
	}

	$buffer = '';

	while (list(, $script) = each($scripts)) {
		$buffer .= get_javascript($script);
	}

	return $buffer;
}

function get_theme_css($pageid, $mode = NULL) {
	global $_OpendbBrowserSniffer;

	$buffer = "\n";

	$file_list = theme_css_file_list($pageid);
	if (count($file_list) > 0) {
		while (list(, $css_file_r) = each($file_list)) {
			if (strlen($css_file_r['browser']) == 0 || $_OpendbBrowserSniffer->isBrowser($css_file_r['browser'])) {
				$buffer .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"" . $css_file_r['file'] . "\">\n";
			}
		}
	}

	if ($mode == 'printable' || $mode == 'no-menu') {
		$file_list = theme_css_file_list($pageid, $mode);
		if (count($file_list) > 0) {
			while (list(, $css_file_r) = each($file_list)) {
				$buffer .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"" . $css_file_r['file'] . "\">\n";
			}
		}
	}

	return $buffer;
}

function theme_css_file_list($pageid, $mode = NULL) {
	$css_file_list = array();
	$css_file_list = array_merge($css_file_list, get_css_files('style', $mode));
	$css_file_list = array_merge($css_file_list, get_css_files($pageid, $mode));

	return $css_file_list;
}

function get_css_files($pageid, $mode = NULL) {
	global $_OpendbBrowserSniffer;

	$css_file_list = array();
	$theme = get_opendb_site_theme();

	if ($mode == NULL) {
		if (strlen($theme) > 0 && opendb_file_exists("css/$theme/${pageid}.css")) {
			$css_file_list[] = array(file => "css/$theme/${pageid}.css");
		}

		$browsers_r = $_OpendbBrowserSniffer->getSupportedBrowsers();
		while (list(, $browser) = each($browsers_r)) {
			$suffix = str_replace(".", NULL, $browser);

			if (strlen($theme) > 0 && opendb_file_exists("css/$theme/${pageid}_${suffix}.css")) {
				$css_file_list[] = array(file => "css/$theme/${pageid}_${suffix}.css", browser => $browser);
			}
		}
	} else if ($mode == 'printable') {
		if (strlen($theme) > 0 && opendb_file_exists("css/$theme/${pageid}_print.css")) {
			$css_file_list[] = array(file => "css/$theme/${pageid}_print.css");
		}
	} else if ($mode == 'no-menu') {
		if (strlen($theme) > 0 && opendb_file_exists("css/$theme/${pageid}_nomenu.css")) {
			$css_file_list[] = array(file => "css/$theme/${pageid}_nomenu.css");
		}
	}

	return $css_file_list;
}

function get_theme_search_dir_list() {
	$theme = get_opendb_site_theme();
	$language = strtolower(get_opendb_site_language());

	$dirPath = array();

	if (strlen($theme) > 0 && strlen($language) > 0) {
		$dirPath[] = "images/$theme/$language";
	}

	if (strlen($theme) > 0) {
		$dirPath[] = "images/$theme";
	}

	if (strlen($language) > 0) {
		$dirPath[] = "images/default/$language";
	}

	$dirPath[] = "images/default";
	$dirPath[] = "images";

	return $dirPath;
}

function get_theme_search_site_dir_list() {
	$theme = get_opendb_site_theme();

	$dirPath = array();

	if (strlen($theme) > 0) {
		$dirPath[] = "images/$theme/site";
	}

	$dirPath[] = "images/site";

	return $dirPath;
}

/**
 * @param unknown_type $src
 * @return - expected to be relative image reference, not an absolute one!
 */
function theme_image_src($src) {
	if (strlen($src) > 0) {
		if (starts_with($src, 'images/site/')) {
			$dirPaths = get_theme_search_site_dir_list();
		} else {
			$dirPaths = get_theme_search_dir_list();
		}

		$src = safe_filename($src);
		$file_r = parse_file($src);

		$src = $file_r['name'];

		$extension_r = array($file_r['extension']);

		while (list(, $dir) = each($dirPaths)) {
			reset($extension_r);
			while (list(, $extension) = each($extension_r)) {
				$file = $dir . '/' . $src . '.' . $extension;
				if (opendb_file_exists($file)) {
					return $file;
				}
			}
		}
	}

	return FALSE; // no image found.
}

/**
    Will format a complete image url.

    @param $src		The image.ext without any path information.
    @param $title	The tooltip to include in the image.
    @param $type	Specifies the origin of the image.  Current types being
                    used are:
                        s_item_type - for 's_item_type' images.
                        borrowed_item - Borrow system status images.
                        action - Item operation (edit, delete, etc)
 */
function theme_image($src, $title = NULL, $type = NULL) {
	$file_r = parse_file(basename($src));
	$alt = ucfirst($file_r['name']);

	if (($src = theme_image_src($src)) !== FALSE) {
		return "<img src=\"$src\"" . (strlen($alt) > 0 ? " alt=\"" . $alt . "\"" : "") . (strlen($title) > 0 ? " title=\"$title\"" : "") . (strlen($type) > 0 ? " class=\"$type\"" : "") . ">";
	} else if ($type == "action") { // Special type, that if not handled, will be handled back at caller instead!
		return FALSE;
	} else {
		return $alt;
	}
}

/**
 * assumes a stats.css exists for every theme that wants to render stats graphs.
 *
 * @return unknown
 */
function theme_graph_config() {
	$theme = get_opendb_site_theme();
	if (strlen($theme) > 0) {
		$cssParser = new cssparser(FALSE);
		$cssFile = get_opendb_file("css/$theme/stats.css");
		if ($cssParser->Parse($cssFile)) {
			$stats_graph_config_r = $cssParser->GetSection('.OpendbStatsGraphs');
			return $stats_graph_config_r;
		}
	}
	return FALSE;
}

function is_exists_theme($theme) {
	if (strlen($theme) <= 20 && opendb_file_exists("theme/$theme/theme.php")) {
		return TRUE;
	} else {
		return FALSE;
	}
}

function get_user_theme_r() {
	return get_dir_list('theme', 'is_exists_theme');
}

function opendb_not_authorised_page() {
	echo _theme_header(get_opendb_lang_var('not_authorized_to_page'));
	echo ("<p class=\"error\">" . get_opendb_lang_var('not_authorized_to_page') . "</p>");
	echo _theme_footer();
}
?>