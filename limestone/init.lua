--[[

Minetest-c55 limestone mod

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

minetest.register_node( "limestone:block", {
	description = "Limestone",
	tile_images = { "limestone_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "limestone:block_desert", {
	description = "Limestone",
	tile_images = { "limestone_block_desert.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "limestone:mineral_stone", {
	description = "Lime",
	tile_images = { "default_stone.png^limestone_mineral.png" },
	is_ground_content = true,
	groups = {cracky=3},
	drop = {
		max_items = 1,
		items = {
			{items = {'limestone:lime 2'},rarity = 15,},
			{items = {'limestone:lime 1'},}
			}
		},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "limestone:mineral_desert_stone", {
	description = "Lime",
	tile_images = { "default_desert_stone.png^limestone_mineral.png" },
	is_ground_content = true,
	groups = {cracky=3},
	drop = {
		max_items = 1,
		items = {
			{items = {'limestone:lime 2'},rarity = 15,},
			{items = {'limestone:lime 1'},}
			}
		},
	sounds = default.node_sound_stone_defaults(),
})

--------------------
-- Crafting
--------------------

minetest.register_craftitem("limestone:lime", {
	description = "Lime",
	inventory_image = "limestone_lime.png",
})


minetest.register_craft({
  output = 'limestone:block',
  recipe = {
    {'default:sand', 'default:sand'},
    {'limestone:lime', 'limestone:lime'},
    }
})

minetest.register_craft({
  output = 'limestone:block_desert',
  recipe = {
    {'default:desert_sand', 'default:desert_sand'},
    {'limestone:lime', 'limestone:lime'},
    }
})
	
--------------------
-- Block generation
--------------------

local function generate_block(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
  if maxp.y < height_min or minp.y > height_max then
    return
  end
  
  local y_min = math.max(minp.y, height_min)
  local y_max = math.min(maxp.y, height_max)
  local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
  local pr = PseudoRandom(seed)
  local num_chunks = math.floor(chunks_per_volume * volume)
  local chunk_size = 3
  if ore_per_chunk <= 4 then
    chunk_size = 2
  end
  
  local inverse_chance = math.floor(chunk_size * chunk_size * chunk_size / ore_per_chunk)
  
  for i = 1, num_chunks do
    if (y_max - chunk_size + 1 <= y_min) then
      return
    end
    
    local y0 = pr:next(y_min, y_max - chunk_size + 1)
    
    if y0 >= height_min and y0 <= height_max then
      local x0 = pr:next(minp.x, maxp.x - chunk_size + 1)
      local z0 = pr:next(minp.z, maxp.z - chunk_size + 1)
      local p0 = {x = x0, y = y0, z = z0}
      
      for x1 = 0, chunk_size - 1 do
	for y1 = 0, chunk_size - 1 do
	  for z1 = 0, chunk_size - 1 do
	    if pr:next(1, inverse_chance) == 1 then
	      local x2 = x0 + x1
              local y2 = y0 + y1	
	      local z2 = z0 + z1
	      local p2 = {x = x2, y = y2, z = z2}
	      
	      if minetest.env:get_node(p2).name == wherein then
		minetest.env:set_node(p2, {name = name})
	      end
	    end
	  end
	end
      end
    end
  end
end

-------------------------------
-- minetest callback
-------------------------------

minetest.register_on_generated(function(minp, maxp, seed)
  generate_block("limestone:block", "default:sand", minp, maxp, seed + 1, 1/8/8/8, 27, -31000, 31000)
  generate_block("limestone:block_desert", "default:desert_sand", minp, maxp, seed + 2, 1/8/8/8, 27, -31000, 31000)
  generate_block("limestone:mineral_stone", "default:stone", minp, maxp, seed + 3, 1/8/8/8, 27, -100, 31000)
  generate_block("limestone:mineral_desert_stone", "default:desert_stone", minp, maxp, seed + 4, 1/8/8/8, 27, -100, 31000)
end)
