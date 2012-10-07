--[[

Minetest-c55 concrete mod

Copyright (C) 2012 Free Software Foundation

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
USA.

--]]

--------------------
-- Blocks
--------------------

minetest.register_node("concrete:block", {
	description = "Concrete Block",
	tile_images = {"concrete_block.png"},
	drawtype = "normal",
	paramtype = "light",
	groups = {cracky=2},
})


--------------------
-- Crafting
--------------------
	
minetest.register_craft({
	output = '"concrete:block" 10',
	recipe = {
		{'default:sand', 'default:sand', 'cement:cement'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:gravel', 'default:gravel', 'default:gravel'},
	}
})
	
minetest.register_craft({
	output = '"concrete:block" 10',
	recipe = {
		{'default:desert_sand', 'default:desert_sand', 'cement:cement'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:gravel', 'default:gravel', 'default:gravel'},
	}
})
	