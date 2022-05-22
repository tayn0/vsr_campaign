--[[

THIS IS A TEST
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
	movie1 = true,
	movie2 = false,
	reframe1 = false,
	ON_HOLD = false,

	start_done = false,
	shab_down_path1 = false,
	what_doing = false,
	didnt_listen = false,
	shab_down_path2 = false, 
	at_doors = false,
	shab_down_path3 = false,
	shab_at_point1 = false,
	shab_at_cliff = false,
	shab_at_point2 = false,
	shab_at_point3 = false,
	shab_down_tight = false,
	shab_at_base = false,
	player_lost = false,
	player_lost2 = false,
	set_lost_times = false,
	second_warning = false,
	game_over = false,
	squad1_start = false,
	squad1_off = false,
	shab_shot = false,
	first_time = true,
	roger_message = false,
	message1 = false,
	base_center = false,
	left_base = false,
	shab_centered =false,
	shab_to_center = false,
	search_base = false,
	return_to_base = false,
	return_to_base2 = false,
	encouragement = false,
	first_leave = false,
	wingman_away = false,
	shab_to_tunnel = false,
	comm_identified = false,
	johns_orders = false,
	comm_help = false,
	find_herself = false,
	shab_at_comm = false,
	ship_destroyed = false,
	wingman_message1 = false,
	shab_response = false,
	shab_warning1 = false,
	shab_response1 = false,
	john_in_ship = false,
	on_route = false,
	base_detected = false,
	throttle_down = false,
	in_range = false,
	targeted = false,
	scion1_target = false,
	scion2_target = false,
	coward_message = false,
	in_combat = false,
	battle1_over = false,
	roger1 = false,
	wingman_report = false,
	next_wave1 = false,
	returned = false,
	second_dead = false,
	base_return = false,
	mayday_message1 = false,
	mayday_message2 = false,
	mayday_message3 = false,
	mayday_message4 = false,
	mayday_message5 = false,
	next_detected = false,
	john_away = false,
	attack2 = false,
	truck_return = false,
	freed = false,
	john_close = false,
	battle2_over = false,
	thanks_message = false,
	red1_return = false,
	coward2 = false,
	truck_found = false,
	no_find_truck = false,
	truck_response1 = false,
	truck_response2 = false,
	truck_response3 = false,
	last_wave_dead = false,
	last_spawned = false,
	out_of_ship = false,
	inside = false,
	fire_message = false,
	at_player = false,
	squad1_astop = false,
	squad1_bstop = false,
	squad1_cstop = false,
	jumped = false,
	cheat_death = false,
	giveahand = false,
	bubba = false,
	cliff_fall = false,
	player_there = false,
	wingat_player = false,
	single_dead = false,
	bang_up_message = false,
	return_message = false,
	radio_for_help = false,
	alt_message1 = false,
	alt_message2 = false,
	alt_message3 = false,
	alt_message4 = false,
	to_goalone = false,
	change_look1 = false,
	goto_sbay = false,
	at_sbay = false,
	last_message = false,
	last_message2 = false,
	last_attack = false,
	gus = false,
	the_end = false,
	tubby = false,
	wait_4_wing = false,
	wing_orders = false,
	go_shab_go = false,
	squad1_talk = false,
	wing_look = false,
	wing_first = false,
	wingman_there = false,
	shab_through = false,
	to_comm = false,
	shab_wait = false,
	done = false,
	shab_hold = false,
	wing_hold = false,
	plane_time_set = false,
	reroute1 = false,
	player_off = false,
	stayput = false,
	door_open = false,
	release_crew = false,
	up_quake = false,
	landed = false,
	pilot_speak1 = false,
	pilot_speak2 = false,
	pilot_speak3 = false,
	landed_message = false,
	free_player = false,
	clear_warning = false,
	remove_condor1 = false,
	remove_condor2 = false,
	go_shab_go2 = false,
	turret_detected = false,
	turret_retreat = false,
	shab_turret_comment = false,
	shab_cutoff_turret = false,
	turret_dead = false,
	turret_deploy = false,
	turret_hostle = false,
	alert_skyeye = false,
	simms_turret_comment = false, 
	shab_weapon_comment = false,
	wing_lookat_turret = false,
	in_comm = false, 
	cineractive_over = false, 
	simms_tank_comment = false,
	first_scion_dead = false, 
	simms_panic = false, 
	player_awl = false,
	squad1_stopped = false,
	crate1_dead = false,
	crate2_dead = false, 
	crate3_dead = false, 
	crate4_dead = false, 
	crate5_dead = false, 
	crate6_dead = false, 
	crate7_dead = false,
	crate8_dead = false, 
	last_crate_dead = false,
	red_look_truck = false,
	very_last_message = false,
	extra_spawned = false,
	hold_fire_message = false,
	start_cineractive = false,
	line2 = false, 
	line3 = false, 
	line4 = false, 
	line5 = false, 
	line6 = false, 
	line7 = false,
	camera1_over = false,
	camera2_over = false, 
	first_frame = false, 
	fade_done = false,
	first_squad_removed = false,
	camera3_over = false,
	camera4_over = false, 
	chatter1 = false, 
	chatter_set = false, 
	inside = false,

--  floats
	wait_time = 999999.9,
	wait1_time = 999999.9,
--wait2_time = 10.0,
	wait2_time = 999999.9,
	player_lost_time = 999999.9,
	return_check_time = 999999.9,
	lost_warning_time = 999999.9,
	shot_me_time = 999999.9,
	message_time = 999999.9,
	cliff_check = 999999.9,
	base_check_time = 999999.9,
	comm_check_time = 999999.9,
	shab_comm_check = 999999.9,
	ship_destroyed_time = 999999.9,
	dialog1_time = 999999.9,
	on_route_check = 999999.9,
	john_ship_check = 999999.9,
	coward_check = 999999.9,
	dialog2_time = 999999.9,
	next_wave_time = 999999.9,
	return_time = 999999.9,
	away_check = 999999.9,
	attack_check = 999999.9,
	red1_check = 999999.9,
	truck_check = 999999.9,
	truck_lost_check = 999999.9,
	truck_talk_time = 999999.9,
	away_check2 = 999999.9,
	spawn_check = 999999.9,
	out_check = 999999.9,
	fire_reset = 999999.9,
	look_time = 999999.9,
	squad1_time = 999999.9,
	john_check = 999999.9,
	whatever = 999999.9,
	wing_look_time = 999999.9,
	lula_time = 999999.9,
	to_alone_check = 999999.9,
	facing_time = 999999.9,
	last_check = 999999.9,
	wingman_check = 999999.9,
	tunnel_check = 999999.9,
	planes_wait = 999999.9,
	open_doors_time = 999999.9,
	quake_time = 999999.9,
	pilot_speak_time = 999999.9,
	release_player_time = 999999.9,
	off_drop_check = 999999.9,
	condor2_remove_time = 999999.9,
	condor1_remove_time = 999999.9,
	tit_time = 999999.9,
	wingy = 999999.9,
	really_last_time = 999999.9,
	emit_time = 999999.9,
	camera_time = 999999.9,
	fade_time = 5.0,
	next_shot_time = 999999.9,
	chatter_time = 999999.9,

	
	
--  handles
	player,
	shabayev,
	squad1_a,
	squad1_b,
	squad1_c,
	wingman,
	comm_building,
	player_ship,
	storage_bay,
	condor1,
	condor2,
	turret,
	dead_tank,
	magic_crate,
	crate1,
	crate2,
	crate3,
	crate4,
	crate5,
	crate6,
	--crate7,
	crate8,
	last_crate,
	crumble_cliff,
	look_thing,
	manson,
	scion1,
	scion2,
	scion3,
	red1,
	red2,
	truck,
	holder1,
	holder2, 
	holder3,
	nav,
	smoker1, 
	smoker2, 
	smoker3,
	smoker4,

	pilot,


--  integers
	a = 5,
	x,
	y,
	h1,
	a1,
	h2,
	a2,
	quake_level = 0,
	speak = 0,
	talk = 0,
	line = 0
   
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

	Mission.player = GetPlayerHandle()
	Mission.shabayev = GetHandle("shabayev")
	Mission.squad1_a = GetHandle("squad1_a")
	Mission.squad1_b = GetHandle("squad1_b")
	Mission.squad1_c = GetHandle("squad1_c")
	Mission.wingman = GetHandle("wingman")
	Mission.comm_building = GetHandle("comm_building")
	Mission.player_ship = GetHandle("player_ship")
	Mission.storage_bay = GetHandle("storage_bay")
	Mission.condor1 = GetHandle("condor1")
	Mission.condor2 = GetHandle("condor2")
	Mission.turret = GetHandle("turret")
	Mission.dead_tank = GetHandle("dead_tank")
	Mission.magic_crate = GetHandle("magic_crate")
	Mission.crate1 = GetHandle("crate1")
	Mission.crate2 = GetHandle("crate2")
	Mission.crate3 = GetHandle("crate3")
	Mission.crate4 = GetHandle("crate4")
	Mission.crate5 = GetHandle("crate5")
	Mission.crate6 = GetHandle("crate6")
	--crate7 = GetHandle("crate7")
	Mission.crate8 = nil
	Mission.last_crate = GetHandle("last_crate")
	Mission.crumble_cliff = GetHandle("crumble_cliff")
	Mission.look_thing = GetHandle("look_thing")
	Mission.manson = GetHandle("manson")
	Mission.scion1 = nil
	Mission.scion2 = nil
	Mission.scion3 = nil
	Mission.red1 = nil
	Mission.red2 = nil
	Mission.truck = nil
	Mission.holder1 = nil
	Mission.holder2 = nil 
	Mission.holder3 = nil
	Mission.nav = nil
	Mission.smoker1 = nil 
	Mission.smoker2 = nil 
	Mission.smoker3 = nil
	Mission.smoker4 = nil

	Mission.pilot = nil
   
	SetTeamColor(3,255,50,50)  --Red
	
	PreloadODF("p1scout")
	PreloadODF("fvpsnt")
	PreloadODF("fvpscou")
	PreloadODF("ivserv")
	
	Ally(1,3)
	Ally(3,1)
end

function AddObject(h) --This function is called when an object appears in the game. --

	if (IsOdf(h,"ibnav")) then
	
		Mission.nav = h
		RemoveObject(Mission.nav)
	
	elseif (IsOdf(h,"fspilo")) then
	
		Mission.pilot = h
		Damage(Mission.pilot,100)
		--RemoveObject(Mission.pilot)
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
	
	-- this checks to see of the Mission.player is out of his ship

	if (IsOdf(Mission.player,"ivplysct")) then
	
		Mission.out_of_ship = false
	
	else
	
		Mission.out_of_ship = true
	end
	------------------------------------------------/
--[[
	if (Mission.fade_time < GetTime()) then
	
		Mission.fade_done = true
	end

	if (not Mission.fade_done) then
	
		SetColorFade(0,-5.0,Make_RGBA(0, 0, 0, 255))
	end

]]--

------------------------------------------------------------/	
if (not Mission.ON_HOLD) then

------------------------------------------------------------/	


	
	-- this removes the condors

	if (not Mission.remove_condor1) then
	
		if (Mission.condor1_remove_time < GetTime()) then
		
			RemoveObject(Mission.condor1)
			--RemoveObject(Mission.smoker1)
			--RemoveObject(Mission.smoker2)
			Mission.remove_condor1 = true
		end
	end

	if (not Mission.remove_condor2) then
	
		if (Mission.condor2_remove_time < GetTime()) then
		
			RemoveObject(Mission.condor2)
			--RemoveObject(Mission.smoker3)
			--RemoveObject(Mission.smoker4)
			Mission.remove_condor2 = true
		end
	end
	------------------------------------------------/


	if ((not Mission.player_off) and (not Mission.game_over)) then

		-- this holds the Mission.player in place

		if (not Mission.stayput) then
		
			SetColorFade(1,0.5,Make_RGBA(0, 0, 0, 255))

			--SetColorFade(0, - 1.0,Make_RGBA(0, 0, 0, 255))

			MaskEmitter(Mission.condor2, 0)

			Mission.holder1 = BuildObject("stayput",0,Mission.player)
			Mission.holder2 = BuildObject("stayput",0,Mission.shabayev)
			Mission.holder3 = BuildObject("stayput",0,Mission.wingman)

			RemoveObject(Mission.squad1_a)
			RemoveObject(Mission.squad1_b)
			RemoveObject(Mission.squad1_c)
			SetTeamNum(Mission.shabayev,1)
			SetTeamNum(Mission.wingman,1)
			--SetAvoidType(Mission.squad1_a,0)
			--SetAvoidType(Mission.squad1_b,0)
			--SetAvoidType(Mission.squad1_c,0)
			--Stop(Mission.squad1_a)
			--Stop(Mission.squad1_b)
			--Stop(Mission.squad1_c)

			LookAt(Mission.shabayev,Mission.look_thing)
			LookAt(Mission.wingman,Mission.look_thing)

			StartEarthQuake(5.0)
			Mission.quake_time = GetTime() + 15.0
			Mission.pilot_speak_time = GetTime() + 3.0

			Mission.stayput = true
		end
		------------------------------------------------/

		if (not Mission.free_player) then
	--[[	
			VehicleControls controls
			controls.braccel = 0
			controls.strafe = 0
			controls.jump = 0
			controls.deploy = 0
			controls.eject = 0
			controls.abandon = 0
			controls.fire = 0
			SetControls(Mission.player, controls,
				CTRL_BRACCEL +
				CTRL_STRAFE +
				CTRL_JUMP +
				CTRL_DEPLOY +
				CTRL_EJECT +
				CTRL_ABANDON +
				CTRL_FIRE
				)
	]]--
			controls = {}
			controls.braccel = false
			controls.strafe = false
			controls.jump = false
			controls.deploy = false
			controls.eject = false
			controls.abandon = false
			controls.fire = false
			
			SetControls(Mission.player, controls)



		end

		-- this is the Mission.pilot VO

		if ((not Mission.pilot_speak1) and (Mission.pilot_speak_time < GetTime())) then
		
			ClearObjectives()
			AddObjective("isdf0101a.otf", "WHITE")
			Mission.speak = AudioMessage("isdf0163a.wav")-- (Mission.pilot) crossing 12 hundred watch that wake
			Mission.pilot_speak1 = true
		end


		if ((not Mission.pilot_speak2) and (Mission.pilot_speak1) and (IsAudioMessageDone(Mission.speak))) then
		
			Mission.speak = AudioMessage("isdf0164b.wav") -- (Mission.pilot) roger prepare for landing
			Mission.quake_time = GetTime() + 12.0
			Mission.pilot_speak2 = true
		end
		------------------------------------------------/
	--[[
		-- this is playing the chatter wav

		if (not Mission.chatter1) then
		
			if ((not Mission.chatter_set) and (Mission.pilot_speak2) and (IsAudioMessageDone(Mission.speak))) then
			
				Mission.chatter_time = GetTime() + 5.0
				Mission.chatter_set = true
			end

			if ((Mission.chatter_set) and (Mission.chatter_time < GetTime())) then
			
				Mission.speak = AudioMessage("chatter6.wav") -- (Mission.pilot) chatter
				Mission.chatter_time = GetTime() + 99999.9
				Mission.chatter1 = true
			end
		end
	]]--
		-- this makes the quake bigger

		if ((not Mission.up_quake) and (Mission.quake_time < GetTime())) then
		
			Mission.quake_time = GetTime() + 0.4
			UpdateEarthQuake(30.0)
			Mission.up_quake = true
		end
		------------------------------------------------/


		-- this is the landing

		if ((not Mission.landed) and (Mission.up_quake) and (Mission.quake_time < GetTime())) then
		
			StopEarthQuake()

			LookAt(Mission.shabayev,Mission.look_thing)
			LookAt(Mission.wingman,Mission.look_thing)

			Mission.quake_time = GetTime() + 3.0
			Mission.landed = true
		end
		------------------------------------------------/


		-- this is the on the gound message

		if ((not Mission.landed_message) and (Mission.landed) and (Mission.quake_time < GetTime())) then
		
			Mission.speak = AudioMessage("isdf0164c.wav")-- (Mission.pilot) we are on the ground
			Mission.landed_message = true
		end
		

		-- this is shabs message after the landing

		if ((not Mission.pilot_speak3) and (Mission.landed_message) and (IsAudioMessageDone(Mission.speak))) then
		
			SetObjectiveOn(Mission.shabayev)

			LookAt(Mission.shabayev,Mission.wingman)
			Mission.look_time = GetTime() + 5.0
			Mission.at_player = false

			SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
			Mission.speak = AudioMessage("isdf0165.wav")-- (shab) follow me off the ship
			Mission.open_doors_time = GetTime() + 8.0
			Mission.pilot_speak3 = true
		end
		------------------------------------------------/

	--[[
		-- this will make shab look at the doors

		if ((not Mission.at_doors) and (Mission.pilot_speak3) and (IsAudioMessageDone(Mission.speak))) then
		
			LookAt(Mission.shabayev,Mission.wingman)
			Mission.look_time = GetTime() + 5.0
			Mission.at_doors = true
		end
	]]--
		
		-- this opens the doors

		if ((not Mission.door_open) and (Mission.pilot_speak3) and (Mission.open_doors_time < GetTime())) then
		
			--StartSoundEffect("dropdoor.wav")
			SetAnimation(Mission.condor1,"deploy",1)
			Mission.open_doors_time = GetTime() + 3.0
			Mission.door_open = true
		end
		------------------------------------------------/


		-- this releases the ships

		if ((not Mission.release_crew) and (Mission.door_open) and (Mission.open_doors_time < GetTime())) then
		
			StartSoundEffect("dropdoor.wav")
			RemoveObject(Mission.holder2)
			RemoveObject(Mission.holder3)
			Mission.open_doors_time = GetTime() + 2.0
			Mission.release_crew = true
		end
		------------------------------------------------/


		-- this is holding shab and the Mission.wingman

		if (not Mission.release_crew) then
		
			if (IsAlive(Mission.shabayev)) then
			
				Stop(Mission.shabayev)
			end
			if (IsAlive(Mission.wingman)) then
			
				Stop(Mission.wingman)
			end
		end
		------------------------------------------------/


		-- this sends shab off the ship

		if ((not Mission.start_done) and (Mission.release_crew) and (Mission.open_doors_time < GetTime())) then
		
			MaskEmitter(Mission.condor1, 0)

			SetPerceivedTeam(Mission.turret,1)

			--RemoveObject(Mission.holder2)
			--RemoveObject(Mission.holder3)
			RemoveObject(Mission.look_thing)

			SetAvoidType(Mission.shabayev,0)
			SetAvoidType(Mission.wingman,0)
			Goto(Mission.shabayev,"shab_firststoppoint",1)
			Goto(Mission.wingman,"wingoffdrop_path",1)

			Mission.release_player_time = GetTime() + 2.0

			Mission.squad1_a = BuildObject("p1scout",3,"a_spawn")
			Mission.squad1_b = BuildObject("p1scout",3,"b_spawn")
			Mission.squad1_c = BuildObject("p1scout",3,"c_spawn")
			SetAvoidType(Mission.squad1_a,0)
			SetAvoidType(Mission.squad1_b,0)
			SetAvoidType(Mission.squad1_c,0)
			Stop(Mission.squad1_a)
			Stop(Mission.squad1_b)
			Stop(Mission.squad1_c)

			Mission.open_doors_time = GetTime() + 99999.9

			Mission.start_done = true
		end
		------------------------------------------------/


		-- this frees the Mission.player

		if ((not Mission.free_player) and (Mission.start_done) and (Mission.release_player_time < GetTime())) then
		
			ClearObjectives()
			--Goto(Mission.wingman,"wingoffdrop_path",1)
			AddObjective("isdf0101.otf", "WHITE")
			RemoveObject(Mission.holder1)
			Mission.free_player = true
		end


		-- makes shab stop and look at Mission.player

		if ((not Mission.shab_hold) and (Mission.start_done) and (GetDistance(Mission.shabayev,"shab_firststoppoint") < 20.0)) then
		
			LookAt(Mission.shabayev,Mission.player)
			SetAnimation(Mission.condor2,"takeoff",1)
			StartEmitter(Mission.condor2, 1)
			StartEmitter(Mission.condor2, 2)
			StartSoundEffect("dropleav.wav",Mission.condor2)
			--Mission.smoker3 = BuildObject("kickup",0,"smoker2_a")
			--Mission.smoker4 = BuildObject("kickup",0,"smoker2_b")		
			Mission.off_drop_check = GetTime() + 15.0
			Mission.condor2_remove_time = GetTime() + 15.0
			Mission.look_time = GetTime() + 6.0
			Mission.at_player = true
			Mission.shab_hold = true
		end
		------------------------------------------/


		-- makes the Mission.wingman stop and look at shab

		if ((not Mission.wing_hold) and (Mission.free_player) and (GetDistance(Mission.wingman,"wing_first_point") < 20.0)) then
		
			LookAt(Mission.wingman,Mission.shabayev)
			Mission.wing_hold = true
		end
		------------------------------------------/


		-- this is checking to see when the Mission.player is off the ship

		if (not Mission.player_off) then
		
			if (Mission.shab_hold) then
			
				if (GetDistance(Mission.player,Mission.shabayev) < 30.0) then
				
					SetAnimation(Mission.condor1,"takeoff",1)
					StartSoundEffect("dropleav.wav",Mission.condor1)
					Mission.emit_time = GetTime() + 3.0
					Mission.condor1_remove_time = GetTime() + 20.0
					Mission.message_time = GetTime() + 7.0
					Mission.hold_fire_message = true
					Mission.player_off = true
				end

				if ((not Mission.clear_warning) and (Mission.off_drop_check < GetTime())) then
				
					Mission.speak = AudioMessage("isdf0166.wav") -- (shab) clear the ship John
					Mission.off_drop_check = GetTime() + 30.0
					Mission.clear_warning = true
				end
			end
		end
		------------------------------------------------/
		
	elseif (not Mission.game_over) then

		-- this is checking to make sure the Mission.player does not attack his Mission.wingman

		if ((not Mission.in_combat) and (not Mission.fire_message)) then
		
			if ((not Mission.hold_fire_message) and (IsAlive(Mission.shabayev)) and (IsAlive(Mission.player))) then
			
				if (GetTime() - GetLastFriendShot(Mission.shabayev) < .2) then
				
					AudioMessage("ff01.wav") -- (shab) watch your firing!
					Mission.fire_reset = GetTime() + 2.0
					Mission.fire_message = true
				end
			end


			if ((not Mission.hold_fire_message) and (IsAlive(Mission.wingman)) and (IsAlive(Mission.player))) then
			
				if (GetTime() - GetLastFriendShot(Mission.wingman) < .2) then
				
					AudioMessage("ff02.wav") -- (Mission.wingman) watch your firing!
					Mission.fire_reset = GetTime() + 2.0
					Mission.fire_message = true
				end
			end


			if ((Mission.shab_at_point1) and (IsAlive(Mission.red1)) and (IsAlive(Mission.player))) then
			
				if (GetTime() - GetLastFriendShot(Mission.red1) < .2) then
				
					AudioMessage("ff03.wav") -- (Mission.red1) watch your firing!
					Mission.fire_reset = GetTime() + 2.0
					Mission.fire_message = true
				end
			end


			--if ((IsAlive(Mission.truck)) and (IsAlive(Mission.player))) then
			--
			--	if (GetTime() - GetLastFriendShot(Mission.truck) < .2) then
			--	
			--		AudioMessage("ff01.wav") -- (Mission.truck) watch your firing!
			--		Mission.fire_reset = GetTime() + 2.f
			--		Mission.fire_message = true
			--	end
			--end
		end


		if ((Mission.fire_message) and (Mission.fire_reset < GetTime())) then
		
			Mission.fire_reset = GetTime() + 999999.9
			Mission.fire_message = false
		end
		------------------------------------------------/


		-- this keeps Mission.wingman alive

		if ((IsAlive(Mission.wingman)) and (GetCurHealth(Mission.wingman) < 200)) then
		
			SetCurHealth(Mission.wingman, 800)
		end


		if (Mission.look_time < GetTime()) then
		
			if (not Mission.at_player) then
			
				LookAt(Mission.shabayev,Mission.player)
				Mission.look_time = GetTime() + 15.0
				Mission.at_player = true
			
			elseif (IsAlive(Mission.wingman)) then
			
				LookAt(Mission.shabayev,Mission.wingman)
				Mission.look_time = GetTime() + 9.0
				Mission.at_player = false
			end
		end
		------------------------------------------------/

		
		-- this is the crate code

		if (Mission.shab_at_base) then
		
			if ((not Mission.crate1_dead) and (GetCurHealth(Mission.crate1) < 10)) then
			
				BuildObject("apammo",1,Mission.crate1)
				Damage(Mission.crate1,20)
				Mission.crate1_dead = true
			end
			if ((not Mission.crate2_dead) and (GetCurHealth(Mission.crate2) < 10)) then
			
				BuildObject("aprepa",1,Mission.crate2)
				Damage(Mission.crate2,20)
				Mission.crate2_dead = true
			end
			if ((not Mission.crate3_dead) and (GetCurHealth(Mission.crate3) < 10)) then
			
				BuildObject("apammo",1,Mission.crate3)
				Damage(Mission.crate3,20)
				Mission.crate3_dead = true
			end
			if ((not Mission.crate4_dead) and (GetCurHealth(Mission.crate4) < 10)) then
			
				BuildObject("aprepa",1,Mission.crate4)
				Damage(Mission.crate4,20)
				Mission.crate4_dead = true
			end
			if ((not Mission.crate5_dead) and (GetCurHealth(Mission.crate5) < 10)) then
			
				BuildObject("apammo",1,Mission.crate5)
				Damage(Mission.crate5,20)
				Mission.crate5_dead = true
			end
			if ((not Mission.crate6_dead) and (GetCurHealth(Mission.crate6) < 10)) then
			
				BuildObject("aprepa",1,Mission.crate6)
				Damage(Mission.crate6,20)
				Mission.crate6_dead = true
			end
			--if ((not Mission.crate7_dead) and (GetCurHealth(crate7) < 10)) then
			--
			--	BuildObject("apammo",1,crate7)
			--	Damage(crate7,20)
			--	Mission.crate7_dead = true
			--end
			--if ((not Mission.crate8_dead) and (GetCurHealth(Mission.crate8) < 10)) then
			--
			--	BuildObject("aprepa",1,Mission.crate8)
			--	Damage(Mission.crate8,20)
			--	Mission.crate8_dead = true
			--end
			if ((not Mission.last_crate_dead) and (GetCurHealth(Mission.last_crate) < 10)) then
			
				BuildObject("apammo",1,Mission.last_crate)
				Damage(Mission.last_crate,20)
				Mission.last_crate_dead = true
			end
		end

	end

	-- this starts the emmiters and the kickup

	if (Mission.emit_time < GetTime()) then
	
		StartEmitter(Mission.condor1, 1)
		StartEmitter(Mission.condor1, 2)
		--Mission.smoker1 = BuildObject("kickup",0,"smoker1_a")
		--Mission.smoker2 = BuildObject("kickup",0,"smoker1_b")
		Mission.emit_time = GetTime() + 999999.9
	end
	------------------------------------------/


-- this is sending Mission.shabayev on her way to the falling cliff --------------------------------



	if ((Mission.player_off) and (not Mission.shab_down_path3) and (IsAlive(Mission.shabayev)) and (not Mission.game_over)) then

		-- this is redundant to make sure the Mission.wingman holds

		if ((Mission.start_done) and (not Mission.wing_hold) and (GetDistance(Mission.shabayev,"wing_first_point") < 20.0)) then
		
			LookAt(Mission.wingman,Mission.shabayev)
			Mission.wing_hold = true
		end
		------------------------------------------/


		-- sends the ai squad underway

		if (not Mission.squad1_start) then
		
			if (not Mission.plane_time_set) then
			
				Mission.planes_wait = GetTime() + 5.0
				Mission.plane_time_set = true
			end

			if ((Mission.plane_time_set) and (Mission.planes_wait < GetTime())) then
			
				if (IsAlive(Mission.squad1_a)) then
				
					Goto(Mission.squad1_a,"ok_path1")
				end


				if (IsAlive(Mission.squad1_b)) then
				
					Follow(Mission.squad1_b,Mission.squad1_a)
				end


				if (IsAlive(Mission.squad1_c)) then
				
					Follow(Mission.squad1_c,Mission.squad1_b)
				end

				Mission.wait1_time = GetTime() + 3.0
				Mission.squad1_time = GetTime() + 9.0
				Mission.squad1_start = true
			end
		end
		------------------------------------------/


		-- has the Mission.wingman look at the ai sqaud

		if ((Mission.squad1_start) and (not Mission.wing_look) and (Mission.wait1_time < GetTime())) then
		
			LookAt(Mission.wingman,Mission.squad1_a)
			Mission.wing_look = true
		end
	------------------------------------------/



	-- this is shabs first message

		if (not Mission.message1) then
		
			SetAvoidType(Mission.shabayev,0)
			SetAvoidType(Mission.wingman,0)
			StopAudioMessage(Mission.speak)
			ClearObjectives()
			AddObjective("isdf0101.otf", "GREEN")
			Mission.speak = AudioMessage("isdf0101.wav") -- (shab) stick with me - looking for base
			Mission.message_time = GetTime() + 20.0
			Mission.message1 = true
		end
		------------------------------------------/


	if ((not Mission.shab_down_path1) and (Mission.squad1_start) and (Mission.message_time < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0102.otf", "WHITE")

		Goto(Mission.shabayev,"shab_path1",1)

		if (IsAlive(Mission.wingman)) then
		
			Follow(Mission.wingman,Mission.shabayev,1)
		end

		AudioMessage("isdf0102.wav") -- (shab) lets move out!
		Mission.look_time = GetTime() + 999999.9
		Mission.wait1_time = GetTime() + 2.0
		Mission.shab_down_path1 = true
	end


	if ((not Mission.shab_at_point1) and (Mission.shab_down_path1) and (Mission.wait1_time < GetTime())) then
	
		Mission.wait1_time = GetTime() + 2.0


		if (GetDistance(Mission.shabayev,"shab_point1") < 30.0) then
		
			LookAt(Mission.shabayev,Mission.squad1_a)
			Mission.talk = AudioMessage("isdf0162.wav")--(shab) hold up men - looking for Mission.a place to puke-up Tom?!
			Mission.wait2_time = GetTime() + 3.5
			Mission.look_time = GetTime() + 25.0
			Mission.hold_fire_message = false
			Mission.shab_at_point1 = true
		end
	end


	-- this is holding the three amigos for the first dialouge

	if ((not Mission.squad1_stopped) and (not Mission.squad1_off) and (Mission.squad1_start) and (Mission.squad1_time < GetTime())) then
	
		Mission.squad1_time = GetTime() + 1.0

		if ((not Mission.squad1_astop) and (GetDistance(Mission.squad1_a,"squad1_point1") < 20.0)) then
		
			LookAt(Mission.squad1_a,Mission.shabayev)
			Mission.squad1_astop = true
		end


		if ((not Mission.squad1_bstop) and (GetDistance(Mission.squad1_b,"squad1_point1") < 25.0)) then
		
			LookAt(Mission.squad1_b,Mission.wingman)
			--Stop(Mission.squad1_b,Mission.wingman)
			Mission.squad1_bstop = true
		end


		if ((not Mission.squad1_cstop) and (GetDistance(Mission.squad1_c,"squad1_point1") < 30.0)) then
		
			LookAt(Mission.squad1_c,Mission.player)
			--Stop(Mission.squad1_b,Mission.wingman)
			Mission.squad1_cstop = true
		end

		if ((Mission.squad1_astop) and (Mission.squad1_bstop) and (Mission.squad1_cstop)) then
		
			Mission.squad1_stopped = true
		end
	end
	------------------------------------------------/


	-- this is sending squad1 down its second path

	if (not Mission.player_lost) then
	
		if ((not Mission.squad1_talk) and (Mission.shab_at_point1) and (IsAudioMessageDone(Mission.talk))) then
		
			if (not Mission.squad1_talk) then
			
				SetAvoidType(Mission.squad1_a,0)
				SetAvoidType(Mission.squad1_b,0)
				SetAvoidType(Mission.squad1_c,0)
				LookAt(Mission.wingman,Mission.squad1_a)
				SetObjectiveOn(Mission.squad1_a)
				tempstr = TranslateString("Mission0102")  -- Red 1

				SetObjectiveName(Mission.squad1_a,tempstr)
				Mission.talk = AudioMessage("isdf0139.wav") -- (squad1) Its just puke Yelena or throw up and I don't have to do either... we'll take low road
				--Mission.wait2_time = GetTime() + 12.0
				Mission.squad1_talk = true
			end
		end


		if ((Mission.squad1_talk) and (not Mission.squad1_off) and (IsAudioMessageDone(Mission.talk))) then
		
			if (IsAlive(Mission.squad1_a)) then
			
				--SetTeamNum(Mission.squad1_a,0)
				Goto(Mission.squad1_a,"squad1_point2",1)

				if (IsAlive(Mission.squad1_b)) then
				
					--SetTeamNum(Mission.squad1_b,0)
					Follow(Mission.squad1_b,Mission.squad1_a,1)

					if (IsAlive(Mission.squad1_c)) then
					
						--SetTeamNum(Mission.squad1_c,0)
						Follow(Mission.squad1_c,Mission.squad1_b,1)
					end
				end
			end
		
			SetObjectiveOff(Mission.squad1_a)
			--Ally(0,1)
			--Ally(1,0)
			Mission.squad1_off = true
		end
		------------------------------------------------/


		-- this is sending Mission.shabayev down the second path

		if ((not Mission.roger_message) and (Mission.squad1_off)) then
		
			LookAt(Mission.shabayev,Mission.wingman)
			Mission.look_time = GetTime() + 3.0
			Mission.at_player = false
			AudioMessage("isdf0103.wav") -- (shab) Roger that Mission.red1
			Mission.wait2_time = GetTime() + 5.0
			Mission.roger_message = true

			-- this is new
			if (GetDistance(Mission.shabayev,Mission.player) > 150.0) then
			
				ClearObjectives()
				AddObjective("isdf0102.otf", "RED")
				Mission.player_lost = true
			end
		end
		------------------------------------------------/


		if ((not Mission.shab_down_path2) and (Mission.roger_message) and (Mission.wait2_time < GetTime())) then
		
			--Goto(Mission.shabayev,"shab_path2a")
			Goto(Mission.shabayev,"shab_path2")

			if (IsAlive(Mission.wingman)) then
			
				--Goto(Mission.wingman,"shab_path2a")
				Follow(Mission.wingman,Mission.shabayev)
			end

			ClearObjectives()
			AddObjective("isdf0102.otf", "WHITE")
			AudioMessage("isdf0104.wav") -- (shab) All right numbers 1 and 2 lets move out!
			Mission.wait2_time = GetTime() + 2.0
			Mission.cliff_check = GetTime() + 1.0
			Mission.look_time = GetTime() + 999999.9
			Mission.shab_down_path2 = true
		end
	end
	------------------------------------------------/


	-- this removes Mission.red1's squad

	if ((not Mission.shab_at_cliff) and (Mission.cliff_check < GetTime())) then
	
		Mission.cliff_check = GetTime() + 1.0

		if (GetDistance(Mission.shabayev,"cliff_point") < 30.0) then
		
			if (GetDistance(Mission.player,Mission.shabayev) < 200.0) then
			
				if (IsAlive(Mission.squad1_a)) then
				
					RemoveObject(Mission.squad1_a)
				end
				if (IsAlive(Mission.squad1_b)) then
				
					RemoveObject(Mission.squad1_b)
				end
				if (IsAlive(Mission.squad1_c)) then
				
					RemoveObject(Mission.squad1_c)
				end
				if (IsAlive(squad2_a)) then
				
					RemoveObject(squad2_a)
				end
				if (IsAlive(squad2_b)) then
				
					RemoveObject(squad2_b)
				end
				if (IsAlive(squad2_c)) then
				
					RemoveObject(squad2_c)
				end

				Mission.first_squad_removed = true
			end

			Mission.cliff_check = GetTime() + 2.0
			--Mission.wait2_time = GetTime() + 0.5
			Mission.shab_at_cliff = true
		end
	end
	------------------------------------------------/



	-- this triggers the cliff falling animation

	if ((not Mission.cliff_fall) and (Mission.shab_at_cliff) and (Mission.cliff_check < GetTime())) then
	
		SetAnimation(Mission.crumble_cliff,"crumble",1)
		StartSoundEffect("pecrack.wav",Mission.crumble_cliff)
		AudioMessage("isdf0105.wav") -- (shab) whoa - we better be carful out here
		Goto(Mission.wingman,"out_of_way")
		Mission.cliff_fall = true
	end
	------------------------------------------------/



	-- this is when shab is in place before the jump path
	
	if ((not Mission.shab_at_point2) and (Mission.shab_at_cliff)) then --[[ and (Mission.wait2_time < GetTime())]]--) then
	
		--Mission.wait2_time = GetTime() + 0.5

		
		if ((GetDistance(Mission.shabayev,"shab_point2") < 30.0) or (GetCurrentCommand(Mission.shabayev) == 0)) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.wait2_time = GetTime() + .1
			Mission.shab_at_point2 = true


			if (GetDistance(Mission.shabayev,Mission.player) > 150.0) then
			
				ClearObjectives()
				AddObjective("isdf0102.otf", "RED")
				Mission.player_lost = true
			end
		end
	end
	------------------------------------------------/


	-- this is when the Mission.wingman is in place before the jump path

	if ((not Mission.shab_down_path3) and (Mission.shab_at_point2)) then --[[ and (Mission.wait2_time < GetTime())]]--) then

		if (GetDistance(Mission.wingman,"out_of_way") < 30.0) then
		
			if (Mission.wait_4_wing) then
			
				if (not Mission.player_lost) then
				
					AudioMessage("isdf0160.wav")--(wing) sorry about that (getting lost)
				end

				LookAt(Mission.wingman,Mission.shabayev)
				LookAt(Mission.shabayev,Mission.wingman)
				Mission.wait2_time = GetTime() + 3.0
				Mission.shab_down_path3 = true
			
			else

				LookAt(Mission.wingman,Mission.shabayev)
				LookAt(Mission.shabayev,Mission.wingman)
				Mission.look_time = GetTime() + 999999.9
				Mission.wait2_time = GetTime() + 0.5
				Mission.shab_down_path3 = true
			end
		
		elseif ((not Mission.wait_4_wing) and (GetDistance(Mission.shabayev,Mission.wingman) > 150.0)) then
		
			AudioMessage("isdf0159.wav")--(shab) wing2 would you like to kick in the afterburners?
			LookAt(Mission.shabayev,Mission.wingman)
			Mission.wait_4_wing = true
		end
	end
	------------------------------------------------/
end


-- this is sending Mission.shabayev on her way to the base --------------------------------



if ((Mission.shab_down_path3) and (not Mission.shab_at_point3) and (IsAlive(Mission.shabayev)) and (not Mission.player_lost)) then

	-- this is shab telling the Mission.wingman to take off down the pass

	if ((Mission.shab_down_path3) and (not Mission.wing_orders) and (Mission.wait2_time < GetTime())) then

		--Goto(Mission.shabayev,"shab_path3")
		Mission.talk = AudioMessage("isdf0106.wav") -- (shab) all right number 2 check out that other pass
		--Mission.wait2_time = GetTime() + 5.0
		Mission.wing_orders = true
	end
	------------------------------------------------/


	-- this is the Mission.wingman taking off down the pass

	if ((Mission.wing_orders) and (not Mission.roger1) and (IsAudioMessageDone(Mission.talk))) then
	
		if (IsAlive(Mission.wingman)) then
		
			Goto(Mission.wingman,"explore_path1")
		end

		AudioMessage("isdf0112.wav") -- (Mission.wingman) copy that
		Mission.wait2_time = GetTime() + 1.0
		Mission.roger1 = true
	end
	------------------------------------------------/


	-- this is shab taking off down her path

	if ((Mission.roger1) and (not Mission.go_shab_go) and (Mission.wait2_time < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.player)
		ClearObjectives()
		AddObjective("isdf0102.otf", "WHITE")
		Mission.talk = AudioMessage("isdf0161.wav")--(shab) number one - your with me
		Mission.wait2_time = GetTime() + 2.0
		Mission.look_time = GetTime() + 999999.9
		Mission.go_shab_go = true
	end
	------------------------------------------------/


	-- this is making shab move down the jump path

	if ((not Mission.go_shab_go2) and (Mission.go_shab_go) and (Mission.wait2_time < GetTime())) then
	
		Goto(Mission.shabayev,"jump_path2")
		Mission.go_shab_go2 = true
	end
	------------------------------------------------/


	-- this is detecting the scout

	if ((not Mission.turret_detected) and (Mission.roger1)) then
	
		if (IsAlive(Mission.turret)) then
		
			if (GetDistance(Mission.wingman,Mission.turret) < 200.0) then
			
				Mission.speak = AudioMessage("isdf0167.wav") -- (simms) I'm detecting something strange headed north
				Retreat(Mission.turret,"turret_path")
				Follow(Mission.wingman,Mission.turret)
				Mission.turret_retreat = true
				Mission.turret_detected = true
			end
		
		elseif ((Mission.go_shab_go) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.turret_detected = true
		end
	end
	------------------------------------------------/

	
	-- this checks to see when the Mission.turret is dead and deployed 

	if (Mission.turret_retreat) then
	
		-- this is shab commenting on the Mission.turret

		if ((not Mission.shab_turret_comment) and (IsAudioMessageDone(Mission.speak))) then
		
			Mission.speak = AudioMessage("isdf0168.wav") -- (shab) stay on it we'll try and cut it off
			Mission.shab_turret_comment = true
		end
		------------------------------------------------/
		

		-- this is checking to see when she reaches the bluff before the base

		if ((not Mission.shab_cutoff_turret) and (Mission.go_shab_go2) and (Mission.wait2_time < GetTime())) then
		
			Mission.wait2_time = GetTime() + 1.0


			if (GetDistance(Mission.shabayev,"shab_point3") < 30.0) then
			
				if (IsAlive(Mission.turret)) then
				
					LookAt(Mission.shabayev,Mission.turret)
					Mission.shab_cutoff_turret = true
				
				else
				
					LookAt(Mission.shabayev,Mission.player)
					Mission.shab_cutoff_turret = true
				end
			end
		end
		------------------------------------------------/


		-- this is when the Mission.turret dies

		if (not Mission.turret_dead) then
		
			if (not IsAlive(Mission.turret)) then
			
				Follow(Mission.wingman,Mission.shabayev)
				Mission.turret_dead = true
			end


			if (not Mission.turret_dead) then
			
				-- this tells the Mission.turret to stop and attack
				if ((not Mission.turret_deploy) and (GetDistance(Mission.turret,"shab_point3") < 35.0)) then
				
					--Stop(Mission.turret,0)
					Attack(Mission.turret,Mission.shabayev)
					--Deploy(Mission.turret)
					Follow(Mission.wingman,Mission.turret)
					Mission.in_combat = true
					Mission.turret_deploy = true
				end


				if ((not Mission.wing_lookat_turret) and (Mission.turret_deploy) and (GetDistance(Mission.wingman,Mission.turret) < 50.0)) then
				
					LookAt(Mission.wingman,Mission.turret)
					Mission.wing_lookat_turret = true
				end


				-- this is simms commenting on the Mission.turret
				if ((not Mission.what_doing) and (Mission.turret_deploy) and (IsDeployed(Mission.turret))) then
				
					--Attack(Mission.turret,Mission.shabayev)
					AudioMessage("isdf0174.wav") -- (Simms) what's it doing
					Mission.what_doing = true

				end


				if ((not Mission.turret_hostle) and (Mission.turret_deploy)) then
				
					if (GetCurAmmo(Mission.turret) < 1490) then
					
						SetPerceivedTeam(Mission.turret,2)
						Attack(Mission.shabayev,Mission.turret)
						Attack(Mission.wingman,Mission.turret)
						AudioMessage("isdf0169.wav") -- (shab) Open fire!
						Mission.turret_hostle = true
					end
				end
			end
		
		elseif (Mission.turret_dead) then
		
			if (Mission.shab_cutoff_turret) then
			
				if (GetDistance(Mission.shabayev,Mission.player) > 150.0) then
				
					ClearObjectives()
					AddObjective("isdf0102.otf", "RED")
					Mission.player_lost = true
				end

				Mission.wait2_time = GetTime() + 2.0
				Mission.shab_at_point3 = true
			end
		end
	
	------------------------------------------------/
	elseif (not Mission.turret_retreat) then
	
		-- this is checking to see when she reaches the bluff before the base

		if ((not Mission.shab_at_point3) and (Mission.go_shab_go2) and (Mission.wait2_time < GetTime())) then
		
			Mission.wait2_time = GetTime() + 1.0


			if (GetDistance(Mission.shabayev,"shab_point3") < 30.0) then
			
				LookAt(Mission.shabayev,Mission.player)
				Mission.wait2_time = GetTime() + 5.0
				Mission.shab_at_point3 = true


				if (GetDistance(Mission.shabayev,Mission.player) > 150.0) then
				
					ClearObjectives()
					AddObjective("isdf0102.otf", "RED")
					Mission.player_lost = true
				end
			
			elseif ((not Mission.wing_first) and (GetDistance(Mission.wingman,"shab_point3") < 30.0)) then
			
				LookAt(Mission.wingman,Mission.shabayev)
				Mission.wing_first = true
			end
		end
		------------------------------------------------/
	end

--[[
	-- this is checking to see when she reaches the bluff before the base

	if ((not Mission.shab_at_point3) and (Mission.wing_orders) and (Mission.wait2_time < GetTime())) then
	
		Mission.wait2_time = GetTime() + 1.0


		if (GetDistance(Mission.shabayev,"shab_point3") < 30.0) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.wait2_time = GetTime() + 5.0
			Mission.shab_at_point3 = true


			if (GetDistance(Mission.shabayev,Mission.player) > 150.0) then
			
				ClearObjectives()
				AddObjective("isdf0102.otf", "RED")
				Mission.player_lost = true
			end
		
		elseif ((not Mission.wing_first) and (GetDistance(Mission.wingman,"shab_point3") < 30.0)) then
		
			LookAt(Mission.wingman,Mission.shabayev)
			Mission.wing_first = true
		end
	end
	------------------------------------------------/
]]--
end


-- this is sending Mission.shabayev on her way to the base --------------------------------



if ((Mission.shab_at_point3) and (not Mission.shab_at_base) and (IsAlive(Mission.shabayev)) and (not Mission.player_lost)) then

	-- this is sending Mission.shabayev down the "tight" path

	if (not Mission.turret_retreat) then
	
		if (not Mission.player_lost) then
		
			-- this is shab trying to contact the base

			if ((Mission.shab_at_point3) and (not Mission.base_detected) and (Mission.wait2_time < GetTime())) then
			
				LookAt(Mission.shabayev,Mission.comm_building)
				Mission.talk = AudioMessage("isdf0107.wav") --(shab) I'm detecting the base just over those hills
				Mission.wingy = GetTime() + 3.5
				Mission.base_detected = true
			end
			------------------------------------------------/

			-- this is making the Mission.wingman look at the base

			if ((Mission.base_detected) and (Mission.wingy < GetTime())) then
			
				LookAt(Mission.wingman,Mission.comm_building)
				Mission.wingy = GetTime() + 999999.9
			end
			------------------------------------------------/

			-- this is shab giving the go ahead command

			if ((not Mission.alert_skyeye) and (Mission.base_detected) and (IsAudioMessageDone(Mission.talk))) then
			
				LookAt(Mission.shabayev,Mission.player)
				LookAt(Mission.wingman,Mission.shabayev)
				Mission.talk = AudioMessage("isdf0170.wav") --(shab) comm is down - follow me men
				Mission.alert_skyeye = true
			end
			------------------------------------------------/


			-- this is shab moving on

			if ((not Mission.shab_down_tight) and (Mission.alert_skyeye) and (IsAudioMessageDone(Mission.talk))) then
			
				if (GetDistance(Mission.shabayev,Mission.wingman) < 100.0) then
				
					ClearObjectives()
					AddObjective("isdf0102.otf", "WHITE")
					Goto(Mission.shabayev,"tight_path3")

					if (IsAlive(Mission.wingman)) then
					
						Follow(Mission.wingman,Mission.shabayev)
					end

					Mission.wait2_time = GetTime() + 10.0
					Mission.shab_down_tight = true
				end
			end
			------------------------------------------------/
		end
	
	elseif (Mission.turret_retreat) then
	
		if (not Mission.player_lost) then
		
			-- this is Simms commenting on the Mission.turret

			if ((not Mission.simms_turret_comment) and (Mission.shab_at_point3) and (Mission.wait2_time < GetTime())) then
			
				Follow(Mission.wingman,Mission.shabayev)
				Mission.talk = AudioMessage("isdf0171.wav") --(simms) what was that thing
				Mission.in_combat = false
				Mission.simms_turret_comment = true
			end
			------------------------------------------------/


			-- this is shab commenting on the Mission.turret

			if ((not Mission.shab_weapon_comment) and (Mission.simms_turret_comment) and (IsAudioMessageDone(Mission.talk))) then
			
				LookAt(Mission.shabayev,Mission.wingman)
				LookAt(Mission.wingman,Mission.shabayev)
				Mission.talk = AudioMessage("isdf0172.wav") --(shab) we got missles
				Mission.shab_weapon_comment = true
			end
			------------------------------------------------/


			-- this is shab trying to contact the base

			if ((not Mission.base_detected) and (Mission.shab_weapon_comment) and (IsAudioMessageDone(Mission.talk))) then
			
				LookAt(Mission.shabayev,Mission.comm_building)
				Mission.talk = AudioMessage("isdf0107.wav") --(shab) I'm detecting the base just over those hills
				Mission.wingy = GetTime() + 5.0
				Mission.base_detected = true
			end
			------------------------------------------------/


			-- this is making the Mission.wingman look at the base

			if ((Mission.base_detected) and (Mission.wingy < GetTime())) then
			
				LookAt(Mission.wingman,Mission.comm_building)
				Mission.wingy = GetTime() + 999999.9
			end
			------------------------------------------------/


			-- this is shab giving the go ahead command

			if ((not Mission.alert_skyeye) and (Mission.base_detected) and (IsAudioMessageDone(Mission.talk))) then
			
				LookAt(Mission.shabayev,Mission.player)
				LookAt(Mission.wingman,Mission.shabayev)
				Mission.talk = AudioMessage("isdf0170.wav") --(shab) comm is down - follow me men
				Mission.alert_skyeye = true
			end
			------------------------------------------------/


			-- this is shab moving on

			if ((not Mission.shab_down_tight) and (Mission.alert_skyeye) and (IsAudioMessageDone(Mission.talk))) then
			
				ClearObjectives()
				AddObjective("isdf0102.otf", "WHITE")
				Goto(Mission.shabayev,"tight_path2")

				if (IsAlive(Mission.wingman)) then
				
					Follow(Mission.wingman,Mission.shabayev)
				end

				Mission.wait2_time = GetTime() + 10.0
				Mission.shab_down_tight = true
			end
			------------------------------------------------/
		end
	end
	------------------------------------------------/


	if ((Mission.shab_down_tight) and (not Mission.throttle_down) and (Mission.wait2_time < GetTime())) then
	
		Mission.wait2_time = GetTime() + 1.0


		if ((GetDistance(Mission.shabayev,"atbase_point") < 200.0) or (GetDistance(Mission.player,"atbase_point") < 200.0)) then
		
			AudioMessage("isdf0108.wav") -- (shab) base is coming into range - throttle down
			Mission.throttle_down = true
		end
	end


	if ((not Mission.shab_at_base) and (Mission.shab_down_tight) and (Mission.wait2_time < GetTime())) then
	
		Mission.wait2_time = GetTime() + 2.0


		if (GetDistance(Mission.shabayev,"atbase_point") < 30.0) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.wait2_time = GetTime() + 2.0
			Mission.shab_at_base = true


			if (GetDistance(Mission.shabayev,Mission.player) > 150.0) then
			
				ClearObjectives()
				AddObjective("isdf0102.otf", "RED")
				Mission.player_lost = true
			end
		end
	end
end



-- this is the code that takes over when the Mission.player & Mission.shabayev reach the base 



if ((Mission.shab_at_base) and (not Mission.left_base) and (IsAlive(Mission.shabayev)) and (not Mission.player_lost)) then

	-- this is Simms commenting on the tank

	if ((not Mission.simms_tank_comment) and (Mission.wait2_time < GetTime())) then
	
		if (IsAround(Mission.dead_tank)) then
		
			LookAt(Mission.shabayev,Mission.dead_tank)

			if (GetDistance(Mission.wingman,Mission.dead_tank) < 50.0) then
			
				LookAt(Mission.wingman,Mission.dead_tank)
			end
		end

		if (not Mission.first_squad_removed) then
		
			if (IsAlive(Mission.squad1_a)) then
			
				RemoveObject(Mission.squad1_a)
			end
			if (IsAlive(Mission.squad1_b)) then
			
				RemoveObject(Mission.squad1_b)
			end
			if (IsAlive(Mission.squad1_c)) then
			
				RemoveObject(Mission.squad1_c)
			end
			if (IsAlive(squad2_a)) then
			
				RemoveObject(squad2_a)
			end
			if (IsAlive(squad2_b)) then
			
				RemoveObject(squad2_b)
			end
			if (IsAlive(squad2_c)) then
			
				RemoveObject(squad2_c)
			end

			Mission.first_squad_removed = true
		end
		
		Mission.wait2_time = GetTime() + 5.0
		Mission.talk = AudioMessage("isdf0173.wav") -- (simms) that looks like one of ours

		Mission.simms_tank_comment = true

	end
	------------------------------------------------/


	-- this sends shab into the base

	if ((not Mission.shab_to_center) and (IsAudioMessageDone(Mission.talk)) and (Mission.wait2_time < GetTime())) then

		ClearObjectives()
		AddObjective("isdf0102.otf", "WHITE")
		AddObjective("isdf0103.otf", "WHITE")
		Goto(Mission.shabayev,"base_center")
		AudioMessage("isdf0109.wav") -- (shab) lets head for the center


		if (IsAlive(Mission.wingman)) then
		
			Follow(Mission.wingman, Mission.shabayev)
		end

		Mission.shab_to_center = true
	end
	------------------------------------------------/


	-- this is when shab reaches the center of the base

	if ((not Mission.shab_centered) and (Mission.shab_to_center) and (GetDistance(Mission.shabayev,"base_center") < 30.0)) then

		LookAt(Mission.shabayev,Mission.player) -- this should be changed to the gun tower
		--Mission.look_time = GetTime() + 1.0
		--Mission.at_player = true
		--Mission.wait_time = GetTime() + 10.0
		Mission.speak = AudioMessage("isdf0110.wav") -- (shab) For an "outpost" this place sure was heavily armed
		Mission.base_check_time = GetTime() + 3.0
		Mission.shab_centered = true
	end
	------------------------------------------------


	-- this is shab telling Mission.wingman to sweep

	if ((Mission.shab_centered) and (not Mission.search_base) and (IsAudioMessageDone(Mission.speak))) then --(Mission.wait_time < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.wingman)
		LookAt(Mission.wingman,Mission.shabayev)
		Mission.speak = AudioMessage("isdf0111.wav") -- (shab) Mission.wingman sweep perimeter.
		--Mission.wait_time = GetTime() + 5.0
		Mission.search_base = true
	end
	------------------------------------------------


	-- this is simms acknowloging command

	if ((Mission.search_base) and (not Mission.wingman_away) and (IsAudioMessageDone(Mission.speak))) then --(Mission.wait_time < GetTime())) then
	
		AudioMessage("isdf0112.wav") -- (Mission.wingman) roger - on my way
		Goto(Mission.wingman,"combat1a")
		Mission.wait_time = GetTime() + 3.0
		Mission.wingman_check = GetTime() + 1.0
		Mission.wingman_away = true
	end
	------------------------------------------------


	-- this is checking to see when the Mission.wingman reaches the spot

	if ((Mission.wingman_away) and (not Mission.wingman_there) and (Mission.wingman_check < GetTime())) then
	
		Mission.wingman_check = GetTime() + 1.0

		if (GetDistance(Mission.wingman,"combat1a") < 50.0) then
		
			LookAt(Mission.wingman,Mission.player)
			Mission.wingman_there = true
		end
	end
		------------------------------------------------


	-- this is shab giving the Mission.player to search order

	if ((Mission.wingman_away) and (not Mission.johns_orders) and (Mission.wait_time < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.player)
		Mission.look_time = GetTime() + 999999.9
		Mission.talk = AudioMessage("isdf0113.wav") -- (shab) John, use "I" key to search for comm bunker - I'm going in tunnels
		Mission.comm_check_time = GetTime() + 60.0
		Mission.johns_orders = true
	end
	------------------------------------------------



	-- shab leaves for the tunnels

	if ((Mission.johns_orders) and (not Mission.shab_to_tunnel) and (IsAudioMessageDone(Mission.talk))) then --[[(Mission.wait_time < GetTime()]]--) then
	
		ClearObjectives()
		AddObjective("isdf0103.otf", "GREEN")
		AddObjective("isdf0104.otf", "WHITE")
		Patrol(Mission.shabayev,"around_path2")
		--Patrol(Mission.shabayev,"circlebase_path2")
		--Goto(Mission.shabayev,"tunnel_path")
		--Mission.tunnel_check = GetTime() + 1.0
		Mission.shab_to_tunnel = true
	end

--[[
	if ((not Mission.shab_through) and (Mission.shab_to_tunnel) and (Mission.tunnel_check < GetTime())) then
	
		Mission.tunnel_check = GetTime() + 1.0


		if (GetDistance(Mission.shabayev,"through_tunnel") < 30.0) then
		
			Mission.shab_through = true
		end
	end


	if ((Mission.shab_through) and (not Mission.to_comm)) then
	
		if (Mission.comm_identified) then
		
			Goto(Mission.shabayev,"comm_point",1)
			Mission.shab_comm_check = GetTime() + 1.0
			Mission.to_comm = true
		
		elseif (not Mission.shab_wait) then
		
			LookAt(Mission.shabayev,Mission.player)
			Mission.shab_wait = true
		end
	end
]]--

	if ((Mission.shab_to_tunnel) and (not Mission.to_comm)) then
	
		if (Mission.comm_identified) then
		
			Goto(Mission.shabayev,"comm_point")
			Mission.shab_comm_check = GetTime() + 0.5
			Mission.to_comm = true
		end
	end
	------------------------------------------------


	-- this is where I check to see if the Mission.player identifies the comm building then

	if ((Mission.shab_to_tunnel) and (IsInfo("pbcomm") == true) and (not Mission.comm_identified)) then
	
		ClearObjectives()
		AddObjective("isdf0104.otf", "GREEN")
		AudioMessage("isdf0114.wav") -- (shab) nice work John - stay there, I'm on my way
		--Goto(Mission.shabayev,"comm_point")
		--Mission.shab_comm_check = GetTime() + 1.0
		Mission.comm_identified = true
	end
	------------------------------------------------/


	-- this is code that plays if the Mission.player spends too much time looking for the comm building then

	if ((not Mission.comm_identified) and (Mission.johns_orders) and (not Mission.start_cineractive) and (not Mission.comm_help) and (Mission.comm_check_time < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0104.otf", "WHITE")
		AudioMessage("isdf0113v2.wav") -- (shab) -- Hurry up and find comm - remember to use "I" key
		Mission.comm_check_time = GetTime() + 40.0
		Mission.comm_help = true
	end
	------------------------------------------------/


	if ((not Mission.comm_identified) and (not Mission.find_herself) and (Mission.comm_help) and (Mission.comm_check_time < GetTime())) then
	
		Goto(Mission.shabayev,"comm_point")
		Mission.comm_check_time = GetTime() + 999999.9
		Mission.shab_comm_check = GetTime() + 1.0
		Mission.find_herself = true
	end


	-- this tells when Mission.shabayev reaches the comm buidling after it has been identified or she finds it herself
	
	if (((Mission.comm_identified) or (Mission.find_herself)) and (not Mission.shab_at_comm)) then
	
		if ((IsAlive(Mission.comm_building)) and (Mission.shab_comm_check < GetTime())) then
		
			Mission.shab_comm_check = GetTime() + 1.0


			if (GetDistance(Mission.shabayev,"comm_point") < 50.0) then
			
				if (not Mission.in_comm) then
				
					AudioMessage("isdf0116.wav") -- (shab) I'm detecting life readings too - go in and check it out
					ClearObjectives()
					AddObjective("isdf0105.otf", "WHITE")
				end

				--SetObjectiveOn(Mission.manson)
				--SetObjectiveName(Mission.manson, "Life Reading")
				LookAt(Mission.shabayev,Mission.player)
				Mission.shab_comm_check = GetTime() + 180.0
				Mission.out_check = GetTime() + 180.0
				Mission.shab_at_comm = true
			end
		end
	end
	------------------------------------------------/


	-- I'm going to delete this when I can determine if the Mission.player is Mission.inside the building then
	-- for now I will just check to see if he gets our then
	--if ((Mission.shab_at_comm) and (Mission.out_of_ship) and (not Mission.inside)) then
	--
	--	Mission.inside = true
	--end
	------------------------------------------------/


	-- this is where I need to determine if the Mission.player is in the building then
	if (InBuilding(Mission.player)) then

		Mission.inside = true

		if ((not Mission.in_comm) and (GetDistance(Mission.player,Mission.comm_building) < 20.0)) then
			Mission.in_comm = true
		end
	
	else
	
		Mission.inside = false
		Mission.in_comm = false
	end

	-- this is where I trigger the cineractive

	if (Mission.johns_orders) then

		if ((not Mission.start_cineractive) and (Mission.in_comm) and (GetDistance(Mission.player,Mission.manson) < 4))	 then

			--SetObjectiveOff(Mission.manson)
			CameraReady()
			Mission.line = AudioMessage("cut0201.wav") -- (cook) Someone is in here!
			--Mission.camera_time = GetTime() + 5.0
			Mission.start_cineractive = true
		end
	end


	-- this is the movie code

	if ((not Mission.camera1_over) and (Mission.start_cineractive)) then
	
		if (not Mission.first_frame)  then
		
			CameraReady()
			Mission.first_frame = true
		end
		
		PlayMovie("manson1")
	end


	if ((not Mission.camera2_over) and (Mission.first_frame) and (Mission.line4)) then
	
		CameraObject(Mission.shabayev,0,1,5,Mission.shabayev) -- 3.7
		--Mission.a = Mission.a + 0.1
		Mission.camera1_over = true
	end


	if ((Mission.movie1) and (Mission.line5)) then
	
		if (not Mission.reframe1) then
		
			--StopMovie()
			CameraReady()
			Mission.reframe1 = true
		end

		Mission.movie1 = PlayMovie("base_look")
		Mission.movie2 = true
	end

	
	if ((not Mission.movie1) and (Mission.movie2)) then
	
		Mission.movie2 = PlayMovie("manson2")
		Mission.camera3_over = true
	end

	--------------------------------------------


	if ((not Mission.line2) and (Mission.start_cineractive) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0202.wav") -- (shab) A man? Is he alive?
		Mission.line2 = true
	end
	if ((not Mission.line3) and (Mission.line2) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0203.wav") -- (Mission.manson) If you call this living - who is this?
		SetAnimation(Mission.manson,"line1",1)
		Mission.line3 = true
	end
	if ((not Mission.line4) and (Mission.line3) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0204.wav") -- (shab) This is shab?
		Mission.line4 = true
	end
	if ((not Mission.line5) and (Mission.line4) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0205.wav") -- (Mission.manson) is your radio working?
		--SetAnimation(Mission.manson,"Mission.line2",1)
		StopMovie()
		CameraFinish()
		Mission.camera2_over = true
		Mission.line5 = true
	end
	if ((not Mission.line6) and (Mission.line5) and (IsAudioMessageDone(Mission.line))) then
	
		--Matrix pos
		--GetPosition(Mission.manson,pos)
		--RemoveObject(Mission.manson)
		--Mission.manson = BuildObject("manson2",0,pos)

		Mission.line = AudioMessage("cut0206.wav") -- (shab) no - interfierence?
		Mission.line6 = true
	end
	if ((not Mission.line7) and (Mission.line6) and (IsAudioMessageDone(Mission.line))) then
	
		SetAnimation(Mission.manson,"line2",1)
		Mission.line = AudioMessage("cut0207.wav") -- (Mission.manson) Then they already know you are hear!
		Mission.line7 = true
	end


	-- this is where I trigger the cineractive

	if ((not Mission.cineractive_over) and (Mission.line7) and (IsAudioMessageDone(Mission.line))) then
	
		CameraFinish()
		Mission.cineractive_over = true

		if (not Mission.shab_at_comm) then
		
			Goto(Mission.shabayev,Mission.player_ship)
			Mission.shab_at_comm = true
		end
	end
	------------------------------------------------/


	-- this is where the code will go to determine if Mission.player is out of his ship then

	if ((Mission.shab_at_comm) and (not Mission.out_of_ship) and (not Mission.wingman_message1) and (Mission.out_check < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0105.otf", "WHITE")
		Mission.out_check = GetTime() + 180.0
		AudioMessage("isdf0140.wav") -- (shab) Get out of your ship john!
	end
	------------------------------------------------/




	-- this is the Mission.wingman sending the first encounter message

	if (IsAlive(Mission.wingman)) then
	
		if ((not Mission.wingman_message1) and (Mission.shab_at_comm) and (Mission.cineractive_over)) then
		
			AudioMessage("cut0208.wav") --(Mission.wingman) I'm picking up some enemy ships sir
			SetObjectiveOn(Mission.wingman)
			Mission.dialog1_time = GetTime() + 5.0
			Mission.shab_comm_check = GetTime() + 999999.9
			Mission.wingman_message1 = true
		end
	end
	------------------------------------------------/


	if ((Mission.wingman_message1) and (not Mission.shab_response) and (Mission.dialog1_time < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0106.otf", "WHITE")
		AudioMessage("cut0209.wav") --(shab) we're on our way! John leave Manson and get to your ship
		Mission.john_ship_check = GetTime() + 60.0 -- this will be activated when I can tell when the Mission.player is in and out of ship
		Mission.shab_response = true
	end


	-- this tells john to hurry if he's taking his time then

	if ((not Mission.shab_warning1) and (Mission.john_ship_check < GetTime()) and (Mission.shab_response) and (Mission.out_of_ship)) then
	
		ClearObjectives()
		AddObjective("isdf0106.otf", "WHITE")
		AudioMessage("isdf0119.wav") --(shab) you wanna get the lead out john?!
		Mission.john_ship_check = GetTime() + 60.0
		Mission.shab_warning1 = true
	end
	------------------------------------------------/


	-- this is where she leavses the base with John

	if ((Mission.shab_response) and (not Mission.out_of_ship) and (not Mission.left_base)) then
	
		ClearObjectives()
		AddObjective("isdf0106.otf", "GREEN")
		AddObjective("isdf0102.otf", "WHITE")
		Goto(Mission.shabayev,"shab_attack_path")
		AudioMessage("isdf0120.wav")-- (shab) lets go - follow me John
		Mission.on_route_check = GetTime() + 2.0
		Mission.left_base = true
	end
	------------------------------------------------/


	-- this is special code that makes sure that the Mission.player stays Mission.inside base area

	if ((Mission.shab_to_center) and (Mission.base_check_time < GetTime())) then
	
		Mission.base_check_time = GetTime() + 3.0


		if (GetDistance(Mission.player,"base_center") > 250.0) then
		
			Mission.player_lost = true
		end
	end
	------------------------------------------------/
end



-- this is when Mission.shabayev and the Mission.player leave to go and help the Mission.wingman



if ((Mission.left_base) and (not Mission.base_return) and (IsAlive(Mission.shabayev)) and (not Mission.player_lost)) then

	-- this checks to see that shab and the Mission.player are on there way

	if ((not Mission.on_route) and (Mission.on_route_check < GetTime())) then
	
		Mission.on_route_check = GetTime() + 0.5


		-- this is the Mission.wingman saying that he is engaging the targets

		if (GetDistance(Mission.shabayev,"combat1a") < 500.0)  then
		
			AudioMessage("isdf0121.wav") -- (Mission.wingman) engaging targets


			if (IsAlive(Mission.wingman)) then
			
				RemoveObject(Mission.wingman)
			end

			Mission.wingman = BuildObject("p1scout", 1,"combat1a")
			SetAvoidType(Mission.wingman,0)
			Mission.scion1 = BuildObject("fvpsnt", 2,"combat1c")
			Mission.scion2 = BuildObject("fvpsnt", 2,"combat1b")
			SetPerceivedTeam(Mission.wingman, 2)
			SetObjectiveOn(Mission.wingman)
			LookAt(Mission.wingman,Mission.scion1)
			Patrol(Mission.scion1,"circle_path", 1)
			Patrol(Mission.scion2,"circle_path", 1)
			Mission.on_route_check = GetTime() + 1.5
			Mission.on_route = true
		end
		------------------------------------------------/
	end
	------------------------------------------------/

	
	-- this holds the Mission.wingman until shab and the Mission.player arrive

	if ((Mission.on_route) and (not Mission.in_range) and (IsAlive(Mission.wingman))) then
	
		Stop(Mission.wingman)
	end
	------------------------------------------------/


	-- this is shab saying she's detecting the enemy on radar

	if ((Mission.on_route) and (not Mission.in_range) and (Mission.on_route_check < GetTime())) then
	
		Mission.on_route_check = GetTime() + 1.0


		if ((IsAlive(Mission.scion1)) and (GetDistance(Mission.shabayev,Mission.scion1) < 400.0)) then
		
			if (IsAlive(Mission.wingman)) then
			
				SetPerceivedTeam(Mission.wingman,1)
			end

			AudioMessage("isdf0122.wav") -- (shab) I've got them on radar -I'll paint Mission.a target for you when we're in range
			Mission.on_route_check = GetTime() + 1.0
			Mission.in_range = true
		
		elseif ((IsAlive(Mission.scion2)) and (GetDistance(Mission.shabayev,Mission.scion2) < 400.0)) then
		
			if (IsAlive(Mission.wingman)) then
			
				SetPerceivedTeam(Mission.wingman,1)
			end

			AudioMessage("isdf0122.wav") -- (shab) I've got them on radar - I'll paint Mission.a target for you when we're in range
			Mission.on_route_check = GetTime() + 1.0
			Mission.in_range = true
		end
	end
	------------------------------------------------/


	-- this is shab "painting" John Mission.a target

	if ((Mission.in_range) and (not Mission.targeted) and (Mission.on_route_check < GetTime())) then
	
		Mission.on_route_check = GetTime() + 0.5


		if ((IsAlive(Mission.scion1)) and ((GetDistance(Mission.shabayev,Mission.scion1) < 150.0) or (GetDistance(Mission.player,Mission.scion1) < 150.0))) then
		
			ClearObjectives()
			AddObjective("isdf0107.otf", "WHITE")
			AudioMessage("isdf0123.wav") -- (shab) Get this target John
			SetObjectiveOn(Mission.scion1)
			Attack(Mission.scion1,Mission.player)


			if (IsAlive(Mission.scion2)) then
			
				Attack(Mission.shabayev,Mission.scion2)
			
			else
			
				Attack(Mission.shabayev,Mission.scion1)
			end


			if (IsAlive(Mission.wingman)) then
			
				Attack(Mission.wingman,Mission.scion1)
				SetObjectiveOff(Mission.wingman)
				--SetCurHealth(Mission.wingman,200)
			end

			Mission.coward_check = GetTime() + 10.0
			Mission.in_combat = true
			Mission.scion1_target = true
			Mission.targeted = true
		
		elseif ((IsAlive(Mission.scion2)) and ((GetDistance(Mission.shabayev,Mission.scion2) < 150.0) or (GetDistance(Mission.player,Mission.scion2) < 150.0))) then
		
			ClearObjectives()
			AddObjective("isdf0107.otf", "WHITE")
			AudioMessage("isdf0123.wav") -- (shab) Get this target John
			SetObjectiveOn(Mission.scion2)
			Attack(Mission.scion2,Mission.player)


			if (IsAlive(Mission.scion1)) then
			
				Attack(Mission.shabayev,Mission.scion1)
			
			else
			
				Attack(Mission.shabayev,Mission.scion2)
			end


			if (IsAlive(Mission.wingman)) then
			
				Attack(Mission.wingman,Mission.scion2)
				SetObjectiveOff(Mission.wingman)

			end

			Mission.coward_check = GetTime() + 10.0
			Mission.in_combat = true
			Mission.scion2_target = true
			Mission.targeted = true
		end
	end
	------------------------------------------------/


--[[	-- this is checking to see if the Mission.player is attacking the enemy painted then
	if ((Mission.targeted) and (not Mission.coward_message) and (Mission.coward_check < GetTime())) then
	
		Mission.coward_check = GetTime() + 10.0


		if ((Mission.scion1_target) and (IsAlive(Mission.scion1))) then
		
			if (GetDistance(Mission.player,Mission.scion1) > 300.0) then
			
				AudioMessage("isdf0124.wav") -- (shab) what's up John?!
				Mission.coward_message = true
			end
		end


		if ((Mission.scion2_target) and (IsAlive(Mission.scion2))) then
		
			if (GetDistance(Mission.player,Mission.scion2) > 300.0) then
			
				AudioMessage("isdf0124.wav") -- (shab) what's up John?!
				Mission.coward_message = true
			end
		end
	end

]]--
	-- this is when the Mission.player kills his scion

	if ((not Mission.battle1_over) and (Mission.scion1_target) and (not IsAround(Mission.scion1))) then
	
		if (IsAlive(Mission.scion2)) then
		
			if (not Mission.giveahand) then
			
				ClearObjectives()
				AddObjective("isdf0107.otf", "WHITE")
				AudioMessage("isdf0141.wav")--(shab) good work John - give us Mission.a hand with this one!
				SetObjectiveOn(Mission.scion2)
				Mission.giveahand = true
			end


			if ((not Mission.cheat_death) and (GetCurAmmo(Mission.scion2) < 10)) then
			
				SetCurHealth(Mission.scion2,5)
				Mission.cheat_death = true
			end
		end
	end
	------------------------------------------------/


	if ((not Mission.battle1_over) and (Mission.scion2_target) and (not IsAround(Mission.scion2))) then
	
		if (IsAlive(Mission.scion1)) then
		
			if (not Mission.giveahand) then
			
				ClearObjectives()
				AddObjective("isdf0107.otf", "WHITE")
				AudioMessage("isdf0141.wav")--(shab) good work John - give us Mission.a hand with this one!
				SetObjectiveOn(Mission.scion1)
				Mission.giveahand = true
			end


			if ((not Mission.cheat_death) and (GetCurAmmo(Mission.scion1) < 10)) then
			
				SetCurHealth(Mission.scion1,5)
				Mission.cheat_death = true
			end
		end
	end
	----------------------------------------/


	-- this is if shab destoys her scion first then

	if (not Mission.reroute1) then
	
		if ((Mission.scion1_target) and (not IsAlive(Mission.scion2)) and (IsAlive(Mission.scion1))) then
		
			if (IsAlive(Mission.shabayev)) then
			
				Attack(Mission.shabayev,Mission.scion2)
			end

			if (IsAlive(Mission.wingman)) then
			
				Attack(Mission.wingman,Mission.scion2)
			end

			Mission.reroute1 = true
		end

		if ((Mission.scion2_target) and (not IsAlive(Mission.scion1)) and (IsAlive(Mission.scion2))) then
		
			if (IsAlive(Mission.shabayev)) then
			
				Attack(Mission.shabayev,Mission.scion2)
			end

			if (IsAlive(Mission.wingman)) then
			
				Attack(Mission.wingman,Mission.scion2)
			end

			Mission.reroute1 = true
		end
	end
	----------------------------------------/


	-- this is checking to see when the first two scions are dead

	if ((not Mission.first_scion_dead) and (Mission.on_route)) then
	

		if (GetCurAmmo(Mission.player_ship) < 10) then
		
			if (IsAlive(Mission.scion1)) then
			
				Damage(Mission.scion1,2000)
			end
			if (IsAlive(Mission.scion2)) then
			
				Damage(Mission.scion2,2000)
			end

			Mission.tit_time = GetTime() + 3.0
			SetCurHealth(Mission.wingman,200)
			Mission.first_scion_dead = true
		end
		if ((not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2))) then
		
			Mission.tit_time = GetTime() + 3.0
			SetCurHealth(Mission.wingman,200)
			Mission.first_scion_dead = true
		end
	end
	----------------------------------------/


	-- this is when the two scion ships are destroyed

	if ((not Mission.simms_panic) and (Mission.on_route) and (Mission.first_scion_dead) and (Mission.tit_time < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0107.otf", "GREEN")
		Mission.talk = AudioMessage("isdf0125.wav") -- (Mission.wingman) what the hell were those things?!
		LookAt(Mission.shabayev,Mission.player)

		if (IsAlive(Mission.wingman)) then
		
			Follow(Mission.wingman,Mission.shabayev)
		end

		Mission.reroute1 = true
		Mission.in_combat = false
		Mission.simms_panic = true
	end
	

	-- this is if the Mission.player is far away from shab then
	
	if ((not Mission.battle1_over) and (Mission.simms_panic) and (IsAudioMessageDone(Mission.talk))) then
	
		if (GetDistance(Mission.player,Mission.shabayev) > 100.0) then
		
			ClearObjectives()
			AddObjective("isdf0107.otf", "GREEN")
			AddObjective("isdf0108.otf", "WHITE")
			AudioMessage("isdf0125a.wav") -- (shab) Im not sure - john rondezvous with me!
			Mission.john_check = GetTime() + 60.0
			Mission.dialog2_time = GetTime() + 1.0
			Mission.player_awl = true
		end
		
		Mission.battle1_over = true
	end
	----------------------------------------/


	-- this declares the Mission.player lost if he does not return then

	if (Mission.player_awl) then
	
		if (Mission.dialog2_time < GetTime()) then
		
			Mission.dialog2_time = GetTime() + 1.0

			if (GetDistance(Mission.player,Mission.shabayev) < 100.0) then
			
				Mission.player_awl = false
			end
		end

		if ((not Mission.wingman_report) and (Mission.battle1_over) and (not Mission.bubba) and (Mission.john_check < GetTime())) then
		
			ClearObjectives()
			AddObjective("isdf0108.otf", "RED")
			Mission.player_lost = true
			Mission.bubba = true
		end
	end
	----------------------------------------/


	-- this is shab giving the order to return to base

	if ((not Mission.player_lost) and (not Mission.player_awl)) then
	
		if ((Mission.battle1_over) and (not Mission.wingman_report) and (IsAudioMessageDone(Mission.talk))) then
		
			if (IsAlive(Mission.wingman)) then
			
				LookAt(Mission.wingman,Mission.shabayev)
				LookAt(Mission.shabayev,Mission.player)
				Mission.talk = AudioMessage("isdf0142.wav") -- (shab) looks like we got company lets get back to base!


				--if (GetCurAmmo(Mission.player_ship) > 375) then
				--
				--	Mission.scion1 = BuildObject("fvpsnt", 2,"atbase_point")
				--	Mission.done = true
				--end

				if (GetCurAmmo(Mission.player_ship) > 100) then
				
					Mission.scion1 = BuildObject("fvpscou", 2,"bad_spawn1")
					Mission.scion2 = BuildObject("fvpscou", 2,"bad_spawn2")
					Mission.whatever = GetTime() + 1.0
					Mission.done = true
				end

				Mission.look_time = GetTime() + 1.0
				Mission.john_check = 999999.9
				Mission.wingman_report = true
			
			else
			
				LookAt(Mission.shabayev,Mission.player)
				Mission.talk = AudioMessage("isdf0142.wav") -- (shab) we got company lets get back to base!


				--if (GetCurAmmo(Mission.player_ship) > 375) then
				--
				--	Mission.scion1 = BuildObject("fvpsnt", 2,"atbase_point")
				--	Mission.done = true
				--end

				if (GetCurAmmo(Mission.player_ship) > 100) then
				
					Mission.scion1 = BuildObject("fvpscou", 2,"bad_spawn1")
					Mission.scion2 = BuildObject("fvpscou", 2,"bad_spawn2")
					SetSkill(Mission.scion1,3)
					SetSkill(Mission.scion2,3)
					Mission.whatever = GetTime() + 1.0
					Mission.done = true
				end

				Mission.look_time = GetTime() + 1.0
				Mission.john_check = 999999.9
				Mission.wingman_report = true
			end
		end
	end
	----------------------------------------/


	-- this is shab heading back to base

	if ((not Mission.base_return) and (Mission.wingman_report) and (IsAudioMessageDone(Mission.talk))) then
	
		ClearObjectives()
		AddObjective("isdf0108.otf", "GREEN")
		AddObjective("isdf0102.otf", "WHITE")
		--Goto(Mission.shabayev,"Mission.base_center")
		Goto(Mission.shabayev,"return_path2")
		--Goto(Mission.shabayev,"path_3")
		Follow(Mission.wingman,Mission.shabayev)
		Mission.return_time = GetTime() + 5.0
		Mission.next_wave_time = GetTime() + 2.0
		Mission.look_time = GetTime() + 999999.9
		Mission.base_return = true
	end
	----------------------------------------/


	-- this holds the new scions until the Mission.player is there

	if ((Mission.done) and (not Mission.player_there)) then
	
		if (IsAlive(Mission.scion1)) then
		
			Stop(Mission.scion1)
		end


		if (IsAlive(Mission.scion2)) then
		
			Stop(Mission.scion2)
		end
	end
	----------------------------------------/
end



-- this is when Mission.shabayev and the Mission.player leave to go and help the Mission.wingman



if ((Mission.base_return) and (not Mission.john_away) and (IsAlive(Mission.shabayev)) and (not Mission.player_lost)) then

	if (Mission.done) then
	
		-- checking to see if the second wave is destroyed then

		if ((not Mission.second_dead) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2))) then
		
			Mission.lula_time = GetTime() + 4.0
			Mission.second_dead = true
		end
		------------------------------------------------/


		-- this is shab warning of the appoaching scion

		if ((not Mission.next_detected) and (Mission.next_wave_time < GetTime())) then
		
			Mission.next_wave_time = GetTime() + 0.5

			-- this is warning the Mission.player of the two new scions
			
			if (not Mission.second_dead) then
			
				if (GetDistance(Mission.shabayev,"bad_detected") < 40.0) then
				
					if (not Mission.player_there) then
					
						ClearObjectives()
						AddObjective("isdf0109.otf", "WHITE")
						SetObjectiveOn(Mission.scion1)
						SetObjectiveOn(Mission.scion2)
						tempstr = TranslateString("Mission0101")  -- hostile

						SetObjectiveName(Mission.scion1,tempstr)
						SetObjectiveName(Mission.scion2,tempstr)
					end
					
					Goto(Mission.scion1,Mission.magic_crate)
					Goto(Mission.scion2,Mission.magic_crate)
					AudioMessage("isdf0126.wav") -- (shab) I detect more bogies - John move to intercept
					Mission.next_detected = true
				end
			end
			------------------------------------------------/

--[[
			if ((IsAlive(Mission.scion1)) and (GetDistance(Mission.scion1,Mission.player) < 375.0)) then
			
				ClearObjectives()
				AddObjective("isdf0109.otf", "WHITE")
				AudioMessage("isdf0126.wav") -- (shab) I detect more bogies at the base - John move to intercept
				Mission.next_detected = true
			
			elseif ((IsAlive(Mission.scion1)) and (GetDistance(Mission.scion1,Mission.shabayev) < 375.0)) then
			
				ClearObjectives()
				AddObjective("isdf0109.otf", "WHITE")
				AudioMessage("isdf0126.wav") -- (shab) I detect more bogies at the base - John move to intercept
				Mission.next_detected = true
			end
]]--
		end
		------------------------------------------------/

		
		-- this is ording the scion to attack the Mission.player

		if ((not Mission.player_there) and (Mission.whatever < GetTime())) then
		
			Mission.whatever = GetTime() + 1.0


			if ((GetDistance(Mission.player,Mission.scion1) < 200.0) or (GetDistance(Mission.player,Mission.scion2) < 200.0)) then
			
				if (not Mission.next_detected) then
				
					ClearObjectives()
					AddObjective("isdf0109.otf", "WHITE")
				end

				--Defend(Mission.scion1,Mission.magic_crate)
				--Defend(Mission.scion2,Mission.magic_crate)
				Attack(Mission.scion1,Mission.player)
				Attack(Mission.scion2,Mission.player)
				Mission.player_there = true
			end
		end
		------------------------------------------------/
	end

	
	-- checking to see if Mission.shabayev returns to the center then

	if ((Mission.base_return) and (not Mission.returned) and (Mission.return_time < GetTime())) then
	
		Mission.return_time = GetTime() + 0.1


		if (GetDistance(Mission.shabayev,"base_center") < 60.0) then
		
			--Mission.look_time = GetTime()
			Mission.return_time = GetTime() + 0.1
			Mission.returned = true
		end
	end
	------------------------------------------------/


	-- this is if the Mission.player disreguards the attack message then
	
	if (not Mission.didnt_listen) then
	
		if ((not Mission.second_dead) and (Mission.returned) and (Mission.return_time < GetTime())) then
		
			Mission.return_time = GetTime() + 0.1

			if (GetDistance(Mission.player,Mission.shabayev) < 70.0) then
			
				if (IsAlive(Mission.scion1)) then
				
					Attack(Mission.scion1,Mission.player)
				end
				if (IsAlive(Mission.scion2)) then
				
					Attack(Mission.scion2,Mission.player)
				end

				Mission.didnt_listen = true
			end
		end
	end
	------------------------------------------------/


	-- this is red one calling for help after the second battle

	if ((not Mission.mayday_message1) and (Mission.second_dead) and (Mission.lula_time < GetTime())) then
	
		Mission.talk = AudioMessage("isdf0127.wav") -- (Mission.red1) mayday - we need assistance
		Mission.mayday_message1 = true
	end
	------------------------------------------------/

	
	-- this is shab telling Mission.player to return and the Mission.wingman reporting that he is banged up

	if ((not Mission.bang_up_message) and (Mission.returned) and (Mission.mayday_message1) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.lula_time = GetTime() + 1.0


		if (GetDistance(Mission.player,Mission.shabayev) < 100.0) then
		
			ClearObjectives()
			AddObjective("isdf0108.otf", "GREEN")
			Goto(Mission.wingman,"simms_last_point")
			Mission.talk = AudioMessage("isdf0128.wav") -- (shab) Red 1 - can you send location
			--Mission.wing_look_time = GetTime() + 0.5
			Mission.bang_up_message = true
		
		elseif (not Mission.return_message) then
		
			ClearObjectives()
			AddObjective("isdf0109.otf", "GREEN")
			AddObjective("isdf0108.otf", "WHITE")
			AudioMessage("isdf0143.wav")--(shab) Roger Red one. John - rondeszous at base center
			Mission.return_message = true
		end
	end
	------------------------------------------------


	-- this is shab calling for support
--[[
	if ((Mission.bang_up_message) and (not Mission.radio_for_help) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0144.wav")--(shab) roger that number two - come in base
		Mission.radio_for_help = true
	end
	------------------------------------------------/


	-- this is the messages from the attacked squad and Mission.shabayev

	if ((not Mission.mayday_message1) and (Mission.radio_for_help) and (IsAudioMessageDone(Mission.talk))) then
	
		if (GetDistance(Mission.shabayev,Mission.player) < 150.0) then
		
			Mission.talk = AudioMessage("isdf0127.wav") -- (Mission.red1) mayday - we need assistance
			Mission.dialog2_time = GetTime() + 20.0
			Mission.mayday_message1 = true
		end
	end
	------------------------------------------------/
]]--


	if ((not Mission.mayday_message3) and (Mission.bang_up_message) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0129.wav") -- (Mission.red1) Affirmative - hurry!

		Mission.scion1 = BuildObject("fvpsnt", 2, "combat2c")
		Mission.scion2 = BuildObject("fvpsnt", 2, "combat2d")
--		Mission.scion3 = BuildObject("fvpsnt", 2, "combat2e")
		Mission.red1 = BuildObject("p1scout", 3, "combat2a")
		Mission.red2 = BuildObject("p1scout", 3, "combat2b")
		Mission.truck = BuildObject("ivserv", 0, "truck_spawn")
		Ally(0,1)
		Ally(1,0)
		Stop(Mission.scion1)
		Stop(Mission.scion2)
--		Stop(Mission.scion3)
		LookAt(Mission.red1,Mission.player)
		SetObjectiveOn(Mission.red1)
		tempstr = TranslateString("Mission0102")  -- hostile
		SetObjectiveName(Mission.red1,tempstr)
		LookAt(Mission.red2,Mission.player)
		LookAt(Mission.truck,Mission.player)

		--Mission.dialog2_time = GetTime() + 10.0
		Mission.look_time = GetTime() + 1.5
		Mission.away_check = GetTime() + 2.0
		Mission.attack_check = GetTime() + 1.5
		Mission.at_player = true
		Mission.mayday_message3 = true
	end


	-- this is Simms saying he can't make it

	if ((not Mission.mayday_message2) and (Mission.mayday_message3) and (IsAudioMessageDone(Mission.talk))) then
	
		LookAt(Mission.wingman,Mission.shabayev)
		Mission.talk = AudioMessage("isdf0130.wav") -- (Mission.wingman) I got banged up pretty bad out there sir
		--Mission.dialog2_time = GetTime() + 10.0
		Mission.mayday_message2 = true
	end
	------------------------------------------------/


	-- this holds all the parties until it's time to fight

	if (Mission.mayday_message3) then
	
		if (IsAlive(Mission.scion1)) then
		
			Stop(Mission.scion1)
		end

		if (IsAlive(Mission.scion2)) then
		
			Stop(Mission.scion2)
		end
		
		if (IsAlive(Mission.scion3)) then
		
			Stop(Mission.scion3)
		end

		if (IsAlive(Mission.red1)) then
		
			--SetTeamNum(Mission.red1,1)
			Stop(Mission.red1)
		end

		if (IsAlive(Mission.red2)) then
		
			--SetTeamNum(Mission.red2,1)
			Stop(Mission.red2)
		end

		if (IsAlive(Mission.truck)) then
		
			SetTeamNum(Mission.truck,1)
			Stop(Mission.truck)
		end
	end
	------------------------------------------------/


	-- this is when shab sends the Mission.player out into the field

	if (not Mission.john_away) then
	
		if ((not Mission.alt_message1) and (Mission.mayday_message2) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf0145.wav")--(shab) roger that - number 2 stay here - number one follow me!
			Mission.alt_message1 = true
		end


		if ((not Mission.to_goalone) and (Mission.alt_message1) and (IsAudioMessageDone(Mission.talk))) then
		
			ClearObjectives()
			AddObjective("isdf0102.otf", "WHITE")
			Goto(Mission.shabayev,"goal_one_path")
			Goto(Mission.wingman,"base_center")
			Mission.to_alone_check = GetTime() + 1.0
			Mission.look_time = 999999.9
			Mission.to_goalone = true
		end


		if ((Mission.to_goalone) and (not Mission.alt_message2) and (Mission.to_alone_check < GetTime())) then
		
			Mission.to_alone_check = GetTime() + 1.0


			if (GetDistance(Mission.shabayev,"goalone_point") < 30.0) then
			
				LookAt(Mission.shabayev,Mission.player)
				Mission.facing_time = GetTime() + 6.0
				Mission.talk = AudioMessage("isdf0146.wav")--(shab) This area's too hot, I'll have to stay with number 2. The squad in trouble is just over those hills
				Mission.alt_message2 = true
			end
		end


		if ((Mission.alt_message2) and (not Mission.change_look1) and (Mission.facing_time < GetTime())) then
		
			LookAt(Mission.shabayev,Mission.red1)
			Mission.change_look1 = true
		end


		-- this is if the Mission.player's ammo is low then

		if ((Mission.change_look1) and ((GetCurHealth(Mission.player_ship) < 1800) or (GetCurAmmo(Mission.player_ship) < 750))) then
			
			if ((not Mission.alt_message3) and (IsAudioMessageDone(Mission.talk))) then
			
				LookAt(Mission.shabayev,Mission.storage_bay)
				Mission.h1 = GetCurHealth(Mission.player_ship)
				Mission.a1 = GetCurAmmo(Mission.player_ship)
				Mission.talk = AudioMessage("isdf0147.wav")--(shab) I noticed that there were some ammo and repair supplys in that storage bay!
				Mission.facing_time = GetTime() + 5.0-- load up before here before you head out!
				Mission.alt_message3 = true
			end


			if ((Mission.alt_message3) and (not Mission.goto_sbay) and (Mission.facing_time < GetTime())) then
			
				Goto(Mission.shabayev,"getammo_point")
				Mission.facing_time = GetTime() + 1.0
				Mission.goto_sbay = true
			end


			if ((Mission.goto_sbay) and (not Mission.at_sbay) and (Mission.facing_time < GetTime())) then
			
				Mission.facing_time = GetTime() + 1.0


				if (GetDistance(Mission.shabayev,"getammo_point") < 30.0) then
				
					LookAt(Mission.shabayev,Mission.player)
					Mission.at_sbay = true
				end
			end
		end
		------------------------------------------------/

		-- this tells the Mission.player to go out there and help

		if ((not Mission.alt_message4) and (Mission.alt_message2)) then
		
			if (Mission.alt_message3) then
			
				Mission.h2 = GetCurHealth(Mission.player_ship)
				Mission.a2 = GetCurAmmo(Mission.player_ship)


				if ((Mission.a2>Mission.a1) or (Mission.h2>Mission.h1)) then
				
					StopAudioMessage(Mission.talk)
					ClearObjectives()
					AddObjective("isdf0110.otf", "WHITE")
					AudioMessage("isdf0148.wav")--(shab) alright John - now go help those men!
					Mission.away_check2 = GetTime() + 120.0
					Mission.attack_check = GetTime() + 1.5
					Mission.alt_message4 = true
				end
			
			elseif (IsAudioMessageDone(Mission.talk)) then
			
				ClearObjectives()
				AddObjective("isdf0110.otf", "WHITE")
				LookAt(Mission.shabayev,Mission.player)
				AudioMessage("isdf0148.wav")--(shab) alright John - now go help those men!
				Mission.away_check2 = GetTime() + 120.0
				Mission.attack_check = GetTime() + 1.5
				Mission.alt_message4 = true
			end
		end
		------------------------------------------------/
	end
	------------------------------------------------/

--[[
	if ((not Mission.mayday_message5) and (Mission.mayday_message3) and (IsAudioMessageDone(Mission.talk))) then
	
--		Mission.talk = AudioMessage("isdf0131.wav") -- (shab) Roger - John, you're going to have to go!
--		Mission.dialog2_time = GetTime() + 10.0
--		Mission.away_check = GetTime() + 2.0
--		Mission.away_check2 = GetTime() + 120.0
--		Mission.attack_check = GetTime() + 1.5
--		Mission.mayday_message5 = true
	end


	-- this contols who the Mission.wingman is looking at

	if (not Mission.john_away) then
	
		if (Mission.wing_look_time < GetTime()) then
		
			if ((not Mission.wingat_player) and (IsAlive(Mission.wingman))) then
			
				LookAt(Mission.wingman,Mission.player)
				Mission.wing_look_time = GetTime() + 6.0
				Mission.wingat_player = true
			
			elseif (IsAlive(Mission.wingman)) then
			
				LookAt(Mission.wingman,Mission.shabayev)
				Mission.wing_look_time = GetTime() + 15.0
				Mission.wingat_player = false
			end
		end
	end
	------------------------------------------------/	
]]--

	-- this is checking to see if the Mission.player actually goes to help then

	if ((not Mission.coward2) and (Mission.alt_message4) and (Mission.away_check2 < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0110.otf", "WHITE")
		AudioMessage("isdf0132.wav") -- (shab) what's the hold up John?
		Mission.away_check2 = GetTime() + 160.0
		Mission.coward2 = true
	end
	------------------------------------------------/	


	-- this is checking to see of john is heading for the battlezone or wasting time

	if ((not Mission.john_away) and (Mission.away_check < GetTime())) then
	
		Mission.away_check = GetTime() + 1.0

		if (GetDistance(Mission.player,Mission.red1) < 200.0) then
		
			Goto(Mission.shabayev,"base_center")
			Mission.attack_check = GetTime() + 1.0
			SetObjectiveOff(Mission.shabayev)
			Mission.john_away = true
			Mission.coward2 = false
		end
	end
	------------------------------------------------/	
end



-- now the Mission.player is on his own ----------------------------------/



if (Mission.john_away) then

	if (not Mission.john_close) then
	
		-- this holds all the players until the time is right

		if (IsAlive(Mission.scion1)) then
		
			Stop(Mission.scion1)
		end
		if (IsAlive(Mission.scion2)) then
		
			Stop(Mission.scion2)
		end	
		if (IsAlive(Mission.scion3)) then
		
			Stop(Mission.scion3)
		end
		if (IsAlive(Mission.red1)) then
		
			Stop(Mission.red1)
		end
		if (IsAlive(Mission.red2)) then
		
			Stop(Mission.red2)
		end
		if (IsAlive(Mission.truck)) then
		
			Stop(Mission.truck)
		end
	end
	------------------------------------------------/	


	-- this is triggering the attack and blowing up red 2

	if ((not Mission.john_close) and (Mission.attack_check < GetTime())) then
	
		Mission.attack_check = GetTime() + 0.5


		if (GetDistance(Mission.player,Mission.red1) < 200.0) then
		
			if (IsAlive(Mission.red2)) then
			
				Damage(Mission.red2, 1990)
				Defend2(Mission.red2,Mission.last_crate,1)
			end

			if (IsAlive(Mission.red1)) then
			
				Attack(Mission.red1,Mission.scion1)
			end

			if (IsAlive(Mission.scion1)) then
			
				Defend2(Mission.scion1,Mission.last_crate,1)
			end

			if (IsAlive(Mission.scion2)) then
			
				Defend2(Mission.scion2,Mission.last_crate,1)
			end

			if (IsAlive(Mission.scion3)) then
			
				Defend2(Mission.scion3,Mission.last_crate,1)
			end

			Mission.in_combat = true
			Mission.john_close = true
		end
	end
	------------------------------------------------/	


	-- this keeps Mission.red1 alive

	if ((not Mission.red1_return) and (IsAlive(Mission.red1))) then
	
		if ((Mission.attack2) and (GetCurHealth(Mission.red1) < 200)) then
		
			SetCurHealth(Mission.red1, 200)
		end
	end
	------------------------------------------------/

--[[
	if ((not Mission.truck_return) and (Mission.attack2)) then
		
		if (not Mission.freed) then
		
			if (IsAlive(Mission.scion1)) then
			
				Goto(Mission.scion1,"combat2a")
			end
			

			if (IsAlive(Mission.scion2)) then
			
				Goto(Mission.scion2,"combat2b")
			end


			if (IsAlive(Mission.scion3)) then
			
				Goto(Mission.scion3,"combat2b")
			end

			Mission.freed = true
		end


		if (not Mission.john_close) then
		
			if (IsAlive(Mission.red2))  then
			
				LookAt(Mission.red2,Mission.player)
			end

			if (IsAlive(Mission.truck)) then
			
				LookAt(Mission.truck,Mission.player)
			end
		end
	end
]]--
	
	-- this is checking to see when the battle is over

	if ((not Mission.battle2_over) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
	
		if (IsAlive(Mission.red1)) then
		
			Goto(Mission.red1,Mission.player)
		end

		if (IsAlive(Mission.red2)) then
		
			Damage(Mission.red2, 2000)
		end
		
		ClearObjectives()
		AddObjective("isdf0110.otf", "GREEN")
		Mission.red1_check = GetTime() + 1.0
		Mission.in_combat = false
		Mission.battle2_over = true
	end
	------------------------------------------------/

	
	-- this is when Mission.red1 thanks Mission.player

	if ((not Mission.thanks_message) and (Mission.battle2_over) and (IsAlive(Mission.red1)) and (Mission.red1_check < GetTime())) then
	
		Mission.red1_check = GetTime() + 0.2

		if (GetDistance(Mission.red1,Mission.player) < 60.0) then
		
			LookAt(Mission.red1,Mission.player)
			Mission.speak = AudioMessage("isdf0133.wav") -- Mission.red1 thanks! look for my service Mission.truck in crater
			Mission.red1_check = GetTime() + 2.5
			Mission.in_combat = false		
			Mission.thanks_message = true
		end
	end
	------------------------------------------------/


	-- this makes Mission.red1 look at the Mission.truck

	if ((not Mission.red_look_truck) and (Mission.thanks_message) and (Mission.red1_check < GetTime())) then
	
		LookAt(Mission.red1,Mission.truck)
		SetObjectiveOn(Mission.truck)
		tempstr = TranslateString("Mission0103")  -- hostile
		SetObjectiveName(Mission.truck,tempstr)
		Mission.red_look_truck = true
	end


	-- this is sending Mission.red1 back to base

	if ((not Mission.red1_return) and (Mission.red_look_truck) and (IsAudioMessageDone(Mission.speak))) then
	
		ClearObjectives()
		AddObjective("isdf0111.otf", "WHITE")
		SetObjectiveOff(Mission.red1)
		Goto(Mission.red1, "truck_home_point")
		Mission.truck_check = GetTime() + 2.0
		Mission.truck_lost_check = GetTime() + 160.0
		Mission.red1_return = true
	end
	------------------------------------------------/


	-- this is if the Mission.player does not reach the Mission.truck then

	if (IsAlive(Mission.truck)) then
	
		if ((not Mission.truck_found) and (not Mission.no_find_truck) and (Mission.red1_return) and (Mission.truck_lost_check < GetTime())) then
		
			ClearObjectives()
			AddObjective("isdf0111.otf", "WHITE")
			Mission.truck_lost_check = GetTime() + 180.0
			AudioMessage("isdf0134.wav") -- (shab) go to Mission.truck!
			SetObjectiveOn(Mission.truck)
			Mission.no_find_truck = true
		end
		

		-- this is checking to see if the Mission.player reaches the lost Mission.truck then

		if ((not Mission.truck_found) and (Mission.red1_return) and (Mission.truck_check < GetTime())) then
		
			Mission.truck_check = GetTime() + 2.0


			 if (GetDistance(Mission.player,Mission.truck) < 100.0) then
			 
				ClearObjectives()
				AddObjective("isdf0111.otf", "GREEN")
				Mission.talk = AudioMessage("isdf0135.wav") -- (Mission.truck) get me out of here!
				Mission.truck_talk_time = GetTime() + 10.0
				Mission.truck_found = true
			 end
		end
		------------------------------------------------/


		if ((not Mission.truck_response1) and (Mission.truck_found) and (IsAudioMessageDone(Mission.talk))) then
		
			SetObjectiveOn(Mission.shabayev)
			SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
			Mission.talk = AudioMessage("isdf0136.wav") -- (shab) Mission.truck john will escort you back to base you must leave that area!
			Mission.truck_talk_time = GetTime() + 10.0
			Mission.spawn_check = GetTime() + 1.0
			Mission.truck_response1 = true
		end


		if ((not Mission.truck_return) and (Mission.truck_response1) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf0137.wav") -- (Mission.truck) all right
			Mission.truck_talk_time = GetTime() + 10.0
			Goto(Mission.truck,"truck_path",1)
			Mission.truck_return = true
		end


		if ((not Mission.truck_response2) and (Mission.truck_return) and (IsAudioMessageDone(Mission.talk))) then
		
			ClearObjectives()
			AddObjective("isdf0112.otf", "WHITE")
			Mission.talk = AudioMessage("isdf0138.wav") -- (shab) john - protect that Mission.truck
			Mission.truck_talk_time = GetTime() + 10.0
			Mission.in_combat = true
			Mission.truck_response2 = true
		end
	end
	------------------------------------------------/


	if ((not Mission.last_spawned) and (Mission.truck_response2) and (Mission.spawn_check < GetTime())) then
	
		--Mission.spawn_check = GetTime() + 3.0

		--Mission.x,"espawn_truck")
		--Mission.y,"espawn1_combat2")

		
		--if ((Mission.x > 300) and (Mission.y > 300)) then
		--
			Mission.scion1 = BuildObject("fvpsnt", 2,"espawn_truck")
			Mission.scion2 = BuildObject("fvpsnt", 2,"espawn1_combat2")


			if (IsAlive(Mission.truck)) then
			
				Attack(Mission.scion1,Mission.truck,0)
				Attack(Mission.scion2,Mission.truck,0)
			end

			Mission.spawn_check = GetTime() + 3.0
			Mission.last_check = GetTime() + 2.0
			Mission.last_spawned = true
		--end
	end

	-- this will build the third scion

	if ((not Mission.extra_spawned) and (Mission.last_spawned) and (Mission.spawn_check < GetTime())) then
	
		Mission.scion3 = BuildObject("fvpsnt", 2,"espawn1_combat2")

		if (IsAlive(Mission.truck)) then
		
			Attack(Mission.scion3,Mission.truck)
		end

		Mission.extra_spawned = true
	end

	
	-- this will have shab come and help John if he is close to the base at the end. then

	if ((Mission.last_spawned) and (not Mission.last_message) and (Mission.last_check < GetTime())) then
	
		Mission.last_check = GetTime() + 2.0


		if ((IsAlive(Mission.scion1)) and (GetDistance(Mission.player,Mission.scion1) < 450.0)) then
		
			AudioMessage("isdf0149.wav")--(shab) I picking up two more on an intercept course - hold them off - I'm on my way!
			Goto(Mission.shabayev,Mission.player)
			Mission.last_check = GetTime() + 2.0
			Mission.last_message = true
		
		elseif ((IsAlive(Mission.scion2)) and (GetDistance(Mission.player,Mission.scion2) < 450.0)) then
		
			AudioMessage("isdf0149.wav")--(shab) I picking up two more on an intercept course - hold them off - I'm on my way!
			Follow(Mission.shabayev,Mission.truck,1)
			Mission.last_check = GetTime() + 2.0
			Mission.last_message = true
		end
	end
	------------------------------------------------/


	if ((Mission.last_message) and (not Mission.last_message2) and (not Mission.last_attack) and (Mission.last_check < GetTime())) then
	
		Mission.last_check = GetTime() + 2.0


		if (GetDistance(Mission.shabayev,Mission.truck) < 100.0) then
		
			if (IsAlive(Mission.scion1)) then
			
				Attack(Mission.shabayev,Mission.scion1)
				Attack(Mission.scion1,Mission.truck)

				if (IsAlive(Mission.scion2)) then
				
					Attack(Mission.scion2,Mission.truck)
				end

				Mission.last_attack = true
			
			elseif (IsAlive(Mission.scion2)) then
			
				Attack(Mission.shabayev,Mission.scion2)
				Attack(Mission.scion2,Mission.truck)
				Mission.last_attack = true
			end
		end
	end


	if ((Mission.last_message) and (not Mission.last_message2)) then
	
		if ((not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
		
			if (GetDistance(Mission.truck,"base_center") > 100.0) then
			
				Follow(Mission.shabayev,Mission.truck)
				Mission.talk = AudioMessage("isdf0158.wav")--(shab) good job follow THE TRUCK back to base
				
				--Mission.scion1 = BuildObject("fvpsnt", 2,"espawn_truck")
				--Mission.scion2 = BuildObject("fvpsnt", 2,"espawn1_combat2")
				--Attack(Mission.scion1,Mission.truck)
				--Attack(Mission.scion2,Mission.truck)
				--Mission.really_last_time = GetTime() + 1.0				
				
				Mission.tubby = true
			end

			Mission.last_message2 = true
		

		elseif ((not Mission.gus) and (not IsAlive(Mission.scion1))) then
		
			Attack(Mission.shabayev,Mission.scion2)
			Mission.gus = true
		
		elseif ((not Mission.gus) and (not IsAlive(Mission.scion2))) then
		
			Attack(Mission.shabayev,Mission.scion1)
			Mission.gus = true
		end
		
	end

	-- this is sending in the VERY last wave

	if (Mission.tubby) then
	
		if ((not Mission.very_last_message) and (Mission.really_last_time < GetTime())) then
		
			Mission.really_last_time = GetTime() + 1.0

			if ((GetDistance(Mission.scion1,Mission.player) < 350.0) or (GetDistance(Mission.scion2,Mission.player) < 350.0)) then
			
				AudioMessage("isdf0175.wav") -- (shab) two more coming in!
				Mission.very_last_message = true
			end
		end
		------------------------------------------------/
	end
end


-- this is what happens if the Mission.player gets "lost" ----------------/ then



if ((Mission.player_lost) and (IsAlive(Mission.shabayev))) then

	LookAt(Mission.shabayev,Mission.player)

	if (not Mission.set_lost_times) then -- reset then
	
		-- this is when he leaves the base after getting there

		if ((not Mission.left_base) and (Mission.shab_to_center)) then
		
			if (not Mission.return_to_base) then -- reset then
			
				AudioMessage("isdf0150.wav") -- (Shab) where are you going John?!
				LookAt(Mission.shabayev,Mission.player)
				Mission.player_lost_time = GetTime() + 2.0
				Mission.lost_warning_time = GetTime() + 40.0
				Mission.return_to_base = true
				Mission.set_lost_times = true
			end
		
		-- this is what happens when he leaves in the field
		else
		
			AudioMessage("return01.wav") -- (Shab) number 1 return to squad!
			Mission.player_lost_time = GetTime() + 2.0


			if (not Mission.first_time) then
			
				Mission.lost_warning_time = GetTime() + 40.0
			
			else
			
				Mission.lost_warning_time = GetTime() + 60.0
			end

			Mission.set_lost_times = true
		end
	end
	------------------------------------------------/


	if (Mission.set_lost_times) then
	
		if ((Mission.return_to_base) and (not Mission.return_to_base2) and (Mission.lost_warning_time < GetTime())) then
		
			AudioMessage("isdf0151.wav") -- (Shab) return to the base immediately!
			LookAt(Mission.shabayev,Mission.player)
			Mission.lost_warning_time = GetTime() + 40.0
			Mission.return_to_base2 = true
		end


		if ((not Mission.shab_to_center) or ((Mission.shab_to_center) and (Mission.left_base))) then
		
			if ((Mission.first_time) and (Mission.lost_warning_time < GetTime())) then
			
				LookAt(Mission.shabayev,Mission.player)
				AudioMessage("return04.wav") -- (Shab) use your radar to find me!
				Mission.lost_warning_time = GetTime() + 90.0
				Mission.first_time = false
			end


			if ((not Mission.second_warning)  and (Mission.lost_warning_time < GetTime())) then
			
				LookAt(Mission.shabayev,Mission.player)
				AudioMessage("return02.wav") -- (Shab) This is your last warning!
				Mission.lost_warning_time = GetTime() + 40.0
				Mission.second_warning = true
			end
		end
	end




	-- this is if the Mission.player returns then

	if ((Mission.set_lost_times) and (Mission.player_lost_time < GetTime())) then
	
		Mission.player_lost_time = GetTime() + 2.0


		if ((Mission.shab_to_center) and (not Mission.left_base)) then
		
			if (GetDistance(Mission.player,"base_center") < 100.0) then
			
--				AudioMessage("return05.wav") -- (shab) thanks for complying - do you want to carry out my orders now?!
				Mission.player_lost = false
				Mission.set_lost_times = false
				Mission.return_to_base = false
				Mission.return_to_base2 = false
			end
		
		elseif (GetDistance(Mission.shabayev,Mission.player) < 50.0) then
		
			if ((not Mission.first_time) and (not Mission.encouragement)) then
			
				AudioMessage("return05.wav") -- (shab) Good! hang in there, the terrain is pretty trecherous!
				Mission.encouragement = true
			end

			Mission.wait2_time = GetTime() + 5.0
			Mission.player_lost = false
			Mission.player_awl = false
			Mission.set_lost_times = false
			Mission.second_warning = false
		end
	end
	------------------------------------------------/
end

-- these are the win/loose conditions --------------------------/


	if (not Mission.game_over) then

		-- this is the winning condition

		if ((Mission.truck_response2) and (not Mission.game_over) and (Mission.truck_talk_time < GetTime())) then
		
			Mission.truck_talk_time = GetTime() + 1.0

			if ((Mission.last_spawned) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3))) then
			
				if (GetDistance(Mission.truck,"truck_home_point") < 100.0) then
				
					ClearObjectives()
					AddObjective("isdf0112.otf", "GREEN")
					AudioMessage("isdf0157.wav") -- (shab) Well Mission.done John!
					SucceedMission(GetTime() + 10.0,"isdf01w1.txt")
					Mission.game_over = true
				end
			end
		end
		------------------------------------------------/


		-- this is if the Mission.player kills one of the openning Mission.wingman then
		
		if ((Mission.start_done) and (not Mission.first_squad_removed)) then
		
			if ((not IsAlive(Mission.squad1_a)) or (not IsAlive(Mission.squad1_b)) or (not IsAlive(Mission.squad1_c))) then
				FailMission(GetTime() + 1.0)
				Mission.game_over = true
			end
		end
		------------------------------------------------/


		-- this is for when the Mission.player is away from Mission.shabayev for too long

		if ((Mission.player_lost) and ((Mission.second_warning) or (Mission.return_to_base2)) and (Mission.lost_warning_time < GetTime())) then
		
			if ((Mission.shab_at_base) and (not Mission.left_base)) then
			
				AudioMessage("isdf0152.wav") -- have fun out there - your demoted for not obeying orders
			
			elseif ((Mission.shab_at_base) and (Mission.left_base)) then -- she was at the base but now left then
			
				AudioMessage("return03.wav") -- (shab) I'm moving on without you
			
			else
			
				AudioMessage("return03.wav") -- (shab) I'm moving on without you!
			end
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
		------------------------------------------------/


		-- this is if Mission.shabayev gets destroyed then

		if ((not IsAlive(Mission.shabayev)) and (not Mission.game_over)) then

			FailMission(GetTime() + 5.0)
			Mission.game_over = true
		end
		------------------------------------------------/


		-- this is if the Mission.player blows up the comm. building then

		if ((not IsAround(Mission.comm_building)) and (not Mission.game_over)) then

			AudioMessage("isdf0153.wav") -- (shab) I gave no order to destroy anything!
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
		------------------------------------------------/


		-- this is if the Mission.player's ship gets destroyed then

		if ((not IsAround(Mission.player_ship)) and (not Mission.ship_destroyed)) then
		
			Mission.ship_destroyed_time = GetTime() + 3.0
			Mission.ship_destroyed = true
		end


		if ((Mission.ship_destroyed) and (not Mission.game_over) and (Mission.ship_destroyed_time < GetTime())) then
		
			AudioMessage("isdf0154.wav") -- (shab) we don't have another ship in the area!
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
		------------------------------------------------/


		-- if the Mission.player does not return to his ship after entering building then

		if ((Mission.shab_warning1) and (not Mission.left_base) and (not Mission.game_over) and (Mission.john_ship_check < GetTime())) then
		
			AudioMessage("return03.wav") -- (shab) I'm moving on without you!
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
		------------------------------------------------/


		-- this is if the Mission.player never shows up at the second battle then

		if ((Mission.coward2) and (not Mission.attack2) and (not Mission.game_over) and (Mission.away_check2 < GetTime())) then
		
			ClearObjectives()
			AddObjective("isdf0110.otf", "WHITE")
			AudioMessage("isdf0155.wav") -- (shab) those men are lost because you did not follow orders!
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
		------------------------------------------------/


		-- this is chcking to see if the Mission.truck is alive then

		if ((Mission.truck_return) and (not Mission.game_over) and (not IsAlive(Mission.truck))) then
		
			ClearObjectives()
			AddObjective("isdf0112.otf", "RED")
			AudioMessage("isdf0156.wav") -- (shab) You let the Mission.truck get destroyed john!
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
		------------------------------------------------/

		if (GetCurAmmo(Mission.player)<105) then
			SetCurAmmo(Mission.player,106)  -- HACK HACK
		end
	end

------------------------------------------------------------/	
end -- Mission.ON_HOLD

if (Mission.ON_HOLD) then

------------------------------------------------------------/	

	Mission.johns_orders = true

	-- this is where I need to determine if the Mission.player is in the building then

	if (InBuilding(Mission.player)) then
	
		Mission.inside = true

		if ((not Mission.in_comm) and (GetDistance(Mission.player,Mission.comm_building) < 20.0)) then
		
			Mission.in_comm = true
		end
	
	else
	
		Mission.inside = false
		Mission.in_comm = false
	end


	-- this is where I trigger the cineractive

	if (Mission.johns_orders) then
	
		if ((not Mission.start_cineractive) and (Mission.in_comm) and (GetDistance(Mission.player,Mission.manson) < 4)) then
		
			CameraReady()
			Mission.line = AudioMessage("cut0201.wav") -- (cook) Someone is in here!
			--Mission.camera_time = GetTime() + 5.0
			Mission.start_cineractive = true
		end
	end


	-- this is the movie code

	if ((not Mission.camera1_over) and (Mission.start_cineractive)) then
	
		if (not Mission.first_frame)  then
		
			CameraReady()
			Mission.first_frame = true
		end
		
		PlayMovie("manson1")
	end


	if ((not Mission.camera2_over) and (Mission.first_frame) and (Mission.line4)) then
	
		CameraObject(Mission.shabayev,0,1,5,Mission.shabayev) -- 3.7
		--Mission.a = Mission.a + 0.1
		Mission.camera1_over = true
	end


	if ((Mission.movie1) and (Mission.line5)) then
	
		if (not Mission.reframe1) then
		
			--StopMovie()
			CameraReady()
			Mission.reframe1 = true
		end

		Mission.movie1 = PlayMovie("base_look")
		Mission.movie2 = true
	end

	
	if ((not Mission.movie1) and (Mission.movie2)) then
	
		Mission.movie2 = PlayMovie("manson2")
		Mission.camera3_over = true
	end

	--------------------------------------------


	if ((not Mission.line2) and (Mission.start_cineractive) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0202.wav") -- (shab) A man? Is he alive?
		Mission.line2 = true
	end
	if ((not Mission.line3) and (Mission.line2) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0203.wav") -- (Mission.manson) If you call this living - who is this?
		SetAnimation(Mission.manson,"line1",1)
		Mission.line3 = true
	end
	if ((not Mission.line4) and (Mission.line3) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0204.wav") -- (shab) This is shab?
		Mission.line4 = true
	end
	if ((not Mission.line5) and (Mission.line4) and (IsAudioMessageDone(Mission.line))) then
	
		Mission.line = AudioMessage("cut0205.wav") -- (Mission.manson) is your radio working?
		--SetAnimation(Mission.manson,"Mission.line2",1)
		StopMovie()
		CameraFinish()
		Mission.camera2_over = true
		Mission.line5 = true
	end
	if ((not Mission.line6) and (Mission.line5) and (IsAudioMessageDone(Mission.line))) then
	
		--Matrix pos
		--GetPosition(Mission.manson,pos)
		--RemoveObject(Mission.manson)
		--Mission.manson = BuildObject("manson2",0,pos)

		Mission.line = AudioMessage("cut0206.wav") -- (shab) no - interfierence?
		Mission.line6 = true
	end
	if ((not Mission.line7) and (Mission.line6) and (IsAudioMessageDone(Mission.line))) then
	
		SetAnimation(Mission.manson,"line2",1)
		Mission.line = AudioMessage("cut0207.wav") -- (Mission.manson) Then they already know you are hear!
		Mission.line7 = true
	end


	-- this is where I trigger the cineractive

	if ((not Mission.cineractive_over) and (Mission.line7) and (IsAudioMessageDone(Mission.line))) then
	
		CameraFinish()
		Mission.cineractive_over = true

		if (not Mission.shab_at_comm) then
		
			Goto(Mission.shabayev,Mission.player_ship)
			Mission.shab_at_comm = true
		end
	end
	------------------------------------------------/

------------------------------------------------------/
end -- Mission.ON_HOLD
------------------------------------------------------/


 	
end