--[[


Event Scripting: 
Ported to LUA: 
Date: 7-11-2021
Description: Campagin mission  ported to LUA
References:
1. https:--steamcommunity.com-sharedfiles-filedetails-?id = 1488402495
2. https:www.lua.org-docs.html
]] --
local Mission = {
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
	--  bools
	ON_HOLD = false,
	start_done = false,
	builder1_a = false,
	builder2_a = false,
	builder3_a = false,
	builder4_a = false, 
	sscav1_a = true,
	sscav2_a = true,
	sscav3_a = true,
	sscav4_a = true,
	sscav5_a = true,
	guard1_a = false,
	guard2_a = false,
	guard3_a = false,
	guard4_a = false,

	hauler1_a = true,
	burns_free = true,

	scout1_a = false,
	scout2_a = false,
	scout3_a = false,
	scout4_a = false,
	war1_a = false,
	war2_a = false,
	war3_a = false,
	war4_a = false,
	lance1_a = false,
	lance2_a = false,
	lance3_a = false,
	lance4_a = false,
	titan1_a = false,
	titan2_a = false,
	titan3_a = false,
	maul1_a = false,
	maul2_a = false,
	maul3_a = false,
	maul4_a = false, 
	player_has_burns = false,
	scion_has_burns = false,
	scion_return = false,
	burns_recovered = false,
	hauler_near_base = false,
	game_over = false,
	first_deploy = false,
	player_in_tug = false,
	recycler_deployed = true,
	recycler_moved = false,
	player_return = false,
	shab_encounter = false,
	make_decision = false,
	shab_meeting = false,
	meeting_message1 = false,
	meeting_message2 = false,
	tug_determination = false,
	tug_is_player = false,
	no_tugger = false,
	encounter_message1 = false,
	encounter_message2 = false,
	brad_mad = false,
	decision_made = false,
	evil = false,
	tug_wait = false,
	stop_john = false,
	good = false,
	shab_look = false,
	condors_away = false,
	condor_clear = false,
	at_crash = false,
	near_crash = false,
	firey_death = false,
	first_warning = false,
	second_warning = false,
	hauler_found = false,
	search_message = false,
	done = false,
	hauler_go = false,
	burns_comment1 = false,
	first_time = false,
	recy_building = false,
	sent1_a = true,
	sent2_a = true,
	sent3_a = true,
	sent4_a = true,
	sent1_defend = false,
	sent2_defend = false,
	hauler_wait = false,
	was_in = false,
	recycler_move = false,
	player_clear = false,
	condor1_gone = false,
	condor2_gone = false,
	start_done2 = false,
	start_movie = false,
	raise_road = false,
	go_to_cave = false,
	shab_at_cave = false,
	raise_cave = false,
	shab_into_cave = false,
	factory_built = false,
	armory_built = false,
	last_aip = false,
	set_sheilds = false,
	tug_on_the_way = false,


	--  floats
	hauler_check = 999999.9,
	recycler_check = 999999.9,
	tugger_check = 999999.9,
	encouter_check = 999999.9,
	end_check = 999999.9,
	crash_check = 999999.9,
	lava_check = 999999.9,
	warning1_time = 999999.9,
	warning2_time = 999999.9,
	find_hauler_check = 999999.9,
	game_over_check = 999999.9,
	open_time = 999999.9,
	condor1_time = 999999.9,
	condor2_time = 999999.9,
	build1_movetime = 999999.9,
	build2_movetime = 999999.9,
	build3_movetime = 999999.9,
	build4_movetime = 999999.9,
	hauler_time = 3.0,
	condor1_engine = 999999.9,
	condor2_engine = 999999.9,
	scav1_time = 999999.9,
	scav2_time = 999999.9,
	scav3_time = 999999.9,
	scav4_time = 999999.9,
	scav5_time = 999999.9,
	road_time = 999999.9,
	scav_check = 999999.9,
	hauler_build_time = 999999.9,


	--  handles
	player,
	--pool1,
	--pool2,
	--pool3,
	--pool4,
	--pool5,
	--pool6,
	--play_pool1,
	play_pool2,
	recycler,
	srecycler,
	forge,
	overseer,
	dower,
	stronghold,
	bspir1,
	bspir2,
	spir1,
	condor1,
	condor2,
	builder1,
	builder2,
	builder3,
	builder4,
	burns,
	sscav1,
	sscav2,
	sscav3,
	sscav4,
	sscav5,
	sscav6,
	carrier,
	nav1,
	tug_nav,
	tbolt1,
	tank1,
	hauler1,
	spire1,
	spire2,
	spire3,
	spire4,
	road,
	cave,
	factory,
	armory,
	guard1,
	guard2,
	guard3,
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
	titan1,
	titan2,
	titan3,
	tugger,
	talk,
	talk2,
	talk3,
	gab,
	leader,
	scout_holder,
	tank_holder,
	player_holder,
	cheat1,
	cheat2,
	cheat3,
	cheat4,
	cheat5,
	cheat6,
	shabayev,

	--  integers
	a = 0,
	b = 0,
	c = 0,
	d = 0

   
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

	SetAutoGroupUnits(false)

	--  handles
	Mission.player = GetPlayerHandle()
	--pool1 = GetHandle("pool1")
	--pool2 = GetHandle("pool2")
	--pool3 = GetHandle("pool3")
	--pool4 = GetHandle("pool4")
	--pool5 = GetHandle("pool5")
	--pool6 = GetHandle("pool6")
	--play_pool1 = GetHandle("play_pool1")
	Mission.play_pool2 = GetHandle("play_pool2")
	Mission.recycler = GetHandle("recycler")
	Mission.srecycler = GetHandle("srecycler")
	Mission.forge = GetHandle("forge")
	Mission.overseer = GetHandle("overseer")
	Mission.dower = GetHandle("dower")
	Mission.stronghold = GetHandle("stronghold")
	Mission.bspir1 = nil
	Mission.bspir2 = nil
	Mission.spir1 = nil
	Mission.condor1 = GetHandle("condor1")
	Mission.condor2 = GetHandle("condor2")
	Mission.builder1 = nil
	Mission.builder2 = nil
	Mission.builder3 = nil
	Mission.builder4 = nil
	Mission.burns = GetHandle("burns")
	Mission.sscav1 = GetHandle("sscav1")
	Mission.sscav2 = GetHandle("sscav2")
	Mission.sscav3 = GetHandle("sscav3")
	Mission.sscav4 = GetHandle("sscav4")
	Mission.sscav5 = GetHandle("sscav5")
	Mission.sscav6 = nil
	Mission.carrier = GetHandle("carrier")
	Mission.nav1 = GetHandle("nav1")
	Mission.tug_nav = nil
	Mission.tbolt1 = GetHandle("tbolt1")
	Mission.tank1 = GetHandle("tank1")
	Mission.hauler1 = GetHandle("hauler1")
	Mission.spire1 = GetHandle("spire1")
	Mission.spire2 = GetHandle("spire2")
	Mission.spire3 = GetHandle("spire3")
	Mission.spire4 = GetHandle("spire4")
	Mission.road = GetHandle("road")
	Mission.cave = GetHandle("cave")
	Mission.factory = nil
	Mission.armory = nil
	Mission.guard1 = nil
	Mission.guard2 = nil
	Mission.guard3 = nil
	Mission.guard4 = nil
	Mission.sent1 = nil
	Mission.sent2 = nil
	Mission.sent3 = nil
	Mission.sent4 = nil
	Mission.war1 = nil
	Mission.war2 = nil
	Mission.war3 = nil
	Mission.war4 = nil
	Mission.lance1 = nil
	Mission.lance2 = nil
	Mission.lance3 = nil
	Mission.lance4 = nil
	Mission.scout1 = nil
	Mission.scout2 = nil
	Mission.scout3 = nil
	Mission.scout4 = nil
	Mission.maul1 = nil
	Mission.maul2 = nil
	Mission.maul3 = nil
	Mission.maul4 = nil
	Mission.titan1 = nil
	Mission.titan2 = nil
	Mission.titan3 = nil
	Mission.tugger = nil
	Mission.talk = nil
	Mission.talk2 = nil
	Mission.talk3 = nil
	Mission.gab = nil
	Mission.leader = nil
	Mission.scout_holder = nil
	Mission.tank_holder = nil
	Mission.player_holder = nil
	Mission.cheat1 = nil
	Mission.cheat2 = nil
	Mission.cheat3 = nil
	Mission.cheat4 = nil
	Mission.cheat5 = nil
	Mission.cheat6 = nil

	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	GiveWeapon(Mission.player,"gchainvsr_c")
	GiveWeapon(Mission.player,"gshadowvsr_c")
	GiveWeapon(Mission.player,"gproxminvsr")

	Mission.tbolt1 = UnitToVSR(Mission.tbolt1, "ivscout_vsr", 0)
	SetGroup(Mission.tbolt1,2)

	Mission.tank1 = UnitToVSR(Mission.tank1, "ivtank_vsr", 0)
	SetGroup(Mission.tank1,1)

	
	PreloadODF("fvtank14x")
   
end

function UnitToVSR(h, odf, player)

	PlayerTeam = GetTeamNum(h)
	xfrm = GetTransform(h)
	label = GetLabel(h)
	RemoveObject(h)
	h = BuildObject(odf, PlayerTeam, xfrm)

	if player == 1 then
	SetAsUser(h, PlayerTeam)
	else

	end

	SetLabel(h, label)

	return h

end

function PlayerEjected(h)

	temp = BuildObject("ivscout_vsr", 1, "attack_point1")
	SetAsUser(temp, 1)
	GiveWeapon(temp,"gchainvsr_c")
	GiveWeapon(temp,"gshadowvsr_c")
	GiveWeapon(temp,"gproxminvsr")

return 2

end

function AddObject(h) --This function is called when an object appears in the game. --

	if (Mission.start_done) then
	
		if ((not Mission.recy_building) and (IsOdf(h,"ibrecy_vsr"))) then
		
			Mission.recycler = h
			Mission.recy_building = true
		
		elseif ((not Mission.factory_built) and (IsOdf(h,"ibfact_vsr"))) then
		
			Mission.factory = h
			Mission.factory_built = true
		
		elseif ((not Mission.armory_built) and (IsOdf(h,"ibarmo_vsr"))) then
		
			Mission.armory = h
			Mission.armory_built = true
	

		--BUILDERS

		elseif ((not Mission.builder1_a) and (IsOdf(h,"fvcons_vsr"))) then
		
			Mission.builder1 = h
			Mission.build1_movetime = GetTime() + 3.0
			Mission.builder1_a = true
		
		elseif ((not Mission.builder2_a) and (IsOdf(h,"fvcons_vsr"))) then
		
			Mission.builder2 = h
			Mission.build2_movetime = GetTime() + 3.0
			Mission.builder2_a = true
		
		elseif ((not Mission.builder3_a) and (IsOdf(h,"fvcons_vsr"))) then
		
			Mission.builder3 = h
			Mission.build3_movetime = GetTime() + 3.0
			Mission.builder3_a = true
		
		elseif ((not Mission.builder4_a) and (IsOdf(h,"fvcons_vsr"))) then
		
			Mission.builder4 = h
			Mission.build4_movetime = GetTime() + 3.0
			Mission.builder4_a = true

		--THIS IS THE MAJIC TUG
		--elseif ((not Mission.hauler1_a) and (IsOdf(h,"fvtug"))) then --make this Mission.a special unsnipable tug odf then
		--
		--	Mission.hauler1 = h
		--	Mission.hauler_time = GetTime() + 3.0
		--	Mission.hauler1_a = true
		--end
		--[[
		--SCAVENGERS
		elseif ((not Mission.sscav1_a) and (IsOdf(h,"fvscav"))) then
		
		Mission.sscav1 = h
		Mission.sscav1_a = true
		
		elseif ((not Mission.sscav2_a) and (IsOdf(h,"fvscav"))) then
		
		Mission.sscav2 = h
		Mission.sscav2_a = true
		
		elseif ((not Mission.sscav3_a) and (IsOdf(h,"fvscav"))) then
		
		Mission.sscav3 = h
		Mission.sscav3_a = true
		
		elseif ((not Mission.sscav4_a) and (IsOdf(h,"fvscav"))) then
		
		Mission.sscav4 = h
		Mission.sscav4_a = true
		
		elseif ((not Mission.sscav5_a) and (IsOdf(h,"fvscav"))) then
		
		Mission.sscav5 = h
		Mission.sscav5_a = true
		end
		]]
		-- SCOUT
		elseif ((not Mission.scout1_a) and (IsOdf(h,"fvscout_vsr"))) then
		
			Mission.scout1 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.scout1,"gdeflect")
			end

			Mission.scout1_a = true
		
		elseif ((not Mission.scout2_a) and (IsOdf(h,"fvscout_vsr"))) then
		
			Mission.scout2 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.scout2,"gdeflect")
			end

			Mission.scout2_a = true
		
		elseif ((not Mission.scout3_a) and (IsOdf(h,"fvscout_vsr"))) then
		
			Mission.scout3 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.scout3,"gdeflect")
			end

			Mission.scout3_a = true
		
		elseif ((not Mission.scout4_a) and (IsOdf(h,"fvscout_vsr"))) then
		
			Mission.scout4 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.scout4,"gdeflect")
			end

			Mission.scout4_a = true

		-- GUARDIAN
		elseif ((not Mission.guard1_a) and (IsOdf(h,"fvturr_vsr"))) then
		
			Mission.guard1 = h
			Mission.guard1_a = true
		
		elseif ((not Mission.guard2_a) and (IsOdf(h,"fvturr_vsr"))) then
		
			Mission.guard2 = h
			Mission.guard2_a = true
		
		elseif ((not Mission.guard3_a) and (IsOdf(h,"fvturr_vsr"))) then
		
			Mission.guard3 = h
			Mission.guard3_a = true
		
		elseif ((not Mission.guard4_a) and (IsOdf(h,"fvturr_vsr"))) then
		
			Mission.guard4 = h
			Mission.guard4_a = true

		-- SENTRY
		elseif ((not Mission.sent1_a) and (IsOdf(h,"fvsent_vsr"))) then
		
			Mission.sent1 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.sent1,"gshield")
			end

			Mission.sent1_a = true
		
		elseif ((not Mission.sent2_a) and (IsOdf(h,"fvsent_vsr"))) then
		
			Mission.sent2 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.sent2,"gshield")
			end

			Mission.sent2_a = true
		
		elseif ((not Mission.sent3_a) and (IsOdf(h,"fvsent_vsr"))) then
		
			Mission.sent3 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.sent3,"gshield")
			end

			Mission.sent3_a = true
		
		elseif ((not Mission.sent4_a) and (IsOdf(h,"fvsent_vsr"))) then
		
			Mission.sent4 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.sent4,"gshield")
			end

			Mission.sent4_a = true

		-- WARRIOR
		elseif ((not Mission.war1_a) and (IsOdf(h,"fvtank_vsr"))) then
		
			Mission.war1 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.war1,"gabsorb")
			end

			Mission.war1_a = true
		
		elseif ((not Mission.war2_a) and (IsOdf(h,"fvtank_vsr"))) then
		
			Mission.war2 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.war2,"gabsorb")
			end

			Mission.war2_a = true
		
		elseif ((not Mission.war3_a) and (IsOdf(h,"fvtank_vsr"))) then
		
			Mission.war3 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.war3,"gabsorb")
			end

			Mission.war3_a = true
		
		elseif ((not Mission.war4_a) and (IsOdf(h,"fvtank_vsr"))) then
		
			Mission.war4 = h

			if (Mission.set_sheilds) then
			
				GiveWeapon(Mission.war4,"gabsorb")
			end

			Mission.war4_a = true

		-- LANCER
		elseif ((not Mission.lance1_a) and (IsOdf(h,"fvarch_vsr"))) then
		
			Mission.lance1 = h
			Mission.lance1_a = true
		
		elseif ((not Mission.lance2_a) and (IsOdf(h,"fvarch_vsr"))) then
		
			Mission.lance2 = h
			Mission.lance2_a = true
		
		elseif ((not Mission.lance3_a) and (IsOdf(h,"fvarch_vsr"))) then
		
			Mission.lance3 = h
			Mission.lance3_a = true
		
		elseif ((not Mission.lance4_a) and (IsOdf(h,"fvarch_vsr"))) then
		
			Mission.lance4 = h
			Mission.lance4_a = true

		-- TITANS
		elseif ((not Mission.titan1_a) and (IsOdf(h,"fvatank_vsr"))) then
		
			Mission.titan1 = h
			Mission.titan1_a = true
		
		elseif ((not Mission.titan2_a) and (IsOdf(h,"fvatank_vsr"))) then
		
			Mission.titan2 = h
			Mission.titan2_a = true
		
		elseif ((not Mission.titan3_a) and (IsOdf(h,"fvatank_vsr"))) then
		
			Mission.titan3 = h
			Mission.titan3_a = true

		-- MAULER
		elseif ((not Mission.maul1_a) and (IsOdf(h,"fvwalk_vsr"))) then
		
			Mission.maul1 = h
			Mission.maul1_a = true
		
		elseif ((not Mission.maul2_a) and (IsOdf(h,"fvwalk_vsr"))) then
		
			Mission.maul2 = h
			Mission.maul2_a = true
		
		elseif ((not Mission.maul3_a) and (IsOdf(h,"fvwalk_vsr"))) then
		
			Mission.maul3 = h
			Mission.maul3_a = true
		
		elseif ((not Mission.maul4_a) and (IsOdf(h,"fvwalk_vsr"))) then
		
			Mission.maul4 = h
			Mission.maul4_a = true
		end

	end
