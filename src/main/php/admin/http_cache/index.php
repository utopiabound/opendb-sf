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

if(!defined('OPENDB_ADMIN_TOOLS'))
{
	die('Admin tools not accessible directly');
}

include_once("lib/datetime.php");
include_once("lib/filecache.php");
include_once("lib/listutils.php");
include_once("lib/HTML_Listing.class.inc");

@set_time_limit(600);

$HTTP_VARS['cache_type'] = 'HTTP';
		
if($HTTP_VARS['op'] == 'flush')
{
	if($HTTP_VARS['confirmed'] == 'true')
	{
		$files_deleted = file_cache_delete_files($HTTP_VARS['cache_type']);
		if($files_deleted > 0)
			$success[] = 'Deleted '.$files_deleted.' cache files';
		
		$HTTP_VARS['op'] = '';
	}
	else if($HTTP_VARS['confirmed'] != 'false')
	{
		echo("\n<h3>Delete All Cache files</h3>");
		echo(get_op_confirm_form($PHP_SELF, 
				"Are you sure you want to delete all cache files?", 
				array('type'=>$ADMIN_TYPE, 'op'=>'flush')));
	}
	else
	{
		$HTTP_VARS['op'] = '';
	}
}
else if($HTTP_VARS['op'] == 'flushexpired')
{
	$files_deleted = file_cache_delete_files($HTTP_VARS['cache_type'], EXPIRED_ONLY);
	if($files_deleted > 0)
		$success[] = 'Deleted '.$files_deleted.' cache files';
		
	$HTTP_VARS['op'] = '';
}

if(strlen($HTTP_VARS['op'])==0)
{
	if(is_not_empty_array($success))
		echo format_error_block($success, 'information');
	
	echo("<p>[<a href=\"admin.php?type=$ADMIN_TYPE&op=flushexpired\">Delete expired cache entries</a>] "
			."[<a href=\"admin.php?type=$ADMIN_TYPE&op=flush\">Delete all cache entries</a>]</p>");
	
	if(strlen($HTTP_VARS['order_by'])==0)
		$HTTP_VARS['order_by'] = 'cache_date';
		
	$listingObject = new HTML_Listing($PHP_SELF, $HTTP_VARS);
	$listingObject->setNoRowsMessage(get_opendb_lang_var('no_items_found'));
	
	$listingObject->startListing();
	
	$listingObject->addHeaderColumn('URL', 'url');
	$listingObject->addHeaderColumn('Cached', 'cache_date');
	$listingObject->addHeaderColumn('Expires', 'expire_date');

	if(is_numeric($listingObject->getItemsPerPage()))
	{		
		$listingObject->setTotalItems(fetch_file_cache_cnt($HTTP_VARS['cache_type']));
	}
	
	$results = fetch_file_cache_rs(
				$HTTP_VARS['cache_type'],
				$listingObject->getCurrentOrderBy(), 
				$listingObject->getCurrentSortOrder(), 
				$listingObject->getStartIndex(),
				$listingObject->getItemsPerPage());
	if($results)
	{
		while($file_cache_r = db_fetch_assoc($results))
		{
			$listingObject->startRow();
			if(file_cache_get_cache_file($file_cache_r))
			{
				$popupUrl = "url.php?id=".$file_cache_r['sequence_number'];
				
				$listingObject->addColumn(
					"<a href=\"".$file_cache_r['url']."\" onclick=\"popup('$popupUrl'); return false;\" target=\"_new\">".
					get_overflow_tooltip_column($file_cache_r['url'], 100).
					"</a>");
			}
			else
			{
				$listingObject->addColumn(get_overflow_tooltip_column($file_cache_r['url'], 100));
			}
			
			$listingObject->addColumn(get_localised_timestamp(get_opendb_config_var('http', 'datetime_mask'), $file_cache_r['cache_date']));
			
			$column = '';
			if($file_cache_r['expired_ind']=='Y')
			{
				$column .= "<span class=\"error\">";
			}
			
			if($file_cache_r['expire_date']!=NULL)
			{
				$column .= get_localised_timestamp(get_opendb_config_var('http', 'datetime_mask'), $file_cache_r['expire_date']);
			}
			else
			{
				$column .= "NA";
			}

			if($file_cache_r['expired_ind']=='Y')
			{
				$column .= "</span>";
			}	
			$listingObject->addColumn($column);
			
			$listingObject->endRow();
		}//while
		db_free_result($results);
	}
	
	$listingObject->endListing();
	unset($listingObject);
}
?>