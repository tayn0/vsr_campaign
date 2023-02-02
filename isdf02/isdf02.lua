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
	
	start_done = false,
	briefing_message = false,
	truck_lost = true,
	shab_message1 = false,
	find_truck_message = false,
	truck_lost_message = false,
	follow_player = false,
	first_warning = false,
	second_warning = false,
	recover_message = true,
	in_combat = false,
	at_truck_stop = false,
	wrong_message = false,
	player_lost = false,
	return_message1 = false,
	move_out = false,
	truck_following = false,
	wrong_person = false,
	at_base = false,
	caught_up = false,
	wait_message = false,
	to_shab1 = false,
	to_builder = false,
	shab_builder_detect = false,
	follow_off = false,
	builder_change = false,
	at_jammer = false,
	jammer_message = false,
	player_at_builder = false,
	jammer_built = false,
	builder_morph = false,
	jammer_dead = false,
	scrammbled_message = false,
	builder1_run = false,
	build_drone = false,
	remove_drone = false,
	drone_to_shab2 = false,
	drone_to_shab3 = false,
	drone_to_field = false,
	first_wave_built = false,
	first_wave_attack = false,
	shab_attack_jammer = false,
	dead_message = false,
	first_over = false,
	to_shab2 = false,
	after_first_message = false,
	builder1_run2 = false,
	builder1_to_shab2 = false,
	builder_morph1 = false,
	builder1_stop = false,
	show_ready = false,
	drone_run = false,
	make_switch = false,
	part_two = false,
	builder_dead = false,
	drone_dead =false,
	no_show = false,

	shab_message2 = false,
	show_over = false,
	to_shab2a = false,
	shab_message3 = false,
	temp_spawn = false,
	start_second_morph = false,
	reroute = false,
	start_show2 = false,
	in_range = false,
	end_show2 = false,
	second_over = false,
	combat2 = false,
	john_injured = false,
	john_full_health = false,
	shabayev_injured = false,
	shab_full_health = false,
	john_low_ammo = false,
	shab_low_ammo = false,
	repair_check1 = false,
	shab_injured = false,
	repairs_needed = false,
	repair_message1 = false,
	repair_message2 = false,
	repair_message3 = false,
	john_over_shab = false,
	shab_over_john = false,
	keep_moving_message = false,
	on_to_base = false,
	truck_wait = false,
	move_to_center = false,
	endbase_detected = false,
	hit_hard_message = false,
	at_center = false,
	game_over = false,
	all_clear = false,
	surprise_spawn = false,
	surprise_attack = false,
	surprise_successful = false,
	last_morph = false,
	last_attack = false,
	truck_message = false,
	ship_destroyed = true,
	shab_to_ship = false,
	shab_get_in = false,
	shab_in_ship = false,
	shab_to_ship = false,
	shab_get_in = false,
	shab_in_ship1 = false,
	shab_in_ship2 = false,
	shab_in_ship3 = false,
	shab_in_ship4 = false,
	john_in_ship = false,
	bool_dump = false,
	truck_ready = false,
	free_truck = false,
	at_base_center = false,
	selected_message = false,
	make_jammer = false,
	jammer_sets = false,
	come_here = false,
	cheat1 = false,
	cheat2 = false,
	dead_now_message = false,
	move_on = false,
	scion_message = false,
	bert = false,
	return_message = false,
	repair_done = false,
	at_player = false,
	watch_player = false,
	shab_to_point = false,
	shab_at_point = false,
	shab_follow_build = false,
	at1 = false,
	at2 = false,
	at3 = false,
	reroute1 = false,
	reroute2 = false,
	reroute3 = false,
	jammer2_dead = false,
	after_second_check = false,
	come_here2 = false,
	shab_at_jam2 = false,
	scrammbled_message2 = false,
	scavs_found = false,
	after_scavs = false,
	free_temp = false,
	got_it_message = false,
	jammer2_dead_message = false,
	three_to_go = false,
	two_to_go = false,
	one_to_go = false,
	mistake = false,
	goose = false,
	temp_patrol = false,
	temp_change = false,
	made_cheat = false,
	shab_out = false,
	shab_hop_out = false,
	shab_to_con = false,
	shab_in = false,
	prep_cons = false,
	to_power_spot = false,
	base_powered = false,
	shab_dead = false,
	cons_dead = false,
	last_wave_dead = false,
	shab_find_con = false,
	shab_first = false,
	truck_explain = false,
	plan = false, plan2 = false,
	attack_last_turret1 = false,
	attack_last_turret2 = false,
	on_to_construct = false,
	return_to_base = false,
	last_turret1_dead = false,
	new_prep = false,
	startup_over = false,
	con_switch = false,
	turrets_stop = false,
	extra_help = false,
	service_scout = false,
	movie1 = false,
	firstFrame = false,
	pole3_switch = false,
	pole4_switch = false,
	pole5_switch = false,
	pole6_switch = false,
	pole7_switch = false,
	pole8_switch = false,
	pole9_switch = false,
	pole10_switch = false,
	pole11_switch = false,
	stop_service = false,
	shab_switch = false,

--  floats
	briefing_time = 999999.9,
	message1_time = 999999.9,
	truck_check = 999999.9,
	find_truck_message_time = 999999.9,
	wait1_time = 1.0,
	check1_time = 999999.9,
	move_time = 999999.9,
	player_check = 999999.9,
	player_lost_time = 999999.9,
	first_warning_time = 180.0,
	builder_change_time = 999999.9,
	player_builder_check = 999999.9,
	jammer_build_time = 999999.9,
	jammer_message_time = 999999.9,
	builder_run_check = 999999.9,
	builder_run_time = 999999.9,
	morphing_time = 999999.9,
	drone_time = 999999.9,
	remove_drone_time = 999999.9,
	dead_jammer_message = 999999.9,
	list_time = 999999.9,
	get_truck_time = 999999.9,
	combat_check = 999999.9,
	morph_time = 999999.9,
	show_ready_time = 999999.9,

	encounter1_check = 999999.9,
	checkpoint2_check = 999999.9,
	show2_start_time = 999999.9,
	onto_base_time = 999999.9,
	center_check = 999999.9,
	safe_check = 999999.9,
	ship_destroyed_time = 999999.9,
	shab_check = 999999.9,
	trucker_time = 999999.9,
	shabalab = 999999.9,
	fire_check = 999999.9,
	service_time = 999999.9,
	look_time = 999999.9,
	watch_player_time = 999999.9,
	point_check = 999999.9,
	spawn_time = 999999.9,
	sue_check = 999999.9,
	change_time = 999999.9,
	start_cheat = 999999.9,
	prep_wait = 999999.9,
	con_wait = 999999.9,
	pole3_time = 999999.9,
	pole4_time = 999999.9,
	pole5_time = 999999.9,
	pole6_time = 999999.9,
	pole7_time = 999999.9,
	pole8_time = 999999.9,
	pole9_time = 999999.9,
	pole10_time = 999999.9,
	pole11_time = 999999.9,
	service_time2 = 999999.9,


--  handles
	player,

	shab,
	shab2,
	truck_command,
	ship1,
	ship2,
	ship3,
	ship4,	
	truck,
	armory,
	--tech_center,
	--startbase_cbunk,
	endbase_cbunk,
	field_cbunk,
	builder1,
	dead_scav1,
	dead_scav2,
	cons,
	last_turret1,
	last_turret2,
	dead_power1,
	dead_power2,
	pole3,
	pole4,
	pole5,
	pole6,
	pole7,
	pole8,
	pole9,
	pole10,
	pole11,
	look_pole,
	holder,
	temp_shabayev,
	off_gen,
	temp_check,
	shabayev,
	player_ship,
	jammer,
	drone,
	scion1,
	scion2,
	scion3,
	leader,
	fixing,
	new_power,
	new_armory,
	jammer2,
	tester,
	base_power,

	temp1,
	temp2,
	temp3,
	blah = 0,
	talk = 0,
	garbble = 0,
	cheat,
	pilot,


--  integers
	x,
	y,
	x1,
	y1,
	a1,
	b1,
	x2,
	y2,
	a2,
	b2
   
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

--  handles
	Mission.player = GetPlayerHandle()

	Mission.shab = GetHandle("shab")
	Mission.shab2 = nil
	Mission.truck_command = nil
	Mission.ship1 = GetHandle("ship1")
	Mission.ship2 = GetHandle("ship2")
	Mission.ship3 = GetHandle("ship3")
	Mission.ship4 = GetHandle("ship4")	
	Mission.truck = GetHandle("truck")
	Mission.armory = GetHandle("armory")
	--tech_center = GetHandle("tech_center")
	--startbase_cbunk = GetHandle("startbase_cbunk")
	Mission.endbase_cbunk = GetHandle("endbase_cbunk")
	Mission.field_cbunk = GetHandle("field_cbunk")
	Mission.builder1 = GetHandle("builder1")
	Mission.dead_scav1 = GetHandle("dead_scav1")
	Mission.dead_scav2 = GetHandle("dead_scav2")
	Mission.cons = GetHandle("construct")
	Mission.last_turret1 = GetHandle("last_turret1")
	Mission.last_turret2 = GetHandle("last_turret2")
	Mission.dead_power1 = GetHandle("dead_power1")
	Mission.dead_power2 = GetHandle("dead_power2")
	Mission.pole3 = GetHandle("pole3")
	Mission.pole4 = GetHandle("pole4")
	Mission.pole5 = GetHandle("pole5")
	Mission.pole6 = GetHandle("pole6")
	Mission.pole7 = GetHandle("pole7")
	Mission.pole8 = GetHandle("pole8")
	Mission.pole9 = GetHandle("pole9")
	Mission.pole10 = GetHandle("pole10")
	Mission.pole11 = GetHandle("pole11")
	Mission.look_pole = GetHandle("look_pole")
	

	Mission.ship1 = UnitToVSR(Mission.ship1, "ivscout_vsr", 0)
	RemovePilot(Mission.ship1)
	SetLabel(Mission.ship1, "ship1")
	GiveWeapon(Mission.ship1,"gshadowvsr_c")
	
	Mission.ship2 = UnitToVSR(Mission.ship2, "ivscout_vsr", 0)
	RemovePilot(Mission.ship2)
	SetLabel(Mission.ship2, "ship2")


	Mission.ship3 = UnitToVSR(Mission.ship3, "ivscout_vsr", 0)
	RemovePilot(Mission.ship3)
	SetLabel(Mission.ship3, "ship3")


	Mission.ship4 = UnitToVSR(Mission.ship4, "ivscout_vsr", 0)
	RemovePilot(Mission.ship4)
	SetLabel(Mission.ship4, "ship4")


	Mission.tank = UnitToVSR(GetHandle("unnamed_ivtank"), "ivtank_vsr", 0)
	RemovePilot(Mission.tank)
	SetTeamNum(Mission.tank, 0)

   
   PreloadODF("fvpcon")
   PreloadODF("ivcons2")
   PreloadODF("ivpscou")
   PreloadODF("fvpsnt")
end



function UnitToVSR(h, odf, player)

	PlayerTeam = GetTeamNum(h)
	xfrm = GetTransform(h)
	RemoveObject(h)
	h = BuildObject(odf, PlayerTeam, xfrm)

	if player == 1 then
	SetAsUser(h, PlayerTeam)
	else
	end

	return h

end

function AddObject(h) --This function is called when an object appears in the game. --

	if ((not Mission.jammer_built) and (Mission.jammer == nil) and (IsOdf(h,"fbpjam"))) then
	
		Mission.jammer = h
		Mission.jammer_built = true
	
	elseif ((Mission.cheat == nil) and (IsOdf(h,"ivpscou"))) then
	
		Mission.cheat = h
		Mission.start_cheat = GetTime() + 15.0
		Mission.made_cheat = true
	
	elseif ((Mission.shab_hop_out) and (Mission.shab2 == nil) and (IsOdf(h,"ispilo"))) then
	
		if (GetDistance(h,Mission.shabayev) < 10.0) then
		
			Mission.shab2 = h
			SetGroup(Mission.shab2,-1)
			SetTeamNum(Mission.shab2,1)
			Mission.shab_out = true
		end
	
	elseif (IsOdf(h,"fspilo")) then
	
		Mission.pilot = h
		Damage(Mission.pilot,101)
		--RemoveObject(Mission.pilot)
	
	elseif ((Mission.shab_in) and (Mission.base_power == nil) and (IsOdf(h,"ibpgn1"))) then
	
		Mission.base_power = h
		Mission.base_powered = true
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

		Mission.player = GetPlayerHandle()

	-- this swithes out the constructors

	if (not Mission.con_switch) then
	
		--RemoveObject(Mission.last_turret2)
		RemoveObject(Mission.cons)
		RemoveObject(Mission.builder1)
		Mission.builder1 = BuildObject("fvpcon",2,"thai_spawn")
		--Mission.builder1 = BuildObject("fvpcon",2,"jammer_spawn")
		Mission.cons = BuildObject("ivcons2",0,"con_spawn")
		Mission.con_switch = true
	end
	------------------------------------------/

	if (not Mission.player_at_builder) then
	
		LookAt(Mission.builder1,Mission.player)
	end


----------------------------------------------------------------------
if (not Mission.ON_HOLD) then

