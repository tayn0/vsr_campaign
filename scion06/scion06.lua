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
	powerout = false,
	escort1arahead,
	vo1 = false,
	vo2 = false,
	obj1 = false,
	base_repaired = false,
	obj2 = false,
	vo3 = false,
	repairs_started = false,
	vo4 = false,
	spawn1 = false,
	spawn2 = false,
	spawn3 = false,
	spawn4 = false,
	spawn5 = false,	
	spawn6 = false,	
	spawn7 = false,	
	spawn8 = false,	
	spawn9 = false,	
	spawn10 = false,	
	vo14 = false,
	repairtakingtoolong = false,
	basekilled = false,
	vo6 = false,
	vo7 = false,
	obj3 = false,
	convoymove = false,
	convoy_enroute = false,
	convoykilled = false,
	convoyattack = false,
	tugretreat = false,
	vo9 = false,
	obj4 = false,
	escortsdead = false,
	tugdead = false,
	tugdead_escortsalive = false,
	escortsdead_tugalive = false,
	vo10 = false,
	vo11 = false,
	convoy_dead = false,
	vo12 = false,
	obj5 = false,
	powerdead = false,
	vo13 = false,
	obj6 = false,
	convoy1toofar = false,
	convoy2toofar = false,
	convoy3toofar = false,
	convoy4toofar = false,
	convoy1close = false,
	convoy2close = false,
	convoy3close = false,
	convoy4close = false,
	escort1close,
	checkturret1alive = false,
	turret1alive = false,
	checkturret1dead = false,
	turret1go = false,
	checkbasetank1alive = false,
	basetank1alive = false,
	checkbasetank1dead = false,
	basetank1go = false,
	checkbasetank2alive = false,
	basetank2alive = false,
	checkbasetank2dead = false,
	basetank2go = false,
	checkbasetank3alive = false,
	basetank3alive = false,
	checkbasetank3dead = false,
	basetank3go = false,
	factkilled = false,
	pgen1killed = false,
	pgen2killed = false,
	obj7 = false,
	vo15 = false,
	obj7b = false,
	vo15b = false,
	obj7c = false,
	wavesover = false,
	playersrecy_dead = false,
	vo_recydead = false,
	obj8 = false,
	repairtakingtoolong2 = false,
	repairs_took_forever = false,
	checkass1alive = false,
	ass1alive = false,
	checkass1dead = false,
	ass1go = false,
	checkass2alive = false,
	ass2alive = false,
	checkass2dead = false,
	ass2go = false,
	vo1a = false,
	bomb_dropped = false,
--  floats
	vo1time = 999999.9,
	vo2time = 999999.9,
	vo3time = 999999.9,
	vo6time = 999999.9,
	vo7time = 999999.9,
	spawn1time = 999999.9,	
	spawn2time = 999999.9,	
	spawn3time = 999999.9,	
	spawn4time = 999999.9,
	spawn5time = 999999.9,
	spawn6time = 999999.9,
	spawn7time = 999999.9,
	spawn8time = 999999.9,
	spawn9time = 999999.9,
	spawn10time = 999999.9,
	repairtime = 999999.9,	
	convoymovetime = 999999.9,		
	tugretreattime = 999999.9,
	vo9time = 999999.9,
	vo10time = 999999.9,
	vo11time = 999999.9,
	vo12time = 999999.9,
	vo13time = 999999.9,
	turret1movetime = 999999.9,
	basetank1movetime = 999999.9,
	basetank2movetime = 999999.9,
	basetank3movetime = 999999.9,
	vo14time = 999999.9,
	vo15time = 999999.9,
	vo15btime = 999999.9,
	vo_recydeadtime = 999999.9,
	repeat_spawntime = 999999.9,
	vo16time = 999999.9,
	vo17time = 999999.9,
	ass1movetime = 999999.9,
	ass2movetime = 999999.9,
	swap_aiptime = 999999.9,
