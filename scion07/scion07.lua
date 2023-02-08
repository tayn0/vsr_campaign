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
	missionstart = false,
	pool1taken = false,
	vo1 = false,
	obj1 = false,
	vo2 = false,
	obj2 = false,
	extractor1_deployed = false,
	extractor2_deployed = false,
	vo3 = false,
	obj3 = false,
	pool2taken = false,
	vo2b = false,
	obj2b = false,
	vo4 = false,
	obj3b = false,
	pool3taken = false,
	vo2c = false,
	obj2c = false,
	extractor3_deployed = false,
	vo5 = false,
	obj5 = false,
	isdfbasekilled = false,
	checkturret1alive = false,
	turret1alive = false,
	checkturret1dead = false,
	turret1go = false,
	checkturret2alive = false,
	turret2alive = false,
	checkturret2dead = false,
	turret2go = false,
	checkbasetank1alive = false,
	basetank1alive = false,
	checkbasetank1dead = false,
	basetank1go = false,
	checkbasetank2alive = false,
	basetank2alive = false,
	checkbasetank2dead = false,
	basetank2go = false,
	checkbasescout1alive = false,
	basescout1alive = false,
	checkbasescout1dead = false,
	basescout1go = false,
	checkbasescout2alive = false,
	basescout2alive = false,
	checkbasescout2dead = false,
	basescout2go = false,
	checkbasescout3alive = false,
	basescout3alive = false,
	checkbasescout3dead = false,
	basescout3go = false,
	vo6 = false,
	vo7 = false,
	obj6 = false,
	playeratmachine = false,
	vo8 = false,
	machineclear = false,
	vo9 = false,
	obj7 = false,
	settimes_pool1 = false,
	pool1guarda_attack = false,
	pool1guardb_attack = false,
	settimes_pool2 = false,
	pool2guarda_attack = false,
	pool2guardb_attack = false,
	pool3guarda_attack = false,
	pool3guardb_attack = false,
	settimes_pool3 = false,
	playersrecy_dead = false,
	vo_recydead = false,
	obj8 = false,
	walker_cin_over = false,
	walker_shot1 = false,
	walker_rdycam1 = false,
	walkers_move1 = false,
	walk1_stop = false,
	braddock_stop = false,
	walk2_stop = false,
	walker_shot2 = false,
	walker_shot2_settime = false,
	timed_attacks_over = false,
	base_attack1 = false,
	base_attack2 = false,
	base_attack3 = false,
	cinvo1 = false,
	vo10 = false,
	vo11 = false,
	settime_reset_walks = false,
	reset_walks = false,
	done_controlling_walks = false,
--  floats
	vo1time = 999999.9,
	vo2time = 999999.9,
	vo2btime = 999999.9,
	vo2ctime = 999999.9,
	vo3time = 999999.9,	
	vo4time = 999999.9,
	vo5time = 999999.9,
	basetank1movetime = 999999.9,
	basetank2movetime = 999999.9,
	turret1movetime = 999999.9,
	turret2movetime = 999999.9,
	turret2movetime = 999999.9,
	basescout1movetime = 999999.9,
	basescout2movetime = 999999.9,
	basescout3movetime = 999999.9,
	vo6time = 999999.9,
	vo7time = 999999.9,
	vo8time = 999999.9,
	vo9time = 999999.9,
	pool1guarda_attacktime = 999999.9,
	pool1guardb_attacktime = 999999.9,
	pool2guarda_attacktime = 999999.9,
	pool2guardb_attacktime = 999999.9,
	pool3guarda_attacktime = 999999.9,
	pool3guardb_attacktime = 999999.9,
	vo_recydeadtime = 999999.9,
	walker_shot1_overtime = 999999.9,
	walker_shot2_overtime = 999999.9,
	base_attack1time = 999999.9,
	base_attack2time = 999999.9,
	base_attack3time = 999999.9,
	cinvo1time = 999999.9,
	vo10time = 999999.9,
	reset_walkstime = 999999.9,
