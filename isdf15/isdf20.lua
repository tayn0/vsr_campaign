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
	first_thing= true,
	ambush1_spawned= false,
	go_home= false,
	seen_scout1= false,
	seen_scout2= false,
  --  floats
  uhoh = 99999.0,
  ambush_delay = 999999.0,

--  handles
	manson,
	mbike_1,
	mbike_2,
	mbike_3,
	tank_1,
	tank_2,
	etank_1,
	etank_2,
--  etank_3,
	earch_1,
	earch_2,
--  earch_3,
	eatank_1,
	eatank_2,
	eatank_3,
	scav_1,
	scav_2,
	espir_2,
	esent_1,
	esent_2,
	espir_1,
	after_briefing,
	rckt_1,
	rckt_2,
	base_1,
	base_2,
	base_3,
	espir_3,
	esent_3,
	esent_4,
	annoy_scout1 = nil,
	annoy_scout2 = nil,
--  integers
	annoy_timer = 0,
	comp_team = 6,
	serv_1,
	base_4,
	player,

	mission_state = 0
   
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
	SetTeamColor(Mission.comp_team,114,197,255)
	
	Mission.player = GetPlayerHandle()
	Mission.mbike_1 = nil
	Mission.mbike_2 = nil
	Mission.mbike_3 = nil
	Mission.tank_1 = nil
	Mission.tank_2 = nil
	Mission.etank_1 = nil
	Mission.etank_2 = nil
--  etank_3 = nil
	Mission.earch_1 = nil
	Mission.earch_2 = nil
--  earch_3 = nil
	Mission.eatank_1 = nil
	Mission.eatank_2 = nil
	Mission.eatank_3 = nil
	Mission.scav_1 = nil
	Mission.scav_2 = nil
	Mission.espir_2 = nil
	Mission.esent_1 = nil
	Mission.esent_2 = nil
	Mission.espir_1 = nil
	Mission.after_briefing = nil
	Mission.rckt_1 = nil
	Mission.rckt_2 = nil
	Mission.base_1 = nil
	Mission.base_2 = nil
	Mission.base_3 = nil
	Mission.espir_3 = nil
	Mission.esent_3 = nil
	Mission.esent_4 = nil
	Mission.annoy_scout1 = nil
	Mission.annoy_scout2 = nil
end


function AddObject(h) --This function is called when an object appears in the game. --

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

function PeriodicAttack()

	if ((Mission.mission_state<6) and (not IsAlive(Mission.annoy_scout1)) 
		and (not IsAlive(Mission.annoy_scout2))
		and (Mission.annoy_timer>300)) then
	
		Mission.annoy_timer = 0
	end
	if (Mission.annoy_timer==300) then
	
		Mission.annoy_scout1 = BuildObject("ivscout",Mission.comp_team,"lung2")
		Mission.annoy_scout2 = BuildObject("ivscout",Mission.comp_team,"lung2")
		Attack(Mission.annoy_scout1,Mission.player)
		Attack(Mission.annoy_scout2,Mission.serv_1)
		seen_scout1 = false
		seen_scout2 = false
	end
	if ((not seen_scout1) and
		(GetDistance(Mission.annoy_scout1,Mission.player)<100.0))  then
	
		seen_scout1 = true
		SetObjectiveOn(Mission.annoy_scout1)
		tempstr = TranslateString("Mission2001")  -- Rebel
		SetObjectiveName(Mission.annoy_scout1,tempstr)
	end
	if ((not seen_scout2) and (GetDistance(Mission.annoy_scout2,Mission.player)<100.0)) then
	
		seen_scout2 = true
		SetObjectiveOn(Mission.annoy_scout2)
		tempstr = TranslateString("Mission2001")  -- Rebel
		SetObjectiveName(Mission.annoy_scout2,tempstr)

	end
	Mission.annoy_timer = Mission.annoy_timer + 1
end

