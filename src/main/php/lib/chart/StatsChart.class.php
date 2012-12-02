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

class StatsChart
{
	var $chartType;
	var $graphCfg;
	
	var $width;
	var $height;
	var $transparent;
	
	function StatsChart($chartType, $graphCfg) {
		$this->chartType = $chartType;
		$this->imgType = $imgType;
		
		$this->height = $graphCfg['height'];
		$this->width = $graphCfg['width'];
		if(!is_numeric($this->height) && !is_numeric($this->width)) {
			$this->width = 550;
			$this->height = 275;
		}
		
		if($graphCfg['background'] == 'transparent') {
			$this->transparent = TRUE;
		} else {
			$this->transparent = FALSE;
		}
		$this->graphCfg = $graphCfg;
	}
	
	function addData($display, $value) {
	}
	
	function setTitle($title) {
	}

	function render($imgType) {
	}
}
?>