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
	wave1 = false,
	wave2 = false,
	wave3 = false,
	wave4 = false,
	wave5 = false,	
	checktank1alive = false,
	tank1alive = false,
	checktank1dead = false,
	tank1go = false,
	checktank2alive = false,
	tank2alive = false,
	checktank2dead = false,
	tank2go = false,
	checktank3alive = false,
	tank3alive = false,
	checktank3dead = false,
	tank3go = false,
	vo1 = false,
	obj1 = false,
	powergotten = false,
	powerhome = false,
	enemyrecydead = false,
	vo3 = false,
	powerdead = false,
	vo5 = false,
	obj3 = false,
	vo6 = false,
	msg6done = false,
	vo7 = false,
	shabsendspilots = false,
	vo7done = false,
	vo8done = false,
	vo8 = false,
	vo9 = false,
	vo10 = false,
	vo9done = false,
	obj4 = false,
	alphamoveout = false,
	vo11 = false,
	vo11done = false,
	vo12 = false,
	vo12done = false,
	vo13 = false,
	vo14 = false,
	vo13done = false,
	vo14done = false,
	playertoofar = false,
	wave2killed = false,
	wave3killed = false,
	alphadead = false,
	kill_alpha = false,
	playersrecy_dead = false,
	vo_recydead = false,
	obj5 = false,
	wavesover = false,
	alpha1die = false,
	insurance1 = false,
	spawner2atoofar = false,
	spawner2btoofar = false,
	insurance2 = false,
	spawner3atoofar = false,
	spawner3btoofar = false,
	scav_attack = false,
	player_took_scav = false,
	scav_attacker_dead = false,
	wave6 = false,
	wave7 = false,
	wave8 = false,
	player_attacked_scouts = false,
--  floats
	wave1time = 999999.9,
	wave2time = 999999.9,
	wave3time = 999999.9,	
	wave4time = 999999.9,
	wave5time = 999999.9,
	vo1time = 999999.9,
	vo3time = 999999.9,
	vo5time = 999999.9,
	vo6time = 999999.9,
	vo7time = 999999.9,
	convodelay = 999999.9,
	vo8time = 999999.9,
	vo9time = 999999.9,
	vo10time = 999999.9,
	vo11time = 999999.9,
	vo12time = 999999.9,
	alphamovetime = 999999.9,
	alphadietime = 999999.9,
	vo13time = 999999.9,
	vo14time = 999999.9,
	kill_alphatime = 999999.9,
	vo_recydeadtime = 999999.9,
	aitank1_movetime = 999999.9,
	aitank2_movetime = 999999.9,
	aitank3_movetime = 999999.9,
	scav_attacktime = 999999.9,
	wave6time = 999999.9,
	wave7time = 999999.9,
	wave8time = 999999.9,
--  handles
	spawner1a,
	spawner1b,
	spawner2a,
	spawner2b,
	spawner3a,
	spawner3b,
	spawner4a,
	spawner4b,
	spawner4c,
	spawner5a,
	spawner5b,
	spawner5c,
	aitank1,
	aitank2,
	aitank3,
	msg1,
	msg4,
	msg6,
	msg7,
	msg8,
	msg9,
	msg10,
	msg11,
	msg12,
	power,
	recy1,
	alpha1,
	alpha2,
	misl1,
	misl2,
	playersrecy,
	player,
	vofail1,
	jak1,
	jak2,
	jak3,
	jak4,
	jak5,
	jak6,
	jak7,
	nav1,
	lung,
	hauler,
	ivrckt1,
	ivrckt2,
	ivrckt3,
	ivrckt4,
	ivrckt5,
	ivrckt6,
	ivrckt7,
	isdf_scav1,
	scav_attacker,
	spawner6a,
	spawner6b,
	spawner7a,
	spawner7b,
	spawner8a,
	spawner8b
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

