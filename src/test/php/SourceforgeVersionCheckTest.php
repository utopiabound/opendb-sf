<?php
/* 	
 	Open Media Collectors Database
	Copyright (C) 2001,2006 by Jason Pell

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

include_once("lib/SourceforgeVersionCheck.class.php");

class SourceforgeVersionCheckTest extends PHPUnit_Framework_TestCase {
	function testVersionParse() {
		$checker = new SourceforgeVersionCheck('test-classes/LatestRelease.sf.net.html');
		$this->assertEquals('1.0.4pl1', $checker->getVersion());
	}
	
	function testIsUpdatedVersionNotUpdated() {
		$checker = new SourceforgeVersionCheck('test-classes/LatestRelease.sf.net.html');
		$this->assertFalse($checker->isUpdatedVersion('1.0.4pl1'));
		$this->assertFalse($checker->isUpdatedVersion('1.1'));
	}
	
	function testIsUpdatedVersionUpdated() {
		$checker = new SourceforgeVersionCheck('test-classes/LatestRelease.sf.net.html');
		$this->assertTrue($checker->isUpdatedVersion('1.0.4'));
		$this->assertTrue($checker->isUpdatedVersion('1.0.0'));
	}	
}
