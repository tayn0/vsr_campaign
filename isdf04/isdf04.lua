--[[


Event Scripting: 
Ported to LUA: 
Date: 7-11-2021
Description: Campagin mission  ported to LUA
References:
1. https:--steamcommunity.com-sharedfiles-filedetails-?id=1488402495
2. https:www.lua.org-docs.html
]] --
local Mission = {
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
--  bools
	ON_HOLD = false,
	emit_on = false,
	goo = false,
	tug1_move = false,
	tug2_move = false,
	tug1_board = false,
	tug2_board = false,
	tugs_board = false,
	tug1_in = false,
	tugs_in = false,
	drop_takeoff = false,
	shab_message1 = false,
	shab_ship_check = false,
	shab_to_ship = false,
	shab_at_ship = false,
	suspend_death = false,
	shab_at_ship = false,
	shab_ship_gone = false,
	shab_dead = false,
	shab_in = false,
	player_on_foot = true,
	player_in_ship = false,
	player_in_enemy = false,
	game_over = false,
	recycler_move = false,
	recycle_deploy = false,
	start_building = false,
	scav1_spawn = false,
	shab_message2 = false,
	shab_message3 = false,
	shab_message4 = false,
	scav_check1 = false,
	wingman1_spawn = false,
	wingman1_spawn = false,
	wingman1_set = false,
	turret_start = false,
	turret1_spawn = false,
	turret_set = false,
	turret1_at_john = false,
	wingman2_build = false,
	cheat_wingman2 = false,
	wingman2_set = false,
	manson_set = false,
	shab_reply1 = false,
	all_at_center = false,
	shab_there = false,
	player_there = false,
	manson_message1 = false,
	shab_message5 = false,
	john_on_way = false,
	wingman1_forgot = false,
	wingman2_forgot = false,
	shab_message6 = false,
	manson_message2 = false,
	convoy_spawn = false,
	at_nav1 = false,
	haulers_underway = false,
	hauler1_ready = false,
	hauler2_ready = false,
	ship_sniped = false,
	manson_message3 = false,
	manson_message4 = false,
	manson_message5 = false,
	ships_defend = false,
	ships_dead = false,
	abandoned = false,
	tug_at_ship = false,
	chase_spawn = false,
	chase_message = false,
	new_orders = false,
	start_done = false,
	start_end_show = false,
	haulers_board = false,
	jammer_dead = false,
	manson_message6 = false,
	all_scions_dead = false,
	haulers_on = false,
	tug_drop_takeoff = false,
	scav1_a = false,
	scav2_a = false,
	turret1_a = false,
	turret2_a = false,
	wingman1_a = false,
	wingman2_a = false,
	assign_scav1 = false,
	recycler_response = false,
	scavdeploy_message = false,
	assign_turret1 = false,
	stop_shab = false,
	assign_wingman1 = false,
	in_combat = false,
	turret3_a = false,
	turret4_a = false,
	turret5_a = false,
	spawn_1 = false,
	first_dead = false,
	wave1_warning = false,
	turret1_scavcheck = false, 
	tur1_near_scav = false,
	turret2_scavcheck = false, 
	tur2_near_scav = false,
	turret3_scavcheck = false, 
	tur3_near_scav = false,
	turret4_scavcheck = false,
	tur4_near_scav = false,
	turret5_scavcheck = false,
	tur5_near_scav = false,
	load_plan3 = false,
	plan3_loaded = false,
	shab_away = false,
	set_plan1 = false,
	remove_shab = false,
	deployscav_a = false,
	recy_building = false,
	manson_move = false,
	tell_shab_deploy = false,
	shab_ok = false,
	recycler_comment = false,
	send_shab_away = false,
	shab_protest = false,
	brad_insist = false,
	last_wave_dead = false,
	gun_picked = false,
	get_to_armo = false,
	shepards_message = false,
	gun_warning = false,
	john_at_bunk = false,
	john_bunker_warn = false,
	state_mission = false,
	to_escape = false,
	convoy_hold = false,
	final_retreat = false,
	manson_chase = false,
	end_escape = false,
	brad_complain = false,
	start_movie = false,
	not_there = false,
	remove_manson = false,
	off_object = false,
	major_wave = false,
	building_stopped = true,
	second_dead = false,
	third_spawn = false,
	third_dead = false,
	tag1 = false,
	tag2 = false,
	tag3 = false,
	tag4 = false,
	tag5 = false,
	tug_pickup = false,
	tug_move = false,
	remove_drop1 = false,
	remove_drop2 = false,
	close_doors = false,
	takeoff_recy_drop = false,
	recy_wait = false,
	remove_recy_drop = false,
	new_look1 = false,
	new_look2 = false,
	shab_go_away = false,
	turret_test = false,
	fodder_attack = false,
	major_attack = false,
	major1_attack = false,
	major2_attack = false,
	set_for_main = false,
	one_there = false,
	two_there = false,
	three_there = false,
	four_there = false,
	five_there = false,
	power_up_message = false,
	sniped_destroyed = false,
	cliff_fall = false,
	scrap_cheat = false,

--  floats
	tug_check = 999999.9,
	shab_ship_check = 999999.9,
	message_time = 999999.9,
	recycler_move_time = 999999.9,
	building_time = 999999.9,
	scav_check = 999999.9,
	turret_check = 999999.9,
	manson_message_time = 999999.9,
	center_check = 999999.9,
	john_check = 999999.9,
	enemy_spawn_time = 999999.9,
	john_out_check = 999999.9,
	abandon_check = 999999.9,
	failed_time = 999999.9,
	start_show_time = 999999.9,
	jammer_repeat_time = 999999.9,
	hauler_check = 999999.9,
	movie_start_time = 999999.9,
	wave1_check = 999999.9,
	scav1_check = 999999.9,
	fire_check = 1.0,
	wait_time = 999999.9,
	away_check = 999999.9,
	power_up_check = 999999.9,
	john_dilly = 999999.9,
	convoy_check = 999999.9,
	convoy_wait_time = 999999.9,
	end_game_time = 999999.9,
	manson_check1 = 999999.9,
	manson_check2 = 999999.9,
	next_wave = 999999.9,
	pause = 999999.9,
	fodder_time = 999999.9,
	show_time = 999999.9,

--  handles
	player,
	recycler,
	player_ship,
	--Mission.shab,
	shabayev,
	power1,
	--power2,
	--tech_power,
	--tech_hanger,
	armory,
	tech_center,
	endbase_cbunk,
	field_cbunk,
	tug1,
	tug2,
	tug_drop,
	recy_drop,
	pool,
	manson,
	wing1,
	wing2,
	dead_scav1,
	dead_scav2,
	empty_scout1,
	empty_scout2,
	scion_drop,
	relic1,
	relic2,
	holder,
	crumble_cliff,
	stode_sent,
	scav1,
	deploy_scav,
	scav2,
	shab,
	tug,
	scion1,
	scion2,
	scion3,
	scion4,
	scion5,
	scion6,
	hauler1,
	hauler2,
	hauler3,
	turret1,
	turret2,
	turret3,
	turret4,
	turret5,
	wingman1,
	wingman2,
	geyser,
	ex_tank1,
	ex_tank2,
	nav1,
	nav2,
	leader1,
	leader2,
	sniped_ship,
	chase_scout1,
	chase_scout2,
	escion1,
	escion2,
	escion3,
	escion4,
	escion5,
	escout1,
	escout2,
	escout3,
	escout4,
	escout5,
	scion_tug_drop,
	ehauler1,
	ehauler2,
	jammer,
	power_up,
	bunker_nav,
	friend1, 
	friend2, 
	friend3,
	friend4, 
	friend5, 
	friend6,
	fodder1, 
	fodder2,
	dust1,
	dust2,
	pilot,
	
--  integers
	x = 0,
	talk = 0
   
} --End Mission

function Save()
   return Mission
end

function Load(...)
   if select("#", ...) > 0 then
      Mission = ...
   end
end

function Start() --This function is called upon the first frame
	-- Hack to avoid bug if you space-thru voiceover at start of mission then
	-- [KEEP THISnot ]  - NM 10/12/02
	MansonTeam=GetTeamNum(Mission.manson)
	SetTeamNum(Mission.tug1,MansonTeam)
	SetTeamNum(Mission.tug2,MansonTeam)
	SetTeamNum(Mission.relic1,MansonTeam)
	SetTeamNum(Mission.relic2,MansonTeam)
	
	SetTeamColor(3,0,127,255)  --Blue
	SetTeamColor(4,127,255,127)  --Green

	Ally(1,3)
	Ally(3,1)
	Ally(1,4)
	Ally(4,1)
	Ally(3,4)
	Ally(4,3)
	

	PreloadODF("ivscav")
	PreloadODF("ibscav")
	PreloadODF("ibrecy")
	
--  handles
	Mission.player = GetPlayerHandle()
	Mission.recycler = GetHandle("recycler")
	Mission.player_ship = GetHandle("player_ship")
	--Mission.shab = GetHandle("shab")
	Mission.shabayev = GetHandle("shabayev")
	Mission.power1 = GetHandle("power1")
	--power2 = GetHandle("power2")
	--tech_power = GetHandle("tech_power")
	--tech_hanger = GetHandle("tech_hanger")
	Mission.armory = GetHandle("armory")
	Mission.tech_center = GetHandle("tech_center")
	Mission.endbase_cbunk = GetHandle("endbase_cbunk")
	Mission.field_cbunk = GetHandle("field_cbunk")
	Mission.tug1 = GetHandle("tug1")
	Mission.tug2 = GetHandle("tug2")
	Mission.tug_drop = GetHandle("tug_drop")
	Mission.recy_drop = GetHandle("recy_drop")
	Mission.pool = GetHandle("pool")
	Mission.manson = GetHandle("manson")
	Mission.wing1 = GetHandle("wing1")
	Mission.wing2 = GetHandle("wing2")
	Mission.dead_scav1 = GetHandle("dead_scav1")
	Mission.dead_scav2 = GetHandle("dead_scav2")
	Mission.empty_scout1 = GetHandle("empty_scout1")
	Mission.empty_scout2 = GetHandle("empty_scout2")
	Mission.scion_drop = GetHandle("scion_drop")
	Mission.relic1 = GetHandle("relic1")
	Mission.relic2 = GetHandle("relic2")
	--holder = GetHandle("holder")
	Mission.crumble_cliff = GetHandle("crumble_cliff")
	Mission.stode_sent = GetHandle("stode_sent")
	Mission.scav1 = nil
	Mission.deploy_scav = nil
	Mission.scav2 = nil
	Mission.shab = nil
	Mission.tug = nil
	Mission.scion1 = nil
	Mission.scion2 = nil
	Mission.scion3 = nil
	Mission.scion4 = nil
	Mission.scion5 = nil
	Mission.scion6 = nil
	Mission.hauler1 = nil
	Mission.hauler2 = nil
	Mission.hauler3 = nil
	Mission.turret1 = nil
	Mission.turret2 = nil
	Mission.turret3 = nil
	Mission.turret4 = nil
	Mission.turret5 = nil
	Mission.wingman1 = nil
	Mission.wingman2 = nil
	Mission.geyser = nil
	Mission.ex_tank1 = nil
	Mission.ex_tank2 = nil
	Mission.nav1 = GetHandle("nav1")
	Mission.nav2 = nil
	Mission.leader1 = nil
	Mission.leader2 = nil
	Mission.sniped_ship = nil
	Mission.chase_scout1 = nil
	Mission.chase_scout2 = nil
	Mission.escion1 = nil
	Mission.escion2 = nil
	Mission.escion3 = nil
	Mission.escion4 = nil
	Mission.escion5 = nil
	Mission.escout1 = nil
	Mission.escout2 = nil
	Mission.escout3 = nil
	Mission.escout4 = nil
	Mission.escout5 = nil
	Mission.scion_tug_drop = nil
	Mission.ehauler1 = nil
	Mission.ehauler2 = nil
	Mission.jammer = nil
	Mission.power_up = nil
	Mission.bunker_nav = nil
	Mission.friend1 = nil 
	Mission.friend2 = nil 
	Mission.friend3 = nil
	Mission.friend4 = nil 
	Mission.friend5 = nil 
	Mission.friend6 = nil
	Mission.fodder1 = nil 
	Mission.fodder2 = nil
	Mission.dust1 = nil
	Mission.dust2 = nil
	Mission.pilot = nil
   
