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
	scout1toofar,
	
	been_detected = false,
	jammer_exists = false,
	art_objective1 = false,
	art_objective2 = false,
	last_objective = false,
	tank2toofar,
	tank1toofar,
	
	
--  floats

--  handles
	player,
	temp,
	shab,
	grp,
	talk1,
	enemybase,
	power1,
	power2,
	objective2,
	con1,
	con2,
	con3,
	con4,
	jammer = nil,
	artillery = nil,
	artillery2 = nil,  -- fail safe
	turret1,
	turret2,
	sent1,
	sent2,
	scav1,
	scav2,
	atk,
	atk1,

	objective,
	
	enemytank1,
	enemytank2,
	enemyscout1,
	enemyscout2,
	scout,
	oldscout,
	recycler,
	ant_mound,
	tap,
	base_unit_1,
	base_unit_2,
	base_unit_3,
	base_unit_4,
	scout1,
	basetank1,
	basetank2,


--  integers
	mission_state = 0,
	scout_state = 99,
	scout_counter = 0,
	comp_team = 2,
	increment = 0
   
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
	Mission.jammer = nil
	Mission.artillery = nil
	Mission.artillery2 = nil  -- fail safe
	Mission.player = GetPlayerHandle()

	Mission.player = UnitToVSR(Mission.player, "fvsent_vsr", 1)
   
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

function AddObject(h) --This function is called when an object appears in the game. --
	if (IsOdf(h,"fbrecy_vsr")) then
	
		Mission.recycler = h
	end

	if (IsOdf(h,"fbjamm_vsr") and GetDistance(h, "Jammer") < 75) then

	
		Mission.jammer_exists = true
		Mission.jammer = h
	end
	if ((IsOdf(h,"fvartl_vsr")) and (Mission.artillery==nil)) then
	
		Mission.artillery = h
	end
	if ((IsOdf(h,"fvartl_vsr:1")) and (Mission.artillery==nil)) then
	
		Mission.artillery = h
	end
	if ((IsOdf(h,"fvartl_vsr")) and (Mission.artillery2==nil)) then
	
		Mission.artillery2 = h
	end
	if ((IsOdf(h,"fvartl_vsr:1")) and (Mission.artillery2==nil)) then
	
		Mission.artillery2 = h
	end
	
	if ((IsOdf(h, "fvcons_vsr") or IsOdf(h, "fvcons_vsr:1")) and Mission.con1 == nil) then 
		PrintConsoleMessage("con1 built")
		Mission.con1 = h
		return
	elseif ((IsOdf(h, "fvcons_vsr") or IsOdf(h, "fvcons_vsr:1")) and Mission.con2 == nil) then 
		PrintConsoleMessage("con2 built")
		Mission.con2 = h
		return
	elseif ((IsOdf(h, "fvcons_vsr") or IsOdf(h, "fvcons_vsr:1")) and Mission.con3 == nil) then 
		PrintConsoleMessage("con3 built")
		Mission.con3 = h
		return
	elseif ((IsOdf(h, "fvcons_vsr") or IsOdf(h, "fvcons_vsr:1")) and Mission.con4 == nil) then 
		PrintConsoleMessage("con4 built")
		Mission.con4 = h
		return
	end

	if IsOdf(h, "fvtank_vsr:1") then 
	
		if Mission.newwar == nil then 
			Mission.newwar = h
			Mission.newwar_wait = GetTime() + 1
			Mission.newwar_morphed = false
		end
	

	end
end


function DeleteObject(h) --This function is called when an object is deleted in the game.

	if Mission.con1 == h then
		Mission.con1 = nil
		return
	elseif Mission.con2 == h then
		Mission.con2 = nil
		return
	elseif Mission.con3 == h then
		Mission.con3 = nil
		return
	elseif Mission.con4 == h then
		Mission.con4 = nil
		return
	end

