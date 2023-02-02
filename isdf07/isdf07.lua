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
	next_unit = false,
	startDone = false,
	recyDeployed = false,
	constBuilt = false,
	scavBuilt = false,
	powerBuilt = false,
	gunTowBuilt = false,
	creaturesAttack = false,
	wallsBuilt = false,
	ruinsDiscovered = false,
	shabOutOfVehicle = false,
	shabHasOrder = false,
	shabState = 0,
	relicFound = false,
	shabHurt = false,
	troopsAttacked = false,
	getNewOrder = false,
	playerOnFoot = false,
	justHoped = false,
	winMission = false,
	relayBuilt = false,
	enemy1deployed = false,
	enemy2deployed = false,
	enemy3deployed = false,
	ship_blown_up = false,
	shab_dead = false,
	
	reminderTimer = 0.0,
	timeToFail = 0.0,
	errorRemTime1 = 0.0,
	errorRemTime2 = 0.0,
	missionState = 0,
	ivtankCount = 0,
	ivrcktCount = 0,
	ivturrCount = 0,
	ivscavCount = 0,
	ibpgenCount = 0,
	movie_counter = 0,
	harrass_count = 0,
	artil_counter = 0,
	BugFix = 0,
	comp_team = 2,
	player,
	shabayev,
	oldPlayer,
	artil,
	spawn1,
	spawn2,
	animal1,
	spawn3,
	ruins,
	enemy1,
	enemy2,
	enemy3,
	enemy4,
	creature1,
	creature2,
	creature3,
	creature4,
	shabEnemy1,
	shabEnemy2,
	shabOnFoot,
	playerEnemy1,
	recy

   
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
	Ally(3,1)
	Ally(1,3)
	
	Mission.player = GetPlayerHandle()
	Mission.recy = GetHandle("recycler")
	Mission.shabayev = nil
	Mission.spawn1 = nil
	Mission.spawn2 = nil
	Mission.animal1 = nil
	Mission.spawn3 = nil
	Mission.ruins = nil
	Mission.enemy1 = nil
	Mission.enemy2 = nil
	Mission.enemy3 = nil
	Mission.enemy4 = nil
	Mission.creature1 = nil
	Mission.creature2 = nil
	Mission.creature3 = nil
	Mission.creature4 = nil
	Mission.shabEnemy1 = nil
	Mission.shabEnemy2 = nil
	Mission.shabOnFoot = nil
	Mission.playerEnemy1 = nil
	
	PreloadODF("fvtank")
	PreloadODF("fvsent")
	PreloadODF("fvscout")
	PreloadODF("fvartl")
	PreloadODF("fvarch")
	
	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	GiveWeapon(Mission.player,"gchainvsr_c")
	GiveWeapon(Mission.player,"gshadowvsr_c")
	GiveWeapon(Mission.player,"gproxminvsr")

	SetGroup(Mission.recy,0)
   
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

	if IsOdf(h, "ivscout:1") then	
		temp = GetGroup(h)
		h = UnitToVSR(h, "ivscout_vsr", 0)	
		Goto(h, GetHandle("autonav"), 0)
		SetGroup(h, temp)
	end

	if IsOdf(h, "ivturr:1") then	
		temp = GetGroup(h)
		h = UnitToVSR(h, "ivturr_vsr", 0)	
		Goto(h, GetHandle("autonav"), 0)
		SetGroup(h, temp)
		SendEnemies(3, h)
	end

	if (IsOdf(h,"ibrecy")) then
	
		temp = BuildObject("fvscout_vsr", Mission.comp_team, Mission.spawn1)
		Attack(temp, h, 1)
		Mission.recy = h
		Mission.recyDeployed = true
	end


	if ((not Mission.scavBuilt) and (IsOdf(h,"ivscav:1")))  then
