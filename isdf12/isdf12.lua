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
	start_done = false,
	out_of_ship = true,
	game_over = false,
	first_message = true,
	first_over = false,
	scrap_message = false,
	guard1a = false,
	guard2a = false,
	guard3a = false,
	guard4a = false,
	sent1a = true,
	sent2a = true,
	sent3a = false,
	sent4a = false,
	war1a = true,
	war2a = true,
	war3a = true,
	war4a = false,
	lance1a = false,
	lance2a = false,
	lance3a = false,
	lance4a = false,
	scout1a = false,
	scout2a = false,
	scout3a = false,
	scout4a = false,
	titana = false,
	power1a = true,
	power2a = false,
	power3a = false,
	power4a = false,
	guntower1a = true,
	guntower2a = true,
	guntower3a = false,
	guntower4a = false,
	send_second = false,
	power_message = false,
	change_otf1 = false,
	change_otf2 = false,
	change_otf3 = false,
	player_in_scav = false,
	scav1_alive = false,
	scav2_alive = false,
	pilot_made = false,
	build_health_set = false,
	guntower_show = false,
	base_powered = false,
	scav_deployed = false,
	powered_message1 = false,
	training_message = false,
	first_done = false,
	base_first = false,
	scav_first = false,
	train_first = false,
	second_done = false,
	train_second = false,
	scav_second = false,
	base_second = false,
	last_done = false,
	new_plan1 = false,
	scav1_deployed = false,
	scav2_deployed = false,
	scav3_deployed = false,
	titan_attack = false,
	last_aip = false,
	power_explained = false,
	powered = false,


--  floats
	land_time = 999999.9,
	guntower_check = 999999.9,
	power_check = 999999.9,
	scav_check = 999999.9,
	titan_time = 999999.9,

--  handles
	player,
	srecycler,
	factory,
	service,
	armory,
	training,
	commbunk1,
	power1,
	power2,
	power3,
	power4,
	guntower1,
	guntower2,
	guntower3,
	guntower4,
	scav1,
	empty_scav1,
	empty_scav2,
	sscav1,
	sscav2,
	sscav3,
	forge,
	overseer,
	dower,
	stronghold,
	spire1,
	spire2,
	spire3,
	spire4,
	bigass_machine,
	tank1,
	tank2,
	tbolt1,
	tbolt2,
	rocket1,
	constructor,
	tug,
	--spool1,
	--spool2,
	--spool3,
	pool1_nav,
	pool2_nav,
	pool3_nav,
	titan1,
	titan2,
	key_device,
	sturret1,
	sturret2,
	sturret3,
	sturret4,
	sturret5,
	sturret6,
	sturret7,
	sturret8,
	sturret9,
	sturret10,
	scav_a,
	scav_b,
	scav_c,
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
	titan,
	tugger,
	talk,
	pilot,
	start_sent1,
	start_sent2,
	start_war1,
	start_war2,
	start_war3,
	cons2,



--  integers
	a = 0, 
	b = 0, 
	c = 0, 
	d = 0, 
	e = 0, 
	f = 0, 
	z = 0, 
	buildings = 0, 
	power = 0
} --End Mission

function Save()
   return Mission
end

function Load(...)
   if select("#", ...) > 0 then
      Mission = ...
   end
end

