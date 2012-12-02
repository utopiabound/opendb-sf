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

/**
 * This set of functions is to enable global access to the database.  For the installer
 * they should use the Database class directly.
 * 
 */
include_once("lib/Database.class.php");
include_once("lib/databaseutils.php");
include_once("lib/config.php");

if(is_opendb_configured()) {
	$dbserver_conf_r = get_opendb_config_var('db_server');
	$OPENDB_DATABASE = new Database($dbserver_conf_r);
}

function is_db_connected() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->isConnected();
	} else {
		return FALSE;
	}
}

function db_ping() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->ping();
	} else {
		return FALSE;
	}
}

function db_close() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->close();
	} else {
		return FALSE;
	}
}

function db_errno() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->errno();
	} else {
		return FALSE;
	}
}

function db_error() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->error();
	} else {
		return FALSE;
	}
}

function db_query($sql) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->query($sql);
	} else {
		return FALSE;
	}
}

function db_affected_rows() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->affectedRows();
	} else {
		return FALSE;
	}
}

function db_insert_id() {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->insertId();
	} else {
		return FALSE;
	}
}

function db_free_result($result) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->freeResult($result);
	} else {
		return FALSE;
	}
}

function db_fetch_assoc($result) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->fetchAssoc($result);
	} else {
		return FALSE;
	}
}

function db_fetch_row($result) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->fetchRow($result);
	} else {
		return FALSE;
	}
}

function db_field_name($result, $field_offset) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->fieldName($result, $field_offset);
	} else {
		return FALSE;
	}
}

function db_num_rows($result) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->numRows($result);
	} else {
		return FALSE;
	}
}

function db_num_fields($result) {
	global $OPENDB_DATABASE;
	
	if (is_object($OPENDB_DATABASE)) {
		return $OPENDB_DATABASE->numFields($result);
	} else {
		return FALSE;
	}
}
?>