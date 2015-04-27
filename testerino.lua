local testerino = {}

function testerino.tick()
	local playerPed = PLAYER.PLAYER_PED_ID()
	local player = PLAYER.GET_PLAYER_PED(playerPed)
	local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed)
	if(PLAYER.IS_PLAYER_ONLINE() and playerExists) then
		if(get_key_pressed(114)) then
			local playerPed = PLAYER.PLAYER_PED_ID();
			local player = PLAYER.GET_PLAYER_PED(playerPed)
			local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0);
			local clone = PED.CREATE_RANDOM_PED(coords.x, coords.y, coords.z);
			local group = PLAYER.GET_PLAYER_GROUP(PLAYER.PLAYER_ID());
			local playerVehicle = PLAYER.GET_PLAYERS_LAST_VEHICLE();
			PED.SET_PED_AS_GROUP_MEMBER(clone, group);
			AI.TASK_COMBAT_HATED_TARGETS_AROUND_PED(clone, 5000, 0);
			PED.SET_PED_KEEP_TASK(clone, true);
			PED.ADD_ARMOUR_TO_PED(clone, 100);
			WEAPON.GIVE_DELAYED_WEAPON_TO_PED(clone, GAMEPLAY.GET_HASH_KEY("weapon_pistol"), 5, true);
			ENTITY.SET_ENTITY_INVINCIBLE(clone, false);
		end
		if(get_key_pressed(115)) then

			local playerID = PLAYER.PLAYER_ID();
			PLAYER.SET_PLAYER_MAY_ONLY_ENTER_THIS_VEHICLE(playerID,1);
			WEAPON.ENABLE_LASER_SIGHT_RENDERING(true);
			GRAPHICS.SET_DEBUG_LINES_AND_SPHERES_DRAWING_ACTIVE(1);
		end		
		
		end		
		if(get_key_pressed(112)) then
			local playerPed = PLAYER.PLAYER_PED_ID();
			local playerVehicle = PLAYER.GET_PLAYERS_LAST_VEHICLE();
			VEHICLE.IS_VEHICLE_VISIBLE(1);
			VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(playerVehicle,false);
			OBJECT.CREATE_MONEY_PICKUPS(coords.x, coords.y, coords.z, coords.x, coords.y, coords.z);
				
		end		

		
		
		
	end
end

return testmodule