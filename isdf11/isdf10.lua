--[[

isdf10
Event Scripting: 
Ported to LUA: 
Date: 7-11-2021
Description: Campagin mission isdf10 ported to LUA
References:
1. https:--steamcommunity.com-sha"RED"files-filedetails-?id=1488402495
2. https:www.lua.org-docs.html
]] --
local Mission = {
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
	on_hold = false,
	start_done = false,
	free_recycler = false,
	part_two = false,
	wing_move = false,
	wing_turn = false,
	wing_free = false,
	caps_gone = false,
	mcap1_gone = false,
	mcap2_gone = false,
	mcap3_gone = false,
	mcap4_gone = false,
	mcap5_gone = false,
	mcap6_gone = false,
	scap1_gone = false,
	scap2_gone = false,
	recycler_message1 = false,
	recycler_underway = false,
	free_first = false,
	at_one = false,
	at_two = false,
	at_three = false,
	at_four = false,
	near_madeit = false,
	at_madeit = false,
	at_nav = false,
	underway_canceled = false,
	madeit_message = false,
	whyselected_message = false,
	caps_gone_message = false,
	destroy_hint = false,
	cover_tracks_message = false,
	recy_detected_message = false,
	game_over = false,
	drop_message1 = false,
	drop_message2 = false,
	drop_message3 = false,
	in_air = true,
	first_land = false,
	shab_found = false,
	shab_scanned = false,
	shab_scan_message = false,
	at_choke1 = false,
	at_choke2 = false,
	at_choke3 = false,
	start_patrol1 = false,
	start_patrol2 = false,
	patrol1_dead = false,
	patrol2_dead = false,
	player_ship_found = false,
	recy_fall_in = false,
	scap1_start = false, 
	scap2_start = false,
	mcap1_start = false, 
	mcap2_start = false, 
	mcap3_start = false,
	mcap4_start = false, 
	mcap5_start = false, 
	mcap6_start = false,
	rhino1_in = false, 
	rhino2_in = false, 
	rhino3_in = false, 
	rhino4_in = false,
	rhino1_charge = false, 
	rhino2_charge = false, 
	rhino3_charge = false, 
	rhino4_charge = false, 
	base_message = false,
	set_plan1 = false,
	scout1_a = false, 
	scout2_a = false, 
	scout3_a = false, 
	scout4_a = false, 
	guard1_a = false, 
	guard2_a = false, 
	guard3_a = false, 
	guard4_a = false,
	sent1_a = false, 
	sent2_a = false, 
	sent3_a = false, 
	sent4_a = false,
	war1_a = false, 
	war2_a = false, 
	war3_a = false, 
	war4_a = false,
	maul1_a = false, 
	maul2_a = false, 
	maul3_a = false, 
	maul4_a = false, 
	lance1_a = false, 
	lance2_a = false, 
	lance3_a = false, 
	lance4_a = false,
	second_patrol1 = false, 
	second_patrol2 = false, 
	stop_guard1_dead = false, 
	stop_guard2_dead = false,
	guard1_to_post = false, 
	guard2_to_post = false,
	sent1_attack_recy = false, 
	sent2_attack_recy = false, 
	war1_attack_recy = false, 
	war2_attack_recy = false, 
	maul1_attack_recy = false, 
	maul2_attack_recy = false,
	discover1 = false, 
	discover2 = false,
	rhino1_behave = false, 
	rhino2_behave = false, 
	rhino3_behave = false, 
	rhino4_behave = false,
	drop_message4 = false,
	transport_message = false,
	rhino2_after_recy = false, 
	rhino3_after_recy = false, 
	rhino4_after_recy = false,
	cheat2 = false,
	land_secure = false,
	turret_message = false,
	turret_otf = false,
	build_patrol = false,
	first_scav = false,
	camera_off = false,
	landing = false, 
	landed = false, 
	two_land = false, 
	take_off = false,
	animate_rhino1 = false,
	animate_rhino2 = false,
	animate_rhino3 = false,
	animate_rhino4 = false,
	satch_alive = false,
	ship1_bomb = false, 
	ship2_bomb = false,
	fall1_already = false,
	fall2_already = false,
	fall3_already = false,
	fall4_already = false,
	suicide_run = false,
	start_end_movie = false, 
	shot2 = false,
	remove_transport = false, 
	hold_stuff = false, 
	free_player = false, 
	big_switch = false, 
	black = false,
	first_talk = false,
	second_talk = false,
	boom = false,
	last_talk = false,
	fall_sound = false,

--  floats
	recy_check = 1.0,
	talk = 0, 
	wing_turn_time = 999999.9,
	maze_check = 999999.9,
	wing_check = 999999.9,
	detect_check = 999999.9,
	win_check = 3.0,
	land_time = 999999.9,
	shab_check = 999999.9,
	message_time = 999999.9,
	escape_check = 999999.9,
	patrol1_time = 999999.9,
	patrol2_time = 999999.9,
	discover_check = 999999.9,
	recy_death_check = 999999.9,
	rhino1_check = 999999.9,
	rhino2_check = 999999.9,
	rhino3_check = 999999.9,
	rhino4_check = 999999.9,
	anim_wait = 999999.9,
	forget_check = 999999.9,
	discover1_time = 999999.9,
	discover2_time = 999999.9,
	cheat2_time = 999999.9,
	turret_time = 999999.9,
	camera_time = 999999.9,
	landing_time = 999999.9,
	guard1_time = 999999.9,
	guard2_time = 999999.9,
	new_plan_time = 999999.9,
	patrol_time = 999999.9,
	carrier_time = 999999.9,
	swap_time = 999999.9,
	talk_time = 999999.9,
	sound_time = 999999.9,
	AllyMinRadiusAway=nil,
	AllyMaxRadiusAway=nil,

  --handles
	player,
	recycler,
	srecycler,
	wingman,
	sscav1,
	sscav2,
	sscav3,
	forge,
	dower,
	stronghold ,
	spire1,
	spire2,
	spire3,
	spire4,
	spire5,
	crash_ship1,
	crash_ship2,
	nav1,
	dropship,
	dropshipa,
	dropshipb,	
	TurrH,
	nav2,
	scap1,
	scap2,
	mcap1,
	mcap2,
	mcap3,
	mcap4,
	mcap5,
	mcap6,
	rhino1,
	rhino2,
	rhino3,
	rhino4,
	builder,
	leader,
	nearest_enemy,
	scion1,
	scion2,
	scion3,
	scion4,
	scion5,
	scion6,
	scion7,
	scion8,
	stop_guard1,
	stop_guard2,
	guard1,
	guard2,
	guard3,
	player_ship,
	guard4,
	sent1,
	sent2,
	sent3,
	sent4,
	war1,
	war2,
	war3,
	war4,
	lance1,
	lance2,
	lance3,
	lance4,
	scout1,
	scout2,
	scout3,
	scout4,
	maul1,
	maul2,
	maul3,
	maul4,
	transport,
	dead_tank1,
	dead_tank2,
	cheat_tank1,
	cheat_tank2,
	cheat_tank3,
	block_turret1,
	block_turret2,
	block_turret3,
	block_turret4,
	antenna,
	patroler1,
	patroler2,
	satch,
	patrol_sent1,
	patrol_sent2,
	crash_tank,
	crash_scout,
	open_drop,
	standin,
	holder1,
	holder2,
	holder3

}

function Save()
   return Mission
end

function Load(...)
   if select("#", ...) > 0 then
      Mission = ...
   end
end

function AddObject(h) --This function is called when an object appears in the game. --
   	if (not Mission.start_done) then
		return
	end 
	
	-- don't take over a vehicle if the player is in it
	if (h == GetPlayerHandle()) then
		return
	end 
	
	-- SCOUT
	if ((not Mission.scout1_a) and (IsOdf(h,"fvscout"))) then
		Mission.scout1 = h
		Mission.scout1_a = true
	
	
	elseif ((not Mission.scout2_a) and (IsOdf(h,"fvscout"))) then
		Mission.scout2 = h
		Mission.scout2_a = true
	
	
	elseif ((not Mission.scout3_a) and (IsOdf(h,"fvscout"))) then
		Mission.scout3 = h
		Mission.scout3_a = true
	
	
	elseif ((not Mission.scout4_a) and (IsOdf(h,"fvscout"))) then
		Mission.scout4 = h
		Mission.scout4_a = true
	

	-- SENTRY
	elseif ((not Mission.sent1_a) and (IsOdf(h,"fvsent"))) then
		Mission.sent1 = h
		Mission.sent1_attack_recy = false
		Mission.sent1_a = true
	
	
	elseif ((not Mission.sent2_a) and (IsOdf(h,"fvsent"))) then
		Mission.sent2 = h
		Mission.sent2_attack_recy = false
		Mission.sent2_a = true
	
	
	elseif ((not Mission.sent3_a) and (IsOdf(h,"fvsent"))) then
		Mission.sent3 = h
		Mission.sent3_a = true
	
	
	elseif ((not Mission.sent4_a) and (IsOdf(h,"fvsent"))) then
		Mission.sent4 = h
		Mission.sent4_a = true
	

	-- WARRIOR 
	elseif ((not Mission.war1_a) and (IsOdf(h,"fvtank"))) then
		Mission.war1 = h
		Mission.war1_attack_recy = false
		Mission.war1_a = true
	
	
	elseif ((not Mission.war2_a) and (IsOdf(h,"fvtank"))) then
		Mission.war2 = h
		Mission.war1_attack_recy = false
		Mission.war2_a = true
	
	
	elseif ((not Mission.war3_a) and (IsOdf(h,"fvtank"))) then
		Mission.war3 = h
		Mission.war3_a = true
	
	
	elseif ((not Mission.war4_a) and (IsOdf(h,"fvtank"))) then
		Mission.war4 = h
		Mission.war4_a = true
	

	-- LANCER
	elseif ((not Mission.lance1_a) and (IsOdf(h,"fvarch"))) then
		Mission.lance1 = h
		Mission.lance1_a = true
	
	
	elseif ((not Mission.lance2_a) and (IsOdf(h,"fvarch"))) then
		Mission.lance2 = h
		Mission.lance2_a = true
	
	
	elseif ((not Mission.lance3_a) and (IsOdf(h,"fvarch"))) then

		Mission.lance3 = h
		Mission.lance3_a = true
	
	
	elseif ((not Mission.lance4_a) and (IsOdf(h,"fvarch"))) then

		Mission.lance4 = h
		Mission.lance4_a = true
	
	
	-- MAULER
	elseif ((not Mission.maul1_a) and (IsOdf(h,"fvwalk"))) then
		Mission.maul1 = h
		Mission.maul1_attack_recy = false
		Mission.maul1_a = true
	
	
	elseif ((not Mission.maul2_a) and (IsOdf(h,"fvwalk"))) then
		Mission.maul2 = h
		Mission.maul2_attack_recy = false
		Mission.maul2_a = true
	
	
	elseif ((not Mission.maul3_a) and (IsOdf(h,"fvwalk"))) then
		Mission.maul3 = h
		Mission.maul3_a = true
	
	
	elseif ((not Mission.maul4_a) and (IsOdf(h,"fvwalk"))) then
		Mission.maul4 = h
		Mission.maul4_a = true
	

	-- first isdf scav
	elseif ((not Mission.first_scav) and (IsOdf(h,"ibscav"))) then
		Mission.first_scav = true
	

	-- satchel charge
	elseif ((not Mission.satch_alive) and (IsOdf(h,"satchel"))) then
		Mission.satch = h
		Mission.satch_alive = true
	
	end
end