--  handles
	enemyrecy,
	enemyfact,
	playersrecy,
	pgen1,
	pgen2,
	power,
	convoy_tug1,
	convoy_scout1,
	convoy_scout2,
	convoy_sent1,
	convoy_sent2,
	playersfact,
	playerspgen1,
	playerspgen2,
	spawner7b,
	msg15b,
	player,
	msg1,
	msg2,
	msg3,
	msg7,
	msg8,
	msg9,
	msg12,
	msg13,
	spawner1a =  nil,
	spawner1b,
	spawner2a,
	spawner2b,
	spawner3a,
	spawner3b,
	spawner4a,
	spawner4b,
	spawner5a,
	spawner5b,
	spawner6a,
	spawner6b,
	msg14,
	msg15,
	turret1,
	basetank1,
	basetank2,
	basetank3,
	spawner7a,
	spawner8a,
	spawner8b,
	spawner8c,
	spawner9a,
	spawner9b,
	spawner9c,
	spawner10a,
	spawner10b,
	spawner10c,
	spawner1c,
	spawner1d,
	spawner2c,
	spawner2d,
	spawner3c,
	spawner3d,
	spawner4c,
	spawner4d,
	spawner5c,
	spawner5d,
	spawner6c,
	spawner6d,
	spawner7c,
	spawner7d,
	spawner8d,
	spawner9d,
	spawner10d,
	vofail1,
	pete,
	repeat_handle,
	nav1,
	msg17,
	ass1,
	ass2,
	repeat2,
	msg1a,

   
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
	Mission.enemyrecy = GetHandle("enemyrecy")
	Mission.enemyfact = GetHandle("enemyfact")
	Mission.playersrecy = GetHandle("playersrecy")
	Mission.pgen1 = GetHandle("pgen1")
	Mission.pgen2 = GetHandle("pgen2")
	Mission.power = GetHandle("power")
	Mission.convoy_tug1 = GetHandle("convoy_tug1")
	Mission.convoy_scout1 = GetHandle("convoy_scout1")
	Mission.convoy_scout2 = GetHandle("convoy_scout2")
	Mission.convoy_sent1 = GetHandle("convoy_sent1")
	Mission.convoy_sent2 = GetHandle("convoy_sent2")
	Mission.playersfact = GetHandle("playersfact")
	Mission.playerspgen1 = GetHandle("playerspgen1")
	Mission.playerspgen2 = GetHandle("playerspgen2")
	Mission.spawner7b = nil
	Mission.msg15b = nil
	Mission.player = nil
	Mission.msg1 = nil
	Mission.msg2 = nil
	Mission.msg3 = nil
	Mission.msg7 = nil
	Mission.msg8 = nil
	Mission.msg9 = nil
	Mission.msg12 = nil
	Mission.msg13 = nil
	Mission.spawner1a =  nil
	Mission.spawner1b = nil
	Mission.spawner2a = nil
	Mission.spawner2b = nil
	Mission.spawner3a = nil
	Mission.spawner3b = nil
	Mission.spawner4a = nil
	Mission.spawner4b = nil
	Mission.spawner5a = nil
	Mission.spawner5b = nil
	Mission.spawner6a = nil
	Mission.spawner6b = nil
	Mission.msg14 = nil
	Mission.msg15 = nil
	Mission.turret1 = nil
	Mission.basetank1 = nil
	Mission.basetank2 = nil
	Mission.basetank3 = nil
	Mission.spawner7a = nil
	Mission.spawner8a = nil
	Mission.spawner8b = nil
	Mission.spawner8c = nil
	Mission.spawner9a = nil
	Mission.spawner9b = nil
	Mission.spawner9c = nil
	Mission.spawner10a = nil
	Mission.spawner10b = nil
	Mission.spawner10c = nil
	Mission.spawner1c = nil
	Mission.spawner1d = nil
	Mission.spawner2c = nil
	Mission.spawner2d = nil
	Mission.spawner3c = nil
	Mission.spawner3d = nil
	Mission.spawner4c = nil
	Mission.spawner4d = nil
	Mission.spawner5c = nil
	Mission.spawner5d = nil
	Mission.spawner6c = nil
	Mission.spawner6d = nil
	Mission.spawner7c = nil
	Mission.spawner7d = nil

	Mission.spawner8d = nil

	Mission.spawner9d = nil

	Mission.spawner10d = nil

	Mission.vofail1 = nil
	Mission.pete = nil
	Mission.repeat_handle = nil
	Mission.nav1 = nil
	Mission.msg17 = nil
	Mission.ass1 = nil
	Mission.ass2 = nil
	Mission.repeat2 = nil
	Mission.msg1a = nil
	
--  integers
	SetTeamColor(2,0,127,255)  --BRADDOCK	
	SetTeamColor(3,85,255,85) --REBELS
	SetTeamColor(4,0,127,255)  --BRADDOCK	
	
	Mission.playersrecy = UnitToVSR(Mission.playersrecy, "ibrecy_vsr", 0)
	Mission.playersfact = UnitToVSR(Mission.playersfact, "ibfact_vsr", 0)
	
	Mission.enemyrecy = UnitToVSR(Mission.enemyrecy, "ibrecy_vsr", 0)
	Mission.enemyfact = UnitToVSR(Mission.enemyfact, "ibfact_vsr", 0)
	
	Mission.player = GetPlayerHandle()
	Mission.player = UnitToVSR(Mission.player, "fvsent_vsr", 1)
	
	Mission.cons = UnitToVSR(GetHandle("unnamed_ivcons"), "ivcons_vsr", 0)
	SetGroup(Mission.cons, 0)
	
	UnitToVSR(GetHandle("unnamed_ibsbay"), "ibsbay_vsr", 0)
	UnitToVSR(GetHandle("unnamed_ibarmo"), "ibarmo_vsr", 0)

	Mission.convoy_scout1 = UnitToVSR(Mission.convoy_scout1, "fvscout_vsr", 0)
	Mission.convoy_scout2 = UnitToVSR(Mission.convoy_scout2, "fvtank_vsr", 0)
	
	Mission.convoy_sent1 = UnitToVSR(Mission.convoy_sent1, "fvtank_vsr", 0)
	Mission.convoy_sent2 = UnitToVSR(Mission.convoy_sent2, "fvtank_vsr", 0)

	
	
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

	if label ~= nil then
		SetLabel(h, label)
	end

	return h

end