end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function HandleScout()
	
	Mission.scout_counter = Mission.scout_counter + 1
	if ((Mission.scout_state>3) and (Mission.scout_counter%1500==0)) then
	
		Mission.scout_state = 0
	end

	if Mission.scout_state == 0 then
		if (Mission.mission_state>2) then
		
			Mission.scout = BuildObject("ivscout_vsr",Mission.comp_team,"spawn_scout1")  -- may get stuck?
			Goto(Mission.scout,"scav_1")
		
		else
		
			Mission.scout = BuildObject("ivscout_vsr",Mission.comp_team,"spawn_scout2")  -- may get stuck?
			Goto(Mission.scout,"tank_1")
		end
		Mission.oldscout = Mission.scout
		Mission.scout_state = Mission.scout_state + 1
		
	elseif Mission.scout_state == 1 then
		if (not IsAlive(Mission.scout)) then
		
			Mission.scout_state = 4
		else
		
			Mission.temp = GetNearestEnemy(Mission.scout)
			if ((GetDistance(Mission.scout,"scav_1")<100.0)  
				or (GetDistance(Mission.scout,"tank_1")<100.0) 
				or ((IsAlive(Mission.temp)) and (GetDistance(Mission.scout,Mission.temp)<75.0))
				) then
			
				SetObjectiveOn(Mission.scout)
				tempstr = TranslateString("MissionS0203")  -- Enemy Scout				
				SetObjectiveName(Mission.scout,tempstr)
				AudioMessage("scion0212.wav")  -- a Mission.scout is within the perimeter, we must destroy it before he reports back
				Goto(Mission.scout,"epgen_1")
				Mission.scout_state = Mission.scout_state + 1
			end
		end
		
	elseif Mission.scout_state == 2 then
		if (GetDistance(Mission.scout,"epgen_1")<100.0) then
		
			Mission.mission_state = 101
			AudioMessage("scion0220.wav")  -- oh no we've been detected
			been_detected = true
			
		end
		if (not IsAlive(Mission.scout)) then
		
			Mission.scout_state = 4
		end
		
	end

end

function ArtilleryObjective() 
	ClearObjectives()
	if (Mission.art_objective1)  then
		AddObjective("scion0205.otf","GREEN",5.0)
	
	else AddObjective("scion0205.otf","WHITE",5.0)
	end
	
	if (Mission.art_objective2)  then
		AddObjective("scion0209.otf","GREEN",5.0)
	
	else AddObjective("scion0209.otf","WHITE",5.0)
	end
end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --


	Mission.player = GetPlayerHandle()


	if not Mission.newwar_morphed and IsAlive(Mission.newwar) and Mission.newwar_wait < GetTime() then

		if GetWeaponConfig( Mission.newwar,  0) == "garcvsr_c" then
			SetCommand(Mission.newwar, 48)
			Mission.newwar_morphed = true
			Mission.newwar = nil
		end
		
		
	end

		
		

	

	if ((not been_detected) and (Mission.mission_state<5))  then -- 5 =  ambush is set then
	
		--[[
		foe = GetWhoShotMe(Mission.player)
		if ((foe~=nil) and (foe~=Mission.oldscout) and
			(IsAlive(Mission.oldscout)) and -- I just added this.. probably unness if HandleScout worked then
			(GetTeamNum(Mission.oldscout)==Mission.comp_team))
		]]
		if ((GetDistance(Mission.enemytank1,Mission.player)<75.0) or
			(GetDistance(Mission.enemytank2,Mission.player)<75.0) or
			(GetDistance(Mission.enemyscout1,Mission.player)<75.0) or
			(GetDistance(Mission.enemyscout2,Mission.player)<75.0)) then
		
			been_detected = true
			Mission.mission_state = 101
			AudioMessage("scion0220.wav")  -- oh no we've been detected
			been_detected = true
		end
		HandleScout()
	end
	


	if Mission.mission_state == 0 then 
		
		-- HACK to fix bug
			Mission.shab = GetHandle("shabayev")  -- what is she doing here anyway?
			RemoveObject(Mission.shab)

		-- play message
			Mission.talk1 = AudioMessage("scion0201.wav")
	
		-- take over base
			SetScrap(1,40)

		-- Your starting base
			Mission.grp = GetFirstEmptyGroup()			
			Mission.recycler = BuildObject("fvrecy_vsr",1,"recycler")
			SetGroup(Mission.recycler,Mission.grp)	

			Mission.grp = Mission.grp + 1
			Mission.scav1 = BuildObject("fvscav_vsr",1,"scav_1")
			SetGroup(Mission.scav1,Mission.grp)
			Mission.grp = Mission.grp + 1
			Mission.scav2 = BuildObject("fvscav_vsr",1,"scav_2")
			SetGroup(Mission.scav2,Mission.grp)	
		
			Mission.grp = Mission.grp + 1
			Mission.turret1 = BuildObject("fvturr_vsr",1,"turret_1")
			SetGroup(Mission.turret1,Mission.grp)
			Mission.turret2 = BuildObject("fvturr_vsr",1,"turret_2")
			SetGroup(Mission.turret2,Mission.grp)

			Mission.grp = Mission.grp + 1
			Mission.sent1 = BuildObject("fvtank_vsr",1,"tank_1")
			SetGroup(Mission.sent1,Mission.grp)
			Mission.sent2 = BuildObject("fvtank_vsr",1,"tank_2")
			SetGroup(Mission.sent2,Mission.grp)

			Mission.grp = Mission.grp + 1

			Mission.con1 = BuildObject("fvcons_vsr",1,"cons_1")
			SetGroup(Mission.con1,Mission.grp)


			Mission.objective = BuildObject("ibnav",1,"Jammer")