--  handles
	Mission.spawner1a = nil
	Mission.spawner1b = nil
	Mission.spawner2a = nil
	Mission.spawner2b = nil
	Mission.spawner3a = nil
	Mission.spawner3b = nil
	Mission.spawner4a = nil
	Mission.spawner4b = nil
	Mission.spawner4c = nil
	Mission.spawner5a = nil
	Mission.spawner5b = nil
	Mission.spawner5c = nil
	Mission.aitank1 = nil
	Mission.aitank2 = nil
	Mission.aitank3 = nil
	Mission.msg1 = nil
	Mission.msg4 = nil
	Mission.msg6 = nil
	Mission.msg7 = nil
	Mission.msg8 = nil
	Mission.msg9 = nil
	Mission.msg10 = nil
	Mission.msg11 = nil
	Mission.msg12 = nil
	Mission.power = GetHandle("power")
	Mission.recy1 = GetHandle("recy1")
	Mission.alpha1 = GetHandle("alpha1")
	Mission.alpha2 = GetHandle("alpha2")
	Mission.misl1 = GetHandle("misl1")
	Mission.misl2 = GetHandle("misl2")
	Mission.playersrecy = GetHandle("playersrecy")
	Mission.player = nil
	Mission.vofail1 = nil
	Mission.jak1 = GetHandle("jak1")
	Mission.jak2 = GetHandle("jak2")
	Mission.jak3 = GetHandle("jak3")
	Mission.jak4 = GetHandle("jak4")
	Mission.jak5 = GetHandle("jak5")
	Mission.jak6 = GetHandle("jak6")
	Mission.jak7 = GetHandle("jak7")
	Mission.nav1 = nil
	Mission.lung = nil
	Mission.hauler = nil
	Mission.ivrckt1 = GetHandle("ivrckt1")
	Mission.ivrckt2 = GetHandle("ivrckt2")
	Mission.ivrckt3 = GetHandle("ivrckt3")
	Mission.ivrckt4 = GetHandle("ivrckt4")
	Mission.ivrckt5 = GetHandle("ivrckt5")
	Mission.ivrckt6 = GetHandle("ivrckt6")
	Mission.ivrckt7 = GetHandle("ivrckt7")
	Mission.isdf_scav1 = GetHandle("isdf_scav1")
	Mission.scav_attacker = nil
	Mission.spawner6a = nil
	Mission.spawner6b = nil
	Mission.spawner7a = nil
	Mission.spawner7b = nil
	Mission.spawner8a = nil
	Mission.spawner8b = nil
   
end

function AddObject(h) --This function is called when an object appears in the game. --
	if ((Mission.aitank1 == nil) and (GetTeamNum(h) == 2) and (IsOdf(h,"ivtank"))) then
	
		Mission.aitank1 = h
	

	elseif ((Mission.aitank2 == nil) and (GetTeamNum(h) == 2) and (IsOdf(h,"ivtank"))) then
	
		Mission.aitank2 = h
	

	elseif ((Mission.aitank3 == nil) and (GetTeamNum(h) == 2) and (IsOdf(h,"ivtank"))) then
	
		Mission.aitank3 = h
	
	end
	if (IsOdf(h,"fblung")) then
	
		Mission.lung = h
	end

	if (IsOdf(h,"fvtug")) then
	
		Mission.hauler = h
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