end

function AddObject(h) --This function is called when an object appears in the game. --

if (Mission.start_done) then

	if ((not Mission.recy_building) and (IsOdf(h,"ibrecy4"))) then
	
		Mission.recycler = h
		--SetTeamNum(Mission.recycler,0)
		Mission.recy_building = true
	
	elseif ((not Mission.scav1_a) and (IsOdf(h,"ivscav"))) then
	
		Mission.scav1 = h
		--SetTeamNum(Mission.scav1,1)
		Mission.scav1_a = true
	
	elseif ((not Mission.scav2_a) and (IsOdf(h,"ivscav"))) then
	
		Mission.scav2 = h
		--SetTeamNum(Mission.scav2,1)
		Mission.scav2_a = true
	
	elseif ((not Mission.deployscav_a) and (IsOdf(h,"ibscav"))) then
	
		Mission.scav1 = h
		--SetTeamNum(Mission.scav1,0)
		Mission.deployscav_a = true
	
	elseif ((Mission.turret1 == nil) and (IsOdf(h,"ivturr"))) then
	
		Mission.turret1 = h
		Mission.pause = GetTime() + 2.0
		--SetTeamNum(Mission.turret1,1)
		Mission.turret1_a = true
	
	elseif ((Mission.turret2 == nil) and (IsOdf(h,"ivturr"))) then
	
		Mission.turret2 = h
		--SetTeamNum(Mission.turret2,1)
		Mission.turret2_a = true
	
	elseif ((Mission.turret3 == nil) and (IsOdf(h,"ivturr"))) then
	
		Mission.turret3 = h
		--SetTeamNum(Mission.turret3,1)
		Mission.turret3_a = true
	
	elseif ((Mission.turret4 == nil) and (IsOdf(h,"ivturr"))) then
	
		Mission.turret4 = h
		--SetTeamNum(Mission.turret4,1)
		Mission.turret4_a = true
	
	elseif ((Mission.turret5 == nil) and (IsOdf(h,"ivturr"))) then
	
		Mission.turret5 = h
		--SetTeamNum(Mission.turret5,1)
		Mission.turret5_a = true
	
	elseif ((Mission.wingman1 == nil) and (IsOdf(h,"ivscout"))) then
	
		Mission.wingman1 = h
		Mission.wingman1_a = true
	
	elseif ((Mission.wingman2 == nil) and (IsOdf(h,"ivscout"))) then
	
		Mission.wingman2 = h
		Mission.wingman2_a = true
	
	elseif (IsOdf(h,"fspilo")) then
	
		Mission.pilot = h
		Damage(Mission.pilot,100)
		--RemoveObject(Mission.pilot)
	end
end
end


function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end



function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

--[[
	Here is where you put what happens every frame.  
]]

	Mission.player = GetPlayerHandle()

	-- this will hopefully prevent the Mission.player from building a turret

	if ((Mission.turret_set) and (not Mission.load_plan3)) then
	
		if (GetScrap(1) > 38) then
		
			SetScrap(1,39)
		end
	end




------------------------------------------------------------------------
if ((IsAlive(Mission.recycler)) and (not Mission.recycler_move)) then

	Stop(Mission.recycler)
end

--if (Mission.remove_drop1) then
--
--	Mission.manson_move = true
--end

if (not Mission.ON_HOLD) then

------------------------------------------------------------------------


	-- keep the relics and tugs alive

	if ((IsAround(Mission.tug1)) and (GetCurHealth(Mission.tug1) < 2500)) then
	
		SetCurHealth(Mission.tug1,2500)
	end
	if ((IsAround(Mission.tug2)) and (GetCurHealth(Mission.tug2) < 2500)) then
	
		SetCurHealth(Mission.tug2,2500)
	end
	if ((IsAround(Mission.relic1)) and (GetCurHealth(Mission.relic1) < 2000)) then
	
		SetCurHealth(Mission.relic1,2000)
	end
	if ((IsAround(Mission.relic2)) and (GetCurHealth(Mission.relic2) < 2000)) then
	
		SetCurHealth(Mission.relic2,2000)
	end
	--------------------------------------------


	-- This is checking to see if the recycyer is deployed or not then

	if (Mission.recy_building) then
	
		if (IsAround(Mission.recycler)) then
		
			if (IsOdf(Mission.recycler,"ivrecy4")) then
			
				Mission.recy_building = false
			
			else
			
				Mission.recy_building = true
			end
		end
	end
	--------------------------------------------

	
	-- this is checking to make sure the Mission.player does not attack his wingman

	if (not Mission.in_combat) then
	
		if (Mission.fire_check < GetTime()) then
		
			if ((IsAlive(Mission.shabayev)) and (IsAlive(Mission.player))) then
			
				if (GetTime() - GetLastFriendShot(Mission.shabayev) < .2) then
				
					AudioMessage("ff01.wav") -- (Mission.shab) watch your firingnot 
					Mission.fire_check = GetTime() + 2.0
				end
			end
		end
	end
	--------------------------------------------

	
	-- this is setting the death variables

	if (Mission.scav1_a) then
	
		if (not Mission.assign_scav1) then
		
			Stop(Mission.scav1,0)
			--Goto(Mission.scav1,"scav_path",0)
			Mission.pause = GetTime() + 3.0
			Mission.assign_scav1 = true
		end


		if ((not IsAlive(Mission.scav1)) and (not Mission.deployscav_a)) then
		
			Mission.scav1_a = false
			Mission.assign_scav1 = false
		end
	end
	--------------------------------------------


	-- these are checkng to see that the turrets are near the scavnerger

	if (Mission.turret1_a) then
	
		if (Mission.deployscav_a) then
		
			if ((not Mission.turret1_scavcheck) and (IsDeployed(Mission.turret1))) then
			
				if (GetDistance(Mission.turret1,Mission.scav1) < 100.0) then
				
					Mission.tur1_near_scav = true
				
				else
				
					Mission.tur1_near_scav = false
				end

				Mission.turret1_scavcheck = true
			end

			if ((Mission.turret1_scavcheck) and (not IsDeployed(Mission.turret1))) then
			
				Mission.tur1_near_scav = false
				Mission.turret1_scavcheck = false
			end
		end


		if (not IsAlive(Mission.turret1)) then
		
			Mission.tur1_near_scav = false
			Mission.turret1_scavcheck = false
			Mission.turret1_a = false
		end
	end


	if (Mission.turret2_a) then
	
		if (Mission.deployscav_a) then
		
			if ((not Mission.turret2_scavcheck) and (IsDeployed(Mission.turret2))) then
			
				if (GetDistance(Mission.turret2,Mission.scav1) < 100.0) then
				
					Mission.tur2_near_scav = true
				
				else
				
					Mission.tur2_near_scav = false
				end

				Mission.turret2_scavcheck = true
			end

			if ((Mission.turret2_scavcheck) and (not IsDeployed(Mission.turret2))) then
			
				Mission.tur2_near_scav = false
				Mission.turret2_scavcheck = false
			end
		end


		if (not IsAlive(Mission.turret2)) then
		
			Mission.tur2_near_scav = false
			Mission.turret2_scavcheck = false
			Mission.turret2_a = false
		end
	end


	if (Mission.turret3_a) then
	
		if (Mission.deployscav_a) then
		
			if ((not Mission.turret3_scavcheck) and (IsDeployed(Mission.turret3))) then
			
				if (GetDistance(Mission.turret3,Mission.scav1) < 100.0) then
				
					Mission.tur3_near_scav = true
				
				else
				
					Mission.tur3_near_scav = false
				end

				Mission.turret3_scavcheck = true
			end

			if ((Mission.turret3_scavcheck) and (not IsDeployed(Mission.turret3))) then
			
				Mission.tur3_near_scav = false
				Mission.turret3_scavcheck = false
			end
		end


		if (not IsAlive(Mission.turret3)) then
		
			Mission.tur3_near_scav = false
			Mission.turret3_scavcheck = false
			Mission.turret3_a = false
		end
	end


	if (Mission.turret4_a) then
	
		if (Mission.deployscav_a) then
		
			if ((not Mission.turret4_scavcheck) and (IsDeployed(Mission.turret4))) then
			
				if (GetDistance(Mission.turret1,Mission.scav1) < 100.0) then
				
					Mission.tur4_near_scav = true
				
				else
				
					Mission.tur4_near_scav = false
				end

				Mission.turret4_scavcheck = true
			end

			if ((Mission.turret4_scavcheck) and (not IsDeployed(Mission.turret4))) then
			
				Mission.tur4_near_scav = false
				Mission.turret4_scavcheck = false
			end
		end


		if (not IsAlive(Mission.turret4)) then
		
			Mission.tur4_near_scav = false
			Mission.turret4_scavcheck = false
			Mission.turret4_a = false
		end
	end


	if (Mission.turret5_a) then
	
		if (Mission.deployscav_a) then
		
			if ((not Mission.turret5_scavcheck) and (IsDeployed(Mission.turret5))) then
			
				if (GetDistance(Mission.turret5,Mission.scav1) < 100.0) then
				
					Mission.tur5_near_scav = true
				
				else
				
					Mission.tur5_near_scav = false
				end

				Mission.turret5_scavcheck = true
			end

			if ((Mission.turret5_scavcheck) and (not IsDeployed(Mission.turret5))) then
			
				Mission.tur5_near_scav = false
				Mission.turret5_scavcheck = false
			end
		end


		if (not IsAlive(Mission.turret5)) then
		
			Mission.tur5_near_scav = false
			Mission.turret5_scavcheck = false
			Mission.turret5_a = false
		end
	end
	--------------------------------------------

	
	if (Mission.wingman1_a) then
	
		if (not Mission.assign_wingman1) then
		
			Follow(Mission.wingman1,Mission.shabayev)
			Mission.assign_wingman1 = true
		end


		if (not IsAlive(Mission.wingman1)) then
		
			Mission.wingman1_a = false
			Mission.assign_wingman1 = false
		end
	end
	--------------------------------------------


	-- I'm checking to see if the Mission.player looses his ship then

	if ((IsOdf(Mission.player,"ivplysct")) or (IsOdf(Mission.player,"ivtank")) or (IsOdf(Mission.player,"ivscav")) or (IsOdf(Mission.player,"ivturr"))) then
	
		Mission.player_on_foot = false
		Mission.player_in_ship = true
		Mission.player_in_enemy = false
	
	elseif ((IsOdf(Mission.player,"fvpsnt4")) or (IsOdf(Mission.player,"fvpscou")) or (IsOdf(Mission.player,"fvscout"))) then
	
		Mission.player_on_foot = false
		Mission.player_in_ship = false
		Mission.player_in_enemy = true
	
	else
	
		Mission.player_on_foot = true
		Mission.player_in_ship = false
		Mission.player_in_enemy = false
	end
	--------------------------------------------


	-- this is if the Mission.player gets into a sniped alien ship then

	if (Mission.player_in_enemy) then
	
		Damage(Mission.player,2)
	end
	--------------------------------------------


