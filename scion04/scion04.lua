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
	vo1 = false,
	obj1 = false,
	attack1 = false,
	playermeetevil = false,
	evilgo1 = false,
	evilattacked = false,
	playernotcoming1 = false,
	firstwarning = false,
	secondwarning = false,
	thirdwarning = false,
	playercaughtup = false,
	warn1 = false,
	warn2 = false,
	warn2a = false,
	playerattackedevil = false,
	evilgo2 = false,
	warn3 = false,
	playeratambush = false,
	ambushstart = false,
	missionwon = false,
	missionlost = false,
	powerdead = false,
	tankscharge1 = false,
	tankscharge2 = false,
	vo10 = false,
	obj4 = false,
	haulerdead = false,
	vo9 = false,
	missionlost2 = false,
	obj3 = false,
	bigspawnstart = false,
	spawn1_7 = false,
	spawn2_8 = false,
	spawn3_9 = false,
	spawn4_10 = false,
	spawn5_11 = false,
	spawn6_12 = false,
	stop1 = false,
	stop2 = false,
	stop3 = false,
	stop4 = false,
	stop5 = false,
	stop6 = false,
	stop7 = false,
	stop8 = false,
	stop9 = false,
	stop10 = false,
	stop11 = false,
	stop12 = false,
	walk_spawn = false,
	walk1_stop = false,
	walk2_stop = false,
	bossman_go = false,
	bossman_stop = false,
	bigspawn_cin_over = false,
	rdycam1 = false,
	bigspawn_shot1_over = false,
	bigspawn_shot2 = false,
	rdycam2 = false,
	bigspawn_shot3 = false,
	rdycam3 = false,
	bigspawn_shot4 = false,
	rdycam4 = false,
	player_at_machine = false,
	tug_at_machine = false,
	start_bigspawn = false,
	succeedmission = false,
	rebels_attack = false,
	player_at_dropship1 = false,
	takeoff_shot1 = false,
	takeoff_rdycam1 = false,
	takeoff = false,
	fakers_stop_attack = false,
	picktarget = false,
	release_others = false,
	evil1dead = false,
	evil2dead = false,
	evil3dead = false,	
	vo6 = false,
	vo7 = false,
	all_evils_dead = false,
	vo8 = false,
	vo12 = false,
	circle_spawns_over = false,
	spawn_circle_tank1 = false,
	circle_tank1_dead = false,
	spawn_circle_tank2 = false,
	circle_tank2_dead = false,
	spawn_circle_scout1 = false,
	circle_scout1_dead = false,
	spawn_circle_scout2 = false,
	circle_scout2_dead = false,
	circle_scout1_attack = false,
	circle_scout2_attack = false,
	circle_tank1_attack = false,
	circle_tank2_attack = false,
	tug1_stop = false,
	bigspawn_shot5 = false,
	rdycam5 = false,
	cutvo1 = false,
	bigspawn_shot6 = false,
	rdycam6 = false,
	attack_tug = false,
	check_tug_dead = false,
	stealer11_12_goback = false,
	stealer11_relook = false,
	stealer12_relook = false,
	cutvo3 = false,
	bigspawn_shot7 = false,
	rdycam7 = false,
	cutvo4 = false,
	cutvo5 = false,
	cutvo6 = false,
	cutvo4over = false,
	cutvo5over = false,
	cutvo6over = false,
	sick_first6_on_player = false,
	stealer9_relook = false,
	stealer10_relook = false,
	take_off_sound = false,
--  floats
	vo1time = 999999.9,
	warn1time = 999999.9,
	warn2time = 999999.9,	
	warn3time = 999999.9,
	vo9time = 999999.9,
	vo10time = 999999.9,
	stealer1_7time = 999999.9,
	stealer2_8time = 999999.9,
	stealer3_9time = 999999.9,
	stealer4_10time = 999999.9,
	stealer5_11time = 999999.9,
	stealer6_12time = 999999.9,
	walk_spawntime = 999999.9,
	bigspawn_shot1_overtime = 999999.9,
	bigspawn_shot2_overtime = 999999.9,
	bigspawn_shot3_overtime = 999999.9,
	bossman_gotime = 999999.9,
	bigspawn_shot4_overtime = 999999.9,
	bigspawn_shot1_starttime = 999999.9,
	succeedmission_time = 999999.9,
	takeoff_time = 999999.9,
	fakers_stop_attacktime = 999999.9,
	stealers_attacktime = 999999.9,
	release_otherstime = 999999.9,
	vo6time = 999999.9,
	vo7time = 999999.9,
	vo8time = 999999.9,
	vo12time = 999999.9,
	spawn_circle_tank1time = 999999.9,
	spawn_circle_tank2time = 999999.9,
	spawn_circle_scout1time = 999999.9,
	spawn_circle_scout2time = 999999.9,
	bigspawn_shot5_overtime = 999999.9,
	cutvo1time = 999999.9,
	bigspawn_shot6_overtime = 999999.9,
	attack_tugtime = 999999.9,
	cutvo3time = 999999.9,
	bigspawn_shot7_overtime = 999999.9,
	cutvo4time = 999999.9,
	cutvo5time = 999999.9,
	cutvo6time = 999999.9,
	sick_first6_on_playertime = 999999.9,
	take_off_soundtime = 999999.9,
--  handles
	tug1,
	power,
	msg1,
	machine,
	rtattack1,
	rtattack2,
	rtattack3,
	evil1,
	evil2,
	evil3,
	rtattack4,
	rtattack5,
	rtattack6,
	rtattack7,
	rtattack8,
	player,
	msg2,
	ambusher1,
	ambusher2,
	ambusher3,
	ambusher4,
	ambusher5,
	ambusher6,
	rckt1,
	rckt2,
	rckt3,
	rckt4,
	tank1,
	tank2,
	tank3,
	tank4,
	circle_scout1,
	circle_scout2,
	fvtank1,
	fvtank2,
	fvtank3,
	fvsent1,
	fvsent2,
	fvsent3,
	fvserv1,
	ailook,
	stealer_walk1,
	stealer_walk2,
	msg10,
	msg9 = nil,
	stealer1,
	stealer2,
	stealer3,
	stealer4,
	stealer5,
	stealer6,
	stealer7,
	stealer8,
	stealer9,
	stealer10,
	stealer11,
	stealer12,
	bossman,
	bigspawn_cam1look,
	bigspawn_cam2look,
	bigspawn_camlook3,
	bigspawn_cam4look,
	dropship1,
	dropship2,
	faker1,
	faker2,
	faker3,
	faker4,
	fvarch1,
	fvarch2,
	circle_tank1,
	circle_tank2,
	tugshot_look1,
	cutmsg4,
	cutmsg5,
	cutmsg6
--  integers



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

	Mission.tug1 = GetHandle("tug1")
	Mission.power = GetHandle("power")
	Mission.msg1 = nil
	Mission.machine = GetHandle("machine")
	Mission.rtattack1 = GetHandle("rtattack1")
	Mission.rtattack2 = GetHandle("rtattack2")
	Mission.rtattack3 = GetHandle("rtattack3")
	Mission.evil1 = GetHandle("evil1")
	Mission.evil2 = GetHandle("evil2")
	Mission.evil3 = GetHandle("evil3")
	Mission.rtattack4 = nil
	Mission.rtattack5 = nil
	Mission.rtattack6 = nil
	Mission.rtattack7 = nil
	Mission.rtattack8 = nil
	Mission.player = nil
	Mission.msg2 = nil
	Mission.ambusher1 = GetHandle("ambusher1")
	Mission.ambusher2 = GetHandle("ambusher2")
	Mission.ambusher3 = GetHandle("ambusher3")
	Mission.ambusher4 = GetHandle("ambusher4")
	Mission.ambusher5 = GetHandle("ambusher5")
	Mission.ambusher6 = GetHandle("ambusher6")
	Mission.rckt1 = GetHandle("rckt1")
	Mission.rckt2 = GetHandle("rckt2")
	Mission.rckt3 = GetHandle("rckt3")
	Mission.rckt4 = GetHandle("rckt4")
	Mission.tank1 = GetHandle("tank1")
	Mission.tank2 = GetHandle("tank2")
	Mission.tank3 = GetHandle("tank3")
	Mission.tank4 = GetHandle("tank4")
	Mission.circle_scout1 = nil
	Mission.circle_scout2 = nil
	Mission.fvtank1 = GetHandle("fvtank1")
	Mission.fvtank2 = GetHandle("fvtank2")
	Mission.fvtank3 = GetHandle("fvtank3")
	Mission.fvsent1 = GetHandle("fvsent1")
	Mission.fvsent2 = GetHandle("fvsent2")
	Mission.fvsent3 = GetHandle("fvsent3")
	Mission.fvserv1 = GetHandle("fvserv1")
	Mission.ailook = GetHandle("ailook")
	Mission.stealer_walk1 = nil
	Mission.stealer_walk2 = nil
	Mission.msg10 = nil
	Mission.msg9 = nil
	Mission.stealer1 = nil
	Mission.stealer2 = nil
	Mission.stealer3 = nil
	Mission.stealer4 = nil
	Mission.stealer5 = nil
	Mission.stealer6 = nil
	Mission.stealer7 = nil
	Mission.stealer8 = nil
	Mission.stealer9 = nil
	Mission.stealer10 = nil
	Mission.stealer11 = nil
	Mission.stealer12 = nil
	Mission.bossman = nil
	Mission.bigspawn_cam1look = GetHandle("bigspawn_cam1look")
	Mission.bigspawn_cam2look = GetHandle("bigspawn_cam2look")
	Mission.bigspawn_camlook3 = GetHandle("bigspawn_camlook3")
	Mission.bigspawn_cam4look = GetHandle("bigspawn_cam4look")
	Mission.dropship1 = GetHandle("dropship1")
	Mission.dropship2 = GetHandle("dropship2")
	Mission.faker1 = nil
	Mission.faker2 = nil
	Mission.faker3 = nil
	Mission.faker4 = nil
	Mission.fvarch1 = GetHandle("fvarch1")
	Mission.fvarch2 = GetHandle("fvarch2")
	Mission.circle_tank1 = nil
	Mission.circle_tank2 = nil
	Mission.tugshot_look1 = GetHandle("tugshot_look1")
	Mission.cutmsg4 = nil
	Mission.cutmsg5 = nil
	Mission.cutmsg6 = nil

	SetTeamColor(3,85,255,85)  --REBELS		
	SetTeamColor(2,85,255,85)  --REBELS
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