--	AddScrap(2,10)
	if (not Mission.missionstart) then
	
		SetScrap(1,40)
		SetScrap(2,30)
		Ally(2,3)
		Mission.wave1time = (GetTime() + 70)
		SetAIP("scion0301.aip",2)
		Mission.vo6time = (GetTime() + 4)
		Stop(Mission.alpha1)
		Stop(Mission.alpha2)
		Patrol(Mission.misl1,"misl1_patrol")
		Patrol(Mission.misl2,"misl2_patrol")
		Patrol(Mission.jak1,"jak_1_2_path")
		Follow(Mission.jak2,Mission.jak1)
		Patrol(Mission.jak3,"jak_3_path")
		Patrol(Mission.jak4,"jak_4_path")
		Patrol(Mission.jak5,"jak_5_path")
		Patrol(Mission.jak6,"jak_6_7_path")
		Follow(Mission.jak7,Mission.jak6)
		Mission.missionstart = true
	end

	--if Mission.player shoots scouts at beginning then
	if (not Mission.vo11) then
	
		if ((not Mission.player_attacked_scouts) and (GetCurHealth(Mission.alpha1) < 150) and (GetWhoShotMe(Mission.alpha1)  ==  Mission.player)) then
		
			if (not IsAudioMessageDone(Mission.msg6)) then
			
				StopAudioMessage(Mission.msg6)
			end
			
			if (not IsAudioMessageDone(Mission.msg7)) then
			
				StopAudioMessage(Mission.msg7)
			end
			
			if (not IsAudioMessageDone(Mission.msg8)) then
			
				StopAudioMessage(Mission.msg8)
			end

			if (not IsAudioMessageDone(Mission.msg9)) then
			
				StopAudioMessage(Mission.msg9)
			end

			if (not IsAudioMessageDone(Mission.msg10)) then
			
				StopAudioMessage(Mission.msg10)
			end
			Mission.vo6 = true
			Mission.vo7 = true
			Mission.vo8 = true
			Mission.vo9 = true
			Mission.vo10 = true

			AudioMessage("scngen08.wav")
			ClearObjectives()
			AddObjective("scion0306.otf", "WHITE")
			FailMission(GetTime() + 15,"scion03L1.txt")
			Mission.player_attacked_scouts = true
		end

		if ((not Mission.player_attacked_scouts) and (GetCurHealth(Mission.alpha2) < 150) and (GetWhoShotMe(Mission.alpha2)  ==  Mission.player)) then
		
			if (not IsAudioMessageDone(Mission.msg6)) then
			
				StopAudioMessage(Mission.msg6)
			end
			
			if (not IsAudioMessageDone(Mission.msg7)) then
			
				StopAudioMessage(Mission.msg7)
			end
			
			if (not IsAudioMessageDone(Mission.msg8)) then
			
				StopAudioMessage(Mission.msg8)
			end

			if (not IsAudioMessageDone(Mission.msg9)) then
			
				StopAudioMessage(Mission.msg9)
			end

			if (not IsAudioMessageDone(Mission.msg10)) then
			
				StopAudioMessage(Mission.msg10)
			end

			Mission.vo6 = true
			Mission.vo7 = true
			Mission.vo8 = true
			Mission.vo9 = true
			Mission.vo10 = true

			AudioMessage("scngen08.wav")
			ClearObjectives()
			AddObjective("scion0306.otf", "WHITE")
			FailMission(GetTime() + 15,"scion03L1.txt")
			Mission.player_attacked_scouts = true
		end
	end
--SHAB is ordering Alpha wing to do a sweep to the North and find the ISDF base
	if (not Mission.shabsendspilots) then
	
		if ((not Mission.vo6) and (Mission.vo6time < GetTime())) then
		
			Mission.msg6 = AudioMessage("scion0306.wav") -- scion0306.wav  SHAB - We still do not have precise coordinates of the ISDF base.  I'm sending out a scout patrol to find the base . . . Alpha one, Alpha two do you copy?
			Mission.vo6 = true
		end

		if ((not Mission.msg6done) and (Mission.vo6) and (IsAudioMessageDone(Mission.msg6))) then
		
			Mission.vo7time = (GetTime() + 0.5)
			Mission.msg6done = true
		end

		if ((not Mission.vo7) and (Mission.vo7time < GetTime())) then
		
			Mission.msg7 = AudioMessage("scion0307.wav") -- scion0307.wav ALPHA1 - Yes, Shabayev.
			Mission.vo7 = true
		end

		if ((not Mission.vo7done) and (Mission.vo7) and (IsAudioMessageDone(Mission.msg7))) then
		
			Mission.vo8time = (GetTime() + 0.5)	
			Mission.vo7done = true
		end

		if ((not Mission.vo8) and (Mission.vo8time < GetTime())) then
		
			Mission.msg8 = AudioMessage("scion0308.wav") -- scion0308.wav  SHAB - Alpha wing, do a recon sweep to the North and get us the precise coordinates of the ISDF base.
			Mission.vo8 = true
		end

		if ((not Mission.vo8done) and (Mission.vo8) and (IsAudioMessageDone(Mission.msg8))) then
		
			Mission.vo9time = (GetTime() + 0.5)
			Mission.vo8done = true
		end

		if ((not Mission.vo9) and (Mission.vo9time < GetTime())) then
		
			Mission.msg9 = AudioMessage("scion0309.wav") -- scion0309.wav  ALPHA1 - As you wish.
			Mission.vo9 = true
		end

		if ((not Mission.vo9done) and (Mission.vo9) and (IsAudioMessageDone(Mission.msg9))) then
		
			Mission.vo10time = (GetTime() + 1.5)
			Mission.alphamovetime = (GetTime() + 0.5)
			Mission.vo9done = true
		end

		if ((not Mission.vo10) and (Mission.vo10time < GetTime())) then
		
			Mission.msg10 = AudioMessage("scion0310.wav") -- scion0310.wav SHAB - Cooke, focus on building the base while Alpha wing searches for the ISDF.
			Mission.vo10 = true
		end

		if ((not Mission.obj4) and (not Mission.player_attacked_scouts) and (Mission.vo10) and (IsAudioMessageDone(Mission.msg10))) then
		
			ClearObjectives()
			AddObjective("scion0304.otf", "WHITE")
			Mission.obj4 = true
			Mission.shabsendspilots = true
		end
	end