function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function Start() --This function is called upon the first frame
SetAutoGroupUnits(false)
 
    --  handles
	Mission.player = GetPlayerHandle()
	Mission.recycler = GetHandle("recycler")
	Mission.srecycler = GetHandle("srecycler")
	Mission.wingman = GetHandle("wingman")
	Mission.sscav1 = GetHandle("sscav1")
	Mission.sscav2 = GetHandle("sscav2")
	Mission.sscav3 = GetHandle("sscav3")
	Mission.forge = GetHandle("forge")
	Mission.dower = GetHandle("dower")
	Mission.stronghold = GetHandle("stronghold")
	Mission.spire1 = GetHandle("spire1")
	Mission.spire2 = GetHandle("spire2")
	Mission.spire3 = GetHandle("spire3")
	Mission.guard3 = GetHandle("guard3")
	Mission.player_ship = GetHandle("player_ship")
	Mission.crash_tank = GetHandle("crash_tank")
	Mission.crash_scout = GetHandle("crash_scout")
	Mission.open_drop = GetHandle("open_drop")
	Mission.standin = GetHandle("standin")
 	Mission.block_turret1 = GetHandle("block_turret1")
	Mission.block_turret2 = GetHandle("block_turret2")
	Mission.block_turret3 = GetHandle("block_turret3")
	Mission.block_turret4 = GetHandle("block_turret4")
	Mission.antenna = GetHandle("antenna") 
	Mission.transport = GetHandle("transport")
	Mission.dead_tank1 = GetHandle("dead_tank1")
	Mission.dead_tank2 = GetHandle("dead_tank2")
	Mission.stop_guard1 = GetHandle("stop_guard1")
	Mission.stop_guard2 = GetHandle("stop_guard2")	
	Mission.scion1 = GetHandle("scion1")
	Mission.scion2 = GetHandle("scion2")
	Mission.scion3 = GetHandle("scion3")
	Mission.scion4 = GetHandle("scion4")
	Mission.scap1 = GetHandle("scap1")
	Mission.scap2 = GetHandle("scap2")
	Mission.mcap1 = GetHandle("mcap1")
	Mission.mcap2 = GetHandle("mcap2")
	Mission.mcap3 = GetHandle("mcap03")
	Mission.mcap4 = GetHandle("mcap4")
	Mission.mcap5 = GetHandle("mcap5")
	Mission.mcap6 = GetHandle("mcap6")
	Mission.crash_ship1 = GetHandle("crash_ship1")
	Mission.crash_ship2 = GetHandle("crash_ship2")
	Mission.nav1 = GetHandle("nav1")
	Mission.dropship = GetHandle("dropship")
	Mission.builder = GetHandle("builder")
	
	PreloadODF("bcrhino")
	PreloadODF("ivrecy10a")
	
	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	GiveWeapon(Mission.player,"gchainvsr_c")
	GiveWeapon(Mission.player,"gshadowvsr_c")
	GiveWeapon(Mission.player,"gproxminvsr")
	
	Mission.wingman = UnitToVSR(Mission.wingman, "ivscout_vsr", 0)
	Stop(Mission.wingman, 0)
	SetGroup(Mission.wingman,0)
	
	Mission.forge = UnitToVSR(Mission.forge, "fbforg_vsr", 0)
	Mission.srecycler = UnitToVSR(Mission.srecycler, "fbrecy_vsr", 0)



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



function Update() --This function runs on every frame.
	Mission.TurnCounter = Mission.TurnCounter + 1

	missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

	Mission.player = GetPlayerHandle()

	-- this is the opening code

	if (not Mission.hold_stuff) then
		RemoveObject(Mission.dead_tank1)

		SetColorFade(1,0.5,Make_RGBA(0, 0, 0, 255))

		StartEarthQuake(5.0)

		Defend(Mission.block_turret1)
		Defend(Mission.block_turret2)
		Defend(Mission.block_turret3)
		Defend(Mission.block_turret4)

		LookAt(Mission.standin,Mission.wingman)

		Build(Mission.builder,"fbantm1")

		SetObjectiveOn(Mission.nav1)
		tempstr = TranslateString("Mission1001")  -- Drop Zone

		SetObjectiveName(Mission.nav1,tempstr)
		SetObjectiveOff(Mission.nav1)
		
		Ally(3,1)
		Ally(1,3)

		LookAt(Mission.wingman,Mission.player)
		Stop(Mission.crash_tank)
		Stop(Mission.crash_scout)
		Mission.holder1 = BuildObject("stayput",0,Mission.player)
		Mission.holder2 = BuildObject("stayput",0,Mission.crash_tank)
		Mission.holder3 = BuildObject("stayput",0,Mission.crash_scout)
		Mission.talk_time = GetTime() + 2.0
		Mission.hold_stuff = true

	end

	if ((not Mission.first_talk) and (Mission.talk_time < GetTime())) then
		Mission.talk = AudioMessage("isdf1030.wav")
		Mission.talk_time = GetTime() + 99999.9
		Mission.first_talk = true
	end

	if ((not Mission.second_talk) and (Mission.first_talk) and (IsAudioMessageDone(Mission.talk))) then
		Mission.talk = AudioMessage("isdf1031.wav")
		Mission.swap_time = GetTime() + 10.0
		Mission.second_talk = true
	end

	if ((not Mission.boom) and (Mission.second_talk) and (Mission.swap_time < GetTime())) then
		StartSoundEffect("xemt2.wav")
		Mission.swap_time = GetTime() + 3.0
		Mission.sound_time = GetTime() + 1.0
		UpdateEarthQuake(40.0)
		Mission.boom = true
	end

	if ((not Mission.fall_sound) and (Mission.boom) and (Mission.sound_time < GetTime())) then
		Mission.sound_time = GetTime() + 99999.9
		StartSoundEffect("dropfall.wav")
		Mission.fall_sound = true
	end

	if ((not Mission.last_talk) and (Mission.boom) and (Mission.swap_time < GetTime())) then
		--StartSoundEffect("dropfall.wav")
		Mission.talk = AudioMessage("isdf1032.wav")
		Mission.swap_time = GetTime() + 10.0
		Mission.last_talk = true
	end


	if ((not Mission.black) and (Mission.last_talk) and (Mission.swap_time < GetTime())) then
		Mission.swap_time = GetTime() + 0.2
		StartSoundEffect("dropcrsh.wav")
		SetColorFade(4,0.2,Make_RGBA(0, 0, 0, 255))
		Mission.black = true
	end

	if (not Mission.free_player) then
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


	if ((not Mission.big_switch) and (Mission.black) and (Mission.swap_time < GetTime())) then
		StartSoundEffect("xms2.wav")
		pos = GetPosition(Mission.standin)
		RemoveObject(Mission.standin)
		SetPosition(Mission.player,pos)
		RemoveObject(Mission.open_drop)
		RemoveObject(Mission.crash_tank)
		RemoveObject(Mission.crash_scout)
		RemoveObject(Mission.holder1)
		RemoveObject(Mission.holder2)
		RemoveObject(Mission.holder3)
		Mission.swap_time = GetTime() + 7.0
		StopEarthQuake()
		Mission.big_switch = true
	end


	if ((not Mission.free_player) and (Mission.big_switch) and (Mission.swap_time < GetTime())) then
		Mission.swap_time = GetTime() + 999999.9
		--controls = {}
		--controls.fire = true
		--SetControls(Mission.player, controls)
		Mission.free_player = true
	end

----------------------------------------------------------------
if (Mission.ON_HOLD) then
	if (not Mission.start_done) then
		Mission.in_air = true
		Mission.land_time = GetTime() + 20.0
		Mission.start_done = true
	end
end

if (not Mission.ON_HOLD) then

----------------------------------------------------------------


	if ((Mission.scout1_a) and (not IsAlive(Mission.scout1))) then
	
		Mission.scout1_a = false
	end
	if ((Mission.scout2_a) and (not IsAlive(Mission.scout2))) then
	
		Mission.scout2_a = false
	end
	if ((Mission.scout3_a) and (not IsAlive(Mission.scout3))) then
	
		Mission.scout3_a = false
	end
	if ((Mission.scout4_a) and (not IsAlive(Mission.scout4))) then
	
		Mission.scout4_a = false
	end
	----------------------------------------
	if ((Mission.guard1_a) and (not IsAlive(Mission.guard1))) then
	
		Mission.guard1_to_post = false
		Mission.guard1_a = false
	end
	if ((Mission.guard2_a) and (not IsAlive(Mission.guard2))) then
	
		Mission.guard2_to_post = false
		Mission.guard2_a = false
	end
	if ((Mission.guard3_a) and (not IsAlive(Mission.guard3))) then
	
		Mission.guard3_a = false
	end
	if ((Mission.guard4_a) and (not IsAlive(Mission.guard4))) then
	
		Mission.guard4_a = false
	end
	----------------------------------------	
	if ((Mission.sent1_a) and (not IsAlive(Mission.sent1))) then
	
		Mission.sent1_a = false
	end
	if ((Mission.sent2_a) and (not IsAlive(Mission.sent2))) then
	
		Mission.sent2_a = false
	end
	if ((Mission.sent3_a) and (not IsAlive(Mission.sent3))) then
	
		Mission.sent3_a = false
	end
	if ((Mission.sent4_a) and (not IsAlive(Mission.sent4))) then
	
		Mission.second_patrol2 = false
		Mission.sent4_a = false
	end
	----------------------------------------
	if ((Mission.war1_a) and (not IsAlive(Mission.war1))) then
	
		Mission.war1_a = false
	end
	if ((Mission.war2_a) and (not IsAlive(Mission.war2))) then
	
		Mission.war2_a = false
	end
	if ((Mission.war3_a) and (not IsAlive(Mission.war3))) then
	
		Mission.war3_a = false
	end
	if ((Mission.war4_a) and (not IsAlive(Mission.war4))) then
	
		Mission.war4_a = false
	end
	----------------------------------------
	if ((Mission.lance1_a) and (not IsAlive(Mission.lance1))) then
	
		Mission.lance1_a = false
	end
	if ((Mission.lance2_a) and (not IsAlive(Mission.lance2))) then
	
		Mission.lance2_a = false
	end
	if ((Mission.lance3_a) and (not IsAlive(Mission.lance3))) then
	
		Mission.lance3_a = false
	end
	if ((Mission.lance4_a) and (not IsAlive(Mission.lance4))) then
	
		Mission.lance4_a = false
	end
	----------------------------------------
	if ((Mission.maul1_a) and (not IsAlive(Mission.maul1))) then
	
		Mission.maul1_a = false
	end
	if ((Mission.maul2_a) and (not IsAlive(Mission.maul2))) then
	
		Mission.maul2_a = false
	end
	if ((Mission.maul3_a) and (not IsAlive(Mission.maul3))) then
	
		Mission.maul3_a = false
	end
	if ((Mission.maul4_a) and (not IsAlive(Mission.maul4))) then
	
		Mission.maul4_a = false
	end
	----------------------------------------


	-- this is the second patrol code

	if ((Mission.second_patrol1) and (not IsAlive(Mission.patrol_sent1)) and (not IsAlive(Mission.patrol_sent2))) then
	
		Mission.patrol_time = GetTime() + 120.0
		Mission.second_patrol1 = false
	end
	----------------------------------------


	-- this is the turret code
	
	if ((not Mission.stop_guard1_dead) and (not IsAlive(Mission.stop_guard1))) then
	
		Mission.stop_guard1 = BuildObject("fvturr_vsr",2,"new_turr1")  -- QA complained that these respawn
		Goto(Mission.stop_guard1,"sspawn1")
		Mission.guard1_time = GetTime() + 25.0
		Mission.stop_guard1_dead = true
	end

	if ((Mission.guard1_time < GetTime()) and (not Mission.guard1_to_post)) then
	
		Mission.guard1_time = GetTime() + 999999.9
		Mission.guard1_to_post = true
	end

	if (Mission.stop_guard1_dead) then
	
		if (Mission.guard1_to_post) then
		
			Goto(Mission.stop_guard1,"guard_point1")
			Mission.guard1_to_post = false
			Mission.stop_guard1_dead = false
		end
	end


	if ((not Mission.stop_guard2_dead) and (not IsAlive(Mission.stop_guard2))) then
	
		Mission.stop_guard2 = BuildObject("fvturr_vsr",2,"new_turr2")
		Goto(Mission.stop_guard2,"sspawn1")
		Mission.guard2_time = GetTime() + 25.0
		Mission.stop_guard2_dead = true
	end

	if ((Mission.guard2_time < GetTime()) and (not Mission.guard2_to_post)) then
	
		Mission.guard2_time = GetTime() + 999999.9
		Mission.guard2_to_post = true
	end

	if (Mission.stop_guard2_dead) then
	
		if (Mission.guard2_to_post) then
		
			Goto(Mission.stop_guard2,"guard_point2")
			Mission.guard2_to_post = false
			Mission.stop_guard2_dead = false
		end
	end
	--------------------------------------------


	-- this is the satchel charge code

	if (Mission.satch_alive) then
	
		if ((not Mission.ship1_bomb) and (IsAround(Mission.crash_ship1))) then
		
			if (GetDistance(Mission.satch,Mission.crash_ship1) < 60.0) then
			
				Mission.ship1_bomb = true
			end
		end

		if ((not Mission.ship2_bomb) and (IsAround(Mission.crash_ship2))) then
		
			if (GetDistance(Mission.satch,Mission.crash_ship2) < 60.0) then
			
				Mission.ship2_bomb = true
			end
		end

		if (not IsAround(Mission.satch)) then
		
			if ((Mission.ship1_bomb) and (IsAround(Mission.crash_ship1))) then
			
				if (IsAround(Mission.dead_tank1)) then
				
					RemoveObject(Mission.dead_tank1)
				end
				if (IsAround(Mission.dead_tank2)) then
				
					RemoveObject(Mission.dead_tank2)
				end

				Damage(Mission.crash_ship1,5000)
			end

			if ((Mission.ship2_bomb) and (IsAround(Mission.crash_ship2))) then
			
				Damage(Mission.crash_ship2,5000)
			end

			Mission.satch_alive = false
		end
	end


