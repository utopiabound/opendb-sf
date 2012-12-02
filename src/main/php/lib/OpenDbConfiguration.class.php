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

// this is just being used to cache config, the db methods are not integrated, they will be
// called from the config.php file.
class OpenDbConfiguration {
	var $_configVars = array();
	
	function OpenDbConfiguration() {
	}
	
	function setGroup($groupid, $group_r) {
		if($group!=NULL && is_array($group_r)) {
			$this->_configVars = array_merge($this->_configVars,
					array($groupid=>$group_r));
		}
	}
	
	/**
	 Override a config variable for the current script execution only, this should be
	 used with a great deal of care, as no type checking is performed.
	 */
	function setGroupVar($groupid, $id, $value) {
		$this->checkGroupCache($group);
		
		$this->_configVars[$group][$id] = $value;
	}
	
	function getGroupVar($groupid, $id = NULL, $keyid = NULL) {
		$this->checkGroupCache($group);
		
		// override logging if no db, so can log db errors, notice no caching!
		if (!is_db_connected() && $group == 'logging') {
			if ($id == 'enable') {
				return TRUE;
			} else if ($id == 'file') {
				return 'log/usagelog.txt';
			} else {
				return NULL;
			}
		} else if($id!==NULL && $keyid!==NULL) {
			return $this->_configVars[$group][$id][$keyid];
		} else if($id!==NULL) {
			return $this->_configVars[$group][$id];
		} else {
			return $this->_configVars[$group]; // will return an array of all config items in group
		}
	}
	
	private function checkGroupCache($group) {
		if (is_db_connected()) {
			$group_r = $this->getDbConfigGroup($group);
			$this->setGroup($group, $group_r);
		}
	}
	
	function isDbConfigured() {
		return is_array($this->_configVars['db_server']);
	}
	
	private function getDbConfigGroup($group) {
		if(is_db_connected()) {
			$query = "SELECT cgiv.group_id, cgiv.id, scgi.type, cgiv.keyid, cgiv.value ".
					"FROM s_config_group_item_var cgiv, s_config_group_item scgi ".
					"WHERE cgiv.group_id = scgi.group_id AND ".
					"cgiv.id = scgi.id AND ".
					// will need to update these lines if we ever add any more array types.
			"(scgi.type = 'array' OR cgiv.keyid = scgi.keyid) AND ".
			"cgiv.group_id = '$group' ".
			"ORDER BY cgiv.id, cgiv.keyid";
	
			$results = db_query($query);
			if($results) {
				if(db_num_rows($results)>0) {
					$results_r = NULL;
					$tmp_vars_r = NULL;
					$current_id = NULL;
					$current_type = NULL;
	
					while($config_var_r = db_fetch_assoc($results)) {
						// first time through loop
						if($current_id == NULL) {
							$current_id = $config_var_r['id'];
							$current_type = $config_var_r['type'];
						} else if($current_id !== $config_var_r['id']) { // end of id, so process
							$results_r[$current_id] = $this->getDbConfigVar($current_type, $tmp_vars_r, $group, $id, $keyid);
	
							$current_id = $config_var_r['id'];
							$current_type = $config_var_r['type'];
	
							// reset
							$tmp_vars_r = NULL;
						}
	
						$tmp_vars_r[$config_var_r['keyid']] = $config_var_r['value'];
					}
					db_free_result($results);
	
					$results_r[$current_id] = $this->getDbConfigVar($current_type, $tmp_vars_r, $group, $id, $keyid);
	
					if($id!=NULL) {
						return $results_r[$current_id];
					} else { // else return whole group
						return $results_r;
					}
				}//if(db_num_rows($results)>0)
				else {
					return NULL;
				}
			}//if($results)
			else {
				// cannot log here - causes recursive loop
				//opendb_logger(OPENDB_LOG_ERROR, __FILE__, __FUNCTION__, db_error(), array($group, $id, $keyid));
				return NULL;
			}
		}//if(db_ping())
		else {
			return NULL;
		}
	}
	
	/**
		@param $type
		Can be one of the following types, and will effect how the
		$vars_r value is processed.
	
		array - keys will be numeric and in sequence only.
		boolean - TRUE or FALSE only
		text - arbritrary text
		textarea - arbritrary text
		number - enforce a numeric value
		datemask - enforce a date mask.
		usertype - Restrict to set of user types only.
		colour - RGB Hexadecimal colour value.
	*/
	private function getDbConfigVar($type, $vars_r, $group, $id, $keyid) {
		if(count($vars_r)>1) {
			if($type == 'boolean') {
				$boolean_vars_r = NULL;
				reset($vars_r);
				while(list($key,$value) = each($vars_r)) {
					if($value == 'TRUE') {
						$boolean_vars_r[$key] = TRUE;
					} else { //if($value == 'FALSE')
						$boolean_vars_r[$key] = FALSE;
					}
				}
	
				return $boolean_vars_r;
			} else {
				return $vars_r;
			}
		} else {
			if($type == 'array') {
				return $vars_r;
			} else {
				reset($vars_r);
				if(list($key,$value) = each($vars_r)) {
					if($type == 'boolean') {
						if($value == 'TRUE') {
							return TRUE;
						} else { //if($value == 'FALSE')
							return FALSE;
						}
					} else {
						// if keyid specified, or key is numeric, then return simple
						// value, otherwise be helpful and return single element array.
						if($keyid!=NULL || is_numeric($key)) {
							return $value;
						} else {
							return $vars_r;
						}
					}
				}
					
				//else
				if($type == 'boolean') {
					return FALSE;
				} else {
					return NULL;
				}
			}
		}
	}
}