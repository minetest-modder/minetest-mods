--[[

Minetest-c55 cement mod

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
-- Craft Item
--------------------

minetest.register_craftitem("cement:cement", {
  description = "Cement",
  inventory_image = "cement_powder.png",
})
	
--------------------
-- Craft Recipes
--------------------
	
----------------
-- Make cement
---------------

minetest.register_craft({
  output = '"cement:cement" 4',
  recipe = {
    {'limestone:lime', 'limestone:lime'},
    {'default:sand', 'default:clay'},
    }
})

----------------
-- Make cement
---------------

minetest.register_craft({
  output = '"cement:cement" 4',
  recipe = {
    {'limestone:lime', 'limestone:lime'},
    {'default:desert_sand', 'default:clay'},
    }
})
	
-------------------------
-- Make clay from dirt
-------------------------

minetest.register_craft({
  output = '"default:clay" 1',
  recipe = {
    {'default:dirt', 'default:dirt'},
    {'default:dirt', 'default:dirt'},
    }
})
	
-------------------------
-- Make clay from dirt with grass
-------------------------
	
minetest.register_craft({
  output = '"default:clay" 1',
  recipe = {
    {'default:dirt_with_grass', 'default:dirt_with_grass'},
    {'default:dirt_with_grass', 'default:dirt_with_grass'},
    }
})
	
	