-- start of the mission

	if ((not Mission.part_two) and (not Mission.ON_HOLD)) then


		if ((not Mission.start_done) and (Mission.big_switch)) then
		
			Mission.rhino1 = BuildObject("bcrhino",2,"rhino1_point")
			Mission.rhino2 = BuildObject("bcrhino",2,"rhino2_point")
			Mission.rhino3 = BuildObject("bcrhino",2,"rhino3_point")
			Mission.rhino4 = BuildObject("bcrhino",2,"rhino4_point")

			SetPerceivedTeam(Mission.rhino1,1)
			SetPerceivedTeam(Mission.rhino2,1)
			SetPerceivedTeam(Mission.rhino3,1)
			SetPerceivedTeam(Mission.rhino4,1)
			--SetAvoidType(rhino1,0)
			--SetAvoidType(rhino2,0)
			--SetAvoidType(rhino3,0)
			--SetAvoidType(rhino4,0)

			SetAIP("isdf1001.aip",2)

			Mission.rhino1_check = GetTime() + 1.0
			Mission.rhino2_check = GetTime() + 1.0
			Mission.rhino3_check = GetTime() + 1.0
			Mission.rhino4_check = GetTime() + 1.0
			
			Mission.wing_check = GetTime() + 1.0
			Mission.detect_check = GetTime() + 2.0
			--patrol1_time = GetTime() + 1.0
			Mission.forget_check = GetTime() + 2.0
			
			Mission.start_done = true
		end


		-- this is freeing the recycler when the player gets close enough

		if (not Mission.free_recycler) then
		
			Stop(Mission.recycler,1)
			Stop(Mission.transport,1)
		end


		if ((not Mission.free_recycler) and (Mission.recy_check < GetTime())) then
		
			Mission.recy_check = GetTime() + 1.0


			if (GetDistance(Mission.player,Mission.recycler) < 150.0) then
			
				Stop(Mission.recycler,0)
				Follow(Mission.transport,Mission.recycler,1)
				SetObjectiveOff(Mission.recycler)
				AddScrap(1,40)
				SetAvoidType(Mission.recycler,0)
				Mission.maze_check = GetTime() + 2.0
				Mission.recy_death_check = GetTime() + 2.0
				Mission.free_recycler = true
				
				SetObjectiveName(Mission.recycler, "Recycler")
				SetObjectiveName(Mission.transport, "Transport")

				OldPos = GetPosition2(Mission.recycler)
				Where = GetPositionNear(OldPos,Mission.AllyMinRadiusAway,Mission.AllyMaxRadiusAway)

				Mission.TurrH = BuildObject("ivturr",1,Where)
				SetGroup(Mission.TurrH,2)
				SetSkill(Mission.TurrH, 2)
			end
		end
		--------------------------------------------


		-- this is starting the first patrol

		if ((not Mission.start_patrol1) and (Mission.patrol1_time < GetTime())) then
		
			Patrol(Mission.scion1,"patrol_path1a")
			Follow(Mission.scion2,Mission.scion1)
			Mission.discover1_time = GetTime() + 2.0
			Mission.patrol1_time = GetTime() + 999999.9
			Mission.patrol2_time = GetTime() + 60.0
			Mission.start_patrol1 = true
		end
		--------------------------------------------


		-- this is starting the second patrol

		if ((not Mission.start_patrol2) and (Mission.patrol2_time < GetTime())) then
		
			if (IsAlive(Mission.scion3)) then
			
				Patrol(Mission.scion3,"patrol_path1a")
			end

			if (IsAlive(Mission.scion4)) then
			
				Follow(Mission.scion4,Mission.scion3)
			end

			Mission.patrol2_time = GetTime() + 999999.9
			Mission.start_patrol2 = true
		end
		--------------------------------------------


		-- this sends the scion scouts after the player

		if (not Mission.cover_tracks_message) then
		
			if ((not Mission.discover1) and (Mission.discover1_time < GetTime())) then
			
				Mission.discover1_time = GetTime() + 2.0

				if ((IsAlive(Mission.scion1)) and (GetDistance(Mission.scion1,"wingman_point") < 60.0)) then
				
					Goto(Mission.scion1,Mission.recycler)
					Mission.discover1 = true
				end
			end

			if ((not Mission.discover2) and (Mission.discover2_time < GetTime())) then
			
				Mission.discover2_time = GetTime() + 2.0

				if ((IsAlive(Mission.scion3)) and (GetDistance(Mission.scion3,"wingman_point") < 60.0)) then
				
					Goto(Mission.scion3,Mission.recycler)
					Mission.discover2 = true
				end
			end
		end
		--------------------------------------------


		-- this will keep the patrols going

		if (Mission.start_patrol1) then
		
			if ((not Mission.patrol1_dead) and (not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2))) then
			
				Mission.patrol1_time = GetTime() + 60.0
				Mission.discover1_time = GetTime() + 999999.9
				Mission.discover1 = false
				Mission.patrol1_dead = true
			end

			if ((Mission.patrol1_dead) and (Mission.patrol1_time < GetTime())) then
			
				Mission.scion1 = BuildObject("fvsent_vsr",2,"sspawn1")
				Mission.scion2 = BuildObject("fvsent_vsr",2,"sspawn2")
				Patrol(Mission.scion1,"patrol_path1a")
				Follow(Mission.sent2,Mission.scion1)
				Mission.discover1_time = GetTime() + 2.0
				Mission.patrol1_time = GetTime() + 999999.9
				Mission.patrol1_dead = false
			end
		end
	 
		if (Mission.start_patrol2) then
		
			if ((not Mission.patrol2_dead) and (not IsAlive(Mission.scion3)) and (not IsAlive(Mission.scion4))) then
			
				Mission.patrol2_time = GetTime() + 60.0
				Mission.discover2_time = GetTime() + 999999.9
				Mission.discover2 = false
				Mission.patrol2_dead = true
			end


			if ((Mission.patrol2_dead) and (Mission.patrol1_time < GetTime())) then
			
				Mission.scion3 = BuildObject("fvsent_vsr",2,"sspawn3")
				Mission.scion4 = BuildObject("fvsent_vsr",2,"sspawn4")
				Patrol(Mission.scion3,"patrol_path1a")
				Follow(Mission.scion4,Mission.scion3)
				Mission.discover2_time = GetTime() + 2.0
				Mission.patrol2_time = GetTime() + 999999.9
				Mission.patrol2_dead = false
			end
		end
		--------------------------------------------
		

		


		-- this is getting the wingman to leave the crashed ship and look at it

		if (not Mission.wing_move) then
		
			--Goto(wingman,"wingman_point",0)
			--wing_turn_time = GetTime() + 3.0
			Mission.wing_move = true
		end


		if ((not Mission.wing_turn) and (Mission.big_switch) and (GetDistance(Mission.player,Mission.wingman) < 45.0)) then
			

			Mission.talk = AudioMessage("isdf1001.wav")-- (wingman) What do we do?! We're abandoned!
			SetObjectiveOn(Mission.nav1)
			tempstr = TranslateString("Mission1001")  -- Drop Zone
			SetObjectiveName(Mission.nav1,tempstr)
			LookAt(Mission.wingman,Mission.player,0)
			Mission.wing_turn_time = GetTime() + 18.0
			Mission.wing_turn = true
		end


		if ((not Mission.wing_free) and (Mission.wing_turn) and (Mission.wing_turn_time < GetTime())) then
		
			--Stop(wingman,0)
			ClearObjectives()
			AddObjective("nav1.otf", "WHITE")
			Mission.wing_free = true
		end
		--------------------------------------------


		if (IsAlive(Mission.wingman)) then
		--PrintConsoleMessage("test1")
			-- this is the wingman hinting at destroying the crash ship code

			if ((IsAround(Mission.crash_ship1)) and (not Mission.destroy_hint)) then
			--PrintConsoleMessage("test2")
				-- player orders wing to FOLLOW

				if (GetCurrentCommand(Mission.wingman) == 5) then --5=CMD_FOLLOW
					Mission.leader = GetCurrentWho(Mission.wingman)


					if (Mission.leader == Mission.player) then
					
						if (not Mission.wing_free) then
						
							ClearObjectives()
							AddObjective("nav1.otf", "WHITE")
							Mission.wing_free = true
						end

						StopAudioMessage(Mission.talk)
						AudioMessage("isdf1002.wav")--(wingman) What do you think we should do about that crashed ship? Its a dead give-away 
						Mission.patrol1_time = GetTime() + 60.0
						Mission.destroy_hint = true
					end
				end



			end
			--------------------------------------------


			-- this is if the player destoys the crash ship

			if ((not IsAround(Mission.crash_ship1)) and (not Mission.cover_tracks_message)) then
			
				if (not Mission.free_recycler) then
				
					AudioMessage("isdf1004.wav")--(wingman) that ought to cover our tracks for a while
				end

				Mission.cover_tracks_message = true
			end
			--------------------------------------------


			-- this is the wingman detecting the reycler

			if ((not Mission.free_recycler) and (not Mission.recy_detected_message) and (Mission.detect_check < GetTime())) then
			
				Mission.detect_check = GetTime() + 2.0


				if (GetDistance(Mission.wingman,Mission.recycler) < 450.0) then
				
					AudioMessage("isdf1005.wav")--(wingman) I've got a big "GREEN" radar hit 400 meters to the west commander - might be Rosas's squad
					SetObjectiveOn(Mission.recycler)
					tempstr = TranslateString("Mission1002")  -- Radar Contact
					SetObjectiveName(Mission.recycler,tempstr)
					Mission.recy_detected_message = true
				end
			end
			--------------------------------------------
		end

		-- this is the ice caps code

		if (not Mission.caps_gone) then
		
			if (not IsAround(Mission.scap1)) then
			
				Mission.scap1_gone = true
			end
			if (not IsAround(Mission.scap2)) then
			
				Mission.scap2_gone = true
			end
			
			if (not IsAround(Mission.mcap1)) then
			
				Mission.mcap1_gone = true
			end
			if (not IsAround(Mission.mcap2)) then
			
				Mission.mcap2_gone = true
			end
			if (not IsAround(Mission.mcap3)) then
			
				Mission.mcap3_gone = true
			end
			if (not IsAround(Mission.mcap4)) then
			
				Mission.mcap4_gone = true
			end
			if (not IsAround(Mission.mcap5)) then
			
				Mission.mcap5_gone = true
			end
			if (not IsAround(Mission.mcap6)) then
			
				Mission.mcap6_gone = true
			end

			if ((Mission.mcap2_gone) and (Mission.mcap3_gone) and (Mission.mcap5_gone)) then
			
				Mission.caps_gone = true
			end
		end
		--------------------------------------------
		
		
		if (Mission.free_recycler) then
		
			-- the recycler's first message

			if (not Mission.recycler_message1) then
			
				if (Mission.caps_gone) then
				
					AudioMessage("isdf1006.wav")-- (recycler) You've cleared" the caps - get me out of here
					ClearObjectives()
					AddObjective("nav1.otf", "WHITE")
					AddObjective("recycler.otf", "WHITE")
					Goto(Mission.recycler,"safe_path",0)
					Mission.recycler_underway = true
				
				else
				
					AudioMessage("isdf1007.wav")-- (recycler) My radar is out - help me out of here
					ClearObjectives()
					AddObjective("nav1.otf", "WHITE")
					AddObjective("recycler.otf", "WHITE")
					Mission.free_first = true
				end

				Mission.recycler_message1 = true
			end
			--------------------------------------------


			-- this is checking to see where the recycler is on the maze

			if (Mission.maze_check < GetTime()) then
			
				Mission.maze_check = GetTime() + 2.0

				-- check to see where the recycler is at on the maze

				if ((not Mission.at_one) and (GetDistance(Mission.recycler,"maze_point1") < 50.0)) then
				
					Mission.cheat2_time = GetTime() + 10.0
					Mission.at_one = true
					Mission.recycler_underway = true
				end


				if ((not Mission.at_two)) then

					if ((Mission.at_one) and (not Mission.at_two)) then

				
						if  (GetDistance(Mission.recycler,"maze_point2") < 50.0) then
						
							Mission.at_one = true
							Mission.at_two = true
							Mission.recycler_underway = true
						end
					end
				end
				

				if ((not Mission.at_three)) then

					if ((Mission.at_two) and (not Mission.at_three)) then

					
						if  (GetDistance(Mission.recycler,"maze_point3") < 50.0) then
						
							Mission.at_one = true
							Mission.at_two = true
							Mission.at_three = true
							Mission.recycler_underway = true

						end
					end
				end


				if ((not Mission.at_four)) then

					if ((Mission.at_three) and (not Mission.at_four)) then

					
						if  (GetDistance(Mission.recycler,"maze_point4") < 50.0) then
						
							Mission.at_one = true
							Mission.at_two = true
							Mission.at_three = true
							Mission.at_four = true
							Mission.recycler_underway = true
						end
					end
				end
				--------------------------------------------/



				if ((not Mission.near_madeit)) then

					if ((Mission.at_four) and (not Mission.near_madeit)) then

					
						if  (GetDistance(Mission.recycler,"madeit_point") < 100.0) then
						
							Mission.at_one = true
							Mission.at_two = true
							Mission.at_three = true
							Mission.at_four = true
							Mission.near_madeit = true
							Mission.recycler_underway = true
						end
					end
				end


				if ((not Mission.at_madeit)) then

					if ((Mission.near_madeit) and (not Mission.at_madeit)) then

					
						if  (GetDistance(Mission.recycler,"madeit_point") < 50.0) then
						
							Mission.at_one = true
							Mission.at_two = true
							Mission.at_three = true
							Mission.at_four = true
							Mission.near_madeit = true
							Mission.at_madeit = true
							Mission.recycler_underway = true
						end
					end
				end


				if ((Mission.recycler_message1) and (not Mission.at_nav)) then
				
					if  (GetDistance(Mission.recycler,Mission.nav1) < 70.0) then
					
						ClearObjectives()
						AddObjective("nav1.otf", "GREEN")
						AddObjective("recycler.otf", "GREEN")
						Mission.new_plan_time = GetTime() + 5
						--SetPlan("isdf1002.aip",2)

						if (IsAlive(Mission.transport)) then
						
							Stop(Mission.transport,0)
							SetBestGroup(Mission.transport)
						end

						Mission.patrol_time = GetTime() + 120.0
						Mission.part_two = true	
						Mission.at_nav = true
					end
				end
			end
			--------------------------------------------


			-- this is if I script the recycle to the "madeit_point"

			if ((Mission.recycler_underway) and (not Mission.underway_canceled) and (not Mission.madeit_message)) then
			
				if ((IsSelected(Mission.recycler)) and (not Mission.whyselected_message)) then
				
					AudioMessage("isdf1008.wav")--(recycler) I'm trying to navigate my way out of here - do you want me to do something else?!
					Mission.whyselected_message = true
				end


				if ((Mission.at_madeit) and (not Mission.madeit_message)) then
				
					Stop(Mission.recycler,0)
					AudioMessage("isdf1009.wav")--(recycler) I'm through commander - take me to the landing site
					Mission.madeit_message = true
				end


				if ((Mission.whyselected_message) and (not Mission.madeit_message)) then
				
					if ((not Mission.underway_canceled) and (GetCurrentCommand(Mission.recycler) ~= 3)) then
					
						AudioMessage("isdf1010.wav")--(recycler) You've got to get me to the drop site commander
						Mission.underway_canceled = true
					end
				end
			end
			--------------------------------------------
			
			
			-- this is checking to see when enouph caps are gone for the recycler to make it

			if (Mission.free_first) then
			
				if (not Mission.caps_gone_message) then
				
					if ((not Mission.at_one) and (Mission.caps_gone)) then
					
						AudioMessage("isdf1011.wav")-- (recycler) I have a pretty good line of sight to the nav - you can order me there
						Goto(Mission.recycler,"safe_path",0)
						Mission.recycler_underway = true
						Mission.caps_gone_message = true
					end


					if ((Mission.at_one) and (not Mission.at_two)) then
					
						if ((Mission.mcap3_gone) and (Mission.mcap4_gone) and (Mission.mcap5_gone)) then
						
							AudioMessage("isdf1011.wav")-- (recycler) I have a pretty good line of sight to the nav - you can order me there
							Goto(Mission.recycler,"safe_path1",0)
							Mission.recycler_underway = true
							Mission.caps_gone_message = true
						end
					end


					if ((Mission.at_two) and (not Mission.at_three)) then
					
						if ((Mission.mcap3_gone) and (Mission.mcap5_gone)) then
						
							AudioMessage("isdf1011.wav")-- (recycler) I have a pretty good line of sight to the nav - you can order me there
							Goto(Mission.recycler,"safe_path2",0)
							Mission.recycler_underway = true
							Mission.caps_gone_message = true
						end
					end


					if ((Mission.at_three) and (not Mission.at_four)) then
					
						if ((Mission.mcap5_gone)) then
						
							AudioMessage("isdf1011.wav")-- (recycler) I have a pretty good line of sight to the nav - you can order me there
							Goto(Mission.recycler,"safe_path3",0)
							Mission.recycler_underway = true
							Mission.caps_gone_message = true
						end
					end

					
					if ((Mission.at_four) and (not Mission.at_madeit)) then
					
						if ((Mission.mcap5_gone)) then
						
							AudioMessage("isdf1011.wav")-- (recycler) I have a pretty good line of sight to the nav - you can order me there
							Goto(Mission.recycler,"safe_path4",0)
							Mission.recycler_underway = true
							Mission.caps_gone_message = true
						end
					end


					if (Mission.at_madeit) then
					
						Mission.caps_gone_message = true
					end
				end
			end
			--------------------------------------------
		end


		-- this is creating cheat ships

		if (not Mission.drop_message1) then
		
			if ((not Mission.cheat2) and (Mission.at_one) and (Mission.cheat2_time < GetTime())) then
			
				Mission.cheat2_time = GetTime() + 180.0
				Mission.cheat_tank1 = BuildObject("fvtank_vsr",2,"cheat_spawn4")
				Mission.cheat_tank2 = BuildObject("fvsent_vsr",2,"cheat_spawn5")
				Attack(Mission.cheat_tank1,Mission.recycler)
				Follow(Mission.cheat_tank2,Mission.cheat_tank1)
				Mission.cheat2 = true
			end

			if (Mission.cheat2) then
			
				if ((not IsAlive(Mission.cheat_tank1)) and (not IsAlive(Mission.cheat_tank2))) then
				
					Mission.cheat2 = false
				end
			end
		end
		--------------------------------------------


		-- this is the player finding the enemy base code

		if (not Mission.base_message) then
		
			if (Mission.forget_check < GetTime()) then
			
				Mission.forget_check = GetTime() + 2.0

				if (GetDistance(Mission.player,"choke_point1") < 100.0) then
				
					Mission.forget_check = GetTime() + 999999.9
					Mission.base_message = true
				end

				if ((GetDistance(Mission.player,Mission.sscav2) < 140.0) or (GetDistance(Mission.player,"antenna_point") < 140.0)) then
				
					if (IsAlive(Mission.wingman)) then
					
						AudioMessage("isdf1033.wav") -- (wingman) This looks like the scion base!
					end

					if (IsAlive(Mission.builder)) then
					
						Dropoff(Mission.builder,"antenna_point",2)
					end

					Mission.forget_check = GetTime() + 999999.9
					Mission.base_message = true
				end
			end
		end
		--------------------------------------------
	end



	if (not Mission.ON_HOLD) then

		-- this is checking to see if the RECYCLER falls into the ice caps

		if ((Mission.free_first) and (IsAround(Mission.recycler))) then
		
			if ((not Mission.recy_fall_in) and (Mission.recy_death_check < GetTime())) then
			
				Mission.recy_death_check = GetTime() + 1.0


				if (IsAround(Mission.mcap1)) then
				
					if (GetDistance(Mission.recycler,"mcap1_point") < 60.0) then
					
						SetAnimation(Mission.mcap1,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 5.0
						Mission.mcap1_start = true
						Mission.recy_fall_in = true
					end
				end

				if (IsAround(Mission.mcap2)) then
				
					if ((GetDistance(Mission.recycler,"mcap2_pointa") < 60.0) or 
						(GetDistance(Mission.recycler,"mcap2_pointb") < 60.0)) then
					
						SetAnimation(Mission.mcap2,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 5.0
						Mission.mcap2_start = true
						Mission.recy_fall_in = true
					end
				end

				if (IsAround(Mission.mcap3)) then
				
					if (GetDistance(Mission.recycler,"mcap3_point") < 60.0) then
					
						SetAnimation(Mission.mcap3,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 5.0
						Mission.mcap3_start = true
						Mission.recy_fall_in = true
					end
				end

				if (IsAround(Mission.mcap4)) then
				
					if ((GetDistance(Mission.recycler,"mcap4_pointa") < 60.0) or 
						(GetDistance(Mission.recycler,"mcap4_pointb") < 60.0)) then
					
						SetAnimation(Mission.mcap4,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 5.0
						Mission.mcap4_start = true
						Mission.recy_fall_in = true
					end
				end

				if (IsAround(Mission.mcap5)) then
				
					if ((GetDistance(Mission.recycler,"mcap5_pointa") < 60.0) or 
						(GetDistance(Mission.recycler,"mcap5_pointb") < 60.0)) then
					
						SetAnimation(Mission.mcap5,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 5.0
						Mission.mcap5_start = true
						Mission.recy_fall_in = true
					end
				end

				if (IsAround(Mission.mcap6)) then
				
					if ((GetDistance(Mission.recycler,"mcap6_pointa") < 60.0) or 
						(GetDistance(Mission.recycler,"mcap6_pointb") < 60.0)) then
					
						SetAnimation(mcap6,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 5.0
						Mission.mcap6_start = true
						Mission.recy_fall_in = true
					end
				end

				if (GetDistance(Mission.recycler,"short_cut") < 60.0) then
				
					if (IsAround(Mission.mcap2)) then
					
						SetAnimation(mcap2,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.mcap2_start = true
					end

					if (IsAround(Mission.mcap3)) then
					
						SetAnimation(mcap3,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.mcap3_start = true
					end

					Mission.anim_wait = GetTime() + 5.0
					Mission.recy_fall_in = true
				end
			end
		end
		--------------------------------------------


		-- this is checking to see if one of the rhinos is shot.

		if ((IsAlive(Mission.rhino1)) and (not Mission.rhino1_charge)) then
		
			if (GetTime() - GetLastEnemyShot(Mission.rhino1) < .2) then --(GetWhoShotMe(rhino1) == player)
			
				StartSoundEffect("rhin08.wav",Mission.rhino1)
				Attack(Mission.rhino1,Mission.player,1)
				Mission.rhino1_charge = true
			end
			
			-- this keeps rhino 1 near his spawn point

			if (Mission.rhino1_check < GetTime()) then
			
				Mission.rhino1_check = GetTime() + 1.0
				
				if (not Mission.rhino1_behave) then
				
					if (GetDistance(Mission.rhino1,"rhino1_point") > 50.0) then
					
						Goto(Mission.rhino1,"rhino1_point",1)
						Mission.rhino1_check = GetTime() + 1.0
						Mission.rhino1_behave = true
					end
				
				else
				
					if (GetDistance(Mission.rhino1,"rhino1_point") < 30.0) then
					
						Mission.rhino1_behave = false
					end
				end
			end
		end

		if ((IsAlive(Mission.rhino2)) and (not Mission.rhino2_charge)) then
		
			if (GetTime() - GetLastEnemyShot(Mission.rhino2) < .2) then --(GetWhoShotMe(rhino1) == player)
			
				StartSoundEffect("rhin08.wav",Mission.rhino2)
				Attack(Mission.rhino2,Mission.player,1)
				Mission.rhino2_charge = true
			
			
			-- this keeps rhino 2 near his spawn point

			elseif (Mission.rhino2_check < GetTime()) then
			
				Mission.rhino2_check = GetTime() + 1.0

				if (not Mission.rhino2_after_recy) then
				
					if (Mission.at_two) then
					
						Attack(Mission.rhino2,Mission.recycler)
						Mission.rhino2_after_recy = true
					end
				end

				if (not Mission.rhino2_behave) then
				
					if (GetDistance(Mission.rhino2,"rhino2_point") > 50.0) then
					
						Goto(Mission.rhino2,"rhino2_point",1)
						Mission.rhino2_check = GetTime() + 1.0
						Mission.rhino2_behave = true
					end
				
				else
				
					if (GetDistance(Mission.rhino2,"rhino2_point") < 30.0) then
					
						Mission.rhino2_behave = false
					end
				end
			end
		end

		if ((IsAlive(Mission.rhino3)) and (not Mission.rhino3_charge)) then
		
			if (GetTime() - GetLastEnemyShot(Mission.rhino3) < .2)  then --(GetWhoShotMe(rhino1) == player)
			
				StartSoundEffect("rhin08.wav",Mission.rhino3)
				Attack(Mission.rhino3,Mission.player,1)
				Mission.rhino3_charge = true
			
			-- this keeps rhino 3 near his spawn point

			elseif (Mission.rhino3_check < GetTime()) then
			
				Mission.rhino3_check = GetTime() + 1.0

				if (not Mission.rhino3_after_recy) then
				
					if (Mission.at_three) then
					
						Attack(Mission.rhino3,Mission.recycler)
						Mission.rhino3_after_recy = true
					end
				end
				
				if (not Mission.rhino3_behave) then
				
					if (GetDistance(Mission.rhino3,"rhino3_point") > 50.0) then
					
						Goto(Mission.rhino3,"rhino3_point",1)
						Mission.rhino3_check = GetTime() + 1.0
						Mission.rhino3_behave = true
					end
				
				else
				
					if (GetDistance(Mission.rhino3,"rhino3_point") < 30.0) then
					
						Mission.rhino3_behave = false
					end
				end
			end
		end

		if ((IsAlive(Mission.rhino4)) and (not Mission.rhino4_charge)) then
		
			if (GetTime() - GetLastEnemyShot(Mission.rhino4) < .2) then --(GetWhoShotMe(rhino1) == player)
			
				StartSoundEffect("rhin08.wav",Mission.rhino4)
				Attack(Mission.rhino4,Mission.player,1)
				Mission.rhino4_charge = true

			
			-- this keeps rhino 4 near his spawn point

			elseif (Mission.rhino4_check < GetTime()) then
			
				Mission.rhino4_check = GetTime() + 1.0

				if (not Mission.rhino4_after_recy) then
				
					if (Mission.at_four) then
					
						Attack(Mission.rhino4,Mission.recycler)
						Mission.rhino4_after_recy = true
					end
				end
				
				if (not Mission.rhino4_behave) then
				
					if (GetDistance(Mission.rhino4,"rhino4_point") > 50.0) then
					
						Goto(Mission.rhino4,"rhino4_point",1)
						Mission.rhino4_check = GetTime() + 1.0
						Mission.rhino4_behave = true
					end
				
				else
				
					if (GetDistance(Mission.rhino4,"rhino4_point") < 30.0) then
					
						Mission.rhino4_behave = false
					end
				end
			end
		end
		--------------------------------------------


		-- this is checking to see if a RHINO falls into the ice caps

		if (Mission.rhino1_charge) then
		
			if ((not Mission.rhino1_in) and (Mission.rhino1_check < GetTime())) then
			
				Mission.rhino1_check = GetTime() + 1.0

				if ((IsAlive(Mission.rhino1)) and (IsAround(Mission.scap1))) then
				
					if (GetDistance(Mission.rhino1,"scap1_point") < 50.0) then
					
						SetAnimation(Mission.scap1,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 6.0
						Mission.rhino1_check = GetTime() + 0.4
						Defend(Mission.rhino1,0)
						Mission.scap1_start = true
						Mission.rhino1_in = true
					end
				end

				if ((IsAlive(Mission.rhino1)) and (IsAround(Mission.scap2))) then
				
					if (GetDistance(Mission.rhino1,"scap2_point") < 50.0) then
					
						SetAnimation(Mission.scap2,"break",1)
						StartSoundEffect("icecrck1.wav")
						Mission.anim_wait = GetTime() + 6.0
						Mission.rhino1_check = GetTime() + 0.4
						Defend(Mission.rhino1,0)
						Mission.scap2_start = true
						Mission.rhino1_in = true
					end
				end
			end
		end

		if (Mission.rhino2_charge) then
		
			if ((not Mission.rhino2_in) and (Mission.rhino2_check < GetTime())) then
			
				Mission.rhino2_check = GetTime() + 1.0

				if (IsAlive(Mission.rhino2)) then
				
					if (IsAround(Mission.mcap1)) then
					
						if (GetDistance(Mission.rhino2,"mcap1_point") < 50.0) then
						
							SetAnimation(Mission.mcap1,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino2_check = GetTime() + 0.4
							Defend(Mission.rhino2,0)
							Mission.mcap1_start = true
							Mission.rhino2_in = true
						end
					end
					if (IsAround(Mission.mcap2)) then
					
						if ((GetDistance(Mission.rhino2,"mcap2_pointa") < 50.0) or 
							(GetDistance(Mission.rhino2,"mcap2_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap2,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino2_check = GetTime() + 0.4
							Defend(Mission.rhino2,0)
							Mission.mcap2_start = true
							Mission.rhino2_in = true
						end
					end
					if (IsAround(Mission.mcap3)) then
					
						if (GetDistance(Mission.rhino2,"mcap3_point") < 50.0) then
						
							SetAnimation(Mission.mcap3,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino2_check = GetTime() + 0.4
							Defend(Mission.rhino2,0)
							Mission.mcap3_start = true
							Mission.rhino2_in = true
						end
					end
					if (IsAround(Mission.mcap4)) then
					
						if ((GetDistance(Mission.rhino2,"mcap4_pointa") < 50.0) or 
							(GetDistance(Mission.rhino2,"mcap4_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap4,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino2_check = GetTime() + 0.4
							Defend(Mission.rhino2,0)
							Mission.mcap4_start = true
							Mission.rhino2_in = true
						end
					end
					if (IsAround(Mission.mcap5)) then
					
						if ((GetDistance(Mission.rhino2,"mcap5_pointa") < 50.0) or 
							(GetDistance(Mission.rhino2,"mcap5_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap5,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino2_check = GetTime() + 0.4
							Defend(Mission.rhino2,0)
							Mission.mcap5_start = true
							Mission.rhino2_in = true
						end
					end
					if (IsAround(Mission.mcap6)) then	
						if ((GetDistance(Mission.rhino2,"mcap6_pointa") < 50.0) or 
							(GetDistance(Mission.rhino2,"mcap6_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap6,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino2_check = GetTime() + 0.4
							Defend(Mission.rhino2,0)
							Mission.mcap6_start = true
							Mission.rhino2_in = true
						end
					end
				end
			end
		end

		if (Mission.rhino3_charge) then
		
			if ((not Mission.rhino3_in) and (Mission.rhino3_check < GetTime())) then
			
				Mission.rhino3_check = GetTime() + 1.0

				if (IsAlive(Mission.rhino3)) then
				
					if (IsAround(Mission.mcap1)) then
					
						if (GetDistance(Mission.rhino3,"mcap1_point") < 50.0) then
						
							SetAnimation(Mission.mcap1,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino3_check = GetTime() + 0.4
							Defend(Mission.rhino3,0)
							Mission.mcap1_start = true
							Mission.rhino3_in = true
						end
					end
					if (IsAround(Mission.mcap2)) then
					
						if ((GetDistance(Mission.rhino3,"mcap2_pointa") < 50.0) or 
							(GetDistance(Mission.rhino3,"mcap2_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap2,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino3_check = GetTime() + 0.4
							Defend(Mission.rhino3,0)
							Mission.mcap2_start = true
							Mission.rhino3_in = true
						end
					end
					if (IsAround(Mission.mcap3)) then
					
						if (GetDistance(Mission.rhino3,"mcap3_point") < 50.0) then
						
							SetAnimation(Mission.mcap3,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino3_check = GetTime() + 0.4
							Defend(Mission.rhino3,0)
							Mission.mcap3_start = true
							Mission.rhino3_in = true
						end
					end
					if (IsAround(Mission.mcap4)) then
					
						if ((GetDistance(Mission.rhino3,"mcap4_pointa") < 50.0) or 
							(GetDistance(Mission.rhino3,"mcap4_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap4,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino3_check = GetTime() + 0.4
							Defend(Mission.rhino3,0)
							Mission.mcap4_start = true
							Mission.rhino3_in = true
						end
					end
					if (IsAround(Mission.mcap5)) then
					
						if ((GetDistance(Mission.rhino3,"mcap5_pointa") < 50.0) or 
							(GetDistance(Mission.rhino3,"mcap5_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap5,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino3_check = GetTime() + 0.4
							Defend(Mission.rhino3,0)
							Mission.mcap5_start = true
							Mission.rhino3_in = true
						end
					end
					if (IsAround(Mission.mcap6)) then
					
						if ((GetDistance(Mission.rhino3,"mcap6_pointa") < 50.0) or 
							(GetDistance(Mission.rhino3,"mcap6_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap6,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino3_check = GetTime() + 0.4
							Defend(Mission.rhino3,0)
							Mission.mcap6_start = true
							Mission.rhino3_in = true
						end
					end
				end
			end
		end

		if (Mission.rhino4_charge) then
		
			if ((not Mission.rhino4_in) and (Mission.rhino4_check < GetTime())) then
			
				Mission.rhino4_check = GetTime() + 1.0

				if (IsAlive(Mission.rhino4)) then
				
					if (IsAround(Mission.mcap1)) then
					
						if (GetDistance(Mission.rhino4,"mcap1_point") < 50.0) then
						
							SetAnimation(Mission.mcap1,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino4_check = GetTime() + 0.4
							Defend(Mission.rhino4,0)
							Mission.mcap1_start = true
							Mission.rhino4_in = true
						end
					end
					if (IsAround(Mission.mcap2)) then
					
						if ((GetDistance(Mission.rhino4,"mcap2_pointa") < 50.0) or 
							(GetDistance(Mission.rhino4,"mcap2_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap2,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino4_check = GetTime() + 0.4
							Defend(Mission.rhino4,0)
							Mission.mcap2_start = true
							Mission.rhino4_in = true
						end
					end
					if (IsAround(Mission.mcap3)) then
					
						if (GetDistance(Mission.rhino4,"mcap3_point",1) < 50.0) then
						
							SetAnimation(Mission.mcap3,"break")
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino4_check = GetTime() + 0.4
							Defend(Mission.rhino4,0)
							Mission.mcap3_start = true
							Mission.rhino4_in = true
						end
					end
					if (IsAround(Mission.mcap4)) then
					
						if ((GetDistance(Mission.rhino4,"mcap4_pointa") < 50.0) or 
							(GetDistance(Mission.rhino4,"mcap4_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap4,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino4_check = GetTime() + 0.4
							Defend(Mission.rhino4,0)
							Mission.mcap4_start = true
							Mission.rhino4_in = true
						end
					end
					if (IsAround(Mission.mcap5)) then
					
						if ((GetDistance(Mission.rhino4,"mcap5_pointa") < 50.0) or 
							(GetDistance(Mission.rhino4,"mcap5_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap5,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino4_check = GetTime() + 0.4
							Defend(Mission.rhino4,0)
							Mission.mcap5_start = true
							Mission.rhino4_in = true
						end
					end
					if (IsAround(Mission.mcap6)) then
					
						if ((GetDistance(Mission.rhino4,"mcap6_pointa") < 50.0) or 
							(GetDistance(Mission.rhino4,"mcap6_pointb") < 50.0)) then
						
							SetAnimation(Mission.mcap6,"break",1)
							StartSoundEffect("icecrck1.wav")
							Mission.anim_wait = GetTime() + 6.0
							Mission.rhino4_check = GetTime() + 0.4
							Defend(Mission.rhino4,0)
							Mission.mcap6_start = true
							Mission.rhino4_in = true
						end
					end
				end
			end
		end
		--------------------------------------------


		-- this is setting the rhino animation and removing him

		if ((Mission.rhino1_in) and (Mission.rhino1_check < GetTime())) then
		 
			if (not Mission.animate_rhino1) then
			
				--StartSoundEffect("icecrck1.wav")
				Stop(Mission.rhino1)
				--ClearIdleAnims(rhino1)
				--SetAnimation(rhino1,"fall",1)
				--AddIdleAnim(rhino1,"fall")
				Mission.rhino1_check = GetTime() + 0.1
				Mission.animate_rhino1 = true
			
			elseif (not Mission.fall1_already) then
			

				pos = GetPosition(Mission.rhino1)
				RemoveObject(Mission.rhino1)
				Mission.rhino1 = BuildObject("bcrhinof",2,pos)
				SetAnimation(Mission.rhino1,"fall",1)

				--ClearIdleAnims(rhino1)
				--AddIdleAnim(rhino1,"fall")
				Mission.rhino1_check = GetTime() + 3.0
				StartSoundEffect("rhinocry.wav")
				Mission.fall1_already = true
			
			else
			
				RemoveObject(Mission.rhino1)

				if (IsAlive(Mission.wingman)) then
				
					Mission.talk = AudioMessage("isdf1034.wav")-- (wingman) I don't know what that was but it is dead
				end

				Mission.rhino1_check = GetTime() + 999999.9
			end
		end

		if ((Mission.rhino2_in) and (Mission.rhino2_check < GetTime())) then
		
			if (not Mission.animate_rhino2) then
			
				--StartSoundEffect("icecrck1.wav")
				Stop(Mission.rhino2)
				--ClearIdleAnims(rhino2)
				--AddIdleAnim(rhino2,"fall")
				Mission.rhino2_check = GetTime() + 0.1
				Mission.animate_rhino2 = true
			
			elseif (not Mission.fall2_already) then
			
				pos = GetPosition(Mission.rhino2)
				RemoveObject(Mission.rhino2)
				Mission.rhino2 = BuildObject("bcrhinof",2,pos)
				SetAnimation(Mission.rhino2,"fall",1)

				--ClearIdleAnims(rhino2)
				--AddIdleAnim(rhino2,"fall")
				Mission.rhino2_check = GetTime() + 3.0
				StartSoundEffect("rhinocry.wav")
				Mission.fall2_already = true
			
			else
			
				RemoveObject(Mission.rhino2)
				Mission.rhino2_check = GetTime() + 999999.9
			end
		end

		if ((Mission.rhino3_in) and (Mission.rhino3_check < GetTime())) then
		
			if (not Mission.animate_rhino3) then
			
				--StartSoundEffect("icecrck1.wav")
				Stop(Mission.rhino3)
				--ClearIdleAnims(rhino3)
				--AddIdleAnim(rhino3,"fall")
				Mission.rhino3_check = GetTime() + 0.1
				Mission.animate_rhino3 = true
			
			elseif (not Mission.fall3_already) then
			
				pos = GetPosition(Mission.rhino3)
				RemoveObject(Mission.rhino3)
				Mission.rhino3 = BuildObject("bcrhinof",2,pos)
				SetAnimation(Mission.rhino3,"fall",1)

				--ClearIdleAnims(rhino3)
				--AddIdleAnim(rhino3,"fall")
				Mission.rhino3_check = GetTime() + 3.0
				StartSoundEffect("rhinocry.wav")
				Mission.fall3_already = true
			
			else
			
				RemoveObject(Mission.rhino3)
				Mission.rhino3_check = GetTime() + 999999.9
			end
		end

		if ((Mission.rhino4_in) and (Mission.rhino4_check < GetTime())) then
		
			if (not Mission.animate_rhino4) then
			
				--StartSoundEffect("icecrck1.wav")
				Stop(Mission.rhino4)
				--ClearIdleAnims(rhino4)
				--AddIdleAnim(rhino4,"fall")
				Mission.rhino4_check = GetTime() + 0.1
				Mission.animate_rhino4 = true
			
			elseif (not Mission.fall4_already) then
			
				pos = GetPosition(Mission.rhino4)
				RemoveObject(Mission.rhino4)
				Mission.rhino4 = BuildObject("bcrhinof",2,pos)
				SetAnimation(Mission.rhino4,"fall",1)

				--ClearIdleAnims(rhino4)
				--AddIdleAnim(rhino4,"fall")
				Mission.rhino4_check = GetTime() + 3.0
				StartSoundEffect("rhinocry.wav")
				Mission.fall4_already = true
			
			else
			
				RemoveObject(Mission.rhino4)
				Mission.rhino4_check = GetTime() + 999999.9
			end
		end
		--------------------------------------------


		-- this is removing the ice cap objects when aninmated

		if (Mission.anim_wait < GetTime()) then
		
			if ((Mission.scap1_start) and (IsAround(Mission.scap1))) then
			
				RemoveObject(Mission.scap1)

			end
			if ((Mission.scap2_start) and (IsAround(Mission.scap2))) then
			
				RemoveObject(Mission.scap2)


			end

			if ((Mission.mcap1_start) and (IsAround(Mission.mcap1))) then
			
				RemoveObject(Mission.mcap1)

			end
			if ((Mission.mcap2_start) and (IsAround(Mission.mcap2))) then
			
				RemoveObject(Mission.mcap2)

			end
			if ((Mission.mcap3_start) and (IsAround(Mission.mcap3))) then
			
				RemoveObject(mcap3)

			end
			if ((Mission.mcap4_start) and (IsAround(Mission.mcap4))) then
			
				RemoveObject(Mission.mcap4)

			end
			if ((Mission.mcap5_start) and (IsAround(Mission.mcap5))) then
			
				RemoveObject(Mission.mcap5)

			end
			if ((Mission.mcap6_start) and (IsAround(Mission.mcap6))) then
			
				RemoveObject(Mission.mcap6)

			end

			Mission.anim_wait = GetTime() + 99999.9
		end
		--------------------------------------------
	end

		-- this is cancelling the deploy order to the recy

	if (not Mission.at_nav) then
	
		if (GetCurrentCommand(Mission.recycler) == 9) then
		
			Stop(Mission.recycler,0)
		end
	end
		--------------------------------------------


	if (Mission.part_two) then


		-- this is the dropship conversation

		if (not Mission.drop_message1) then
		
			--switch in new rec
			RecyTeam = GetTeamNum(Mission.recycler)
			RecyGroup = GetGroup(Mission.recycler)
			xfrm = GetTransform(Mission.recycler)
			RemoveObject(Mission.recycler)
			Mission.recycler = BuildObject("ivrecy_vsr", RecyTeam, xfrm)
			SetGroup(Mission.recycler, RecyGroup)
			SetScrap(1,40)
			Follow(Mission.transport, Mission.recycler,0)
			Mission.talk = AudioMessage("isdf1012a.wav")--(dropship) We got survivors!
			Mission.drop_message1 = true
			

		end

		if ((Mission.drop_message1) and (not Mission.drop_message2) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf1013.wav")--(recycler) We need evac!
			Mission.drop_message2 = true
		end

		if ((Mission.drop_message2) and (not Mission.drop_message3) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf1014.wav")--(dropship) Roger that - we will search for landing location. Shab went down near you - check out
			--land_time = GetTime() + 900.0
			Mission.shab_check = GetTime() + 2.0
			Mission.escape_check = GetTime() + 2.0
			Mission.turret_time = GetTime() + 120.0
			CameraReady()
			Mission.camera_time = GetTime() + 7.0
			--Mission.dropship = BuildObject("ivpdrop",1,"new_turr1")
			SetAnimation(Mission.dropship, "fly", 0)
			Mission.drop_message3 = true
		end

		if ((Mission.drop_message3) and (not Mission.drop_message4) and (IsAudioMessageDone(Mission.talk))) then
			
			StartAnimation(Mission.dropship)
			Mission.talk = AudioMessage("isdf1023.wav")--(recycler) Roger that - by time and protect transport
			ClearObjectives()
			AddObjective("search.otf", "WHITE")
			AddObjective("transport.otf", "WHITE")
			SetObjectiveOn(Mission.transport)
			tempstr = TranslateString("Mission1003")  -- Transport
			SetObjectiveName(Mission.transport,tempstr)
			Mission.cheat_tank1 = BuildObject("fvsent_vsr",2,"cheat_spawn4")
			Mission.cheat_tank2 = BuildObject("fvsent_vsr",2,"cheat_spawn5")
			Mission.cheat_tank3 = BuildObject("fvtank_vsr",2,"cheat_spawn6")
			Mission.drop_message4 = true
		end	
		--------------------------------------------


		-- this is the camera code

		if ((not Mission.camera_off) and (Mission.drop_message3)) then
			pos = GetPosition(Mission.dropship)
			pos.x = pos.x + 2
			SetCameraPosition(pos, pos)
			CameraObject(Mission.dropship, 40, 60, 30, Mission.dropship)
		end


		if ((not Mission.camera_off) and (Mission.camera_time < GetTime())) then
		
			CameraFinish()
			RemoveObject(Mission.dropship)
			Mission.camera_off = true
		end
		--------------------------------------------


		-- this is the turret message

		if (not Mission.turret_message) then
		
			if (Mission.turret_time < GetTime()) then
			
				Mission.talk = AudioMessage("isdf1026.wav") -- (dropship) clear the turrets
				Mission.nav2 = BuildObject("ibnav",1,"nav2_point")
				SetObjectiveOn(Mission.nav2)
				tempstr = TranslateString("Mission1004")  -- Dust Off
				SetObjectiveName(Mission.nav2,tempstr)
				Mission.turret_message = true
			end

			if ((Mission.shab_found) and (IsAudioMessageDone(Mission.talk))) then
			
				Mission.talk = AudioMessage("isdf1026.wav") -- (dropship) clear the turrets
				Mission.nav2 = BuildObject("ibnav",1,"nav2_point")
				SetObjectiveOn(Mission.nav2)
				tempstr = TranslateString("Mission1004")  -- Dust Off
				SetObjectiveName(Mission.nav2,tempstr)
				Mission.turret_message = true
			end
		end


		if ((not Mission.turret_otf) and (Mission.turret_message) and (IsAudioMessageDone(Mission.talk))) then
		
			if (Mission.shab_found) then
			
				ClearObjectives()
				AddObjective("search.otf", "GREEN")
				AddObjective("turret.otf", "WHITE")
				AddObjective("transport.otf", "WHITE")
			
			else
			
				ClearObjectives()
				AddObjective("search.otf", "WHITE")
				AddObjective("turret.otf", "WHITE")
				AddObjective("transport.otf", "WHITE")
			end

			Mission.turret_otf = true
		end
		--------------------------------------------


		
		-- this is the sending ships down the second patrol path

		if ((not Mission.second_patrol1) and (Mission.patrol_time < GetTime())) then
		
			Mission.patrol_sent1 = BuildObject("fvsent_vsr",2,"cheat_spawn5")
			Mission.patrol_sent2 = BuildObject("fvsent_vsr",2,"cheat_spawn6")

			Patrol(Mission.patrol_sent1,"patrol_path2")
			Follow(Mission.patrol_sent2,Mission.patrol_sent1)

			Mission.second_patrol1 = true
		end
		--------------------------------------------


		-- this is checking to see of the player finds shabs ship

		if ((not Mission.shab_found) and (Mission.shab_check < GetTime())) then
		
			Mission.shab_check = GetTime() + 2.0


			if (GetDistance(Mission.player,Mission.crash_ship2) < 90.0) then
			
				if (IsAlive(Mission.cheat_tank1)) then
				
					Attack(Mission.cheat_tank1,Mission.player)
				end
				if (IsAlive(Mission.cheat_tank2)) then
				
					Attack(Mission.cheat_tank2,Mission.transport)
				end
				if (IsAlive(Mission.cheat_tank3)) then
				
					Attack(Mission.cheat_tank3,Mission.recycler)
				end

				AudioMessage("isdf1016.wav")--(recycler) that's it - scan it for signs of life
				Mission.shab_found = true
				Mission.shab_scanned = true
			end
		end
		--------------------------------------------

		-- this is checking to see when the recycler is moving towards the dust-off location

		if (IsAlive(Mission.transport)) then
		
			if (Mission.escape_check < GetTime()) then
			
				Mission.escape_check = GetTime() + 2.0


				if ((not Mission.at_choke1) and (GetDistance(Mission.transport,"choke_point1") < 60.0)) then
				
					Mission.at_choke1 = true
					Mission.at_choke2 = false
					Mission.at_choke3 = false
				end

				if ((not Mission.at_choke2) and (GetDistance(Mission.transport,"choke_point2") < 50.0)) then
				
					Mission.at_choke1 = false
					Mission.at_choke2 = true
					Mission.at_choke3 = false
				end

				if ((not Mission.at_choke3) and (GetDistance(Mission.transport,"choke_point3") < 60.0)) then
				
					Mission.at_choke1 = false
					Mission.at_choke2 = false
					Mission.at_choke3 = true
				end
			end
		end
		--------------------------------------------


		-- this is changing aips

		if ((not Mission.set_plan1) and (Mission.new_plan_time < GetTime())) then
		
			Mission.new_plan_time = GetTime() + 999999.9
			SetAIP("isdf1002.aip",2)
			Mission.set_plan1 = true
		end
		--------------------------------------------

		
		-- this is making the scions attack when the recycler on the way to the drop

		if (Mission.in_air) then

		
			if ((Mission.at_choke1) or (Mission.at_choke2) or (Mission.at_choke3)) then
			
				if ((Mission.sent1_attack_recy) and (Mission.sent1_a)) then
				
					Attack(Mission.sent1,Mission.transport)
					Mission.sent1_attack_recy = true
				end

				if ((Mission.sent2_attack_recy) and (Mission.sent2_a)) then
				
					Attack(Mission.sent2,Mission.transport)
					Mission.sent2_attack_recy = true
				end

				if ((Mission.war1_attack_recy) and (Mission.war1_a)) then
				
					Attack(Mission.war1,Mission.transport)
					Mission.war1_attack_recy = true
				end

				if ((Mission.war2_attack_recy) and (Mission.war2_a)) then
				
					Attack(Mission.war2,Mission.transport)
					Mission.war2_attack_recy = true
				end

				if ((Mission.maul1_attack_recy) and (Mission.maul1_a)) then
				
					if (IsAround(Mission.recycler)) then
					
						Attack(Mission.maul1,Mission.recycler)
						Mission.maul1_attack_recy = true
					
					else
					
						Attack(Mission.maul1,Mission.transport)
						Mission.maul1_attack_recy = true
					end
				end

				if ((Mission.maul2_attack_recy) and (Mission.maul2_a)) then
				
					if (IsAround(Mission.recycler)) then
					
						Attack(Mission.maul2,Mission.recycler)
						Mission.maul2_attack_recy = true
					
					else
					
						Attack(Mission.maul2,Mission.transport)
						Mission.maul2_attack_recy = true
					end
				end
			end
		
		elseif ((not Mission.in_air) and (not Mission.at_choke3)) then
		
			if ((Mission.at_choke1) or (Mission.at_choke2)) then
			
				if ((Mission.sent1_attack_recy) and (Mission.sent1_a)) then
				
					Attack(Mission.sent1,Mission.transport)
					Mission.sent1_attack_recy = true
				end

				if ((Mission.sent2_attack_recy) and (Mission.sent2_a)) then
				
					Attack(Mission.sent2,Mission.transport)
					Mission.sent2_attack_recy = true
				end

				if ((Mission.war1_attack_recy) and (Mission.war1_a)) then
				
					Attack(Mission.war1,Mission.transport)
					Mission.war1_attack_recy = true
				end

				if ((Mission.war2_attack_recy) and (Mission.war2_a)) then
				
					Attack(Mission.war2,Mission.transport)
					Mission.war2_attack_recy = true
				end

				if ((Mission.maul1_attack_recy) and (Mission.maul1_a)) then
				
					if (IsAround(Mission.recycler)) then
					
						Attack(Mission.maul1,Mission.recycler)
						Mission.maul1_attack_recy = true
					
					else
					
						Attack(Mission.maul1,Mission.transport)
						Mission.maul1_attack_recy = true
					end
				end

				if ((Mission.maul2_attack_recy) and (Mission.maul2_a)) then
				
					if (IsAround(Mission.recycler)) then
					
						Attack(Mission.maul2,Mission.recycler)
						Mission.maul2_attack_recy = true
					
					else
					
						Attack(Mission.maul2,Mission.transport)
						Mission.maul2_attack_recy = true
					end
				end
			end
		end


		-- this is the new turret code

		if (not Mission.land_secure) then
		
			if ((not IsAlive(Mission.block_turret1)) and (not IsAlive(Mission.block_turret2))
				and (not IsAlive(Mission.block_turret3)) and (not IsAlive(Mission.block_turret4))) then
			
				AudioMessage("isdf1027.wav") -- (pilot) nice job - we'll be on the ground in 15
				Mission.land_time = GetTime() + 15.0
				Mission.land_secure = true
			end
		end

	-- this is the dropship code

		-- landing

		if ((Mission.in_air) and (Mission.land_time < GetTime())) then
		
			if (GetDistance(Mission.player,"drop_point1") > 300.0) then
			
				if (not Mission.first_land) then
				
					Mission.talk = AudioMessage("isdf1019.wav")--(dropship) your chariots have arrive commander - we're dropping a nav at the dust off site
					Mission.first_land = true
				
				else
				
					AudioMessage("isdf1020.wav")--(dropship) We're gonna try another landing now commander
				end

				Mission.dropshipa = BuildObject("ivpdrop",1,"drop_point1")
				Mission.dropshipb = BuildObject("ivpdrop",1,"drop_point2")
				ClearObjectives()
				AddObjective("dropship.otf", "WHITE")

				if (Mission.shab_found) then
				
					AddObjective("search.otf", "GREEN")
				
				elseif (not Mission.shab_found) then
				
					AddObjective("dropship.otf", "RED")
				end

				AddObjective("transport.otf", "WHITE")

				Mission.landing = false
				-- Changed NM 8/29/03 -- allow the mission to end if the
				-- transport gets to the dustoff zone before the user
				-- does. (Otherwise, would just hang) Savegame from Commando
				-- demonstrated this
				Mission.landed = true

				Mission.in_air = false
			
			else
			
				-- THIS IS WHERE I NEED TO PUT THE LANDING CINERACTIVE - code under this will be deleted
				Mission.dropshipa = BuildObject("ivdrop_land",1,"drop_point1")
				Mission.dropshipb = BuildObject("ivdrop_land",1,"drop_point2")
				SetAnimation(Mission.dropshipa, "land", 1)
				Mission.landing_time = GetTime() + 3.0

				if (not Mission.first_land) then
				
					Mission.talk = AudioMessage("isdf1019.wav")--(dropship) your chariots have arrive commander - we're dropping a nav at the dust off site
					Mission.first_land = true
				
				else
				
					AudioMessage("isdf1020.wav")--(dropship) We're gonna try another landing now commander
				end
				
				ClearObjectives()
				AddObjective("dropship.otf", "WHITE")

				if (Mission.shab_found) then
				
					AddObjective("search.otf", "GREEN")
				
				elseif (not Mission.shab_found) then
				
					AddObjective("dropship.otf", "RED")
				end

				AddObjective("transport.otf", "WHITE")

				Mission.landing = true
				Mission.in_air = false
			end
		end
		--------------------------------------------


		-- this is making the second drop appear cool

		if ((Mission.landing) and (not Mission.landed)) then
		
			if ((not Mission.two_land) and (Mission.landing_time < GetTime())) then
			
				SetAnimation(Mission.dropshipb, "land", 1)
				Mission.landing_time = GetTime() + 13.0
				Mission.two_land = true
			end

			if ((Mission.two_land) and (Mission.landing_time < GetTime())) then
			
				RemoveObject(Mission.dropshipa)
				RemoveObject(Mission.dropshipb)
				Mission.dropshipa = BuildObject("ivpdrop",1,"drop_point1")
				Mission.dropshipb = BuildObject("ivpdrop",1,"drop_point2")
				SetAnimation(Mission.dropshipa, "deploy", 1)
				SetAnimation(Mission.dropshipb, "deploy", 1)
				MaskEmitter(Mission.dropshipa, 0)
				MaskEmitter(Mission.dropshipb, 0)
				Mission.landed = true
			end
		end
		--------------------------------------------
		

		-- taking off

		if ((Mission.first_land) and (not Mission.in_air) and (not Mission.game_over)) then
		
			if ((GetCurHealth(Mission.dropshipa) < 500) or (GetCurHealth(Mission.dropshipb) < 500)) then
			
				if (GetDistance(Mission.player,"drop_point1") > 200.0) then
				
					AudioMessage("isdf1021.wav")--(dropship) this area's too hot - we have to take off john. Clear the landing zone at nav2 and we'll make another attempt. 
					RemoveObject(Mission.dropshipa)
					RemoveObject(Mission.dropshipb)
					ClearObjectives()
					AddObjective("dropship.otf", "RED")

					if (Mission.shab_found) then
					
						AddObjective("search.otf", "GREEN")
					
					elseif (not Mission.shab_found) then
					
						AddObjective("dropship.otf", "RED")
					end

					AddObjective("transport.otf", "WHITE")

					Mission.land_time = GetTime() + 600.0
					Mission.landing_time = GetTime() + 999999.9
					Mission.landing = false
					Mission.landed = false
					Mission.two_land = false
					Mission.take_off = false
					Mission.in_air = true
				
				else
				
					-- THIS IS WHERE I NEED TO PUT THE TAKING OFF CINERACTIVE - code under this will be deleted
					AudioMessage("isdf1021.wav")--(dropship) this area's too hot - we have to take off john. Clear the landing zone at nav2 and we'll make another attempt. 
					SetAnimation(Mission.dropshipa, "takeoff", 1)
					SetAnimation(Mission.dropshipb, "takeoff", 1)
					ClearObjectives()
					AddObjective("dropship.otf", "RED")

					if (Mission.shab_found) then
						AddObjective("search.otf", "GREEN")
					
					elseif (not Mission.shab_found) then
					
						AddObjective("dropship.otf", "RED")
					end

					AddObjective("transport.otf", "WHITE")

					Mission.land_time = GetTime() + 600.0
					Mission.landing_time = GetTime() + 10.0
					Mission.landing = false
					Mission.landed = false
					Mission.two_land = false
					Mission.take_off = true
					Mission.in_air = true
				end
			end
		end
		--------------------------------------------


		-- this is if they take off in engine

		if ((Mission.take_off) and (Mission.landing_time < GetTime())) then
		
			RemoveObject(Mission.dropshipa)
			RemoveObject(Mission.dropshipb)
			Mission.landing_time = GetTime() + 999999.9
			Mission.take_off = false
		end




		if ((not Mission.start_end_movie) and (Mission.landed) and (Mission.win_check < GetTime())) then
		
			Mission.win_check = GetTime() + 1.0

			if (GetDistance(Mission.transport,Mission.dropshipa) < 150.0) then
			
				CameraReady()
				SetPerceivedTeam(Mission.player,2)
				SetPerceivedTeam(Mission.transport,2)
				Retreat(Mission.transport,"into_drop_path")
				Mission.start_end_movie = true
			end

			if (GetDistance(Mission.transport,Mission.dropshipb) < 150.0) then
			
				CameraReady()
				SetPerceivedTeam(Mission.player,2)
				SetPerceivedTeam(Mission.transport,2)
				Retreat(Mission.transport,"into_drop_path")
				Mission.start_end_movie = true
			end
		end
		--------------------------------------------

		if ((not Mission.game_over) and (Mission.start_end_movie)) then
		
			CameraPath("shot1_point",2000,0,Mission.transport)

			if (GetCurHealth(Mission.transport) < 1000) then
			
				SetCurHealth(Mission.transport,1000)
			end
	 
			if (GetCurHealth(Mission.player) < 500) then
			
				SetCurHealth(Mission.player,500)
			end

			if ((not Mission.shot2) and (GetDistance(Mission.transport,"drop_point1") < 10.0)) then
				Stop(Mission.transport)
				StartEmitter(Mission.dropshipa,1)
				StartEmitter(Mission.dropshipa,2)
				SetAnimation(Mission.dropshipa,"takeoff", 1)
				Mission.carrier_time = GetTime() + 4.0
				Mission.shot2 = true
			end
		end

		if ((not Mission.remove_transport) and (Mission.shot2) and (Mission.carrier_time < GetTime())) then
		
			SucceedMission(GetTime() + 0.1,"isdf10w1.txt")
			Mission.remove_transport = true
		end
		--------------------------------------------


	end


	-- this is the recycler telling the player to get the transport to the drop site

	if ((not Mission.transport_message) and (Mission.first_land) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf1022.wav") --  (recycler) -- get my transport to the drop zone
		Mission.transport_message = true
	end


	-- these are the win/loose conditions
	if ((not Mission.game_over)) then

		-- if the recycler dies

		if (Mission.recy_fall_in) then
		
			if (IsAlive(Mission.wingman)) then
			
				AudioMessage("isdf1017.wav") -- (wingman) you let the recycler get destroyed!
				FailMission(GetTime() + 15.0)
				Mission.game_over = true
			
			else
			
				FailMission(GetTime() + 15.0)
				Mission.game_over = true
			end
		end

		if ((Mission.free_recycler) and (not IsAlive(Mission.recycler))) then
		
			if ((not Mission.at_nav) and (IsAlive(Mission.wingman))) then
			
				AudioMessage("isdf1017.wav") -- (wingman) you let the recycler get destroyed!
				FailMission(GetTime() + 15.0)
				Mission.game_over = true
			
			elseif ((not Mission.at_nav) and (not IsAlive(Mission.wingman))) then
			
				FailMission(GetTime() + 1.0)
				Mission.game_over = true
			
			elseif (Mission.at_nav) then
			
				AudioMessage("isdf1018.wav") -- (dropship pilot) your recycler is dead - no need for pick-up now
				FailMission(GetTime() + 15.0)
				Mission.game_over = true
			end
		end
		--------------------------------------------

		-- this is if the transport gets destroyed

		if (not IsAlive(Mission.transport)) then
		
			if (IsAlive(Mission.recycler)) then
			
				AudioMessage("isdf1025.wav") -- (recycler) my transport is dead
				FailMission(GetTime() + 15.0)
				ClearObjectives()
				AddObjective("transport.otf", "RED")
				Mission.game_over = true
			
			elseif (Mission.at_nav) then
			
				AudioMessage("isdf1025.wav") -- (dropship pilot) my transport is dead
				FailMission(GetTime() + 15.0)
				ClearObjectives()
				AddObjective("transport.otf", "RED")
				Mission.game_over = true
			end
		end


	end

--------------------------------------------------------------------/
end -- ON_HOLD
--------------------------------------------------------------------/

if (Mission.ON_HOLD) then
-- this is the dropship code

	-- landing

	if ((Mission.in_air) and (Mission.land_time < GetTime())) then
	
		if (GetDistance(Mission.player,"drop_point1") > 300.0) then
	
			if (not Mission.first_land) then
			
				Mission.talk = AudioMessage("isdf1019.wav")--(dropship) your chariots have arrive commander - we're dropping a nav at the dust off site
				Mission.first_land = true
			
			else
			
				AudioMessage("isdf1020.wav")--(dropship) We're gonna try another landing now commander
			end

			Mission.dropshipa = BuildObject("ivpdrop",1,"drop_point1")
			Mission.dropshipb = BuildObject("ivpdrop",1,"drop_point2")
			ClearObjectives()
			AddObjective("dropship.otf", "WHITE")

			if (Mission.shab_found) then
		
				AddObjective("search.otf", "GREEN")
			
			elseif (not Mission.shab_found) then
			
				AddObjective("dropship.otf", "RED")
			end

			AddObjective("transport.otf", "WHITE")

			Mission.landing = false
			Mission.in_air = false
		
		else
		
			-- THIS IS WHERE I NEED TO PUT THE LANDING CINERACTIVE - code under this will be deleted
			Mission.dropshipa = BuildObject("ivdrop_land",1,"drop_point1")
			Mission.dropshipb = BuildObject("ivdrop_land",1,"drop_point2")
			SetAnimation(Mission.dropshipa, "land", 1)
			Mission.landing_time = GetTime() + 3.0

			if (not Mission.first_land) then
			
				Mission.talk = AudioMessage("isdf1019.wav")--(dropship) your chariots have arrive commander - we're dropping a nav at the dust off site
				Mission.first_land = true
			
			else
			
				AudioMessage("isdf1020.wav")--(dropship) We're gonna try another landing now commander
			end
			
			ClearObjectives()
			AddObjective("dropship.otf", "WHITE")

			if (Mission.shab_found) then
			
				AddObjective("search.otf", "GREEN")
			
			elseif (not Mission.shab_found) then
			
				AddObjective("dropship.otf", "RED")
			end

			AddObjective("transport.otf", "WHITE")

			Mission.landing = true
			Mission.in_air = false
		end
	end
	--------------------------------------------


	-- this is making the second drop appear cool

	if ((Mission.landing) and (not Mission.landed)) then
		if ((not Mission.two_land) and (Mission.landing_time < GetTime())) then
			SetAnimation(Mission.dropshipb, "land", 1)
			Mission.landing_time = GetTime() + 13.0
			Mission.two_land = true
		end

		if ((Mission.two_land) and (Mission.landing_time < GetTime())) then
			RemoveObject(Mission.dropshipa)
			RemoveObject(Mission.dropshipb)
			Mission.dropshipa = BuildObject("ivpdrop",1,"drop_point1")
			Mission.dropshipb = BuildObject("ivpdrop",1,"drop_point2")
			SetAnimation(Mission.dropshipa, "deploy", 1)
			SetAnimation(Mission.dropshipb, "deploy", 1)
			MaskEmitter(Mission.dropshipa, 0)
			MaskEmitter(Mission.dropshipb, 0)
			Mission.landed = true
		end
	end
	--------------------------------------------
	

	-- taking off

	if ((Mission.first_land) and (not Mission.in_air) and (not Mission.game_over)) then
	
		if ((GetCurHealth(Mission.dropshipa) < 500) or (GetCurHealth(Mission.dropshipb) < 500)) then
		
			if (GetDistance(Mission.player,"drop_point1") > 200.0) then
			
				AudioMessage("isdf1021.wav")--(dropship) this area's too hot - we have to take off john. Clear the landing zone at nav2 and we'll make another attempt. 
				RemoveObject(Mission.dropshipa)
				RemoveObject(Mission.dropshipb)
				ClearObjectives()
				AddObjective("dropship.otf", "RED")

				if (Mission.shab_found) then
					AddObjective("search.otf", "GREEN")
				elseif (not Mission.shab_found) then
					AddObjective("dropship.otf", "RED")
				end

				AddObjective("transport.otf", "WHITE")

				Mission.land_time = GetTime() + 600.0
				Mission.landing_time = GetTime() + 999999.9
				Mission.landing = false
				Mission.landed = false
				Mission.two_land = false
				Mission.take_off = false
				Mission.in_air = true
			
			else
				-- THIS IS WHERE I NEED TO PUT THE TAKING OFF CINERACTIVE - code under this will be deleted
				AudioMessage("isdf1021.wav")--(dropship) this area's too hot - we have to take off john. Clear the landing zone at nav2 and we'll make another attempt. 
				SetAnimation(Mission.dropshipa, "takeoff", 1)
				SetAnimation(Mission.dropshipb, "takeoff", 1)
				ClearObjectives()
				AddObjective("dropship.otf", "RED")

				if (Mission.shab_found) then
					AddObjective("search.otf", "GREEN")
				elseif (not Mission.shab_found) then
					AddObjective("dropship.otf", "RED")
				end

				AddObjective("transport.otf", "WHITE")

				Mission.land_time = GetTime() + 600.0
				Mission.landing_time = GetTime() + 10.0
				Mission.landing = false
				Mission.landed = false
				Mission.two_land = false
				Mission.take_off = true
				Mission.in_air = true
			end
		end
	end
	--------------------------------------------


	-- this is if they take off in engine

	if ((Mission.take_off) and (Mission.landing_time < GetTime())) then
		RemoveObject(Mission.dropshipa)
		RemoveObject(Mission.dropshipb)
		Mission.landing_time = GetTime() + 999999.9
		Mission.take_off = false
	end




	if ((not Mission.start_end_movie) and (Mission.landed) and (Mission.win_check < GetTime())) then
		Mission.win_check = GetTime() + 1.0

		if (GetDistance(Mission.transport,Mission.dropshipa) < 150.0) then
			CameraReady()
			Retreat(Mission.transport,"into_drop_path")
			Mission.start_end_movie = true
		end

		if (GetDistance(Mission.transport,Mission.dropshipb) < 150.0) then
			CameraReady()
			Retreat(Mission.transport,"into_drop_path")
			Mission.start_end_movie = true
		end
	end
	--------------------------------------------

	if ((not Mission.game_over) and (Mission.start_end_movie)) then
		CameraPath("shot1_point",2000,0,Mission.transport)

		if ((not Mission.shot2) and (GetDistance(Mission.transport,"drop_point1") < 10.0)) then
			Stop(Mission.transport)
			StartEmitter(Mission.dropshipa,1)
			StartEmitter(Mission.dropshipa,2)
			SetAnimation(Mission.dropshipa,"takeoff", 1)
			Mission.carrier_time = GetTime() + 4.0
			Mission.shot2 = true
		end
	end

	if ((not Mission.remove_transport) and (Mission.shot2) and (Mission.carrier_time < GetTime())) then
		SucceedMission(GetTime() + 0.1)
		Mission.remove_transport = true
	end
	--------------------------------------------
end

end