function AddObject(h) --This function is called when an object appears in the game. --



	if (Mission.missionstart) then
	
		if ((IsOdf(h,"apwrck") and (GetTeamNum(h) == 2))) then
		
			Mission.bomb_dropped = true
		end
		

		if ((Mission.turret1 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,Mission.enemyrecy) < 50) 
		and (IsOdf(h,"ivturr_vsr"))) then
		
			Mission.turret1 = h
		end
	
		if ((Mission.basetank1 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,Mission.enemyfact) < 50) 
		and (IsOdf(h,"ivtank_vsr"))) then
		
			Mission.basetank1 = h
		

		elseif ((Mission.basetank2 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,Mission.enemyfact) < 50) 
		and (IsOdf(h,"ivtank_vsr"))) then
		
			Mission.basetank2 = h
		

		elseif ((Mission.basetank3 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,Mission.enemyfact) < 50) 
		and (IsOdf(h,"ivtank_vsr"))) then
		
			Mission.basetank3 = h
		

		elseif ((Mission.ass1 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,Mission.enemyfact) < 50) 
		and (IsOdf(h,"ivatank_vsr"))) then
		
			Mission.ass1 = h
		

		elseif ((Mission.ass2 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,Mission.enemyfact) < 50) 
		and (IsOdf(h,"ivatank_vsr"))) then
		
			Mission.ass2 = h
		end
	end
	
	if IsOdf(h, "ibgtow") then
		h = UnitToVSR(h, "ibgtow_vsr", 0)
	end
	
	if IsOdf(h, "ibpgen") and GetTeamNum(h) == 2 then
		h = UnitToVSR(h, "ibpgen_vsr", 0)
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
	Mission.player = (GetPlayerHandle())


	if (not Mission.missionstart) then
	
		SetScrap(1,40)
		Mission.vo1time = (GetTime() + 3)
		Pickup(Mission.convoy_tug1,Mission.power)
		Ally(2,3)  
		Ally(2,4)
		Ally(3,4)
		SetAIP("scion0601.aip",2) 
		SetMaxHealth(Mission.power,10000)
		SetCurHealth(Mission.power,10000)

		SetMaxHealth(Mission.playersfact,6000)
		SetCurHealth(Mission.playersfact,2200)

		SetMaxHealth(Mission.playerspgen1,3000)
		SetCurHealth(Mission.playerspgen1,1500)
		
		SetMaxHealth(Mission.playerspgen2,3000)
		SetCurHealth(Mission.playerspgen2,1800)

	--	SetObjectiveOn(Mission.enemyrecy)
	--	SetObjectiveName(Mission.enemyrecy,"Enemy")
		Mission.missionstart = true
	end

	--controlling bomber AI
	if (Mission.bomb_dropped) then
	
		Mission.swap_aiptime = (GetTime() + 120) --250
		Mission.bomb_dropped = false
	end

	if (Mission.swap_aiptime < GetTime()) then
	
		SetAIP("scion0601.aip",2) 
		Mission.swap_aiptime = (GetTime() + 999999.9)
	end

	if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
	
		Mission.msg1 = AudioMessage("scion0601.wav") --scion0601.wav First we must work on getting this base in shape...
		Mission.vo1 = true
	end

	if ((not Mission.vo1a) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
	
		Mission.msg1a = AudioMessage("scion0601a.wav") --build a service truck and fix the factory and Mission.power generators.
		Mission.vo1a = true
	end

	if ((not Mission.obj1) and (Mission.vo1a) and (IsAudioMessageDone(Mission.msg1a))) then
	
		ClearObjectives()
		AddObjective("scion0601.otf", "WHITE")--/Make base repairsnot 
		Mission.repairtime = (GetTime() + 550)  --the time for first warning of repairs taking too long
		Mission.spawn1time = (GetTime() + 65)
		Mission.obj1 = true
	end

--1st WAVE
	if ((not Mission.spawn1) and (Mission.spawn1time < GetTime())) then
	
		Mission.spawner1a = BuildObject("ivscout_vsr",4,"spawn1a")	
		Mission.spawner1b = BuildObject("ivscout_vsr",4,"spawn2b")	
		SetSkill(Mission.spawner1a,1)
		SetSkill(Mission.spawner1b,2)
		Goto(Mission.spawner1a,"playerbase")
		Goto(Mission.spawner1b,"playerbase")
		Mission.spawn2time = (GetTime() +160)
		Mission.spawn1 = true
	end
------/
--/checking to see when Mission.player has started the base repairs

	if (not Mission.repairs_started) then
	
		if ((IsAround(Mission.playersfact)) and (GetCurHealth(Mission.playersfact) > 2250)) then
		
			AudioMessage("scion0602.wav") -- scion0602.wav Good.  Continue to build up your forces while waiting for the repairs.
			Mission.repairs_started = true
		end

		if ((IsAround(Mission.playerspgen1)) and (GetCurHealth(Mission.playerspgen1) > 1550)) then
		
			AudioMessage("scion0602.wav") -- scion0602.wav Good.  Continue to build up your forces while waiting for the repairs.
			Mission.spawn2time = (GetTime() +25)
			Mission.repairs_started = true
		end

		if ((IsAround(Mission.playerspgen2)) and (GetCurHealth(Mission.playerspgen2) > 1850)) then
		
			AudioMessage("scion0602.wav") -- scion0602.wav Good.  Continue to build up your forces while waiting for the repairs.
			Mission.spawn2time = (GetTime() +25)
			Mission.repairs_started = true
		end

	end

	----Checking to see when the repairs are complete
	if ((not Mission.base_repaired) and (Mission.obj1) and (GetCurHealth(Mission.playersfact) > 5900) and
		(GetCurHealth(Mission.playerspgen1) > 2900) and (GetCurHealth(Mission.playerspgen2) > 2900)) then
	
		Mission.vo3time = (GetTime() + 2)
		Mission.base_repaired = true
	end

	--if the repairs seem to be taking too long then
	if (not Mission.base_repaired) then
	
		if ((not Mission.repairtakingtoolong) and (not Mission.base_repaired) and (Mission.repairtime < GetTime())) then
		
			AudioMessage("scion0605.wav") --scion0605.wav Those repairs should have been finished by now,  What's going on? 
			Mission.vo16time = (GetTime() + 90) --next warning time
			Mission.repairtakingtoolong = true
		end
			--next warning if repairs are still not complete then
		if ((not Mission.repairtakingtoolong2) and (not Mission.base_repaired) and (Mission.vo16time < GetTime())) then
		
			AudioMessage("scion0616.wav") -- The base STILL is not fully repaired
			Mission.vo17time = (GetTime() + 90)--next warning time (fail mission)
			Mission.repairtakingtoolong2 = true
		end

		if ((not repairtakingtoolong3) and (not Mission.base_repaired) and (Mission.vo17time < GetTime())) then
		
			Mission.msg17 = AudioMessage("scion0617.wav") --That's it... I'm pissed now, mission over
			repairtakingtoolong3 = true
		end

		if ((not Mission.repairs_took_forever) and (repairtakingtoolong3) and (IsAudioMessageDone(Mission.msg17))) then
		
			ClearObjectives()
			AddObjective("scion0607.otf", "WHITE")		
			FailMission(GetTime() + 6,"scion06L1.txt")
			Mission.repairs_took_forever = true
		end
	end

	--2nd WAVE
	if ((not Mission.spawn2) and (Mission.spawn2time < GetTime())) then
	
		Mission.spawner2a = BuildObject("ivtank_vsr",4,"spawn2a") 
		SetSkill(Mission.spawner2a,1)
		Goto(Mission.spawner2a,"playerbase")
		Mission.spawn3time = (GetTime() + 140)
		Mission.spawn2 = true	
	end
	--/


	--If the factory or the Mission.power gens get destroyed before the repairs are complete,
	--the mission is failed
	if (not Mission.base_repaired) then
	
		if ((not Mission.factkilled) and (not IsAround(Mission.playersfact))) then
		
			Mission.vo14time = (GetTime() + 3)
			Mission.factkilled = true
		end

		if ((not vo14) and (Mission.vo14time < GetTime())) then
		
			Mission.msg14 = AudioMessage("scion0614.wav") -- scion0614.wav John, the factory has been destroyed…that was a loss we can't afford, this mission is scrubbed.   
			vo14 = true
		end

		if ((not Mission.obj7) and (vo14) and (IsAudioMessageDone(Mission.msg14))) then
		
			ClearObjectives()
			AddObjective("scion0607.otf", "WHITE") -- Mission Failed.
			FailMission(GetTime() + 5,"scion06L2.txt")
			Mission.obj7 = true
		end
	--****--
		if ((not Mission.pgen1killed) and (not IsAround(Mission.playerspgen1))) then
		
			Mission.vo15time = (GetTime() + 3)
			Mission.pgen1killed = true
		end

		if ((not Mission.vo15) and (Mission.vo15time < GetTime())) then
		
			Mission.msg15 = AudioMessage("scion0615.wav") -- scion0615 John, you let a Power Generator get destroyed…You mustn't let anything happen to these buildings, this mission is scrubbed.  
			Mission.vo15 = true
		end

		if ((not Mission.obj7b) and (Mission.vo15) and (IsAudioMessageDone(Mission.msg15))) then
		
			ClearObjectives()
			AddObjective("scion0607.otf", "WHITE") -- Mission Failed.
			FailMission(GetTime() + 5,"scion06L2.txt")
			Mission.obj7b = true
		end
	--****--
		if ((not Mission.pgen2killed) and (not IsAround(Mission.playerspgen2))) then
		
			Mission.vo15btime = (GetTime() + 3)
			Mission.pgen2killed = true
		end

		if ((not Mission.vo15b) and (Mission.vo15btime < GetTime())) then
		
			Mission.msg15b = AudioMessage("scion0615.wav") -- scion0615 John, you let a Power Generator get destroyed…You mustn't let anything happen to these buildings, this mission is scrubbed.  
			Mission.vo15b = true
		end

		if ((not Mission.obj7c) and (Mission.vo15b) and (IsAudioMessageDone(Mission.msg15b))) then
		
			ClearObjectives()
			AddObjective("scion0607.otf", "WHITE") -- Mission Failed.
			FailMission(GetTime() + 5,"scion06L2.txt")
			Mission.obj7c = true
		end
	--****--
	end

	if (not Mission.wavesover) then
	
		--3rd WAVE
		if ((not Mission.spawn3) and (Mission.spawn3time < GetTime())) then
		
			Mission.spawner3a = BuildObject("ivtank_vsr",4,"spawn3a")
			Mission.spawner3b = BuildObject("ivscout_vsr",4,"spawn3b")
			SetSkill(Mission.spawner3a,1)
			SetSkill(Mission.spawner3b,1)
			Goto(Mission.spawner3a,"playerbase")
			Goto(Mission.spawner3b,"playerbase")
			Mission.spawn4time = (GetTime() + 40)
			Mission.spawn3 = true
		end

		--4th wave
		if ((not Mission.spawn4) and (Mission.spawn4time < GetTime())) then
		
			Mission.spawner4a = BuildObject("ivtank_vsr",4,"spawn1a")
			Mission.spawner4b = BuildObject("ivmbike_vsr",4,"spawn1b")
			SetSkill(Mission.spawner4a,1)
			SetSkill(Mission.spawner4b,1)
			Goto(Mission.spawner4a,"playerbase")
			Goto(Mission.spawner4b,"playerbase")
			Mission.spawn5time = (GetTime() + 90)
			Mission.spawn4 = true
		end

		--5th wave
		if ((not Mission.spawn5) and (Mission.spawn5time < GetTime())) then
		
			Mission.spawner5a = BuildObject("ivtank_vsr",4,"spawn3a")
			Mission.spawner5b = BuildObject("ivmbike_vsr",4,"spawn3b")
			Mission.spawner5c = BuildObject("ivtank_vsr",4,"spawn4a")

			SetSkill(Mission.spawner5a,1)
			SetSkill(Mission.spawner5b,1)
			SetSkill(Mission.spawner5c,1)
			Goto(Mission.spawner5a,"playerbase")
			Goto(Mission.spawner5b,"playerbase")
			Goto(Mission.spawner5c,"playerbase")
			Mission.spawn6time = (GetTime() + 100)
			Mission.spawn5 = true
		end

		--6th wave
		if ((not Mission.spawn6) and (Mission.spawn6time < GetTime())) then
		
			Mission.spawner6a = BuildObject("ivtank_vsr",4,"spawn4a")
			Mission.spawner6b = BuildObject("ivatank_vsr",4,"spawn3b")
			SetSkill(Mission.spawner6a,1)
			SetSkill(Mission.spawner6b,1)
			Goto(Mission.spawner6a,"playerbase")
			Goto(Mission.spawner6b,"playerbase")
			Mission.spawn7time = (GetTime() + 100)
			Mission.spawn6 = true
		end

		-- 7th wave
		if ((not Mission.spawn7) and (Mission.spawn7time < GetTime())) then
		
			Mission.spawner7a = BuildObject("ivatank_vsr",4,"spawn1a")
			Mission.spawner7b = BuildObject("ivatank_vsr",4,"spawn1b")
			Mission.spawner7c = BuildObject("ivatank_vsr",4,"spawn1b")
			SetSkill(Mission.spawner7a,1)
			SetSkill(Mission.spawner7b,1)
			SetSkill(Mission.spawner7c,2)
			Goto(Mission.spawner7a,"playerbase")
			Goto(Mission.spawner7b,"playerbase")
			Goto(Mission.spawner7c,"playerbase")
			Mission.spawn8time = (GetTime() + 120)
			Mission.spawn7 = true
		end

		-- 8th wave
		if ((not Mission.spawn8) and (Mission.spawn8time < GetTime())) then
		
			Mission.spawner8a = BuildObject("ivtank_vsr",4,"spawn1a")
			Mission.spawner8b = BuildObject("ivmbike_vsr",4,"spawn4a")
			Mission.spawner8c = BuildObject("ivmbike_vsr",4,"spawn4b")
			SetSkill(Mission.spawner8a,1)
			SetSkill(Mission.spawner8b,2)
			SetSkill(Mission.spawner8c,2)
			Goto(Mission.spawner8a,"playerbase")
			Goto(Mission.spawner8b,"playerbase")
			Goto(Mission.spawner8c,"playerbase")
			Mission.spawn9time = (GetTime() + 150)
			Mission.spawn8 = true
		end

		-- 9th wave
		if ((not Mission.spawn9) and (Mission.spawn9time < GetTime())) then
		
			Mission.spawner9a = BuildObject("ivatank_vsr",4,"spawn1a")
			Mission.spawner9b = BuildObject("ivatank_vsr",4,"spawn1b")
			Mission.spawner9c = BuildObject("ivmbike_vsr",4,"spawn3a")
			SetSkill(Mission.spawner9a,1)
			SetSkill(Mission.spawner9b,2)
			SetSkill(Mission.spawner9c,2)
			Goto(Mission.spawner9a,"playerbase")
			Goto(Mission.spawner9b,"playerbase")
			Goto(Mission.spawner9c,"playerbase")
			Mission.spawn10time = (GetTime() + 150)
			Mission.spawn9 = true
		end

		-- 10th wave
		if ((not Mission.spawn10) and (Mission.spawn10time < GetTime())) then
		
			Mission.spawner10a = BuildObject("ivatank_vsr",4,"spawn1a")
			Mission.spawner10b = BuildObject("ivtank_vsr",4,"spawn4a")
			Mission.spawner10c = BuildObject("ivtank_vsr",4,"spawn4b")
			SetSkill(Mission.spawner10a,1)
			SetSkill(Mission.spawner10b,2)
			SetSkill(Mission.spawner10c,1)
			Goto(Mission.spawner10a,"playerbase")
			Goto(Mission.spawner10b,"playerbase")
			Goto(Mission.spawner10c,"playerbase")
			Mission.repeat_spawntime = (GetTime() +150)
			Mission.spawn10 = true
			Mission.wavesover = true
		end
	end

	--when main waves are over i will keep sending a couple tanks every few min
	if (not Mission.basekilled) then
	
		if (Mission.repeat_spawntime < GetTime()) then
		
			Mission.pete = BuildObject("ivtank_vsr",4,"spawn2a")	
			Mission.repeat_handle = BuildObject("ivatank_vsr",4,"spawn1a")	
			Mission.repeat2 = BuildObject("ivatank_vsr",4,"spawn1b")	
			SetSkill(Mission.pete,1)
			SetSkill(Mission.repeat_handle,1)
			SetSkill(Mission.repeat2,1)
			Goto(Mission.pete,"playerbase")
			Goto(Mission.repeat_handle,"playerbase")
			Goto(Mission.repeat2,"playerbase")
			Mission.repeat_spawntime = (GetTime() + 180)
		end
	end

	----
	--SPAWNS OVER


	if ((not Mission.vo3) and (Mission.vo3time < GetTime())) then
	
		Mission.msg3 = AudioMessage("scion0603.wav") --/Scion0603.wav Ok the repairs are complete.  Now we should be in good shape for the base assault.  Continue to build your forces, and take out that basenot 	
		Mission.vo3 = true
	end


	if ((not Mission.obj2) and (Mission.vo3) and (IsAudioMessageDone(Mission.msg3))) then
	
		ClearObjectives()
		AddObjective("scion0602.otf", "WHITE")--/Destroy Braddock's Base
		Mission.nav1 = BuildObject("ibnav",1,"enemybase")
		SetObjectiveOn(Mission.nav1)
		tempstr = TranslateString("MissionS0601")  -- Braddock's Base		
		SetObjectiveName(Mission.nav1,tempstr)
		Mission.obj2 = true
	end

	--when Mission.player gets near enemy base
	if ((not Mission.vo4) and (Mission.obj2) and (GetDistance(Mission.player,"enemybase") < 220)) then
	
		AudioMessage("scion0604.wav") --Scion0604.wav Cook go for the Mission.power generators, that will buy you some time to take out those guntowers.
		Mission.vo4 = true
	end

---- When braddock's base is KILLED before the convoy gets there
	if ((not Mission.basekilled) and (Mission.obj2) and (not IsAround(Mission.enemyrecy))) then
	
		Mission.vo6time = (GetTime() + 4)
		Mission.wavesover = true
		Mission.basekilled = true
	end

	if ((not Mission.vo6) and (Mission.vo6time < GetTime())) then
	
		AudioMessage("scion0606.wav") --Scion0606.wav Good job, you've knocked the base out of commission.

		Mission.vo7time = (GetTime() + 8)
		Mission.vo6 = true
	end

	if ((not Mission.vo7) and (Mission.vo7time < GetTime())) then
	
		Mission.msg7 = AudioMessage("scion0607.wav") --/Scion0607.wav It looks like we took out that base just in time, we've just picked up the Evil Scion convoy on radar and they are nearing the basenot   Move as many forces to the destroyed base as you can, we must take out that convoy. Remember, do not damage the Mission.power source.  (SHAB)
		Mission.convoymovetime = (GetTime() + 1)
		Mission.vo7 = true
	end

	if ((not Mission.obj3) and (Mission.vo7) and (IsAudioMessageDone(Mission.msg7))) then
	
		ClearObjectives()
		AddObjective("scion0603.otf", "WHITE")--/Move forces to destroyed base, intercept Evil Scion convoy
		Mission.obj3 = true
	end

	if ((not Mission.convoymove) and (Mission.convoymovetime < GetTime())) then
	
		Retreat(Mission.convoy_scout1,"convoypath")
		Follow(Mission.convoy_scout2,Mission.convoy_scout1)
		Retreat(Mission.convoy_tug1,"convoypath")
		Follow(Mission.convoy_sent1,Mission.convoy_tug1)
		Follow(Mission.convoy_sent2,Mission.convoy_tug1)
		Mission.convoymove = true
	end

	if (not Mission.convoy_enroute) then
	
		if ((not Mission.escort1arahead) and (GetDistance(Mission.convoy_scout1,Mission.convoy_tug1) > 100)) then
		
			Stop(Mission.convoy_scout1)
			Stop(Mission.convoy_scout2)
			Mission.escort1close = false
			Mission.escort1arahead = true
		end

		if ((not Mission.escort1close) and (Mission.escort1arahead) and (GetDistance(Mission.convoy_scout1,Mission.convoy_tug1) < 90)) then
		
			Retreat(Mission.convoy_scout1,"convoypath")
			Follow(Mission.convoy_scout2,Mission.convoy_scout1)		
			Mission.escort1close = true
			Mission.escort1arahead = false
		end

	----When convoy meets Mission.player
		if ((GetDistance(Mission.player,Mission.convoy_scout1) < 200)) then
		
			Mission.msg8 = AudioMessage("scion0608.wav")  --scion0608.wav EVIL CONVOY:  Squad alpha here, we have the package…Hey wait a minute, those aren't Braddock's forcesnot   Destroy themnot 
			Mission.convoy_enroute = true
		end
	end

	if ((not Mission.convoyattack) and (Mission.convoy_enroute) and (IsAudioMessageDone(Mission.msg8))) then
	
		Attack(Mission.convoy_scout1,Mission.player)
		Mission.tugretreattime = (GetTime() + 15)
		Mission.convoyattack = true
	end

	if ((not Mission.tugretreat) and (IsAround(Mission.convoy_tug1) and (Mission.tugretreattime < GetTime()))) then
	
		Retreat(Mission.convoy_tug1,"tugretreatpath")
		Mission.vo9time = (GetTime() + 15)
		Mission.tugretreat = true
	end

	if ((not Mission.vo9) and (Mission.vo9time < GetTime())) then
	
		Mission.msg9 = AudioMessage("scion0609.wav") -- scion0609.wav Cook, the tug is retreating, do not let it get awaynot not 
		Mission.vo9 = true
	end

	if ((not Mission.obj4) and (Mission.vo9) and (IsAround(Mission.convoy_tug1) and (IsAudioMessageDone(Mission.msg9)))) then
	
		ClearObjectives()
		AddObjective("scion0604.otf", "WHITE") --  Do not let the Hauler escape	
		SetObjectiveOn(Mission.convoy_tug1)
		Mission.obj4 = true
	end

	--checking to see if escorts dead then
	if ((not Mission.escortsdead) and (Mission.convoymove) and (not IsAround(Mission.convoy_scout1) and (not IsAround(Mission.convoy_scout2)
		and (not IsAround(Mission.convoy_sent1) and (not IsAround(Mission.convoy_sent2)))))) then
	
		Mission.escortsdead = true
	end

	--checking to see if tug is killed then
	if ((not Mission.tugdead) and (Mission.convoymove) and (not IsAround(Mission.convoy_tug1))) then
	
		Mission.tugdead = true
	end

	--when tug is killed but escorts are still alive
	if ((not Mission.tugdead_escortsalive) and (Mission.tugdead) and (not Mission.escortsdead)) then
	
		Mission.vo10time = (GetTime() + 3)
		Mission.tugdead_escortsalive = true
	end

	if ((not Mission.vo10) and (Mission.vo10time < GetTime())) then
	
		AudioMessage("scion0610.wav") --scion0610 Great Cook, you got the haulernot   Now take care of the rest of the convoynot 
		Mission.vo10 = true
	end

	--when escorts are killed but tug is still alive
	if ((not Mission.escortsdead_tugalive) and (not Mission.tugdead) and (Mission.escortsdead)) then
	
		Mission.vo11time = (GetTime() + 3)
		Mission.escortsdead_tugalive = true	
	end

	if ((not Mission.vo11) and (Mission.vo11time < GetTime())) then
	
		AudioMessage("scion0611.wav") --scion0611 Great Cook, you got the escorts.  Now get that tugnot 
		Mission.vo11 = true	
	end
------------------
	--This is telling the escorts to GOTO the Mission.player if they get too far away from the Mission.player then
	if ((not Mission.convoy_dead) and (Mission.convoyattack)) then
	
		----CONVOY1
		if ((not Mission.convoy1toofar) and (Mission.convoyattack) and (IsAround(Mission.convoy_scout1) and
			(GetDistance(Mission.convoy_scout1,Mission.player) > 225))) then
		
			Goto(Mission.convoy_scout1,Mission.player)
			Mission.convoy1close = false
			Mission.convoy1toofar = true
		end

		if ((not Mission.convoy1close) and (Mission.convoyattack) and (IsAround(Mission.convoy_scout1) and
			(GetDistance(Mission.convoy_scout1,Mission.player) < 125))) then
		
			Mission.convoy1toofar = false
			Mission.convoy1close = true
		end

				----CONVOY2
		if ((not Mission.convoy2toofar) and (Mission.convoyattack) and (IsAround(Mission.convoy_scout2) and
			(GetDistance(Mission.convoy_scout2,Mission.player) > 225))) then
		
			Goto(Mission.convoy_scout2,Mission.player)
			Mission.convoy2close = false
			Mission.convoy2toofar = true
		end

		if ((not Mission.convoy2close) and (Mission.convoyattack) and (IsAround(Mission.convoy_scout2) and
			(GetDistance(Mission.convoy_scout2,Mission.player) < 125))) then
		
			Mission.convoy2toofar = false
			Mission.convoy2close = true
		end

				----CONVOY3
		if ((not Mission.convoy3toofar) and (Mission.convoyattack) and (IsAround(Mission.convoy_sent1) and
			(GetDistance(Mission.convoy_sent1,Mission.player) > 225))) then
		
			Goto(Mission.convoy_sent1,Mission.player)
			Mission.convoy3close = false
			Mission.convoy3toofar = true
		end

		if ((not Mission.convoy3close) and (Mission.convoyattack) and (IsAround(Mission.convoy_sent1) and
			(GetDistance(Mission.convoy_sent1,Mission.player) < 125))) then
		
			Mission.convoy3toofar = false
			Mission.convoy3close = true
		end

				----CONVOY4
		if ((not Mission.convoy4toofar) and (Mission.convoyattack) and (IsAround(Mission.convoy_sent2) and
			(GetDistance(Mission.convoy_sent2,Mission.player) > 225))) then
		
			Goto(Mission.convoy_sent2,Mission.player)
			Mission.convoy4close = false
			Mission.convoy4toofar = true
		end

		if ((not Mission.convoy4close) and (Mission.convoyattack) and (IsAround(Mission.convoy_sent2) and
			(GetDistance(Mission.convoy_sent2,Mission.player) < 125))) then
		
			Mission.convoy4toofar = false
			Mission.convoy4close = true
		end
------------------------/


		--WHEN Mission.player kills the entire convoy

		if ((not Mission.convoy_dead) and (Mission.convoymove) and (not IsAlive(Mission.convoy_scout1) and (not IsAlive(Mission.convoy_scout2) 
			and (not IsAlive(Mission.convoy_sent1) and (not IsAlive(Mission.convoy_sent2) and (not IsAlive(Mission.convoy_tug1))))))) then
		
			Mission.vo12time = (GetTime() + 4)
			Mission.convoy_dead = true
		end
	end

	if ((not Mission.vo12) and (Mission.vo12time < GetTime())) then
	
		Mission.msg12 = AudioMessage("scion0612.wav") --scion0612 Alright Cook, excellent job.  We will send out a tug and pick up that Mission.power source.  Mission Accomplished.
		Mission.vo12 = true
	end

	if ((not Mission.obj5) and (Mission.vo12) and (IsAudioMessageDone(Mission.msg12))) then
	
		ClearObjectives()
		AddObjective("scion0605.otf", "WHITE") --mission accomplished
		SucceedMission(GetTime() + 10,"scion06w1.txt")
		Mission.obj5 = true
	end

	--if powersource is destroyed, mission failed then
	if ((not Mission.powerdead) and (not IsAround(Mission.power))) then
	
		Mission.vo13time = (GetTime() + 3)
		Mission.powerdead = true
	end

	if ((not Mission.vo13) and (not Mission.obj5) and (Mission.vo13time < GetTime())) then
	
		Mission.msg13 = AudioMessage("scion0613.wav") --Dammit cook, the powersource has been destroyed
		Mission.vo13 = true
	end

	if ((not Mission.obj6) and (Mission.vo13) and (IsAudioMessageDone(Mission.msg13))) then
	
		ClearObjectives()
		AddObjective("scion0606.otf", "WHITE") --Mission Failed
		Mission.obj6 = true
	end

	------HELPING THE AIP

	--/TURRET 1
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
	
		Goto(Mission.turret1,"turret1")
		Mission.turret1go = true
	end

--/BASETANK1

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
	
		Patrol(Mission.basetank1,"basetank1")
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
	
		Patrol(Mission.basetank2,"basetank2")
		Mission.basetank2go = true
	end

--/BASETANK3
	if ((not Mission.checkbasetank3alive) and (IsAlive(Mission.basetank3)))	 then
	
		Mission.basetank3movetime = (GetTime() + 2)
		Mission.basetank3alive = true
		Mission.checkbasetank3alive = true
		Mission.checkbasetank3dead = false
		Mission.basetank3go = false
	end

	if ((not Mission.checkbasetank3dead) and (not IsAlive(Mission.basetank3))) then
	
		Mission.basetank3alive = false
		Mission.checkbasetank3alive = false
		Mission.checkbasetank3dead = true
	end

	if ((not Mission.basetank3go) and (Mission.basetank3alive) and (Mission.basetank3movetime < GetTime())) then
	
		Patrol(Mission.basetank3,"basetank3")
		Mission.basetank3go = true
	end

--/ASS1
	if ((not Mission.checkass1alive) and (IsAlive(Mission.ass1)))	 then
	
		Mission.ass1movetime = (GetTime() + 2)
		Mission.ass1alive = true
		Mission.checkass1alive = true
		Mission.checkass1dead = false
		Mission.ass1go = false
	end

	if ((not Mission.checkass1dead) and (not IsAlive(Mission.ass1))) then
	
		Mission.ass1alive = false
		Mission.ass1alive = false
		Mission.checkass1dead = true
	end

	if ((not Mission.ass1go) and (Mission.ass1alive) and (Mission.ass1movetime < GetTime())) then
	
		Goto(Mission.ass1,"ass1")
		Mission.ass1go = true
	end

--/ASS2
	if ((not Mission.checkass2alive) and (IsAlive(Mission.ass2)))	 then
	
		Mission.ass2movetime = (GetTime() + 2)
		Mission.ass2alive = true
		Mission.checkass2alive = true
		Mission.checkass2dead = false
		Mission.ass2go = false
	end

	if ((not Mission.checkass2dead) and (not IsAlive(Mission.ass2))) then
	
		Mission.ass2alive = false
		Mission.ass2alive = false
		Mission.checkass2dead = true
	end

	if ((not Mission.ass2go) and (Mission.ass2alive) and (Mission.ass2movetime < GetTime())) then
	
		Goto(Mission.ass2,"ass2")
		Mission.ass2go = true
	end

	--if the Mission.player's recycler is ever destroyed then --MISSION FAILED then
	if ((not Mission.playersrecy_dead) and (not IsAround(Mission.playersrecy))) then
	
		Mission.vo_recydeadtime = (GetTime() + 3)
		Mission.playersrecy_dead = true
	end

	if ((not Mission.vo_recydead) and (Mission.vo_recydeadtime < GetTime())) then
	
		Mission.vofail1 = AudioMessage("scion0699.wav") 	--Dammit cooke, the recycler has been destroyed
		Mission.vo_recydead = true
	end

	if ((not Mission.obj8) and (Mission.vo_recydead) and (IsAudioMessageDone(Mission.vofail1))) then
	
		ClearObjectives()
		AddObjective("scion0608.otf", "WHITE")
		FailMission(GetTime() + 6,"scion06L3.txt")
		Mission.obj8 = true
	end

end