----------------------------------------------------------------------


	
	-- this is what happens when the Mission.player gets lost
	
	if (Mission.player_lost) then
	
		if (not Mission.return_message) then
		
			AudioMessage("isdf0206.wav") -- (Mission.shab) do you want to join me
			Mission.player_check = GetTime() + 1.5
			Mission.player_lost_time = GetTime() + 120.0
			Mission.return_message1 = false
			Mission.return_message = true
		end


		if (Mission.return_message) then
		
			if ((not Mission.return_message1) and (Mission.player_lost_time < GetTime())) then
			
				AudioMessage("isdf0208.wav") -- (Mission.shab) this is the last warning to return john
				Mission.player_check = GetTime() + 3.0
				Mission.player_lost_time = GetTime() + 300.0
				Mission.return_message1 = true
			end


			if ((not Mission.game_over) and (Mission.player_check < GetTime())) then
			
				Mission.player_check = GetTime() + 1.5


				if (GetDistance(Mission.shabayev,Mission.player) < 100.0) then
				
					Mission.player_check = GetTime() + 999999.9
					Mission.player_lost_time = GetTime() + 999999.9
					Mission.return_message = false
					Mission.player_lost = false
				end
			end
		end
	end
	------------------------------------------/

	
	-- this is checking to make sure the Mission.player does not attack his wingman --------/

	if ((not Mission.in_combat) and (not Mission.startup_over)) then
	
		if (Mission.fire_check < GetTime()) then
		
			if ((IsAlive(Mission.shabayev)) and (IsAlive(Mission.player))) then
			
				if (GetTime() - GetLastFriendShot(Mission.shabayev) < .2) then
				
					AudioMessage("ff02.wav") -- (Mission.shab) watch your firing!
					Mission.fire_check = GetTime() + 2.0
				end
			end


			if ((IsAlive(Mission.truck)) and (IsAlive(Mission.player))) then
			
				if (GetTime() - GetLastFriendShot(Mission.truck) < .2) then
				
					AudioMessage("ff02.wav") -- (truck) watch your firing!
					Mission.fire_check = GetTime() + 2.0
				end
			end
		end
	end
	------------------------------------------/


	-- this keeps people alive for a time

	if ((not Mission.at_base) and (IsAlive(Mission.shabayev)) and (GetCurHealth(Mission.shabayev) < 100)) then
	
		AddHealth(Mission.shabayev, 100)
	end

	-- this keeps the Mission.builder1 alive for a time

	if ((not Mission.part_two) and (IsAlive(Mission.builder1)) and (GetHealth(Mission.builder1) < 0.8)) then
	
		AddHealth(Mission.builder1, 100)
	end

	-- this is the code that checks to see if john or Mission.shab are injured then

	if ((IsAround(Mission.player_ship)) and (not Mission.john_injured)) then
	
		if (GetCurHealth(Mission.player_ship) < 500) then
		
			Mission.john_injured = true
			Mission.john_full_health = false
		end
	end
	------------------------------------------/


	-- this is checking to see if the Mission.player and Mission.shab are injured then
	
	if ((IsAround(Mission.player_ship)) and (Mission.john_injured)) then
	
		if (GetCurHealth(Mission.player_ship) > 1600) then
		
			Mission.john_injured = false
		end
	end

	if ((Mission.free_truck) and (IsAlive(Mission.shabayev)) and (not Mission.shabayev_injured)) then
	
		if (GetCurHealth(Mission.shabayev) < 1100) then
		
			Mission.shabayev_injured = true
			Mission.shab_full_health = false
		end
	end

	if ((IsAlive(Mission.shabayev)) and (Mission.shabayev_injured)) then
	
		if (GetCurHealth(Mission.shabayev) > 1700) then
		
			Mission.shabayev_injured = false
		end
	end

	if ((IsAround(Mission.player_ship)) and (not Mission.john_low_ammo)) then
	
		if (GetCurAmmo(Mission.player_ship) < 500) then
		
			Mission.john_low_ammo = true
			Mission.john_full_health = false
		end
	end

	if ((IsAround(Mission.player_ship)) and (Mission.john_low_ammo)) then
	
		if (GetCurAmmo(Mission.player_ship) > 1400) then
		
			Mission.john_low_ammo = false
		end
	end

	if ((IsAlive(Mission.shabayev)) and (not Mission.shab_low_ammo)) then
	
		if (GetCurAmmo(Mission.shabayev) < 500) then
		
			Mission.shab_low_ammo = true
			Mission.shab_full_health = false
		end
	end

	if ((IsAlive(Mission.shabayev)) and (Mission.shab_low_ammo)) then
	
		if (GetCurAmmo(Mission.shabayev) > 1000) then
		
			Mission.shab_low_ammo = false
		end
	end

	if ((not Mission.john_injured) and (not Mission.john_low_ammo)) then
	
		Mission.john_full_health = true
	end

	if ((not Mission.shabayev_injured) and (not Mission.shab_low_ammo)) then
	
		Mission.shab_full_health = true
	end
	------------------------------------------/


	-- this controls where Mission.shab is looking
	
	if (Mission.look_time < GetTime()) then
	
		if (not Mission.at_player) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.look_time = GetTime() + 13.0
			Mission.at_player = true
		
		elseif (IsAlive(Mission.truck)) then
		
			LookAt(Mission.shabayev,Mission.truck)
			Mission.look_time = GetTime() + 9.0
			Mission.at_player = false
		end
	end
	------------------------------------------/


	-- this keep Mission.shab from running out of ammo

	if ((Mission.in_combat) and (GetCurAmmo(Mission.shabayev) < 100)) then
	
		SetCurAmmo(Mission.shabayev,100)
	end
	------------------------------------------/


--[[
This area will hold the opening cineractive plus the code that will make
Mission.shabayev have the service truck repair some of the other ships.
]]


 -- this is NEW code to make sure the truck is following john

	
	if (not start_done) then
	
		Stop(Mission.truck)
		SetGroup(Mission.shab,-1)
		SetTeamNum(Mission.shab,1)
		SetGroup(Mission.truck,-1)
		SetTeamNum(Mission.truck,1)
		ClearObjectives()
		AddObjective("to_ship.otf", "WHITE")
		SetPerceivedTeam(Mission.builder1,1)
		Ally(3,1)
		Ally(1,3)
		Build(Mission.builder1,"fbpjam")
		Mission.truck_check = GetTime() + 0.5
		Mission.player_check = GetTime() + 5.0
		Mission.briefing_time = GetTime() + 1.0
		Mission.first_warning_time = GetTime() + 300.0
		Mission.player_builder_check = GetTime() + 5.0
		Mission.fire_check = GetTime() + 1.0
		AudioMessage("isdf0263.wav") -- (Mission.shab) ok, follow me
		start_done = true
	end


	-- this makes the service truck repair the wounded shout

	if ((not Mission.service_scout) and (GetDistance(Mission.player,Mission.truck) < 100.0)) then
	
		Mission.holder = BuildObject("stayput",0,Mission.ship4)
		Damage(Mission.ship4,200)
		Service(Mission.truck,Mission.ship4,1)
		Mission.service_time2 = GetTime() + 5.0
		Mission.service_scout = true
	end
	------------------------------------------/


	-- this turns off the service truck

	if ((Mission.service_scout) and (not Mission.stop_service) and (Mission.service_time2 < GetTime())) then
	
		SetCurHealth(Mission.ship4,1800)
		LookAt(Mission.truck,Mission.player)
		RemoveObject(Mission.holder)
		Mission.service_time2 = GetTime() + 999999.9
		Mission.stop_service = true
	end
	------------------------------------------/


	-- this is sending the Mission.pilot Mission.shab to here ship and the truck in motion
	
	if ((IsAlive(Mission.shab)) and (not Mission.shab_to_ship)) then
	
		Retreat(Mission.shab,"shab_run_path2")


		--if (IsAlive(truck)) then
		--
		--	Goto(truck,"truck_move",1)
		--end

		Mission.trucker_time = GetTime() + 1.0
		Mission.shab_to_ship = true
	end
	------------------------------------------/
	

	-- this is checking to see when Mission.shab is in her ship

	if ((not IsAround(Mission.shab)) and (Mission.shab_to_ship) and (not Mission.shab_in_ship)) then
	
		temp = Mission.ship1


		if ((IsAlive(temp)) and (temp ~= Mission.player)) then
		
			Mission.temp_shabayev = GetHandle("ship1")
			SetGroup(Mission.temp_shabayev,-1)
			LookAt(Mission.temp_shabayev,Mission.player)
			SetObjectiveOn(Mission.temp_shabayev)
			SetObjectiveName(Mission.temp_shabayev,"Cmd. Shabayev")
			Mission.shab_in_ship1 = true
			Mission.shab_in_ship = true
		
		else
		
			temp = Mission.ship2


			if ((IsAlive(temp)) and (temp ~= Mission.player)) then
			
				Mission.temp_shabayev = GetHandle("ship2")
				SetGroup(Mission.temp_shabayev,-1)
				LookAt(Mission.temp_shabayev,Mission.player)
				SetObjectiveOn(Mission.temp_shabayev)
				SetObjectiveName(Mission.temp_shabayev,"Cmd. Shabayev")
				Mission.shab_in_ship2 = true
				Mission.shab_in_ship = true
			
			else
			
				temp = Mission.ship3


				if ((IsAlive(temp)) and (temp ~= Mission.player)) then
				
					Mission.temp_shabayev = GetHandle("ship3")
					SetGroup(Mission.temp_shabayev,-1)
					LookAt(Mission.temp_shabayev,Mission.player)
					SetObjectiveOn(Mission.temp_shabayev)
					SetObjectiveName(Mission.temp_shabayev,"Cmd. Shabayev")
					Mission.shab_in_ship3 = true
					Mission.shab_in_ship = true
				
				else
				
					temp = Mission.ship4


					if ((IsAlive(temp)) and (temp ~= Mission.player)) then
					
						Mission.temp_shabayev = GetHandle("ship4")
						SetGroup(Mission.temp_shabayev,-1)
						LookAt(Mission.temp_shabayev,Mission.player)
						SetObjectiveOn(Mission.temp_shabayev)
						SetObjectiveName(Mission.temp_shabayev,"Cmd. Shabayev")
						Mission.shab_in_ship4 = true
						Mission.shab_in_ship = true
					end
				end
			end
		end
	end
	------------------------------------------/

	
	-- checks to see if the Mission.player kills Mission.shab on the way to her ship then

	if ((not Mission.shab_in_ship) and (not IsAlive(Mission.shab))) then
	
		Mission.shab_dead = true
	end
	------------------------------------------/


	-- this is making Mission.shabayev stay still until the Mission.player is too his ship

	--if ((Mission.shab_in_ship) and (not Mission.john_in_ship)) then
	--
	--	if ((IsAlive(Mission.shabayev)) and (not Mission.dump)) then
	--	
	--		Stop(Mission.shabayev)
	--	end
	--end------------------------------------------/

	
	-- checking the truck code