function missionCode() --


	--[[
		LANDSLIDE INFO
		- .bzn has file reslida1.odf
		- Don't forget to delete bin data before you try this
		- Run animation on reslid01.odf
		- Replace it with reslidea1.odf
	]]
	player = GetPlayerHandle()

	Ally(1,3)


	if Mission.mission_state == 0 then
				-- build this stuff at start
	--[[	
			recy = BuildObject("ivrecy",1,"Recycler")
			grp = GetFirstEmptyGroup()
		SetGroup(recy,grp)			
		SetScrap(1,30)
		]]
		-- deleted for Nathan
		  --[[
		Mission.mbike_1 = BuildObject("ivmbike",3,"mbike1")
		Mission.mbike_2 = BuildObject("ivmbike",3,"mbike2")
		Mission.mbike_3 = BuildObject("ivmbike",3,"mbike3")
		]]
		Mission.tank_1 = BuildObject("ivatank",1,"tank1")  -- was atank
		SetGroup(Mission.tank_1,0)
		Mission.tank_2 = BuildObject("ivrckt",1,"tank2")  -- was atank
		SetGroup(Mission.tank_2,1)
		-- serv= BuildObject("ivserv",1,"serv")
		-- Set
		--    Mission.scav_1 = BuildObject("ivscav",1,"scav1")
		--    Mission.scav_2 = BuildObject("ivscav",1,"scav2")
