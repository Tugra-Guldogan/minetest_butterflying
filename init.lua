

butterflying = {
	flies = {
		"butterflies:butterfly_white",
		"butterflies:butterfly_red",
		"butterflies:butterfly_violet",
	}
}


-- function butterflying.register_fly(name)
-- 	table.insert(butterflying.flies, name)
-- end


minetest.register_abm({
	nodenames = {"group:flower"},
	interval  = 30,
	chance = 120,
	action = function(pos, node)
		pos.y = pos.y + 1
		local n = minetest.get_node(pos)
		if n.name == "air" then
			minetest.set_node(pos, {name=butterflying.flies[math.random(#butterflying.flies)]})
		end
	end,
})


minetest.register_abm({
	nodenames = butterflying.flies,
	interval = 10,
	chance = 10,
	action = function(pos, node)
		local h = math.floor(math.random() * 1.98)
		
		local airs = minetest.find_nodes_in_area(
			{x=pos.x-1, y=pos.y-1, z=pos.z-1},
			{x=pos.x+1, y=pos.y+h, z=pos.z+1},
			{"air"}
		)
		
		if #airs == 0 then
			return
		end
		
		local to = airs[math.random(#airs)]
		
		minetest.swap_node(to, node)
		minetest.set_node(pos, {name="air"})
		
	end,
})









minetest.register_abm({
	nodenames = {
		"default:junglegrass",
		"default:grass_5",
		"default:fern_3",
	},
	interval = 45,
	chance = 320,
	action = function(pos, node)
		pos.y = pos.y + 1
		local n = minetest.get_node(pos)
		if n.name == "air" then
			minetest.set_node(pos, {name="fireflies:firefly"})
		end
	end,
})

minetest.register_abm({
	nodenames = "fireflies:firefly",
	interval = 10,
	chance = 10,
	action = function(pos, node)
		local h = math.floor(math.random() * 1.5)
		
		local airs = minetest.find_nodes_in_area(
			{x=pos.x-1, y=pos.y-1, z=pos.z-1},
			{x=pos.x+1, y=pos.y+h, z=pos.z+1},
			{"air"}
		)
		
		if #airs == 0 then
			return
		end
		
		local to = airs[math.random(#airs)]
		
		minetest.swap_node(to, node)
		minetest.set_node(pos, {name="air"})
		
	end,
})