--		temp = BuildObject("fvsent_vsr", Mission.comp_team, Mission.spawn1)
--		Attack(temp, h, 1)
		Mission.scavBuilt = true
	
	elseif ((not Mission.powerBuilt) and (IsOdf(h,"ibpgen")))	 then
		Mission.powerBuilt = true
	
	elseif ((not Mission.wallsBuilt) and (IsOdf(h,"ibwall")))  then
		Mission.wallsBuilt = true

		
	elseif ((not Mission.constBuilt) and (IsOdf(h,"ivcons:1")))  then
		SendEnemies(2, h)
		Mission.constBuilt = true
	
	elseif ((not Mission.relayBuilt) and (IsOdf(h,"ibcbun"))) then
	
		SendEnemies(3,h)
		Mission.relayBuilt = true
	
	elseif ((not Mission.gunTowBuilt) and (IsOdf(h,"ibgtow")))  then
		SendEnemies(4, h)
		gtow = h
		Mission.gunTowBuilt = true
	
	elseif ((not Mission.shabOutOfVehicle) and (IsOdf(h,"ispilo")) and h ~= Mission.player)  then
		PrintConsoleMessage("checking hop")
		if (Mission.justHoped)  then
			PrintConsoleMessage("shab out")
			Mission.shabOnFoot = h
			Mission.shabOutOfVehicle = true
		end
	
	elseif ((Mission.shabOutOfVehicle) and (IsOdf(h,"ispilo")) and h == GetPlayerHandle())  then
		PrintConsoleMessage("player out")
		Mission.playerOnFoot = true
		Mission.oldPlayer = Mission.player
	end

	if (IsOdf(h,"ivtank:1"))   then --react to Mission.player building a tank then
		
		temp = GetGroup(h)
		h = UnitToVSR(h, "ivtank_vsr", 0)	
		Goto(h, GetHandle("autonav"), 0)
		SetGroup(h, temp)
		SendEnemies(0, h)
	
	elseif (IsOdf(h,"ivrckt:1"))   then --react to the Mission.player building a rocket tank then
		SendEnemies(1, h)
		
	end

end


function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function SendEnemies(attack_type, target)

	if attack_type == 0 then --tank
		if (not IsAlive(Mission.enemy1))  then
			Mission.enemy1 = BuildObject("fvtank_vsr", Mission.comp_team, Mission.spawn1)
			Attack(Mission.enemy1, target, 1)
		end
		
	elseif attack_type == 1 then --rocket
		if (not IsAlive(Mission.enemy1))  then
			Mission.enemy1 = BuildObject("fvsent_vsr", Mission.comp_team, Mission.spawn1)
			Attack(Mission.enemy1, target, 1)
		end
		if (not IsAlive(Mission.enemy2))  then
			Mission.enemy2 = BuildObject("fvsent_vsr", Mission.comp_team, Mission.spawn2)
			Attack(Mission.enemy2, target, 1)
		end
		
	elseif attack_type == 2 then --constructor
		if (not IsAlive(Mission.enemy1))  then
			Mission.enemy1 = BuildObject("fvtank_vsr", Mission.comp_team, Mission.spawn1)
			Attack(Mission.enemy1, target, 1)
		end
		
	elseif attack_type == 3 then --turret
		if (not IsAlive(Mission.enemy1))  then
			Mission.enemy1 = BuildObject("fvarch_vsr", 2, Mission.spawn1)
			Attack(Mission.enemy1, target, 1)
		end
		if (not IsAlive(Mission.enemy2))  then
			Mission.enemy2 = BuildObject("fvarch_vsr", 2, Mission.spawn2)
			Attack(Mission.enemy2, target, 1)
		end
		
	elseif attack_type == 4 then --gun tower
		SetIndependence(Mission.enemy1, 0)
		SetIndependence(Mission.enemy2, 0)
		Mission.enemy1 = BuildObject("fvtank_vsr", 2, Mission.spawn1)
		Mission.enemy2 = BuildObject("fvtank_vsr", 2, Mission.spawn2)
		Mission.enemy3 = BuildObject("fvsent_vsr", 2, Mission.spawn3)
		Attack(Mission.enemy1, target, 1)
		Attack(Mission.enemy2, target, 1)
		Defend2(Mission.enemy3, Mission.enemy1, 1)
		
	end
	-- so we transform them later
	Mission.enemy1deployed = false
	Mission.enemy2deployed = false
end

function ProcessCommand(crc) 

--	CinProcessCommand(crc)
	if (crc == 3663682790)  then
		BeginCin = true
	end
	if (crc == 220803983)  then
		BeginSeq = true
	end
