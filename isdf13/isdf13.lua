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
	start_done = false,
	hell = false,
	game_over = false,
	at_recycler = false,
	builder1_a = true,
	sscav1_a = true,
	sscav2_a = true,
	sscav3_a = true,
	sscav4_a = true,
	sscav5_a = true,
	scav1_to_pool = false,
	scav1_at_pool = false,
	scav1_deployed = false,
	scav2_to_pool = true,
	scav2_at_pool = true,
	scav2_deployed = true,
	scav3_to_pool = true,
	scav3_at_pool = true,
	scav3_deployed = true,
	scav4_to_pool = true,
	scav4_at_pool = true,
	scav4_deployed = true,
	burns_move = false,
	burns_at_condor = false,
	burns_in_condor = false,
	guard1_a = false,
	guard2_a = false,
	guard3_a = false,
	guard4_a = false,
	guard1_sent = false,
	guard2_sent = false,
	guard3_sent = false,
	guards_sent = false,
	guard1_deployed = false,
	guard2_deployed = false,
	guard3_deployed = false,
	part_two = false,
	brad_message1 = false,
	honest_warning = false,
	pilot_talk1 = false,
	pilot_talk2 = false,
	pilot_talk3 = false,
	carrier_dead = false,
	confussion = false,
	panic_message1 = false,
	panic_message2 = false,
	panic_message3 = false,
	brad_message2 = false,
	brad_message3 = false,
	brad_message4 = false,
	sent1_a = true, 
	sent2_a = true, 
	sent3_a = false, 
	sent4_a = false,
	war1_a = true, 
	war2_a = false, 
	war3_a = false, 
	war4_a = false,
	scout1_a = false, 
	scout2_a = false, 
	scout3_a = false, 
	scout4_a = false, 
	lance1_a = false, 
	lance2_a = false, 
	lance3_a = false, 
	lance4_a = false,
	maul1_a = false, 
	maul2_a = false, 
	maul3_a = false, 
	maul4_a = false,
	titan1_a = false, 
	titan2_a = false, 
	titan3_a = false,
	war_look1 = false,
	war_look2 = false,
	war_look3 = false,
	at_player = false,
	at_manson = false,
	at_2 = false,
	set_scrap = false,
	sent1_to_recy = false,
	sent2_to_recy = false,
	war1_to_recy = false,
	war2_to_recy = false,
	plan_change1 = false,
	recycler_deployed = false,
	titan1_move = false,
	remove_burns = false,
	titan_attack = false,
	titan_plan = false,
	send_scouts = false,
	titan_dead = false,
	update_quake = false,
	titan_sent = false,
	movie_over = false,
	first_frame = false,
	new_plan = false,
	titan_look = false,
	main_explosion = false,
	explode = false,


--  floats
	hell_time = 999999.9,
	recycler_check = 999999.9,
	scav1_check = 999999.9,
	scav2_check = 999999.9,
	scav3_check = 999999.9,
	scav4_check = 999999.9,
	burns_check = 999999.9,
	move_burns_time = 999999.9,
	guards_check = 999999.9,
	honest_check = 999999.9,
	parade_check = 999999.9,
	panic_time = 999999.9,
	escape_check = 999999.9,
	carrier_time = 999999.9,
	war1_check = 999999.9,
	set_scrap_time = 999999.9,
	titan_attack_time = 999999.9,
	plan_check = 999999.9,
	quake_time = 999999.9,
	titan_time = 999999.9,
	movie_time = 999999.9,
	titan_look_time = 999999.9,
	explosion_time = 999999.9,