--			Mission.rckt_1 = BuildObject("ivrckt",1,"rckt1")
--			Mission.rckt_2 = BuildObject("ivrckt",1,"rckt2")
		SetGroup(Mission.rckt_1,1)
		SetGroup(Mission.rckt_2,1)
		Mission.serv_1 = BuildObject("ivserv",1,"scav1")
		SetGroup(Mission.serv_1,2)

		Mission.espir_2 = BuildObject("ibgtow",Mission.comp_team,"base_here")
		Mission.esent_1 = BuildObject("ivmisl",Mission.comp_team,"esentpath1")
		Mission.esent_2 = BuildObject("ivmisl",Mission.comp_team,"esentpath1")
		Mission.espir_1 = BuildObject("ibgtow",Mission.comp_team,"espir1")
		Mission.base_1 = BuildObject("ibfact",Mission.comp_team,"estro1")
		Mission.base_2 = BuildObject("ibpgen",Mission.comp_team,"ekiln1")

		Mission.base_3 = BuildObject("ibpgen",Mission.comp_team,"power_x")  -- was eforg1
		Mission.base_4 = BuildObject("ibcbun",Mission.comp_team,"bunker_x")
		Mission.espir_3 = BuildObject("ibgtow",Mission.comp_team,"espir3")
		Mission.esent_3 = BuildObject("ivscout",Mission.comp_team,"esent3")
		Mission.esent_4 = BuildObject("ivscout",Mission.comp_team,"esent4")
		ClearObjectives()
		AddObjective("isdf20a.otf","WHITE",10.0)
		Patrol(Mission.esent_1,"esentpath1")
		Follow(Mission.esent_2,Mission.esent_1)
		Mission.after_briefing= GetTime()+20.0
		slide1 = GetHandle("unnamed_reslida1")
		--Vector temp = GetPosition(slide1)
		RemoveObject(slide1)

		nav = BuildObject("ibnav",1,"lung2")
		SetObjectiveOn(nav)
		tempstr = TranslateString("Mission2002")  -- Rebel Base
		SetObjectiveName(nav,tempstr)
		-- SetPosition(slide2??

		--[[
			So the mission isn't too slow. 
		]]
		AddHealth(Mission.espir_1,-3000)
		AddHealth(Mission.espir_2,-3000)
		Mission.mission_state = Mission.mission_state + 1
		audio = AudioMessage("isdf2021.wav")
		CameraReady()
		
	elseif Mission.mission_state == 1 then
		CameraPath("camera1",200,200,Mission.player)

--			CameraObject(Mission.espir_1,30,20,20,Mission.espir_1)
		if (IsAudioMessageDone(audio)) then
		
			audio = AudioMessage("isdf2022.wav")
			Mission.mission_state = Mission.mission_state + 1	
		end
		
	elseif Mission.mission_state == 2 then
		CameraPath("camera2",200,200,Mission.espir_2)
		if (IsAudioMessageDone(audio)) then
			
			AudioMessage("isdf2001.wav")
			CameraFinish()
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 3 then  --the attack begins
		
			-- after the opening briefing, AI squadron drives to fight sentry units on their own
			if (GetTime() > Mission.after_briefing) then
			
			--	Goto(Mission.mbike_1,"front_ambush")
			--	Goto(Mission.mbike_2,"front_ambush")
			--	Goto(Mission.mbike_3,"front_ambush")
			--	Goto(Mission.rckt_1,"front_ambush")
			--	Goto(Mission.rckt_2,"front_ambush")
				temp = BuildObject("ivscout",Mission.comp_team,"lung2")
				Attack(temp,Mission.player)
				Mission.mission_state = Mission.mission_state + 1
			end
		
		
	elseif Mission.mission_state == 4 then -- Kill the sentries

		-- AI squadron engages sentry units
		if ((GetDistance(Mission.tank_1,"front_ambush")<200.0)  or
			  (GetDistance(Mission.tank_2,"front_ambush")<200.0)  or
				(GetDistance(Mission.rckt_1,"front_ambush")<200.0)  or
				(GetDistance(Mission.rckt_2,"front_ambush")<200.0)  or
				(GetDistance(Mission.player,"front_ambush")<200.0) )  then
		
			--[[
			Attack(Mission.mbike_1,Mission.esent_1)
			Attack(Mission.mbike_2,Mission.esent_2)
			Attack(Mission.mbike_3,Mission.esent_1)
			]]
			SetObjectiveOn(Mission.esent_1)

			tempstr = TranslateString("Mission2001")  -- Rebel
			SetObjectiveName(Mission.esent_1,tempstr)
			SetObjectiveOn(Mission.esent_2)
			SetObjectiveName(Mission.esent_2,tempstr)
	--		Attack(Mission.rckt_1,Mission.esent_2)
	--		Attack(Mission.rckt_2,Mission.esent_1)
		end
-- once the sentrys are destroyed, AI squadron heads to enemy gun tower and stops
		if ((not IsAlive(Mission.esent_1))  and  (not IsAlive(Mission.esent_2))) then
		
			--[[
			Goto(Mission.mbike_1,"front_ambush")
			Goto(Mission.mbike_2,"front_ambush")
			Goto(Mission.mbike_3,"front_ambush")
			]]
	--		Goto(Mission.rckt_1,"front_ambush")
	--		Goto(Mission.rckt_2,"front_ambush")
	--		temp = BuildObject("ivscout",2,"lung2")
	--		Attack(temp,serv_1)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 5 then  -- wait till they get to the tower
		if ((
			(GetDistance(Mission.tank_1,"front_ambush")<75.0)  or
			(GetDistance(Mission.rckt_2,"front_ambush")<75.0)  or
			(GetDistance(Mission.player,"front_ambush")<75.0)))  then
			
				temp = BuildObject("ivscout",Mission.comp_team,"lung2")
				Attack(temp,Mission.player)
				AudioMessage("isdf2002.wav") -- use your assault tanks
				ClearObjectives()
				AddObjective("isdf2002.otf","WHITE",20.0)
				SetObjectiveOn(Mission.espir_1)
			tempstr = TranslateString("Mission2003")  -- Gun Tower
				SetObjectiveName(Mission.espir_1,tempstr)
				--temp = BuildObject("ivscout",2,"lung2")
				--Attack(temp,player)
				Mission.mission_state = Mission.mission_state + 1
			end
		
	elseif Mission.mission_state == 6 then -- destroy the tower
-- once you destroy the gun tower, AI squadron heads to next gun tower and stops
			if (not IsAlive(Mission.espir_1))   then
			
				Goto(Mission.mbike_1,"exit1")
				Goto(Mission.mbike_2,"exit1")
				Goto(Mission.mbike_3,"exit1")
	--			AudioMessage("isdf2003.wav") -- now let's press on to the base
	--			Goto(Mission.rckt_1,"exit1")
	--			Goto(Mission.rckt_2,"exit1")
	--			temp = BuildObject("ivscout",2,"lung2")
	--			Attack(temp,serv_1)
				Mission.mission_state = Mission.mission_state + 1

			end			
		
	elseif Mission.mission_state == 7 then  -- now go to the next tower
		if (((GetDistance(Mission.tank_1,"exit1")<50.0)  or
			(GetDistance(Mission.rckt_1,"exit1")<50.0)  or
			(GetDistance(Mission.player,"exit1")<50.0)))  then
		
			ClearObjectives()
			AddObjective("isdf2003.otf","WHITE",20.0)
			AudioMessage("isdf2003.wav")
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 8 then  -- until enemy spire is dead
		if (not IsAlive(Mission.espir_2))	 then
		
--				Attack(Mission.mbike_1,Mission.base_1)
--				Attack(Mission.mbike_2,Mission.base_1)
--				Attack(Mission.mbike_3,Mission.base_1)
			Attack(Mission.rckt_1,Mission.base_1,0)
			Attack(Mission.rckt_2,Mission.base_1,0)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 9 then
		if (not IsAlive(Mission.base_1))  then
		
--				Attack(Mission.mbike_1,Mission.base_2)
--				Attack(Mission.mbike_2,Mission.base_2)
--				Attack(Mission.mbike_3,Mission.base_2)
			AudioMessage("isdf2004.wav")
			Attack(Mission.rckt_1,Mission.base_2,0)
			Attack(Mission.rckt_2,Mission.base_2,0)
			Mission.mission_state = Mission.mission_state + 1
		end

		
	elseif Mission.mission_state == 10 then
		if (not IsAlive(Mission.base_2)) then
		
--				Attack(Mission.mbike_1,Mission.base_3)
--				Attack(Mission.mbike_2,Mission.base_3)
--				Attack(Mission.mbike_3,Mission.base_3)
			Attack(Mission.rckt_1,Mission.base_3,0)
			Attack(Mission.rckt_2,Mission.base_3,0)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 11 then -- is the third base dead?
		if (not IsAlive(Mission.base_3))   then
		
--[[
			Goto(Mission.mbike_1,"homebase")
			Goto(Mission.mbike_2,"homebase")
			Goto(Mission.mbike_3,"homebase")
]]
			Goto(Mission.rckt_1,"homebase",0)
			Goto(Mission.rckt_2,"homebase",0)
			-- keep the player bunched up
			Follow(Mission.tank_1,Mission.player,0)
			Follow(Mission.tank_2,Mission.player,0)

			ClearObjectives()
			AddObjective("isdf2004.otf","WHITE",20.0)
			SetObjectiveOff(nav)
			nav = BuildObject("ibnav",1,"scav2")
			tempstr = TranslateString("Mission2004")  -- Rencezvous
			SetObjectiveName(nav,tempstr)
			SetObjectiveOn(nav)
			AudioMessage("isdf2005.wav")
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 12 then
-- first ambush launches as soon as you exit enemy base after destroying it
-- second ambush comes in from behind
		if  (GetDistance(Mission.player,"exit1")<125.0) then
				
  
			  Mission.ambush_delay = GetTime()+15.0
			  Mission.mission_state =   Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 13 then
		if (GetTime()>Mission.ambush_delay)  then
		
			Mission.eatank_1 = BuildObject("ivtank",Mission.comp_team,"eatank1")
			Mission.eatank_2 = BuildObject("ivtank",Mission.comp_team,"eatank2")
			Mission.eatank_3 = BuildObject("ivmbike",Mission.comp_team,"eatank3")
			SetSkill(Mission.eatank_1,2)
			SetSkill(Mission.eatank_2,2)
			SetSkill(Mission.eatank_3,2)
			Attack(Mission.eatank_1,Mission.player)
			Attack(Mission.eatank_2,Mission.player)
			Attack(Mission.eatank_3,Mission.player)
			Mission.etank_1 = BuildObject("ivtank",Mission.comp_team,"etank1")
			Mission.etank_2 = BuildObject("ivtank",Mission.comp_team,"etank2")
			etank_3 = BuildObject("ivmbike",Mission.comp_team,"etank3")
			Mission.earch_1 = BuildObject("ivtank",Mission.comp_team,"earch1")
			Mission.earch_2 = BuildObject("ivtank",Mission.comp_team,"earch2")
			earch_3 = BuildObject("ivmisl",Mission.comp_team,"earch3")
			Mission.manson = BuildObject("ivatank",Mission.comp_team,"manson")
			Attack(Mission.etank_1,Mission.player)
			Attack(Mission.etank_2,Mission.player)
			Attack(etank_3,Mission.player)
			Attack(Mission.earch_1,Mission.player)
			Attack(Mission.earch_2,Mission.player)
			Attack(earch_3,Mission.player)
			Attack(Mission.manson,Mission.player)
			uhoh= GetTime()+20.0
			Mission.mission_state = Mission.mission_state + 1
		end
					
	elseif Mission.mission_state == 14 then
		if (GetTime() > uhoh)  then
		
			AudioMessage("isdf2006.wav")
			AudioMessage("isdf2007.wav")
			ClearObjectives()
			AddObjective("isdf2005.otf","WHITE",20.0)
			temp = BuildObject("ivapc",Mission.comp_team,"lung2")  -- now you are screwed
			Attack(temp,Mission.player)
--				temp = BuildObject("ivapc",2,"lung2")
--				Attack(temp,player)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 15 then
		-- how do you win??
		if ((not seen_manson) and (GetDistance(Mission.player,Mission.manson)<200.0)) then
		
			seen_manson = true
			SetObjectiveOn(Mission.manson)
		end
		if (not IsAlive(Mission.manson)) then
		
			AudioMessage("isdf2010.wav")	
			SucceedMission(GetTime()+10.0,"isdf20w1.txt")
			Mission.mission_state = Mission.mission_state + 1
		end

			
	end  -- switch (Mission.mission_state)
	PeriodicAttack()




end