--[[
	if ((not Mission.truck_ready) and (Mission.shab_to_ship) and (Mission.trucker_time < GetTime())) then
	
		Mission.trucker_time = GetTime() + 1.0


		if (GetDistance(truck,"truck_move") < 10.0) then
		
			LookAt(truck,Mission.shabayev)
			Mission.truck_ready = true
		end
	end
	------------------------------------------/
]]

	-- this checks to see when the Mission.player is in his ship

	if ((IsOdf(Mission.player,"ivscout_vsr")) and (Mission.shab_in_ship)) then
	
		Mission.john_in_ship = true
		Mission.player_ship = Mission.player
		Mission.bool_dump = true
	
	else
	
		Mission.john_in_ship = false
	end
	------------------------------------------/

	if (not Mission.bool_dump and not Mission.game_over) then
	
		-- check to see if all Mission.player ships are dead then
		if (not IsAround(Mission.ship4) and  not IsAround(Mission.ship2) and  not IsAround(Mission.ship3)) then
		
			AudioMessage("isdf0242.wav") -- (Mission.shab) if you cannot follow my orders I'll leave you behind then
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		end
	end

	-- This moves Mission.shabayev out when the Mission.player gets in his ship for the first time

	if ((Mission.bool_dump) and (not Mission.free_truck) and (Mission.shab_in_ship)) then
	
		--RemoveObject(Mission.holder)
		SetCurHealth(Mission.ship4,1800)
		SetBestGroup(Mission.truck)
		--LookAt(truck,Mission.player,0)
		Goto(Mission.truck,"truck_move",0)
		--Goto(Mission.truck,"trucky_ducky",0)
		Mission.shabayev = BuildObject("ivpscou",1,Mission.temp_shabayev)
		RemoveObject(Mission.temp_shabayev)

		SetAvoidType(Mission.shabayev,0)
		SetAvoidType(Mission.truck,0)
		SetObjectiveOn(Mission.truck)
		tempstr = TranslateString("Mission0103")  -- Service Truck
		SetObjectiveName(Mission.truck,tempstr)
		SetObjectiveOn(Mission.shabayev)
		SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")	
		Retreat(Mission.shabayev,"oldbase_center")
		Mission.shabalab = GetTime() + 1.0
		Mission.talk = AudioMessage("isdf0226.wav")--(Mission.shab) I want you to have the service truck follow you - select the truck john
		ClearObjectives()
		AddObjective("to_ship.otf", "GREEN")
		AddObjective("truck_follow.otf", "WHITE")
		Mission.truck_ready = true
		Mission.free_truck = true
	end
	------------------------------------------/


	
	-- this makes Mission.shab stop at the base center

	if ((Mission.free_truck) and (not Mission.at_base_center)) then
	
		if ((not Mission.move_out) and (GetDistance(Mission.shabayev,"oldbase_center") < 25.0)) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.look_time = GetTime() + 5.0
			Mission.at_player = true
			Mission.at_base_center = true
		end
	end
	------------------------------------------/



	-- this is when the Mission.player selects the truck for the first time

	if (Mission.bool_dump) then
	
		if ((not Mission.first_over) and (IsSelected(Mission.truck))) then
		
			if (not Mission.selected_message) then
			
				StopAudioMessage(Mission.talk)
				Mission.talk = AudioMessage("isdf0227.wav")--(Mission.shab) good - choose the "follow" command or press spave bar.
				Mission.selected_message = true
			end
		end
	end
	------------------------------------------/



	-- this is keeping an eye on the Mission.player and making sure he does not leave the base

	if ((Mission.watch_player) and (Mission.watch_player_time < GetTime())) then
	
		if (GetDistance(Mission.shabayev,Mission.player) > 300.0) then
		
			Mission.watch_player_time = GetTime() + 999999.9
			Mission.player_lost = true
			Mission.watch_player = false
		end
	end
	------------------------------------------/



	-- This sees if truck is following then

	if (not Mission.player_lost) then
		
		if ((IsAlive(Mission.truck)) and (not IsSelected(Mission.truck)) and (not Mission.repairs_needed)) then
		
			if ((not Mission.truck_following) and (Mission.truck_check < GetTime())) then
			
				Mission.truck_check = GetTime() + 0.5


				if (GetCurrentCommand(Mission.truck) == 5) then
				
					Mission.leader = GetCurrentWho(Mission.truck)


					if ((not Mission.shab_message1) and (Mission.leader == Mission.player)) then
					
						Mission.truck_check = GetTime() + 2.0
						Mission.message1_time = GetTime() + 0.5
						Mission.truck_message = false
						Mission.truck_following = true
					
					elseif (Mission.shab_message1) then
					
						if ((Mission.leader == Mission.player) or (Mission.leader == Mission.shabayev)) then
						
							Mission.truck_check = GetTime() + 2.5
							Mission.truck_message = false
							Mission.truck_following = true
							ClearObjectives()
							AddObjective("truck.otf", "GREEN")
							AddObjective("follow_shab.otf", "WHITE")
						end
					
					elseif (not Mission.wrong_person) then
					
						--Mission.get_truck_time =  GetTime() + 3.0
						Mission.truck_check = GetTime() + 0.5
						Mission.wrong_person = true
					end
				end
			end


			-- checking to see if the truck is NOT following john then

			if ((Mission.truck_following) and (Mission.truck_check < GetTime())) then
			
				Mission.truck_check = GetTime() + 2.0


				if (GetCurrentCommand(Mission.truck) ~= 5) then
				
					--Mission.get_truck_time =  GetTime() + 3.0
					Mission.truck_check = GetTime() + 1.0
					Mission.truck_following = false
				end
			end
			------------------------------------------/


			-- if john tells the truck to follow the wrong person when the mission starts then

			if ((Mission.wrong_person) and (not Mission.wrong_message)) then
			
				AudioMessage("isdf0201.wav")-- (Mission.shab) wrong person john
				Mission.first_warning_time = GetTime() + 60.0
				Mission.wrong_message = true
			end
			------------------------------------------/


			-- orders the truck to follow himself for the first time

			if (not Mission.shab_message1) then
			
				if ((Mission.truck_following) and (Mission.message1_time < GetTime())) then
				
					StopAudioMessage(Mission.talk)
					Mission.talk = AudioMessage("isdf0202.wav") -- (Mission.shab) good - lets go
					ClearObjectives()
					AddObjective("truck.otf", "GREEN")
					AddObjective("follow_shab.otf", "WHITE")
					Mission.shab_message1 = true
				end


				if ((not Mission.truck_following) and (not Mission.first_warning) and (Mission.first_warning_time < GetTime())) then
				
					AudioMessage("isdf0203.wav") -- (Mission.shab) hurry up and get truck to follow us
					Mission.first_warning_time = GetTime() + 240.0
					Mission.first_warning = true		
				end
			end
			------------------------------------------/


			-- this is Mission.shab telling john to get the truck

			if ((Mission.truck_message) and (Mission.get_truck_time < GetTime())) then
			
				Mission.get_truck_time = GetTime() + 20.0
				ClearObjectives()
				AddObjective("truck.otf", "WHITE")
				AudioMessage("isdf0204.wav") -- (Mission.shab) make sure the truck is following us john
			end
			------------------------------------------/
		end
	end
	------------------------------------------/




-- now I know if the Mission.player is lost and if the truck is following so I will have Mission.shab move out	 then