end


function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function HaveScav(void)

	Mission.a = CountUnitsNearObject(nil,99999.0,2,"fbscup")

	scavs = Mission.a

	not_enouph = false

	if (scavs < 4) then
	
		not_enouph = true
	
	else
	
		not_enouph = false
	end
	return not_enouph
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


	-- this is reseting the alive/dead bools

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

	if ((Mission.guard1_a) and (not IsAlive(Mission.guard1))) then
	
		Mission.guard1_a = false
	end
	if ((Mission.guard2_a) and (not IsAlive(Mission.guard2))) then
	
		Mission.guard2_a = false
	end
	if ((Mission.guard3_a) and (not IsAlive(Mission.guard3))) then
	
		Mission.guard3_a = false
	end
	if ((Mission.guard4_a) and (not IsAlive(Mission.guard4))) then
	
		Mission.guard4_a = false
	end

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
	
		Mission.sent4_a = false
	end

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

	if ((Mission.titan1_a) and (not IsAlive(Mission.titan1))) then
	
		Mission.titan1_a = false
	end
	if ((Mission.titan2_a) and (not IsAlive(Mission.titan2))) then
	
		Mission.titan2_a = false
	end
	if ((Mission.titan3_a) and (not IsAlive(Mission.titan3))) then
	
		Mission.titan3_a = false
	end

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


	if ((Mission.factory_built) and (not IsAround(Mission.factory))) then
	
		Mission.factory_built = false
	end

	if ((Mission.armory_built) and (not IsAround(Mission.armory))) then
	
		Mission.armory_built = false
	end
	--[[
	if ((Mission.sscav1_a) and (not IsAround(Mission.sscav1))) then
	
	Mission.sscav1 = BuildObject("fvscav",2,"scion_base")
	Mission.scav1_time = GetTime() + 2.0
	Mission.sscav1_a = false
	end
	if ((not Mission.sscav1_a) and (Mission.scav1_time < GetTime())) then
	
	if(IsAlive(Mission.sscav1))
	
	Goto(Mission.sscav1,"sscav1_point")
	Mission.scav1_time = GetTime() + 999999.9
	Mission.sscav1_a = true
	
	else
	
	Mission.scav1_time = GetTime() + 999999.9
	Mission.sscav1_a = true
	end
	end

	if ((Mission.sscav2_a) and (not IsAround(Mission.sscav2))) then
	
	Mission.sscav2 = BuildObject("fvscav",2,"scion_base")
	Mission.scav2_time = GetTime() + 2.0
	Mission.sscav2_a = false
	end
	if ((not Mission.sscav2_a) and (Mission.scav2_time < GetTime())) then
	
	if(IsAlive(Mission.sscav2))
	
	Goto(Mission.sscav2,"sscav2_point")
	Mission.scav2_time = GetTime() + 999999.9
	Mission.sscav2_a = true
	
	else
	
	Mission.scav2_time = GetTime() + 999999.9
	Mission.sscav2_a = true
	end
	end

	if ((Mission.sscav3_a) and (not IsAround(Mission.sscav3))) then
	
	Mission.sscav3 = BuildObject("fvscav",2,"scion_base")
	Mission.scav3_time = GetTime() + 2.0
	Mission.sscav3_a = false
	end
	if ((not Mission.sscav3_a) and (Mission.scav3_time < GetTime())) then
	
	if(IsAlive(Mission.sscav3))
	
	Goto(Mission.sscav3,"sscav3_point")
	Mission.scav3_time = GetTime() + 999999.9
	Mission.sscav3_a = true
	
	else
	
	Mission.scav3_time = GetTime() + 999999.9
	Mission.sscav3_a = true
	end
	end

	if ((Mission.sscav4_a) and (not IsAround(Mission.sscav4))) then
	
	Mission.sscav4 = BuildObject("fvscav",2,"scion_base")
	Mission.scav4_time = GetTime() + 2.0
	Mission.sscav4_a = false
	end
	if ((not Mission.sscav4_a) and (Mission.scav4_time < GetTime())) then
	
	if(IsAlive(Mission.sscav4))
	
	Goto(Mission.sscav4,"sscav4_point")
	Mission.scav4_time = GetTime() + 999999.9
	Mission.sscav4_a = true
	
	else
	
	Mission.scav4_time = GetTime() + 999999.9
	Mission.sscav4_a = true
	end
	end

	if ((Mission.sscav5_a) and (not IsAround(Mission.sscav5))) then
	
	Mission.sscav5 = BuildObject("fvscav",2,"scion_base")
	Mission.scav5_time = GetTime() + 2.0
	Mission.sscav5_a = false
	end
	if ((not Mission.sscav5_a) and (Mission.scav5_time < GetTime())) then
	
	if(IsAlive(Mission.sscav5))
	
	Goto(Mission.sscav5,"sscav5_point")
	Mission.scav5_time = GetTime() + 999999.9
	Mission.sscav5_a = true
	
	else
	
	Mission.scav5_time = GetTime() + 999999.9
	Mission.sscav5_a = true
	end
	end



	if (Mission.builder1_a) then
	
	if (not IsAlive(Mission.builder1)) then
	
	Mission.build1_movetime = GetTime() + 999999.9
	Mission.builder1_a = false
	end		

	if (Mission.build1_movetime < GetTime()) then
	
	Goto(Mission.builder1,"spire1_point",0)
	Mission.build1_movetime = GetTime() + 999999.9
	end
	end
	if (Mission.builder2_a) then
	
	if (not IsAlive(Mission.builder2)) then
	
	Mission.build2_movetime = GetTime() + 999999.9
	Mission.builder2_a = false
	end		

	if (Mission.build2_movetime < GetTime()) then
	
	Goto(Mission.builder2,"spire2_point",0)
	Mission.build2_movetime = GetTime() + 999999.9
	end
	end
	if (Mission.builder3_a) then
	
	if (not IsAlive(Mission.builder3)) then
	
	Mission.build3_movetime = GetTime() + 999999.9
	Mission.builder3_a = false
	end		

	if (Mission.build3_movetime < GetTime()) then
	
	Goto(Mission.builder3,"spire3_point",0)
	Mission.build3_movetime = GetTime() + 999999.9
	end
	end
	if (Mission.builder4_a) then
	
	if (not IsAlive(Mission.builder4)) then
	
	Mission.build4_movetime = GetTime() + 999999.9
	Mission.builder4_a = false
	end		

	if (Mission.build4_movetime < GetTime()) then
	
	Goto(Mission.builder4,"spire4_point",0)
	Mission.build4_movetime = GetTime() + 999999.9
	end
	end
	]]

	-- this cheats and builds the new tug

	if ((not Mission.hauler1_a) and (Mission.hauler_build_time < GetTime())) then
	
		Mission.hauler1 = BuildObject("fvtug14x",2,"scion_base")
		Mission.hauler_time = GetTime() + 30.0  -- changed from 3.0 GEC
		Mission.hauler_build_time = GetTime() + 999999.9
		Mission.hauler1_a = true
	end
	--------------------------------------------


	if (Mission.hauler1_a) then
	
		if (IsAlive(Mission.hauler1)) then
		
			if ((Mission.player_has_burns) and (not Mission.hauler_wait)) then
			
				Stop(Mission.hauler1)
				Mission.hauler_wait = true
			end
		
		elseif ((IsAround(Mission.hauler1))) then
		
			Damage(Mission.hauler1,2500)

			if (not Mission.first_time) then
			
				Mission.first_time = true
			end

			Mission.hauler_check = GetTime() + 999999.9
			Mission.hauler_wait = false
			Mission.scion_return = false
			Mission.hauler_near_base = false
			Mission.scion_has_burns = false
			Mission.hauler_go = false
			Mission.hauler_build_time = GetTime() + 60.0 -- 10 minutes
			Mission.hauler_time = GetTime() + 999999.9
			Mission.hauler1_a = false
		
		else
		
			if (not Mission.first_time) then
			
				Mission.first_time = true
			end

			Mission.hauler_check = GetTime() + 999999.9
			Mission.hauler_wait = false
			Mission.scion_return = false
			Mission.hauler_near_base = false
			Mission.scion_has_burns = false
			Mission.hauler_go = false
			Mission.hauler_build_time = GetTime() + 60.0 -- 10 minutes
			Mission.hauler_time = GetTime() + 999999.9
			Mission.hauler1_a = false
		end
	end
	--------------------------------------------


	--------------------------------------------------
	--[[
	if (not Mission.start_done) then
	
	shabayev = BuildObject("fvtank13",1,"end_point")
	Stop(shabayev)
	Mission.game_over_check = GetTime() + 2.0
	Mission.good = true
	Mission.decision_made = true
	Mission.start_done = true
	end
	]]

	if (not Mission.ON_HOLD) then
	
		--------------------------------------------------

		if (not Mission.start_done) then
		
			SetColorFade(1,0.5,Make_RGBA(0, 0, 0, 255))

			MaskEmitter(Mission.condor1, 0)
			MaskEmitter(Mission.condor2, 0)
			--SetTeamNum(Mission.burns,0)
			SetPerceivedTeam(Mission.burns,1)
			SetSkill(Mission.spire1,3)
			SetSkill(Mission.spire2,3)
			SetSkill(Mission.spire3,3)
			SetSkill(Mission.spire4,3)
			SetAvoidType(Mission.tank1,0)
			SetAvoidType(Mission.tbolt1,0)
			Mission.scout_holder = BuildObject("stayput",0,Mission.tbolt1)
			Mission.tank_holder = BuildObject("stayput",0,Mission.tank1)
			Mission.player_holder = BuildObject("stayput",0,Mission.player)
			SetAnimation(Mission.condor1,"deploy",1)
			SetAnimation(Mission.condor2,"deploy",1)
			Mission.open_time = GetTime() + 3.0
			Mission.start_done = true
		end
		--------------------------------------------


		-- this is making the condor 2 take off and freeing the Mission.player

		if ((not Mission.recycler_move) and (Mission.start_done) and (Mission.open_time < GetTime())) then
		
			StartSoundEffect("dropdoor.wav")
			RemoveObject(Mission.player_holder)
			--Goto(Mission.recycler,"recycler_point",0)
			Mission.recycler_move = true
		end
		--------------------------------------------


		-- this is when the Mission.player is clear of the ship

		if ((not Mission.player_clear) and (Mission.recycler_move)) then
		
			if (GetDistance(Mission.player,Mission.tank1) > 50.0) then
			
				RemoveObject(Mission.scout_holder)
				RemoveObject(Mission.tank_holder)
				Goto(Mission.tbolt1,"start_point",0)
				Goto(Mission.tank1,"start_point",0)
				SetAnimation(Mission.condor2,"takeoff",1)
				StartSoundEffect("dropleav.wav",Mission.condor2)
				Mission.condor2_engine = GetTime() + 3.0
				--RemoveObject(Mission.condor2)
				Mission.condor2_time = GetTime() + 10.0
				Mission.player_clear = true
			end
		end
		--------------------------------------------


		-- this is making the condor take off

		if (not Mission.condors_away) then
		
			if (not Mission.condor_clear) then
			
				Mission.a = GetDistance(Mission.player,Mission.condor1);
				Mission.b = GetDistance(Mission.tank1,Mission.condor1);
				Mission.c = GetDistance(Mission.tbolt1,Mission.condor1);


				if ((Mission.a > 40) and (Mission.b > 30) and (Mission.c > 30)) then
				
					Mission.condor_clear = true
				end
			end
			--------------------------------------------


			-- this make the condors take off

			if ((Mission.condor_clear) and (not Mission.condors_away)) then
			
				Mission.gab = AudioMessage("isdf1401.wav")--(brad) Briefing Get to the crash as soon as possible

				ClearObjectives()
				AddObjective("isdf1401.otf", "WHITE")
				SetAnimation(Mission.condor1,"takeoff",1)
				StartSoundEffect("dropleav.wav",Mission.condor1)
				Mission.condor1_engine = GetTime() + 3.0
				--RemoveObject(Mission.condor1)
				Mission.condor1_time = GetTime() + 10.0
				Mission.condors_away = true

			end
		end
		--------------------------------------------


		-- this starts condor engins

		if (Mission.condor1_engine < GetTime()) then
		
			StartEmitter(Mission.condor1, 1)
			StartEmitter(Mission.condor1, 2)
			Mission.condor1_engine = GetTime() + 999999.9
		end

		if (Mission.condor2_engine < GetTime()) then
		
			StartEmitter(Mission.condor2, 1)
			StartEmitter(Mission.condor2, 2)
			Mission.condor2_engine = GetTime() + 999999.9
		end
		--------------------------------------------


		-- this gets rid of the condors

		if ((not Mission.condor2_gone) and (Mission.condor2_time < GetTime())) then
		
			RemoveObject(Mission.condor2)
			Mission.condor2_gone = true
		end

		if ((not Mission.condor1_gone) and (Mission.condor1_time < GetTime())) then
		
			RemoveObject(Mission.condor1)
			Mission.condor1_gone = true
		end
		--------------------------------------------


		if (not Mission.start_done2) then
		
			AddScrap(1,40)
			Ally(3,1)
			AddScrap(2,40)
			SetObjectiveOn(Mission.nav1)
			tempstr = TranslateString("Mission1401")  -- Crash Site
			SetObjectiveName(Mission.nav1,tempstr)
			Mission.crash_check = GetTime() + 2.0
			Mission.warning1_time = GetTime() + 330.0 -- may be too short -- I added 30 sec GEC
			SetAIP("isdf1401.aip",2)
			Mission.start_done2 = true
		end
		--------------------------------------------


		-- This is checking to see if the recycyer is deployed or not then

		if (Mission.recy_building) then
		
			if (IsAround(Mission.recycler)) then
			
				if (IsOdf(Mission.recycler,"ivrecy_vsr")) then
				
					Mission.recy_building = false
				end
			end
		end
		--------------------------------------------


		-- this sets Mission.burns health every frame

		if ((IsAround(Mission.burns)) and (GetCurHealth(Mission.burns) < 1000)) then
		
			SetCurHealth(Mission.burns,1000)
		end
		--------------------------------------------


		-- first time the Mission.recycler is deployed

		if ((not Mission.first_deploy) and (Mission.recy_building)) then
			
			Mission.first_deploy = true
		end
		--------------------------------------------


		-- this warns the Mission.player for the first time

		if (not Mission.near_crash) then
		
			if ((not Mission.first_warning) and (Mission.warning1_time < GetTime())) then
			
				Mission.gab = AudioMessage("isdf1402.wav")--(brad) We're detecting activity at the crash site = check it out IMMEDIATELYnot 
				ClearObjectives()
				AddObjective("isdf1401.otf", "WHITE")			
				Mission.warning1_time = GetTime() + 999999.9
				Mission.warning2_time = GetTime() + 330.0  -- was 300 GEC
				Mission.first_warning = true
			end


			if ((Mission.first_warning) and (not Mission.second_warning) and (Mission.warning2_time < GetTime())) then
			
				Mission.gab = AudioMessage("isdf1403.wav")--(brad) the hauler is making Mission.a break for itnot 
				ClearObjectives()
				AddObjective("isdf1401.otf", "RED")
				Mission.warning2_time = GetTime() + 999999.9
				Mission.second_warning = true
			end
		end
		--------------------------------------------


		-- this is telling me when the Mission.player is at the crash site

		if ((not Mission.near_crash) and (Mission.crash_check < GetTime())) then
		
			Mission.crash_check = GetTime() + 2.0


			if (GetDistance(Mission.player,Mission.nav1) < 200.0) then
			
				Mission.near_crash = true
			end
		end
		--------------------------------------------


		-- this is what happens when the Mission.player gets near the crash

		if ((Mission.near_crash) and (not Mission.hauler_found)) then
		
			if (Mission.second_warning) then
			
				if (not Mission.search_message) then
				
					BuildObject("fvscav_vsr",2,"spawn4")
					StopAudioMessage(Mission.gab)
					SetObjectiveOff(Mission.nav1)
					SetObjectiveOn(Mission.hauler1)
					AudioMessage("isdf1404.wav")--(brad) Stop that hauler at all costsnot 
					ClearObjectives()
					AddObjective("isdf1401.otf", "RED")
					AddObjective("isdf1402.otf", "WHITE")
					Mission.hauler_found = true
					Mission.search_message = true
				end
			
			elseif (not Mission.search_message) then
			
				StopAudioMessage(Mission.gab)
				SetObjectiveOff(Mission.nav1)
				ClearObjectives()
				AddObjective("isdf1401.otf", "GREEN")
				Mission.gab = AudioMessage("isdf1405.wav")--(brad) Search for survivors
				Mission.search_message = true
			end
		end
		--------------------------------------------


		-- this makes the hauler move out for the first time

		if (not Mission.done) then
		
			if ((Mission.second_warning) or (Mission.near_crash)) then
			
				Pickup(Mission.hauler1,Mission.burns)
				--Follow(Mission.sscav5,Mission.hauler1)
				Mission.find_hauler_check = GetTime() + 1.0
				Mission.hauler_go = true
				Mission.done = true
			end
		end
		--------------------------------------------


		-- this is when the the Mission.player first finds the hauler

		if ((Mission.hauler_go) and (not Mission.hauler_found) and (Mission.find_hauler_check < GetTime())) then
		
			Mission.find_hauler_check = GetTime() + 1.0


			if (GetDistance(Mission.player,Mission.hauler1) < 110.0) then
			
				StopAudioMessage(Mission.gab)
				SetObjectiveOn(Mission.hauler1)
				ClearObjectives()
				AddObjective("isdf1401.otf", "GREEN")
				AddObjective("isdf1402.otf", "WHITE")
				AudioMessage("isdf1404.wav")--(brad) Stop that hauler at all costsnot 
				Mission.scion_has_burns = true
				Mission.hauler_found = true
			end
		end
		--------------------------------------------


		if (Mission.condors_away) then
		
			-- this sends the scion hauler to Mission.burns after the first time

			if ((Mission.done) and (Mission.hauler_time < GetTime())) then
			
				if ((not Mission.hauler_go) and (Mission.hauler1_a) and (Mission.burns_free)) then
				
					if (IsAround(Mission.burns)) then
					
						Pickup(Mission.hauler1,Mission.burns)
						--SetAIP("isdf1403.aip",2)
						Mission.hauler_go = true
					end
				end
			end
			--------------------------------------------


			-- this is what happens when the Mission.player has Mission.burns and is on his way home


			-- first I have to see when he has Mission.burns

			if (not Mission.tug_wait) then
			
				if ((Mission.burns_free) and (IsAround(Mission.burns))) then
				
					Mission.tugger = GetTug(Mission.burns)

					if (Mission.tugger ~= nil) then
					
						if (GetTeamNum(Mission.tugger) == 1) then
						
							Mission.lava_check = GetTime() + 2.0
							Mission.player_has_burns = true
							Mission.scion_has_burns = false
							Mission.burns_free = false
						
						elseif (GetTeamNum(Mission.tugger) == 2) then
						
							Mission.player_has_burns = false
							Mission.scion_has_burns = true
							Mission.burns_free = false
						end
					end
				end
			end
			--------------------------------------------


			-- This is if the Mission.player has Mission.burns then

			if (Mission.player_has_burns) then
			
				if (not Mission.player_return) then
				
					Mission.tugger_check = GetTime() + 1.0
					Mission.player_return = true
				end
			end
			--------------------------------------------


			-- this is if Mission.burns is not being tugged then

			if (not Mission.burns_free) then
			
				Mission.tugger = GetTug(Mission.burns)

				if (Mission.tugger == nil) then
				
					Mission.hauler_check = GetTime() + 999999.9
					Mission.tugger_check = GetTime() + 999999.9
					Mission.lava_check = GetTime() + 999999.9
					Mission.hauler_wait = false
					Mission.scion_return = false
					Mission.hauler_near_base = false
					Mission.player_has_burns = false
					Mission.player_return = false
					Mission.scion_has_burns = false
					Mission.hauler_go = false
					Mission.burns_free = true
				end
			end
			--------------------------------------------


			-- this is when the Mission.player destoys the hauler for the first time

			if (Mission.first_time) then
			
				if (not Mission.burns_comment1) then
				
					ClearObjectives()
					AddObjective("isdf1402.otf", "GREEN")
					AddObjective("isdf1403.otf", "WHITE")
					SetObjectiveOn(Mission.burns)
					tempstr = TranslateString("Mission1402")  -- Scion Creature 
					SetObjectiveName(Mission.burns,tempstr)
					SetAIP("isdf1402.aip",2)
					AudioMessage("isdf1406.wav")--(brad)Get that creature back to your base
					Mission.scav_check = GetTime() + 600.0
					Mission.burns_comment1 = true
				end
			end


			-- this is if the Mission.player gets into Mission.a tug then

			if ((not Mission.player_in_tug) and (IsOdf(Mission.player,"ivtug"))) then
			
				Mission.player_in_tug = true
			end
			if ((Mission.player_in_tug) and (not IsOdf(Mission.player,"ivtug"))) then
			
				Mission.player_in_tug = false
			end
			--------------------------------------------


			-- this is if the Mission.player takes Mission.burns over the lava then

			if ((not Mission.firey_death) and (Mission.player_has_burns) and (Mission.lava_check < GetTime())) then
			
				Mission.lava_check = GetTime() + 2.0

				if (GetDistance(Mission.tugger,"lava_point1") < 200.0) then
				
					Mission.firey_death = true
				end

				if ((not Mission.firey_death) and (GetDistance(Mission.tugger,"lava_point2") < 200.0)) then
				
					Mission.firey_death = true
				end

				if ((not Mission.firey_death) and (GetDistance(Mission.tugger,"lava_point3") < 200.0)) then
				
					Mission.firey_death = true
				end

				if ((not Mission.firey_death) and (GetDistance(Mission.tugger,"lava_point4") < 200.0)) then
				
					Mission.firey_death = true
				end
			end
			--------------------------------------------


			-- This is if the Scions have Mission.burns then

			if ((not Mission.burns_recovered) and (Mission.scion_has_burns)) then
			
				if (not Mission.scion_return) then
				
					if ((Mission.first_time) and (GetDistance(Mission.player,Mission.hauler1) > 100.0)) then
					
						AudioMessage("isdf1422.wav")--(brad) the scions have the creature againnot 
					end

					Goto(Mission.hauler1,"scion_base")
					Mission.hauler_check = GetTime() + 3.0
					Mission.scion_return = true
				end


				if ((Mission.scion_return) and (not Mission.hauler_near_base) and (Mission.hauler_check < GetTime())) then
				
					Mission.hauler_check = GetTime() + 3.0


					if (GetDistance(Mission.hauler1,"hauler_check1") < 50.0) then
					
						Mission.hauler_check = GetTime() + 2.0
						Mission.hauler_near_base = true
					end
				end


				if ((Mission.hauler_near_base) and (not Mission.burns_recovered) and (Mission.hauler_check < GetTime())) then
				
					Mission.hauler_check = GetTime() + 2.0


					if (GetDistance(Mission.hauler1,Mission.srecycler) < 40.0) then
					
						Mission.burns_recovered = true
					end
				end
			end
			--------------------------------------------


			-- I need to know where the Mission.player's Mission.recycler is

			if (Mission.first_deploy) then
			
				if ((Mission.recycler_deployed) and (IsOdf(Mission.recycler,"ivrecy_vsr"))) then
				
					Mission.recycler_check = GetTime() + 3.0
					Mission.recycler_deployed = false
				end
				if ((not Mission.recycler_deployed) and (IsOdf(Mission.recycler,"ibrecy_vsr"))) then
				
					Mission.recycler_check = GetTime() + 999999.9
					Mission.recycler_deployed = true
				end


				if ((not Mission.recycler_deployed) and (not Mission.recycler_moved) and (Mission.recycler_check < GetTime())) then
				
					Mission.recycler_check = GetTime() + 3.0


					if (GetDistance(Mission.recycler,"shab_check1") < 70.0) then
					
						Mission.recycler_moved = true
					end

					if (GetDistance(Mission.recycler,"shab_check2") < 70.0) then
					
						Mission.recycler_moved = true
					end
				end
			end
			--------------------------------------------


			if (not Mission.recycler_moved) then
			
				PrintConsoleMessage("not moved shab check")
				PrintConsoleMessage(tostring(Mission.player_return))
				PrintConsoleMessage(tostring(Mission.shab_encounter))
				PrintConsoleMessage(tostring(Mission.tugger_check))
				PrintConsoleMessage(tostring(GetTime()))
				PrintConsoleMessage("")
				if ((Mission.player_return) and (not Mission.shab_encounter) and (Mission.tugger_check < GetTime())) then
				
					Mission.tugger_check = GetTime() + 1.0

					if (GetDistance(Mission.burns,"shab_check1") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check2") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check3") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check4") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check5") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check6") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_checknew") < 80.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,Mission.recycler) < 200.0) then
					
						Mission.shab_encounter = true
					end
				end
			
			elseif (Mission.recycler_moved) then
			PrintConsoleMessage("moved shab check")
				if ((Mission.player_return) and (not Mission.shab_encounter) and (Mission.tugger_check < GetTime())) then
				
					Mission.tugger_check = GetTime() + 1.0

					if (GetDistance(Mission.burns,"shab_check1") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check2") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check3") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check4") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check5") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,"shab_check6") < 70.0) then
					
						Mission.shab_encounter = true
					end

					if (GetDistance(Mission.burns,Mission.recycler) < 200.0) then
					
						Mission.shab_encounter = true
					end
				end
			end
			--------------------------------------------


			-- this is the shab encouter

			if (Mission.shab_encounter) then
			
				-- this is when shab first tell John to stop

				if (not Mission.stop_john) then
				
					Ally(2,1)
					SetAIP("isdf1403.aip",2)

					Mission.shabayev = BuildObject("fvtank",1,"end_point")
					Follow(Mission.shabayev,Mission.player,1)

					Mission.talk = AudioMessage("isdf1407.wav")--(shab) John Stopnot 
					Mission.encouter_check = GetTime() + 1.0
					Mission.tug_wait = true
					Mission.stop_john = true
				end
				--------------------------------------------


				if ((Mission.stop_john) and (not Mission.shab_meeting)) then
				
					if (GetCurHealth(Mission.shabayev) < 2000) then
					
						SetCurHealth(Mission.shabayev,2000)
					end
				end


				-- this keeps the tug alive briefly

				if ((IsAlive(Mission.tugger)) and (not Mission.make_decision)) then
				
					if (GetCurHealth(Mission.tugger) < 500) then
					
						SetCurHealth(Mission.tugger,500)
					end
				end
				--------------------------------------------


				-- this is radio chatter when the ships stop fighting

				if (not Mission.shab_meeting) then
				
					if ((Mission.stop_john) and (not Mission.encounter_message1) and (IsAudioMessageDone(Mission.talk))) then
					
						Mission.talk = AudioMessage("isdf1408.wav")--(Mission.recycler) Ah, commander they've stopped fightingnot 
						Mission.encounter_message1 = true
					end

					if ((Mission.encounter_message1) and (not Mission.encounter_message2) and (IsAudioMessageDone(Mission.talk))) then
					
						Mission.talk = AudioMessage("isdf1409.wav")--(shab) stop John - its me Yelena, I'm on my way to younot 
						SetObjectiveOn(Mission.shabayev)
						SetObjectiveName(Mission.shabayev,"Yelena")			
						Mission.encounter_message2 = true
					end
				end
				--------------------------------------------


				-- this is when shab and John finally get together

				if ((Mission.stop_john) and (not Mission.shab_meeting) and (Mission.encouter_check < GetTime())) then
				
					Mission.encouter_check = GetTime() + 1.0


					if (GetDistance(Mission.shabayev,Mission.player) < 70.0) then
					
						StopAudioMessage(Mission.talk)
						LookAt(Mission.shabayev,Mission.player)
						--SetObjectiveOn(shabayev)
						--SetObjectiveName(shabayev,"Yelena")
						Mission.talk2 = AudioMessage("isdf1410.wav")-- (shab) *long speach*
						Mission.shab_meeting = true
					end
				end
				--------------------------------------------


				if (Mission.shab_meeting) then
				
					if ((not Mission.meeting_message1) and (IsAudioMessageDone(Mission.talk2))) then
					
						Mission.talk2 = AudioMessage("isdf1411.wav")-- (brad) *This is Mission.a tricknot *
						Mission.meeting_message1 = true
					end

					if ((not Mission.meeting_message2) and (Mission.meeting_message1) and (IsAudioMessageDone(Mission.talk2))) then
					
						Mission.talk2 = AudioMessage("isdf1412.wav")-- (shab) you have to beleive menot 
						Mission.meeting_message2 = true
					end


					-- I need to know who the tug is

					if ((Mission.meeting_message2) and (not Mission.tug_determination)) then
					
						if (IsAround(Mission.tugger)) then
						
							if (IsAlive(Mission.tugger)) then
							
								if (Mission.tugger == Mission.player) then
								
									Mission.tug_is_player = true
								
								else
								
									Mission.tug_is_player = false
								end
							
							else
							
								Mission.tug_is_player = true
							end
						
						else
						
							Mission.no_tugger = true
						end

						Mission.tug_determination = true
					end
					--------------------------------------------


					-- this is shab giving John his choices

					if ((Mission.tug_determination) and (not Mission.make_decision)  and (IsAudioMessageDone(Mission.talk2))) then
					
						--Mission.tug_nav = BuildObject("apcamr",1,"end_point")

						--if (Mission.no_tugger) then
						--
						--	Mission.talk2 = AudioMessage("wohoo.wav")--(shab) build Mission.a tug and tell it to follow me
						--end
						if (Mission.tug_is_player) then
						

							pos = GetPosition(Mission.shabayev)
							RemoveObject(Mission.shabayev)
							Mission.shabayev = BuildObject("fvtank14x",0,pos)
							SetObjectiveOn(Mission.shabayev)
							SetObjectiveName(Mission.shabayev,"Yelena")

							Retreat(Mission.shabayev,"end_point")
							Mission.end_check = GetTime() + 1.0
							Mission.talk2 = AudioMessage("isdf1413.wav")--(shab) follow me
							Mission.was_in = true
						
						elseif (not Mission.tug_is_player) then
						
							Mission.talk2 = AudioMessage("isdf1414.wav")--(shab) tell your tug to follow me
						end

						Mission.make_decision = true
					end
					--------------------------------------------
				end


				-- this is checking to see when the Mission.player makes his choice

				if (Mission.make_decision) then
				
					-- this is braddock getting angry makes

					if ((not Mission.brad_mad) and (IsAudioMessageDone(Mission.talk2))) then
					
						if (not Mission.tug_is_player) then
						
							Mission.talk2 = AudioMessage("isdf1415.wav")--(brad) destroy her nownot not not 
						
						else
						
							Mission.talk2 = AudioMessage("isdf1416.wav")--(brad) get that relic to the recyclernot not not 
						end

						Mission.brad_mad = true
					end
					--------------------------------------------

					--[[
					-- this is if the Mission.player gets in the tug while waiting for the desicion then

					if (not Mission.decision_made) then
					
					if ((not Mission.tug_is_player) and (IsAround(Mission.tugger)) and (not IsAlive(Mission.tugger))) then
					
					AudioMessage("isdf1417.wav")--(shab) If you want to pilot the craft yourself follow me
					Goto(shabayev,"end_point")
					Mission.end_check = GetTime() + 1.0
					Mission.tug_is_player = true

					end
					end
					--------------------------------------------
					]]

					-- this is the Mission.player making his choice

					if (not Mission.decision_made) then
					
						if (not Mission.was_in) then
						
							if (not IsAlive(Mission.shabayev)) then
							
								AudioMessage("isdf1418.wav")--(brad) well Mission.done now get Mission.burns to the Mission.recycler
								UnAlly(2,1)
								Mission.game_over_check = GetTime() + 2.0
								Mission.evil = true
								Mission.tug_wait = false
								Mission.decision_made = true
							end

							if (GetCurrentCommand(Mission.tugger) == 5) then
							
								Mission.leader = GetCurrentWho(Mission.tugger)

								if ((IsAround(Mission.shabayev)) and (Mission.leader == Mission.shabayev)) then
								
									AllLookAt(1,Mission.player,1)

									if (IsAround(Mission.recycler)) then
									
										pos = GetPosition(Mission.recycler)
										RemoveObject(Mission.recycler)
										Mission.recycler = BuildObject("ibrecy_vsr",0,pos)
									end

									if (Mission.factory_built) then
									
										pos = GetPosition(Mission.factory)
										RemoveObject(Mission.factory)
										Mission.factory = BuildObject("ibfact_vsr",0,pos)
									end

									if (Mission.armory_built) then
									
										pos = GetPosition(Mission.armory)
										RemoveObject(Mission.armory)
										Mission.armory = BuildObject("ibarmo_vsr",0,pos)
									end

									pos = GetPosition(Mission.shabayev)
									RemoveObject(Mission.shabayev)
									Mission.shabayev = BuildObject("fvtank14x",0,pos)
									SetObjectiveOn(Mission.shabayev)
									SetObjectiveName(Mission.shabayev,"Yelena")

									Follow(Mission.tugger,Mission.shabayev,1)
									StopAudioMessage(Mission.talk2)
									Mission.talk3 = AudioMessage("isdf1419.wav")--(shab) goodnot  Follow menot 
									Retreat(Mission.shabayev,"shabayev_tug")
									Mission.end_check = GetTime() + 1.0
									Mission.game_over_check = GetTime() + 2.0
									SetTeamNum(Mission.player,3)
									Ally(1,2)
									Ally(1,3)
									Ally(2,3)
									Mission.good = true
									Mission.tug_wait = false
									Mission.decision_made = true
								end
							end
						
						elseif (Mission.was_in) then
						
							if (Mission.end_check < GetTime()) then
							
								Mission.end_check = GetTime() + 1.0


								if ((not Mission.shab_look) and (GetDistance(Mission.shabayev,"end_point") < 40.0)) then
								
									LookAt(Mission.shabayev,Mission.player)
									Mission.shab_look = true
								end

								if (Mission.shab_look) then
								
									if (GetDistance(Mission.shabayev,Mission.player) < 50.0) then
									
										AllLookAt(1,Mission.player,1)

										if (IsAround(Mission.recycler)) then
										
											pos = GetPosition(Mission.recycler)
											RemoveObject(Mission.recycler)
											Mission.recycler = BuildObject("ibrecy_vsr",0,pos)
										end

										if (Mission.factory_built) then
										
											pos = GetPosition(Mission.factory)
											RemoveObject(Mission.factory)
											Mission.factory = BuildObject("ibfact_vsr",0,pos)
										end

										if (Mission.armory_built) then
										
											pos = GetPosition(Mission.armory)
											RemoveObject(Mission.armory)
											Mission.armory = BuildObject("ibarmo_vsr",0,pos)
										end


										StopAudioMessage(Mission.talk2)
										Mission.talk3 = AudioMessage("isdf1419.wav")--(shab) goodnot  Follow menot 
										SetTeamNum(Mission.player,3)
										Ally(1,2)
										Ally(1,3)
										Ally(2,3)
										Mission.game_over_check = GetTime() + 2.0
										Mission.good = true
										Mission.tug_wait = false
										Mission.decision_made = true
									end


									if (GetDistance(Mission.burns,Mission.recycler) < 100.0) then
									
										AudioMessage("isdf1418.wav")--(brad) well Mission.done 
										SucceedMission(GetTime() + 10.0,"isdf14w1.txt")
										Mission.game_over = true
										Mission.evil = true
										Mission.decision_made = true
									end
								end
							end
						end
						--elseif (Mission.no_tugger) then
						--
						--Mission.decision_made = true
						--end
					end
					--------------------------------------------
				end
				--------------------------------------------
			end
			--------------------------------------------


			-- this is after the decision

			if ((Mission.decision_made) and (Mission.good)) then
			
				if (IsAround(Mission.shabayev)) then
				
					if (GetCurHealth(Mission.shabayev) < 2000) then
					
						SetCurHealth(Mission.shabayev,2000)
					end
				end
			end
			--------------------------------------------


			-- this is reseting the aip

			if ((not Mission.last_aip) and (Mission.scav_check < GetTime())) then
			
				Mission.scav_check = GetTime() + 300.0
				--Mission.set_sheilds = true

				if (HaveScav()) then
				
					SetAIP("isdf1404.aip",2)
					Mission.set_sheilds = true
					Mission.last_aip = true
				end
			end
			--------------------------------------------


		end

		-- this is the descions being made

		if (not Mission.was_in) then
		
			if ((Mission.decision_made) and (Mission.game_over_check < GetTime())) then
			
				Mission.game_over_check = GetTime() + 2.0
				if ((not Mission.tug_on_the_way) and (GetDistance(Mission.shabayev,"shabayev_tug")<100.0)) then
				
					Mission.tug_on_the_way = true
					Retreat(Mission.shabayev,"end_point")
				end


				if (Mission.good) then
				
					if ((GetDistance(Mission.shabayev,"end_point") < 40.0) and
						(GetDistance(Mission.player,Mission.shabayev) < 30.0)) then
					
						Mission.start_movie = true
						Mission.game_over = true
					end
				
				elseif ((not Mission.game_over) and -- to prevent endless loop then
					(Mission.evil) and (GetDistance(Mission.player,Mission.recycler) < 200.0)) then
				
					SucceedMission(GetTime() + 10.0,"isdf14w1.txt")
					-- You are ISDF
					Mission.game_over = true
				end
			end
		end
		--------------------------------------------


		-- this is the last movie

		if (Mission.start_movie) then
		
			-- this raises the Mission.road

			if (not Mission.raise_road) then
			
				SetAnimation(Mission.road,"raise",1)
				StartEarthQuake(5.0)
				Mission.road_time = GetTime() + 5.0
				Mission.raise_road = true
			end


			-- this sends shab down the new Mission.road

			if ((not Mission.go_to_cave) and (Mission.raise_road) and (Mission.road_time < GetTime())) then
			
				Goto(Mission.shabayev,"road_path")
				StopEarthQuake()
				Mission.road_time = GetTime() + 2.0
				Mission.go_to_cave = true
			end


			-- this is when shab gets there

			if ((not Mission.shab_at_cave) and (Mission.go_to_cave) and (Mission.road_time < GetTime())) then
			
				if (GetCurrentCommand(Mission.shabayev) == 0) then
				
					LookAt(Mission.shabayev,Mission.player)
					Mission.shab_at_cave = true
				end
			end


			-- this raises the Mission.cave

			if ((not Mission.raise_cave) and (Mission.shab_at_cave)) then
			
				if (GetDistance(Mission.player,Mission.shabayev) < 30.0) then
				
					LookAt(Mission.shabayev,Mission.cave)
					SetAnimation(Mission.cave,"open",1)
					StartEarthQuake(5.0)
					Mission.road_time = GetTime() + 5.0
					Mission.raise_cave = true
				end
			end


			-- this sends shab into the Mission.cave

			if ((not Mission.shab_into_cave) and (Mission.raise_cave) and (Mission.road_time < GetTime())) then
			
				Goto(Mission.shabayev,"into_cave_path")
				SucceedMission(GetTime() + 6.0,"isdf14w2.txt")
				-- you are Scion
				ChangeSide()
				Mission.game_over = true
				--Mission.road_time = GetTime() + 5.0
				Mission.shab_into_cave = true
			end
		end

		if (not Mission.game_over) then
		
			-- this is if the Mission.recycler gets killed then

			if (not IsAround(Mission.recycler)) then
			
				FailMission(GetTime() + 10.0)
				--AudioMessage("wohoo.wav")--(brad) you've allowed your Mission.recycler to get killed
				Mission.game_over = true
			end
			--------------------------------------------

			-- this is if the scions capture Mission.burns then

			if (Mission.burns_recovered) then
			
				FailMission(GetTime() + 10.0)
				AudioMessage("isdf1420.wav")--(brad) you've allowed Mission.burns to get captured
				Mission.game_over = true
			end
			--------------------------------------------

			-- this is if the Mission.player goes over the lave with Mission.burns then

			if (Mission.firey_death) then
			
				FailMission(GetTime() + 10.0)
				AudioMessage("isdf1421.wav")--(brad) you've allowed Mission.burns to get Mission.burns
				Mission.game_over = true
			end
			--------------------------------------------
		end

		--------------------------------------------------
	end
	--------------------------------------------------
 	
end