-- this is sending the two tugs to the drop


	
	-- first they have to pick up the relics

	if (not Mission.tug_pickup) then
	
		SetAvoidType(Mission.tug1,0)
		SetAvoidType(Mission.tug2,0)
		Pickup(Mission.tug1,Mission.relic1)
		Pickup(Mission.tug2,Mission.relic2)
		Mission.tug_pickup = true
	end
	--------------------------------------------

	
	-- once they have the relics they go for the drop

	if (not Mission.tug1_move) then
	
		if (HasCargo(Mission.tug1))  then
		
			Goto(Mission.tug1,"tug_path1")
			Mission.tug1_move = true
		end
	end

	if (not Mission.tug2_move) then
	
		if (HasCargo(Mission.tug2))  then
		
			Goto(Mission.tug2,"tug_path2")
			Mission.tug2_move = true
		end
	end
	--------------------------------------------

	
	-- this is when each is inside

	if (not Mission.remove_drop1) then
	
		if ((not Mission.tug1_board) and (Mission.tug1_move) and (GetDistance(Mission.tug1,"load_point1") < 20.0)) then
		
			Stop(Mission.tug1)
			Mission.tug1_board = true
		end

		if (Mission.tug1_board) then
		
			Stop(Mission.tug1)
		end

		if ((not Mission.tug2_board) and (Mission.tug2_move) and (GetDistance(Mission.tug2,"load_point2") < 22.0)) then
		
			Stop(Mission.tug2)
			Mission.tug2_board = true
		end

		if (Mission.tug2_board) then
		
			Stop(Mission.tug2)
		end

		if ((not Mission.tugs_in) and (Mission.tug1_board) and (Mission.tug2_board)) then
		
			Mission.recycler_move_time = GetTime() + 1.0
			Mission.tugs_in = true
		end

		-- this will warn the Mission.player if he is too close then

		if ((Mission.tugs_in) and (not Mission.close_doors) and (Mission.recycler_move_time < GetTime())) then
		
			if (GetDistance(Mission.player,Mission.tug1) < 40.0) then
			
				Mission.recycler_move_time = GetTime() + 10.0
				AudioMessage("isdf0444.wav") -- (Mission.pilot) please move away from the vehcile sir
			
			else
			
				SetAnimation(Mission.tug_drop,"takeoff",1)
				--StartSoundEffect("dropdoor.wav",Mission.tug_drop)
				StartSoundEffect("dropleav.wav",Mission.tug_drop)
				Mission.recycler_move_time = GetTime() + 3.0
				Mission.close_doors = true
			end
		end

		if ((Mission.close_doors) and (not Mission.drop_takeoff) and (Mission.recycler_move_time < GetTime())) then
		
			StartSoundEffect("dropdoor.wav",Mission.tug_drop)
			StartEmitter(Mission.tug_drop, 1)
			StartEmitter(Mission.tug_drop, 2)
			--Mission.dust1 = BuildObject("kickup",0,"smoke1_a")
			--Mission.dust2 = BuildObject("kickup",0,"smoke1_b")
			RemoveObject(Mission.tug1)
			RemoveObject(Mission.tug2)
			RemoveObject(Mission.relic1)
			RemoveObject(Mission.relic2)
			Mission.recycler_move_time = GetTime() + 10.0
			Mission.drop_takeoff = true
		end


		if ((Mission.drop_takeoff) and (not Mission.remove_drop1) and (Mission.recycler_move_time < GetTime())) then
		
			RemoveObject(Mission.tug_drop)
			--RemoveObject(Mission.dust1)
			--RemoveObject(Mission.dust2)
			Mission.remove_drop1 = true
		end
	end
	--------------------------------------------

	
	if (not Mission.start_done) then
	
		SetColorFade(1,0.5,Make_RGBA(0, 0, 0, 255))

		MaskEmitter(Mission.tug_drop, 0)
		MaskEmitter(Mission.recy_drop, 0)
		Mission.holder = BuildObject("stayput",0,Mission.recycler)
		AddScrap(1,35)
		SetAvoidType(Mission.shabayev,0)
		SetAnimation(Mission.tug_drop,"deploy",1)
		SetGroup(Mission.recycler,-1)
		SetGroup(Mission.shabayev,-1)
		SetObjectiveOn(Mission.shabayev)
		SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
		SetObjectiveOn(Mission.manson)
		SetObjectiveName(Mission.manson,"Maj. Manson")
		SetObjectiveName(Mission.wing1,"Sgt. Zdarko")
		SetObjectiveName(Mission.wing2,"Sgt. Masiker")
		Mission.message_time = GetTime() + 5.0

		LookAt(Mission.shabayev,Mission.manson)
		LookAt(Mission.manson,Mission.shabayev)
		LookAt(Mission.wing1,Mission.manson)
		LookAt(Mission.wing2,Mission.manson)

		SetPerceivedTeam(Mission.scion_drop,1)

		Ally(0,1)
		Ally(1,0)

		--LookAt(Mission.stode_sent,Mission.field_cbunk,1)
		RemoveObject(Mission.stode_sent)

		Mission.start_done = true
	end
	--------------------------------------------