function AddObject(h) --This function is called when an object appears in the game. --
 	if (Mission.first_over) then
	
		-- ISDF POWER PLANTS
		if ((Mission.power1 == nil) and (IsOdf(h,"ibpgen"))) then
		
			Mission.power1 = h
			Mission.power1a = true
		
		elseif ((Mission.power2 == nil) and (IsOdf(h,"ibpgen"))) then
		
			Mission.power2 = h
			Mission.power2a = true
		
		elseif ((Mission.power3 == nil) and (IsOdf(h,"ibpgen"))) then
		
			Mission.power3 = h
			Mission.power3a = true
		
		elseif ((Mission.power4 == nil) and (IsOdf(h,"ibpgen"))) then
		
			Mission.power4 = h
			Mission.power4a = true

		-- SCAV DEPLOYED
		elseif ((not Mission.scav_deployed) and (IsOdf(h,"ibscav12"))) then
		
			a = (GetDistance(h,"scav1_point"))
			b = (GetDistance(h,"scav2_point"))
			c = (GetDistance(h,"scav3_point"))

			if ((a<b) and (a<c)) then
			
				Mission.scav_a = h
			
			elseif ((b<a) and (b<c)) then
			
				Mission.scav_b = h
			
			else
			
				Mission.scav_c = h
			end
			
			PrintConsoleMessage("scav1 deployed")
			Mission.scav1_deployed = true
			Mission.scav_deployed = true
		
		elseif ((Mission.scav1_deployed) and (not Mission.scav2_deployed) and (IsOdf(h,"ibscav12"))) then
		
			a = (GetDistance(h,"scav1_point"))
			b = (GetDistance(h,"scav2_point"))
			c = (GetDistance(h,"scav3_point"))

			if ((a<b) and (a<c)) then
			
				Mission.scav_a = h
			
			elseif ((b<a) and (b<c)) then
			
				Mission.scav_b = h
			
			else
			
				Mission.scav_c = h
			end

			PrintConsoleMessage("scav2 deployed")
			Mission.scav2_deployed = true
		
		elseif ((Mission.scav2_deployed) and (not Mission.scav3_deployed) and (IsOdf(h,"ibscav12"))) then
		
			a = (GetDistance(h,"scav1_point"))
			b = (GetDistance(h,"scav2_point"))
			c = (GetDistance(h,"scav3_point"))
		
			if ((a<b) and (a<c)) then
			
				Mission.scav_a = h
			
			elseif ((b<a) and (b<c)) then
			
				Mission.scav_b = h
			
			else
			
				Mission.scav_c = h
			end

			PrintConsoleMessage("scav3 deployed")
			Mission.titan_time = GetTime() + 300.0
			Mission.scav3_deployed = true	


		-- ISDF GUNTOWERS
		elseif ((Mission.guntower1 == nil) and (IsOdf(h,"ibgtow"))) then
		
			Mission.guntower1 = h
			Mission.guntower1a = true
		
		elseif ((Mission.guntower2 == nil) and (IsOdf(h,"ibgtow"))) then
		
			Mission.guntower2 = h
			Mission.guntower2a = true
		
		elseif ((Mission.guntower3 == nil) and (IsOdf(h,"ibgtow"))) then
		
			Mission.guntower3 = h
			Mission.guntower3a = true
		
		elseif ((Mission.guntower4 == nil) and (IsOdf(h,"ibgtow"))) then
		
			Mission.guntower4 = h
			Mission.guntower4a = true
		end

		-- SCOUT
		if ((Mission.scout1 == nil) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout1 = h
			Mission.scout1a = true
		
		elseif ((Mission.scout2 == nil) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout2 = h
			Mission.scout2a = true
		
		elseif ((Mission.scout3 == nil) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout3 = h
			Mission.scout3a = true
		
		elseif ((Mission.scout4 == nil) and (IsOdf(h,"fvscout"))) then
		
			Mission.scout4 = h
			Mission.scout4a = true
		
		-- GUARDIAN
		elseif ((Mission.guard1 == nil) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard1 = h
			Mission.guard1a = true
		
		elseif ((Mission.guard2 == nil) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard2 = h
			Mission.guard2a = true
		
		elseif ((Mission.guard3 == nil) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard3 = h
			Mission.guard3a = true
		
		elseif ((Mission.guard4 == nil) and (IsOdf(h,"fvturr"))) then
		
			Mission.guard4 = h
			Mission.guard4a = true

		-- SENTRY
		elseif ((Mission.sent1 == nil) and (IsOdf(h,"fvsent"))) then
		
			Mission.sent1 = h
			Mission.sent1a = true
		
		elseif ((Mission.sent2 == nil) and (IsOdf(h,"fvsent"))) then
		
			Mission.sent2 = h
			Mission.sent2a = true
		
		elseif ((Mission.sent3 == nil) and (IsOdf(h,"fvsent"))) then
		
			Mission.sent3 = h
			Mission.sent3a = true
		
		elseif ((Mission.sent4 == nil) and (IsOdf(h,"fvsent"))) then
		
			Mission.sent4 = h
			Mission.sent4a = true

		-- WARRIOR
		elseif ((Mission.war1 == nil) and (IsOdf(h,"fvtank"))) then
		
			Mission.war1 = h
			Mission.war1a = true
		
		elseif ((Mission.war2 == nil) and (IsOdf(h,"fvtank"))) then
		
			Mission.war2 = h
			Mission.war2a = true
		
		elseif ((Mission.war3 == nil) and (IsOdf(h,"fvtank"))) then
		
			Mission.war3 = h
			Mission.war3a = true
		
		elseif ((Mission.war4 == nil) and (IsOdf(h,"fvtank"))) then
		
			Mission.war4 = h
			Mission.war4a = true

		-- LANCER
		elseif ((Mission.lance1 == nil) and (IsOdf(h,"fvarch"))) then
		
			Mission.lance1 = h
			Mission.lance1a = true
		
		elseif ((Mission.lance2 == nil) and (IsOdf(h,"fvarch"))) then
		
			Mission.lance2 = h
			Mission.lance2a = true
		
		elseif ((Mission.lance3 == nil) and (IsOdf(h,"fvarch"))) then
		
			Mission.lance3 = h
			Mission.lance3a = true
		
		elseif ((Mission.lance4 == nil) and (IsOdf(h,"fvarch"))) then
		
			Mission.lance4 = h
			Mission.lance4a = true
		
		-- MAULERS
		elseif ((Mission.titan == nil) and (IsOdf(h,"fvwalk"))) then
		
			Mission.titan = h
			Mission.titana = true
		end
	
	end
	
	--[[
		This is to prevent stray scion pilots
		from jumping into scavengers and making
		the mission un-winable.  

	]]--
	if (IsOdf(h,"fspilo") and Mission.base_powered == false) then
	
		RemoveObject(h)
	end
	
end




function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function Start() --This function is called upon the first frame


--  handles
	Mission.player = GetPlayerHandle()
	Mission.srecycler = GetHandle("srecycler")
	Mission.factory = GetHandle("factory")
	Mission.service = GetHandle("service")
	Mission.armory = GetHandle("armory")
	Mission.training = GetHandle("training")
	Mission.commbunk1 = GetHandle("commbunk1")
	Mission.power1 = GetHandle("power1")
	Mission.guntower1 = GetHandle("guntower1")
	Mission.guntower2 = GetHandle("guntower2")
	Mission.guntower3 = GetHandle("guntower3")
	Mission.scav1 = GetHandle("scav1")
	Mission.empty_scav1 = GetHandle("empty_scav")
	Mission.empty_scav2 = GetHandle("scav2")
	Mission.sscav1 = GetHandle("sscav1")
	Mission.sscav2 = GetHandle("sscav2")
	Mission.sscav3 = GetHandle("sscav3")
	Mission.forge = GetHandle("forge")
	Mission.overseer = GetHandle("overseer")
	Mission.dower = GetHandle("dower")
	Mission.stronghold = GetHandle("stronghold")
	Mission.spire1 = GetHandle("spire1")
	Mission.spire2 = GetHandle("spire2")
	Mission.spire3 = GetHandle("spire3")
	Mission.bigass_machine = GetHandle("bigass_machine")
	Mission.tank1 = GetHandle("tank1")
	Mission.tank2 = GetHandle("tank2")
	Mission.tbolt1 = GetHandle("scout1")
	Mission.tbolt2 = GetHandle("scout2")
	Mission.rocket1 = GetHandle("rocket1")
	Mission.constructor = GetHandle("constructor")
	Mission.tug = GetHandle("tug")
	--spool1 = GetHandle("spool1")
	--spool2 = GetHandle("spool2")
	--spool3 = GetHandle("spool3")
	Mission.pool1_nav = GetHandle("pool1_nav")
	Mission.pool2_nav = GetHandle("pool2_nav")
	Mission.pool3_nav = GetHandle("pool3_nav")
	Mission.titan1 = GetHandle("titan1")
	Mission.titan2 = GetHandle("titan2")
	Mission.key_device = GetHandle("key_device")
	Mission.sturret1 = GetHandle("sturret1")
	Mission.sturret2 = GetHandle("sturret2")
	Mission.sturret3 = GetHandle("sturret3")
	Mission.sturret4 = GetHandle("sturret4")
	Mission.sturret5 = GetHandle("sturret5")
	Mission.sturret6 = GetHandle("sturret6")
	Mission.sturret7 = GetHandle("sturret7")
	Mission.sturret8 = GetHandle("sturret8")
	Mission.sturret9 = GetHandle("sturret9")
	Mission.sturret10 = GetHandle("sturret10")

   
end

 function IsPowered (bldg)

	Mission.a = CountUnitsNearObject(nil,99999.0,1,"ibfact")-- Mission.factory
	Mission.b = CountUnitsNearObject(nil,99999.0,1,"ibarmo")-- Mission.armory
	Mission.c = CountUnitsNearObject(nil,99999.0,1,"ibsbay")-- Mission.service bay
	Mission.d = CountUnitsNearObject(nil,99999.0,1,"ibcbun")-- comm bunker
	Mission.e = CountUnitsNearObject(nil,99999.0,1,"ibtrain")-- Mission.training facility 
	Mission.f = CountUnitsNearObject(nil,99999.0,1,"ibgtow")-- gun towers
	Mission.z = CountUnitsNearObject(nil,99999.0,1,"ibpgen")-- Mission.power

	Mission.buildings = Mission.a+Mission.b+Mission.c+Mission.d+Mission.e+Mission.f
	Mission.power = Mission.z

	if (Mission.buildings > Mission.power) then
	
		if (((Mission.buildings == 2) and (Mission.power == 1)) or
			((Mission.buildings == 3) and (Mission.power == 1)) or
			((Mission.buildings == 4) and (Mission.power == 2)) or
			((Mission.buildings == 5) and (Mission.power == 2)) or
			((Mission.buildings == 6) and (Mission.power == 2)) or
			((Mission.buildings == 7) and (Mission.power == 3))) then
		
			Mission.powered = true
		end
	
	else
	
		Mission.powered = true
	end
	return Mission.powered
end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

	Mission.player = GetPlayerHandle()

		--PrintConsoleMessage(tostring(Mission.titan_time))

	-- this is reseting the vaules when things are built

	if ((Mission.guard1a) and (not IsAlive(Mission.guard1))) then
	
		Mission.guard1a = false
	end
	if ((Mission.guard2a) and (not IsAlive(Mission.guard2))) then
	
		Mission.guard2a = false
	end
	if ((Mission.guard3a) and (not IsAlive(Mission.guard3))) then
	
		Mission.guard3a = false
	end
	if ((Mission.guard4a) and (not IsAlive(Mission.guard4))) then
	
		Mission.guard4a = false
	end

	if ((Mission.sent1a) and (not IsAlive(Mission.sent1))) then
	
		Mission.sent1a = false
	end
	if ((Mission.sent2a) and (not IsAlive(Mission.sent2))) then
	
		Mission.sent2a = false
	end
	if ((Mission.sent3a) and (not IsAlive(Mission.sent3))) then
	
		Mission.sent3a = false
	end
	if ((Mission.sent4a) and (not IsAlive(Mission.sent4))) then
	
		Mission.sent4a = false
	end

	if ((Mission.war1a) and (not IsAlive(Mission.war1))) then
	
		Mission.war1a = false
	end
	if ((Mission.war2a) and (not IsAlive(Mission.war2))) then
	
		Mission.war2a = false
	end
	if ((Mission.war3a) and (not IsAlive(Mission.war3))) then
	
		Mission.war3a = false
	end
	if ((Mission.war4a) and (not IsAlive(Mission.war4))) then
	
		Mission.war4a = false
	end

	if ((Mission.lance1a) and (not IsAlive(Mission.lance1))) then
	
		Mission.lance1a = false
	end
	if ((Mission.lance2a) and (not IsAlive(Mission.lance2))) then
	
		Mission.lance2a = false
	end
	if ((Mission.lance3a) and (not IsAlive(Mission.lance3))) then
	
		Mission.lance3a = false
	end
	if ((Mission.lance4a) and (not IsAlive(Mission.lance4))) then
	
		Mission.lance4a = false
	end

	if ((Mission.scout1a) and (not IsAlive(Mission.scout1))) then
	
		Mission.scout1a = false
	end
	if ((Mission.scout2a) and (not IsAlive(Mission.scout2))) then
	
		Mission.scout2a = false
	end
	if ((Mission.scout3a) and (not IsAlive(Mission.scout3))) then
	
		Mission.scout3a = false
	end
	if ((Mission.scout4a) and (not IsAlive(Mission.scout4))) then
	
		Mission.scout4a = false
	end
	
	if ((Mission.titana) and (not IsAlive(Mission.titan))) then
	
		Mission.titana = false
	end
	--------------------------------------------


	-- this is checking to see if the Mission.player is out of his ship then

	if (IsOdf(Mission.player,"ispilo")) then
	
		Mission.out_of_ship = true
	
	else
	
		Mission.out_of_ship = false
	end
	--------------------------------------------


	-- this is kepping the bigass machine alive

	if (IsAround(Mission.bigass_machine)) then
	
		if (GetCurHealth(Mission.bigass_machine) < 4000) then
		
			SetCurHealth(Mission.bigass_machine,4000)
		end
	end
	--------------------------------------------


	-- this is keeping the key device alive

	if (IsAround(Mission.key_device)) then
	
		if (GetCurHealth(Mission.key_device) < 4000) then
		
			SetCurHealth(Mission.key_device,4000)
		end
	end
	--------------------------------------------


	if (not Mission.start_done) then
	
		ClearObjectives()
		AddObjective("isdf1201.otf", "WHITE")
		
		Mission.start_sent1 = BuildObject("fvsent",2,"sent1_spawn")
		Mission.start_sent2 = BuildObject("fvsent",2,"sent2_spawn")
		Mission.start_war1 = BuildObject("fvtank",2,"war1_spawn")
		Mission.start_war2 = BuildObject("fvtank",2,"war2_spawn")
		Mission.start_war3 = BuildObject("fvtank",2,"war3_spawn")
		Mission.cons2 = BuildObject("ivcons",1,"train_point")
		SetGroup(Mission.cons2,4)

		SetSkill(Mission.spire1,2)
		SetSkill(Mission.spire2,3)
		SetSkill(Mission.spire3,2)
		SetSkill(Mission.start_war2,2)
		SetSkill(Mission.start_war3,2)
		SetSkill(Mission.rocket1,2)

		SetAIP("isdf1204.aip",2)

		--Goto(Mission.sscav1,spool1)
		--Goto(Mission.sscav2,spool2)
		--Goto(Mission.sscav3,spool3)

		Mission.scav_check = GetTime() + 2.0
		Mission.power_check = GetTime() + 3.0
		Mission.guntower_check = GetTime() + 2.0
		Mission.land_time = GetTime() + 15.0

		SetObjectiveOn(Mission.pool1_nav)
		tempstr = TranslateString("Mission1201")  -- BioMetalPool
		SetObjectiveName(Mission.pool1_nav,tempstr)
		SetObjectiveOn(Mission.pool2_nav)
		SetObjectiveName(Mission.pool2_nav,tempstr)
		SetObjectiveOn(Mission.pool3_nav)
		SetObjectiveName(Mission.pool3_nav,tempstr)
		SetObjectiveOff(Mission.pool1_nav)
		SetObjectiveOff(Mission.pool2_nav)
		SetObjectiveOff(Mission.pool3_nav)

		SetSkill(Mission.sturret1,2)
		--Defend(Mission.sturret1)
		SetSkill(Mission.sturret2,2)
		--Defend(Mission.sturret2)
		SetSkill(Mission.sturret3,2)
		--Defend(Mission.sturret3)
		SetSkill(Mission.sturret4,2)
		--Defend(Mission.sturret4)
		SetSkill(Mission.sturret5,2)
		--Defend(Mission.sturret5)
		SetSkill(Mission.sturret6,2)
		--Defend(Mission.sturret6)
		SetSkill(Mission.sturret7,2)
		--Defend(Mission.sturret7)
		SetSkill(Mission.sturret8,2)
		--Defend(Mission.sturret8)
		SetSkill(Mission.sturret9,2)
		--Defend(Mission.sturret9)
		SetSkill(Mission.sturret10,2)
		--Defend(Mission.sturret10)

		Defend(Mission.scav1,0)

		Mission.start_done = true
	end


	-- this is the first message when the Mission.player gets into Mission.a tank

	if ((not Mission.power_message) and (Mission.land_time < GetTime())) then
	
		Mission.talk = AudioMessage("isdf1201.wav")--(unit) glad you could join the battle sir! The bastards have taken out the Mission.power - we need to get it back online but I'm low on scrap.
		Mission.power_message = true
	end


	if ((Mission.power_message) and (not Mission.change_otf1) and (IsAudioMessageDone(Mission.talk))) then
	
		ClearObjectives()
		AddObjective("isdf1201.otf", "WHITE")
		AddObjective("isdf1202.otf", "WHITE")
		Mission.change_otf1 = true
	end
	--------------------------------------------


	-- this is destroying Mission.guntower3

	if (not Mission.guntower_show) then
	
		if (Mission.first_over) then
		
			Damage(Mission.guntower3,5001)
			Mission.guntower_show = true
		end

		if (Mission.guntower_check < GetTime()) then
		
			Mission.guntower_check = GetTime() + 2.0

			if (GetDistance(Mission.player,Mission.guntower3) < 40.0) then
			
				Damage(Mission.guntower3,5001)
				Mission.guntower_show = true
			end
		end
	end
	--------------------------------------------



	-- this is checking to see when the first wave is destroyed

	if (not Mission.first_over) then
	
		-- this is kepping the things alive

		if (IsAlive(Mission.constructor)) then
		
			if (GetCurHealth(Mission.constructor) < 500) then
			
				SetCurHealth(Mission.constructor,500)
			end
		end

		if (IsAlive(Mission.tug)) then
		
			if (GetCurHealth(Mission.tug) < 500) then
			
				SetCurHealth(Mission.tug,500)
			end
		end

		if (IsAround(Mission.factory)) then
		
			if (GetCurHealth(Mission.factory) < 1000) then
			
				SetCurHealth(Mission.factory,1000)
			end
		end

		if (IsAround(Mission.service)) then
		
			if (GetCurHealth(Mission.service) < 1000) then
			
				SetCurHealth(Mission.service,1000)
			end
		end

		if (IsAround(Mission.armory)) then
		
			if (GetCurHealth(Mission.armory) < 1000) then
			
				SetCurHealth(Mission.armory,1000)
			end
		end

		if (IsAround(Mission.training)) then
		
			if (GetCurHealth(Mission.training) < 1000) then
			
				SetCurHealth(Mission.training,1000)
			end
		end

		if (IsAround(Mission.commbunk1)) then
		
			if (GetCurHealth(Mission.commbunk1) < 1000) then
			
				SetCurHealth(Mission.commbunk1,1000)
			end
		end

		if (IsAround(Mission.power1)) then
		
			if (GetCurHealth(Mission.power1) < 1000) then
			
				SetCurHealth(Mission.power1,1000)
			end
		end

		if (IsAround(Mission.guntower1)) then
		
			if (GetCurHealth(Mission.guntower1) < 1000) then
			
				SetCurHealth(Mission.guntower1,1000)
			end
		end

		if (IsAround(Mission.guntower2)) then
		
			if (GetCurHealth(Mission.guntower2) < 1000) then
			
				SetCurHealth(Mission.guntower2,1000)
			end
		end
		--------------------------------------------


		-- this is checking to see when the first wave is over

		if ((not IsAlive(Mission.start_sent1) or Mission.start_sent1 == Mission.player) 
		and (not IsAlive(Mission.start_sent2) or Mission.start_sent2 == Mission.player) 
		and (not IsAlive(Mission.start_war1) or Mission.start_war1 == Mission.player) 
		and (not IsAlive(Mission.start_war2) or Mission.start_war2 == Mission.player)  
		and (not IsAlive(Mission.start_war3) or Mission.start_war3 == Mission.player)) then
		
			if (IsAlive(Mission.tank1)) then
			
				--Goto(Mission.tank1,Mission.player,0)
			end
			if (IsAlive(Mission.tank2)) then
			
				--Goto(Mission.tank2,Mission.player,0)
			end
			if (IsAlive(Mission.tbolt1)) then
			
				--Goto(Mission.tbolt1,Mission.player,0)
			end
			if (IsAlive(Mission.tbolt2)) then
			
				--Goto(Mission.tbolt2,Mission.player,0)
			end
			if (IsAlive(Mission.rocket1)) then
			
				--Goto(Mission.rocket1,Mission.player,0)
			end
			if (IsAround(Mission.guntower2)) then
			
				SetCurHealth(Mission.guntower2,500)
			end

			--SetObjectiveOn(Mission.pool1_nav)
			--SetObjectiveName(Mission.pool1_nav,"BioMetal Pool")
			--SetObjectiveOn(Mission.pool2_nav)
			--SetObjectiveName(Mission.pool2_nav,"BioMetal Pool")
			--SetObjectiveOn(Mission.pool3_nav)
			--SetObjectiveName(Mission.pool3_nav,"BioMetal Pool")

			Mission.first_over = true
		end
	end
	--------------------------------------------


	-- this is setting the health of the Mission.buildings after the first wave is done

	if ((Mission.first_over) and (not Mission.build_health_set)) then
	
		if (IsAround(Mission.guntower3)) then
		
			Damage(Mission.guntower3,5001)
			Mission.guntower_show = true
		end

		if (IsAround(Mission.armory)) then
		
			SetCurHealth(Mission.armory,1500)
		end

		if (IsAround(Mission.commbunk1)) then
		
			SetCurHealth(Mission.commbunk1,1500)
		end

		if (IsAround(Mission.factory)) then
		
			SetCurHealth(Mission.factory,5000)
		end

		if (IsAround(Mission.service)) then
		
			SetCurHealth(Mission.service,5000)
		end

		Mission.build_health_set = true
	end
	--------------------------------------------


	-- this is the message after the first battle is over

	if ((Mission.first_over) and (not Mission.scrap_message)) then
	
		SetAIP("isdf1201.aip",2)
		ClearObjectives()
		AddObjective("isdf1201.otf", "GREEN")
		AddObjective("isdf1202.otf", "WHITE")
		AddObjective("isdf1207.otf", "WHITE")
		AddObjective("isdf1203.otf", "WHITE")
		Mission.talk = AudioMessage("isdf1202.wav")--(manson) My orders were to take out that new machine at nav 2, but its not going to be easy with the base in this condition
		Mission.first_message = true				-- I've got one scav left.
		Mission.scrap_message = true
	end
	--------------------------------------------


	-- this is the next set of odf files 

	if ((Mission.scrap_message) and (not Mission.change_otf2) and (IsAudioMessageDone(Mission.talk))) then
	
		SetObjectiveOn(Mission.key_device)
		tempstr = TranslateString("Mission1202")  -- Power Source
		SetObjectiveName(Mission.key_device,tempstr)
		ClearObjectives()
		AddObjective("isdf1202.otf", "WHITE")
		AddObjective("isdf1203.otf", "WHITE")
		Mission.change_otf2 = true
	end
	--------------------------------------------


	-- this is the second attack wave
	if ((Mission.first_over) and (not Mission.send_second)) then
	
		if ((Mission.war1a) and (Mission.war2a) and (Mission.sent1a) and (Mission.sent2a)) then
		
			Goto(Mission.war1a,"isdf_base")
			Goto(Mission.war2a,"isdf_base")
			Goto(Mission.sent1a,"isdf_base")
			Goto(Mission.sent2a,"isdf_base")
			Mission.send_second = true
		end
	end
	--------------------------------------------


	-- this is the scav code

	if (IsOdf(Mission.player,"ivscav")) then
	
		Mission.player_in_scav = true
	
	else
	
		Mission.player_in_scav = false
	end


	if ((not Mission.scav1_alive) and (not Mission.player_in_scav)) then
	
		temp = Mission.empty_scav1

		if (IsAlive(temp)) then
		
			Mission.tugger = GetTug(Mission.empty_scav1)

			if (Mission.tugger ~= 0) then
			
				Dropoff(Mission.tug,nil,0)
			end

			Mission.pilot_made = false
			Mission.scav1_alive = true
		end
	end


	if ((not Mission.scav2_alive) and (not Mission.player_in_scav)) then
	
		temp2 = Mission.empty_scav2

		if (IsAlive(temp2)) then
		
			Mission.tugger = GetTug(Mission.empty_scav2)

			if (Mission.tugger ~= 0) then
			
				Dropoff(Mission.tug,nil,0)
			end

			Mission.pilot_made = false
			Mission.scav2_alive = true
		end
	end
	--------------------------------------------


	-- this is big messy code to determine when the base has Mission.power

	if ((not Mission.base_powered) and (Mission.power_check < GetTime())) then
	
		Mission.power_check = GetTime() + 3.0


		if (IsPowered(Mission.factory)) then
		
			Mission.base_powered = true
		end
	end
	--------------------------------------------


	if (not Mission.powered_message1) then
	
		if ((Mission.base_powered) and (not Mission.scav_deployed)) then
		
			Mission.talk = AudioMessage("isdf1206.wav")-- (manson) Nice thinking sir - the Mission.power is back online. We're still going to need to get some money
			Mission.powered_message1 = true
		
		elseif ((Mission.base_powered) and (Mission.scav_deployed)) then
		
			Mission.talk = AudioMessage("isdf1205.wav")--(Manson) Nice - the Mission.power is back up.
			Mission.powered_message1 = true
		end
	end
	--------------------------------------------

	-- this manson explaining how to deactivate the machine

	if ((not Mission.power_explained) and (Mission.powered_message1) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf1220.wav")--(Manson) to get the Mission.power machine...
		Mission.power_explained = true
	end


	-- this is checking to see when the Mission.player gets near the empty scavs

	if ((not Mission.training_message) and (Mission.scav_check < GetTime())) then
	
		Mission.scav_check = GetTime() + 2.0

		if (GetDistance(Mission.player,Mission.empty_scav1) < 70.0) then
		
			if (Mission.base_powered) then
			
				AudioMessage("isdf1207.wav")--(Manson) If we can get those two scavs back to the Mission.training faciltiy we can get them pilots
				Mission.training_message = true
			
			elseif (not Mission.base_powered) then
			
				AudioMessage("isdf1208.wav")--(Manson) If we can get those two scavs back to the Mission.training faciltiy we can get them pilots
				Mission.training_message = true	-- but we need to reestablish poer to the base first
			end
		end
	end
	--------------------------------------------


	-- this is setting the correct odfs depending on the circumstances

	if (not Mission.first_done) then
	
		if ((not Mission.base_first) and (Mission.base_powered) and (not Mission.training_message) and (not Mission.scav_deployed)) then
		
			ClearObjectives()
			AddObjective("isdf1202.otf", "GREEN")
			AddObjective("isdf1203.otf", "WHITE")
			AddObjective("isdf1207.otf", "WHITE")
			AddObjective("isdf1206.otf", "WHITE")
			Mission.first_done = true
			Mission.base_first = true
		end


		if ((not Mission.scav_first) and (not Mission.base_powered) and (not Mission.training_message) and (Mission.scav_deployed)) then
		
			ClearObjectives()
			AddObjective("isdf1202.otf", "WHITE")
			AddObjective("isdf1203.otf", "WHITE")
			AddObjective("isdf1207.otf", "GREEN")
			AddObjective("isdf1206.otf", "WHITE")
			Mission.first_done = true
			Mission.scav_first = true
		end


		if ((not Mission.train_first) and (not Mission.base_powered) and (Mission.training_message) and (not Mission.scav_deployed)) then
		
			ClearObjectives()
			AddObjective("isdf1202.otf", "WHITE")
			AddObjective("isdf1203.otf", "WHITE")
			AddObjective("isdf1205.otf", "WHITE")
			AddObjective("isdf1207.otf", "WHITE")
			AddObjective("isdf1206.otf", "WHITE")
			Mission.first_done = true
			Mission.train_first = true
		end
	end
	--------------------------------------------

		
	if ((Mission.first_done) and (not Mission.second_done)) then
	
		if (Mission.base_first) then
		
			if ((Mission.training_message) and (not Mission.scav_deployed)) then
			
				ClearObjectives()
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1207.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.second_done = true
				Mission.train_second = true
			
			elseif ((not Mission.training_message) and (Mission.scav_deployed)) then
			
				ClearObjectives()
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1207.otf", "GREEN")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.second_done = true
				Mission.scav_second = true
			end
		end

		if (Mission.train_first) then
		
			if ((Mission.base_powered) and (not Mission.scav_deployed)) then
			
				ClearObjectives()
				AddObjective("isdf1202.otf", "WHITE")
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1207.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.second_done = true
				Mission.base_second = true
			
			elseif ((not Mission.base_powered) and (Mission.scav_deployed)) then
			
				ClearObjectives()
				AddObjective("isdf1202.otf", "WHITE")
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1207.otf", "GREEN")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.second_done = true
				Mission.scav_second = true
			end
		end

		if (Mission.scav_first) then
		
			if ((Mission.base_powered) and (not Mission.training_message)) then
			
				ClearObjectives()
				AddObjective("isdf1202.otf", "GREEN")
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.second_done = true
				Mission.base_second = true
			
			elseif ((not Mission.base_powered) and (Mission.training_message)) then
			
				ClearObjectives()
				AddObjective("isdf1202.otf", "WHITE")
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.second_done = true
				Mission.train_second = true
			end
		end
	end
	--------------------------------------------


	if ((Mission.second_done) and (not Mission.last_done)) then
	
		if ((Mission.base_first) and (Mission.train_second)) then
		
			if (Mission.scav_deployed) then
			
				ClearObjectives()
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1207.otf", "GREEN")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.last_done = true
			end
		
		elseif ((Mission.base_first) and (Mission.scav_second)) then
		
			if (Mission.training_message) then
			
				ClearObjectives()
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.last_done = true
			end
		
		elseif ((Mission.train_first) and (Mission.base_second)) then
		
			if (Mission.scav_deployed) then
			
				ClearObjectives()
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1207.otf", "GREEN")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.last_done = true
			end
		
		elseif ((Mission.train_first) and (Mission.scav_second)) then
		
			if (Mission.base_powered) then
			
				ClearObjectives()
				AddObjective("isdf1202.otf", "GREEN")
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.last_done = true
			end
		
		elseif ((Mission.scav_first) and (Mission.train_second)) then
		
			if (Mission.base_powered) then
			
				ClearObjectives()
				AddObjective("isdf1202.otf", "GREEN")
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.last_done = true
			end
		
		elseif ((Mission.scav_first) and (Mission.base_second)) then
		
			if (Mission.training_message) then
			
				ClearObjectives()
				AddObjective("isdf1203.otf", "WHITE")
				AddObjective("isdf1205.otf", "WHITE")
				AddObjective("isdf1206.otf", "WHITE")
				Mission.last_done = true
			end
		end
	end
	--------------------------------------------


	-- this is loading Mission.a new plan
--[[
	if (not Mission.new_plan1) then
	
		if (Mission.scav3_deployed) then
		
			SetAIP("isdf1202.aip",2)
			Mission.new_plan1 = true
		end
	end
	--------------------------------------------
]]--

	-- this is sending the titans to attack

	if ((not Mission.titan_attack) and (Mission.titan_time < GetTime())) then
	
		if (IsAlive(Mission.titan1)) then
		
			if (IsAround(Mission.factory)) then
			
				Attack(Mission.titan1,Mission.factory)
			end

			if (IsAlive(Mission.titan2)) then
			
				if (IsAround(Mission.armory)) then
				
					Attack(Mission.titan2,Mission.armory)
				end
			end
		
		elseif (IsAlive(Mission.titan2)) then
		
			if (IsAround(Mission.factory)) then
			
				Attack(Mission.titan2,Mission.factory)
			end
		end

		Mission.titan_attack = true
	end
	--------------------------------------------


	-- this is setting the new aip once the titans are sent

	if ((not Mission.last_aip) and (Mission.titan_attack) and (not IsAlive(Mission.titan1)) and (not IsAlive(Mission.titan2))) then
	
		SetAIP("isdf1203.aip",2)
		Mission.last_aip = true
	end
	--------------------------------------------


-- these are the win/loose conditions

	if (not Mission.game_over) then
	
		-- this is if the Mission.player wins then

		if (IsAlive(Mission.key_device)) then
		
			Mission.tugger = GetTug(Mission.key_device)

			if (IsAlive(Mission.tugger)) then
			
				if (GetTeamNum(Mission.tugger) == 1) then
				
					SucceedMission(GetTime() + 10.0,"isdf12w1.txt")
					AudioMessage("isdf1203.wav")--(braddock) well done
					Mission.game_over = true
				end
			end
		end
		--------------------------------------------


		-- this is if the Mission.tug gets destoyed then

		if (not IsAlive(Mission.tug)) then
		
			FailMission(GetTime() + 10.0)
			AudioMessage("isdf1204.wav")--(braddock) you let the Mission.tug get destroyed
			Mission.game_over = true
		end
		--------------------------------------------

	end
 	
end