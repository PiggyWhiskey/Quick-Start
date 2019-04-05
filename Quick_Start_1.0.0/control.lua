
script.on_event(defines.events.on_player_created, function(event)

	--game.players[event.player_index].color = {r = 0, g = 0, b = 1, a = .7};  -- change player color to blue	

	local player = game.players[event.player_index]
	
	--Clear Inventory (This includes the pistol)		
	player.clear_items_inside()

	-- materials
	player.insert{name="iron-plate", count=600} -- 8 extra are added by freeplay scenario starting items
	player.insert{name="copper-plate", count=400}
	player.insert{name="electronic-circuit", count=200}
	player.insert{name="iron-gear-wheel", count=200}
	player.insert{name="underground-belt", count=50}
	player.insert{name="splitter", count=50}
	player.insert{name="small-electric-pole", count=148} -- 48 required for furnace setup, 100 extra == 148
	
	-- logistics
	player.insert{name="assembling-machine-1", count=20}
	player.insert{name="long-handed-inserter", count=50}		
	player.insert{name="blueprint", count=1}
	player.insert{name="deconstruction-planner", count=1}
	player.insert{name="steel-chest", count=50}
	player.insert{name="inserter", count=270} -- 2 inserters per stone furnace, 96 stone furnaces to start with in 4 layouts of 2x12 = 4*2*2*12 == 192 + 28 for boilers + 50 spare
	player.insert{name="transport-belt", count=800}
	
	-- smelting/mining
	player.insert{name="electric-mining-drill", count=36} -- 13 for iron, 13 for copper, 2 for stone, 8 for coal == 36
	player.insert{name="stone-furnace", count=96} -- two setups of 4x12 == 96
	
	-- power
	--1x Power Chain
	player.insert{name="offshore-pump", count=1}	
	player.insert{name="boiler", count=20}
	player.insert{name="steam-engine", count=40}
	player.insert{name="coal", count=1000} -- 50 coal per boiler
	player.insert{name="pipe-to-ground", count=50}
	player.insert{name="pipe", count=50}
	
	-- car
	player.insert{name="car", count=1}
	player.insert{name="coal", count=200} -- coal for car
	
	--weapons
	player.insert{name="submachine-gun", count=1}
	player.insert{name="firearm-magazine", count=200}
	
	-- armor
	player.insert{name="power-armor", count = 1}
		local p_armor = player.get_inventory(5)[1].grid
		p_armor.put({name = "fusion-reactor-equipment"})
		p_armor.put({name = "personal-roboport-equipment"})
		p_armor.put({name = "personal-roboport-equipment"})
		p_armor.put({name = "personal-roboport-equipment"})
		p_armor.put({name = "personal-roboport-equipment"})
		p_armor.put({name = "personal-roboport-equipment"})			  
		p_armor.put({name = "battery-mk2-equipment"})			  
		p_armor.put({name = "battery-mk2-equipment"})			  
		p_armor.put({name = "battery-mk2-equipment"})
	player.insert{name="construction-robot", count = 50}
	
	-- science
	player.insert{name="lab", count=10}
	player.insert{name="automation-science-pack", count=50}	
end)


-- then we establish a new inventory if player should respawn
script.on_event(defines.events.on_player_respawned, function(event)
	local player = game.players[event.player_index]

	-- car
		player.insert{name="car", count=1}
		player.insert{name="coal", count=200} -- coal for car
	
	-- armor
		player.insert{name="power-armor", count = 1}
			 local p_armor = player.get_inventory(5)[1].grid
			  p_armor.put({name = "fusion-reactor-equipment"})
			  p_armor.put({name = "personal-roboport-equipment"})
			  p_armor.put({name = "personal-roboport-equipment"})
			  p_armor.put({name = "personal-roboport-equipment"})
			  p_armor.put({name = "personal-roboport-equipment"})
			  p_armor.put({name = "personal-roboport-equipment"})			  
			  p_armor.put({name = "battery-mk2-equipment"})			  
			  p_armor.put({name = "battery-mk2-equipment"})			  
			  p_armor.put({name = "battery-mk2-equipment"})
		player.insert{name="construction-robot", count = 50}

	--weapon and ammo.
	--but not much ammo. Try not to die
	player.insert{name="submachine-gun", count=1}
	player.insert{name="firearm-magazine", count=20}
end)