end

function checkWing(wingName, player) 
	-- this is checking to make sure the Mission.player does not attack his wingman --------/

	if ((IsAlive(wingName)) and (IsAlive(player))) then
	
		if (GetTime() - GetLastFriendShot(wingName) < .2) then
		
		--	AudioMessage("shotwing.wav") -- (shab) --watch your firingnot 
		end
	end
end

function CommandShab() 

 
	if Mission.shabState == 0 then  --setup the first batch of enemies
		Mission.shabEnemy1 = BuildObject("fvsent_vsr", Mission.comp_team, Mission.spawn1)
		Mission.shabEnemy2 = BuildObject("fvsent_vsr", Mission.comp_team, Mission.spawn2)
		Attack(Mission.shabEnemy1, Mission.shabayev, 1)
		Attack(Mission.shabEnemy2, Mission.shabayev, 1)
		Attack(Mission.shabayev, Mission.shabEnemy1, 1)
		Mission.shabState = Mission.shabState + 1
		
	elseif Mission.shabState == 1 then --do nothing until the first enemy gets killed
		if (not IsAlive(Mission.shabEnemy1))  then
			if (IsAlive(Mission.shabEnemy2))  then
				Attack(Mission.shabayev, Mission.shabEnemy2, 1)
				Mission.shabState = Mission.shabState + 1
			
			else 
				Mission.shabState = Mission.shabState + 1
			end
		end

		if (Mission.gunTowBuilt)   then --If shab can't kill anybody do it for her then
			Damage(Mission.shabEnemy1, 3000)
			if (IsAlive(Mission.shabEnemy2))  then
				Damage(Mission.shabEnemy2, 3000)
			end
			ClearObjectives()
			AddObjective("isdf0707.otf", "WHITE")
			Goto(Mission.shabayev, "tree_point", 1)
			AudioMessage("isdf0728.wav")
			Mission.shabState = 3
			Mission.BugFix = GetTime()+60.0
		end

		
	elseif Mission.shabState == 2 then --go NEAR the ruin when all of the enemies are killed
		if ((Mission.missionState>8) and (IsAlive(Mission.shabEnemy2)))   then --If shab can't kill anybody do it for her then
			Damage(Mission.shabEnemy2, 3000)
		end
		if ((not IsAlive(Mission.shabEnemy1)) and (not IsAlive(Mission.shabEnemy2)) and (not Mission.gunTowBuilt))  then
			Mission.shabEnemy2 = BuildObject("fvsent_vsr", 2, Mission.spawn1)
			Attack(Mission.shabayev, Mission.shabEnemy2, 1)
			Attack(Mission.shabEnemy2, Mission.shabayev, 1)

		end
		if ((not IsAlive(Mission.shabEnemy1)) and (not IsAlive(Mission.shabEnemy2)) and (Mission.gunTowBuilt))  then
			ClearObjectives()
			AddObjective("isdf0710.otf", "WHITE")
			AudioMessage("isdf0728.wav")
			Goto(Mission.shabayev, "tree_point", 1)
			Mission.BugFix = GetTime()+20.0
			Mission.shabState = Mission.shabState + 1
		end
		
	elseif Mission.shabState == 3 then --hop out of the vehicle when near the ruin
		PrintConsoleMessage("shab check")
		if IsAlive(Mission.enemy1) then
			Damage(Mission.enemy1, 3000)
		end
		if (GetTime()>Mission.BugFix) then
		
			Goto(Mission.shabayev,"tree_point")
			Mission.BugFix = GetTime()+10.0	
		end
		if (((GetDistance(Mission.shabayev, "tree_point") < 25.0)) and ((not IsAlive(Mission.enemy1)) or (not IsAlive(Mission.enemy2)))) then
			PrintConsoleMessage("shab check2")
			ClearObjectives()
			AudioMessage("isdf0725.wav")

			AddObjective("isdf0707.otf", "WHITE")
			Mission.justHoped = true
			HopOut(Mission.shabayev)
--				SetObjectiveOn(Mission.shabOnFoot)
			hunter=	BuildObject("fvsent_vsr",Mission.comp_team,"hunter")