--  handles
	ivscav1,
	ivscav2,
	ivscav3,
	player,
	msg1,
	msg2,
	msg2b,
	msg2c,
	msg3,
	msg5,
	msg7,
	tank1,
	tank2,
	tank3,
	tank4,
	tank5,
	tank6,
	tank7,
	rover1,
	rover6,
	rover2a,
	rover2b,
	rover3,
	rover4,
	rover5,
	ibrecy1,
	machine,
	braddock,
	extractor1,
	extractor2,
	msg4,
	msg9,
	surprise1,
	surprise2,
	turret1,
	turret2,
	basetank1,
	basetank2,
	basescout1,
	basescout2,
	basescout3,
	nav1,
	nav2,
	nav3,
	pool1guarda,
	pool1guardb,
	pool2guarda,
	pool2guardb,
	pool3guarda,
	pool3guardb,
	playersrecy,
	vofail1,

	ivwalk1,
	ivwalk2,
	walkers_look,
	end_tank1,
	end_tank2,
	attacker1,
	attacker2,
	attacker3,
	attacker4,
	attacker5,
	attacker1b,
	attacker2b,
	attacker3b,
	attacker4b =  nil,
	attacker5b,
	nav4 =  nil,
	msgcin1
   
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

	Mission.ivscav1 = GetHandle("ivscav1")
	Mission.ivscav2 = GetHandle("ivscav2")
	Mission.ivscav3 = GetHandle("ivscav3")
	Mission.player = nil
	Mission.msg1 = nil
	Mission.msg2 = nil
	Mission.msg2b = nil
	Mission.msg2c = nil
	Mission.msg3 = nil
	Mission.msg5 = nil
	Mission.msg7 = nil
	Mission.tank1 = GetHandle("tank1")
	Mission.tank2 = GetHandle("tank2")
	Mission.tank3 = GetHandle("tank3")
	Mission.tank4 = GetHandle("tank4")
	Mission.tank5 = GetHandle("tank5")
	Mission.tank6 = GetHandle("tank6")
	Mission.tank7 = GetHandle("tank7")
	Mission.rover1 = GetHandle("rover1")
	Mission.rover6 = GetHandle("rover6")
	Mission.rover2a = GetHandle("rover2a")
	Mission.rover2b = GetHandle("rover2b")
	Mission.rover3 = GetHandle("rover3")
	Mission.rover4 = GetHandle("rover4")
	Mission.rover5 = GetHandle("rover5")
	Mission.ibrecy1 = GetHandle("ibrecy1")
	Mission.machine = GetHandle("machine")
	Mission.braddock = GetHandle("braddock")
	Mission.extractor1 = nil
	Mission.extractor2 = nil
	Mission.msg4 = nil
	Mission.msg9 = nil
	Mission.surprise1 = nil
	Mission.surprise2 = nil
	Mission.turret1 = nil
	Mission.turret2 = nil
	Mission.basetank1 = nil
	Mission.basetank2 = nil
	Mission.basescout1 = nil
	Mission.basescout2 = nil
	Mission.basescout3 = nil
	Mission.nav1 = nil
	Mission.nav2 = nil
	Mission.nav3 = nil
	Mission.pool1guarda = nil
	Mission.pool1guardb = nil
	Mission.pool2guarda = nil
	Mission.pool2guardb = nil
	Mission.pool3guarda = nil
	Mission.pool3guardb = nil
	Mission.playersrecy = GetHandle("playersrecy")
	Mission.vofail1 = nil

	Mission.ivwalk1 = GetHandle("ivwalk1")
	Mission.ivwalk2 = GetHandle("ivwalk2")
	Mission.walkers_look = GetHandle("walkers_look")
	Mission.end_tank1 = GetHandle("end_tank1")
	Mission.end_tank2 = GetHandle("end_tank2")
	Mission.attacker1 = nil
	Mission.attacker2 = nil
	Mission.attacker3 = nil
	Mission.attacker4 = nil
	Mission.attacker5 = nil
	Mission.attacker1b = nil
	Mission.attacker2b = nil
	Mission.attacker3b = nil
	Mission.attacker4b =  nil
	Mission.attacker5b = nil
	Mission.nav4 =  nil
	Mission.msgcin1 = nil
	
	Mission.playersrecy = UnitToVSR(Mission.playersrecy, "fvrecy_vsr", 0)
	SetGroup(Mission.playersrecy, 0)
		
	Mission.player = GetPlayerHandle()
	Mission.player = UnitToVSR(Mission.player, "fvsent_vsr", 1)
	
	Mission.tank1 = UnitToVSR(Mission.tank1, "ivtank_vsr", 0)
	Mission.tank2 = UnitToVSR(Mission.tank2, "ivtank_vsr", 0)
	Mission.tank3 = UnitToVSR(Mission.tank3, "ivtank_vsr", 0)
	Mission.tank4 = UnitToVSR(Mission.tank4, "ivtank_vsr", 0)
	Mission.tank5 = UnitToVSR(Mission.tank5, "ivtank_vsr", 0)
	Mission.tank6 = UnitToVSR(Mission.tank6, "ivtank_vsr", 0)
	Mission.tank7 = UnitToVSR(Mission.tank7, "ivtank_vsr", 0)
	
	Mission.rover1 = UnitToVSR(Mission.rover1, "ivscout_vsr", 0)
	Mission.rover2a = UnitToVSR(Mission.rover2a, "ivscout_vsr", 0)
   Mission.rover2b = UnitToVSR(Mission.rover2b, "ivscout_vsr", 0)
   Mission.rover3 = UnitToVSR(Mission.rover3, "ivscout_vsr", 0)
   Mission.rover4 = UnitToVSR(Mission.rover4, "ivscout_vsr", 0)
   Mission.rover5 = UnitToVSR(Mission.rover5, "ivscout_vsr", 0)
   Mission.rover6 = UnitToVSR(Mission.rover6, "ivscout_vsr", 0)
   
   Mission.ivwalk1 = UnitToVSR(Mission.ivwalk1, "ivwalk_vsr", 0)
   Mission.ivwalk2 = UnitToVSR(Mission.ivwalk2, "ivwalk_vsr", 0)
   Mission.braddock = UnitToVSR(Mission.braddock, "ivwalk_vsr", 0)
   
   Mission.ivscav1 = UnitToVSR(Mission.ivscav1, "ibscav_vsr", 0)
   Mission.ivscav2 = UnitToVSR(Mission.ivscav2, "ibscav_vsr", 0)
   Mission.ivscav2 = UnitToVSR(Mission.ivscav3, "ibscav_vsr", 0)

   
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

	if (Mission.missionstart) then
	
		if ((IsOdf(h,"fbscav_vsr"))) then
		
			Mission.extractor1 = h
		

		elseif ((Mission.turret1 == nil) and (IsOdf(h,"ivturr_vsr"))) then
		
			Mission.turret1 = h	
		

		elseif ((Mission.turret2 == nil) and (IsOdf(h,"ivturr_vsr"))) then
		
			Mission.turret2 = h	
		

		elseif ((Mission.basetank1 == nil) and (IsOdf(h,"ivtank_vsr"))) then
		
			Mission.basetank1 = h	
		
	
		elseif ((Mission.basetank2 == nil) and (IsOdf(h,"ivtank_vsr"))) then
		
			Mission.basetank2 = h	
		

		elseif ((Mission.basescout1 == nil) and (IsOdf(h,"ivscout_vsr"))) then
		
			Mission.basescout1 = h	
		

		elseif ((Mission.basescout2 == nil) and (IsOdf(h,"ivscout_vsr"))) then
		
			Mission.basescout2 = h	
		

		elseif ((Mission.basescout3 == nil) and (IsOdf(h,"ivscout_vsr"))) then
		
			Mission.basescout3 = h	
		end
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