--	These units have smaller engage ranges
			Mission.enemytank1 = BuildObject("ivtank_vsr",2,"etank_1")
			Mission.enemyscout1 = BuildObject("ivscout_vsr",2,"escout_1")	

			Mission.enemytank2 = BuildObject("ivtank_vsr",2,"etank_2")
			Mission.enemyscout2 = BuildObject("ivscout_vsr",2,"escout_2")

			Patrol(Mission.enemytank1,"isdf_patrol1",0)
			Patrol(Mission.enemyscout1,"isdf_patrol1",0)

			Patrol(Mission.enemytank2,"isdf_patrol2",0)
			Patrol(Mission.enemyscout2,"isdf_patrol2",0)

			BuildObject("ibgtow_vsr",Mission.comp_team,"egtow_1")
			BuildObject("ibgtow_vsr",Mission.comp_team,"egtow_2")
			Mission.power1 = BuildObject("ibpgen_vsr",Mission.comp_team,"epgen_1")
			Mission.power2 = BuildObject("ibpgen_vsr",Mission.comp_team,"epgen_2")
			BuildObject("ibsbay_vsr",Mission.comp_team,"esbay")
			BuildObject("ibfact_vsr",Mission.comp_team,"efact")
			Mission.enemybase = BuildObject("ibrecy_vsr",Mission.comp_team,"erecy")
			BuildObject("ibarmo_vsr",Mission.comp_team,"earmo")

			Mission.base_unit_1 = BuildObject("ivtank_vsr",Mission.comp_team,"base_unit_1")
			Mission.base_unit_2 = BuildObject("ivmisl_vsr",Mission.comp_team,"base_unit_2")
			Mission.base_unit_3 = BuildObject("ivtank_vsr",Mission.comp_team,"base_unit_3")
			Mission.base_unit_4 = BuildObject("ivmisl_vsr",Mission.comp_team,"base_unit_4")
			
			Mission.mission_state = Mission.mission_state + 1
	
		
	elseif Mission.mission_state == 1 then  -- further instruction
		if ((IsAudioMessageDone(Mission.talk1))) then
		
				ClearObjectives()
				AudioMessage("scion0202.wav")
				AddObjective("scion0201.otf","WHITE",20.0)
				SetObjectiveOn(Mission.objective) 
				tempstr = TranslateString("MissionS0201")  -- Ambush
				SetObjectiveName(Mission.objective,tempstr)
				Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 2 then  -- Mission.player arrives at ambush site
		if (GetDistance(Mission.player,"Jammer")<75.0)	 then
		
			AudioMessage("scion0203.wav")  -- good now set up
			ClearObjectives()
			AddObjective("scion0202.otf","WHITE",20.0)
			AddObjective("scion0203.otf","WHITE",20.0)
			Mission.mission_state = Mission.mission_state + 1

		end
		
	elseif Mission.mission_state == 3 then -- wait for the Mission.constructor to show up
			
			
			if ((GetDistance(Mission.con1,"Jammer")<75.0) or (GetDistance(Mission.con2,"Jammer")<75.0) 
			or (GetDistance(Mission.con3,"Jammer")<75.0) or (GetDistance(Mission.con4,"Jammer")<75.0))  then
				
				AudioMessage("scion0204.wav") -- Good, now build a Mission.jammer
				ClearObjectives()
				AddObjective("scion0202.otf","GREEN",5.0)
				AddObjective("scion0203.otf","WHITE",5.0)
				Mission.mission_state = Mission.mission_state + 1
			end
		
	elseif Mission.mission_state == 4 then
			if (Mission.jammer_exists) then
			
				AudioMessage("scion0205.wav")  
				-- now drive into the enemy base and lead them to 
				-- your ambush.  
				ClearObjectives()
				AddObjective("scion0204.otf","WHITE",10.0)
				Mission.mission_state = Mission.mission_state + 1
				SetIndependence(Mission.enemytank1,1)
				SetIndependence(Mission.enemytank2,1)
				SetIndependence(Mission.enemyscout1,1)
				SetIndependence(Mission.enemyscout2,1)
				been_detected = true  -- doesn't matter now
			end
		
	elseif Mission.mission_state == 5 then
		if ((GetDistance(Mission.player,Mission.base_unit_1)<200.0) or
			(GetDistance(Mission.player,Mission.base_unit_2)<200.0)
			or (GetDistance(Mission.player,Mission.enemytank1)<75.0)
			or (GetDistance(Mission.player,Mission.enemyscout1)<75.0)) then
		
			AudioMessage("scion0206.wav")
			-- Here they comenot 
			Goto(Mission.base_unit_1,"go_jammer")
			Goto(Mission.base_unit_2,"go_jammer")
			Goto(Mission.base_unit_3,"go_jammer")
			Goto(Mission.base_unit_4,"go_jammer")
			Attack(Mission.enemyscout1,Mission.player)
			Attack(Mission.enemytank1,Mission.player)
			-- the ambush has begun
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 6 then -- wait for ambush to end
		if (not IsAlive(Mission.player)) then
		
			if (IsAlive(Mission.base_unit_1))   then
				Attack(Mission.base_unit_1,Mission.jammer)
			end
			if (IsAlive(Mission.base_unit_2)) then
				Attack(Mission.base_unit_2,Mission.jammer)
			end
			if (IsAlive(Mission.base_unit_3)) then
				Attack(Mission.base_unit_3,Mission.jammer)
			end
			if (IsAlive(Mission.base_unit_4)) then
				Attack(Mission.base_unit_4,Mission.jammer)
			end
			if (IsAlive(Mission.enemyscout1)) then
				Attack(Mission.enemyscout1,Mission.player)
			end
			if (IsAlive(Mission.enemytank1)) then
				Attack(Mission.enemytank1,Mission.player)
			end
		end
		if ((not IsAlive(Mission.base_unit_1)) and
			(not IsAlive(Mission.base_unit_2)) and
			(not IsAlive(Mission.base_unit_3)) and
			(not IsAlive(Mission.base_unit_4))) then
		
			AudioMessage("scion0207.wav")
			ArtilleryObjective()
			--[[
				Now we will use Mission.artillery
				to finish off the base surgically
			]]
			-- set where the Mission.artillery goes as an objective, 
			-- wait for the Mission.player to build it
			SetObjectiveOff(Mission.objective)
			Mission.objective2 = BuildObject("ibnav",1,"escout_1")
			SetObjectiveOn(Mission.objective2)
			tempstr = TranslateString("MissionS0202")  -- Artillery
			SetObjectiveName(Mission.objective2,tempstr)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 7 then  -- wait for Mission.artillery
		if ((IsAlive(Mission.artillery)) or (IsAlive(Mission.artillery2))) then
		
			AudioMessage("scion0208.wav")
			Mission.art_objective1 = true
			ArtilleryObjective()
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 8 then  -- wait for it to get there
		if ( 
			((IsAlive(Mission.artillery)) and (GetDistance(Mission.artillery,Mission.objective2)<50.0)) or 
			((IsAlive(Mission.artillery2)) and (GetDistance(Mission.artillery2,Mission.objective2)<50.0))  ) then
		
			Mission.art_objective2 = true
			ArtilleryObjective()
			AudioMessage("scion0209.wav")
			SetObjectiveOn(Mission.power1)
			SetObjectiveOn(Mission.power2)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 9 then
		Mission.increment = Mission.increment + 1
		if (Mission.increment%300==0) then
		
			if (not Mission.last_objective)  then
				ClearObjectives()
				AddObjective("scion0206.otf","WHITE",5.0)
				Mission.last_objective = true
			end
			Mission.atk1 = BuildObject("ivscout_vsr",2,"base_unit_2")
			Attack(Mission.atk1,Mission.artillery)
		end
		if ((not IsAlive(Mission.power1)) or (not IsAlive(Mission.power2))) then
		
			AudioMessage("scion0210.wav")
			if (IsAlive(Mission.power1)) then
				SetObjectiveOff(Mission.power1)
			end
			if (IsAlive(Mission.power2)) then
				SetObjectiveOff(Mission.power2)
			end
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 10 then
		if (GetDistance(Mission.player,"erecy")<75.0) then
		
			AudioMessage("scion0211.wav")
			SucceedMission(GetTime()+10.0,"scion02w1.txt")
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 101 then  -- Mission.player is detected too soon
		
			Mission.increment = Mission.increment + 1
			if (Mission.increment%300==0) then
			
				Mission.atk = BuildObject("ivtank_vsr",Mission.comp_team,"efact")
				Attack(Mission.atk,Mission.recycler)
				Mission.atk = BuildObject("ivmbike_vsr",Mission.comp_team,"efact")
				Attack(Mission.atk,Mission.recycler)
				Mission.atk = BuildObject("ivrckt_vsr",Mission.comp_team,"spawn_scout1")
				Goto(Mission.atk,"strike1")
			end
		
		
	elseif Mission.mission_state == 102 then

		
			FailMission(GetTime()+15.0,"scion0201.otf")
			Mission.mission_state = Mission.mission_state + 1
		
	end
				


	if ((Mission.mission_state<102) and (not IsAlive(Mission.recycler))) then
	
		Mission.mission_state = 102
	end


end