--			Patrol(temp,"hunter_path")
			Attack(hunter,Mission.shabayev) -- blow up shabs craft
			CameraReady()
			Mission.reminderTimer = GetTime()+60.0
			Mission.shabState = Mission.shabState + 1
		end
		
	elseif Mission.shabState == 4 then
		Mission.oldPlayer = HoppedOutOf(Mission.shabOnFoot)	-- because shab becomes 0
		
		pos = GetPosition(Mission.oldPlayer)
		CameraObject(Mission.oldPlayer,2,5,-7,Mission.oldPlayer)		
		LookAt(Mission.shabOnFoot, Mission.ruins, 1)
		RemoveObject(Mission.oldPlayer)
		Mission.oldPlayer = BuildObject("petank",1,pos)

		Mission.shabState = Mission.shabState + 1
		
	elseif Mission.shabState == 5 then
		if (Mission.movie_counter<70) then
		
			CameraObject(Mission.oldPlayer,2,2,-7,Mission.oldPlayer)
			Mission.movie_counter = Mission.movie_counter + 1
		
		else
		
			RemoveObject(Mission.oldPlayer)
			temp = BuildObject("ibnav",1,"tree_point")
			tempstr = TranslateString("Mission0701")  -- Rescue
			SetObjectiveName(temp,tempstr)
			SetObjectiveOn(temp)
			CameraFinish()
			Mission.shabState = Mission.shabState + 1
		end
		
	elseif Mission.shabState == 6 then --order the Mission.player to get out of his vehicle once he gets close
		if ((not IsAround(Mission.shabayev)) and (not Mission.ship_blown_up)) then
		
			Patrol(hunter,"hunter_path")
			SetIndependence(hunter,0)
			Mission.ship_blown_up = true

		end

		if ((not IsAlive(Mission.shabOnFoot) and (not Mission.shab_dead)))	 then
		
			AudioMessage("isdf0732.wav")
			ClearObjectives()
			AddObjective("isdf05l1.otf","RED",15.0)
			FailMission(GetTime()+5.0,"isdf05l1.otf")
			Mission.shab_dead = true
		end

		if (GetTime()>Mission.reminderTimer)  then
			AudioMessage("isdf0725.wav")
			Mission.reminderTimer = GetTime()+60.0
		end
		
		if ((GetDistance(Mission.shabOnFoot, Mission.player) < 50.0))  then

			--RemoveObject(Mission.shabayev)
			Attack(Mission.shabEnemy1,Mission.shabayev)
			Attack(Mission.shabEnemy2,Mission.shabayev)
			ClearObjectives()
			AudioMessage("isdf0729.wav")
			AddObjective("isdf0708.otf", "WHITE")
			Mission.shabState = Mission.shabState + 1
		end
		

	elseif Mission.shabState == 7 then --send shab to get the relic
		if ((not IsAlive(Mission.shabOnFoot) and (not Mission.shab_dead)))	 then
		
			AudioMessage("isdf0732.wav")
			ClearObjectives()
			AddObjective("isdf05l1.otf","RED",15.0)
			FailMission(GetTime()+5.0,"isdf05l1.otf")
			Mission.shab_dead = true
		end
		if (Mission.playerOnFoot)  then
			Attack(Mission.shabEnemy1,Mission.oldPlayer)
			Attack(Mission.shabEnemy2,Mission.oldPlayer)
			Goto(Mission.shabOnFoot, Mission.ruins, 1)
			--we should start the patrols here
			Mission.shabState = Mission.shabState + 1
		end
		
	elseif Mission.shabState == 8 then --get shab hurt
		if ((not IsAlive(Mission.shabOnFoot) and (not Mission.shab_dead)))	 then
		
			AudioMessage("isdf0732.wav")
			ClearObjectives()
			AddObjective("isdf05l1.otf","RED",15.0)
			FailMission(GetTime()+5.0,"isdf05l1.otf")
			Mission.shab_dead = true
		end

		if ((GetDistance(Mission.shabOnFoot, Mission.ruins) < 20.0) or (GetDistance(Mission.player,Mission.ruins)<10.0)) then
		
			if (Mission.winMission == false)  then
				AudioMessage("isdf0731.wav") -- wrong file name
				SucceedMission(GetTime()+5.0,"isdf07w1.txt")
				Mission.winMission = true
			end
		end
		
	--elseif Mission.shabState == 9 then --hide shab
		
		
	elseif Mission.shabState == 10 then --play closing cineractive
	-- The following is an example of how to play a movie in a script.
		moviePlaying = PlayMovie("temp")
		if (not moviePlaying)  then
			Mission.missionState = Mission.missionState + 1
			moviePlaying = true
			--IFace_SetInteger("script.mission.state", 1)
		end
			
	end

	if (GetHealth(Mission.shabayev) < 0.7)   then --keep shab alive then
		AddHealth(Mission.shabayev, 100)
	end

	if ((GetAmmo(Mission.shabayev)) < 0.5)  then
		AddAmmo(Mission.shabayev, 500)
	end
	if ((Mission.justHoped) and (not IsAlive(Mission.shabOnFoot))) then
	

		i = 1
		-- Houston we have a problem
	end