--	AddScrap(3,10)

--OPENING CINERACTIVE
--controlling walkers
	if (not Mission.done_controlling_walks) then
	
		if (not Mission.walkers_move1) then
		
			SetAvoidType(Mission.ivwalk1,0)
			SetAvoidType(Mission.ivwalk2,0)
			SetAvoidType(Mission.braddock,0)
			Retreat(Mission.ivwalk1,"walker_path")
			Retreat(Mission.braddock,"walker_path")
			Retreat(Mission.ivwalk2,"walker_path")
			Mission.walkers_move1 = true
		end

		if ((not Mission.walk1_stop) and (GetDistance(Mission.ivwalk1,"walk1_stop") < 8)) then
		
			Stop(Mission.ivwalk1)
			LookAt(Mission.ivwalk1,Mission.walkers_look)
			Mission.walk1_stop = true
		end
			
		if ((not Mission.braddock_stop) and (GetDistance(Mission.braddock,"braddock_stop") < 8)) then
		
			Stop(Mission.braddock)
			LookAt(Mission.braddock,Mission.walkers_look)
			Mission.braddock_stop = true
		end
		
		if ((not Mission.walk2_stop) and (GetDistance(Mission.ivwalk2,"walk2_stop") < 8)) then
		
			Stop(Mission.ivwalk2)
			LookAt(Mission.ivwalk2,Mission.walkers_look)
			Mission.walk2_stop = true
		end

		if ((not Mission.settime_reset_walks) and (Mission.walk1_stop) and (Mission.walk2_stop) and (Mission.braddock_stop)) then
		
			Mission.reset_walkstime = (GetTime() + 15)
			Mission.settime_reset_walks = true
		end

		if ((not Mission.reset_walks) and (Mission.reset_walkstime < GetTime())) then
		
			Stop(Mission.braddock,0)
			Stop(Mission.ivwalk1,0)
			Stop(Mission.ivwalk2,0)
			SetIndependence(Mission.braddock,1)
			SetIndependence(Mission.ivwalk1,1)
			SetIndependence(Mission.ivwalk2,1)
			Mission.done_controlling_walks = true
			Mission.reset_walks = true
		end
	end

	
	if (not Mission.walker_cin_over) then
	
		if (not Mission.walker_shot1) then
		
			if (not Mission.walker_rdycam1) then
			
				CameraReady()
				Mission.walker_shot1_overtime = (GetTime() + 18)
				Mission.cinvo1time = (GetTime() + 10)
				Mission.walker_rdycam1 = true
			end
				
			CameraObject(Mission.ivwalk2,-10,20,-10,Mission.braddock)

			if ((Mission.walker_shot1_overtime < GetTime())) then
			
				Mission.walker_shot1 = true
			end
		
		end
		
		--cin vo
		if ((not Mission.cinvo1) and (Mission.cinvo1time < GetTime())) then
		
			Mission.msgcin1 = AudioMessage("CinSc0401.wav")
			Mission.cinvo1 = true
		end


		if ((not Mission.walker_shot2) and (Mission.walker_shot1)) then
		
			if (not Mission.walker_shot2_settime) then
			
				Mission.walker_shot2_overtime = (GetTime() + 19)
				Patrol(Mission.end_tank1,"end_tank1path")
				Patrol(Mission.end_tank2,"end_tank2path")
				Mission.walker_shot2_settime = true
			end

			CameraPath("walker_shot2_path",600,100,Mission.machine)

			if ((Mission.walker_shot2_overtime < GetTime())) then
			
				CameraFinish()
				Mission.walker_cin_over = true
				Mission.walker_shot2 = true
			end		
		end

		if (CameraCancelled()) then
		
			if ((Mission.cinvo1) and (not IsAudioMessageDone(Mission.msgcin1))) then
			
				StopAudioMessage(Mission.msgcin1)
			end
		
			Patrol(Mission.end_tank1,"end_tank1path")
			Patrol(Mission.end_tank2,"end_tank2path")
			CameraFinish()
			Mission.walker_cin_over = true
		end
	end

	if ((not Mission.missionstart) and (Mission.walker_cin_over)) then
	
		SetScrap(1,20)
		SetAIP("scion0701.aip",3)
		Mission.vo1time = (GetTime() + 4)
		Ally(2,3)
		SetSkill(Mission.tank1,1)
		SetSkill(Mission.tank2,1)
		SetSkill(Mission.tank3,1)
		SetSkill(Mission.tank4,2)
		SetSkill(Mission.ivwalk1,2)
		SetSkill(Mission.braddock,3)
		SetSkill(Mission.ivwalk2,2)
		Patrol(Mission.tank1,"tank1patrol")
		Patrol(Mission.tank2,"tank2patrol")
		Patrol(Mission.tank3,"tank3patrol")
		Patrol(Mission.tank4,"tank4patrol")
		Patrol(Mission.tank5,"tank5patrol")
		Patrol(Mission.tank6,"tank6patrol")
		Patrol(Mission.tank7,"tank7patrol")
		Patrol(Mission.rover1,"rover1path")
		Patrol(Mission.rover6,"rover6path")
		Patrol(Mission.rover2a,"rover2path")	
		Follow(Mission.rover2b,Mission.rover2a)
		Patrol(Mission.rover3,"rover3path")
		Patrol(Mission.rover4,"rover4path")
		Patrol(Mission.rover5,"rover5path")
		SetMaxHealth(Mission.machine,999999)
		SetCurHealth(Mission.machine,999999)
	    Mission.base_attack1time = (GetTime() + 150)
	    Mission.base_attack2time = (GetTime() + 300)
	    Mission.base_attack3time = (GetTime() + 450)
		Mission.missionstart = true
	end

	if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
	
		Mission.msg1 = AudioMessage("scion0701.wav") --scion0701.wav --the best place to start is with the biometal pools...
		Mission.vo1 = true
	end
	
	--force arc warriors to unmorph
	if not Mission.newwar_morphed and IsAlive(Mission.newwar) and Mission.newwar_wait < GetTime() then

		if GetWeaponConfig( Mission.newwar,  0) == "garcvsr_c" then
			SetCommand(Mission.newwar, 48)
			Mission.newwar_morphed = true
			Mission.newwar = nil
		end
		
		
	end

	----------------------------/
	----------------------------
	--GETTING POOL1
	if ((not Mission.obj1) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
	
		ClearObjectives()
		AddObjective("scion0701.otf", "WHITE") --take over biopool
		Mission.nav1 = BuildObject("ibnav",1,"nav1")
		SetObjectiveOn(Mission.nav1)
		tempstr = TranslateString("MissionS0701")  -- Biometal 1 		
		SetObjectiveName(Mission.nav1,tempstr)
		Mission.obj1 = true
	end

	if ((not Mission.pool1taken) and (Mission.obj1) and (not IsAround(Mission.tank1) and (not IsAround(Mission.tank2) and (not IsAround(Mission.ivscav1))))) then
	
		Mission.vo2time = (GetTime() + 3)
		Mission.pool1taken = true
	end
	--when Mission.player has taken the pool
	if ((not Mission.vo2) and (Mission.vo2time < GetTime())) then
	
		Mission.msg2 = AudioMessage("scion0702.wav") --scion0702.wav Nice job.  Get an extractor out there ASAP
		Mission.vo2 = true
	end

	if ((not Mission.obj2) and (Mission.vo2) and (IsAudioMessageDone(Mission.msg2))) then
	
		ClearObjectives()
		AddObjective("scion0702.otf", "WHITE") --put extractor on biopool
		Mission.obj2 = true
	end 

--checking when the Mission.player has deployed a scav at pool1
	if ((not Mission.extractor1_deployed) and (Mission.vo2) and (IsAround(Mission.extractor1) and
	   (GetDistance(Mission.extractor1,"pool1") < 25))) then
	
		Mission.vo3time = (GetTime() + 3)
		Mission.extractor1_deployed = true
	end

	if ((not Mission.vo3) and (Mission.vo3time < GetTime())) then
	
		Mission.msg3 = AudioMessage("scion0703.wav")--scion0703 Good.  I'm giving you the location of another pool...
	--	SetAIP("scion0702.aip",3)
		Mission.vo3 = true
	end

	--/THIS CONTROLS THE TIMED ATTACKS ON PLAYER'S SCAVENGER AT POOL 1
	if (Mission.extractor1_deployed) then
	
		if (not Mission.settimes_pool1) then
		
			Mission.pool1guarda_attacktime = (GetTime() + 300)
			Mission.pool1guardb_attacktime = (GetTime() + 600)	
			Mission.pool1guarda_attack = false
			Mission.pool1guardb_attack = false
			Mission.settimes_pool1 = true
		end

		if ((not Mission.pool1guarda_attack) and (Mission.pool1guarda_attacktime < GetTime())) then
		
			Mission.pool1guarda = BuildObject("ivscout_vsr",2,"pool1guarda")
			SetSkill(Mission.pool1guarda,0)
			Goto(Mission.pool1guarda,"pool1")
			Mission.pool1guarda_attack = true
		end

		if ((not Mission.pool1guardb_attack) and (Mission.pool1guardb_attacktime < GetTime())) then
		
			Mission.pool1guardb = BuildObject("ivtank_vsr",2,"pool1guardb")
			SetSkill(Mission.pool1guardb,0)
			Goto(Mission.pool1guardb,"pool1")
			Mission.settimes_pool1 = false
			Mission.pool1guardb_attack = true
		end


	end

	----------------------------/
	----------------------------
	--GETTING POOL2
	if ((not Mission.obj3) and (Mission.vo3) and (IsAudioMessageDone(Mission.msg3))) then
	
		ClearObjectives()
		AddObjective("scion0703.otf", "WHITE")-- take out pool
		SetObjectiveOff(Mission.nav1)
		Mission.nav2 = BuildObject("ibnav",1,"nav2")
		SetObjectiveOn(Mission.nav2)
		tempstr = TranslateString("MissionS0702")  -- Biometal 2
		SetObjectiveName(Mission.nav2,tempstr)
		Mission.obj3 = true
	end

	if ((not Mission.pool2taken) and (Mission.obj3) and (not IsAround(Mission.tank3) and (not IsAround(Mission.tank4) and (not IsAround(Mission.ivscav2))))) then
	
		Mission.vo2btime = (GetTime() + 3)
		Mission.pool2taken = true
	end

	if ((not Mission.vo2b) and (Mission.vo2btime < GetTime())) then
	
		Mission.msg2b = AudioMessage("scion0712.wav") --scion0702.wav Again, set up your extractor and put defensive units around the pool	
		Mission.vo2b = true
	end

	if ((not Mission.obj2b) and (Mission.vo2b) and (IsAudioMessageDone(Mission.msg2b))) then
	
		ClearObjectives()
		AddObjective("scion0702.otf", "WHITE") --put extractor on biopool
		Mission.obj2b = true
	end

	if ((not Mission.extractor2_deployed) and (Mission.vo2b) and
	   (GetDistance(Mission.extractor1,"pool2") < 25)) then
	
		Mission.vo4time = (GetTime() + 3)
		Mission.extractor2_deployed = true
	end

	if ((not Mission.vo4) and (Mission.vo4time < GetTime())) then
	
		Mission.msg4 = AudioMessage("scion0704.wav") --scion0703 Good ...there's one more pool
		SetObjectiveOff(Mission.nav2)
	--	SetAIP("scion0703.aip",3)
		Mission.vo4 = true	
	end

	--/THIS CONTROLS THE TIMED ATTACKS ON PLAYER'S SCAVENGER AT POOL 2
	if (Mission.extractor2_deployed) then
	
		if (not Mission.settimes_pool2) then
		
			Mission.pool2guarda_attacktime = (GetTime() + 300)
			Mission.pool2guardb_attacktime = (GetTime() + 600)	
			Mission.pool2guarda_attack = false
			Mission.pool2guardb_attack = false
			Mission.settimes_pool2 = true
		end

		if ((not Mission.pool2guarda_attack) and (Mission.pool2guarda_attacktime < GetTime())) then
		
			Mission.pool2guarda = BuildObject("ivscout_vsr",2,"pool2guarda")
			SetSkill(Mission.pool2guarda,0)
			Goto(Mission.pool2guarda,"pool2")
			Mission.pool2guarda_attack = true
		end

		if ((not Mission.pool2guardb_attack) and (Mission.pool2guardb_attacktime < GetTime())) then
		
			Mission.pool2guardb = BuildObject("ivtank_vsr",2,"pool2guardb")
			SetSkill(Mission.pool2guardb,0)
			Goto(Mission.pool2guardb,"pool2")
			Mission.settimes_pool2 = false
			Mission.pool2guardb_attack = true
		end
	end



	----------------------------/
	----------------------------
	--GETTING POOL3
	if ((not Mission.obj3b) and (Mission.vo4) and (IsAudioMessageDone(Mission.msg4))) then
	
		ClearObjectives()
		AddObjective("scion0703.otf", "WHITE")-- gain control of pool
		Mission.nav3 = BuildObject("ibnav",1,"nav3")
		SetObjectiveOn(Mission.nav3)
		tempstr = TranslateString("MissionS0703")  -- Biometal 3
		SetObjectiveName(Mission.nav3,tempstr)
		Mission.obj3b = true
	end

	if ((not Mission.pool3taken) and (Mission.vo4) and (not IsAround(Mission.tank5) and (not IsAround(Mission.tank6)  
		and (not IsAround(Mission.tank7) and (not IsAround(Mission.ivscav3)))))) then
	
		Mission.vo2ctime = (GetTime() + 3)
		Mission.pool3taken = true
	end

	if ((not Mission.vo2c) and (Mission.vo2ctime < GetTime())) then
	
		Mission.msg2c = AudioMessage("scion0713.wav") --scion0713.wav Get an extractor out therenot 		
		Mission.vo2c = true
	end
	
	if ((not Mission.obj2c) and (Mission.vo2c) and (IsAudioMessageDone(Mission.msg2c))) then
	
		ClearObjectives()
		AddObjective("scion0702.otf", "WHITE") --put extractor on biopool
		Mission.obj2c = true
	end

	if ((not Mission.extractor3_deployed) and (Mission.vo2c) and
	   (GetDistance(Mission.extractor1,"pool3") < 25)) then
	
		Mission.vo5time = (GetTime() + 3)
		Mission.extractor3_deployed = true
	end

	--/THIS CONTROLS THE TIMED ATTACKS ON PLAYER'S SCAVENGER AT POOL 3
	if (Mission.extractor3_deployed) then
	
		if (not Mission.settimes_pool3) then
		
			Mission.pool3guarda_attacktime = (GetTime() + 300)
			Mission.pool3guardb_attacktime = (GetTime() + 600)	
			Mission.pool3guarda_attack = false
			Mission.pool3guardb_attack = false
			Mission.settimes_pool3 = true
		end

		if ((not Mission.pool3guarda_attack) and (Mission.pool3guarda_attacktime < GetTime())) then
		
			Mission.pool3guarda = BuildObject("ivscout_vsr",2,"pool3guarda")
			SetSkill(Mission.pool3guarda,0)
			Goto(Mission.pool3guarda,"pool3")
			Mission.pool3guarda_attack = true
		end

		if ((not Mission.pool3guardb_attack) and (Mission.pool3guardb_attacktime < GetTime())) then
		
			Mission.pool3guardb = BuildObject("ivtank_vsr",2,"pool3guardb")
			SetSkill(Mission.pool3guardb,0)
			Goto(Mission.pool3guardb,"pool3")
			Mission.settimes_pool3 = false
			Mission.pool3guardb_attack = true
		end
	end

	if ((not Mission.vo5) and (Mission.vo5time < GetTime())) then
	
		Mission.msg5 = AudioMessage("scion0705.wav") --scion0705.wav Ok Cook, now just try to hold onto those Biometal pools.  The ISDF should be significanlty weakened now.  The only thing standing between us and the Mission.machine now is the ISDF base.  I'm giving you the coordinates, that base must be destroyed.
	--	SetAIP("scion0704.aip",3)
		SetObjectiveOff(Mission.nav3)
		Mission.vo5 = true	
	end

	
	------/BASE DESTROYING TIME
	if ((not Mission.obj5) and (Mission.vo5) and (IsAudioMessageDone(Mission.msg5))) then
	
		ClearObjectives()
		AddObjective("scion0705.otf", "WHITE") --Destroy the ISDF base.
		Mission.nav4 = BuildObject("ibnav",1,"nav4")
		SetObjectiveOn(Mission.nav4)
		tempstr = TranslateString("MissionS0704")  -- ISDF Base
		SetObjectiveName(Mission.nav4,tempstr)
		Mission.obj5 = true
	end

	if ((not Mission.isdfbasekilled) and (Mission.vo5) and (not IsAround(Mission.ibrecy1))) then
	
		Mission.vo6time = (GetTime() + 3)
		SetObjectiveOff(Mission.nav4)
		Mission.isdfbasekilled = true
	end

	if ((not Mission.vo6) and (Mission.vo6time < GetTime())) then
	
		AudioMessage("scion0706.wav") --scion0706.wav Good job, you've knocked the base out of commisionnot 
		Mission.vo7time = (GetTime() + 10)
		Mission.vo6 = true
	end

	if ((not Mission.vo7) and (Mission.vo7time < GetTime())) then
	
		Mission.msg7 = AudioMessage("scion0707.wav") --scion0707.wav Ok Cook, the last thing we need to do is secure the Mission.machine area.  Go to the Mission.machine and be sure there are no ISDF about.
		Mission.vo7 = true
	end

	if ((not Mission.obj6) and (Mission.vo7) and (IsAudioMessageDone(Mission.msg7))) then
	
		ClearObjectives()
		AddObjective("scion0706.otf", "WHITE") --Secure the Machine area.
		SetObjectiveOff(Mission.nav4)
		SetObjectiveOn(Mission.braddock)
		SetObjectiveName(Mission.braddock,"Braddock")
		Mission.obj6 = true
	end

	----/MACHINE AREA SEQUENCE WITH BRADDOCK

	if ((not Mission.playeratmachine) and (Mission.vo7) and (GetDistance(Mission.player,Mission.braddock) < 500)) then
	
	--	Goto(Mission.braddock,"braddockpath")
		Mission.vo8time = (GetTime() +5)
		Mission.playeratmachine = true
	end


		if ((not Mission.vo8) and (Mission.vo8time < GetTime())) then
		
			AudioMessage("scion0708.wav") --scion0708.wav - BRADDOCK: You may be a hero to these mutated freaks....
			Mission.vo8 = true
		end

		--when Mission.player does certain damage to Mission.braddock, he taunts
		if ((not Mission.vo10) and (GetCurHealth(Mission.braddock) < 6000)) then
		
			AudioMessage("scion0710.wav") --You think you can beat me at my own game?
			Mission.vo10 = true
		end

		--when Mission.braddock dies, he says a mean thing to the Mission.player
		if ((not Mission.vo11) and --[[(GetCurHealth(Mission.braddock) < 10 or ]] GetCurHealth(Mission.braddock) == nil) then
		
			AudioMessage("scion0711.wav") -- Damned Scionnot 
			Mission.vo11 = true
		end
		
		--when Mission.player kills everything around Mission.machine
		if ((not Mission.machineclear) and  (not IsAlive(Mission.braddock) and
			(not IsAlive(Mission.ivwalk1)) and (not IsAlive(Mission.ivwalk2)))) then
		
			Mission.vo9time = (GetTime() + 4)
			Mission.machineclear = true
		end

		if ((not Mission.vo9) and (Mission.vo9time < GetTime())) then
		
			Mission.msg9 = AudioMessage("scion0709.wav") --scion0709.wav The Mission.machine area is clear.  Great job Cook.  Stand by while we move in with a Hauler and activate the Mission.machine.
			Mission.vo9 = true
		end
	

	--/Braddock dead, mission won
	if ((not Mission.obj7) and (Mission.vo9) and (IsAudioMessageDone(Mission.msg9))) then
	
		SucceedMission(GetTime() + 12)
		ClearObjectives()
		AddObjective("scion0707.otf", "WHITE") --MISSION ACCOMPLISHED
		Mission.obj7 = true
	end



	--------/AIP CONTROLS
	--TURRET1
	if ((not Mission.checkturret1alive) and (IsAlive(Mission.turret1)))	 then
	
		Mission.turret1movetime = (GetTime() + 2)
		Mission.turret1alive = true
		Mission.checkturret1alive = true
		Mission.checkturret1dead = false
		Mission.turret1go = false
	end

	if ((not Mission.checkturret1dead) and (not IsAlive(Mission.turret1))) then
	
		Mission.turret1alive = false
		Mission.checkturret1alive = false
		Mission.checkturret1dead = true
	end

	if ((not Mission.turret1go) and (Mission.turret1alive) and (Mission.turret1movetime < GetTime())) then
	
		Goto(Mission.turret1,"turret1point")
		Mission.turret1go = true
	end

----TURRET 2
	if ((not Mission.checkturret2alive) and (IsAlive(Mission.turret2)))	 then
	
		Mission.turret2movetime = (GetTime() + 2)
		Mission.turret2alive = true
		Mission.checkturret2alive = true
		Mission.checkturret2dead = false
		Mission.turret2go = false
	end

	if ((not Mission.checkturret1dead) and (not IsAlive(Mission.turret2))) then
	
		Mission.turret2alive = false
		Mission.checkturret2alive = false
		Mission.checkturret2dead = true
	end

	if ((not Mission.turret2go) and (Mission.turret2alive) and (Mission.turret2movetime < GetTime())) then
	
		Goto(Mission.turret2,"turret2point")
		Mission.turret2go = true
	end

----BASETANK1
	if ((not Mission.checkbasetank1alive) and (IsAlive(Mission.basetank1)))	 then
	
		Mission.basetank1alive = true
		Mission.basetank1movetime = (GetTime() + 2)
		Mission.checkbasetank1alive = true
		Mission.checkbasetank1dead = false
		Mission.basetank1go = false
	end

	if ((not Mission.checkbasetank1dead) and (not IsAlive(Mission.basetank1))) then
	
		Mission.basetank1alive = false
		Mission.checkbasetank1alive = false
		Mission.checkbasetank1dead = true
	end

	if ((not Mission.basetank1go) and (Mission.basetank1alive) and (Mission.basetank1movetime < GetTime())) then
	
		Goto(Mission.basetank1,"basetank1point")
		Mission.basetank1go = true
	end

--/BASETANK2
	if ((not Mission.checkbasetank2alive) and (IsAlive(Mission.basetank2)))	 then
	
		Mission.basetank2movetime = (GetTime() + 2)
		Mission.basetank2alive = true
		Mission.checkbasetank2alive = true
		Mission.checkbasetank2dead = false
		Mission.basetank2go = false
	end

	if ((not Mission.checkbasetank2dead) and (not IsAlive(Mission.basetank2))) then
	
		Mission.basetank2alive = false
		Mission.checkbasetank2alive = false
		Mission.checkbasetank2dead = true
	end

	if ((not Mission.basetank2go) and (Mission.basetank2alive) and (Mission.basetank2movetime < GetTime())) then
	
		Goto(Mission.basetank2,"basetank2point")
		Mission.basetank2go = true
	end

	--if the Mission.player's recycler is ever destroyed then --MISSION FAILED then
	if ((not Mission.playersrecy_dead) and (not IsAround(Mission.playersrecy))) then
	
		Mission.vo_recydeadtime = (GetTime() + 3)
		Mission.playersrecy_dead = true
	end

	if ((not Mission.vo_recydead) and (Mission.vo_recydeadtime < GetTime())) then
	
		Mission.vofail1 = AudioMessage("scion0799.wav") 	--Dammit cooke, the recycler has been destroyed
		Mission.vo_recydead = true
	end

	if ((not Mission.obj8) and (Mission.vo_recydead) and (IsAudioMessageDone(Mission.vofail1))) then
	
		ClearObjectives()
		AddObjective("scion0708.otf", "WHITE")
		FailMission(GetTime() + 6,"scion07L1.txt")  
		Mission.obj8 = true
	end


		--Timed attacks on the Mission.player's base
	if (not Mission.timed_attacks_over) then
	
		if ((not Mission.base_attack1) and (Mission.base_attack1time < GetTime())) then
		
			 Mission.attacker1 = BuildObject("ivscout_vsr",2,"base_attacker1")	
			 Mission.attacker2 = BuildObject("ivscout_vsr",2,"base_attacker2")
			 Goto(Mission.attacker1,Mission.playersrecy)
			 Goto(Mission.attacker2,Mission.playersrecy)
			 SetAvoidType(Mission.attacker1,0)
			 SetAvoidType(Mission.attacker2,0)
			 SetSkill(Mission.attacker1,1)
			 SetSkill(Mission.attacker2,1)
			 Mission.base_attack1 = true
		end
	
		if ((not Mission.base_attack2) and (Mission.base_attack2time < GetTime())) then
		
			 Mission.attacker3 = BuildObject("ivtank_vsr",2,"base_attacker1")	
			 Mission.attacker4 = BuildObject("ivmbike_vsr",2,"base_attacker2")
			 Goto(Mission.attacker3,Mission.playersrecy)
			 Goto(Mission.attacker4,Mission.playersrecy)
			 SetAvoidType(Mission.attacker3,0)
			 SetAvoidType(Mission.attacker4,0)
			 SetSkill(Mission.attacker3,1)
			 SetSkill(Mission.attacker4,2)
			 Mission.base_attack2 = true
		end	

		if ((not Mission.base_attack3) and (Mission.base_attack3time < GetTime())) then
		
			 Mission.attacker5 = BuildObject("ivtank_vsr",2,"base_attacker1")	
			 Mission.attacker5b = BuildObject("ivtank_vsr",2,"base_attacker2")	
			 Goto(Mission.attacker5,Mission.playersrecy)
			 Goto(Mission.attacker5b,Mission.playersrecy)
			 SetAvoidType(Mission.attacker5,0)
			 SetAvoidType(Mission.attacker5b,0)
			 SetSkill(Mission.attacker5,2)
			 SetSkill(Mission.attacker5b,2)
		     Mission.base_attack1time = (GetTime() + 175)
			 Mission.base_attack2time = (GetTime() + 325)
		     Mission.base_attack3time = (GetTime() + 475)
			 Mission.base_attack1 = false
			 Mission.base_attack2 = false
		end
	end
	--[[
	--BASESCOUT1
	if ((not Mission.checkbasescout1alive) and (IsAlive(Mission.basescout1)))	 then
	
		Mission.basescout1movetime = (GetTime() + 2)
		Mission.basescout1alive = true
		Mission.checkbasescout1alive = true
		Mission.checkbasescout1dead = false
		Mission.basescout1go = false
	end

	if ((not Mission.checkbasescout1dead) and (not IsAlive(Mission.basescout1))) then
	
		Mission.basescout1alive = false
		Mission.checkbasescout1alive = false
		Mission.checkbasescout1dead = true
	end

	if ((not Mission.basescout1go) and (Mission.basescout1alive) and (Mission.basescout1movetime < GetTime())) then
	
		Goto(Mission.basescout1,"pool1")
		Mission.basescout1go = true
	end

--BASESCOUT2

	if ((not Mission.checkbasescout2alive) and (IsAlive(Mission.basescout2)))	 then
	
		Mission.basescout2movetime = (GetTime() + 2)
		Mission.basescout2alive = true
		Mission.checkbasescout2alive = true
		Mission.checkbasescout2dead = false
		Mission.basescout2go = false
	end

	if ((not Mission.checkbasescout2dead) and (not IsAlive(Mission.basescout2))) then
	
		Mission.basescout2alive = false
		Mission.checkbasescout2alive = false
		Mission.checkbasescout2dead = true
	end

	if ((not Mission.basescout2go) and (Mission.basescout2alive) and (Mission.basescout2movetime < GetTime())) then
	
		Goto(Mission.basescout2,"pool2")
		Mission.basescout2go = true
	end

--BASESCOUT3
	if ((not Mission.checkbasescout3alive) and (IsAlive(Mission.basescout3)))	 then
	
		Mission.basescout3movetime = (GetTime() + 2)
		Mission.basescout3alive = true
		Mission.checkbasescout3alive = true
		Mission.checkbasescout3dead = false
		Mission.basescout3go = false
	end

	if ((not Mission.checkbasescout3dead) and (not IsAlive(Mission.basescout3))) then
	
		Mission.basescout3alive = false
		Mission.checkbasescout3alive = false
		Mission.checkbasescout3dead = true
	end

	if ((not Mission.basescout3go) and (Mission.basescout3alive) and (Mission.basescout3movetime < GetTime())) then
	
		Goto(Mission.basescout3,"pool3")
		Mission.basescout3go = true
	end
	]]

end