------

	--/alpha wing moves out
	if ((not Mission.alphamoveout) and (not Mission.player_attacked_scouts) and (Mission.alphamovetime < GetTime())) then
	
		Retreat(Mission.alpha1,"alphapath")
		SetIndependence(Mission.alpha2,0)
		Follow(Mission.alpha2,Mission.alpha1)

		Mission.alphamoveout = true
	end
	--/
--when wave 2 is killed, alpha wing will start reporting]
	if ((not Mission.wave2killed) and (Mission.wave2) and (not IsAround(Mission.spawner2a) and (not IsAround(Mission.spawner2b)))) then
	
		Mission.alphadietime = (GetTime() + 8)
		Mission.insurance1 = true
		Mission.wave2killed = true
	end

	--when wave 3 killed, shab gives coordinates of the base
	if ((not Mission.wave3killed) and (Mission.wave3) and (not IsAround(Mission.spawner3a) and (not IsAround(Mission.spawner3b)))) then
	
		Mission.vo1time = (GetTime() + 10)
		Mission.insurance2 = true
		Mission.wave3killed = true
	end

--alpha wing finds the base and gets blown up
	if ((not Mission.vo11) and (Mission.alphadietime < GetTime())) then
	
		Mission.msg11 = AudioMessage("scion0311.wav") -- scion0311.wav ALPHA1 - Alpha wing reporting, we think we've found the base.  Oh no, we've been spottednot   We Are under attacknot 
		Goto(Mission.alpha1,"enemybase")
		Goto(Mission.alpha2,"enemybase")
		Attack(Mission.misl1,Mission.alpha1)
		Attack(Mission.misl2,Mission.alpha2)
		Mission.vo11 = true
	end

	if ((not Mission.vo11done) and (Mission.vo11) and (IsAudioMessageDone(Mission.msg11))) then
	
		Mission.vo12time = (GetTime() + 1)
		Mission.vo11done = true
	end

	if ((not Mission.vo12) and (Mission.vo12time < GetTime())) then
	
		Mission.msg12 = AudioMessage("scion0312.wav") -- scion0312.wav SHAB - Alpha wing, can you handle the situation?
		Mission.vo12 = true
	end

	if ((not Mission.vo12done) and (Mission.vo12) and (IsAudioMessageDone(Mission.msg12))) then
	
		Mission.vo13time = (GetTime() + 1)
		Mission.vo12done = true
	end

	if ((not Mission.vo13) and (Mission.vo13time < GetTime())) then
	
		msg13 = AudioMessage("scion0313.wav") --scion0313.wav ALPHA1 - Negative, negative, there are too many of them.  I'm breaking upnot 
		Mission.kill_alphatime = (GetTime() + 45)
		Mission.vo13 = true
	end

	if ((not Mission.alpha1die) and (Mission.vo13) and (IsAudioMessageDone(msg13))) then
	
		Damage(Mission.alpha1,5000)
		Mission.alpha1die = true
	end

	--checking to see when alpha wing gets whacked
	if ((not Mission.alphadead) and (Mission.vo13) and (not IsAround(Mission.alpha1) and (not IsAround(Mission.alpha2)))) then
	
		Mission.vo14time = (GetTime() + 6)
		Patrol(Mission.misl1,"misl1_patrol")
		Patrol(Mission.misl2,"misl2_patrol")
		Mission.alphadead = true
	end

	--this is for if alpha wing doesn't get whacked by the AI...I whack them then
	if ((not Mission.kill_alpha) and (not Mission.alphadead) and (Mission.kill_alphatime < GetTime())) then
	
		if (IsAround(Mission.alpha1)) then
		
			Damage(Mission.alpha1,5000)
		end

		if (IsAround(Mission.alpha2)) then
		
			Damage(Mission.alpha2,5000)
		end

		Mission.kill_alpha = true
	end

	if ((not Mission.vo14) and (Mission.vo14time < GetTime())) then
	
		msg14 = AudioMessage("scion0314.wav") -- scion0314.wav SHAB -We've lost contact with Alpha Wing.  Luckily, we were able to get the coordinates
		Mission.vo14 = true
	end


	if (not Mission.obj1) then
	
		--if the Mission.player goes too far from the base and tries to help alpha wing then

		if ((not Mission.playertoofar) and (GetDistance(Mission.player,"playerbase") > 500)) then
		
			AudioMessage("scion0315.wav") -- scion0315.wav Cooke, where are you going?  You must stay at the base, I can't defend it by myself
			Mission.playertoofar = true
		end
	end


	--------
	if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
	
		Mission.msg1 = AudioMessage("scion0301.wav") --I'm giving you the coordinates of the base. First, focus on destroying the base's defenses.  Then when you are able, move in with a Hauler and bring the Mission.power crystal back to your base.  Expect VERY heavy resistance, the ISDF will do whatever they can to keep us from the Mission.power crystal. Those two Scions died for this mission, Cooke.  If you fail, their deaths will be in vain.
		Mission.vo1 = true
	end

	if ((not Mission.obj1) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
	
		ClearObjectives()
		AddObjective("scion0301.otf", "WHITE")
		Mission.nav1 = BuildObject("ibnav",1,"nav1")
		SetObjectiveOn(Mission.nav1)
		tempstr = TranslateString("MissionS0301")  -- Convoy
		SetObjectiveName(Mission.nav1,tempstr)
		SetObjectiveOn(Mission.power)
		tempstr = TranslateString("MissionS0302")  -- Convoy
		SetObjectiveName(Mission.power,tempstr)
		Mission.obj1 = true
	end

	if ((not Mission.powergotten) and (GetTug(Mission.power))) then
	
		AudioMessage("scion0302.wav") --Good Cook, you've got it.  Bring it back to base, hurrynot 
		SetObjectiveOff(Mission.nav1)
		
		--if any rocket tanks are still alive now is the time they will attack the tug then
		if ((IsAlive(Mission.ivrckt1) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt1,Mission.hauler)
		end

		if ((IsAlive(Mission.ivrckt2) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt2,Mission.hauler)
		end

		if ((IsAlive(Mission.ivrckt3) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt3,Mission.hauler)
		end

		if ((IsAlive(Mission.ivrckt4) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt4,Mission.hauler)
		end

		if ((IsAlive(Mission.ivrckt5) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt5,Mission.hauler)
		end

		if ((IsAlive(Mission.ivrckt6) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt6,Mission.hauler)
		end

		if ((IsAlive(Mission.ivrckt7) and (IsAlive(Mission.hauler)))) then
		
			Attack(Mission.ivrckt7,Mission.hauler)
		end

		
		Mission.powergotten = true
	end


--mission lost if powersource ever gets destroyed then
	if ((not Mission.powerdead) and (not IsAround(Mission.power))) then
	
		Mission.vo5time = (GetTime() + 4)
		Mission.powerdead = true
	end

	if ((not Mission.vo5) and (Mission.vo5time < GetTime())) then
	
		AudioMessage("scion0305.wav") -- Burns "Without that Mission.power crystal my plans for the scions are ruined...
		FailMission(GetTime() + 20,"scion03L2.txt")
		ClearObjectives()
		AddObjective("scion0302.otf", "WHITE")	
		Mission.vo5 = true
	end
--when Mission.player takes out the enemy reclycler
	if ((not Mission.enemyrecydead) and (not IsAround(Mission.recy1))) then
	
		Mission.vo3time = (GetTime() + 5)
		Mission.enemyrecydead = true
	end
	
	if ((not Mission.vo3) and (Mission.vo3time < GetTime())) then
	
		Mission.wavesover = true
		AudioMessage("scion0303.wav") --You've taken out the enemy's recycler, nice worknot 
		Mission.vo3 = true
	end

--when Mission.power is near Mission.player base, mission accomplished
	if ((not Mission.powerhome) and (GetDistance(Mission.power,Mission.playersrecy) < 150)) then
	
		Mission.msg4 = AudioMessage("scion0304.wav")--All is going according to plan.  Thank you, John.  You're a worthy protege. 
		Mission.powerhome = true
	end

	if ((not Mission.obj3) and (Mission.powerhome) and (IsAudioMessageDone(Mission.msg4))) then
	
		ClearObjectives()
		AddObjective("scion0303.otf", "WHITE")	
		SucceedMission(GetTime() + 12,"scion03w1.txt")
		Mission.obj3 = true
	end

	------/helping out the AIP

	if ((not checktank1alive) and (IsAlive(Mission.aitank1)))	 then
	
		Mission.aitank1_movetime = (GetTime() + 2)
		Mission.tank1alive = true
		checktank1alive = true
		Mission.checktank1dead = false
		Mission.tank1go = false
	end

	if ((not Mission.checktank1dead) and (not IsAlive(Mission.aitank1))) then
	
		Mission.tank1alive = false
		checktank1alive = false
		Mission.checktank1dead = true
	end

	if ((not Mission.tank1go) and (Mission.aitank1_movetime < GetTime())) then
	
		Goto(Mission.aitank1,"scout1point")
		Mission.tank1go = true
	end
--------------
	if ((not Mission.checktank2alive) and (IsAlive(Mission.aitank2)))	 then
	
		Mission.aitank2_movetime = (GetTime() + 2)
		Mission.tank2alive = true
		Mission.checktank2alive = true
		Mission.checktank2dead = false
		Mission.tank2go = false
	end

	if ((not Mission.checktank2dead) and (not IsAlive(Mission.aitank2))) then
	
		Mission.tank2alive = false
		Mission.checktank2alive = false
		Mission.checktank2dead = true
	end

	if ((not Mission.tank2go) and (Mission.aitank2_movetime < GetTime())) then
	
		Goto(Mission.aitank2,"scout2point")
		Mission.tank2go = true
	end
--------------
	if ((not Mission.checktank3alive) and (IsAlive(Mission.aitank3)))	 then
	
		Mission.aitank3_movetime = (GetTime() + 2)
		Mission.tank3alive = true
		Mission.checktank3alive = true
		Mission.checktank3dead = false
		Mission.tank3go = false
	end

	if ((not Mission.checktank3dead) and (not IsAlive(Mission.aitank3))) then
	
		Mission.tank3alive = false
		Mission.checktank3alive = false
		Mission.checktank3dead = true
	end

	if ((not Mission.tank3go) and (Mission.aitank3_movetime < GetTime())) then
	
		Goto(Mission.aitank3,"scout3point")
		Mission.tank3go = true
	end
--------------
	--if the Mission.player's recycler is ever destroyed then --MISSION FAILED then
	if ((not Mission.playersrecy_dead) and (not IsAround(Mission.playersrecy))) then
	
		Mission.vo_recydeadtime = (GetTime() + 3)
		Mission.playersrecy_dead = true
	end

	if ((not Mission.vo_recydead) and (Mission.vo_recydeadtime < GetTime())) then
	
		Mission.vofail1 = AudioMessage("scion0399.wav") 	--Dammit cooke, the recycler has been destroyed
		Mission.vo_recydead = true
	end

	if ((not Mission.obj5) and (Mission.vo_recydead) and (IsAudioMessageDone(Mission.vofail1))) then
	
		ClearObjectives()
		AddObjective("scion0305.otf", "WHITE")
		FailMission(GetTime() + 6,"scion03L3.txt")
		Mission.obj5 = true
	end

--****WAVES****--
	if (not Mission.wavesover) then
	
		if ((not Mission.wave1) and (Mission.wave1time < GetTime())) then
		
			Mission.spawner1a = BuildObject("ivscout",3,"spawn1")
			Mission.spawner1b = BuildObject("ivscout",3,"spawn2")
			SetSkill(Mission.spawner1a,2)
			SetSkill(Mission.spawner1b,1)
			Goto(Mission.spawner1a,"playerbase")
			Goto(Mission.spawner1b,"playerbase")
			Mission.wave2time = (GetTime() + 120)
			Mission.wave1 = true
		end

		if ((not Mission.wave2) and (Mission.wave2time < GetTime())) then
		
			Mission.spawner2a = BuildObject("ivscout",3,"spawn3")
			Mission.spawner2b = BuildObject("ivscout",3,"spawn4")
			SetSkill(Mission.spawner2a,2)
			SetSkill(Mission.spawner2b,1)
			Goto(Mission.spawner2a,"playerbase")
			Goto(Mission.spawner2b,"playerbase")
			Mission.wave3time = (GetTime() + 120)
			Mission.wave2 = true
		end
   
		--/this is to make sure the "alpha-death" sequence is not delayed
		if (not Mission.insurance1) then
		
			if (IsAround(Mission.spawner2a)) then
			
				if ((not Mission.spawner2atoofar) and (GetDistance(Mission.spawner2a,Mission.player) > 130)) then
				
					Goto(Mission.spawner2a,Mission.player)
					Mission.spawner2atoofar = true
				end

				if ((Mission.spawner2atoofar) and (GetDistance(Mission.spawner2a,Mission.player) < 75)) then
						
					Mission.spawner2atoofar = false
				end
			end
		
			if (IsAround(Mission.spawner2b)) then
			
				if ((not Mission.spawner2btoofar) and (GetDistance(Mission.spawner2b,Mission.player) > 130)) then
				
					Goto(Mission.spawner2b,Mission.player)
					Mission.spawner2btoofar = true
				end

				if ((Mission.spawner2btoofar) and (GetDistance(Mission.spawner2b,Mission.player) < 75)) then
						
					Mission.spawner2btoofar = false
				end
			end
		end
		--this is to make sure the script is not delayed on the first WAVE3
		if (not Mission.insurance2) then
		
			if (IsAround(Mission.spawner3a)) then
			
				if ((not Mission.spawner3atoofar) and (GetDistance(Mission.spawner3a,Mission.player) > 130)) then
				
					Goto(Mission.spawner3a,Mission.player)
					Mission.spawner3atoofar = true
				end

				if ((Mission.spawner3atoofar) and (GetDistance(Mission.spawner3a,Mission.player) < 75)) then
						
					Mission.spawner3atoofar = false
				end
			end
		
			if (IsAround(Mission.spawner3b)) then
			
				if ((not Mission.spawner3btoofar) and (GetDistance(Mission.spawner3b,Mission.player) > 130)) then
				
					Goto(Mission.spawner3b,Mission.player)
					Mission.spawner3btoofar = true
				end

				if ((Mission.spawner3btoofar) and (GetDistance(Mission.spawner3b,Mission.player) < 75)) then
						
					Mission.spawner3btoofar = false
				end
			end
		end

		if ((not Mission.wave3) and (Mission.wave3time < GetTime())) then
		
			Mission.spawner3a = BuildObject("ivscout",3,"spawn1")
			Mission.spawner3b = BuildObject("ivmbike",3,"spawn4")
			SetSkill(Mission.spawner3a,1)
			SetSkill(Mission.spawner3b,1)
			Goto(Mission.spawner3a,"playerbase")
			Goto(Mission.spawner3b,"playerbase")
			Mission.wave4time = (GetTime() + 120)
			Mission.wave3 = true
		end

		if ((not Mission.wave4) and (Mission.wave4time < GetTime())) then
		
			Mission.spawner4a = BuildObject("ivtank",3,"spawn1")
			Mission.spawner4c = BuildObject("ivtank",3,"spawn3")
			SetSkill(Mission.spawner4a,1)
			SetSkill(Mission.spawner4c,2)
			Goto(Mission.spawner4a,"playerbase")
			Goto(Mission.spawner4c,"playerbase")
			Mission.wave5time = (GetTime() + 130)
			Mission.wave4 = true
		end

		if ((not Mission.wave5) and (Mission.wave5time < GetTime())) then
		
			Mission.spawner5a = BuildObject("ivmbike",3,"spawn1")
			Mission.spawner5c = BuildObject("ivtank",3,"spawn2")
			SetSkill(Mission.spawner5a,1)
			SetSkill(Mission.spawner5c,2)
			Goto(Mission.spawner5a,"playerbase")
			Goto(Mission.spawner5c,"playerbase")
			Mission.wave6time = (GetTime() + 120)
			Mission.wave5 = true
		end

		if ((not Mission.wave6) and (Mission.wave5time < GetTime())) then
		
			Mission.spawner6a = BuildObject("ivmbike",3,"spawn4")
			Mission.spawner6b = BuildObject("ivrckt",3,"spawn3")
			SetSkill(Mission.spawner6a,1)
			SetSkill(Mission.spawner6b,2)
			Goto(Mission.spawner6a,"playerbase")
			Goto(Mission.spawner6b,"playerbase")
			Mission.wave6 = true
		end

		if ((Mission.wave1) and (Mission.wave2) and (Mission.wave3) and (Mission.wave4) and (Mission.wave5) and (Mission.wave6)) then
		
			Mission.wave1time = (GetTime() + 165)
			Mission.wave2time = (GetTime() + 999999.9)
			Mission.wave3time = (GetTime() + 999999.9)
			Mission.wave4time = (GetTime() + 999999.9)
			Mission.wave5time = (GetTime() + 999999.9)
			Mission.wave6time = (GetTime() + 999999.9)
			Mission.wave1 = false
			Mission.wave2 = false
			Mission.wave3 = false
			Mission.wave4 = false
			Mission.wave5 = false
			Mission.wave6 = false
		end
	end

	--checking to see when/if Mission.player takes the enemy scav near his base then
	if (not Mission.enemyrecydead) then
	
		if ((not Mission.player_took_scav) and ((not IsAround(Mission.isdf_scav1)))) then
		
			Mission.scav_attacktime = (GetTime() + 120)
			Mission.player_took_scav = true
		end
		--sending a tank to attack the location after Mission.player has killed scav
		if ((not Mission.scav_attack) and (Mission.player_took_scav) and (Mission.scav_attacktime < GetTime())) then
		
			Mission.scav_attacker = BuildObject("ivtank",3,"enemybase")
			SetSkill(Mission.scav_attacker,2)
			SetAvoidType(Mission.scav_attacker,0)
			Goto(Mission.scav_attacker,"scav1")
			Mission.scav_attacker_dead = false
			Mission.scav_attack = true
		end

		if ((not Mission.scav_attacker_dead) and (Mission.scav_attack) and (not IsAround(Mission.scav_attacker))) then
		
			Mission.scav_attacktime = (GetTime() + 120)
			Mission.scav_attack = false
			Mission.scav_attacker_dead = true
		end
	end
end