end


function handlePlayerMistakes() 
	if (Mission.missionState < 6) 	 then --Not enough scrap then
		if ((Mission.missionState>3) and
			(GetScrap(1) < 6) and (GetTime() > Mission.errorRemTime1)) then
			ClearObjectives()
			AddObjective("isdf0709.otf", "WHITE")
			--AudioMessage("isdf0709.wav")
			Mission.errorRemTime1 = (GetTime() + 60.0)
		end


	end

	if (not IsAlive(Mission.shabayev)) 	 then --kills Mission.shabayev then
	--	AudioMessage("Demo0304.wav") -- "Cooke.  You're being shipped back to Earth where you'll face court marshall for killing a commanding officer.
	--	FailMission(GetTime() + 15.0)
	end

--[[	if (not IsAlive(Mission.player))   then --gets killed then
	--	AudioMessage("Demo0304.wav") -- you loose go to shell screen
		FailMission(GetTime() + 15.0)
	end]]

	if (Mission.missionState == 6)  then --does not follow Mission.shabayev then
		if ((GetDistance(Mission.player, Mission.shabayev) > 400.0) and (GetTime() < Mission.timeToFail))  then
		--	AudioMessage("tooFar.wav") --"Cooke, you're getting too far from my wing.  Fall in.
			Mission.timeToFail = GetTime() + 60.0
		
		
		else
			if (GetDistance(Mission.player, Mission.shabayev) < 400.0)  then
			Mission.timeToFail = 0.0
			end
		end


	end
--	if (Mission.missionState == 7)  then --does not get out of his vehicle then

--	end
	if (Mission.missionState == 9)  then --ignores Mission.shabayev's need for help then
		if ((GetDistance(Mission.player, Mission.shabayev) > 40.0) and (GetTime() < Mission.timeToFail))  then
		--	AudioMessage("tooFar.wav") --"Cooke, you're getting too far from my wing.  Fall in.
			Mission.timeToFail = GetTime() + 60.0
		end
		if  (GetDistance(Mission.player, Mission.shabayev) < 40.0)  then
			Mission.timeToFail = 0.0
		end

	end
end


function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --


	
--[[ The following is needed for editing cineractives. 
	if (BeginCin == true)  then
		BeginCin = PlayMove()
	end

	if (BeginSeq == true)  then
		temp = "***"
		BeginSeq = PlayMovie(temp)
	end
	if (IFace_GetFloat("script.cin.edit") == 1.0)  then
--		cinToolSetup()
		IFace_SetFloat("script.cin.edit", 0.0)
	end
 The above is needed for editing cineractives. ]]



	
	Mission.player = GetPlayerHandle()

	--This section evaluates what has happened.
	checkWing(Mission.shabayev, Mission.player) --Did we hurt our friendly instructor.
	
	if Mission.missionState == 0 then  --This will do the setup for the mission.
		Mission.spawn1 = GetHandle("spawn_1")
		Mission.spawn2 = GetHandle("spawn_2")
		Mission.spawn3 = GetHandle("spawn_3")
		Mission.creature1 = BuildObject("mcjak01",0,"creature1")
		Mission.creature2 = BuildObject("mcjak01",0,"creature2")
		Mission.creature3 = BuildObject("mcjak01",0,"creature3")
		Mission.creature4 = BuildObject("mcjak01",0,"creature4")

		Mission.shabayev = BuildObject("ivtank",3,"spawn_shab")
		Mission.ruins = GetHandle("ruins")
		SetScrap(1, 40)