-- this is Mission.shab telling john how to order a friendly to pick him up


	-- this is braddock telling Manson to move out

	if ((not Mission.shab_message1) and (Mission.message_time < GetTime())) then
	
		Mission.talk = AudioMessage("isdf0401.wav")--(brad) move out Mission.manson
		LookAt(Mission.shab,Mission.player)
		Mission.shab_message1 = true
	end
	--------------------------------------------


	-- this is Manson moving out

	if ((Mission.shab_message1) and (not Mission.manson_move) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0439.wav")--(Mission.manson) roger that, follow me one and two
		SetAvoidType(Mission.manson,0)
		SetAvoidType(Mission.wing1,0)
		SetAvoidType(Mission.wing2,0)
		Goto(Mission.manson,"man_out_path")
		Follow(Mission.wing1,Mission.manson)
		Follow(Mission.wing2,Mission.wing1)
		Mission.manson_check1 = GetTime() + 1.0
		Mission.manson_move = true	
	end
	--------------------------------------------


	-- this is getting rid of Mission.manson

	if ((Mission.manson_move) and (not Mission.remove_manson)) then
	
		if (Mission.manson_check1 < GetTime()) then
		
			Mission.manson_check1 = GetTime() + 1.0

			if ((not Mission.off_object) and (GetDistance(Mission.manson,Mission.player) > 150.0)) then
			
				if (IsAround(Mission.manson)) then
				
					SetObjectiveOff(Mission.manson)
					Mission.off_object = true
				end
			end

			if (GetDistance(Mission.manson,Mission.player) > 500.0) then
			
				if (IsAround(Mission.manson)) then
				
					RemoveObject(Mission.manson)
				end
				if (IsAround(Mission.wing1)) then
				
					RemoveObject(Mission.wing1)
				end
				if (IsAround(Mission.wing2)) then
				
					RemoveObject(Mission.wing2)
				end

				Mission.remove_manson = true
			end
		end
	end
	--------------------------------------------


	-- this is braddock telling Mission.shab to deploy Mission.recycler

	if ((Mission.manson_move) and (not Mission.tell_shab_deploy) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0420.wav")--(brad) Mission.shab - deploy that recy
		Mission.tell_shab_deploy = true
	end
	--------------------------------------------


	if ((Mission.tell_shab_deploy) and (not Mission.shab_ok) and (IsAudioMessageDone(Mission.talk))) then
	
		LookAt(Mission.shabayev,Mission.recycler)
		Mission.talk = AudioMessage("isdf0440a.wav")--(Mission.shab) rogernot  Recycler1 clear the drop ship
		SetAnimation(Mission.recy_drop,"deploy",1)
		--StartSoundEffect("dropdoor.wav",Mission.recy_drop)
		Mission.shab_ok = true
	end
	--------------------------------------------


	-- this is making Mission.shab deploy the Mission.recycler

	if ((Mission.shab_ok) and (not Mission.recycler_move) and (IsAudioMessageDone(Mission.talk))) then
	
		StartSoundEffect("dropdoor.wav",Mission.recy_drop)
		LookAt(Mission.shabayev,Mission.player)
		RemoveObject(Mission.holder)
		SetAvoidType(Mission.recycler,0)
		Goto(Mission.recycler,"recycler_path")
		Mission.talk = AudioMessage("isdf0402.wav")--(Mission.shab) I'm calling the Mission.recycler over here
		Mission.recycler_move_time = GetTime() + 2.0
		Mission.recycler_move = true
	end
	--------------------------------------------


	-- Mission.shab commenting on the Mission.recycler

	if ((Mission.recycler_move) and (not Mission.recycler_comment) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0421.wav")--(Mission.shab) Your Mission.recycler is your pivotal building machine
		Mission.recycler_comment = true
	end
	--------------------------------------------


	-- this is new code that will allow me to remove the dropship

	if (Mission.recycler_move) then
	
		if ((not Mission.takeoff_recy_drop) and (GetDistance(Mission.recycler,"deploy_point") < 20.0)) then --(GetCurrentCommand(Mission.recycler) == 0)) then
		
			Dropoff(Mission.recycler,"new_drop2")
			--Stop(Mission.recycler)
			Mission.recy_wait = true

			if (Mission.recycler_move_time < GetTime()) then
			
				if (GetDistance(Mission.player,"recy_drop_point") < 20.0) then
				
					Mission.recycler_move_time = GetTime() + 10.0
					AudioMessage("isdf0444.wav") -- (Mission.pilot) please move away from the vehcile sir
				
				else
				
					SetAnimation(Mission.recy_drop,"takeoff",1)
					--StartSoundEffect("dropdoor.wav",Mission.recy_drop)
					StartSoundEffect("dropleav.wav",Mission.recy_drop)
					Mission.recycler_move_time = GetTime() + 3.0
					Mission.takeoff_recy_drop = true
				end
			end
		end
	end
	--------------------------------------------


	-- this removes the last dropship

	if ((Mission.takeoff_recy_drop) and (not Mission.remove_recy_drop) and (Mission.recycler_move_time < GetTime())) then
	
		if (not Mission.emit_on) then
		
			StartSoundEffect("dropdoor.wav",Mission.recy_drop)
			StartEmitter(Mission.recy_drop, 1)
			StartEmitter(Mission.recy_drop, 2)
			Mission.recycler_move_time = GetTime() + 8.0
			Mission.emit_on = true
		
		else
		
			RemoveObject(Mission.recy_drop)
			Mission.remove_recy_drop = true
		end
	end
	--------------------------------------------


	-- this tells the recy to deploy

	if ((Mission.recy_wait) and (Mission.recycler_comment) and (not Mission.recycle_deploy) and (IsAudioMessageDone(Mission.talk))) then
	
		--Goto(Mission.shabayev,"deploy_point")
		LookAt(Mission.shabayev,Mission.recycler)
		Mission.talk = AudioMessage("isdf0403.wav")--(Mission.shab) that's good enough Recy 1 deploy there
		--Dropoff(Mission.recycler,"new_drop2")
		Mission.recycle_deploy = true
	end
	--------------------------------------------


	-- this is the Mission.recycler responding

	if ((Mission.recycle_deploy) and (not Mission.recycler_response) and (IsAudioMessageDone(Mission.talk))) then
	
		Goto(Mission.shabayev,"start_build_point")
		AudioMessage("isdf0404.wav")--(Mission.recycler) Roger that Commander.
		Mission.recycler_response = true
	end
	--------------------------------------------


	-- this is after the recy is deployed

	if ((not Mission.stop_shab) and (Mission.recycler_response) and (GetDistance(Mission.shabayev,"start_build_point") < 5.0)) then
	
		LookAt(Mission.shabayev,Mission.recycler)
		Mission.stop_shab = true
	end
	--------------------------------------------
	
	
	-- once the Mission.recycler is deployed she builds Mission.scav1

	if ((Mission.recycle_deploy) and (Mission.recy_building) and (not Mission.start_building)) then
	
		LookAt(Mission.shabayev,Mission.player)
		AudioMessage("isdf0405.wav")--(Mission.shab) the first thing you usually build is scav
		--AddScrap(1,40)
		Mission.wait_time = GetTime() + 5.0
		Mission.start_building = true
	end
	--------------------------------------------
	

	-- this sets the aip that builds the scavenger
	
	if ((not Mission.set_plan1) and (Mission.wait_time < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.recycler)
		SetAIP("isdf0401.aip",1)
		Mission.wait_time = GetTime() + 999999.0
		Mission.set_plan1 = true
	end
	--------------------------------------------


	-- this is checking to see if the Mission.player stops the scav from being built then

	if (Mission.start_building) then
	
		if (GetScrap(1) < 21) then
		
			Mission.building_stopped = false
		end

		if ((not Mission.scav1_a) and (not Mission.building_stopped) and (GetScrap(1) > 21)) then
		
			AudioMessage("isdf0443.wav")--(Mission.shab) don't stop the building John
			Mission.wait_time = GetTime() + 5.0
			Mission.set_plan1 = false
			Mission.building_stopped = true
		end
	end
	--------------------------------------------


	-- Mission.shab is giving the scav to John and telling him to set it up

	if ((Mission.scav1_a) and (not Mission.shab_message2) and (Mission.pause < GetTime())) then
	

			pos = GetTransform(Mission.recycler)
			RemoveObject(Mission.recycler)
			Mission.recycler = BuildObject("ibrecy4a",1,pos)

		--Goto(Mission.scav1,"scav_point",0)
		AddScrap(1,15)
		Goto(Mission.scav1,"recy_drop_point",0)
		LookAt(Mission.shabayev,Mission.player)
		ClearObjectives()
		AddObjective("isdf0401.otf", "WHITE")
		Mission.talk = AudioMessage("isdf0406.wav")--(Mission.shab) I'm giving you the scav - take it to the nav beacon
		SetObjectiveOn(Mission.nav1)
		tempstr = TranslateString("Mission0401")  -- Scrap Pool
		SetObjectiveName(Mission.nav1,tempstr)
		Mission.scav_check = GetTime() + 2.0
		Mission.pause = GetTime() + 3.0
		SetAIP("isdf0402.aip",1) -- builds turrets
		Mission.shab_message2 = true
	end
	--------------------------------------------


	-- this is making Mission.shab look at the nav beacon

	if ((Mission.shab_message2) and (not Mission.new_look1) and (Mission.pause < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.pool)
		Mission.new_look1 = true
	end
	--------------------------------------------


	if ((Mission.new_look1) and (not Mission.new_look2) and (IsAudioMessageDone(Mission.talk))) then
	
		LookAt(Mission.shabayev,Mission.player)
		Mission.new_look2 = true
	end


	-- this is checking to see when the scav is near the Mission.pool

	if ((Mission.shab_message2) and (not Mission.shab_message3) and (Mission.scav_check < GetTime())) then
	
		Mission.scav_check = GetTime() + 2.0


		if ((GetDistance(Mission.player,Mission.pool) < 60.0) or (GetDistance(Mission.scav1,Mission.pool) < 60.0)) then
		
			ClearObjectives()
			AddObjective("isdf0402.otf", "WHITE")
			AddObjective("isdf0403.otf", "WHITE")

			Mission.talk = AudioMessage("isdf0407.wav")--(Mission.shab) to set up scavengers open their menu...
			
			--BuildObject("ivscout",1,"deploy_point") -- this is temp
			
			Mission.shab_message3 = true
		end
	end
	--------------------------------------------


	-- this is when the scav is selected
	
	if ((Mission.shab_message3) and (not Mission.shab_message4) and (IsSelected(Mission.scav1))) then
	
		ClearObjectives()
		AddObjective("isdf0402.otf", "WHITE")
		AddObjective("isdf0403.otf", "GREEN")
		AddObjective("isdf0404.otf", "WHITE")

		StopAudioMessage(Mission.talk)
		Mission.talk = AudioMessage("isdf0408.wav")--(Mission.shab) point at the vien and press space bar or simply select the "go to vein" command
		Mission.scav1_check = GetTime() + 240.0
		Mission.shab_message4 = true
	end
	--------------------------------------------


--------------------------------------------------------------------------
-- this is where I will start the first attack wave on the scav and the base


	if ((not Mission.spawn_1) and ((Mission.scavdeploy_message) or (Mission.shab_message3))) then
	
		Mission.scion1 = BuildObject("fvsent",2,"path_1")
		Mission.scion2 = BuildObject("fvpscou",2,"path_2")
		Stop(Mission.scion1)
		Stop(Mission.scion2)
		Mission.wave1_check = GetTime() + 2.0
		Mission.spawn_1 = true
	end


	if ((Mission.spawn_1) and (not Mission.wave1_warning) and (Mission.wave1_check < GetTime())) then
	
		Mission.wave1_check = GetTime() + 2.0

		if ((GetDistance(Mission.scion1,Mission.scav1) < 200.0)--[[ or (GetDistance(Mission.scion2,Mission.player) < 200.0)]]) then
		
			AudioMessage("isdf0411.wav")--(Mission.shab) youve got two more of them out there hold them off unitl I can build some turrets
			Mission.wave1_check = GetTime() + 999999.9
			
			if (Mission.scavdeploy_message) then
			
				ClearObjectives()
				AddObjective("isdf0402.otf", "GREEN")
				AddObjective("isdf0405.otf", "WHITE")
			
			else
			
				ClearObjectives()
				AddObjective("isdf0402.otf", "WHITE")
				AddObjective("isdf0405.otf", "WHITE")
			end
			
			Mission.wave1_warning = true
		end
	end
	
	
	if ((Mission.spawn_1) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2))) then
	
		if (not Mission.scavdeploy_message) then
		
			AudioMessage("isdf0409.wav")--(Mission.shab) john you wanna hurry and deploy that scav - I need the funds
			Mission.scavdeploy_message = true
		end

		Mission.first_dead = true
	end

--------------------------------------------------------------------------


	-- this checks to see if the Mission.player ever deploys the Mission.scav1 then

	if ((not Mission.scav_check1) and (not Mission.scavdeploy_message) and (Mission.scav1_check < GetTime())) then
	
		if ((Mission.scav1_a) and (not Mission.deployscav_a)) then
		
			AudioMessage("isdf0409.wav")--(Mission.shab) john you wanna hurry and deploy that scav - I need the funds
			
			ClearObjectives()
			AddObjective("isdf0402.otf", "WHITE")
		end

		Mission.scav1_check = GetTime() + 999999.9
		Mission.scav_check1 = true
	end
	--------------------------------------------

	
	-- when the first scav is deployed

	if ((not Mission.scavdeploy_message) and (Mission.scav1_a) and (Mission.shab_message3) and (Mission.deployscav_a)) then
	
		if (not Mission.wave1_warning) then
		
			AudioMessage("isdf0410.wav")--(Mission.shab) good work - stay by that scav
		end

		if (IsAlive(Mission.scion1)) then
		
			Attack(Mission.scion1,Mission.scav1)
		end

		if (IsAlive(Mission.scion2)) then
		
			Attack(Mission.scion2,Mission.scav1)
		end

		--SetObjectiveOff(Mission.nav1)
		ClearObjectives()
		AddObjective("isdf0402.otf", "GREEN")
		AddObjective("isdf0405.otf", "WHITE")

		Mission.scavdeploy_message = true
	end
	--------------------------------------------


	-- this sets the scrap a little higher to speed up the game

	if ((not Mission.scrap_cheat) and (Mission.scavdeploy_message) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2))) then
	
		SetScrap(1,35)
		Mission.scrap_cheat = true
	end
	--------------------------------------------

	
	-- now that the turret is alive

	if ((Mission.turret1_a) and (not Mission.turret_set) and (Mission.pause < GetTime())) then
	
		Mission.talk = AudioMessage("isdf0412.wav")--(Mission.shab) I'm sending a turret to you. Deploy it near the scav for support
		Follow(Mission.turret1,Mission.player,0)
		Mission.turret_check = GetTime() + 2.0
		Mission.turret_set = true
	end
	--------------------------------------------


	-- this is sending the newly contructed turret to the Mission.player (who is hopefully guarding the scavenger)

	if ((Mission.turret_set) and (not Mission.turret1_at_john) and (Mission.turret_check < GetTime())) then
	
		Mission.turret_check = GetTime() + 1.0


		if (GetDistance(Mission.turret1,Mission.player) < 60.0) then
		
			AudioMessage("isdf0413.wav")--(Mission.shab) to deploy the turret...
			
			if (Mission.scavdeploy_message) then
			
				if (Mission.first_dead) then
				
					ClearObjectives()
					AddObjective("isdf0402.otf", "GREEN")
					AddObjective("isdf0405.otf", "GREEN")
					AddObjective("isdf0406.otf", "WHITE")
				
				else
				
					ClearObjectives()
					AddObjective("isdf0402.otf", "GREEN")
					AddObjective("isdf0405.otf", "WHITE")
					AddObjective("isdf0406.otf", "WHITE")
				end
			
			else
			

				if (Mission.first_dead) then
				
					ClearObjectives()
					AddObjective("isdf0402.otf", "WHITE")
					AddObjective("isdf0405.otf", "GREEN")
					AddObjective("isdf0406.otf", "WHITE")
				
				else
				
					ClearObjectives()
					AddObjective("isdf0402.otf", "WHITE")
					AddObjective("isdf0405.otf", "WHITE")
					AddObjective("isdf0406.otf", "WHITE")
				end
			end
			
			Mission.turret1_at_john = true
		end
	end

	
	-- this is the next attack on the scavenge

	if ((Mission.turret1_at_john) and (Mission.turret1_scavcheck) and (Mission.first_dead) and (not Mission.turret_test)) then
	
		Mission.scion1 = BuildObject("fvsent",2,"path_1")
		Mission.scion2 = BuildObject("fvsent",2,"path_2")
		Mission.scion3 = BuildObject("fvscout",2,"path_3")
		Attack(Mission.scion1,Mission.scav1,1)
		Attack(Mission.scion2,Mission.scav1,1)
		Attack(Mission.scion3,Mission.player)
		Mission.turret_test = true
	end
	--------------------------------------------


	-- this is after the turret attack
	
	if ((Mission.turret_test) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3)) and (not Mission.manson_set)) then
	
		Mission.manson_message_time = GetTime() + 3.0
		Mission.manson_set = true
	end
	--------------------------------------------

	
	
	-- this is Mission.manson radioing to Braddock that his plan is going wrong 

	if ((Mission.manson_set) and (not Mission.manson_message1) and (Mission.manson_message_time < GetTime())) then
	
		Mission.talk = AudioMessage("isdf0414.wav")--(Mission.manson) Braddock - your plan is going wrong
		Mission.manson_message1 = true
	end
	--------------------------------------------


	-- braddock tells Mission.shab and cooke to retunr to base

	if ((Mission.manson_message1) and (not Mission.shab_reply1) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0422.wav")--(brad) Mission.shab and Cooke meet at reycler
		Goto(Mission.shabayev,"base_center")
		Mission.center_check = GetTime() + 1.0
		ClearObjectives()
		AddObjective("isdf0407.otf", "WHITE")
		Mission.shab_reply1 = true
	end
	--------------------------------------------


	-- checking to see when they are all at base
	
	if ((Mission.shab_reply1) and (not Mission.all_at_center) and (Mission.center_check < GetTime())) then
	
		Mission.center_check = GetTime() + 0.5


		if ((not Mission.shab_there) and (GetDistance(Mission.shabayev,"base_center") < 50.0)) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.shab_there = true
		end

		if ((not Mission.player_there) and (GetDistance(Mission.player,Mission.shabayev) < 60.0)) then
		
			Mission.player_there = true
		end

		if (Mission.player_there) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.all_at_center = true
		end
	end
	--------------------------------------------


	-- braddock sends Mission.shab away

	if ((Mission.all_at_center) and (not Mission.send_shab_away) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0441.wav")--(brad) Mission.shab meet blue squad in sector 12
		Mission.send_shab_away = true
	end


	if ((Mission.send_shab_away) and (not Mission.shab_protest) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0423.wav")--(Mission.shab) the area is not secure
		Mission.shab_protest = true
	end


	if ((Mission.shab_protest) and (not Mission.brad_insist) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0424.wav")--(brad) I am awarenot  Carry out my ordersnot 
		Mission.brad_insist = true
	end


	if ((Mission.brad_insist) and (not Mission.shab_message5) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0415.wav")--(Mission.shab) Yes sir, I'm heading out
		Mission.scion1 = BuildObject("fvsent",2,"path_1")
		Mission.scion2 = BuildObject("fvsent",2,"path_2")
		--Mission.scion3 = BuildObject("fvsent",2,"path_3")
		--SetTeamNum(Mission.wingman1,1)
		--SetTeamNum(Mission.wingman2,1)
		Mission.john_check = GetTime() + 1.0
		Mission.shab_message5 = true
	end
	--------------------------------------------

--[[
	-- this is sending Mission.shab away from the base

	if ((Mission.shab_message5) and (not Mission.shab_go_away) and (IsAudioMessageDone(Mission.talk))) then
	
		SetObjectiveOff(Mission.shabayev)
		Goto(Mission.shabayev,"man_out_path")
		Mission.shab_go_away = true
	end
	--------------------------------------------
]]


	-- this loads the new plan where braddock builds turrets

	if ((Mission.shab_message5) and (not Mission.load_plan3) and (IsAudioMessageDone(Mission.talk))) then
	
		--SetScrap(1,43)
		Retreat(Mission.shabayev,"man_out_path")
		SetPerceivedTeam(Mission.shabayev,2)
		SetObjectiveOff(Mission.shabayev)
		Mission.away_check = GetTime() + 1.0
		Mission.talk = AudioMessage("isdf0416.wav")--(brad) Cooke - I'm placing that Mission.recycler into a build loop
		Mission.load_plan3 = true
	end


	if ((Mission.load_plan3) and (not Mission.plan3_loaded)--[[ and (IsAudioMessageDone(Mission.talk))]]) then
	
		ClearObjectives()
		AddObjective("isdf0407.otf", "GREEN")
		AddObjective("isdf0408.otf", "WHITE")
		SetAIP("isdf0403.aip",1) -- builds 4 turrets
		Mission.plan3_loaded = true
	end
	--------------------------------------------


	-- the second scions attack the scavnger

	if ((Mission.load_plan3) and (not Mission.shab_away) and (IsAudioMessageDone(Mission.talk))) then
	
		Attack(Mission.scion1,Mission.recycler,0)
		Attack(Mission.scion2,Mission.recycler,0)
		--Follow(Mission.scion3,Mission.scion2)

		Mission.shab_away = true
	end
	--------------------------------------------


	-- this is checking to see when the second wave is dead

	if ((Mission.shab_message5) and (not Mission.second_dead)) then
	
		if ((not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
		
			Mission.next_wave = GetTime() + 120.0
			Mission.second_dead = true
		end
	end
	--------------------------------------------


	-- this is checking to see when Mission.shab is away

	if ((Mission.shab_away) and (not Mission.remove_shab) and (Mission.away_check < GetTime())) then
	
		Mission.away_check = GetTime() + 1.0


		if (GetDistance(Mission.shabayev,Mission.player) > 500.0) then
		
			RemoveObject(Mission.shabayev)
			Mission.remove_shab = true
		end
	end
	--------------------------------------------


	-- this is the third wave

	if ((Mission.second_dead) and (not Mission.third_spawn) and (Mission.next_wave < GetTime())) then
	
		Mission.scion1 = BuildObject("fvsent",2,"path_1")
		Mission.scion2 = BuildObject("fvsent",2,"path_2")
		Mission.scion3 = BuildObject("fvsent",2,"path_3")

		Attack(Mission.scion1,Mission.scav1)
		Follow(Mission.scion2,Mission.scion1,0)
		Attack(Mission.scion3,Mission.recycler,0)

		Mission.next_wave = GetTime() + 999999.9
		Mission.third_spawn = true

	end
	--------------------------------------------


	-- this is checking to see when the third wave is dead

	if ((Mission.third_spawn) and (not Mission.third_dead)) then
	
		if ((not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
		
			Mission.fodder_time = GetTime() + 30.0
			Mission.third_dead = true
		end
	end
	--------------------------------------------


	-- this is setting next time

	if ((Mission.turret3_a) and (Mission.third_dead) and (not Mission.set_for_main)) then
	
		Mission.next_wave = GetTime() + 200
		Mission.set_for_main = true
	end
	--------------------------------------------


	-- this is going to spawn in cannon fodder until the main wave is ready to attack

	if ((not Mission.major_wave) and (Mission.third_dead)) then
	
		if ((not IsAlive(Mission.fodder1)) and (not IsAlive(Mission.fodder2)) and (Mission.fodder_time < GetTime())) then
		
			Mission.fodder_time = GetTime() + 30.0
			Mission.fodder1 = BuildObject("fvscout",2,"fodder1_spawn")
			Mission.fodder2 = BuildObject("fvscout",2,"fodder2_spawn")
			SetAvoidType(Mission.fodder1,0)
			SetAvoidType(Mission.fodder2,0)
			Goto(Mission.fodder1,"fodder1_path",0)
			Goto(Mission.fodder2,"fodder2_path",0)
			Mission.fodder_attack = false
		end
	end
	--------------------------------------------


	-- this makes the fodder attack

	if (not Mission.fodder_attack) then
	
		if ((IsAlive(Mission.fodder1)) and (GetDistance(Mission.fodder1,Mission.recycler) < 40)) then
		
			Attack(Mission.fodder1,Mission.player,0)

			if (IsAlive(Mission.fodder2)) then
			
				Attack(Mission.fodder2,Mission.player,0)
			end

			Mission.fodder_attack = true
		end

		if ((not Mission.fodder_attack) and (IsAlive(Mission.fodder2)) and (GetDistance(Mission.fodder2,Mission.recycler) < 40)) then
		
			Attack(Mission.fodder2,Mission.player,0)

			if (IsAlive(Mission.fodder1)) then
			
				Attack(Mission.fodder1,Mission.player,0)
			end

			Mission.fodder_attack = true
		end
	end
	--------------------------------------------

	
	-- these are the attack waves that come at the Recycler and scavneger

	if (not Mission.major_wave) then
	
		if ((Mission.turret5_a) or ((Mission.set_for_main) and (Mission.next_wave < GetTime()))) then

		
			Mission.scion1 = BuildObject("fvptank",2,"path_1")
			Mission.scion2 = BuildObject("fvsent",2,"path_2")
			Mission.scion3 = BuildObject("fvptank",2,"enemy1")
			Mission.scion4 = BuildObject("fvsent",2,"enemy2")
			Mission.scion5 = BuildObject("fvptank",2,"enemy3")
			Mission.scion6 = BuildObject("fvsent",2,"enemy4")

			Attack(Mission.scion1,Mission.scav1)
			Follow(Mission.scion2,Mission.scion1,0)
			Goto(Mission.scion3,"main_path1",0)
			Follow(Mission.scion4,Mission.scion3,0)
			Goto(Mission.scion5,"main_path2",0)
			Follow(Mission.scion6,Mission.scion5,0)

			--Attack(Mission.scion1,Mission.scav1)
			--Follow(Mission.scion2,Mission.scion1)
			--Attack(Mission.scion3,Mission.recycler)
			--Follow(Mission.scion4,Mission.scion3)
			--Goto(Mission.scion5,Mission.recycler)
			--Follow(Mission.scion6,Mission.scion5)

			Mission.next_wave = GetTime() + 1.0

			Mission.major_wave = true
		end
	end
	--------------------------------------------


	-- this is making the last wave attack the Mission.recycler

	if ((not Mission.major_attack) and (Mission.major_wave) and (Mission.next_wave < GetTime())) then
	
		Mission.next_wave = GetTime() + 1.0

		if (IsAlive(Mission.scion3)) then
		
			if ((not Mission.major1_attack) and (GetDistance(Mission.scion3,Mission.recycler) < 50))   then
			
				Attack(Mission.scion3,Mission.recycler,0)
				Mission.major1_attack = true
			end
		
		elseif (IsAlive(Mission.scion4)) then
		
			Attack(Mission.scion4,Mission.recycler,0)
			Mission.major1_attack = true
		end


		if (IsAlive(Mission.scion5)) then
		
			if ((not Mission.major2_attack) and (GetDistance(Mission.scion5,Mission.recycler) < 50))  then
			
				Attack(Mission.scion5,Mission.recycler,0)
				Mission.major2_attack = true
			end
		
		elseif (IsAlive(Mission.scion6)) then
		
			Attack(Mission.scion6,Mission.recycler,0)
			Mission.major2_attack = true
		end


		if ((Mission.major1_attack) and (Mission.major2_attack)) then
		
			Mission.major_attack = true
		end
	end
	--------------------------------------------


	-- this is checking to see when the last wave is dead

	if ((not Mission.last_wave_dead) and (Mission.major_wave)) then
	
		if ((not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3)) and
			(not IsAlive(Mission.scion4)) and (not IsAlive(Mission.scion5)) and (not IsAlive(Mission.scion6))) then 
		
			Mission.next_wave = GetTime() + 3.0
			Mission.major_attack = true
			Mission.last_wave_dead = true
		end
	end
	--------------------------------------------


----------------------/ Mission.ON_HOLD --------------------------------------/
end
--[[
if ((not Mission.last_wave_dead) and (GetDistance(Mission.player,Mission.pool) < 200.0)) then

	RemoveObject(Mission.shabayev)
	RemoveObject(Mission.manson)
	RemoveObject(Mission.wing1)
	RemoveObject(Mission.wing2)
	RemoveObject(Mission.tug1)
	RemoveObject(Mission.tug2)
	RemoveObject(Mission.tug_drop)
	RemoveObject(Mission.recy_drop)
	Mission.next_wave = GetTime() + 1.0
	Mission.remove_shab = true
	Mission.last_wave_dead = true
end
]]

--if (not Mission.ON_HOLD) then
--
------------------------------------------------------------------------

	if (Mission.get_to_armo) then
	
		SetScrap(1,38)
	end

	-- this is braddock ordering Cooke to the Mission.armory

	if ((Mission.last_wave_dead) and (not Mission.gun_picked)) then
	
		if ((not Mission.get_to_armo) and (Mission.next_wave < GetTime())) then
		
			--Matrix pos
			--GetPosition(Mission.recycler,pos)
			--RemoveObject(Mission.recycler)
			--Mission.recycler = BuildObject("ibrecy4x",1,pos)

			Mission.talk = AudioMessage("isdf0418.wav")--(brad) Get to the Mission.armory boynot 
			ClearObjectives()
			AddObjective("isdf0409.otf", "WHITE")
			Mission.power_up = BuildObject("apsnip",1,"gun_spawn")
			SetObjectiveOn(Mission.power_up)
			tempstr = TranslateString("Mission0402")  -- Sniper Tracer
			SetObjectiveName(Mission.power_up,tempstr)
			Mission.power_up_check = GetTime() + 180.0
			Mission.next_wave = GetTime() + 999999.9
			Mission.get_to_armo = true
		end

		if ((not Mission.shepards_message) and (Mission.get_to_armo)) then
		
			Mission.talk = AudioMessage("isdf0417.wav")--(Mission.manson) Shepards are in place sir
			Mission.shepards_message = true
		end
		

		if ((Mission.shepards_message) and (IsAudioMessageDone(Mission.talk))) then
		
			if ((not Mission.power_up_message) and (GetDistance(Mission.player,Mission.power_up) < 100.0)) then
			
				Mission.talk = AudioMessage("isdf0445.wav")--(braddock) get out of your ship
				Mission.power_up_message = true
			end			


			if ((not Mission.gun_warning) and (not Mission.gun_picked) and (Mission.power_up_check < GetTime())) then
			
				Mission.talk = AudioMessage("isdf0442.wav")--(brad) why havent you picked up the power-up?not 
				Mission.power_up_check = GetTime() + 180.0
				Mission.gun_warning = true
			end
		end


		if ((Mission.get_to_armo) and (not Mission.gun_picked) and (not IsAround(Mission.power_up))) then
		
			StopAudioMessage(Mission.talk)
			Mission.talk = AudioMessage("isdf0419.wav")--(brad) good - go to nav
			Mission.bunker_nav = BuildObject("ibnav",1,"bunk_nav_spawn")
			SetObjectiveOn(Mission.bunker_nav)
			tempstr = TranslateString("Mission0403")  -- Relay Bunker
			SetObjectiveName(Mission.bunker_nav,tempstr)
			ClearObjectives()
			AddObjective("isdf0409.otf", "GREEN")
			AddObjective("isdf0410.otf", "WHITE")
			Mission.john_check = GetTime() + 5.0
			Mission.john_dilly = GetTime() + 300.0
			Mission.power_up_check = GetTime() + 999999.9

			if (IsAlive(Mission.turret1)) then
			
				Stop(Mission.turret1)
			end
			if (IsAlive(Mission.turret2)) then
			
				Stop(Mission.turret2)
			end
			if (IsAlive(Mission.turret3)) then
			
				Stop(Mission.turret3)
			end
			if (IsAlive(Mission.turret4)) then
			
				Stop(Mission.turret4)
			end
			if (IsAlive(Mission.turret5)) then
			
				Stop(Mission.turret5)
			end

			Mission.gun_picked = true
		end
	end
	--------------------------------------------


	-- checking to see if the Mission.player gets to the bunker then

	if ((not Mission.john_at_bunk) and (not Mission.john_bunker_warn) and (Mission.john_dilly < GetTime())) then
	
		Mission.talk = AudioMessage("isdf0425.wav")--(brad) Get to that nav nownot not 
		ClearObjectives()
		AddObjective("isdf0410.otf", "WHITE")
		Mission.john_dilly = GetTime() + 120.0
		Mission.john_bunker_warn = true
	end


	-- this is after Cooke gets to the bunker

	if ((Mission.gun_picked) and (not Mission.john_at_bunk) and (Mission.john_check < GetTime())) then
	
		Mission.john_check = GetTime() + 2.0

		if ((not Mission.john_on_way) and (GetDistance(Mission.player,Mission.field_cbunk) < 200.0)) then
		
			Mission.talk = AudioMessage("isdf0427.wav")--(Mission.manson) flock in on the waynot 
			Mission.enemy_spawn_time = GetTime() + 1.0
			Mission.john_on_way = true
		end

		if (GetDistance(Mission.player,Mission.field_cbunk) < 50.0) then
		
			Mission.talk = AudioMessage("isdf0428.wav")--(brad) Get into that bunker nownot not 
			ClearObjectives()
			AddObjective("isdf0410.otf", "GREEN")
			Mission.john_dilly = GetTime() + 999999.9
			Mission.john_at_bunk = true
		end
	end
	--------------------------------------------


	-- this is when the Mission.player gets into the bunker

	if ((not Mission.state_mission) and (Mission.john_at_bunk) and (Mission.player_on_foot) and (InBuilding(Mission.player))) then
	
		Mission.talk = AudioMessage("isdf0430b.wav")--(brad) you have to tag an enemy
		Mission.state_mission = true
	end
	--------------------------------------------


	-- building the enemy convoy

	if ((Mission.state_mission) and (not Mission.convoy_spawn) and (Mission.enemy_spawn_time < GetTime())) then
	
		Mission.enemy_spawn_time = GetTime() + 1.0

		if (GetDistance(Mission.player,"scion1_spawn") > 200.0) then
		
			snipe_scion1 = BuildObject("fvpsnt4",2,"scion1_spawn")
			snipe_scion2 = BuildObject("fvpsnt4",2,"scion2_spawn")
			snipe_scion3 = BuildObject("fvpsnt4",2,"scion3_spawn")
			snipe_scion4 = BuildObject("fvpsnt4",2,"scion4_spawn")
			snipe_scion5 = BuildObject("fvpsnt4",2,"scion5_spawn")
			--Mission.hauler1 = BuildObject("fvtug",2,"hauler1_spawn")
			--Mission.hauler2 = BuildObject("fvtug",2,"hauler2_spawn")

			Stop(snipe_scion1)
			Stop(snipe_scion2)
			Stop(snipe_scion3)
			Stop(snipe_scion4)
			Stop(snipe_scion5)
			--Stop(Mission.hauler1)
			--Stop(Mission.hauler2)

			SetAvoidType(snipe_scion1,0)
			SetAvoidType(snipe_scion2,0)
			SetAvoidType(snipe_scion3,0)
			SetAvoidType(snipe_scion4,0)
			SetAvoidType(snipe_scion5,0)
			--SetAvoidType(Mission.hauler1,0)
			--SetAvoidType(Mission.hauler2,0)

			Mission.convoy_spawn = true
		end
	end
	--------------------------------------------


	-- this is where I have to send the convoy past the comm bunker

	if ((Mission.convoy_spawn) and (not Mission.haulers_underway) and (IsAudioMessageDone(Mission.talk))) then
	
--[[
		Retreat(Mission.hauler1,"escape_path")
		Follow(Mission.hauler2,Mission.hauler1)
		Follow(Mission.scion1,Mission.hauler1)
		Follow(Mission.scion2,Mission.scion1)
		Follow(Mission.scion3,Mission.hauler2)
		Follow(Mission.scion4,Mission.scion3)
		Follow(Mission.scion5,Mission.scion4)
]]
		Retreat(snipe_scion1,"escape_path1")
		Follow(snipe_scion2,snipe_scion1)
		Follow(snipe_scion3,snipe_scion1)
		Follow(snipe_scion4,snipe_scion2)
		Follow(snipe_scion5,snipe_scion3)

		Mission.convoy_check = GetTime() + 1.0
		Mission.haulers_underway = true
	end
	--------------------------------------------


	-- this is the scion convoy code

	if (not Mission.ship_sniped) then
	
		if ((not Mission.to_escape) and (Mission.haulers_underway) and (Mission.convoy_check < GetTime())) then
		
			Mission.convoy_check = GetTime() + 1.0

			-- this is Mission.manson warning when the ships are almost at the target

			if ((not Mission.manson_message3) and (GetDistance(snipe_scion1,"hold_point") < 150.0)) then
			
				Mission.talk = AudioMessage("isdf0429.wav")--(Mission.manson) Here they come
				Mission.manson_message3 = true
			end
			
			-- this is the scions stopping and morphing

			if  ((not Mission.convoy_hold) and (GetDistance(snipe_scion1,"hold_point") < 20.0)) then
			
				LookAt(snipe_scion1,snipe_scion5)
				Mission.convoy_wait_time = GetTime() + 15.0
				Mission.convoy_hold = true
			end

			--if ((Mission.convoy_hold) and (not Mission.to_escape) and (Mission.convoy_wait_time < GetTime())) then
			--
			--	Retreat(Mission.scion5,"escape_path2")
			--	Follow(Mission.scion1,Mission.scion5)
			--	Follow(Mission.scion2,Mission.scion5)
			--	Follow(Mission.scion3,Mission.scion1)
			--	Follow(Mission.scion4,Mission.scion2)
			--	Mission.to_escape = true
			--end
		end

		-- this is triggering the final movie

		if ((Mission.to_escape) and (not Mission.end_escape) and (GetNearestEnemy(Mission.scion_drop) < 60.0)) then
		
			if (IsAround(snipe_scion1)) then
			
				Follow(snipe_scion1,Mission.scion_drop)
			end
			if (IsAround(snipe_scion2)) then
			
				Follow(snipe_scion2,Mission.scion_drop)
			end
			if (IsAround(snipe_scion3)) then
			
				Follow(snipe_scion3,Mission.scion_drop)
			end
			if (IsAround(snipe_scion4)) then
			
				Follow(snipe_scion4,Mission.scion_drop)
			end
			if (IsAround(snipe_scion5)) then
			
				Follow(snipe_scion5,Mission.scion_drop)
			end

			Mission.end_game_time = GetTime() + 60.0
			Mission.end_escape = true
		end
	end
	--------------------------------------------


	-- this is checking to see if the Mission.player snipes a ship then

	predead = 0
	if ((Mission.convoy_spawn) and (not Mission.ship_sniped)) then --and (Mission.player_on_foot)) then
	
		if ((not Mission.ship_sniped) and (IsAround(snipe_scion1))) then --(GetTime() - GetLastEnemyShot(Mission.scion1) < .2)) then
		
			predead=snipe_scion1
			if (not IsAlive(snipe_scion1)) then
			
				Mission.talk = AudioMessage("isdf0431a.wav")--(brad) nice shot pilotnot  Get back to your ship before you become roadkill

				pos = GetTransform(predead)
				RemoveObject(predead)
				snipe_scion1 = BuildObject("fvsentx",1,pos)
				SetAvoidType(snipe_scion1,0)
				SetObjectiveOn(snipe_scion1)
				Mission.talk = AudioMessage("isdf0431a.wav")--(brad) nice shot pilotnot  Get back to your ship before you become roadkill
				Stop(snipe_scion1,1)
				tempstr = TranslateString("Mission0404")  -- Tagged
				SetObjectiveName(snipe_scion1,tempstr)
				SetPerceivedTeam(snipe_scion1,2)
				Mission.sniped_ship = snipe_scion1
				Mission.abandon_check = GetTime() + 2.1
				Mission.tag1 = true
				Mission.ship_sniped = true
			end
		end

		if ((not Mission.ship_sniped) and (IsAround(snipe_scion2))) then --(GetTime() - GetLastEnemyShot(Mission.scion2) < .2)) then
		
			predead=snipe_scion2
			if (not IsAlive(snipe_scion2)) then
			
				pos = GetTransform(predead)
				RemoveObject(predead)
				snipe_scion2 = BuildObject("fvsentx",1,pos)
				SetAvoidType(snipe_scion2,0)
				Mission.talk = AudioMessage("isdf0431a.wav")--(brad) nice shot pilotnot  Get back to your ship before you become roadkill
				Stop(snipe_scion2,1)
				SetObjectiveOn(snipe_scion2)
				tempstr = TranslateString("Mission0404")  -- Tagged
				SetObjectiveName(snipe_scion2,tempstr)
				SetPerceivedTeam(snipe_scion2,2)
				Mission.sniped_ship = snipe_scion2
				Mission.abandon_check = GetTime() + 2.1
				Mission.tag2 = true
				Mission.ship_sniped = true
			end
		end

		if ((not Mission.ship_sniped) and (IsAround(snipe_scion3))) then --(GetTime() - GetLastEnemyShot(Mission.scion3) < .2)) then
		
			predead=snipe_scion3
			if (not IsAlive(snipe_scion3)) then
			
				pos = GetTransform(predead)
				RemoveObject(predead)
				snipe_scion3 = BuildObject("fvsentx",1,pos)
				SetAvoidType(snipe_scion3,0)
				Mission.talk = AudioMessage("isdf0431a.wav")--(brad) nice shot pilotnot  Get back to your ship before you become roadkill
				Stop(snipe_scion3,1)

				SetObjectiveOn(snipe_scion3)
				tempstr = TranslateString("Mission0404")  -- tagged
				SetObjectiveName(snipe_scion3,tempstr)
				SetPerceivedTeam(snipe_scion3,2)
				Mission.sniped_ship = snipe_scion3
				Mission.abandon_check = GetTime() + 2.1
				Mission.tag3 = true
				Mission.ship_sniped = true
			end
		end


		if ((not Mission.ship_sniped) and (IsAround(snipe_scion4))) then --(GetTime() - GetLastEnemyShot(Mission.scion4) < .2)) then
		
			predead=snipe_scion4
			if (not IsAlive(snipe_scion4)) then
			
				pos = GetTransform(predead)
				RemoveObject(predead)
				snipe_scion4 = BuildObject("fvsentx",1,pos)
				SetAvoidType(snipe_scion4,0)
				Mission.talk = AudioMessage("isdf0431a.wav")--(brad) nice shot pilotnot  Get back to your ship before you become roadkill
				Stop(snipe_scion4,1)

				SetObjectiveOn(snipe_scion4)
				tempstr = TranslateString("Mission0404")  -- tagged
				SetObjectiveName(snipe_scion4,tempstr)
				SetPerceivedTeam(snipe_scion4,2)
				Mission.sniped_ship = snipe_scion4
				Mission.abandon_check = GetTime() + 2.1
				Mission.tag4 = true
				Mission.ship_sniped = true
			end
		end

		if ((not Mission.ship_sniped) and (IsAround(snipe_scion5))) then --(GetTime() - GetLastEnemyShot(Mission.scion5) < .2)) then
		
			predead=snipe_scion5
			if (not IsAlive(snipe_scion5)) then
			
				pos = GetTransform(predead)
				RemoveObject(predead)
				snipe_scion5 = BuildObject("fvsentx",1,pos)
				SetAvoidType(snipe_scion5,0)
				Mission.talk = AudioMessage("isdf0431a.wav")--(brad) nice shot pilotnot  Get back to your ship before you become roadkill
				Stop(snipe_scion5,1)
				SetObjectiveOn(snipe_scion5)
				tempstr = TranslateString("Mission0404")  -- tagged
				SetObjectiveName(snipe_scion5,tempstr)
				SetPerceivedTeam(snipe_scion5,2)
				Mission.sniped_ship = snipe_scion5
				Mission.abandon_check = GetTime() + 5.0--2.1
				Mission.tag5 = true
				Mission.ship_sniped = true
			end
		end
	end
	--------------------------------------------


	-- this occures when the Mission.player tags a ship

	if (Mission.ship_sniped) then
	
		-- this makes sure the sniped ship stays alive

		if (not Mission.sniped_destroyed) then
		
			if ((Mission.tag1) and (not IsAround(snipe_scion1))) then
			
				Mission.sniped_destroyed = true
			end
			if ((Mission.tag2) and (not IsAround(snipe_scion2))) then
			
				Mission.sniped_destroyed = true
			end
			if ((Mission.tag3) and (not IsAround(snipe_scion3))) then
			
				Mission.sniped_destroyed = true
			end
			if ((Mission.tag4) and (not IsAround(snipe_scion4))) then
			
				Mission.sniped_destroyed = true
			end
			if ((Mission.tag5) and (not IsAround(snipe_scion5))) then
			
				Mission.sniped_destroyed = true
			end
		end
		--------------------------------------------


		-- sending the scions after the comm bunker

		if ((not Mission.ships_defend) and (Mission.abandon_check < GetTime())) then
		
--[[
			if (Mission.tag1) then
			
				if (IsAlive(Mission.scion2)) then
				
					Goto(Mission.scion2,"hold_point")
				end
				if (IsAlive(Mission.scion3)) then
				
					Goto(Mission.scion3,"hold_point")
				end
				if (IsAlive(Mission.scion4)) then
				
					Goto(Mission.scion4,"hold_point")
				end
				if (IsAlive(Mission.scion5)) then
				
					Goto(Mission.scion5,"hold_point")
				end
			
			elseif (Mission.tag2) then
			
				if (IsAlive(Mission.scion1)) then
				
					Goto(Mission.scion1,"hold_point")
				end
				if (IsAlive(Mission.scion3)) then
				
					Goto(Mission.scion3,"hold_point")
				end
				if (IsAlive(Mission.scion4)) then
				
					Goto(Mission.scion4,"hold_point")
				end
				if (IsAlive(Mission.scion5)) then
				
					Goto(Mission.scion5,"hold_point")
				end
			
			elseif (Mission.tag3) then
			
				if (IsAlive(Mission.scion1)) then
				
					Goto(Mission.scion1,"hold_point")
				end
				if (IsAlive(Mission.scion2)) then
				
					Goto(Mission.scion2,"hold_point")
				end
				if (IsAlive(Mission.scion4)) then
				
					Goto(Mission.scion4,"hold_point")
				end
				if (IsAlive(Mission.scion5)) then
				
					Goto(Mission.scion5,"hold_point")
				end
			
			elseif (Mission.tag4) then
			
				if (IsAlive(Mission.scion1)) then
				
					Goto(Mission.scion1,"hold_point")
				end
				if (IsAlive(Mission.scion2)) then
				
					Goto(Mission.scion2,"hold_point")
				end
				if (IsAlive(Mission.scion3)) then
				
					Goto(Mission.scion3,"hold_point")
				end
				if (IsAlive(Mission.scion5)) then
				
					Goto(Mission.scion5,"hold_point")
				end
			
			elseif (Mission.tag5) then
			
				if (IsAlive(Mission.scion1)) then
				
					Goto(Mission.scion1,"hold_point")
				end
				if (IsAlive(Mission.scion2)) then
				
					Goto(Mission.scion2,"hold_point")
				end
				if (IsAlive(Mission.scion3)) then
				
					Goto(Mission.scion3,"hold_point")
				end
				if (IsAlive(Mission.scion4)) then
				
					Goto(Mission.scion4,"hold_point")
				end
			end
]]

			-- this is spawning in the cavelry

			Mission.friend1 = BuildObject("ivtank4",3,"friend1")
			Mission.friend2 = BuildObject("ivtank4",4,"friend2")
			Mission.friend3 = BuildObject("ivscout",4,"friend3")
			Mission.friend4 = BuildObject("ivscout",3,"friend4")
			--Mission.friend5 = BuildObject("ivscout",1,"friend5")
			--Mission.friend6 = BuildObject("ivscout",1,"friend6")

			Goto(Mission.friend1,Mission.field_cbunk)
			Goto(Mission.friend2,Mission.field_cbunk)
			Goto(Mission.friend3,Mission.field_cbunk)
			Goto(Mission.friend4,Mission.field_cbunk)
			--Goto(Mission.friend5,Mission.field_cbunk)
			--Goto(Mission.friend6,Mission.field_cbunk)

			SetAvoidType(Mission.friend1,0)
			SetAvoidType(Mission.friend2,0)
			SetAvoidType(Mission.friend3,0)
			SetAvoidType(Mission.friend4,0)
			--SetAvoidType(Mission.friend5,0)
			--SetAvoidType(Mission.friend6,0)

			Mission.convoy_check = GetTime() + 20.0
			Mission.ships_defend = true
		end
		--------------------------------------------


		-- this is the scions pulling out for the last time

		if ((Mission.ships_defend) and (not Mission.final_retreat) and (Mission.convoy_check < GetTime())) then
		
			if (IsAround(snipe_scion1)) then
			
				--SetPerceivedTeam(Mission.scion1,1)
				Retreat(snipe_scion1,"cattle_spot")
			end

			if (IsAround(snipe_scion2)) then
			
				--SetPerceivedTeam(Mission.scion2,1)
				Retreat(snipe_scion2,"cattle_spot")
			end

			if (IsAround(snipe_scion3)) then
			
				--SetPerceivedTeam(Mission.scion3,1)
				Retreat(snipe_scion3,"cattle_spot")
			end

			if (IsAround(snipe_scion4)) then
			
				--SetPerceivedTeam(Mission.scion4,1)
				Retreat(snipe_scion4,"cattle_spot")
			end

			if (IsAround(snipe_scion5)) then
			
				--SetPerceivedTeam(Mission.scion5,1)
				Retreat(snipe_scion5,"cattle_spot")
			end

			Mission.convoy_check = GetTime() + 8.0
			Mission.show_time = GetTime() + 1.0
			Mission.final_retreat = true
		end
		--------------------------------------------


		-- this is Mission.manson calling braddock

		if ((Mission.final_retreat) and (not Mission.manson_message4) and (Mission.convoy_check < GetTime())) then
		
			Mission.talk = AudioMessage("isdf0435.wav")--(Mission.manson) they're moving general

			if ((Mission.tag1) or (Mission.tag2) or (Mission.tag3) or (Mission.tag4) or (Mission.tag5)) then
			
				if (IsAlive(snipe_scion1)) then
				
					Retreat(snipe_scion1,"epath1")
				end
				if (IsAlive(snipe_scion2)) then
				
					Retreat(snipe_scion2,"epath2")
				end
				if (IsAlive(snipe_scion3)) then
				
					Retreat(snipe_scion3,"epath3")
				end
				if (IsAlive(snipe_scion4)) then
				
					Retreat(snipe_scion4,"epath4")
				end
				if (IsAlive(snipe_scion5)) then
				
					Retreat(snipe_scion5,"epath1")
				end
			end
--[[
			if (Mission.tag1) then
			
				if (IsAlive(Mission.scion2)) then
				
					Retreat(Mission.scion2,"epath2")
				end
				if (IsAlive(Mission.scion3)) then
				
					Retreat(Mission.scion3,"epath3")
				end
				if (IsAlive(Mission.scion4)) then
				
					Retreat(Mission.scion4,"epath4")
				end
				if (IsAlive(Mission.scion5)) then
				
					Retreat(Mission.scion5,"epath1")
				end
			
			elseif (Mission.tag2) then
			
				if (IsAlive(snipe_scion1)) then
				
					Retreat(snipe_scion1,"epath1")
				end
				if (IsAlive(Mission.scion3)) then
				
					Retreat(Mission.scion3,"epath3")
				end
				if (IsAlive(Mission.scion4)) then
				
					Retreat(Mission.scion4,"epath4")
				end
				if (IsAlive(Mission.scion5)) then
				
					Retreat(Mission.scion5,"epath2")
				end
			
			elseif (Mission.tag3) then
			
				if (IsAlive(snipe_scion1)) then
				
					Retreat(snipe_scion1,"epath1")
				end
				if (IsAlive(Mission.scion2)) then
				
					Retreat(Mission.scion2,"epath2")
				end
				if (IsAlive(Mission.scion4)) then
				
					Retreat(Mission.scion4,"epath4")
				end
				if (IsAlive(Mission.scion5)) then
				
					Retreat(Mission.scion5,"epath3")
				end
			
			elseif (Mission.tag4) then
			
				if (IsAlive(snipe_scion1)) then
				
					Retreat(snipe_scion1,"epath1")
				end
				if (IsAlive(Mission.scion2)) then
				
					Retreat(Mission.scion2,"epath2")
				end
				if (IsAlive(Mission.scion3)) then
				
					Retreat(Mission.scion3,"epath3")
				end
				if (IsAlive(Mission.scion5)) then
				
					Retreat(Mission.scion5,"epath4")
				end
			
			elseif (Mission.tag5) then
			
				if (IsAlive(snipe_scion1)) then
				
					Retreat(snipe_scion1,"epath1")
				end
				if (IsAlive(Mission.scion2)) then
				
					Retreat(Mission.scion2,"epath2")
				end
				if (IsAlive(Mission.scion3)) then
				
					Retreat(Mission.scion3,"epath3")
				end
				if (IsAlive(Mission.scion4)) then
				
					Retreat(Mission.scion4,"epath4")
				end
			end
]]
			Mission.convoy_check = GetTime() + 8.0
			Mission.manson_message4 = true
		end
		--------------------------------------------


		-- this is Mission.manson going after them

		if ((Mission.manson_message4) and (not Mission.manson_chase) and (Mission.convoy_check < GetTime())) then
		
			Mission.talk = AudioMessage("isdf0436.wav")--(braddock) stay with themnot 
			
			if (IsAround(Mission.scion1)) then
			
				SetPerceivedTeam(Mission.scion1,1)
			end
			if (IsAround(Mission.scion2)) then
			
				SetPerceivedTeam(Mission.scion2,1)
			end
			if (IsAround(Mission.scion3)) then
			
				SetPerceivedTeam(Mission.scion3,1)
			end
			if (IsAround(Mission.scion4)) then
			
				SetPerceivedTeam(Mission.scion4,1)
			end
			if (IsAround(Mission.scion5)) then
			
				SetPerceivedTeam(Mission.scion5,1)
			end


			if (IsAlive(Mission.friend1)) then
			
				Goto(Mission.friend1,"epath1")

				if (IsAlive(Mission.friend3)) then
				
					Follow(Mission.friend3,Mission.friend1)
				end

				if (IsAlive(Mission.friend2)) then
				
					Goto(Mission.friend2,"epath2")

					if (IsAlive(Mission.friend4)) then
					
						Follow(Mission.friend4,Mission.friend2)
					end
				
				elseif (IsAlive(Mission.friend4)) then
				
					Follow(Mission.friend4,Mission.friend1)
				end
			
			elseif (IsAlive(Mission.friend2)) then
			
				Goto(Mission.friend2,"epath1")

				if (IsAlive(Mission.friend3)) then
				
					Follow(Mission.friend3,Mission.friend2)
				end

				if (IsAlive(Mission.friend4)) then
				
					Follow(Mission.friend4,Mission.friend2)
				end
			
			elseif (IsAlive(Mission.friend3)) then
			
				Goto(Mission.friend3,"epath1")

				if (IsAlive(Mission.friend4)) then
				
					Follow(Mission.friend4,Mission.friend3)
				end
			
			elseif (IsAlive(Mission.friend4)) then
			
				Goto(Mission.friend4,"epath1")
			end

			Mission.convoy_check = GetTime() + 1.0
			Mission.manson_chase = true
		end
		--------------------------------------------


		-- this is triggering the final movie

		if ((not Mission.end_escape) and (Mission.manson_chase) and (Mission.convoy_check < GetTime())) then
		
			Mission.convoy_check = GetTime() + 1.0

			if (not Mission.one_there) then
			
				if (IsAlive(snipe_scion1)) then
				
					if (GetDistance(snipe_scion1,"show_time_point") < 30.0) then
					
						Mission.one_there = true
					end
				
				else
				
					Mission.one_there = true
				end
			end

			if (not Mission.two_there) then
			
				if (IsAlive(snipe_scion2)) then
				
					if (GetDistance(snipe_scion2,"show_time_point") < 30.0) then
					
						Mission.two_there = true
					end
				
				else
				
					Mission.two_there = true
				end
			end

			if (not Mission.three_there) then
			
				if (IsAlive(snipe_scion3)) then
				
					if (GetDistance(snipe_scion3,"show_time_point") < 30.0) then
					
						Mission.three_there = true
					end
				
				else
				
					Mission.three_there = true
				end
			end

			if (not Mission.four_there) then
			
				if (IsAlive(snipe_scion4)) then
				
					if (GetDistance(snipe_scion4,"show_time_point") < 30.0) then
					
						Mission.four_there = true
					end
				
				else
				
					Mission.four_there = true
				end
			end

			if (not Mission.five_there) then
			
				if (IsAlive(snipe_scion5)) then
				
					if (GetDistance(snipe_scion5,"show_time_point") < 30.0) then
					
						Mission.five_there = true
					end
				
				else
				
					Mission.five_there = true
				end
			end
		end


		if ((not Mission.end_escape) and (Mission.one_there) and (Mission.two_there) and (Mission.three_there) and (Mission.four_there) and (Mission.five_there)) then
		
			Mission.end_game_time = GetTime() + 60.0
			Mission.end_escape = true
		end
	end
	--------------------------------------------


	-- checking to see if any of the enemy ships get destroyed then

	if ((not Mission.ships_dead) and (Mission.ships_defend)) then
	
		if ((not IsAlive(Mission.scion5)) and (not IsAlive(Mission.scion4)) and (not IsAlive(Mission.scion3)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion1))) then
		
			Mission.ships_dead = true
		end
	end
	--------------------------------------------


	-- this is the ending movie

	if ((not Mission.start_end_show) and (Mission.show_time < GetTime())) then
	
		Mission.show_time = GetTime() + 1.0

		-- when the Mission.player gets there
		
		if (GetDistance(Mission.player,"show_time_point") < 120.0) then
		
			Mission.talk = AudioMessage("isdf0437.wav")--(Mission.manson) They're leaving
			Mission.end_game_time = GetTime() + 999999.9
			SetAnimation(Mission.scion_drop,"takeoff",1)
			CameraReady()
			Mission.start_movie = true
			Mission.start_end_show = true
		end
		--------------------------------------------


		-- if the ships get there and the Mission.player doesn't then

		if ((Mission.end_escape) and (Mission.end_game_time < GetTime())) then
		
			Mission.talk = AudioMessage("isdf0437.wav")--(Mission.manson) They're leaving
			Mission.end_game_time = GetTime() + 999999.9
			Mission.not_there = true
			Mission.start_end_show = true
		end
	end


	if (Mission.start_movie) then
	
		CameraPath("camera1_point",180,0,Mission.scion_drop)
	end


	-- this is the crumble cliff code

	if ((Mission.manson_message4) and (not Mission.cliff_fall)) then
	
		if (GetDistance(Mission.player,"cliff_point") < 30.0) then
		
			SetAnimation(Mission.crumble_cliff,"crumble",1)
			Mission.cliff_fall = true
		end
	end
	--------------------------------------------

--[[
	if ((Mission.ship_sniped) and (GetDistance(Mission.sniped_ship,Mission.scion_drop) < 100.0)) then
	
		if ((not Mission.start_movie) and (not Mission.not_there) and (Mission.end_game_time < GetTime())) then
		
			Mission.talk = AudioMessage("isdf0437.wav")--(Mission.manson) They're leaving
			Mission.not_there = true
			Mission.start_end_show = true
		end


		if ((not Mission.not_there) and (not Mission.start_movie)) then
		
			if (GetDistance(Mission.player,Mission.scion_drop) < 142.0) then
			
				Mission.talk = AudioMessage("isdf0437.wav")--(Mission.manson) They're leaving
				Mission.end_game_time = GetTime() + 999999.9
				Mission.start_movie = true
				Mission.start_end_show = true
			end
		end
	end


	if ((not Mission.ship_sniped) and (not Mission.brad_complain)) then
	
		Mission.talk = AudioMessage("isdf0432.wav")--(brad) our shooter missed the targetnot 
		Mission.brad_complain = true
		Mission.start_end_show = true
	end
]]

-- these are the win/loose conditions
if ((not Mission.game_over) and (not Mission.ON_HOLD)) then

	if ((Mission.scav1_a) and (not Mission.deployscav_a) and (not IsAlive(Mission.scav1))) then
	
		ClearObjectives()
		AddObjective("isdf0405.otf", "RED")
		FailMission(GetTime() + 5.0)
		Mission.game_over = true
	end

	if ((Mission.scav1_a) and (not IsAlive(Mission.scav1))) then
	
		ClearObjectives()
		AddObjective("isdf0405.otf", "RED")
		FailMission(GetTime() + 5.0)
		Mission.game_over = true
	end

	if (not IsAlive(Mission.recycler)) then
	
		ClearObjectives()
		AddObjective("isdf0408.otf", "RED")
		FailMission(GetTime() + 5.0)
		Mission.game_over = true
	end
	
	if ((not Mission.remove_shab) and (not IsAlive(Mission.shabayev))) then
	
		FailMission(GetTime() + 5.0)
		Mission.game_over = true
	end

	if ((not Mission.john_at_bunk) and (Mission.john_bunker_warn) and (Mission.john_dilly < GetTime())) then
	
		AudioMessage("isdf0426.wav")--(brad) Cooke - you are relieved of dutynot 
		FailMission(GetTime() + 5.0)
		Mission.game_over = true
	end

	if (Mission.start_end_show) then
	
		if ((Mission.brad_complain) and (IsAudioMessageDone(Mission.talk))) then
		
			AudioMessage("isdf0433.wav")--(Mission.manson) mission failed
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		end

		if ((Mission.not_there) and (IsAudioMessageDone(Mission.talk))) then
		
			AudioMessage("isdf0438.wav")--(Mission.manson) mission success
			SucceedMission(GetTime() + 7.0,"isdf04w1.txt")
			SetAnimation(Mission.scion_drop,"takeoff",1)
			Mission.game_over = true
		end

		-- this is the ending movie

		if ((Mission.start_movie) and (IsAudioMessageDone(Mission.talk))) then
		
			AudioMessage("isdf0438.wav")--(Mission.manson) mission success
			SucceedMission(GetTime() + 7.0,"isdf04w1.txt")
			Mission.game_over = true
		end
	end

	if (not Mission.remove_manson) then
	
		if ((not IsAlive(Mission.manson)) or (not IsAlive(Mission.wing1)) or (not IsAlive(Mission.wing2)))  then
		
			AudioMessage("isdf0426.wav")--(brad) Cooke - you are relieved of dutynot 
			FailMission(GetTime() + 5.0)
			Mission.game_over = true
		end
	end
--[[
	if (Mission.sniped_destroyed) then
	
		AudioMessage("isdf0446.wav")--(Mission.manson) the sniped ship is destroyednot 
		FailMission(GetTime() + 7.0)
		Mission.game_over = true
	end
]]
end

----------------------------------------------------------/
--end
----------------------------------------------------------/

end