if ((not Mission.shab_at_point) and (Mission.shab_message1) and (IsAlive(Mission.shabayev))) then

	-- this sends Mission.shab out of the base for the first time

	if ((not Mission.move_out) and (Mission.shab_message1) and (IsAudioMessageDone(Mission.talk))) then
	
		Goto(Mission.shabayev,"truckwait_path")
		--Goto(Mission.shabayev,"fuck_path")
		--Goto(truck,"fuck_path")
		Mission.look_time = GetTime() + 999999.9
		Mission.check1_time = GetTime() + 3.0
		Mission.move_out = true
	end
	------------------------------------------/



	-- this is when Mission.shab first reaches the trck wait point
	
	if ((not Mission.at_truck_stop) and (Mission.move_out) and (Mission.check1_time < GetTime())) then
	
		Mission.check1_time = GetTime() + 1.0


		if (GetDistance(Mission.shabayev,"truckwait_point") < 20.0) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.look_time = GetTime() + 3.0
			Mission.at_player = true
			Mission.check1_time = GetTime() + 0.5

			
			if (GetDistance(Mission.shabayev,Mission.player) > 200.0) then
			
				Mission.player_lost = true
			end

			if ((not Mission.player_lost) and (not Mission.truck_following)) then
			
				Mission.get_truck_time =  GetTime() + 2.0
				Mission.truck_message = true
			end

			Mission.at_truck_stop = true
		end
	end
	------------------------------------------/



	-- checking to see if the truck is caught up then

	if (not Mission.player_lost) then
	
		if ((not Mission.caught_up) and (Mission.at_truck_stop) and (Mission.check1_time < GetTime())) then
		
			Mission.check1_time = GetTime() + 2.0


			if (GetDistance(Mission.shabayev,Mission.player) < 100.0) then
			
				if (Mission.truck_following) then
				
					if (GetDistance(Mission.player,Mission.truck) < 70.0) then
					
						Mission.talk = AudioMessage("isdf0209.wav") -- (Mission.shab) ok, follow me
						--Mission.check1_time = GetTime() + 1.0
						Mission.caught_up = true
					
					elseif (not Mission.wait_message) then
					
						AudioMessage("isdf0210.wav") -- (Mission.shab) sometimes you have to wait for slower vehicles
						Mission.check1_time = GetTime() + 1.0
						Mission.wait_message = true
					end
				
				elseif ((not Mission.truck_message) and (not Mission.truck_following)) then
				
					Mission.get_truck_time = GetTime() + 1.0
					Mission.truck_message = true
				end
			end
		end
	end
	------------------------------------------/


	-- now that the truck is caught up she moves on

	if ((Mission.caught_up) and (not Mission.to_shab1) and (IsAudioMessageDone(Mission.talk))) then
	
		Goto(Mission.shabayev,"shab_path1")
		Mission.look_time = GetTime() + 999999.9
		Mission.check1_time = GetTime() + 1.0
		Mission.builder_change_time = GetTime()  + 2.0
		Mission.truck_message = false
		Mission.to_shab1 = true
	end
	------------------------------------------/

	
	-- this is Mission.shab commenting on the the builder she has detected

	if (IsAlive(Mission.builder1)) then
	
		if ((Mission.to_shab1) and (not Mission.builder_change) and (Mission.builder_change_time < GetTime())) then
		
			Mission.builder_change_time = GetTime() + 0.5


			if (GetDistance(Mission.shabayev,"detect_spot") < 30.0) then
			
				SetPerceivedTeam(Mission.builder1,2)
				Mission.builder_change_time = GetTime() + 10.0
				--Mission.follow_off = true -- I don't want Mission.shab to be concerned with the truck at this point
				Mission.builder_change = true
			end
		end


		if ((Mission.caught_up) and (not Mission.shab_builder_detect) and (IsAudioMessageDone(Mission.talk))) then
		
			AudioMessage("isdf0211.wav") -- (Mission.shab) We got something - appears  stationary - I'm checking
			Mission.shab_builder_detect = true
		end
	end
	------------------------------------------/


	-- checking to see when she reaches the first check point (should have already detected the builder)

	if ((Mission.to_shab1) and (not Mission.to_builder) and (Mission.check1_time < GetTime())) then
	
		Mission.check1_time = GetTime() + 2.0


		if (GetDistance(Mission.shabayev,"checkpoint1") < 40.0) then
		
			Goto(Mission.shabayev,"shabstop_jammer")
			Mission.check1_time = GetTime() + 0.5
			Mission.to_builder = true
		end
	end
	------------------------------------------/


	-- Mission.shab see the builder

	if ((Mission.to_builder) and (not Mission.jammer_message) and (Mission.check1_time < GetTime())) then
	
		Mission.check1_time = GetTime() + 0.5


		if ((not Mission.jammer_built) and (GetDistance(Mission.shabayev,"shabstop_jammer") < 20.0)) then
		
			AudioMessage("isdf0212.wav") -- (Mission.shab) what the hell is that!
			LookAt(Mission.shabayev,Mission.builder1)
			Mission.jammer_message = true
		end
	end
	------------------------------------------/

	
	-- now the Mission.player sees the builder (here is where the builder will finish building the Mission.jammer

	if ((not Mission.player_at_builder) and (IsAlive(Mission.builder1)) and (Mission.player_builder_check < GetTime())) then
	
		if (Mission.to_builder) then
		
			Mission.player_builder_check = GetTime() + 1.0


			if ((GetDistance(Mission.builder1,Mission.player)) < (GetDistance(Mission.builder1,"dist_check"))) then
			
				Dropoff(Mission.builder1,"jammer_spawn",2)

				Mission.jammer_build_time = GetTime() + 5.0
				Mission.player_at_builder = true
			end
		
		else
		
			Mission.player_builder_check = GetTime() + 1.0


			if ((GetDistance(Mission.builder1,Mission.player)) < (GetDistance(Mission.builder1,"dist_check"))) then
			
				Dropoff(Mission.builder1,"jammer_spawn",2)

				Mission.jammer_build_time = GetTime() + 10.0
				Mission.player_at_builder = true
			end
		end
	end
	------------------------------------------/


	-- this sets some time up for the Mission.jammer

	if ((not Mission.jammer_sets) and (Mission.jammer_built) and (Mission.player_at_builder)) then
	
		Mission.jammer_message_time = GetTime() + 3.0
		Mission.builder_run_time = GetTime() + 0.2
		Mission.jammer_sets = true
	end
	------------------------------------------/


	-- this is the first attack by the ScionS

	if ((not Mission.first_wave_built) and (Mission.player_at_builder)) then
	
		if ((not Mission.first_wave_built) and (GetDistance(Mission.player,"espawn1_jammer") > 200.0)) then
		
			Mission.scion1 = BuildObject("fvpsnt",2,"espawn1_jammer")
			Mission.scion2 = BuildObject("fvpsnt",2,"espawn2_jammer")
			SetSkill(Mission.scion1,2)
			SetSkill(Mission.scion2,2)
			Stop(Mission.scion1)
			Stop(Mission.scion2)
			Mission.first_wave_built = true
		end


		if ((not Mission.first_wave_built) and (GetDistance(Mission.player,"espawn3_jammer") > 200.0)) then
		
			Mission.scion1 = BuildObject("fvpsnt",2,"espawn3_jammer")
			Mission.scion2 = BuildObject("fvpsnt",2,"espawn4_jammer")
			Stop(Mission.scion1)
			Stop(Mission.scion2)
			Mission.first_wave_built = true
		end
	end
	------------------------------------------/


	-- sending the first wave in to attack

	if ((not Mission.first_wave_attack) and (Mission.first_wave_built)) then
	
		if (Mission.builder1_run) then
		
			if (IsAlive(Mission.scion1)) then
			
				Goto(Mission.scion1,"jammer_spawn")
			end
			if (IsAlive(Mission.scion2)) then
			
				Goto(Mission.scion2,"jammer_spawn")
			end

			Mission.combat_check = GetTime() + 3.0
			Mission.first_wave_attack = true
		
		elseif ((IsAlive(Mission.builder1)) and (GetHealth(Mission.builder1) < 0.0)) then
		
			if (IsAlive(Mission.scion1)) then
			
				Goto(Mission.scion1,"jammer_spawn")
			end
			if (IsAlive(Mission.scion2)) then
			
				Goto(Mission.scion2,"jammer_spawn")
			end

			Mission.combat_check = GetTime() + 3.0
			Mission.first_wave_attack = true
		
		elseif (not IsAlive(Mission.builder1)) then
		
			if (IsAlive(Mission.scion1)) then
			
				Goto(Mission.scion1,"jammer_spawn")
			end
			if (IsAlive(Mission.scion2)) then
			
				Goto(Mission.scion2,"jammer_spawn")
			end

			Mission.combat_check = GetTime() + 3.0
			Mission.first_wave_attack = true
		end
	end
	------------------------------------------/


	-- this is the garbled message sent by Mission.shab

	if (not Mission.dead_message) then
	
		if ((Mission.jammer_built) and (Mission.to_builder) and (not Mission.jammer_dead) and (Mission.jammer_message_time < GetTime())) then
		
			if (not Mission.scrammbled_message) then
			
				Mission.garbble = AudioMessage("isdf0213.wav") -- (Mission.shab) *Mission.shab's garbled message*
				Mission.jammer_message_time = GetTime() + 15.0
				Mission.scrammbled_message = true
			
			else
			
				Mission.garbble = AudioMessage("isdf0229.wav") -- (Mission.shab) *SECOND Mission.shab's garbled message*
				Mission.jammer_message_time = GetTime() + 25.0
				Mission.scrammbled_message = false
			end
		end
	end
	------------------------------------------/


	-- this is telling Mission.shab to attack the Mission.jammer

	if ((Mission.scrammbled_message) and (not Mission.shab_attack_jammer) and (not Mission.jammer_dead)) then
	
		Attack(Mission.shabayev,Mission.jammer,1)
		SetObjectiveOn(Mission.jammer)
		Mission.shab_attack_jammer = true
	end
	------------------------------------------/


	-- this is checking to see if the Mission.jammer is still alive then

	if ((Mission.jammer_built) and (not Mission.jammer_dead) and (not IsAround(Mission.jammer))) then
	
		Mission.dead_jammer_message = GetTime() + 2.0
		LookAt(Mission.shabayev,Mission.player)
		Mission.jammer_dead = true
	end
	------------------------------------------/


	-- this Mission.shab warning of the up comming attack by the two scion forces after the Mission.jammer is destroyed

	if ((Mission.jammer_dead) and (not Mission.dead_message) and (Mission.dead_jammer_message < GetTime())) then
	
		if (IsAlive(Mission.scion1)) then
		
			StopAudioMessage(Mission.garbble)
			AudioMessage("isdf0228.wav")--(Mission.shab) that thing was jamming our communications - defend the truck I'll go for the hostiles
			ClearObjectives()
			AddObjective("defend_truck.otf", "WHITE")
			Attack(Mission.shabayev,Mission.scion1)


			if (IsAlive(Mission.scion2)) then
			
				Attack(Mission.scion2,Mission.truck)
				Attack(Mission.scion1,Mission.truck)
			
			else
			
				Attack(Mission.scion1,Mission.truck)
			end

			Mission.dead_message = true
		
		elseif (IsAlive(Mission.scion2)) then
		
			AudioMessage("isdf0228.wav")--(Mission.shab) that thing was jamming our communications - defend the truck I'll go for the hostiles
			ClearObjectives()
			AddObjective("defend_truck.otf", "WHITE")
			Attack(Mission.shabayev,Mission.scion2)
			Attack(Mission.scion2,Mission.truck)
			Mission.jammer_message_time = GetTime() + 999999.9
			Mission.dead_message = true
		
		elseif (Mission.first_over) then
		
			Mission.talk = AudioMessage("isdf0214.wav") -- (Mission.shab) that thing was jamming our communications!
			Mission.jammer_message_time = GetTime() + 999999.9
			Mission.dead_message = true
		end
	end
	------------------------------------------/



	-- this is setting "combat" conditions

	if ((not Mission.in_combat) and (Mission.combat_check < GetTime())) then
	
		Mission.combat_check = GetTime() + 1.0


		if ((IsAlive(Mission.scion1)) and (GetDistance(Mission.scion1,Mission.player) < 180.0)) then
		
			Mission.combat_check = GetTime() + 999999.9
			Mission.in_combat = true
		end
		if ((IsAlive(Mission.scion2)) and (GetDistance(Mission.scion2,Mission.player) < 180.0)) then
		
			Mission.combat_check = GetTime() + 999999.9
			Mission.in_combat = true
		end
	end
	------------------------------------------/


	-- this is Mission.shab asking for help with the other one


	if ((Mission.dead_message) and (IsAudioMessageDone(Mission.talk))) then
	
		if ((not Mission.scion_message) and (not Mission.first_over) and (Mission.first_wave_built)) then
		
			if ((not IsAlive(Mission.scion1)) and (IsAlive(Mission.scion2))) then
					
				AudioMessage("isdf0247.wav") -- (Mission.shab) Good Job John - give me a hand with this other one
				Attack(Mission.shabayev,Mission.scion2)

				if (IsAlive(Mission.truck)) then
				
					Attack(Mission.scion2,Mission.truck)
				end

				SetObjectiveOn(Mission.scion2)
				tempstr = TranslateString("Mission0101")  -- Hostile
				SetObjectiveName(Mission.scion2,tempstr)
				ClearObjectives()
				AddObjective("defend_truck.otf", "GREEN")
				AddObjective("assist_shab.otf", "WHITE")
				Mission.scion_message = true
			
			elseif ((not IsAlive(Mission.scion2)) and (IsAlive(Mission.scion1))) then
			
				AudioMessage("isdf0247.wav") -- (Mission.shab) Good Job John - give me a hand with this other one
				Attack(Mission.shabayev,Mission.scion1)

				if (IsAlive(Mission.truck)) then
				
					Attack(Mission.scion1,Mission.truck)
				end

				SetObjectiveOn(Mission.scion1)
				tempstr = TranslateString("Mission0101")  -- Hostile
				SetObjectiveName(Mission.scion1,tempstr)
				ClearObjectives()
				AddObjective("defend_truck.otf", "GREEN")
				AddObjective("assist_shab.otf", "WHITE")
				Mission.scion_message = true
			end

		end
	end
	------------------------------------------/


	-- this is the code that determines if the battle is over then

	if ((Mission.first_wave_built) and (not Mission.first_over) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
	
		LookAt(Mission.shabayev,Mission.player)
		SetCurHealth(Mission.shabayev,900)
		Mission.at_player = true
		Mission.in_combat = false
		Mission.first_over = true
	end
	------------------------------------------/


	-- this is when the first wave is dead and the Mission.player has destroyed the Mission.jammer

	if ((Mission.first_over) and (Mission.dead_message)) then
	
		-- this is Mission.shab telling john to rendezvous with her

		if ((not Mission.come_here) and (IsAudioMessageDone(Mission.talk))) then
		
			if (GetDistance(Mission.shabayev,"super_rendezvous") > 100.0) then
			
				Retreat(Mission.shabayev,"super_rendezvous")
				Mission.point_check = GetTime() + 1.0
				
				
				if (GetCurrentCommand(Mission.truck) == 5) then
				
					Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me
					ClearObjectives()
					AddObjective("rendezvous.otf", "WHITE")
					Mission.shab_to_point = true
					Mission.come_here = true
				
				else
				
					Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me and make sure truck is following us
					ClearObjectives()
					AddObjective("rendezvous.otf", "WHITE")	
					AddObjective("truck.otf", "WHITE")
					Mission.shab_to_point = true
					Mission.come_here = true
				end
			
			elseif (GetDistance(Mission.player,Mission.shabayev) > 25.0) then
			
				LookAt(Mission.shabayev,Mission.player)

				if (GetCurrentCommand(Mission.truck) == 5) then
				
					Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me
					ClearObjectives()
					AddObjective("rendezvous.otf", "WHITE")
					Mission.shab_at_point = true
					Mission.come_here = true
				
				else
				
					Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me and make sure truck is following us
					ClearObjectives()
					AddObjective("rendezvous.otf", "WHITE")	
					AddObjective("truck.otf", "WHITE")
					Mission.shab_at_point = true
					Mission.come_here = true
				end
			
			else
			
				LookAt(Mission.shabayev,Mission.player)
				Mission.shab_at_point = true
				Mission.come_here = true
			end
		end
		------------------------------------------/


		if ((Mission.come_here) and (Mission.shab_to_point)) then
		
			if ((not Mission.shab_at_point) and (Mission.point_check < GetTime())) then
			
				Mission.point_check = GetTime() + 0.5


				if (GetDistance(Mission.shabayev,"super_rendezvous") < 40.0) then
				
					LookAt(Mission.shabayev,Mission.player)
					Mission.look_time = GetTime() + 10.0
					Mission.at_player = true
					Mission.shab_at_point = true
				end
			end
		end
		------------------------------------------/
	end
	------------------------------------------/
end


-- this is builder code ------------------------------------------------


if (IsAlive(Mission.builder1)) then

	-- this is making the builder run to the morph spot

	if ((not Mission.builder1_run) and (Mission.jammer_built) and (Mission.builder_run_time < GetTime())) then
	
		SetAvoidType(Mission.builder1,0)
		Retreat(Mission.builder1,"builder_goto_path",1)
		Mission.builder_run_check = GetTime() + 3.0
		Mission.in_combat = true
		Mission.builder1_run = true
	end

--[[
	if ((not Mission.builder1_run2) and (Mission.builder1_run) and (Mission.builder_run_check < GetTime())) then
	
		Mission.builder_run_check = GetTime() + 1.0

		if (GetDistance(Mission.builder1,"buildermorph_point") < 25.0) then
		
			Retreat(Mission.builder1,"droneescape_point")
			Mission.builder_run_check = GetTime() + 15.0
			Mission.builder1_run2 = true
		end
	end
	------------------------------------------/


	-- this making the builder run for shab2_path

	if ((not Mission.builder1_to_shab2) and (Mission.builder1_run2) and (Mission.builder_run_check < GetTime())) then
	
		Mission.builder_run_check = GetTime() + 2.0


		if (GetDistance(Mission.builder1,"droneescape_point") < 40.0) then
		
			Retreat(Mission.builder1,"shab_path2")
			Mission.builder_run_check = GetTime() + 2.0
			Mission.builder1_to_shab2 = true
		end
	end
	------------------------------------------/
]]

	-- this is making the builder stop and wait to be caught
	
	if ((not Mission.builder_morph1) and --[[(Mission.builder1_to_shab2)]](Mission.builder1_run) and (Mission.builder_run_check < GetTime())) then
	
		Mission.builder_run_check = GetTime() + 2.0

		
		if (not Mission.builder1_stop) then
		
			if (GetDistance(Mission.builder1,"morph_point1") < 50) then
			
				Stop(Mission.builder1)
				Mission.builder1_stop = true
			
			elseif (((Mission.to_shab2) and (GetDistance(Mission.builder1,Mission.shabayev) < 130)) or ((Mission.to_shab2) and (GetDistance(Mission.builder1,Mission.player) < 140))) then
			
				Stop(Mission.builder1)
				Mission.show_ready = true
				Mission.builder1_stop = true
			end
		end


		if ((not Mission.show_ready) and (Mission.builder1_stop) and (Mission.first_over)) then
		
			if ((GetDistance(Mission.builder1,Mission.shabayev) < 150) or (GetDistance(Mission.builder1,Mission.player) < 150)) then
			
				Mission.show_ready = true
			end
		end


		if ((Mission.show_ready) and (not Mission.builder_morph1)) then
		
			Retreat(Mission.builder1,"drone_path")
			Mission.builder_morph1 = true
		end
	end
	------------------------------------------/

elseif ((not Mission.builder_dead) and (not Mission.builder_morph1)) then

	Mission.builder_dead = true


	if (not Mission.temp_spawn) then
	
		Mission.temp1 = BuildObject("fvpsnt",2,"morph2_point1")
		Mission.temp2 = BuildObject("fvpsnt",2,"morph2_point2")
		Mission.temp3 = BuildObject("fvpsnt",2,"morph2_point3")

		SetSkill(Mission.temp1,1)
		SetSkill(Mission.temp2,1)
		SetSkill(Mission.temp3,1)

		--Deploy(Mission.temp1)
		--Deploy(Mission.temp2)
		--Deploy(Mission.temp3)

		Mission.jammer2 = BuildObject("fbpjam",2,"jam2_spawn")

		Mission.temp_spawn = true
	end
end


-- this is contiued builder code ------------------------------/


if (IsAlive(Mission.builder1)) then

	if (Mission.builder_morph1) then
	
		-- this is building the second wave

		if (not Mission.temp_spawn) then
		
			Mission.temp1 = BuildObject("fvpsnt",2,"morph2_point1")
			Mission.temp2 = BuildObject("fvpsnt",2,"morph2_point2")
			Mission.temp3 = BuildObject("fvpsnt",2,"morph2_point3")

			SetSkill(Mission.temp1,1)
			SetSkill(Mission.temp2,1)
			SetSkill(Mission.temp3,1)

			--Deploy(Mission.temp1)
			--Deploy(Mission.temp2)
			--Deploy(Mission.temp3)

			Mission.jammer2 = BuildObject("fbjamm",2,"jam2_spawn")
			Mission.temp_spawn = true
			--Mission.drone_run = true
		end
		------------------------------------------/
	end


	if ((Mission.to_shab2) and (not Mission.remove_drone) and (Mission.temp_spawn)) then
	
		-- checking to see if I can get rid of the Mission.drone then

		if (Mission.remove_drone_time < GetTime()) then
		
			Mission.remove_drone_time = GetTime() + 1.0


			-- this is Mission.shab commenting on the builder

			if ((GetDistance(Mission.builder1,Mission.player) < 175.0) and (not Mission.shab_message3)) then
			
				AudioMessage("isdf0241.wav") -- (Mission.shab) it's getting away - follow it!
				Mission.shab_message3 = true
			end
			------------------------------------------/
		end
	end

elseif ((not Mission.builder_dead) and (not Mission.remove_drone)) then

	Mission.builder_dead = true

	if (not Mission.temp_spawn) then
	
		Mission.temp1 = BuildObject("fvpsnt",2,"morph2_point1")
		Mission.temp2 = BuildObject("fvpsnt",2,"morph2_point2")
		Mission.temp3 = BuildObject("fvpsnt",2,"morph2_point3")

		SetSkill(Mission.temp1,1)
		SetSkill(Mission.temp2,1)
		SetSkill(Mission.temp3,1)

		--Deploy(Mission.temp1)
		--Deploy(Mission.temp2)
		--Deploy(Mission.temp3)

		Mission.jammer2 = BuildObject("fbjamm",2,"jam2_spawn")

		Mission.temp_spawn = true
	end
end




-- this is Mission.shab saying they have to move out after first battle





if ((not Mission.after_first_message) and (Mission.shab_at_point)) then

	-- I'm furst checking to find the states of Mission.shab and the Mission.player

	if ((not Mission.repair_check1) and (GetDistance(Mission.player,Mission.shabayev) < 50.0)) then
	
		if ((not Mission.shab_full_health) or (not Mission.john_full_health)) then
		
			Mission.repairs_needed = true
		
		else
		
			Mission.repair_done = true
		end

		Mission.repair_check1 = true
	end
	------------------------------------------/


	-- I'm having the truck service here

	if ((Mission.repairs_needed) and (not Mission.repair_done)) then
	
		if (not Mission.bert) then
		
			-- if Mission.shab needs it first then

			if (not Mission.shab_full_health) then
			
				SetCurHealth(Mission.shabayev,1200)
				Service(Mission.truck,Mission.shabayev,1)
				AudioMessage("isdf0248.wav") -- Truck - repair me
				Mission.look_time = GetTime() + 2.0
				Service(Mission.truck,Mission.shabayev)
				Mission.service_time = GetTime() + 8.0
				Mission.shab_first = true
				Mission.bert = true
			end

			-- then I send it to the Mission.player
--[[
			else
			
				Mission.blah = AudioMessage("isdf0249.wav") -- (Mission.shab) You took a beating - the service truck will repair you automatically if you stnad near it then
				Mission.look_time = GetTime() + 2.0
				ClearObjectives()
				AddObjective("service.otf", "WHITE")	
				Mission.bert = true
				Mission.repair_message1 = true
			end
			------------------------------------------/
]]
		end


		-- this is Mission.shab telling the Mission.player about the truck

		if ((not Mission.truck_explain) and (Mission.shab_first) and (Mission.service_time < GetTime())) then
		
			Mission.blah = AudioMessage("isdf0261.wav")-- (Mission.shab) Get close to the truck and it will repair you
			Mission.truck_explain = true
		end
		------------------------------------------/

		
		-- this checks to see if the Mission.player stops the service process then

		if ((not Mission.repair_message1) and (Mission.shab_first)) then
		
			if (Mission.shab_full_health) then
			
				Follow(Mission.truck,Mission.player,0)
				--Stop(truck,0)
				Mission.repairs_needed = false
				Mission.john_full_health = true
				Mission.repair_done = true

--[[
				if ((GetCurAmmo(Mission.player_ship) < 1300) or (GetCurHealth(Mission.player_ship) < 1600)) then
				
					Follow(truck,Mission.player,0)
					--Stop(truck,0)
					Mission.blah = AudioMessage("isdf0216a.wav") -- (Mission.shab) now I'm fixed - move close to the truck and it will repair you
					Mission.repair_message1 = true
				
				else
				
					Follow(truck,Mission.player,0)
					--Stop(truck,0)
					Mission.repairs_needed = false
					Mission.john_full_health = true
					Mission.repair_done = true
				end
]]
			end
		end
		------------------------------------------/


		-- this is after the Mission.player is fixed up

		if ((Mission.repair_message1) and (Mission.john_full_health)) then
		
			Mission.repairs_needed = false
			Mission.repair_done = true
		end
		------------------------------------------/


--[[		
		-- this is if Mission.shab needed Mission.fixing then

		if ((Mission.bert) and (not Mission.repair_message1) and (not Mission.repair_done)) then
		
			if ((Mission.shab_full_health) and (not Mission.john_full_health)) then
			
				Mission.blah = AudioMessage("isdf0216.wav") -- (Mission.shab) now I'm fixed - hold still while the truck fixes you up
				ClearObjectives()
				AddObjective("service.otf", "WHITE")
				Mission.repair_message1 = true
			end


			if ((Mission.shab_full_health) and (Mission.john_full_health)) then
			
				Mission.repairs_needed = false
				Mission.repair_done = true
			end
		end
		------------------------------------------/


		-- this is if only the Mission.player needed Mission.fixing then
		
		if ((Mission.repair_message1) and (not Mission.repair_message2)) then
		
			if (IsSelected(truck)) then
			
				StopAudioMessage(Mission.blah)
				Mission.blah = AudioMessage("isdf0217.wav") -- (Mission.shab) good! now select the "repair command" using the "" key and press your space bar.
				Mission.repair_message2 = true
			end
		end
		------------------------------------------/


		if ((Mission.repair_message2) and (not Mission.repair_message3)) then
		
			if (IsSelected(truck)) then
			
				--Mission.goose = true
				Mission.mistake = false
			end


			--if ((Mission.goose) and (not IsSelected(truck))) then
			--
				if (GetCurrentCommand(truck) == CMD_SERVICE) then
				
					Mission.fixing = GetCurrentWho(truck)

					if (Mission.fixing == Mission.player) then
					
						StopAudioMessage(Mission.blah)
						Mission.blah = AudioMessage("isdf0218.wav") -- (Mission.shab) Good - just hold still for a second while it repairs you
						ClearObjectives()
						AddObjective("service_done.otf", "GREEN")
						AddObjective("hold_still.otf", "WHITE")						
						Mission.repair_message3 = true
					end
				
				elseif ((not Mission.mistake) and (GetCurrentCommand(truck) == 5)) then
				
					StopAudioMessage(Mission.blah)
					Mission.blah = AudioMessage("isdf0256.wav") -- (Mission.shab) oops1 you told the truck to follow!
					ClearObjectives()
					AddObjective("service.otf", "WHITE")
					Mission.mistake = true
				end

				--Mission.goose = false
			--end
		end

]]
	end


	
	-- this is sending Mission.shab after she and the Mission.player are repaired
	
	if (Mission.repair_done) then
	
		if (not Mission.after_first_message) then
		
			if (Mission.builder_dead) then
			
				Mission.talk = AudioMessage("isdf0215.wav") -- Mission.shab we need to get to that base
				Mission.checkpoint2_check = GetTime() + 1.0


				if (not Mission.temp_spawn) then
				
					Mission.temp1 = BuildObject("fvpsnt",2,"morph2_point1")
					Mission.temp2 = BuildObject("fvpsnt",2,"morph2_point2")
					Mission.temp3 = BuildObject("fvpsnt",2,"morph2_point3")

					SetSkill(Mission.temp1,1)
					SetSkill(Mission.temp2,1)
					SetSkill(Mission.temp3,1)

					--Deploy(Mission.temp1)
					--Deploy(Mission.temp2)
					--Deploy(Mission.temp3)

					Mission.jammer2 = BuildObject("fbjamm",2,"jam2_spawn")

					Mission.temp_spawn = true
				end


				if (GetCurrentCommand(Mission.truck) ~= 5) then
				
					Mission.get_truck_time =  GetTime() + 3.0
					Mission.truck_check = GetTime() + 5.0
					Mission.truck_message = true
					Mission.truck_following = false
				end

				Mission.after_first_message = true
			
			elseif (not Mission.builder_dead) then
			
				Mission.talk = AudioMessage("isdf0222.wav") -- lets investigate that constructor
				Mission.checkpoint2_check = GetTime() + 1.0


				if (GetCurrentCommand(Mission.truck) ~= 5) then
				
					Mission.get_truck_time =  GetTime() + 5.0
					Mission.truck_check = GetTime() + 5.0
					Mission.truck_message = true
					Mission.truck_following = false
				end

				Mission.after_first_message = true
			end
		end
	end
end



	-- This sends Mission.shab to the builder or the other ambush when she is repaired and the truck is following

	if ((not Mission.player_lost) and (Mission.truck_following)) then
	
		if ((not Mission.to_shab2) and (Mission.after_first_message) and (IsAudioMessageDone(Mission.talk))) then
		
			if (Mission.builder_dead) then
			
				Goto(Mission.shabayev,"shab_path2")
				ClearObjectives()
				AddObjective("truck.otf", "GREEN")
				AddObjective("follow_shab.otf", "WHITE")
				AudioMessage("isdf0209.wav")
				Mission.look_time = GetTime() + 999999.9
				Mission.encounter1_check = GetTime() + 1.0
				Mission.truck_message = false
				Mission.john_over_shab = false
				Mission.shab_over_john = false
				Mission.no_show = true
				Mission.part_two = true
				Mission.to_shab2 = true
			
			else
			
				Goto(Mission.shabayev,"shab_path2")
				ClearObjectives()
				AddObjective("truck.otf", "GREEN")
				AddObjective("follow_shab.otf", "WHITE")
				AudioMessage("isdf0209.wav")
				Mission.look_time = GetTime() + 999999.9
				Mission.encounter1_check = GetTime() + 1.0
				Mission.remove_drone_time = GetTime() + 1.0
				Mission.truck_message = false
				Mission.john_over_shab = false
				Mission.shab_over_john = false
				Mission.no_show = false
				Mission.part_two = true
				Mission.to_shab2 = true
			end
		end
	end
	------------------------------------------/




-- this is after the first battle and on to the second




if ((Mission.part_two) and (not Mission.at_base)) then

	if ((not Mission.on_to_base) and (IsAlive(Mission.shabayev)) and (IsAlive(Mission.truck))) then
	
		-- this is the code gives the Mission.player the "show"
		if (not Mission.no_show) then
		
			if ((not Mission.start_second_morph) and (not Mission.shab_message2) and (Mission.encounter1_check < GetTime())) then
			
				Mission.encounter1_check = GetTime() + 1.0


				if ((IsAlive(Mission.builder1)) and (Mission.builder_morph1)) then
				
					AudioMessage("isdf0223.wav") -- (Mission.shab) There it is! what IS that thing
					Mission.shab_message2 = true
				end
			end


			if ((Mission.show_ready) and (not Mission.shab_follow_build)) then
			
				if (IsAlive(Mission.builder1)) then
				
					Follow(Mission.shabayev,Mission.builder1,1)
					Mission.shab_follow_build = true
				end
			end
		
		elseif ((not Mission.to_shab2a) and (Mission.encounter1_check < GetTime())) then
		
			Mission.encounter1_check = GetTime() + 1.0


			--if (not Mission.truck_following) then
			--
			--	Mission.get_truck_time =  GetTime() + 2.0
			--	Mission.truck_message = true
			--end
			if (GetDistance(Mission.shabayev,"morph_point1") < 50) then
			
				Retreat(Mission.shabayev,"shab_path2a")
				Mission.truck_message = false
				Mission.to_shab2a = true
			end
		end


		-- checking to see if the builder is killed then
		if ((Mission.to_shab2) and (not Mission.start_second_morph) and (Mission.builder_dead) and (not Mission.dead_now_message)) then
		
			Mission.talk = AudioMessage("isdf0232.wav")--(Mission.shab) whatever it was its dead now
			LookAt(Mission.shabayev,Mission.player)
			Mission.dead_now_message = true
		end


		if ((not Mission.move_on) and (Mission.dead_now_message) and (IsAudioMessageDone(Mission.talk))) then
		
			Retreat(Mission.shabayev,"shab_path2a")
			Mission.encounter1_check = GetTime() + 1.0
			Mission.move_on = true
		end

-- from here you need to look at the Mission.builder1 code below
		
		if ((not Mission.start_second_morph) and (Mission.checkpoint2_check < GetTime())) then
		
			Mission.checkpoint2_check = GetTime() + 1.0


			if (IsAlive(Mission.temp1)) then
			
				if (GetDistance(Mission.player,Mission.temp1) < 150.0) then
				
					Attack(Mission.shabayev,Mission.temp1)
					Defend2(Mission.temp1,Mission.jammer2,1)
					Defend2(Mission.temp2,Mission.jammer2,1)
					Defend2(Mission.temp3,Mission.jammer2,1)
					Mission.jammer_message_time = GetTime() + 2.0
					Mission.at1 = true
					Mission.in_combat = true
					Mission.start_second_morph = true
				
				elseif (Mission.to_shab2a) then
				
					if (GetDistance(Mission.shabayev,Mission.temp1) < 150.0) then
					
						Attack(Mission.shabayev,Mission.temp1)
						Defend2(Mission.temp1,Mission.jammer2,1)
						Defend2(Mission.temp2,Mission.jammer2,1)
						Defend2(Mission.temp3,Mission.jammer2,1)
 						Mission.jammer_message_time = GetTime() + 2.0
						Mission.at1 = true
						Mission.in_combat = true
						Mission.start_second_morph = true
					end
				end
			end


			if ((IsAlive(Mission.temp2)) and (not Mission.start_second_morph)) then
			
				if (GetDistance(Mission.player,Mission.temp2) < 150.0) then
				
					Attack(Mission.shabayev,Mission.temp2)
					Defend2(Mission.temp1,Mission.jammer2,1)
					Defend2(Mission.temp2,Mission.jammer2,1)
					Defend2(Mission.temp3,Mission.jammer2,1)
					Mission.jammer_message_time = GetTime() + 2.0
					Mission.at2 = true
					Mission.in_combat = true
					Mission.start_second_morph = true
				
				elseif (Mission.to_shab2a) then
				
					if (GetDistance(Mission.shabayev,Mission.temp2) < 150.0) then
					
						Attack(Mission.shabayev,Mission.temp2)
						Defend2(Mission.temp1,Mission.jammer2,1)
						Defend2(Mission.temp2,Mission.jammer2,1)
						Defend2(Mission.temp3,Mission.jammer2,1)
						Mission.jammer_message_time = GetTime() + 2.0
						Mission.at2 = true
						Mission.in_combat = true
						Mission.start_second_morph = true
					end
				end
			end


			if ((IsAlive(Mission.temp3)) and (not Mission.start_second_morph)) then
			
				if (GetDistance(Mission.player,Mission.temp3) < 150.0) then
				
					Attack(Mission.shabayev,Mission.temp3)
					Defend2(Mission.temp1,Mission.jammer2,1)
					Defend2(Mission.temp2,Mission.jammer2,1)
					Defend2(Mission.temp3,Mission.jammer2,1)
					Mission.jammer_message_time = GetTime() + 2.0
					Mission.at3 = true
					Mission.in_combat = true
					Mission.start_second_morph = true
				
				elseif (Mission.to_shab2a) then
				
					if (GetDistance(Mission.shabayev,Mission.temp3) < 150.0) then
					
						Attack(Mission.shabayev,Mission.temp3)
						Defend2(Mission.temp1,Mission.jammer2,1)
						Defend2(Mission.temp2,Mission.jammer2,1)
						Defend2(Mission.temp3,Mission.jammer2,1)
						Mission.jammer_message_time = GetTime() + 2.0
						Mission.at3 = true
						Mission.in_combat = true
						Mission.start_second_morph = true
					end
				end
			end
		end


		-- this is going to Mission.reroute Mission.shab to attack a differnt temp should one temp get killed
		if ((Mission.start_second_morph) and (not Mission.in_range)) then
		
			if (Mission.at1) then
			
				if ((not Mission.reroute) and (not IsAlive(Mission.temp1))) then
				
					if (IsAlive(Mission.temp2)) then
					
						Attack(Mission.shabayev,Mission.temp2)
						Mission.reroute2 = true
						Mission.reroute = true
					
					elseif (IsAlive(Mission.temp3)) then
					
						Attack(Mission.shabayev,Mission.temp3)
						Mission.reroute3 = true
						Mission.reroute = true
					end
				end

				if ((Mission.reroute2) and (not IsAlive(Mission.temp2))) then
				
					if ((not Mission.reroute3) and (IsAlive(Mission.temp3))) then
					
						Attack(Mission.shabayev,Mission.temp3)
						Mission.reroute3 = true
					end
				end
			end


			if (Mission.at2) then
			
				if ((not Mission.reroute) and (not IsAlive(Mission.temp2))) then
				
					if (IsAlive(Mission.temp1)) then
					
						Attack(Mission.shabayev,Mission.temp1)
						Mission.reroute1 = true
						Mission.reroute = true
					
					elseif (IsAlive(Mission.temp3)) then
					
						Attack(Mission.shabayev,Mission.temp3)
						Mission.reroute3 = true
						Mission.reroute = true
					end
				end

				if ((Mission.reroute1) and (not IsAlive(Mission.temp1))) then
				
					if ((not Mission.reroute3) and (IsAlive(Mission.temp3))) then
					
						Attack(Mission.shabayev,Mission.temp3)
						Mission.reroute3 = true
					end
				end
			end


			if (Mission.at3) then
			
				if ((not Mission.reroute) and (not IsAlive(Mission.temp3))) then
				
					if (IsAlive(Mission.temp1)) then
					
						Attack(Mission.shabayev,Mission.temp1)
						Mission.reroute1 = true
						Mission.reroute = true
					
					elseif (IsAlive(Mission.temp2)) then
					
						Attack(Mission.shabayev,Mission.temp2)
						Mission.reroute2 = true
						Mission.reroute = true
					end
				end

				if ((Mission.reroute1) and (not IsAlive(Mission.temp1))) then
				
					if ((not Mission.reroute2) and (IsAlive(Mission.temp2))) then
					
						Attack(Mission.shabayev,Mission.temp2)
						Mission.reroute2 = true
					end
				end
			end
		end



		-- this is keeping the temps in place
		if ((Mission.temp_spawn) and (not Mission.free_temp)) then
		
			if (not Mission.temp_patrol) then
			
				if (IsAlive(Mission.temp1)) then
				
					Patrol(Mission.temp1,"patrol2_a")
				end
				if (IsAlive(Mission.temp2)) then
				
					Patrol(Mission.temp2,"patrol2_b")
				end

				Mission.temp_patrol = true
			end


			if (IsAlive(Mission.temp3)) then
			
				Stop(Mission.temp3)
			end


			if ((Mission.start_second_morph) and (GetDistance(Mission.player,"jam2_spawn") < 150.0)) then
			
				SetObjectiveOn(Mission.jammer2)
				Mission.change_time = GetTime() + 30.0
				Mission.free_temp = true
			end
		end


		-- this is making the scions morph
		if ((Mission.free_temp) and (not Mission.temp_change) and (Mission.change_time < GetTime())) then
		
			if (IsAlive(Mission.temp1)) then
			
				Deploy(Mission.temp1)
			end
			if (IsAlive(Mission.temp2)) then
			
				Deploy(Mission.temp2)
			end
			if (IsAlive(Mission.temp3)) then
			
				Deploy(Mission.temp3)
			end

			Mission.temp_change = true
		end

		-- this is checking to see when the second combat is over

		if (not Mission.second_over) then
		
			if ((Mission.temp_spawn) and (not IsAlive(Mission.temp1)) and (not IsAlive(Mission.temp2)) and (not IsAlive(Mission.temp3))) then
			
				if (not Mission.jammer2_dead) then
				
					Attack(Mission.shabayev,Mission.jammer2)
					AudioMessage("isdf0213a.wav") -- (Mission.shab) *SECOND Mission.shab's garbled message*
				end

				Mission.follow_off = false
				Mission.second_over = true
			end
		end


		-- this is telling john to rondezvous with Mission.shab after second battle

		if ((Mission.second_over) and (Mission.jammer2_dead)) then
		
			if ((not Mission.after_second_check) and (GetDistance(Mission.shabayev,"jam2_spawn") > 100.0)) then
			
				Retreat(Mission.shabayev,"jam2_spawn")
				Mission.point_check = GetTime() + 1.0

				
				if (GetCurrentCommand(Mission.truck) == 5) then
				
					Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me
					ClearObjectives()
					AddObjective("follow_shab.otf", "WHITE")
					Mission.watch_player_time = GetTime() + 180.0
					Mission.watch_player = true
					Mission.come_here2 = true
				
				else
				
					Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me and make sure truck is following us
					ClearObjectives()
					AddObjective("follow_shab.otf", "WHITE")	
					AddObjective("truck.otf", "WHITE")
					Mission.watch_player_time = GetTime() + 180.0
					Mission.watch_player = true
					Mission.come_here2 = true
				end

				Mission.after_second_check = true
			
			else
			
				Mission.after_second_check = true
			end


			if (Mission.come_here2) then
			
				if ((not Mission.shab_at_jam2) and (Mission.point_check < GetTime())) then
				
					Mission.point_check = GetTime() + 1.0


					if (GetDistance(Mission.shabayev,"jam2_spawn") < 50.0) then
					
						LookAt(Mission.shabayev,Mission.player)
						Mission.look_time = GetTime() + 10.0
						Mission.at_player = true
						Mission.shab_at_jam2 = true
					end
				end
			
			elseif (Mission.after_second_check) then
			
					if (GetDistance(Mission.player,Mission.shabayev) > 80.0) then
					
						if (GetCurrentCommand(Mission.truck) == 5) then
						
							LookAt(Mission.shabayev,Mission.player)
							Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me
							ClearObjectives()
							AddObjective("follow_shab.otf", "WHITE")
							Mission.watch_player_time = GetTime() + 180.0
							Mission.watch_player = true
							Mission.come_here2 = true
						
						else
						
							LookAt(Mission.shabayev,Mission.player)
							Mission.talk = AudioMessage("isdf0230.wav")--(Mission.shab) rondezvous with me and make sure truck is following us
							ClearObjectives()
							AddObjective("follow_shab.otf", "WHITE")	
							AddObjective("truck.otf", "WHITE")
							Mission.watch_player_time = GetTime() + 180.0
							Mission.watch_player = true
							Mission.come_here2 = true
						end
					
					else
					
						LookAt(Mission.shabayev,Mission.player)
						Mission.look_time = GetTime() + 10.0
						Mission.at_player = true
						Mission.come_here2 = true
					end
			end


			if ((not Mission.player_lost) and (Mission.come_here2) and (GetDistance(Mission.player,Mission.shabayev) < 80.0)) then
			
				if (not Mission.keep_moving_message) then
				
					Mission.blah = AudioMessage("isdf0233.wav") -- (Mission.shab) this place is hotter than hell
					Mission.onto_base_time = GetTime() + 5.0


					if (GetCurrentCommand(Mission.truck) ~= 5) then
					
						Mission.get_truck_time =  GetTime() + 3.0
						Mission.truck_check = GetTime() + 5.0
						Mission.truck_message = true
						Mission.truck_following = false
					end

					Mission.watch_player_time = GetTime() + 180.0
					Mission.watch_player = true
					Mission.in_combat = false
					Mission.keep_moving_message = true
				end
			end
		end


		if ((not Mission.player_lost) and (Mission.truck_following)) then
		
			if ((Mission.keep_moving_message) and (not Mission.on_to_base) and (IsAudioMessageDone(Mission.blah))) then --(Mission.onto_base_time < GetTime())) then
			
				AudioMessage("isdf0234.wav") -- (Mission.shab) Lets press on!
				Retreat(Mission.shabayev,"shab_path3")
				Mission.look_time = GetTime() + 999999.9
				Mission.onto_base_time = GetTime() + 2.0
				Mission.watch_player_time = GetTime() + 999999.9
				Mission.watch_player = false
				Mission.truck_message = false
				Mission.on_to_base = true
			end
		end
	end


	if ((Mission.on_to_base) and (IsAlive(Mission.shabayev)) and (IsAlive(Mission.truck))) then
	
		if (Mission.onto_base_time < GetTime()) then
		
			Mission.onto_base_time = GetTime() + 2.0


			if ((not Mission.scavs_found) and (GetDistance(Mission.shabayev,"scav_point") < 40.0)) then
			
				LookAt(Mission.shabayev,Mission.player)


				if (GetDistance(Mission.shabayev,Mission.player) > 300.0) then
				
					Mission.player_lost = true
				end

				Mission.scavs_found = true
			end


			if ((Mission.scavs_found) and (not Mission.player_lost)) then
			
				if (not Mission.endbase_detected) then
				
					LookAt(Mission.shabayev,Mission.dead_scav1)
					Mission.look_time = GetTime() + 3.0
					Mission.at_player = false
					Mission.talk = AudioMessage("isdf0235.wav") -- (Mission.shab) Constructor and Scavengers - these guys didn't have a chance. I'm detecting the base lets go!!
					Mission.endbase_detected = true
				end
			end


			if ((Mission.endbase_detected) and (not Mission.after_scavs) and (IsAudioMessageDone(Mission.talk))) then
			
				Retreat(Mission.shabayev,"sue_path")
				Mission.look_time = GetTime() + 999999.9
				Mission.sue_check = GetTime() + 1.0
				Mission.after_scavs = true
			end


			if ((Mission.after_scavs) and (Mission.sue_check < GetTime())) then
			
				Mission.sue_check = GetTime() + 1.0

				if (GetDistance(Mission.shabayev,"sue_point") < 40.0) then
				
					AudioMessage("isdf0238.wav") -- (Mission.shab) this looks like it, lets move inside - stick with me!
					Mission.onto_base_time = GetTime() + 4.0
					LookAt(Mission.shabayev,Mission.player)
					Mission.look_time = GetTime() + 5.0
					Mission.at_player = true

					if (not Mission.truck_following) then
					
						Mission.get_truck_time =  GetTime() + 2.0
						Mission.truck_message = true
					end

					Mission.at_base = true
--[[

					if (GetDistance(Mission.shabayev,truck) > 150.0) then
					
						AudioMessage("isdf0236.wav") -- (Mission.shab) this looks like it, lets wait here for the truck before going in
						Mission.onto_base_time = GetTime() + 10.0
						Mission.safe_check = GetTime() + 2.0
						LookAt(Mission.shabayev,Mission.player)
						Mission.look_time = GetTime() + 5.0
						Mission.at_player = true


						if (not Mission.truck_following) then
						
							Mission.get_truck_time =  GetTime() + 2.0
							Mission.truck_message = true
						end

						Mission.truck_wait = true
						Mission.at_base = true
					
					else
					
						AudioMessage("isdf0237.wav") -- (Mission.shab) this looks like it, lets move inside - stick with me!
						Mission.onto_base_time = GetTime() + 10.0
						Mission.safe_check = GetTime() + 2.0
						LookAt(Mission.shabayev,Mission.player)
						Mission.look_time = GetTime() + 5.0
						Mission.at_player = true


						if (not Mission.truck_following) then
						
							Mission.get_truck_time =  GetTime() + 2.0
							Mission.truck_message = true
						end

						Mission.at_base = true
					end

]]
				end
			end
		end
	end
end



-- this is second Mission.jammer code



if ((Mission.temp_spawn) and (not Mission.jammer2_dead)) then

	if (IsAlive(Mission.jammer2)) then
	
		if ((Mission.start_second_morph) and (Mission.jammer_message_time < GetTime())) then
		
			if (not Mission.scrammbled_message2) then
			
				Mission.garbble = AudioMessage("isdf0213a.wav") -- (Mission.shab) *Mission.shab's garbled message*
				Mission.jammer_message_time = GetTime() + 25.0
				Mission.scrammbled_message2 = true
			
			else
			
				Mission.garbble = AudioMessage("isdf0213a.wav") -- (Mission.shab) *SECOND Mission.shab's garbled message*
				Mission.jammer_message_time = GetTime() + 15.0
				Mission.scrammbled_message2 = false
			end
		end
	
	else
	
		if (not Mission.jammer2_dead_message) then
		
			if (IsAlive(Mission.temp1)) then
			
				if (IsAlive(Mission.temp2)) then
				
					if (IsAlive(Mission.temp3)) then
					
						AudioMessage("isdf0251.wav")--(Mission.shab) we got 3 left

						Attack(Mission.temp1,Mission.truck)
						Attack(Mission.temp2,Mission.truck)
						Attack(Mission.temp3,Mission.truck)

						Mission.three_to_go = true
						Mission.jammer2_dead_message = true
					
					else
					
						AudioMessage("isdf0252.wav")--(Mission.shab) we got 2 left

						Attack(Mission.temp1,Mission.truck)
						Attack(Mission.temp2,Mission.truck)

						Mission.two_to_go = true
						Mission.jammer2_dead_message = true
					end
				
				elseif (IsAlive(Mission.temp3)) then
				
					AudioMessage("isdf0252.wav")--(Mission.shab) we got 2 left

					Attack(Mission.temp1,Mission.truck)
					Attack(Mission.temp3,Mission.truck)

					Mission.two_to_go = true
					Mission.jammer2_dead_message = true
				
				else
				
					AudioMessage("isdf0253.wav")--(Mission.shab) we got 1 left

					Attack(Mission.temp1,Mission.truck)

					Mission.one_to_go = true
					Mission.jammer2_dead_message = true
				end
			
			elseif (IsAlive(Mission.temp2)) then
			
				if (IsAlive(Mission.temp3)) then
				
					AudioMessage("isdf0252.wav")--(Mission.shab) we got 2 left
					
					Attack(Mission.temp2,Mission.truck)
					Attack(Mission.temp3,Mission.truck)
					
					Mission.two_to_go = true
					Mission.jammer2_dead_message = true
				
				else
				
					AudioMessage("isdf0253.wav")--(Mission.shab) we got 1 left

					Attack(Mission.temp2,Mission.truck)

					Mission.one_to_go = true
					Mission.jammer2_dead_message = true
				end
			
			elseif (IsAlive(Mission.temp3)) then
			
				AudioMessage("isdf0253.wav")--(Mission.shab) we got 1 left

				Attack(Mission.temp3,Mission.truck)

				Mission.one_to_go = true
				Mission.jammer2_dead_message = true
			end
		end

		-- this is special to remove the builder

		if (not Mission.builder_dead) then
		
			Damage(Mission.builder1,2000)
		end
		--------------------------------------/

		Mission.jammer_message_time = GetTime() + 999999.9
		Mission.jammer2_dead = true
	end
end


if (Mission.three_to_go) then

	if (not Mission.two_to_go) then
	
		if ((not IsAlive(Mission.temp1)) and (IsAlive(Mission.temp2)) and (IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0254.wav")--(Mission.shab) we got 2 left
			Mission.two_to_go = true
		
		elseif ((not IsAlive(Mission.temp2)) and (IsAlive(Mission.temp1)) and (IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0254.wav")--(Mission.shab) we got 2 left
			Mission.two_to_go = true

		elseif ((not IsAlive(Mission.temp3)) and (IsAlive(Mission.temp1)) and (IsAlive(Mission.temp2))) then
		
			AudioMessage("isdf0254.wav")--(Mission.shab) we got 2 left
			Mission.two_to_go = true
		end
	
	elseif (not Mission.one_to_go) then
	
		if ((IsAlive(Mission.temp1)) and (not IsAlive(Mission.temp2)) and (not IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0255.wav")--(Mission.shab) we got 1 left
			Mission.one_to_go = true
		
		elseif ((not IsAlive(Mission.temp1)) and (IsAlive(Mission.temp2)) and (not IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0255.wav")--(Mission.shab) we got 1 left
			Mission.one_to_go = true

		elseif ((not IsAlive(Mission.temp1)) and (not IsAlive(Mission.temp2)) and (IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0255.wav")--(Mission.shab) we got 1 left
			Mission.one_to_go = true
		end
	end

elseif (Mission.two_to_go) then

	if (not Mission.one_to_go) then
	
		if ((IsAlive(Mission.temp1)) and (not IsAlive(Mission.temp2)) and (not IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0255.wav")--(Mission.shab) we got 1 left
			Mission.one_to_go = true
		
		elseif ((not IsAlive(Mission.temp1)) and (IsAlive(Mission.temp2)) and (not IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0255.wav")--(Mission.shab) we got 1 left
			Mission.one_to_go = true

		elseif ((not IsAlive(Mission.temp1)) and (not IsAlive(Mission.temp2)) and (IsAlive(Mission.temp3))) then
		
			AudioMessage("isdf0255.wav")--(Mission.shab) we got 1 left
			Mission.one_to_go = true
		end		
	end
end


--[[
----------------------------------------------------------------------
end

if ((not Mission.at_base) and (Mission.made_cheat) and (Mission.start_cheat < GetTime())) then

	Mission.onto_base_time = GetTime() + 1.0
	Mission.shabayev = Mission.cheat
	SetAvoidType(Mission.shabayev,0)
	SetSkill(Mission.shabayev,3)
	Mission.truck_following = true
	Mission.player_lost = false
	Mission.truck_wait = true
	Mission.at_base = true
end
----------------------------------------------------------------------
]]

-- this is after the second battle and on to the base



if (Mission.at_base) then

	if ((IsAlive(Mission.shabayev)) and (IsAlive(Mission.truck))) then
	
		if ((not Mission.move_to_center) and (Mission.onto_base_time < GetTime())) then
		
			Mission.onto_base_time = GetTime() + 0.5

			if ((Mission.truck_following) and (not Mission.player_lost) and (Mission.truck_wait)) then
			
				if (GetDistance(Mission.shabayev,Mission.player) < 100.0) then --and (GetDistance(Mission.shabayev,truck) < 150.0)) then
				
					AudioMessage("isdf0238.wav") -- (Mission.shab) Ok, lets move in - stay sharp!
					Goto(Mission.shabayev,"base_center")

					if (IsAlive(Mission.last_turret1)) then
					
						SetAvoidType(Mission.last_turret1,0)
						Retreat(Mission.last_turret1,"last_turret_path")
					end

					if (IsAlive(Mission.last_turret2)) then
					
						SetAvoidType(Mission.last_turret2,0)
						Retreat(Mission.last_turret2,"last_turret_path")
					end

					Mission.center_check = GetTime() + 0.5
					Mission.look_time = GetTime() + 999999.9
					Mission.truck_message = false
					Mission.move_to_center = true
				end
			
			elseif ((Mission.truck_following) and (not Mission.player_lost)) then
			
				Goto(Mission.shabayev,"base_center")

				if (IsAlive(Mission.last_turret1)) then
				
					SetAvoidType(Mission.last_turret1,0)
					Retreat(Mission.last_turret1,"last_turret_path")
				end

				if (IsAlive(Mission.last_turret2)) then
				
					SetAvoidType(Mission.last_turret2,0)
					Retreat(Mission.last_turret2,"last_turret_path")
				end

				Mission.center_check = GetTime() + 0.5
				Mission.look_time = GetTime() + 999999.9
				Mission.move_to_center = true
			end
		end


		if ((Mission.move_to_center) and (not Mission.at_center) and (Mission.center_check < GetTime())) then
		
			Mission.center_check = GetTime() + 0.5


			if ((not Mission.hit_hard_message) and ((GetDistance(Mission.shabayev,"base_center")) < (GetDistance(Mission.shabayev,"sue_point")))) then
			
				Mission.talk = AudioMessage("isdf0239.wav") -- (Mission.shab) looks like those things hit here pretty hard!
				Mission.hit_hard_message = true
			end

--[[
			if (GetDistance(Mission.shabayev,"base_center") < 40.0) then
			
				if (IsAround(Mission.cons)) then
				
					Goto(Mission.shabayev,Mission.cons)
				end

				AudioMessage("isdf0257.wav") -- (Mission.shab) theres the power plants - instruct the truck to repair them the same you had it repair me
				Mission.at_center = true
			end
]]
		end


		-- this is making the turrets deploy

		if ((not Mission.last_turret1_dead) and (not Mission.turrets_stop) and (Mission.move_to_center)) then
		
			if (IsAlive(Mission.last_turret1)) then
			
				if (GetDistance(Mission.last_turret1,"base_center") < 20.0) then
				
					--Stop(Mission.last_turret1,0)
					Attack(Mission.last_turret1,Mission.shabayev)

					if (IsAlive(Mission.last_turret2)) then
					
						--Stop(Mission.last_turret2,0)
						Attack(Mission.last_turret1,Mission.player)
					end

					Mission.turrets_stop = true
				end
			
			elseif (IsAlive(Mission.last_turret2)) then
			
				if (GetDistance(Mission.last_turret2,"base_center") < 20.0) then
				
					--Stop(Mission.last_turret2,0)
					Attack(Mission.last_turret2,Mission.player)
					Mission.turrets_stop = true
				end
			end
		end
		------------------------------------------/

			
		-- this is Mission.shab attacking the turret

		if (not Mission.attack_last_turret1) then
		
			if (IsAlive(Mission.last_turret1)) then
			
				if ((Mission.hit_hard_message) and (IsAudioMessageDone(Mission.talk))) then
				
					Attack(Mission.shabayev,Mission.last_turret1)
					AudioMessage("isdf0264.wav") -- we've got company
					Mission.attack_last_turret1 = true
				end

				if (Mission.at_base) then
				
					if ((GetTime() - GetLastEnemyShot(Mission.last_turret1) < .2) or (GetTime() - GetLastEnemyShot(Mission.last_turret1) < .2)) then
					
						Attack(Mission.shabayev,Mission.last_turret1)
						AudioMessage("isdf0264.wav") -- we've got company
						Mission.attack_last_turret1 = true
					end
				end
			
			elseif ((Mission.at_base) and (IsAlive(Mission.last_turret2))) then
			
				Attack(Mission.shabayev,Mission.last_turret2)
				AudioMessage("isdf0264.wav") -- we've got company
				Mission.attack_last_turret1 = true
				Mission.attack_last_turret2 = true
			end
		end

		-- this sends her after the last turret

		if ((not Mission.attack_last_turret2) and (Mission.attack_last_turret1)) then
		
			if (not IsAlive(Mission.last_turret1)) then
			
				Attack(Mission.shabayev,Mission.last_turret2)
				Mission.attack_last_turret2 = true
			end
		end
		------------------------------------------/


		-- checks to see when the last turret dies

		if ((not Mission.last_turret1_dead) and (not IsAlive(Mission.last_turret1)) and (not IsAlive(Mission.last_turret2))) then
		
			Goto(Mission.shabayev,"base_center")
			Mission.last_turret1_dead = true
		end
		------------------------------------------


		-- this is Mission.shab telling the Mission.player about the Mission.plan to get the constructor

		if ((not Mission.plan) and (Mission.at_base) and (Mission.last_turret1_dead)) then
		
			if (GetDistance(Mission.shabayev,"base_center") < 30.0) then
			
				Mission.talk = AudioMessage("isdf0257a.wav")-- (Mission.shab) This place is crawling - we've got to get power online to this base now!
												 -- I have an idea - follow me!	
				Mission.onto_base_time = GetTime() + 3.0
				
				LookAt(Mission.shabayev,Mission.player)
				Goto(Mission.truck,"sue_point",0)

				--if (IsAround(Mission.dead_power1)) then
				--
				--	LookAt(Mission.shabayev,Mission.dead_power1)
				--end
				--elseif (IsAround(Mission.dead_power2)) then
				--
				--	LookAt(Mission.shabayev,Mission.dead_power2)
				--end
				
				Mission.plan = true
			end
		end
		------------------------------------------/


		-- this makes Mission.shab look at the Mission.player

		if ((not plan2) and (Mission.plan) and (Mission.onto_base_time < GetTime())) then
		
			--LookAt(Mission.shabayev,Mission.player)

			if (IsAround(Mission.dead_power1)) then
			
				LookAt(Mission.shabayev,Mission.dead_power1)
			
			elseif (IsAround(Mission.dead_power2)) then
			
				LookAt(Mission.shabayev,Mission.dead_power2)
			end

			plan2 = true
		end
		------------------------------------------/


		-- this is sending Mission.shab to the constructor

		if ((not Mission.on_to_construct) and (Mission.plan) and (IsAudioMessageDone(Mission.talk))) then
		
			Goto(Mission.shabayev,"to_builder_path")
			Mission.on_to_construct = true
		end
		------------------------------------------/
	end
end

	-- make sure Mission.cons stays around
	if (not Mission.shab_switch and  not Mission.game_over) then
	
		if (not IsAround(Mission.cons)) then
		
			FailMission(GetTime() + 7.0, "isdf02L1.txt")
			Mission.game_over = true
		end
	end

	-- this is the new ending code with the constructor
	
	if (Mission.on_to_construct) then
	
		if ((not Mission.shab_find_con) and (GetDistance(Mission.shabayev,Mission.cons) < 30.0)) then
		
			LookAt(Mission.shabayev,Mission.cons)
			Mission.con_wait = GetTime() + 5.0
			Mission.shab_find_con = true
		end


		-- this is switching out Mission.shab
		if ((not Mission.shab_switch) and (Mission.shab_find_con) and (Mission.con_wait < GetTime())) then
		
			
			pos = GetTransform(Mission.shabayev)
			RemoveObject(Mission.shabayev)
			Mission.shabayev = BuildObject("ivscout_vsr",1,pos)
			Mission.con_wait = GetTime() + 0.5
			Mission.shab_switch = true
		end


		if ((Mission.shab_switch) and (not Mission.shab_hop_out) and (Mission.con_wait < GetTime())) then
		
			Mission.con_wait = GetTime() + 1.0

			if (GetDistance(Mission.shabayev,Mission.player) < 70.0) then
			
				HopOut(Mission.shabayev)
				SetObjectiveOff(Mission.shabayev)
				Mission.shab_hop_out = true
			end
		end


		if ((Mission.shab_hop_out) and (Mission.shab_out) and (not Mission.shab_to_con)) then
		
			if (IsAround(Mission.shab2)) then
			
				Goto(Mission.shab2,"con_spawn",1)
				--GetIn(Mission.shab2,Mission.cons,1)
				Mission.shab_to_con = true
			end
		end


		-- this is putting Mission.shab in the Mission.cons

		if ((Mission.shab_out) and (not Mission.shab_in)) then
		
			if (not IsAround(Mission.shab2)) then
			
				Mission.shab_dead = true
			end

			if (not IsAround(Mission.cons)) then
			
				Mission.cons_dead = true
			end

			if ((IsAround(Mission.cons)) and (IsAround(Mission.shab2))) then
			
				if (GetDistance(Mission.cons,Mission.shab2) < 10.0) then
				
					RemoveObject(Mission.shab2)

					SetTeamNum(Mission.cons,1)

					SetAnimation(Mission.cons,"startup",1)

					SetObjectiveOn(Mission.cons)
					SetObjectiveName(Mission.cons,"Cmd. Shabayev")

					Mission.prep_wait = GetTime() + 3.0

					Mission.safe_check = GetTime() + 2.0
--[[
					RemoveObject(Mission.cons)
					Mission.shabayev = BuildObject("ivpcon",1,"con_spawn")

					--Mission.tester = BuildObject("ivpcon",1,Mission.cons)
					--RemoveObject(Mission.cons)
					--Mission.shabayev = Mission.tester
	
					Stop(Mission.shabayev)
					SetAvoidType(Mission.shabayev,0)
					SetObjectiveOn(Mission.shabayev)
					SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
]]

					Mission.shab_in = true
				end
			end
		end


		-- this is Mission.shab talking in the constructor

		if ((Mission.shab_in) and (not Mission.prep_cons) and (Mission.prep_wait < GetTime())) then
		
			Mission.talk = AudioMessage("isdf0258a.wav") --(Mission.shab) I'm going to build a power plant
			Mission.prep_wait = GetTime() + 5.0
			Mission.prep_cons = true
		end
		------------------------------------------/


		-- this is me switching out the Mission.cons after the animation plays

		if ((not Mission.startup_over) and (Mission.prep_cons) and (Mission.prep_wait < GetTime())) then
		
			RemoveObject(Mission.cons)
			Mission.shabayev = BuildObject("ivpcon",1,"con_spawn")
			Stop(Mission.shabayev)
			SetAvoidType(Mission.shabayev,0)
			SetObjectiveOn(Mission.shabayev)
			SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
			Mission.prep_wait = GetTime() + 1.0
			Mission.startup_over = true
		end
		------------------------------------------/


		-- preping the power plant

		if ((Mission.startup_over) and (not Mission.new_prep) and (Mission.prep_wait < GetTime())) then
		
			Build(Mission.shabayev,"ibpgn1")
			Mission.prep_wait = GetTime() + 0.2
			Mission.new_prep = true
		end
		------------------------------------------/


		-- sending her to the base

		if ((not Mission.return_to_base) and (Mission.new_prep) and (Mission.prep_wait < GetTime())) then
		
			Goto(Mission.shabayev,"to_power_path2")
			Mission.prep_wait = GetTime() + 10.0
			Mission.return_to_base = true
		end
		------------------------------------------/


		if ((Mission.return_to_base) and (not Mission.to_power_spot) and (Mission.prep_wait < GetTime())) then
		
			Mission.prep_wait = GetTime() + 1.0

			-- building the power plant

			if (GetDistance(Mission.shabayev,"back_at_base") < 20.0) then
			
				AudioMessage("isdf0262.wav") -- (Mission.shab) OK I'm starting to build
				Dropoff(Mission.shabayev,"power_point",1)

				if (IsAlive(Mission.scion3)) then
				
					Attack(Mission.scion3,Mission.shabayev)
				end

				Mission.to_power_spot = true
			end
			------------------------------------------/
		end
	end


-- this is the code that conducts the final attack on Mission.shab and john

if (Mission.return_to_base) then

	if ((not Mission.surprise_spawn) and (Mission.safe_check < GetTime())) then
	
		Mission.safe_check = GetTime() + 2.0


		if (GetDistance(Mission.player,"base_espawn2") > 200.0) then
		
			Mission.scion1 = BuildObject("fvpsnt",2,"base_espawn1")
			Mission.scion2 = BuildObject("fvpsnt",2,"base_espawn2")
			Mission.scion3 = BuildObject("fvpsnt",2,"base_espawn3")
			Attack(Mission.scion1,Mission.shabayev)
			Attack(Mission.scion2,Mission.shabayev)
			Goto(Mission.scion3,"base_center")
			Mission.safe_check = GetTime() + 2.0
			Mission.surprise_spawn = true
		end
	end

	-- this is making the scion morph

	if ((Mission.surprise_spawn) and (not Mission.surprise_attack) and (Mission.safe_check < GetTime())) then
	
		Mission.safe_check = GetTime() + 1.0

		if ((IsAlive(Mission.scion2)) and (IsAlive(Mission.shabayev))) then
		
			if ((GetDistance(Mission.scion2,Mission.shabayev) < 100.0) or (GetDistance(Mission.scion2,Mission.player) < 70.0)) then
			
				AudioMessage("isdf0259.wav") -- (Mission.shab) we've got company
				--Attack(Mission.scion2,Mission.shabayev)
				Mission.surprise_attack = true
			end
		
		elseif ((IsAlive(Mission.scion1)) and (IsAlive(Mission.shabayev))) then
		
			if ((GetDistance(Mission.scion1,Mission.shabayev) < 100.0) or (GetDistance(Mission.scion1,Mission.player) < 70.0)) then
			
				AudioMessage("isdf0259.wav") -- (Mission.shab) we've got company
				--Attack(Mission.scion1,Mission.shabayev)
				Mission.surprise_attack = true
			end
		end
	end
	------------------------------------------/

	if ((not Mission.last_wave_dead) and (not Mission.extra_help) and (Mission.surprise_spawn)) then
	
		if ((not IsAlive(Mission.scion1)) and (IsAlive(Mission.scion3))) then
		
			Mission.scion1 = BuildObject("fvpsnt",2,"base_espawn1")
			Attack(Mission.scion1,Mission.shabayev)
			Mission.extra_help = true
		end
	end

	-- this is checking to see when the last wave is dead

	if ((Mission.surprise_spawn) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
	
		Mission.last_wave_dead = true
	end
	------------------------------------------/
end



----------------------------------------------------------------------
--if (not Mission.ON_HOLD) then
--
----------------------------------------------------------------------

----------------------------------------------------------------------
end
----------------------------------------------------------------------



-- these are the win/loose conditions


if (not Mission.game_over) then

		-- this is if the Mission.player's ship gets destroyed then
	if ((Mission.player_ship == nil) and (not Mission.ship_destroyed)) then
	
		Mission.ship_destroyed_time = GetTime() + 2.0
		Mission.ship_destroyed = true
	end


	if ((Mission.ship_destroyed) and (not Mission.game_over) and (Mission.ship_destroyed_time < GetTime())) then
	
		AudioMessage("isdf0154.wav") -- (Mission.shab) we don't have another ship in the area!
		FailMission(GetTime() + 7.0)
		Mission.game_over = true
	end


	if ((Mission.first_warning) and (not Mission.game_over) and (Mission.first_warning_time < GetTime())) then
	
		AudioMessage("isdf0242.wav") -- (Mission.shab) if you cannot follow my orders I'll leave you behind then
		FailMission(GetTime() + 7.0)
		Mission.game_over = true
	end


	if ((Mission.return_message1) and (not Mission.game_over) and (Mission.player_lost_time < GetTime())) then
	
		AudioMessage("isdf0242.wav") -- (Mission.shab) if you cannot follow my orders I'll leave you behind then
		FailMission(GetTime() + 7.0)
		Mission.game_over = true
	end


	-- this is checking to see if Mission.shabayev gets killed then

	if ((not Mission.shab_hop_out) and (Mission.free_truck) and (not IsAround(Mission.shabayev))) then
	
		if (IsAlive(Mission.truck)) then
		
			AudioMessage("isdf0243.wav") -- (truck) you let the commander get killed!
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		
		else
		
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		end
	
	elseif ((Mission.startup_over) and (not IsAround(Mission.shabayev))) then
	
		if (IsAlive(Mission.truck)) then
		
			AudioMessage("isdf0243.wav") -- (truck) you let the commander get killed!
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		
		else
		
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		end
	end
	------------------------------------------------/


	if ((not IsAlive(Mission.truck)) and (IsAlive(Mission.shabayev))) then
	
		AudioMessage("isdf0244.wav") -- (Mission.shab) you let the truck get killed!
		FailMission(GetTime() + 7.0)
		Mission.game_over = true
	end


	if ((not Mission.shab_in) and (Mission.cons_dead)) then
	
		FailMission(GetTime() + 7.0)
		AudioMessage("isdf0260.wav") -- (Mission.shab) I need that constructor!
		Mission.game_over = true
	end


	if (Mission.shab_dead) then
	
		if (IsAlive(Mission.truck)) then
		
			AudioMessage("isdf0243.wav") -- (truck) you let the commander get killed!
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		
		else
		
			FailMission(GetTime() + 7.0)
			Mission.game_over = true
		end
	end


	if ((not Mission.movie1) and (Mission.base_powered) and (Mission.last_wave_dead)) then
	
		AudioMessage("cin0201.wav") -- (Mission.shab) well done john!

		Mission.pole3_time = GetTime() + 2.0
		Mission.pole4_time = GetTime() + 3.5
		Mission.pole5_time = GetTime() + 5.0
		Mission.pole6_time = GetTime() + 6.5
		Mission.pole7_time = GetTime() + 8.0
		Mission.pole8_time = GetTime() + 9.5
		Mission.pole9_time = GetTime() + 11.0
		Mission.pole10_time = GetTime() + 12.5
		Mission.pole11_time = GetTime() + 14.0

		if (IsAround(Mission.pole3)) then
		
			RemoveObject(Mission.pole3)
			Mission.pole3 = BuildObject("pbtele01a",0,"pole3_point")
		end
		if (IsAround(Mission.pole4)) then
		
			RemoveObject(Mission.pole4)
			Mission.pole4 = BuildObject("pbtele01a",0,"pole4_point")
		end
		if (IsAround(Mission.pole5)) then
		
			RemoveObject(Mission.pole5)
			Mission.pole5 = BuildObject("pbtele01a",0,"pole5_point")
		end
		if (IsAround(Mission.pole6)) then
		
			RemoveObject(Mission.pole6)
			Mission.pole6 = BuildObject("pbtele01a",0,"pole6_point")
		end
		if (IsAround(Mission.pole7)) then
		
			RemoveObject(Mission.pole7)
			Mission.pole7 = BuildObject("pbtele01a",0,"pole7_point")
		end
		if (IsAround(Mission.pole8)) then
		
			RemoveObject(Mission.pole8)
			Mission.pole8 = BuildObject("pbtele01a",0,"pole8_point")
		end
		if (IsAround(Mission.pole9)) then
		
			RemoveObject(Mission.pole9)
			Mission.pole9 = BuildObject("pbtele01a",0,"pole9_point")
		end
		if (IsAround(Mission.pole10)) then
		
			RemoveObject(Mission.pole10)
			Mission.pole10 = BuildObject("pbtele01a",0,"pole10_point")
		end
		if (IsAround(Mission.pole11)) then
		
			RemoveObject(Mission.pole11)
			Mission.pole11 = BuildObject("pbtele01a",0,"pole11_point")
		end

		Mission.movie1 = true
	end

	-- this is the movie code
	
	if ((Mission.movie1) and (not Mission.game_over)) then
	
		if (not Mission.firstFrame)  then
		
			CameraReady()

			Mission.firstFrame = true
		end

		CameraPath("camera_point2", 700, 0, Mission.look_pole)
		--Mission.movie1 = PlayMovie("lights2")
	end
	------------------------------------------/


	-- this switches the poles

	if ((not Mission.pole3_switch) and (Mission.pole3_time < GetTime())) then
	
	
		pos = GetPosition(Mission.pole3)
		RemoveObject(Mission.pole3)
		Mission.pole3 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole3)
		--BuildObject("pbtele01",0,"pole3_point")
		Mission.pole3_switch = true
	end

	if ((not Mission.pole4_switch) and (Mission.pole4_time < GetTime())) then
	
	
		pos = GetPosition(Mission.pole4)
		RemoveObject(Mission.pole4)
		Mission.pole4 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole4)
		--BuildObject("pbtele01",0,"pole4_point")
		Mission.pole4_switch = true
	end

	if ((not Mission.pole5_switch) and (Mission.pole5_time < GetTime())) then
	
		pos = GetPosition(Mission.pole5)
		RemoveObject(Mission.pole5)
		Mission.pole5 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole5)
		--BuildObject("pbtele01",0,"pole5_point")
		Mission.pole5_switch = true
	end

	if ((not Mission.pole6_switch) and (Mission.pole6_time < GetTime())) then
	
		pos = GetPosition(Mission.pole6)
		RemoveObject(Mission.pole6)
		Mission.pole6 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole6)
		--BuildObject("pbtele01",0,"pole6_point")
		Mission.pole6_switch = true
	end

	if ((not Mission.pole7_switch) and (Mission.pole7_time < GetTime())) then
	
		pos = GetPosition(Mission.pole7)
		RemoveObject(Mission.pole7)
		Mission.pole7 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole7)
		--BuildObject("pbtele01",0,"pole7_point")
		Mission.pole7_switch = true
	end

	if ((not Mission.pole8_switch) and (Mission.pole8_time < GetTime())) then
	
		pos = GetPosition(Mission.pole8)
		RemoveObject(Mission.pole8)
		Mission.pole8 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole8)
		--BuildObject("pbtele01",0,"pole8_point")
		Mission.pole8_switch = true
	end

	if ((not Mission.pole9_switch) and (Mission.pole9_time < GetTime())) then
	
		pos = GetPosition(Mission.pole9)
		RemoveObject(Mission.pole9)
		Mission.pole9 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole9)
		--BuildObject("pbtele01",0,"pole9_point")
		Mission.pole9_switch = true
	end

	if ((not Mission.pole10_switch) and (Mission.pole10_time < GetTime())) then
	
		pos = GetPosition(Mission.pole10)
		RemoveObject(Mission.pole10)
		Mission.pole10 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole10)
		--BuildObject("pbtele01",0,"pole10_point")
		Mission.pole10_switch = true
	end

	if ((not Mission.pole11_switch) and (Mission.pole11_time < GetTime())) then
	
		pos = GetPosition(Mission.pole11)
		RemoveObject(Mission.pole11)
		Mission.pole11 = BuildObject("pbtele01",1,pos)

		--RemoveObject(Mission.pole11)
		--BuildObject("pbtele01",0,"pole11_point")
		Mission.pole11_time = GetTime() + 2.0
		Mission.pole11_switch = true
	end
	------------------------------------------/


	if ((Mission.pole11_switch) and (Mission.pole11_time < GetTime())) then
	
		SucceedMission(GetTime() + 0.1,"isdf02w1.txt")
		CameraFinish()
		Mission.game_over = true
	end
	------------------------------------------/
end


 	
end