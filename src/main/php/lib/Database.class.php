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

if(extension_loaded('mysqli')) {
	include_once('lib/database/mysqli.inc.php');
} else if(extension_loaded('mysql')) {
	include_once('lib/database/mysql.inc.php');
} else {
	die('MySQL extension is not available');
}
	
include_once("lib/databaseutils.php");
include_once("lib/logging.php");

class Database {
	var $_dblink;
	var $_dbconfig;
	
	function Database($dbserver_conf_r) {
		if(is_array($dbserver_conf_r)) {
			$this->_dbconfig = $dbserver_conf_r;
			
			$link = db_connect(
					$dbserver_conf_r['host'],
					$dbserver_conf_r['username'],
					$dbserver_conf_r['passwd'],
					$dbserver_conf_r['dbname']);
		
			if ($link !== FALSE) {
				$this->_dblink = $link;
			} else {
				// opendb logger relies on the opendb config to return valid config for logging even if
				// no db connection!
				opendb_logger(OPENDB_LOG_ERROR, __FILE__, __FUNCTION__, db_error());
			}
		}
	}
	
	function isConnected() {
		return $this->_dblink != NULL;
	}
	
	function ping() {
		return _db_ping($this->_dblink);
	}
	
	function close() {
		_db_close($this->_dblink);
	}
	
	function errno() {
		return _db_errno($this->_dblink);
	}
	
	function error() {
		return _db_error($this->_dblink);
	}
	
	function query($sql) {
		// expand any prefixes, display any debugging, etc
		if(strlen($this->_dbconfig['table_prefix'])>0) {
			$sql = parse_sql_statement($sql, $this->_dbconfig['table_prefix']);
		}
		
		if($this->_dbconfig['debug-sql'] === TRUE) {
			echo('<p class="debug-sql">SQL: '.$sql.'</p>');
		}
		
		return _db_query($this->_dblink, $sql);
	}
	
	function affectedRows() {
		return _db_affected_rows($this->_dblink);
	}
	
	function insertId() {
		return _db_insert_id($this->_dblink);
	}
	
	function freeResult($result) {
		return _db_free_result($result);
	}
	
	function fetchAssoc($result) {
		return _db_fetch_assoc($result);
	}
	
	function fetchRow($result) {
		return _db_fetch_row($result);
	}
	
	function fieldName($result, $field_offset) {
		return _db_field_name($result, $field_offset);
	}
	
	function numRows($result) {
		return _db_num_rows($result);
	}
	
	function numFields($result) {
		return _db_num_fields($result);
	}
}