function missionCode() --
	Mission.player = GetPlayerHandle()

--	SetCurHealth(Mission.tug1,2500)
	if (not Mission.missionstart) then
	
		SetTeamNum(Mission.evil1,2)
		SetTeamNum(Mission.evil2,2)
		SetTeamNum(Mission.evil3,2)
		SetIndependence(Mission.evil1,0)
		SetIndependence(Mission.evil2,0)
		SetIndependence(Mission.evil3,0)
		
		SetMaxHealth(Mission.machine,999999)
		SetCurHealth(Mission.machine,999999)
		Ally(2,3)
		Ally(2,4)
		Ally(3,4)
		Mission.vo1time = (GetTime() + 4)
		Pickup(Mission.tug1,Mission.power,0)
		SetMaxHealth(Mission.tug1,8000)
		SetCurHealth(Mission.tug1,8000)
		Patrol(Mission.rckt1,"rckt1path")
		Patrol(Mission.rckt2,"rckt2path")
		Patrol(Mission.rckt3,"rckt3path")
		Patrol(Mission.rckt4,"rckt4path")
	--	Patrol(scout1,"scoutpath")
	--	Patrol(scout2,"scoutpath")
		SetAvoidType(Mission.tug1,0)
		SetAvoidType(Mission.fvserv1,0)
		SetAvoidType(Mission.fvtank1,0)
		SetAvoidType(Mission.fvtank2,0)
		SetAvoidType(Mission.fvtank3,0)
		SetAvoidType(Mission.fvsent1,0)
		SetAvoidType(Mission.fvsent2,0)
		SetAvoidType(Mission.fvsent3,0)
		SetAvoidType(Mission.fvarch1,0)
		SetAvoidType(Mission.fvarch2,0)

		SetSkill(Mission.tug1,2)
		SetSkill(Mission.fvserv1,2)
		SetSkill(Mission.fvtank1,2)
		SetSkill(Mission.fvtank2,2)
		SetSkill(Mission.fvtank3,2)
		SetSkill(Mission.fvsent1,2)
		SetSkill(Mission.fvsent2,2)
		SetSkill(Mission.fvsent3,2)
		SetSkill(Mission.fvarch1,2)
		SetSkill(Mission.fvarch2,2)

		SetAvoidType(Mission.evil1,0)
		SetAvoidType(Mission.evil2,0)
		SetAvoidType(Mission.evil3,0)
		SetAnimation(Mission.dropship1,"deploy",1)
		SetAnimation(Mission.dropship2,"deploy",1)

		Mission.spawn_circle_tank1time = (GetTime() + 1)
		Mission.spawn_circle_tank2time = (GetTime() + 1)
		Mission.spawn_circle_scout1time = (GetTime() + 1)
		Mission.spawn_circle_scout2time = (GetTime() + 1)

		SetIndependence(Mission.ambusher1,0)
		SetIndependence(Mission.ambusher2,0)
		SetIndependence(Mission.ambusher3,0)
		SetIndependence(Mission.ambusher4,0)
		SetIndependence(Mission.ambusher5,0)
		SetIndependence(Mission.ambusher6,0)

		SetAvoidType(Mission.ambusher1,0)
		SetAvoidType(Mission.ambusher2,0)
		SetAvoidType(Mission.ambusher3,0)
		SetAvoidType(Mission.ambusher4,0)
		SetAvoidType(Mission.ambusher5,0)
		SetAvoidType(Mission.ambusher6,0)

		Mission.missionstart = true
	
	end
	
	if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
	
		Mission.msg1 = AudioMessage("scion0401.wav") --  Ok Cook, we MUST get this Mission.power source to the data transfer Mission.machine.  We have been unable to locate any scrap veins in the area, so you will have to make due with the units we have available.  Good luck Cook, the fate of an entire race is in your hands. (SHAB)
		Mission.vo1 = true
	end

	if ((not Mission.obj1) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
	
		ClearObjectives()
		AddObjective("scion0401.otf", "WHITE")
		SetObjectiveOn(Mission.machine)
		tempstr = TranslateString("MissionS0401")  -- Alchemator		
		SetObjectiveName(Mission.machine,tempstr)
		Goto(Mission.rtattack1,Mission.player)
		Mission.obj1 = true
	end

	if ((not Mission.attack1) and (GetDistance(Mission.player,Mission.rtattack2) < 150)) then
	
		Goto(Mission.rtattack2,Mission.player)
		Goto(Mission.rtattack3,Mission.player)
		Mission.attack1 = true
	end

	-- Mission.player first meets the evil scions
	if ((not Mission.playermeetevil) and (GetDistance(Mission.player,Mission.evil1) < 85)) then
	
		Mission.msg2 = AudioMessage("scion0402.wav") --Cook stopnot   The way ahead is very dangerous, a massive ISDF blockade is intrenched in the canyon.  Follow us we know a safe way through the passnot 
		LookAt(Mission.evil1,Mission.player)
		LookAt(Mission.evil2,Mission.player)
		LookAt(Mission.evil3,Mission.player)
		Mission.playermeetevil = true
	end

	if ((not Mission.evilgo1) and (not Mission.playerattackedevil) and (not Mission.warn2) and (not Mission.warn2a)
		and (Mission.playermeetevil) and (IsAudioMessageDone(Mission.msg2))) then
	
		Retreat(Mission.evil1,"evilpath")
		Follow(Mission.evil2,Mission.evil1)
		Follow(Mission.evil3,Mission.evil2)
		Mission.evilgo1 = true
	end

	if ((not Mission.playernotcoming1) and (Mission.evilgo1) and (GetDistance(Mission.player,Mission.evil1) > 150)) then
	
		Stop(Mission.evil1)
		Stop(Mission.evil2)		
		Stop(Mission.evil3)
		LookAt(Mission.evil1,Mission.player)
		LookAt(Mission.evil2,Mission.player)
		LookAt(Mission.evil3,Mission.player)
		Mission.warn1time = (GetTime() + 4)
		Mission.playernotcoming1 = true
	end

	if ((not Mission.playercaughtup) and (Mission.playernotcoming1) and (not Mission.warn2) and (not Mission.warn2a) and (not Mission.playerattackedevil) 
		and (GetDistance(Mission.player,Mission.evil1) < 100)) then
	
		Retreat(Mission.evil1,"evilpath")
		Follow(Mission.evil2,Mission.evil1)
		Follow(Mission.evil3,Mission.evil2)
		Mission.playercaughtup = true
	end

	if ((not Mission.warn1) and (Mission.playernotcoming1) and (not Mission.ambushstart) and (not Mission.warn2) and (not Mission.warn3) and (not Mission.playerattackedevil)
		and (not Mission.playercaughtup)) then
	
		AudioMessage("scion0403.wav")--C'mon Cook, you coming with us or not?
		Mission.warn2time = (GetTime() + 50)
		Mission.warn1 = true
	end

	if ((not Mission.warn2) and (not Mission.playercaughtup) and (not Mission.playerattackedevil) and (not Mission.warn3) and (Mission.warn2time < GetTime())) then
	
		AudioMessage("scion0405.wav") --	Ok Cook, I was hoping we could do this the easy way but you are too stubbornnot   Attack mennot 
		SetIndependence(Mission.evil1,1)
		SetIndependence(Mission.evil2,1)
		SetIndependence(Mission.evil3,1)

		Attack(Mission.evil1,Mission.player)
		Attack(Mission.evil2,Mission.player)
		Attack(Mission.evil3,Mission.player)
		Mission.warn2 = true
	end

	if ((not Mission.warn2a) and (not Mission.playerattackedevil) and (not Mission.warn2) and (Mission.playercaughtup) and (GetDistance(Mission.evil1,"ambush") < 50)) then
	

		Stop(Mission.evil1)
		Stop(Mission.evil2)
		Stop(Mission.evil3)
		LookAt(Mission.evil1,Mission.player)
		LookAt(Mission.evil2,Mission.player)
		LookAt(Mission.evil3,Mission.player)
		Mission.warn2a = true
	end

	if ((not Mission.playeratambush) and (Mission.warn2a) and (GetDistance(Mission.player,"ambush") < 100)) then
	
		Mission.playeratambush = true
	end

	if ((not Mission.warn3) and (not Mission.playeratambush) and (not Mission.playerattackedevil) and (not Mission.warn2) and (GetDistance(Mission.player,"goodroute") < 150)) then
	
		AudioMessage("scion0405.wav") --	Ok Cook, I was hoping we could do this the easy way but you are too stubbornnot   Attack mennot 
		RemoveObject(Mission.evil1) 
		RemoveObject(Mission.evil2)		
		RemoveObject(Mission.evil3)
		Mission.evil1 = BuildObject("fvscout",2,"evil1respawn")
		Mission.evil2 = BuildObject("fvscout",2,"evil2respawn")
		Mission.evil3 = BuildObject("fvscout",2,"evil3respawn")
		SetSkill(Mission.evil1,2)
		SetSkill(Mission.evil2,2)
		SetSkill(Mission.evil3,2)
		Attack(Mission.evil1,Mission.player) 
		Attack(Mission.evil2,Mission.player)
		Attack(Mission.evil3,Mission.player)
		Mission.warn3 = true
	end
----------------When Mission.player attacks first
	if ((not Mission.playerattackedevil) and (not Mission.warn2) and (not Mission.warn3) and (GetCurHealth(Mission.evil1) < 750) and (not Mission.ambushstart))   then

	
		if (not IsAudioMessageDone(Mission.msg2)) then
		
			StopAudioMessage(Mission.msg2)
		end
		
		AudioMessage("scion0404.wav")--He's onto usnot  Attacknot 
		SetIndependence(Mission.evil1,1)
		SetIndependence(Mission.evil2,1)
		SetIndependence(Mission.evil3,1)
		Attack(Mission.evil1,Mission.player)
		Attack(Mission.evil2,Mission.player)
		Attack(Mission.evil3,Mission.player)
		Mission.playerattackedevil = true
	end

	if ((not Mission.playerattackedevil) and (not Mission.warn2) and (not Mission.warn3) and (GetCurHealth(Mission.evil2) < 750) and (not Mission.ambushstart))  then

	
		if (not IsAudioMessageDone(Mission.msg2)) then
		
			StopAudioMessage(Mission.msg2)
		end
	
		AudioMessage("scion0404.wav")--He's onto usnot  Attacknot 
		SetIndependence(Mission.evil1,1)
		SetIndependence(Mission.evil2,1)
		SetIndependence(Mission.evil3,1)
		Attack(Mission.evil1,Mission.player)
		Attack(Mission.evil2,Mission.player)
		Attack(Mission.evil3,Mission.player)
		Mission.playerattackedevil = true
	end

	if ((not Mission.playerattackedevil) and (not Mission.warn2) and (not Mission.warn3) and (GetCurHealth(Mission.evil3) < 750) and (not Mission.ambushstart))   then

	

		if (not IsAudioMessageDone(Mission.msg2)) then
		
			StopAudioMessage(Mission.msg2)
		end
		
		AudioMessage("scion0404.wav")--He's onto usnot  Attacknot 
		SetIndependence(Mission.evil1,1)
		SetIndependence(Mission.evil2,1)
		SetIndependence(Mission.evil3,1)
		Attack(Mission.evil1,Mission.player)
		Attack(Mission.evil2,Mission.player)
		Attack(Mission.evil3,Mission.player)
		Mission.playerattackedevil = true
	end
	----------

	--seeing when the evils are destroyed
	if ((not Mission.all_evils_dead) and (Mission.playerattackedevil)) then
	
		if ((not Mission.evil1dead) and (Mission.playerattackedevil) and (not Mission.ambushstart) and (not IsAlive(Mission.evil1))) then
		
			Mission.vo7time = (GetTime() + 3)
			Mission.evil1dead = true
		end

		if ((not Mission.evil2dead) and (Mission.playerattackedevil) and (not Mission.ambushstart) and (not IsAlive(Mission.evil2))) then
		
			Mission.vo7time = (GetTime() + 3)
			Mission.evil2dead = true
		end

		if ((not Mission.evil3dead) and (Mission.playerattackedevil) and (not Mission.ambushstart) and (not IsAlive(Mission.evil3))) then
		
			Mission.vo7time = (GetTime() + 3)
			Mission.evil3dead = true
		end

		--taunts from evils as Mission.player fights them
	--	if ((not vo6) and (Mission.vo6time < GetTime())) then
	--	
	--		AudioMessage("scion0406.wav")	--You are powerless against usnot 
	--		vo6 = true
	--	end

		if ((not Mission.vo7) and (Mission.vo7time < GetTime())) then
		
			AudioMessage("scion0407.wav")	--Tell burns we will never return with him to earthnot 
			Mission.vo7 = true
		end

		--when all evils are dead...
		if ((Mission.evil1dead) and (Mission.evil2dead) and (Mission.evil3dead)) then
		
			Mission.vo8time = (GetTime() + 3)
			Mission.all_evils_dead = true
		end
	end

	if ((not Mission.vo8) and (Mission.all_evils_dead) and (Mission.vo8time < GetTime())) then
	
		AudioMessage("scion0408.wav") --You did the right thing, John,  Those were the rebelsnot 
		Mission.vo8 = true
	end

	--/ If Mission.player falls for the trap......the ambush
	if ((not Mission.ambushstart) and (GetDistance(Mission.player,"ambush") < 120)) then
	

		SetIndependence(Mission.ambusher1,1)
		SetIndependence(Mission.ambusher2,1)
		SetIndependence(Mission.ambusher3,1)
		SetIndependence(Mission.ambusher4,1)
		SetIndependence(Mission.ambusher5,1)
		SetIndependence(Mission.ambusher6,1)

		Attack(Mission.ambusher1,Mission.tug1)
		Attack(Mission.ambusher2,Mission.player)
		Attack(Mission.ambusher3,Mission.tug1)
		Goto(Mission.ambusher4,Mission.player)
		Attack(Mission.ambusher5,Mission.fvserv1)
		Goto(Mission.ambusher6,Mission.player)
		
		if (IsAlive(Mission.evil1)) then
		
			SetIndependence(Mission.evil1,1)
			Attack(Mission.evil1,Mission.player)
		end

		if (IsAlive(Mission.evil2)) then
		
			SetIndependence(Mission.evil2,1)
			Attack(Mission.evil2,Mission.player)		
		end

		if (IsAlive(Mission.evil3)) then
		
			SetIndependence(Mission.evil3,1)
			Attack(Mission.evil3,Mission.player)
		end


		Mission.vo12time = (GetTime() + 2)
		Mission.ambushstart = true
	end

	if ((not Mission.vo12) and (Mission.ambushstart) and (not Mission.warn2) and (not Mission.warn3) and (not Mission.playerattackedevil) and (Mission.vo12time < GetTime())) then
	
		AudioMessage("scion0412.wav")	--John, you fell right into a trap...those were the rebelsnot 
		Mission.vo12 = true
	end

	--attackers along way
	if ((not Mission.tankscharge1) and (GetDistance(Mission.player,Mission.tank1) < 200)) then
	
		Goto(Mission.tank1,Mission.player)
		Goto(Mission.tank2,Mission.player)
		Mission.tankscharge1 = true
	end

	if ((not Mission.tankscharge2) and (GetDistance(Mission.player,Mission.tank3) < 200)) then
	
		Goto(Mission.tank3,Mission.player)
		Goto(Mission.tank4,Mission.player)
		Mission.tankscharge2 = true
	end

--**CINERACTIVE** when Cooke and the tug make it to the Mission.machine

--seeing when TUG is at the Mission.machine

--[[	if ((not Mission.player_at_machine) and (GetDistance(Mission.player,Mission.machine) < 250)) then
	
		Mission.start_bigspawn = true
		Mission.player_at_machine = true
	end
]]
	if ((not Mission.tug_at_machine) and (IsAround(Mission.tug1) and (GetDistance(Mission.tug1,Mission.machine) < 200))) then
	
		Mission.start_bigspawn = true
		Mission.tug_at_machine = true
	end

	if ((not Mission.bigspawn_cin_over) and (Mission.start_bigspawn)) then
	
		if (not Mission.bigspawnstart) then
		
			Retreat(Mission.tug1,"tug_die_here")
			Mission.stealer1_7time = (GetTime() + 0)
			Mission.stealer2_8time = (GetTime() + 1.5)
			Mission.stealer3_9time = (GetTime() + 3.0)
			Mission.stealer4_10time = (GetTime() + 4.5)
			Mission.stealer5_11time = (GetTime() + 6.0)
			Mission.stealer6_12time = (GetTime() + 7.5)
			Mission.bigspawn_shot1_starttime = (GetTime() + 1)

			--removing circle spawners so they don't interfere after the CIN starts
			if (IsAlive(Mission.circle_tank1)) then
			
				RemoveObject(Mission.circle_tank1)
			end

			if (IsAlive(Mission.circle_tank2)) then
			
				RemoveObject(Mission.circle_tank2)
			end

			if (IsAlive(Mission.circle_scout1)) then
			
				RemoveObject(Mission.circle_scout1)
			end

			if (IsAlive(Mission.circle_scout2)) then
			
				RemoveObject(Mission.circle_scout2)
			end

			--turning off players units AI so they don't try to fight the guys who kill his tug
			if (IsAlive(Mission.fvsent1)) then
			
				SetIndependence(Mission.fvsent1,0)
				Goto(Mission.fvsent1,"fvsent1")--getting them out of the way for the cineractive
			end

			if (IsAlive(Mission.fvsent2)) then
			
				SetIndependence(Mission.fvsent2,0)
				Goto(Mission.fvsent2,"fvsent2")
			end

			if (IsAlive(Mission.fvsent3)) then
			
				SetIndependence(Mission.fvsent3,0)
				Goto(Mission.fvsent3,"fvsent3")
			end

			if (IsAlive(Mission.fvtank1)) then
			
				SetIndependence(Mission.fvtank1,0)
				Goto(Mission.fvtank1,"fvtank1")
			end

			if (IsAlive(Mission.fvtank2)) then
			
				SetIndependence(Mission.fvtank2,0)
				Goto(Mission.fvtank2,"fvtank2")
			end

			if (IsAlive(Mission.fvtank3)) then
			
				SetIndependence(Mission.fvtank3,0)
				Goto(Mission.fvtank3,"fvtank3")
			end

			if (IsAlive(Mission.fvserv1)) then
			
				SetIndependence(Mission.fvserv1,0)
				Goto(Mission.fvserv1,"fvserv1")
			end

			if (IsAlive(Mission.fvarch1)) then
			
				SetIndependence(Mission.fvarch1,0)
				Goto(Mission.fvarch1,"fvarch1")
			end

			if (IsAlive(Mission.fvarch2)) then
			
				SetIndependence(Mission.fvarch2,0)
				Goto(Mission.fvarch2,"fvarch2")
			end
				Mission.circle_spawns_over = true
				Mission.bigspawnstart = true
		end

		--CAM CONTROLS********
		--FIRST SHOT -- Rebels coming out of canyon1
		if ((not bigspawn_shot1) and (Mission.bigspawn_shot1_starttime < GetTime())) then
		
			if (not Mission.rdycam1) then
			
				CameraReady()
				Mission.bigspawn_shot1_overtime = (GetTime() + 7)
				Mission.rdycam1 = true
			end

			CameraPath("bigspawn_campath1",1000,0,Mission.bigspawn_cam1look)

			if ((Mission.bigspawn_shot1_overtime) < GetTime()) then
			
				bigspawn_shot1 = true

			end
		end

		--SECOND SHOT -- rebels coming out of canyon 2
		if ((not Mission.bigspawn_shot2) and (bigspawn_shot1)) then
		
			if (not Mission.rdycam2) then
			
				CameraReady()
				Mission.bigspawn_shot2_overtime = (GetTime() + 5)
				Mission.rdycam2 = true
			end

			CameraPath("bigspawn_campath2",1000,0,Mission.bigspawn_cam2look)

			if ((Mission.bigspawn_shot2_overtime) < GetTime()) then
			
				Mission.bigspawn_shot2 = true
			end
		end

		--THIRD SHOT -- Pan shot of area
		if ((not Mission.bigspawn_shot3) and (Mission.bigspawn_shot2)) then
		
			if (not Mission.rdycam3) then
			
				CameraReady()
				Mission.bigspawn_shot3_overtime = (GetTime() + 15)
				Mission.rdycam3 = true
			end

			CameraPath("bigspawn_campath3",3000,1200,Mission.bigspawn_camlook3)

			if ((Mission.bigspawn_shot3_overtime) < GetTime()) then
			
				Mission.bigspawn_shot3 = true
			end
		end

		--FOURTH SHOT -- Shot of Bossman coming down the ramp in his walker
		if ((not Mission.bigspawn_shot4) and (Mission.bigspawn_shot3)) then
		
			if (not Mission.rdycam4) then
			
				CameraReady()
				Mission.bigspawn_shot4_overtime = (GetTime() + 10)
				Mission.rdycam4 = true
			end

			CameraPath("bigspawn_campath4",3000,100,Mission.bigspawn_cam4look)

			if ((Mission.bigspawn_shot4_overtime) < GetTime()) then
			
				Mission.bigspawn_shot4 = true
			end
		end

		--FIFTH SHOT -- Shot of Mission.bossman talking 1
		if ((not Mission.bigspawn_shot5) and (Mission.bigspawn_shot4)) then
		
			if (not Mission.rdycam5) then
			
				CameraReady()
				Mission.cutvo1time = (GetTime() + 2)
				Mission.bigspawn_shot5_overtime = (GetTime() + 7)
				Mission.rdycam5 = true
			end

			if ((not Mission.cutvo1) and (Mission.cutvo1time < GetTime())) then
			
				AudioMessage("cutsc0401.wav") --So...you thought it would be that easy?  I think not
				Mission.cutvo1 = true
			end

			CameraObject(Mission.bossman,0,-5,20,Mission.bossman)

			if ((Mission.bigspawn_shot5_overtime) < GetTime()) then
			
				Mission.bigspawn_shot5 = true
			end
		end
		
		--SIXTH SHOT -- Shot of hauler getting killed
		if ((not Mission.bigspawn_shot6) and (Mission.bigspawn_shot5)) then
		
			if (not Mission.rdycam6) then
			
				CameraReady()
				SetMaxHealth(Mission.tug1,775)
				SetCurHealth(Mission.tug1,775)
				SetIndependence(Mission.stealer9,1)
				SetIndependence(Mission.stealer10,1)
				SetIndependence(Mission.stealer11,1)
				SetIndependence(Mission.stealer12,1)
				Mission.attack_tugtime = (GetTime() + 0.5)
				Mission.rdycam6 = true
			end
			--telling a couple rebels to kill tug
			if ((not Mission.attack_tug) and (Mission.attack_tugtime < GetTime())) then
			
				Attack(Mission.stealer9,Mission.tug1)	
				Attack(Mission.stealer10,Mission.tug1)				
				Attack(Mission.stealer11,Mission.tug1)
				Attack(Mission.stealer12,Mission.tug1)
				Mission.attack_tug = true
			end
			--checking when tug is killed
			if ((not Mission.check_tug_dead) and (not IsAround(Mission.tug1))) then
			
				SetIndependence(Mission.stealer9,0)
				SetIndependence(Mission.stealer10,0)				
				SetIndependence(Mission.stealer11,0)
				SetIndependence(Mission.stealer12,0)
				Mission.bigspawn_shot6_overtime = (GetTime() + 7.5)
				Mission.cutvo3time = (GetTime() + 4)
				Mission.check_tug_dead = true
			end

			if ((not Mission.cutvo3) and (Mission.cutvo3time < GetTime())) then
			
				AudioMessage("cutsc0403.wav")  --burns/shab  "why do you betray us?"
				Mission.cutvo3 = true
			end

			--making killers go back into position after tug is killed
			if ((not Mission.stealer11_12_goback) and (Mission.check_tug_dead)) then
			
				Retreat(Mission.stealer9,"stealer9")
				Retreat(Mission.stealer10,"stealer10")				
				Retreat(Mission.stealer11,"stealer11")
				Retreat(Mission.stealer12,"stealer12")
				Mission.stealer11_12_goback = true
			end

			--making killers relook after going back
			if ((not Mission.stealer9_relook) and (Mission.stealer11_12_goback) and
				(GetDistance(Mission.stealer9,"stealer9") < 8)) then
			
				LookAt(Mission.stealer9,Mission.ailook)
				Mission.stealer9_relook = true
			end

			if ((not Mission.stealer10_relook) and (Mission.stealer11_12_goback) and
				(GetDistance(Mission.stealer10,"stealer10") < 8)) then
			
				LookAt(Mission.stealer10,Mission.ailook)
				Mission.stealer10_relook = true
			end
			
			if ((not Mission.stealer11_relook) and (Mission.stealer11_12_goback) and
				(GetDistance(Mission.stealer11,"stealer11") < 8)) then
			
				LookAt(Mission.stealer11,Mission.ailook)
				Mission.stealer11_relook = true
			end

			if ((not Mission.stealer12_relook) and (Mission.stealer11_12_goback) and
				(GetDistance(Mission.stealer12,"stealer12") < 8)) then
			
				LookAt(Mission.stealer12,Mission.ailook)
				Mission.stealer12_relook = true
			end

			CameraPath("tugshot_campath1",3000,0,Mission.tugshot_look1)

			if ((Mission.bigspawn_shot6_overtime) < GetTime()) then
			
				Mission.bigspawn_shot6 = true
			end
		end

		--SEVENTH SHOT -- Bossman saying how he hates earth and humans
		if ((not Mission.bigspawn_shot7) and (Mission.bigspawn_shot6)) then
		
			if (not Mission.rdycam7) then
			
				CameraReady()
				Mission.cutvo4time = (GetTime() + 0.5)
				Mission.rdycam7 = true
			end

			if ((not Mission.cutvo4) and (Mission.cutvo4time < GetTime())) then
			
				Mission.cutmsg4 = AudioMessage("cutsc0404.wav")--Our home is here, and if our core planet dies, we die with it.  we will not return to earth to live among humans then
				Mission.cutvo4 = true
			end

			if ((not Mission.cutvo4over) and (Mission.cutvo4) and (IsAudioMessageDone(Mission.cutmsg4))) then
			
				Mission.cutvo5time = (GetTime() + 1)
				Mission.cutvo4over = true
			end

			if ((not Mission.cutvo5) and (Mission.cutvo5time < GetTime())) then
			
				Mission.cutmsg5 = AudioMessage("cutsc0405.wav") --SHAB/BURNS "Were WE not once human?"
				Mission.cutvo5 = true
			end

			if ((not Mission.cutvo5over) and (Mission.cutvo5) and (IsAudioMessageDone(Mission.cutmsg5))) then
			
				Mission.cutvo6time = (GetTime() + 0.5)
				Mission.cutvo5over = true
			end

			if ((not Mission.cutvo6) and (Mission.cutvo6time < GetTime())) then
			
				Mission.cutmsg6 = AudioMessage("cutsc0406.wav")--Scion pilot "You perhaps, but I am scion through and throughnot   Enough talking, destroy all of themnot 		
				Mission.cutvo6 = true
			end

			if ((not Mission.cutvo6over) and (Mission.cutvo6) and (IsAudioMessageDone(Mission.cutmsg6))) then
			
				Mission.bigspawn_shot7_overtime = (GetTime() + 0.5)
				Mission.cutvo6over = true
			end

			CameraPath("shot7_path1",500,120,Mission.bossman)


		end
	


		-- THE "ACTORS"
		if ((not Mission.spawn1_7) and (Mission.stealer1_7time < GetTime())) then
		
			Mission.stealer1 = BuildObject("fvtkscn4",2,"bigspawn1")
			Mission.stealer7 = BuildObject("fvtkscn4",2,"bigspawn2")
			Retreat(Mission.stealer1,"stealer1")
			Retreat(Mission.stealer7,"stealer7")
			SetAvoidType(Mission.stealer1,0)
			SetAvoidType(Mission.stealer7,0)
			SetMaxHealth(Mission.stealer1,6000)
			SetCurHealth(Mission.stealer1,6000)
			SetMaxHealth(Mission.stealer7,6000)
			SetCurHealth(Mission.stealer7,6000)

		--	SetIndependence(Mission.stealer1,0)
		--	SetIndependence(Mission.stealer2,0)

			Mission.spawn1_7 = true
		end

		if ((not Mission.spawn2_8) and (Mission.stealer2_8time < GetTime())) then
		
			Mission.stealer2 = BuildObject("fvtkscn4",2,"bigspawn1")
			Retreat(Mission.stealer2,"stealer2")
			Mission.stealer8 = BuildObject("fvtkscn4",2,"bigspawn2")
			Retreat(Mission.stealer8,"stealer8")
			SetAvoidType(Mission.stealer2,0)
			SetAvoidType(Mission.stealer8,0)
			SetMaxHealth(Mission.stealer2,6000)
			SetCurHealth(Mission.stealer2,6000)
			SetMaxHealth(Mission.stealer8,6000)
			SetCurHealth(Mission.stealer8,6000)

			SetIndependence(Mission.stealer2,0)
			SetIndependence(Mission.stealer8,0)

			Mission.spawn2_8 = true
		end

		if ((not Mission.spawn3_9) and (Mission.stealer3_9time < GetTime())) then
		
			Mission.stealer3 = BuildObject("fvtkscn4",2,"bigspawn1")
			Retreat(Mission.stealer3,"stealer3")
			Mission.stealer9 = BuildObject("fvtkscn4",2,"bigspawn2")
			Retreat(Mission.stealer9,"stealer9")
			SetAvoidType(Mission.stealer3,0)
			SetAvoidType(Mission.stealer9,0)
			SetMaxHealth(Mission.stealer3,6000)
			SetCurHealth(Mission.stealer3,6000)
			SetMaxHealth(Mission.stealer9,6000)
			SetCurHealth(Mission.stealer9,6000)

			SetIndependence(Mission.stealer3,0)
			SetIndependence(Mission.stealer9,0)

			Mission.spawn3_9 = true
		end

		if ((not Mission.spawn4_10) and (Mission.stealer4_10time < GetTime())) then
		
			Mission.stealer4 = BuildObject("fvtkscn4",2,"bigspawn1")
			Retreat(Mission.stealer4,"stealer4")
			Mission.stealer10 = BuildObject("fvtkscn4",2,"bigspawn2")
			Retreat(Mission.stealer10,"stealer10")
			SetAvoidType(Mission.stealer4,0)
			SetAvoidType(Mission.stealer10,0)
			SetMaxHealth(Mission.stealer4,6000)
			SetCurHealth(Mission.stealer4,6000)
			SetMaxHealth(Mission.stealer10,6000)
			SetCurHealth(Mission.stealer10,6000)

			SetIndependence(Mission.stealer4,0)
			SetIndependence(Mission.stealer10,0)

			Mission.spawn4_10 = true
		end

		if ((not Mission.spawn5_11) and (Mission.stealer5_11time < GetTime())) then
		
			Mission.stealer5 = BuildObject("fvtkscn4",2,"bigspawn1")
			Retreat(Mission.stealer5,"stealer5")
			Mission.stealer11 = BuildObject("fvtkscn4",2,"bigspawn2")
			Retreat(Mission.stealer11,"stealer11")
			SetAvoidType(Mission.stealer5,0)
			SetAvoidType(Mission.stealer11,0)
			SetMaxHealth(Mission.stealer5,6000)
			SetCurHealth(Mission.stealer5,6000)
			SetMaxHealth(Mission.stealer1,6000)
			SetCurHealth(Mission.stealer1,6000)

			SetIndependence(Mission.stealer5,0)
			SetIndependence(Mission.stealer11,0)

			Mission.spawn5_11 = true
		end

		if ((not Mission.spawn6_12) and (Mission.stealer6_12time < GetTime())) then
		
			Mission.stealer6 = BuildObject("fvtkscn4",2,"bigspawn1")
			Retreat(Mission.stealer6,"stealer6")
			Mission.stealer12 = BuildObject("fvtkscn4",2,"bigspawn2")
			Retreat(Mission.stealer12,"stealer12")
			SetAvoidType(Mission.stealer6,0)
			SetAvoidType(Mission.stealer12,0)
			Mission.walk_spawntime = (GetTime() + 5)
			SetMaxHealth(Mission.stealer6,6000)
			SetCurHealth(Mission.stealer6,6000)
			SetMaxHealth(Mission.stealer12,6000)
			SetCurHealth(Mission.stealer12,6000)

			SetIndependence(Mission.stealer6,0)
			SetIndependence(Mission.stealer12,0)

			Mission.spawn6_12 = true
		end

		--/CONTROLLING WALKERS
		if ((not Mission.walk_spawn) and (Mission.walk_spawntime < GetTime())) then
		
			Mission.stealer_walk1 = BuildObject("fvwalk",2,"stealer_walk1")	
			Mission.stealer_walk2 = BuildObject("fvwalk",2,"stealer_walk2")
			Mission.bossman = BuildObject("fvwalk",2,"bossman_spawn")
			Retreat(Mission.stealer_walk1,"walk1_path")
			Retreat(Mission.stealer_walk2,"walk2_path")
			Mission.bossman_gotime = (GetTime() + 15)

			SetIndependence(Mission.stealer_walk1,0)
			SetIndependence(Mission.stealer_walk2,0)
			SetIndependence(Mission.bossman,0)

			Mission.walk_spawn = true
		end

		if ((not Mission.walk1_stop) and (GetDistance(Mission.stealer_walk1,"walk1_path_end") < 15)) then
		
			LookAt(Mission.stealer_walk1,Mission.ailook)
			Mission.walk1_stop = true
		end

		if ((not Mission.walk2_stop) and (GetDistance(Mission.stealer_walk2,"walk2_path_end") < 15)) then
		
			LookAt(Mission.stealer_walk2,Mission.ailook)
			Mission.walk2_stop = true
		end

		if ((not Mission.bossman_go) and (Mission.walk_spawn) and (Mission.bossman_gotime < GetTime())) then
		
			Retreat(Mission.bossman,"bossman")
			Mission.bossman_go = true
		end

		if ((not Mission.bossman_stop) and (Mission.walk_spawn) and (GetDistance(Mission.bossman,"bossman") < 5)) then
		
			Stop(Mission.bossman)
			LookAt(Mission.bossman,Mission.ailook)
			Mission.bossman_stop = true
		end
		--------
		
		--stopping vehicles when they get near thier destination
		if ((not Mission.stop1) and (Mission.spawn1_7) and (GetDistance(Mission.stealer1,"stealer1") < 5)) then
		
			LookAt(Mission.stealer1,Mission.ailook)
			Mission.stop1 = true
		end

		if ((not Mission.stop2) and (Mission.spawn2_8) and (GetDistance(Mission.stealer2,"stealer2") < 5)) then
		
			LookAt(Mission.stealer2,Mission.ailook)
			Mission.stop2 = true
		end

		if ((not Mission.stop3) and (Mission.spawn3_9) and (GetDistance(Mission.stealer3,"stealer3") < 5)) then
		
			LookAt(Mission.stealer3,Mission.ailook)
			Mission.stop3 = true
		end
		if ((not Mission.stop4) and (Mission.spawn4_10) and (GetDistance(Mission.stealer4,"stealer4") < 5)) then
		
			LookAt(Mission.stealer4,Mission.ailook)
			Mission.stop4 = true
		end

		if ((not Mission.stop5) and (Mission.spawn5_11) and (GetDistance(Mission.stealer5,"stealer5") < 5)) then
		
			LookAt(Mission.stealer5,Mission.ailook)
			Mission.stop5 = true
		end

		if ((not Mission.stop6) and (Mission.spawn6_12) and (GetDistance(Mission.stealer6,"stealer6") < 5)) then
		
			LookAt(Mission.stealer6,Mission.ailook)
			Mission.stop6 = true
		end

		if ((not Mission.stop7) and (Mission.spawn1_7) and (GetDistance(Mission.stealer7,"stealer7") < 5)) then
		
			LookAt(Mission.stealer7,Mission.ailook)
			Mission.stop7 = true
		end

		if ((not Mission.stop8) and (Mission.spawn2_8) and (GetDistance(Mission.stealer8,"stealer8") < 5)) then
		
			LookAt(Mission.stealer8,Mission.ailook)
			Mission.stop8 = true
		end

		if ((not Mission.stop9) and (Mission.spawn3_9) and (GetDistance(Mission.stealer9,"stealer9") < 5)) then
		
			LookAt(Mission.stealer9,Mission.ailook)
			Mission.stop9 = true
		end

		if ((not Mission.stop10) and (Mission.spawn4_10) and (GetDistance(Mission.stealer10,"stealer10") < 5)) then
		
			LookAt(Mission.stealer10,Mission.ailook)
			Mission.stop10 = true
		end

		if ((not Mission.stop11) and (Mission.spawn5_11) and (GetDistance(Mission.stealer11,"stealer11") < 5)) then
		
			LookAt(Mission.stealer11,Mission.ailook)
			Mission.stop11 = true
		end
		if ((not Mission.stop12) and (Mission.spawn6_12) and (GetDistance(Mission.stealer12,"stealer12") < 5)) then
		
			LookAt(Mission.stealer12,Mission.ailook)
			Mission.stop12 = true
		end

		--this stops the tug when it gets to the Mission.machine and makes it look towards the Mission.machine
		if ((not Mission.tug1_stop) and (Mission.bigspawnstart)) then
		
			if (GetDistance(Mission.tug1,"tug_die_here") < 10) then
			
				Stop(Mission.tug1)
				LookAt(Mission.tug1,Mission.machine)
				Mission.tug1_stop = true
			end
		end
		--checking when last VO has played, ENDS THE CIN
		if ((Mission.bigspawn_shot7_overtime) < GetTime()) then
		
			Mission.bigspawn_shot7 = true
			Mission.stealers_attacktime = (GetTime() + 1)
			CameraFinish()

			--giving Mission.player his units back
			if (IsAlive(Mission.fvsent1)) then
			

				SetIndependence(Mission.fvsent1,1)
				Stop(Mission.fvsent1,0)
			end

			if (IsAlive(Mission.fvsent2)) then
			

				SetIndependence(Mission.fvsent2,1)
				Stop(Mission.fvsent2,0)
			end

			if (IsAlive(Mission.fvsent3)) then
			

				SetIndependence(Mission.fvsent3,1)
				Stop(Mission.fvsent3,0)
			end

			if (IsAlive(Mission.fvtank1)) then
			

				SetIndependence(Mission.fvtank1,1)
				Stop(Mission.fvtank1,0)
			end

			if (IsAlive(Mission.fvtank2)) then
			

				SetIndependence(Mission.fvtank2,1)
				Stop(Mission.fvtank2,0)
			end

			if (IsAlive(Mission.fvtank3)) then
			

				SetIndependence(Mission.fvtank3,1)
				Stop(Mission.fvtank3,0)
			end

			if (IsAlive(Mission.fvserv1)) then
			

				SetIndependence(Mission.fvserv1,1)
				Stop(Mission.fvserv1,0)
			end

			if (IsAlive(Mission.fvarch1)) then
			

				SetIndependence(Mission.fvarch1,1)
				Stop(Mission.fvarch1,0)
			end

			if (IsAlive(Mission.fvarch2)) then
			

				SetIndependence(Mission.fvarch2,1)
				Stop(Mission.fvarch2,0)
			end

			Mission.bigspawn_cin_over = true
		end
	end
	--**BIGSPAWN CINERACTIVE OVER**--

	--after bigspawn, Mission.player must escape from the rebel scions and make it to
	--his dropship...

	if ((not Mission.rebels_attack) and (Mission.stealers_attacktime < GetTime())) then
	
		AudioMessage("scion0410.wav") --John, get out of therenot   Make it to the dropshipnot 


		SetIndependence(Mission.stealer1,1)
		SetIndependence(Mission.stealer2,1)
		SetIndependence(Mission.stealer3,1)
		SetIndependence(Mission.stealer4,1)
		SetIndependence(Mission.stealer5,1)
		SetIndependence(Mission.stealer6,1)
		SetIndependence(Mission.stealer7,0)
		SetIndependence(Mission.stealer8,0)
		SetIndependence(Mission.stealer9,0)
		SetIndependence(Mission.stealer10,0)
		SetIndependence(Mission.stealer11,0)
		SetIndependence(Mission.stealer12,0)
		Mission.release_otherstime = (GetTime() + 15)
	--	SetIndependence(Mission.bossman,1)
	--	SetIndependence(Mission.stealer_walk1,1)
	--	SetIndependence(Mission.stealer_walk2,1)

		--giving the attackers a target other than Mission.player, so Mission.player has a chance to get away
		if (not Mission.picktarget) then
		
			if ((IsAround(Mission.fvtank1) and (GetDistance(Mission.fvtank1,Mission.machine) < 600))) then
			
				Attack(Mission.stealer1,Mission.fvtank1)
				Attack(Mission.stealer2,Mission.fvtank1)
				Attack(Mission.stealer3,Mission.fvtank1)
				Attack(Mission.stealer4,Mission.fvtank1)
				Attack(Mission.stealer5,Mission.fvtank1)
				Attack(Mission.stealer6,Mission.fvtank1)
				Mission.picktarget = true
			end
		
			if ((not Mission.picktarget) and (IsAround(Mission.fvtank2) and (GetDistance(Mission.fvtank2,Mission.machine) < 600))) then
			
				Attack(Mission.stealer1,Mission.fvtank2)
				Attack(Mission.stealer2,Mission.fvtank2)
				Attack(Mission.stealer3,Mission.fvtank2)
				Attack(Mission.stealer4,Mission.fvtank2)
				Attack(Mission.stealer5,Mission.fvtank2)
				Attack(Mission.stealer6,Mission.fvtank2)
				Mission.picktarget = true
			end		

			if ((not Mission.picktarget) and (IsAround(Mission.fvtank3) and (GetDistance(Mission.fvtank3,Mission.machine) < 600))) then
			
				Attack(Mission.stealer1,Mission.fvtank3)
				Attack(Mission.stealer2,Mission.fvtank3)
				Attack(Mission.stealer3,Mission.fvtank3)
				Attack(Mission.stealer4,Mission.fvtank3)
				Attack(Mission.stealer5,Mission.fvtank3)
				Attack(Mission.stealer6,Mission.fvtank3)
				Mission.picktarget = true
			end		

			if ((not Mission.picktarget) and (IsAround(Mission.fvsent1) and (GetDistance(Mission.fvsent1,Mission.machine) < 600))) then
			
				Attack(Mission.stealer1,Mission.fvsent1)
				Attack(Mission.stealer2,Mission.fvsent1)
				Attack(Mission.stealer3,Mission.fvsent1)
				Attack(Mission.stealer4,Mission.fvsent1)
				Attack(Mission.stealer5,Mission.fvsent1)
				Attack(Mission.stealer6,Mission.fvsent1)
				Mission.picktarget = true
			end		
		
			if ((not Mission.picktarget) and (IsAround(Mission.fvsent2) and (GetDistance(Mission.fvsent2,Mission.machine) < 600))) then
			
				Attack(Mission.stealer1,Mission.fvsent2)
				Attack(Mission.stealer2,Mission.fvsent2)
				Attack(Mission.stealer3,Mission.fvsent2)
				Attack(Mission.stealer4,Mission.fvsent2)
				Attack(Mission.stealer5,Mission.fvsent2)
				Attack(Mission.stealer6,Mission.fvsent2)
				Mission.picktarget = true
			end		
		
			if ((not Mission.picktarget) and (IsAround(Mission.fvsent3) and (GetDistance(Mission.fvsent3,Mission.machine) < 600))) then
			
				Attack(Mission.stealer1,Mission.fvsent3)
				Attack(Mission.stealer2,Mission.fvsent3)
				Attack(Mission.stealer3,Mission.fvsent3)
				Attack(Mission.stealer4,Mission.fvsent3)
				Attack(Mission.stealer5,Mission.fvsent3)
				Attack(Mission.stealer6,Mission.fvsent3)
				Mission.picktarget = true
			end		
		end

		ClearObjectives()
		AddObjective("scion0406.otf", "WHITE")
		SetObjectiveOff(Mission.machine)
		SetObjectiveOn(Mission.dropship1)
		tempstr = TranslateString("Mission1702")  -- Dropship
		SetObjectiveName(Mission.dropship1,tempstr)
		Mission.rebels_attack = true
	end
		--sending 6 of them after Mission.player
	if ((Mission.rebels_attack) and (not Mission.release_others) and (Mission.release_otherstime < GetTime())) then
	
		SetIndependence(Mission.stealer7,1)
		SetIndependence(Mission.stealer8,1)
		SetIndependence(Mission.stealer9,1)
		SetIndependence(Mission.stealer10,1)
		SetIndependence(Mission.stealer11,1)
		SetIndependence(Mission.stealer12,1)
		Attack(Mission.stealer7,Mission.player)
		Attack(Mission.stealer8,Mission.player)
		Attack(Mission.stealer9,Mission.player)
		Attack(Mission.stealer10,Mission.player)
		Attack(Mission.stealer11,Mission.player)
		Attack(Mission.stealer12,Mission.player)
		Mission.sick_first6_on_playertime = (GetTime() + 10)
		Mission.release_others = true
	end
	--10 sec later, send the rest after Mission.player...
	if ((not Mission.sick_first6_on_player) and (Mission.sick_first6_on_playertime < GetTime())) then
	
		Attack(Mission.stealer1,Mission.player)
		Attack(Mission.stealer2,Mission.player)
		Attack(Mission.stealer3,Mission.player)
		Attack(Mission.stealer4,Mission.player)
		Attack(Mission.stealer5,Mission.player)
		Attack(Mission.stealer6,Mission.player)
		SetIndependence(Mission.stealer_walk1,1)
		SetIndependence(Mission.stealer_walk2,1)
		SetIndependence(Mission.bossman,1)
		Attack(Mission.stealer_walk1,Mission.player)
		Attack(Mission.stealer_walk2,Mission.player)
		Attack(Mission.bossman,Mission.player)
		Mission.sick_first6_on_player = true
	end


	if ((Mission.rebels_attack) and (not Mission.player_at_dropship1) and (GetDistance(Mission.player,"dropship1") < 15)) then
	


		--removing enemies so they donb't kill Mission.player during cineractive
		if (IsAlive(Mission.stealer1)) then
		
			RemoveObject(Mission.stealer1)
		end

		if (IsAlive(Mission.stealer2)) then
		
			RemoveObject(Mission.stealer2)
		end

		if (IsAlive(Mission.stealer3)) then
		
			RemoveObject(Mission.stealer3)
		end

		if (IsAlive(Mission.stealer4)) then
		
			RemoveObject(Mission.stealer4)
		end

		if (IsAlive(Mission.stealer5)) then
		
			RemoveObject(Mission.stealer5)
		end

		if (IsAlive(Mission.stealer6)) then
		
			RemoveObject(Mission.stealer6)
		end

		if (IsAlive(Mission.stealer7)) then
		
			RemoveObject(Mission.stealer7)
		end

		if (IsAlive(Mission.stealer8)) then
		
			RemoveObject(Mission.stealer8)
		end

		if (IsAlive(Mission.stealer9)) then
		
			RemoveObject(Mission.stealer9)
		end

		if (IsAlive(Mission.stealer10)) then
		
			RemoveObject(Mission.stealer10)
		end

		if (IsAlive(Mission.stealer11)) then
		
			RemoveObject(Mission.stealer11)
		end

		if (IsAlive(Mission.stealer12)) then
		
			RemoveObject(Mission.stealer12)
		end
		
		--telling players wingmen to stop so they don't try to follow him into the dropship (this makes framerate go to hell)
		if (IsAlive(Mission.fvsent1)) then
		
			Stop(Mission.fvsent1)
		end

		if (IsAlive(Mission.fvsent2)) then
		
			Stop(Mission.fvsent2)
		end

		if (IsAlive(Mission.fvsent3)) then
		
			Stop(Mission.fvsent3)
		end

		if (IsAlive(Mission.fvtank1)) then
		
			Stop(Mission.fvtank1)
		end

		if (IsAlive(Mission.fvtank2)) then
		
			Stop(Mission.fvtank2)
		end

		if (IsAlive(Mission.fvtank3)) then
		
			Stop(Mission.fvtank3)
		end

		if (IsAlive(Mission.tug1)) then
		
			Stop(Mission.tug1)
		end

		if (IsAlive(Mission.fvserv1)) then
		
			Stop(Mission.fvserv1)
		end

		if (IsAlive(Mission.fvarch1)) then
		
			Stop(Mission.fvarch1)
		end

		if (IsAlive(Mission.fvarch2)) then
		
			Stop(Mission.fvarch2)
		end

		Mission.player_at_dropship1 = true
	end

	--CINERACTIVE of dropship taking off
	if ((not Mission.takeoff_shot1) and (Mission.player_at_dropship1)) then
	
		if (not Mission.takeoff_rdycam1) then
		
			CameraReady()
			Mission.faker1 = BuildObject("fvtank",3,"faker1")
			Mission.faker2 = BuildObject("fvtank",3,"faker2")
			Mission.faker3 = BuildObject("fvtank",3,"faker3")
			Mission.faker4 = BuildObject("fvtank",3,"faker4")
			Attack(Mission.faker1,Mission.dropship2)
			Attack(Mission.faker2,Mission.dropship2)
			Attack(Mission.faker3,Mission.dropship2)
			Attack(Mission.faker4,Mission.dropship2)
			Mission.takeoff_time = (GetTime() + 8)
			Mission.takeoff_rdycam1 = true
		end

		CameraPath("takeoff_campath1",1000,0,Mission.dropship2)

		if ((not Mission.takeoff) and (Mission.takeoff_time < GetTime())) then
		
			SetAnimation(Mission.dropship2,"takeoff",1)
			Mission.fakers_stop_attacktime = (GetTime() + 3)
			Mission.take_off_soundtime = (GetTime() + 4)
			Mission.takeoff = true
		end

		--play dropship taking off sound
		if ((not Mission.take_off_sound) and (Mission.take_off_soundtime < GetTime())) then
		
			AudioMessage("droptoff.wav")
			Mission.take_off_sound = true
		end

		if ((not Mission.fakers_stop_attack) and (Mission.fakers_stop_attacktime < GetTime())) then
		
			SetIndependence(Mission.faker1,0)
			SetIndependence(Mission.faker2,0)
			SetIndependence(Mission.faker3,0)
			SetIndependence(Mission.faker4,0)
			Stop(Mission.faker1)
			Stop(Mission.faker2)
			Stop(Mission.faker3)
			Stop(Mission.faker4)	
			Patrol(Mission.faker1,"faker_path")
			Patrol(Mission.faker2,"faker_path")
			Patrol(Mission.faker3,"faker_path")
			Patrol(Mission.faker4,"faker_path")
			SucceedMission(GetTime() + 10,"scion04w1.txt")
			Mission.fakers_stop_attack = true
		end
	end

	--This controls the circlers around the lava ocean
	if (not Mission.circle_spawns_over) then
	
		--Mission.circle_tank1
		if ((not Mission.spawn_circle_tank1) and (Mission.spawn_circle_tank1time < GetTime())) then
		
			Mission.circle_tank1 = BuildObject("ivtank",4,"circle4")
			SetSkill(Mission.circle_tank1,2)
			Patrol(Mission.circle_tank1,"scoutpath2")
			Mission.circle_tank1_dead = false
			Mission.spawn_circle_tank1 = true
		end

		if ((not Mission.circle_tank1_dead) and (Mission.spawn_circle_tank1) and (not IsAlive(Mission.circle_tank1))) then
		
			Mission.spawn_circle_tank1time = (GetTime() + 200)
			Mission.circle_tank1_attack = false
			Mission.spawn_circle_tank1 = false
			Mission.circle_tank1_dead = true
		end

		--Mission.circle_tank2
		if ((not Mission.spawn_circle_tank2) and (Mission.spawn_circle_tank2time < GetTime())) then
		
			Mission.circle_tank2 = BuildObject("ivtank",4,"circle2")
			SetSkill(Mission.circle_tank2,2)
			Patrol(Mission.circle_tank2,"scoutpath2")
			Mission.circle_tank2_dead = false
			Mission.spawn_circle_tank2 = true
		end

		if ((not Mission.circle_tank2_dead) and (Mission.spawn_circle_tank2) and (not IsAlive(Mission.circle_tank2))) then
		
			Mission.spawn_circle_tank2time = (GetTime() + 200)
			Mission.spawn_circle_tank2 = false
			Mission.circle_tank2_dead = true
		end

		--Mission.circle_scout1
		if ((not Mission.spawn_circle_scout1) and (Mission.spawn_circle_scout1time < GetTime())) then
		
			Mission.circle_scout1 = BuildObject("ivscout",4,"circle1")
			SetSkill(Mission.circle_scout1,2)
			Patrol(Mission.circle_scout1,"scoutpath")
			Mission.circle_scout1_dead = false
			Mission.spawn_circle_scout1 = true
		end

		if ((not Mission.circle_scout1_dead) and (Mission.spawn_circle_scout1) and (not IsAlive(Mission.circle_scout1))) then
		
			Mission.spawn_circle_scout1time = (GetTime() + 200)
			Mission.circle_scout1_attack = false
			Mission.spawn_circle_scout1 = false
			Mission.circle_scout1_dead = true
		end

		--Mission.circle_scout2
		if ((not Mission.spawn_circle_scout2) and (Mission.spawn_circle_scout2time < GetTime())) then
		
			Mission.circle_scout2 = BuildObject("ivscout",4,"circle3")
			SetSkill(Mission.circle_scout2,2)
			Patrol(Mission.circle_scout2,"scoutpath")
			Mission.circle_scout2_dead = false
			Mission.spawn_circle_scout2 = true
		end

		if ((not Mission.circle_scout2_dead) and (Mission.spawn_circle_scout2) and (not IsAlive(Mission.circle_scout2))) then
		
			Mission.spawn_circle_scout2time = (GetTime() + 200)
			Mission.circle_scout2_attack = false
			Mission.spawn_circle_scout2 = false
			Mission.circle_scout2_dead = true
		end

		--This will make the 1 circle tank and 1 circle scout attack the players service truck when they
		--get near it
		if ((not Mission.circle_tank1_attack) and (IsAlive(Mission.circle_tank1) and (IsAlive(Mission.fvserv1) 
		and (GetDistance(Mission.circle_tank1,Mission.fvserv1) < 200)))) then
		
			Attack(Mission.circle_tank1,Mission.fvserv1)
			Mission.circle_tank1_attack = true
		end

		if ((not Mission.circle_scout1_attack) and (IsAlive(Mission.circle_scout1) and (IsAlive(Mission.fvserv1) 
		and (GetDistance(Mission.circle_scout1,Mission.fvserv1) < 200)))) then
		
			Attack(Mission.circle_scout1,Mission.fvserv1)
			Mission.circle_scout1_attack = true
		end

		--This will make the 2 circle tank and 2 circle scout attack the tug
	
		if ((not Mission.circle_tank2_attack) and (IsAlive(Mission.circle_tank2) and (IsAlive(Mission.tug1) 
		and (GetDistance(Mission.circle_tank2,Mission.tug1) < 200)))) then
		
			Attack(Mission.circle_tank2,Mission.tug1)
			Mission.circle_tank2_attack = true
		end

		if ((not Mission.circle_scout2_attack) and (IsAlive(Mission.circle_scout2) and (IsAlive(Mission.tug1) 
		and (GetDistance(Mission.circle_scout2,Mission.tug1) < 200)))) then
		
			Attack(Mission.circle_scout2,Mission.tug1)
			Mission.circle_scout2_attack = true
		end
	end
	--------

	--mission lost if Mission.power source ever destroyed then
	if ((not IsAround(Mission.power) and (not Mission.start_bigspawn))) then
	
		if ((not Mission.powerdead) and (not Mission.haulerdead)) then
		
			Mission.vo9time = (GetTime() + 2)
			Mission.powerdead = true
		end

		if ((not Mission.missionlost) and (Mission.vo9time < GetTime())) then
		
			Mission.msg9 = AudioMessage("scion0409.wav") -- the powersource has been destroyednot 
			Mission.missionlost = true
		end

		if ((not Mission.obj3) and (Mission.missionlost) and (IsAudioMessageDone(Mission.msg9))) then
		
			ClearObjectives()
			AddObjective("scion0403.otf", "WHITE")
			FailMission(GetTime() + 10,"scion04L1.txt")	
			Mission.obj3 = true
		end
	end

	--mission lost if Hauler gets destroyed then
	if (not IsAround(Mission.tug1) and (not Mission.start_bigspawn)) then
	
		if ((not Mission.haulerdead) and (not Mission.powerdead)) then
		
			Mission.vo10time = (GetTime() + 2)
			Mission.haulerdead = true
		end

		if ((not Mission.missionlost2) and (Mission.vo10time < GetTime())) then
		
			Mission.msg10 = AudioMessage("scion0415.wav") --Dammit the Hauler has been destroyednot 
			Mission.missionlost2 = true		
		end

		if ((not Mission.obj4) and (Mission.missionlost2) and (IsAudioMessageDone(Mission.msg10))) then
		
			ClearObjectives()
			AddObjective("scion0404.otf", "WHITE")
			FailMission(GetTime() + 10,"scion04L2.txt")
			Mission.obj4 = true
		end
	end
end