--  handles
	player_ship,
	player,
	burns,
	recycler,
	forge,
	overseer,
	dower,
	stronghold,
	bigass_building,
	srecycler,
	sscav1,
	sscav2,
	sscav3,
	sscav4,
	sscav5,
	spire2,
	spire3,
	spire4,
	pool1,
	pool2,
	pool3,
	manson,
	tank2,
	--rocket1,
	--walker1,
	--walker2,
	burns_condor,
	key_device,
	first_titan1,
	first_titan2,
	builder1,
	show1,
	show2,
	tugger,
	nav1,
	nav2,
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
	titan1,
	titan2,
	titan3,
	guard1,
	guard2,
	guard3,
	guard4,
	guarda,
	guardb,
	--base_pool1,
	--base_pool2,
	--base_pool3,
	talk,
	talk2,
	temp,
	kick,
	kick1,
	kick2,
	carrier,
	walker1,
	walker2

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
	Mission.player_ship = GetHandle("player_ship")
	Mission.player = GetPlayerHandle()	
	Mission.burns = GetHandle("burns")
	Mission.recycler = GetHandle("recycler")
	Mission.forge = GetHandle("forge")
	Mission.overseer = GetHandle("overseer")
	Mission.dower = GetHandle("dower")
	Mission.stronghold = GetHandle("stronghold")
	Mission.bigass_building = GetHandle("bigass_building")
	Mission.srecycler = GetHandle("srecycler")
	Mission.sscav1 = GetHandle("sscav1")
	Mission.sscav2 = GetHandle("sscav2")
	Mission.sscav3 = GetHandle("sscav3")
	Mission.sscav4 = GetHandle("sscav4")
	Mission.sscav5 = GetHandle("sscav5")
	Mission.spire2 = GetHandle("spire2")
	Mission.spire3 = GetHandle("spire3")
	Mission.spire4 = GetHandle("spire4")
	Mission.pool1 = GetHandle("pool1")
	Mission.pool2 = GetHandle("pool2")
	Mission.pool3 = GetHandle("pool3")
	Mission.manson = GetHandle("tank1")
	Mission.tank2 = GetHandle("tank2")
	--rocket1 = GetHandle("rocket1")
	--walker1 = GetHandle("walker1")
	--walker2 = GetHandle("walker2")
	Mission.burns_condor = GetHandle("dropship")
	Mission.key_device = GetHandle("key_device")
	Mission.first_titan1 = GetHandle("titan1")
	Mission.first_titan2 = GetHandle("titan2")
	Mission.builder1 = GetHandle("builder1")
	Mission.show1 = GetHandle("show1")
	Mission.show2 = GetHandle("show2")
	Mission.tugger = nil
	Mission.nav1 = nil
	Mission.nav2 = nil
	Mission.sent1 = GetHandle("sent1")
	Mission.sent2 = GetHandle("sent2")
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
	Mission.titan1 = nil
	Mission.titan2 = nil
	Mission.titan3 = nil
	Mission.guard1 = nil
	Mission.guard2 = nil
	Mission.guard3 = nil
	Mission.guard4 = nil
	Mission.guarda = GetHandle("guarda")
	Mission.guardb = GetHandle("guardb")
	--base_pool1 = GetHandle("base_pool1")
	--base_pool2 = GetHandle("base_pool2")
	--base_pool3 = GetHandle("base_pool3")
	Mission.talk = nil
	Mission.talk2 = nil
	Mission.temp = nil
	Mission.kick = nil
	Mission.kick1 = nil
	Mission.kick2 = nil
	Mission.carrier = nil



	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	GiveWeapon(Mission.player,"gchainvsr_c")
	GiveWeapon(Mission.player,"gshadowvsr_c")
	GiveWeapon(Mission.player,"gproxminvsr")
	
	PreloadODF("ivcarr")
	PreloadODF("ivrecy_vsr")
   
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

	if (Mission.start_done) then
	
		if ((not Mission.builder1_a) and (IsOdf(h,"fvconst"))) then
		
			Mission.builder1 = h
			Mission.builder1_a = true
		

		elseif ((not Mission.recycler_deployed) and (IsOdf(h,"ibrecy"))) then
		
			SetObjectiveOff(Mission.recycler)
			Mission.recycler = h
			Mission.recycler_deployed = true
		

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
		

		-- SCOUT
		elseif ((not Mission.scout1_a) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout1 = h
			Mission.scout1_a = true

			if (GetTeamNum(Mission.scout1) == 3) then
			
				SetTeamNum(Mission.scout1,2)
			end

		
		elseif ((not Mission.scout2_a) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout2 = h
			Mission.scout2_a = true

			if (GetTeamNum(Mission.scout2) == 3) then
			
				SetTeamNum(Mission.scout2,2)
			end
		
		elseif ((not Mission.scout3_a) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout3 = h
			Mission.scout3_a = true

			if (GetTeamNum(Mission.scout3) == 3) then
			
				SetTeamNum(Mission.scout3,2)
			end
		
		elseif ((not Mission.scout4_a) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout4 = h
			Mission.scout4_a = true

			if (GetTeamNum(Mission.scout4) == 3) then
			
				SetTeamNum(Mission.scout4,2)
			end
		
		
		-- GUARDIAN
		elseif ((not Mission.guard1_a) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard1 = h
			Mission.guard1_a = true
		
		elseif ((not Mission.guard2_a) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard2 = h
			Mission.guard2_a = true
		
		elseif ((not Mission.guard3_a) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard3 = h
			Mission.guard3_a = true
		
		elseif ((not Mission.guard4_a) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard4 = h
			Mission.guard4_a = true
		


		elseif (Mission.new_plan) then
		
			-- SENTRY
			if ((not Mission.sent1_a) and (IsOdf(h,"fvsent"))) then
			
				Mission.sent1 = h
				Mission.sent1_a = true

				if (GetTeamNum(Mission.sent1) == 3) then
				
					SetTeamNum(Mission.sent1,2)
				end
			
			elseif ((not Mission.sent2_a) and (IsOdf(h,"fvsent"))) then
			
				Mission.sent2 = h
				Mission.sent2_a = true

				if (GetTeamNum(Mission.sent2) == 3) then
				
					SetTeamNum(Mission.sent2,2)
				end
			
			elseif ((not Mission.sent3_a) and (IsOdf(h,"fvsent"))) then
			
				Mission.sent3 = h
				Mission.sent3_a = true

				if (GetTeamNum(Mission.sent3) == 3) then
				
					SetTeamNum(Mission.sent3,2)
				end
			
			elseif ((not Mission.sent4_a) and (IsOdf(h,"fvsent"))) then
			
				Mission.sent4 = h
				Mission.sent4_a = true

				if (GetTeamNum(Mission.sent4) == 3) then
				
					SetTeamNum(Mission.sent4,2)
				end
			

			-- WARRIOR
			elseif ((not Mission.war1_a) and (IsOdf(h,"fvtank"))) then
			
				Mission.war1 = h
				Mission.war1_a = true

				if (GetTeamNum(Mission.war1) == 3) then
				
					SetTeamNum(Mission.war1,2)
				end

				GiveWeapon(Mission.war1,"gquill")
				GiveWeapon(Mission.war1,"gdeflect")
				--BuildObject("apquil",0,Mission.war1)
				--BuildObject("apdefl",0,Mission.war1)
			
			elseif ((not Mission.war2_a) and (IsOdf(h,"fvtank"))) then
			
				Mission.war2 = h
				Mission.war2_a = true

				if (GetTeamNum(Mission.war2) == 3) then
				
					SetTeamNum(Mission.war2,2)
				end

				GiveWeapon(Mission.war2,"gquill")
				GiveWeapon(Mission.war2,"gdeflect")
				--BuildObject("apquil",0,Mission.war2)
				--BuildObject("apdefl",0,Mission.war2)
			
			elseif ((not Mission.war3_a) and (IsOdf(h,"fvtank"))) then
			
				Mission.war3 = h
				Mission.war3_a = true

				if (GetTeamNum(Mission.war3) == 3) then
				
					SetTeamNum(Mission.war3,2)
				end

				GiveWeapon(Mission.war3,"gquill")
				GiveWeapon(Mission.war3,"gdeflect")
				--BuildObject("apquil",0,Mission.war3)
				--BuildObject("apdefl",0,Mission.war3)
			
			elseif ((not Mission.war4_a) and (IsOdf(h,"fvtank"))) then
			
				Mission.war4 = h
				Mission.war4_a = true

				if (GetTeamNum(Mission.war4) == 3) then
				
					SetTeamNum(Mission.war4,2)
				end

				GiveWeapon(Mission.war4,"gquill")
				GiveWeapon(Mission.war4,"gdeflect")
				--BuildObject("apquil",0,Mission.war4)
				--BuildObject("apdefl",0,Mission.war4)
			

			-- LANCER
			elseif ((not Mission.lance1_a) and (IsOdf(h,"fvarch"))) then
			
				Mission.lance1 = h
				Mission.lance1_a = true

				BuildObject("apdefl",0,Mission.lance1)
			
			elseif ((not Mission.lance2_a) and (IsOdf(h,"fvarch"))) then
			
				Mission.lance2 = h
				Mission.lance2_a = true

				BuildObject("apdefl",0,Mission.lance2)
			
			elseif ((not Mission.lance3_a) and (IsOdf(h,"fvarch"))) then
			
				Mission.lance3 = h
				Mission.lance3_a = true

				BuildObject("apdefl",0,Mission.lance3)
			
			elseif ((not Mission.lance4_a) and (IsOdf(h,"fvarch"))) then
			
				Mission.lance4 = h
				Mission.lance4_a = true

				BuildObject("apdefl",0,Mission.lance4)
			

			-- TITANS
			elseif ((not Mission.titan1_a) and (IsOdf(h,"fvatank"))) then
			
				Mission.titan1 = h
				Mission.titan_time = GetTime() + 102.0
				Mission.titan1_a = true
			
			elseif ((not Mission.titan2_a) and (IsOdf(h,"fvatank"))) then
			
				Mission.titan2 = h
				Mission.titan2_a = true
			
			elseif ((not Mission.titan3_a) and (IsOdf(h,"fvatank"))) then
			
				Mission.titan3 = h
				Mission.titan3_a = true
			end
		
		
		-- TITANS
		elseif ((not Mission.titan1_a) and (IsOdf(h,"fvatank"))) then
		
			Mission.titan1 = h
			Mission.titan_time = GetTime() + 2.0
			Mission.titan1_a = true
		
		elseif ((not Mission.titan2_a) and (IsOdf(h,"fvatank"))) then
		
			Mission.titan2 = h
			Mission.titan2_a = true
		
		elseif ((not Mission.titan3_a) and (IsOdf(h,"fvatank"))) then
		
			Mission.titan3 = h
			Mission.titan3_a = true
		end
	--[[
		-- MAULER
		elseif ((not Mission.maul1_a) and (IsOdf(h,"fvwalk"))) then
		
			maul1 = h
			Mission.maul1_a = true 
		
		elseif ((not Mission.maul2_a) and (IsOdf(h,"fvwalk"))) then
		
			maul2 = h
			Mission.maul2_a = true 
		
		elseif ((not Mission.maul3_a) and (IsOdf(h,"fvwalk"))) then
		
			maul3 = h
			Mission.maul3_a = true 
		
		elseif ((not Mission.maul4_a) and (IsOdf(h,"fvwalk"))) then
		
			maul4 = h
			Mission.maul4_a = true 
		end
	]]
	end
end


function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function HaveScav()

	a = CountUnitsNearObject(nil,99999.0,2,"fbscup")
	PrintConsoleMessage("a is"..a)
	b = CountUnitsNearObject(nil,99999.0,2,"fbscav")
	PrintConsoleMessage("b is"..b)
	up_scavs = a
	scavs = a+b

	enouph = false

	if ((up_scavs > 3) and (scavs > 5)) then
		enouph = true
	else
		enouph = false
	end
	return enouph
end


function HaveScav2()

	x = CountUnitsNearObject(nil,99999.0,2,"ibscup_vsr")
	z = CountUnitsNearObject(nil,99999.0,2,"ibscav_vsr")

	scavs2 = x+z;

	enouph2 = false

	if ((scavs2 > 2)) then
	
		enouph2 = true
	
	else
	
		enouph2 = false
	end
	return enouph2
end



function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

	Mission.player = GetPlayerHandle()

	if (not Mission.start_done) then
	
		SetColorFade(1,0.9,Make_RGBA(0, 0, 0, 255))

		MaskEmitter(Mission.burns_condor, 0)

		Mission.talk = AudioMessage("isdf1301.wav")--(Kossieh) Mission briefing
		ClearObjectives()
		AddObjective("isdf1301.otf", "WHITE")

		SetAnimation(Mission.burns_condor,"deploy",1)

		Goto(Mission.builder1,"builder_point")

		SetObjectiveOn(Mission.manson)
		SetObjectiveName(Mission.manson,"Maj. Manson")

		Mission.war1 = BuildObject("fvtank13",2,"b_point1")
		Stop(Mission.war1)
		Mission.walker1 = BuildObject("ivwalk",1,"walker1_spawn")
		--Stop(walker1,1)
		LookAt(Mission.walker1,Mission.spire4)
		Mission.walker2 = BuildObject("ivwalk",1,"walker2_spawn")
		--Stop(walker2,1)
		LookAt(Mission.walker2,Mission.spire4)

		--RemoveObject(Mission.recycler)
		--Mission.recycler = BuildObject("ivrecy13x",1,"recycler_spawn")
		Stop(Mission.recycler)

		Ally(2,1)
		Ally(1,2)
		Ally(1,3)
		Ally(3,1)
		Ally(2,3)
		Ally(3,2)

		SetAvoidType(Mission.burns,0)
		SetAvoidType(Mission.first_titan1,0)
		SetAvoidType(Mission.first_titan2,0)
		SetAvoidType(Mission.sent1,0)
		SetAvoidType(Mission.sent2,0)

		SetSkill(Mission.spire2,3)
		SetSkill(Mission.spire3,3)
		SetSkill(Mission.spire4,3)
		SetSkill(Mission.first_titan1,3)
		SetSkill(Mission.first_titan2,3)

		SetAIP("isdf1301.aip",2)

		LookAt(Mission.manson,Mission.forge)
		LookAt(Mission.tank2,Mission.forge)

		Patrol(Mission.sent1,"patrol_path1",0)
		Patrol(Mission.sent2,"patrol_path1a",0)

		Mission.honest_check = GetTime() + 2.0

		MaskEmitter(Mission.show2,0)
		--MaskEmitter(Mission.show2,4)
		--MaskEmitter(Mission.show2,5)
		--MaskEmitter(Mission.show2,6)
		StartEmitter(Mission.show2,1)
		StartEmitter(Mission.show2,2)

		Mission.start_done = true
	end

	-- this is resetting the deaths

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
	
	if ((Mission.sent1_a) and (not IsAlive(Mission.sent1))) then
	
		Mission.sent1_a = false
		Mission.sent1_to_recy = false
	end
	if ((Mission.sent2_a) and (not IsAlive(Mission.sent2))) then
	
		Mission.sent2_a = false
		Mission.sent2_to_recy = false
	end
	if ((Mission.sent3_a) and (not IsAlive(Mission.sent3))) then
	
		Mission.sent3_a = false
	end
	if ((Mission.sent4_a) and (not IsAlive(Mission.sent4))) then
	
		Mission.sent4_a = false
	end

	if ((Mission.war1_a) and (not IsAlive(Mission.war1))) then
	
		Mission.war1_a = false
		Mission.war1_to_recy = false
	end
	if ((Mission.war2_a) and (not IsAlive(Mission.war2))) then
	
		Mission.war2_a = false
		Mission.war2_to_recy = false
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

	if (Mission.titan1_a) then
	
		if (IsAlive(Mission.titan1)) then
		
			if ((not Mission.titan_sent) and (Mission.titan_time < GetTime())) then
			
				Goto(Mission.titan1,"titan_path")
				Mission.titan_sent = true
			end
		
		else
		
			Mission.titan_time = GetTime() + 999999.9
			Mission.titan_sent = false
			Mission.titan1_a = false
		end
	end

	if ((Mission.titan2_a) and (not IsAlive(Mission.titan2))) then
	
		Mission.titan2_a = false
	end
	if ((Mission.titan3_a) and (not IsAlive(Mission.titan3))) then
	
		Mission.titan3_a = false
	end
	--------------------------------------------


	-- this is giving the data machine health every frame

	if (GetCurHealth(Mission.bigass_building) < 5000) then
	
		SetCurHealth(Mission.bigass_building,5000)
	end
	--------------------------------------------



if ((not Mission.part_two) and (not Mission.game_over)) then

	-- this is pilot Mission.talk about the situation

	if (Mission.start_done) then
	
		if ((not Mission.pilot_talk1) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf1302.wav")--(Manson) If he don't get here soon I'm jumpin on that condor
			Mission.move_burns_time = GetTime() + 3.5

			--Mission.carrier_dead = true
			
			Mission.pilot_talk1 = true
		end

		if ((not Mission.pilot_talk2) and (Mission.pilot_talk1) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf1303.wav")--(pilot2) Yeah, sitting around in the center of a Scion base is no picnic
			Mission.pilot_talk2 = true
		end

		if ((not Mission.pilot_talk3) and (Mission.pilot_talk2) and (IsAudioMessageDone(Mission.talk))) then
		
			Mission.talk = AudioMessage("isdf1304.wav")--(brad) Just see that it gets on that transport
			--Mission.move_burns_time = GetTime() + 1.0
			Mission.pilot_talk3 = true
		end
	end
	--------------------------------------------

	
	-- this sends the first titan

	if ((not Mission.titan1_move) and (Mission.move_burns_time < GetTime())) then
	
		Goto(Mission.war1,Mission.player)
		--Goto(Mission.first_titan1,"burns_path")
		Goto(Mission.first_titan1,"titan1_path3")
		Mission.move_burns_time = GetTime() + 6.0
		Mission.titan1_move = true
	end
	--------------------------------------------


	-- this is sending Mission.burns to the shuttle

	if ((not Mission.burns_move) and (Mission.titan1_move) and (Mission.move_burns_time < GetTime())) then
	
		Retreat(Mission.burns,"burns_path3")
		Follow(Mission.first_titan2,Mission.burns)
		Mission.burns_check = GetTime() + 1.0
		Mission.war1_check = GetTime() + 1.0
		Mission.move_burns_time = 999999.9
		Mission.parade_check = GetTime() + 20.0
		Mission.burns_move = true
	end
	--------------------------------------------


	-- this is checking the warrior I sent at John

	if ((Mission.burns_move) and (not Mission.war_look1) and (Mission.war1_check < GetTime())) then
	
		Mission.war1_check = GetTime() + 1.0

		if (GetDistance(Mission.war1,Mission.player) < 100.0) then
		
			--Stop(Mission.war1)
			LookAt(Mission.war1,Mission.player)
			Mission.war1_check = GetTime() + 7.0
			Mission.war_look1 = true
		end
	end


	if ((Mission.war_look1) and (not Mission.war_look2) and (Mission.war1_check < GetTime())) then
	
		Goto(Mission.war1,"war_point2")
		Mission.war_look2 = true
	end


	if ((Mission.war_look2) and (not Mission.war_look3) and (GetDistance(Mission.war1,"war_point2") < 20.0)) then
	
		LookAt(Mission.war1,Mission.tank2)
		Mission.war1_check = GetTime() + 4.0
		Mission.war_look3 = true
	end


	if ((Mission.war_look3) and (not Mission.carrier_dead) and (Mission.war1_check < GetTime())) then
	
		if (not Mission.at_player) then
		
			LookAt(Mission.war1,Mission.player)
			Mission.war1_check = GetTime() + 4.0
			Mission.at_player = true
		
		elseif(not Mission.at_manson) then 
		
			LookAt(Mission.war1,Mission.manson)
			Mission.war1_check = GetTime() + 4.0
			Mission.at_manson = true
		
		elseif(not Mission.at_2) then
		
			LookAt(Mission.war1,Mission.tank2)
			Mission.war1_check = GetTime() + 4.0
			Mission.at_player = false
			Mission.at_manson = false
		end
	end
	--------------------------------------------


	-- this is braddock mentioning that Mission.burns is on his way

	if ((not Mission.brad_message1) and (Mission.parade_check < GetTime())) then
	
		Mission.parade_check = GetTime() + 1.0

		SetObjectiveOn(Mission.burns)
		tempstr = TranslateString("Mission1301")  -- Scion Leader
		SetObjectiveName(Mission.burns,tempstr)
		Mission.talk = AudioMessage("isdf1305.wav")--(Kossieh) here he comesnot 
		LookAt(Mission.walker1,Mission.burns)
		LookAt(Mission.walker2,Mission.burns)
		LookAt(Mission.manson,Mission.burns)
		LookAt(Mission.tank2,Mission.burns)
		--LookAt(Mission.first_titan1,Mission.player)
		Stop(Mission.first_titan1)
		Mission.titan_look_time = GetTime() + 1.0
		Mission.brad_message1 = true
	end
	--------------------------------------------


	-- this makes the first titan look at the Mission.player

	if ((not Mission.titan_look) and (Mission.brad_message1) and (Mission.titan_look_time < GetTime())) then
	
		Mission.titan_look_time = GetTime() + 999999.9
		LookAt(Mission.first_titan1,Mission.player)
		Mission.titan_look = true
	end
	--------------------------------------------


	-- this is making sure the Mission.player does not move during the opening

	if (not Mission.carrier_dead) then
	
		if ((not Mission.honest_warning) and (Mission.honest_check < GetTime())) then
		
			Mission.honest_check = GetTime() + 2.0

			if (GetDistance(Mission.player,Mission.manson) > 40.0) then
			
				StopAudioMessage(Mission.talk)
				ClearObjectives()
				AddObjective("isdf1301.otf", "RED")
				Mission.talk = AudioMessage("isdf1306.wav")--(Kossieh) I told you to remaim stillnot  Stop your craft immediatelynot 
				Mission.pilot_talk1 = true
				Mission.pilot_talk2 = true
				Mission.pilot_talk3 = true
				Mission.honest_warning = true
			end
		end

		if ((Mission.honest_warning) and (Mission.honest_check < GetTime())) then
		
			if (GetDistance(Mission.player,Mission.manson) < 30.0) then
			
				StopAudioMessage(Mission.talk)
				ClearObjectives()
				AddObjective("isdf1301.otf", "WHITE")

				-- So we don't get stuck if you move at the very start then
				if (Mission.move_burns_time==999999.9) then
					Mission.move_burns_time = GetTime() + 3.5
				end
				Mission.honest_warning = false
			end
		end

	end
	--------------------------------------------
	

	-- this is checking to see when he gets to the condor

	if ((Mission.burns_move) and (not Mission.burns_at_condor) and (Mission.burns_check < GetTime())) then
	
		Mission.burns_check = GetTime() + 1.0

		if (GetDistance(Mission.burns,"convoycheck_point") < 40.0) then
		
			Goto(Mission.burns,"enter_drop_path")
			LookAt(Mission.titan1,Mission.player)
			--Mission.burns_check = GetTime() + 1.0
			Mission.burns_at_condor = true
		end
	end
	--------------------------------------------


	-- this is checking to see when he gets into the condor

	if ((Mission.burns_at_condor) and (not Mission.burns_in_condor)) then
	
		if (GetDistance(Mission.burns,"in_drop_point") < 25.0) then
		
			Stop(Mission.burns)
			SetObjectiveOff(Mission.burns)
			--Mission.kick = BuildObject("kickup",0,"in_drop_point")
			--Mission.kick1 = BuildObject("kickup",0,"walker1_spawn")
			--Mission.kick2 = BuildObject("kickup",0,"walker2_spawn")
			Stop(Mission.first_titan2)
			LookAt(Mission.first_titan1,Mission.first_titan2)
			SetAnimation(Mission.burns_condor,"takeoff",1)
			StartEmitter(Mission.burns_condor, 1)
			StartEmitter(Mission.burns_condor, 2)
			Mission.carrier_time = GetTime() + 4.0
			Mission.burns_in_condor = true
		end
	end
	--------------------------------------------


	-- this is getting rid of Mission.burns

	if ((not Mission.remove_burns) and (Mission.burns_in_condor) and (Mission.carrier_time < GetTime())) then
	
		RemoveObject(Mission.burns)
		Mission.carrier_time = GetTime() + 6.0
		Mission.remove_burns = true
	end
	--------------------------------------------


	-- this is getting rid of the Mission.carrier

	if ((not Mission.carrier_dead) and (Mission.remove_burns) and (Mission.carrier_time < GetTime())) then
	
		RemoveObject(Mission.burns_condor)
		--RemoveObject(Mission.kick)
		--RemoveObject(Mission.kick1)
		--RemoveObject(Mission.kick2)
		Mission.carrier_time = GetTime() + 999999.9
		Mission.carrier_dead = true
	end
	--------------------------------------------


	-- this is the movie code

	if ((not Mission.movie_over) and (Mission.carrier_dead)) then
	
		if (not Mission.first_frame)  then
		
			CameraReady()
			Mission.movie_time = GetTime() + 15.0
			Mission.explosion_time = GetTime() + 13.0
			SetAnimation(Mission.show1,"cinteractive",1)
			SetAnimation(Mission.show2,"cinteractive",1)
			StartSoundEffect("droppass.wav")
			Mission.first_frame = true
		end
		curFrame = GetAnimationFrame(Mission.show2, "cinteractive")

		if (curFrame > 109) then
		
			if (not Mission.explode) then
			
				StartSoundEffect("xfire1.wav")
				--AudioMessage("xfire1.wav")
				Mission.explode = true
			end

			StartEmitter(Mission.show2, 4)
		end

		if (curFrame > 122) then
		
			MaskEmitter(Mission.show2, 1)
			--StartEmitter(Mission.show2, 3)
		end

		--if (curFrame > 123) then
		--
		--	MaskEmitter(Mission.show2, 0)
		--	StartEmitter(Mission.show2, 4)
		--end
		
		PlayMovie("dropship2")
	end

	


	-- this is the explosion

	if ((not Mission.main_explosion) and (Mission.explosion_time < GetTime())) then
	
		Mission.main_explosion = true
	end
	--------------------------------------------


	if ((not Mission.movie_over) and (Mission.first_frame) and (Mission.movie_time < GetTime())) then
	
		CameraFinish()
		Mission.movie_over = true
	end
	--------------------------------------------


	-- this is after the destruction of the Mission.carrier

	if ((not Mission.confussion) and (Mission.movie_over)) then
	
		StartEarthQuake(30.0)

		Mission.carrier = BuildObject("ivcarr",0,"carrier_spawn")
		--SetAnimation(Mission.carrier,"crash",1)

		RemoveObject(Mission.show1)
		RemoveObject(Mission.show2)

		Mission.quake_time = GetTime() + 0.5
		Mission.panic_time = GetTime() + 5.0
		Mission.confussion = true
	end
	--------------------------------------------


	-- this is updating the earthquake

	if ((not Mission.update_quake) and (Mission.confussion) and (Mission.quake_time < GetTime())) then
	
		SetAnimation(Mission.carrier,"crash",1)
		UpdateEarthQuake(5.0)
		Mission.update_quake = true
	end
	--------------------------------------------


	-- this is the panic messages

	if ((Mission.confussion) and (not Mission.panic_message1) and (Mission.panic_time < GetTime())) then
	
		Mission.talk = AudioMessage("isdf1307.wav")--(pilot2) The Mission.carrier's been blown from the skynot not 
		LookAt(Mission.tank2,Mission.manson)
		Mission.panic_message1 = true
	end

	if ((not Mission.panic_message2) and (Mission.panic_message1) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf1308.wav")--(Manson) Come in sky 1 - Come innot 
		LookAt(Mission.manson,Mission.player)
		LookAt(Mission.tank2,Mission.walker1)
		Mission.panic_message2 = true
	end

	if ((not Mission.panic_message3) and
		(Mission.panic_message2) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf1309.wav")--(pilot2) Ah... what do we do here sirnot 
		LookAt(Mission.manson,Mission.tank2)
		LookAt(Mission.tank2,Mission.manson)
		Mission.hell_time = GetTime() + 5.0
		Mission.panic_message3 = true
	end
	--------------------------------------------


	-- this is when all Mission.hell breaks loose

	if ((Mission.hell_time < GetTime()) and (not Mission.hell)) then

		StopEarthQuake()
		Mission.nav1 = BuildObject("ibnav",1,"nav1_spawn")
		Mission.nav2 = BuildObject("ibnav",1,"nav2_spawn")
		SetObjectiveOn(Mission.nav1)

		Mission.talk2 = AudioMessage("isdf1310a.wav")--(brad) *broken* Get out of therenot  I've dropped a Recycler 3000 meters to the south-east

		if (IsAround(Mission.carrier)) then
		
			RemoveObject(Mission.carrier)
		end
		
		if (IsAlive(Mission.walker1)) then
		
			SetCurHealth(Mission.walker1,2000)
			Stop(Mission.walker1,0)
		end

		if (IsAlive(Mission.walker2)) then
		
			SetCurHealth(Mission.walker2,2000)
			Stop(Mission.walker2,0)
		end

		if (IsAlive(Mission.builder1)) then
		
			Stop(Mission.builder1,0)
		end
		
		UnAlly(2,1)
		UnAlly(1,2)
		UnAlly(3,2)
		UnAlly(2,3)

		SetAIP("isdf1302.aip",2)

		Mission.honest_check = GetTime() + 2.0
		Mission.recycler_check = GetTime() + 1.0

		Mission.hell = true
	end
	--------------------------------------------
	
	
	-- this is braddocks second set of messages

	if ((Mission.hell) and (not Mission.brad_message2) and (IsAudioMessageDone(Mission.talk2))) then
		
		Mission.talk2 = AudioMessage("isdf1311.wav")--(pilot1) repeat - cannot cop-AHHHHHHHHHHHnot  

		if (IsAlive(Mission.manson)) then
		
			SetCurHealth(Mission.manson,1)
			SetObjectiveOff(Mission.manson)
		end

		Mission.brad_message2 = true
	end

	if ((Mission.brad_message2) and (not Mission.brad_message3) and (IsAudioMessageDone(Mission.talk2))) then
	
		if (IsAlive(Mission.manson)) then
		
			Damage(Mission.manson,3000)
		end
		if (IsAlive(Mission.tank2)) then
		
			Damage(Mission.tank2,3000)
		end
		
		temp_handle = GetHandle("player_ship")
		if (not HasPilot(temp_handle) and Mission.player ~= temp_handle) then 
			Damage(temp_handle,3000)
		end
		--elseif (IsAlive(rocket1)) then
		--
		--	SetCurHealth(rocket1,0)
		--end

		ClearObjectives()
		AddObjective("isdf1302.otf", "WHITE")
		Mission.talk2 = AudioMessage("isdf1312.wav")--(brad) repeat - Get out of there and to the Mission.recycler to the south eastnot  
		Mission.escape_check = GetTime() + 2.0
		Mission.brad_message3 = true
	end
	--------------------------------------------


	-- this is the Mission.player getting away from the base
	if ((Mission.brad_message3) and (not Mission.brad_message4) and (Mission.escape_check < GetTime())) then
	
		Mission.escape_check = GetTime() + 1.0

		if (GetDistance(Mission.player,"war_point2") > 750.0) then
		
			SetObjectiveOn(Mission.nav1)
			tempstr = TranslateString("Mission1302")  -- Recycler
			SetObjectiveName(Mission.nav1,tempstr)
			ClearObjectives()
			AddObjective("isdf1302.otf", "GREEN")
			AddObjective("isdf1303.otf", "WHITE")
			AudioMessage("isdf1315.wav")--(brad) way to escapenot  They were jamming menot  Get to Recyclernot 
			Mission.brad_message4 = true
		end
	end


	-- this is when the Mission.player reaches the Mission.recycler

	if ((not Mission.at_recycler) and (Mission.hell) and (Mission.recycler_check < GetTime())) then
	
		Mission.recycler_check = GetTime() + 1.0

		if (GetDistance(Mission.player,Mission.recycler) < 150.0) then
		
			pos = GetPosition(Mission.recycler)
			RemoveObject(Mission.recycler)
			Mission.recycler = BuildObject("ivrecy_vsr",1,pos)
			SetGroup(Mission.recycler,0)
			AddScrap(1,40)
			SetObjectiveOff(Mission.nav1)
			SetObjectiveOn(Mission.key_device)
			tempstr = TranslateString("Mission1202")  -- Power Source
			SetObjectiveName(Mission.key_device,tempstr)
			ClearObjectives()
			AddObjective("isdf1303.otf", "GREEN")
			AddObjective("isdf1304.otf", "WHITE")
			AudioMessage("isdf1316.wav")-- (brad) You've got attack waves on the way son
			Mission.set_scrap_time = GetTime() + 1.0
			Mission.titan_attack_time = GetTime() + 120.0
			SetObjectiveOn(Mission.nav2)
			tempstr = TranslateString("Mission1303")  -- Scrap Field
			SetObjectiveName(Mission.nav2,tempstr)

			if (IsAlive(Mission.war1) and Mission.war1 ~= Mission.player) then
			
				Goto(Mission.war1,"guard_point1",0)
			end
			if (IsAlive(Mission.sent1) and Mission.sent1 ~= Mission.player) then
			
				Goto(Mission.sent1,"guard_point2",0)
			end
			if (IsAlive(Mission.sent2) and Mission.sent2 ~= Mission.player) then
			
				Goto(Mission.sent2,"guard_point3",0)
			end
			--Stop(Mission.recycler,0)
			Mission.part_two = true
			Mission.at_recycler = true
		end
	end
	--------------------------------------------
end



	-- this is setting the scrap

	if ((Mission.at_recycler) and (not Mission.set_scrap) and (Mission.set_scrap_time < GetTime())) then
	
		Mission.set_scrap_time = GetTime() + 999999.9
		SetObjectiveOff(Mission.recycler)
		--Mission.plan_check = GetTime() + 60.0
		Mission.plan_check = GetTime() + 480.0
		--SetAIP("isdf1303.aip",2)
		Mission.set_scrap = true
	end
	--------------------------------------------


	-- this is Mission.temp attack code
--[[
	if(Mission.set_scrap)
	
		if ((Mission.war1_a) and (IsAround(Mission.recycler))) then
		
			Goto(Mission.war1,Mission.recycler)
			Mission.war1_to_recy = true
		end

		if ((Mission.war2_a) and (IsAround(Mission.recycler))) then
		
			Goto(Mission.war2,Mission.recycler)
			Mission.war2_to_recy = true
		end

		if ((Mission.sent1_a) and (IsAround(Mission.recycler))) then
		
			Goto(Mission.sent1,Mission.recycler)
			Mission.sent1_to_recy = true
		end

		if ((Mission.sent2_a) and (IsAround(Mission.recycler))) then
		
			Goto(Mission.sent2,Mission.recycler)
			Mission.sent2_to_recy = true
		end
	end
	--------------------------------------------
]]

	-- this is setting the next aip
	--PrintConsoleMessage(tostring(GetTime()))
	--PrintConsoleMessage(tostring(Mission.plan_check))
	if (Mission.plan_check < GetTime()) then
	
		Mission.plan_check = GetTime() + 60

		if (not Mission.titan_plan) then
			PrintConsoleMessage("Running HaveScav")
			if ((HaveScav()) and (IsAround(Mission.overseer)) and (IsAround(Mission.stronghold))) then
			
				SetAIP("isdf1303.aip",2)
				Mission.titan_plan = true
			end
		end

		if (Mission.titan_plan) then
		
			if (HaveScav2()) then
			
				if (not Mission.new_plan) then
				
					SetAIP("isdf1304.aip",2)
					Mission.new_plan = true
				end
			
			elseif (Mission.new_plan) then
			
				SetAIP("isdf1303.aip",2)
				Mission.new_plan = false
			end
		end
	end
	--------------------------------------------


if ((Mission.part_two) and (not Mission.game_over)) then

	-- this is the titan attack

	if ((not Mission.titan_attack) and (Mission.titan_attack_time < GetTime())) then
	
		if (IsAlive(Mission.first_titan1)) then
		
			Goto(Mission.first_titan1,"attack_path1",1)
		end

		if (IsAlive(Mission.first_titan2)) then
		
			Goto(Mission.first_titan2,"attack_path1",1)
		end
		
		Mission.titan_attack_time = GetTime() + 1.0
		Mission.titan_attack = true
	end
	--------------------------------------------


	-- this is seding in some scouts to try and stir things up

	if ((not Mission.send_scouts) and (Mission.titan_attack) and (Mission.titan_attack_time < GetTime())) then
	
		Mission.titan_attack_time = GetTime() + 1.0

		if (IsAlive(Mission.first_titan1)) then
		
			if (GetDistance(Mission.first_titan1,"recycler_spawn") < 50.0) then
			
				Defend(Mission.first_titan1)

				if (Mission.scout1_a) then
				
					Goto(Mission.scout1,"attack_path2")
				end
				if (Mission.scout2_a) then
				
					Goto(Mission.scout2,"attack_path2")
				end
				if (Mission.scout3_a) then
				
					Goto(Mission.scout3,"attack_path2")
				end
				if (Mission.scout4_a) then
				
					Goto(Mission.scout4,"attack_path2")
				end

				Mission.send_scouts = true
			end
		
		elseif (IsAlive(Mission.first_titan2)) then
		
			if (GetDistance(Mission.first_titan2,"nav1_spawn") < 50.0) then
			
				Defend(Mission.first_titan1)

				if (Mission.scout1_a) then
				
					Goto(Mission.scout1,"attack_path2")
				end
				if (Mission.scout2_a) then
				
					Goto(Mission.scout2,"attack_path2")
				end
				if (Mission.scout3_a) then
				
					Goto(Mission.scout3,"attack_path2")
				end
				if (Mission.scout4_a) then
				
					Goto(Mission.scout4,"attack_path2")
				end

				Mission.send_scouts = true
			end
		
		elseif (not Mission.titan_dead) then
		
			Mission.titan_attack_time = GetTime() + 240.0
			Mission.titan_dead = true

			if (Mission.scout1_a) then
			
				Goto(Mission.scout1,"attack_path2")
			end
			if (Mission.scout2_a) then
			
				Goto(Mission.scout2,"attack_path2")
			end
			if (Mission.scout3_a) then
			
				Goto(Mission.scout3,"attack_path2")
			end
			if (Mission.scout4_a) then
			
				Goto(Mission.scout4,"attack_path2")
			end

			Mission.send_scouts = true
		end
	end
	--------------------------------------------


	-- this is checking to see if the scavs are destoyed then

	if ((Mission.sscav1_a) and (not IsAround(Mission.sscav1))) then
	
		Mission.sscav1_a = false
	end
	if ((Mission.sscav2_a) and (not IsAround(Mission.sscav2))) then
	
		Mission.sscav2_a = false
	end
	if ((Mission.sscav3_a) and (not IsAround(Mission.sscav3))) then
	
		Mission.sscav3_a = false
	end
	if ((Mission.sscav4_a) and (not IsAround(Mission.sscav4))) then
	
		Mission.sscav4_a = false
	end
	if ((Mission.sscav5_a) and (not IsAround(Mission.sscav5))) then
	
		Mission.sscav5_a = false
	end
	--------------------------------------------


	-- this is getting a scavenger4 to go to Mission.pool1
--[[
	if (Mission.at_recycler) then
	
		if (Mission.sscav4_a) then
		
			if (IsAlive(Mission.sscav4)) then
			
				-- first I send him to the pool

				if (not Mission.scav4_to_pool) then
				
					Goto(Mission.sscav4,Mission.pool1)
					Mission.scav4_check = GetTime() + 1.0
					Mission.scav4_to_pool = true
				end
				--------------------------------------------

				-- then I check to see if he is there then

				if ((not Mission.scav4_at_pool) and (Mission.scav4_check < GetTime())) then
				
					Mission.scav4_check = GetTime() + 1.0


					if (GetDistance(Mission.sscav4,Mission.pool1) < 50.0) then
					
						Deploy(Mission.sscav4)
						Mission.scav4_at_pool = true
					end
				end
				--------------------------------------------

				
				-- this is checking to see when the scavenger is deployed
				
				if ((Mission.scav4_at_pool) and (not Mission.scav4_deployed)) then
				
					if (IsDeployed(Mission.sscav4)) then
					
						Mission.scav4_deployed = true
					end
				end
				--------------------------------------------
			
			elseif (not Mission.scav4_deployed) then
			
				Mission.sscav4_a = false
				Mission.scav4_to_pool = false
				Mission.scav4_at_pool = false
			end
		
		else
		
			Mission.scav4_to_pool = false
			Mission.scav4_at_pool = false
			Mission.scav4_deployed = false
		end
	end
	--------------------------------------------
]]

	-- this is checking to see if the turrets are destoyed then

	if ((Mission.guard1_a) and (not IsAlive(Mission.guard1))) then
	
		Mission.guard1_a = false
		Mission.guard1_sent = false
		Mission.guard1_deployed = false
	end
	if ((Mission.guard2_a) and (not IsAlive(Mission.guard2))) then
	
		Mission.guard2_a = false
		Mission.guard2_sent = false
		Mission.guard2_deployed = false
	end
	if ((Mission.guard3_a) and (not IsAlive(Mission.guard3))) then
	
		Mission.guard3_a = false
		Mission.guard3_sent = false
		Mission.guard3_deployed = false
	end
	if ((Mission.guard4_a) and (not IsAlive(Mission.guard4))) then
	
		Mission.guard4_a = false
	end
	--------------------------------------------


	-- this is getting a guardians to their posts

	if (Mission.at_recycler) then
	
		if (not Mission.guards_sent) then
		
			if ((not Mission.guard1_sent) and (Mission.guard1_a)) then
			
				Goto(Mission.guard1,"guard_point1",1)
				Mission.guard1_sent = true
			end

			if ((not Mission.guard2_sent) and (Mission.guard2_a)) then
			
				Goto(Mission.guard2,"guard_point2",1)
				Mission.guard2_sent = true
			end

			if ((not Mission.guard3_sent) and (Mission.guard3_a)) then
			
				Goto(Mission.guard3,"guard_point3",1)
				Mission.guard3_sent = true
			end
			
			if ((Mission.guard1_sent) and (Mission.guard2_sent) and (Mission.guard3_sent)) then
			
				Mission.guards_sent = true
			end			
		end

		
		-- this is always checking the guards

		if (Mission.guards_check < GetTime()) then
		
			Mission.guards_check = GetTime() + 3.0


			if ((Mission.guard1_sent) and (Mission.guard1_a)) then
			
				if ((not Mission.guard1_deployed) and (GetDistance(Mission.guard1,"guard_point1") < 30.0)) then
				
					Deploy(Mission.guard1)
					Mission.guard1_deployed = true
				end
			end

			if ((Mission.guard2_sent) and (Mission.guard2_a)) then
			
				if ((not Mission.guard2_deployed) and (GetDistance(Mission.guard2,"guard_point2") < 30.0)) then
				
					Deploy(Mission.guard2)
					Mission.guard2_deployed = true
				end
			end

			if ((Mission.guard3_sent) and (Mission.guard3_a)) then
			
				if ((not Mission.guard3_deployed) and (GetDistance(Mission.guard3,"guard_point3") < 30.0)) then
				
					Deploy(Mission.guard3)
					Mission.guard3_deployed = true
				end
			end
		end
	end


		-- this is setting a new aip
	--[[
		if ((Mission.recycler_deployed) and (not Mission.plan_change1)) then
		
			SetAIP("isdf1303.aip",2)
			Mission.guards_check = GetTime() + 3.0
			Mission.plan_change1 = true
		end
	]]
end



	if (not Mission.game_over) then
	
		-- this is if the Mission.player wins then

		if (IsAround(Mission.key_device)) then
		
			SetCurHealth(Mission.key_device,5000)

			Mission.tugger = GetTug(Mission.key_device)

			if (IsAlive(Mission.tugger)) then
			
				if (GetTeamNum(Mission.tugger) == 1) then
				
					SucceedMission(GetTime() + 10.0,"isdf13w1.txt")
					AudioMessage("isdf1313.wav")--(braddock) well done
					Mission.game_over = true
				end
			end
		end
		--------------------------------------------

		-- this is the Mission.player moves to far during the beginning
		if (not Mission.confussion) then
		
			if (Mission.honest_check < GetTime()) then
			
				if (GetDistance(Mission.player,"start_point") > 80.0) then
				
					UnAlly(2,1)
					UnAlly(1,2)
					AudioMessage("isdf1314.wav")--(Kossieh) They've called off the meeting because of your incompedencenot 
					FailMission(GetTime() + 15.0,"isdf13l1.txt")
					Mission.game_over = true
				end
			end

			if ((GetAmmo(Mission.player) < 1)) then
			
				UnAlly(2,1)
				UnAlly(1,2)
				StopAudioMessage(Mission.talk)
				AudioMessage("isdf1317.wav")--(Kossieh) They've called off the meeting because of your incompedencenot 
				FailMission(GetTime() + 15.0,"isdf13l1.txt")
				Mission.game_over = true						
			end

		end

		if ((not Mission.game_over) and (not IsAlive(Mission.recycler))) then
		
			Mission.game_over = true
			FailMission(GetTime()+10.0,"isdf13l2.txt")
		end
	end 
end