--			Mission.playerEnemy1 = BuildObject("fvtank_vsr", 2, Mission.spawn3)
--			Attack(Mission.playerEnemy1, Mission.player, 1)
		CommandShab()
		AudioMessage("isdf0701.wav")
		AudioMessage("isdf0740.wav")
		AudioMessage("isdf0702.wav")
		AudioMessage("isdf0703.wav")
		SetSkill(Mission.shabayev,3)
		SendEnemies(0,Mission.player)
		
		-- brad added
		poolHandle = GetHandle("unnamed_nepool01")
		SpawnBirds(1, 5, "mcwing01", 0, poolHandle, poolHandle)

		Mission.missionState = Mission.missionState + 1
		
	elseif Mission.missionState == 1 then --Check to see if the Mission.player has deployed their recycler. then
		if (not Mission.getNewOrder)  then
			ClearObjectives()
			AudioMessage("isdf0704.wav")
			AddObjective("isdf0701.otf", "WHITE")
			Mission.reminderTimer = (GetTime() + 60.0)
			if (not IsAlive(Mission.animal1))  then
				Mission.animal1 = BuildObject("mcjak01", 2, Mission.spawn3) --This will be changed to the animal
				Goto(Mission.animal1, Mission.recy)
				SetIndependence(Mission.animal1, 0)
			end
			Mission.getNewOrder = true
		end

		--	Mission.recyDeployed = IsDeployed(Mission.recy)
		if (Mission.recyDeployed)  then
			AudioMessage("isdf0706.wav")
			Mission.missionState = Mission.missionState + 1
			Mission.getNewOrder = false
		end
		if ((IsAlive(Mission.playerEnemy1)) and (not Mission.enemy1deployed) and
			(GetDistance(Mission.recy,Mission.playerEnemy1)<100.0)) then
		
			Mission.enemy1deployed = true
		end
		if ((not IsAlive(Mission.playerEnemy1)) and (not IsAlive(Mission.enemy1)))  then
			Mission.playerEnemy1 = BuildObject("fvtank_vsr", Mission.comp_team, Mission.spawn3)
			Attack(Mission.playerEnemy1, Mission.player, 1)
		end
		
	elseif Mission.missionState == 2 then --Check to see if the Mission.player has built a scavenger. then

		if (not Mission.getNewOrder)  then
			ClearObjectives()
			AddObjective("isdf0702.otf", "WHITE")
			Mission.reminderTimer = (GetTime() + 60.0)
			AudioMessage("isdf0708.wav")
			Mission.getNewOrder = true
		end
		if (Mission.scavBuilt)  then

			AudioMessage("isdf0707.wav")
			Mission.reminderTimer = (GetTime() + 120.0)
			Mission.missionState = Mission.missionState + 1
			Mission.getNewOrder = false
		end
		if ((IsAlive(Mission.playerEnemy1)) and (not Mission.enemy1deployed) and
			(GetDistance(Mission.recy,Mission.playerEnemy1)<100.0)) then
		
			Mission.enemy1deployed = true
		end
		if ((not IsAlive(Mission.playerEnemy1)) and (not IsAlive(Mission.enemy1)))  then
			Mission.playerEnemy1 = BuildObject("fvtank_vsr", 2, Mission.spawn3)
			Attack(Mission.playerEnemy1, Mission.player, 1)
		end

		
	elseif Mission.missionState == 3 then --Check to see if the Mission.player has built a construction rig. then
		if (not Mission.getNewOrder)  then
			ClearObjectives()
			AddObjective("isdf0703.otf", "WHITE")
			AudioMessage("isdf0710.wav")
			Mission.reminderTimer = (GetTime() + 130.0)
			Mission.getNewOrder = true
		end
		if ((IsAlive(Mission.playerEnemy1)) and (not Mission.enemy1deployed) and
			(GetDistance(Mission.recy,Mission.playerEnemy1)<100.0)) then
		
			Mission.enemy1deployed = true
		end
		if (Mission.constBuilt)  then
			Mission.missionState = Mission.missionState + 1
			Mission.getNewOrder = false
		end
		
	elseif Mission.missionState == 4 then --Check to see if the Mission.player has built a power plant. then
		if (not Mission.getNewOrder)  then
			ClearObjectives()
			AddObjective("isdf0704.otf", "WHITE")
			AudioMessage("isdf0714.wav")
			Mission.reminderTimer = (GetTime() + 150.0)
			Mission.getNewOrder = true
		end
		if (Mission.powerBuilt)  then
			Mission.missionState = Mission.missionState + 1
			Mission.getNewOrder = false
		end
		if ((not IsAlive(Mission.playerEnemy1)) and (not IsAlive(Mission.enemy1)))  then
			Mission.playerEnemy1 = BuildObject("fvtank_vsr", 2, Mission.spawn3)
			Attack(Mission.playerEnemy1, Mission.player, 1)

		end

		
	elseif Mission.missionState == 5 then  -- check to see if the Mission.player has built a relay bunker then
		if (not Mission.getNewOrder)  then
			ClearObjectives()
			AddObjective("isdf0705.otf", "WHITE")
			AudioMessage("isdf0716.wav")
			Mission.reminderTimer = (GetTime() + 150.0)
			Mission.getNewOrder = true
		end
		if (Mission.relayBuilt)  then
			Mission.missionState = Mission.missionState + 1
			Mission.getNewOrder = false
		end

		
	elseif Mission.missionState == 6 then --Check to see if the Mission.player has built a gun tower then
		if (not Mission.getNewOrder)  then
			ClearObjectives()
			AddObjective("isdf0706.otf", "WHITE")
			AudioMessage("isdf0719.wav")
			Mission.reminderTimer = (GetTime() + 150.0)
			Mission.getNewOrder = true
		end
		if (Mission.gunTowBuilt)  then
		
			Mission.missionState = Mission.missionState + 1
			Mission.artil = BuildObject("fvartl_vsr",2,"artil")
			Goto(Mission.artil,"artillery")
			temp = BuildObject("fvscout_vsr",2,Mission.spawn2)
			Follow(temp,Mission.artil)
			BuildObject("fvscout_vsr",2,Mission.spawn3)
			Follow(temp,Mission.artil)
			Mission.artil_counter = 0
			Mission.getNewOrder = false
		end
		
	elseif Mission.missionState == 7 then  -- now they will use artillery
		Mission.artil_counter = Mission.artil_counter + 1
		if (Mission.artil_counter==300) then
		
			Attack(Mission.artil,gtow)
	--		CameraReady()
		end
		if ((Mission.artil_counter>300) and (Mission.artil_counter<355)) then
		
	--		CameraObject(Mission.artil,12,8,3,Mission.artil)
		end
		if (Mission.artil_counter==355) then
		
	--		CameraFinish()
			Mission.missionState = Mission.missionState + 1
		end
		-- cheesy code but I am tired
		
	elseif Mission.missionState == 8 then
		if (not IsAlive(Mission.artil)) then
		
			Mission.missionState = Mission.missionState + 1
		end
			
	
	end
	
	currentTime = GetTime()
	if ((Mission.reminderTimer < currentTime) and (Mission.getNewOrder))   then --This checks to see if we should remind the Mission.player of his order. then
		Mission.getNewOrder = false
	end
	Mission.harrass_count = Mission.harrass_count + 1
	if (Mission.harrass_count%701==0) then
	
		SendEnemies(1,Mission.player)
	end
	CommandShab()
	handlePlayerMistakes()
	if (Mission.shabState<3)  then
		if ((not IsAlive(Mission.shabayev) and (not Mission.shab_dead)))	 then
		
			AudioMessage("isdf0732.wav")
			ClearObjectives()
			AddObjective("isdf05l1.otf","RED",15.0)
			FailMission(GetTime()+5.0,"isdf05l1.otf")
			Mission.shab_dead = true
		end
	end

	if ((not IsAround(Mission.recy)) and (not Mission.shab_dead)) then
	
		FailMission(GetTime()+5.0,"isdf05l1.otf")
		Mission.shab_dead = true
	end



 	
end