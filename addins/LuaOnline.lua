--http://www.dev-c.com/nativedb/ best site on the planet
--VEHICLE.SMASH_VEHICLE_WINDOW(Any p0, Any p1)
--VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(Any p0, Any p1)
--VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(Any p0, Any p1, Any p2)
--VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_TEAM(Any p0, Any p1, Any p2)
--VEHICLE.EXPLODE_VEHICLE(Any p0, Any p1, Any p2) // 0xBEDEACEB
--VEHICLE.SET_VEHICLE_DOORS_LOCKED(Any p0, Any p1) // 0x4CDD35D0
--TODO ABOVE:

local LuaOnline = {}
function LuaOnline.unload()
	
end
function LuaOnline.money()
	local playerPed = PLAYER.PLAYER_ID();
	local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 0.0, 0.0);
	local objectID = GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_PAPER_BAG");
	local Obj = OBJECT.CREATE_PICKUP(objectID,coords.x, coords.y, coords.z,0,2000,true, 0);

	
	--local objectID = GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_WALLET")
	--local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0);
	--local Obj = OBJECT.CREATE_PICKUP(objectID,coords.x, coords.y, coords.z,0,9999,true, 0);

	
	
	--OBJECT.CREATE_PICKUP(objectID,coords.x, coords.y, coords.z,2000,-1,true, 0);
    --CREATE_MONEY_PICKUPS(coords.x, coords.y, coords.z, 133333337, 0, 0); 
	--local player = PLAYER.GET_PLAYER_PED(playerPed)
	--NETWORKCASH.NETWORK_EARN_FROM_ROCKSTAR(50000);
	--NETWORKCASH.NETWORK_EARN_FROM_PICKUP(400000);
	--NETWORKCASH.NETWORK_RECEIVE_PLAYER_JOBSHARE_CASH(playerPed,900000);
	--NETWORKCASH.NETWORK_EARN_FROM_BOUNTY(playerPed,999999999,9999999,9999999999);
		print("Money Spawned!")
end
function LuaOnline.Nothing()
	local playerID = PLAYER.PLAYER_ID();
	print(PLAYER.PLAYER_ID())
	print(PLAYER.GET_PLAYER_WANTED_LEVEL(PLAYER.PLAYER_ID()))
	print(NETWORK.NETWORK_GET_PLAYER_FROM_GAMER_HANDLE(PLAYER.PLAYER_ID()))
end
function LuaOnline.RestoreModel()
	wait(100)
	local playerPed = PLAYER.PLAYER_PED_ID()
	local tester = PLAYER.PLAYER_ID()
	local player = PLAYER.GET_PLAYER_PED(playerPed)
	local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed)
		PLAYER.SET_PLAYER_MODEL(tester, player)
	print("Restored Model!")
end


function LuaOnline.ChangeModel()
		local playerPed = PLAYER.PLAYER_ID()
		local SWATskinID = GAMEPLAY.GET_HASH_KEY("s_m_y_swat_01")
		PLAYER.SET_PLAYER_MODEL(20, SWATskinID)
        STREAMING.REQUEST_MODEL(SWATskinID)
        print("Changed Model!")
end
function LuaOnline.adder()
	local playerPed = PLAYER.PLAYER_ID()
	local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0);
	local veh = VEHICLE.CREATE_VEHICLE(model, coords.x, coords.y, coords.z, 0.0, false, true);	
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
	PED.ADD_ARMOUR_TO_PED(clone, 300);
	WEAPON.GIVE_DELAYED_WEAPON_TO_PED(clone, GAMEPLAY.GET_HASH_KEY("weapon_rpg"), 5, true); 
	--WEAPON.GIVE_DELAYED_WEAPON_TO_PED(clone, GAMEPLAY.GET_HASH_KEY("weapon_smg"), 5, true); 
	WEAPON.GIVE_DELAYED_WEAPON_TO_PED(clone, GAMEPLAY.GET_HASH_KEY("Parachute_Main"), 5, true);	
	ENTITY.SET_ENTITY_INVINCIBLE(clone, false);
	print("Squad has arrived!")
end

function LuaOnline.NotACheater()
local notacheater = NETWORK.NETWORK_PLAYER_IS_CHEATER();
	if(notacheater) then
	return false
	end
	NETWORK.NETWORK_IS_PLAYER_ACTIVE(100);
	PLAYER.IS_PLAYER_PLAYING(100);
