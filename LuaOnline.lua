local LuaOnline = {}
function LuaOnline.unload()
	
end
function LuaOnline.money()
	
	local playerPed = PLAYER.PLAYER_PED_ID();
	local player = PLAYER.GET_PLAYER_PED(playerPed)
	NETWORKCASH.NETWORK_EARN_FROM_ROCKSTAR(50000);
	NETWORKCASH.NETWORK_EARN_FROM_PICKUP(400000);
	NETWORKCASH.NETWORK_RECEIVE_PLAYER_JOBSHARE_CASH(1,900000);
	NETWORKCASH.NETWORK_EARN_FROM_BOUNTY(9999999,999999999,9999999,9999999999);
	NETWORKCASH.NETWORK_GIVE_PLAYER_JOBSHARE_CASH(1,8000000);
	print("Function is Working!")
end
function LuaOnline.money()


	print("Function is Working!")
end
function LuaOnline.adder()

	local playerPed = PLAYER.PLAYER_PED_ID()
	local veh = VEHICLE.CREATE_VEHICLE(model, coords.x, coords.y, coords.z, 0.0, false, true);	
	local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0);
	local model = GAMEPLAY.GET_HASH_KEY("Adder");
	if (STREAMING.IS_MODEL_IN_CDIMAGE(model) and STREAMING.IS_MODEL_A_VEHICLE(model)) then
		STREAMING.REQUEST_MODEL(model);
			while STREAMING.HAS_MODEL_LOADED(model) do
				VEHICLE.CREATE_VEHICLE(model, coords.x, coords.y, coords.z, 0.0, false, true);
				VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(veh);
				ENTITY.SET_ENTITY_HEADING(veh, ENTITY.GET_ENTITY_HEADING(playerPed));
				STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(model);
				ENTITY.SET_VEHICLE_AS_NO_LONGER_NEEDED(veh);
				end
			end
		end

	print("Spawned " + model + "!")
end


function LuaOnline.squad()
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

	print("Squad has arrived!")
end
function LuaOnline.init()
	
	LuaOnline.GUI = Libs["GUI"]

	LuaOnline.GUI.addButton("Money Test",LuaOnline.money,0,0.2,0.05,0.05)
	LuaOnline.GUI.addButton("Spawn Adder",LuaOnline.adder,0,0.2,0.05,0.05)
	LuaOnline.GUI.addButton("c",LuaOnline.kaboomb,0,0.2,0.05,0.05)
	LuaOnline.GUI.addButton("SQUADUP!",LuaOnline.squad,0,0.2,0.05,0.05)
	
end
function LuaOnline.tick()
	
LuaOnline.GUI.tick()
end

return LuaOnline