end

function LuaOnline.NoWanted();
PLAYER.SET_MAX_WANTED_LEVEL(0);
end

function LuaOnline.LittleTeapotPagent();
PLAYER.SET_MAX_WANTED_LEVEL(5);
end


function LuaOnline.SPEEDBOOST()
local playerPed = PLAYER.PLAYER_PED_ID();
local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0);
local exploitvehicle = VEHICLE.GET_CLOSEST_VEHICLE(coords.x, coords.y, coords.z, 5.0, 0, 70);
local savedexplotvehicvalue = exploitvehicle;
local tempvaluecar = savedexplotvehicvalue;
local savedvalue =  PLAYER.GET_PLAYERS_LAST_VEHICLE();
if(savedvalue<0) then 
	savedexplotvehicvalue = savedvalue;
end
VEHICLE.SET_VEHICLE_FIXED(savedvalue);
VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(savedvalue);
VEHICLE.SET_VEHICLE_FORWARD_SPEED(savedvalue,50);
print(savedvalue)
print("Speed BOOOSTO!")
end

function LuaOnline.UnlockAndExploitCars();
local playerPed = PLAYER.PLAYER_ID();
local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0);
local exploitvehicle = VEHICLE.GET_CLOSEST_VEHICLE(coords.x, coords.y, coords.z, 5.0, 0, 70);
VEHICLE.SET_PLAYERS_LAST_VEHICLE(exploitvehicle);
VEHICLE.SET_VEHICLE_FIXED(exploitvehicle);
VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(exploitvehicle,false);
VEHICLE.SET_VEHICLE_UNDRIVEABLE(exploitvehicle,false);
--VEHICLE.SET_VEHICLE_DOOR_LOCK_STATUS(exploitvehicle,1);
VEHICLE.IS_VEHICLE_DOOR_FULLY_OPEN(exploitvehicle,1);
VEHICLE.SET_VEHICLE_DIRT_LEVEL(exploitvehicle,0.1);
VEHICLE.SET_VEHICLE_HAS_BEEN_OWNED_BY_PLAYER(exploitvehicle,false);
VEHICLE.SET_VEHICLE_GRAVITY(exploitvehicle,true);
VEHICLE.SET_VEHICLE_CAN_BREAK(exploitvehicle,true);
VEHICLE.SET_VEHICLE_DOOR_SHUT(exploitvehicle,0,true);
print(exploitvehicle)
print(VEHICLE.IS_BIG_VEHICLE(exploitvehicle))
print(VEHICLE.IS_VEHICLE_VISIBLE(exploitvehicle))
print(VEHICLE.GET_VEHICLE_DOOR_LOCK_STATUS(exploitvehicle))
VEHICLE.SET_VEHICLE_COLOUR_COMBINATION(exploitvehicle,2)
print(VEHICLE.GET_VEHICLE_COLOUR_COMBINATION(exploitvehicle))
VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(playerPed,exploitvehicle,false);
print(VEHICLE.GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(exploitvehicle,1))
end

function LuaOnline.init()
	
	LuaOnline.GUI = Libs["GUI"]
	

	LuaOnline.GUI.addButton("Unlock Vehicles",LuaOnline.UnlockAndExploitCars,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("Speed Boost",LuaOnline.SPEEDBOOST,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("Money Test",LuaOnline.money,0,0.2,0.04,0.04)
	
	--LuaOnline.GUI.addButton("Spawn Adder",LuaOnline.adder,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("Nothing",LuaOnline.Nothing,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("SQUADUP!",LuaOnline.squad,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("Remove Wanted!",LuaOnline.NoWanted,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("Become 5 Star!",LuaOnline.LittleTeapotPagent,0,0.2,0.04,0.04)
	--LuaOnline.GUI.addButton("AntiAFK",LuaOnline.AntiAFK,1,0.2,0.04,0.04)
	--LuaOnline.GUI.addButton("Restore Model!",LuaOnline.RestoreModel,0,0.2,0.04,0.04)
	LuaOnline.GUI.addButton("Change Model!",LuaOnline.ChangeModel,0,0.2,0.04,0.04)
	--LuaOnline.GUI.addButton("Swat!",LuaOnline.Tester,0,0.2,0.04,0.04) Doesn't Work
	
end
function LuaOnline.tick()
LuaOnline.GUI.tick()
LuaOnline.NotACheater();
end

return LuaOnline