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
	playeratcore = false,
	obj3 = false,
	playeratdropship = false,
	vo1 = false,
	vo2 = false,
	vo3 = false,
	obj1 = false,
	obj2 = false,
	obj4 = false,
	shielda_down = false,
	shieldb_down = false,
	shieldc_down = false,
	shieldd_down = false,
	shielde_down = false,
	shieldf_down = false,
	temp = false,
	collapse_1 = false,
	collapse_2 = false,
	collapse_3 = false,
	collapse_1a = false,
	collapse_2a = false,
	collapse_3a = false,
	reset_quake1 = false,
	reset_quake2 = false,
	reset_quake3 = false,
	planet_go_boom = false,
	kill_player_more = false,
	dropper1_drop = false,
	dropper1b_drop = false,
	dropper2_drop = false,
	dropper2b_drop = false,
	dropper3_drop = false,
	dropper4_drop = false,
	dropper5_drop = false,
	dropper6_drop = false,
	dropper7_drop = false,
	dropper8_drop = false,
	dropper9_drop = false,
	noz1_killed = false,
	noz2_killed = false,
	noz3_killed = false,
	noz4_killed = false,
	all_noz_killed = false,
	spawners_over = false,
	set_spawner_times = false,
	two_noz_killed = false,
	anim_side = false,
	anim_spinside = false,
	anim_fall = false,
	anim_spin = false,
	remove_big_daddy = false,
	swap_turret1 = false,
	swap_turret2 = false,
	swap_turret3 = false,
	dropper10_drop = false,
	dropper11_drop = false,
	vo4 = false,
	vo_robot = false,
--  floats
	obj3time = 999999.9,
	vo1time = 999999.9,
	vo2time = 999999.9,
	vo3time = 999999.9,
	power_down_soundtime = 999999.9,
	collapse_soundtime = 999999.9,
	reset_quake1time = 999999.9,
	reset_quake2time = 999999.9,
	reset_quake3time = 999999.9,
	planet_go_boomtime = 999999.9,
	kill_player_moretime = 999999.9,
	spawner1time = 999999.9,
	spawner2time = 999999.9,
	spawner3time = 999999.9,
	spawner4time = 999999.9,
	spawner5time = 999999.9,
	spawner234time = 999999.9,
	anim_spinsidetime = 999999.9,
	remove_big_daddytime = 999999.9,
--  handles
	core,
	player,
	dropship,
	msg1,
	msg2,
	msg3,
	shielda,
	shieldb,
	shieldc,
	shieldd,
	shielde,
	shieldf,
	triggera,
	triggerb,
	triggerc,
	triggerd,
	triggere,
	triggerf,
	holdera,
	holderb,
	holderc,
	holderd,
	holdere,
	holderf,

	collapsea,
	collapseb,
	collapsec,

	collapsea1,
	collapseb1,
	collapsec1,
	turret1,
	turret2,
	turret3,

	dropper1,
	dropper1b,
	dropper2,
	dropper2b,
	dropper3,
	dropper4,
	dropper5,
	dropper6,
	dropper7,
	dropper8,
	dropper9,
	dropper10,
	dropper11,

	noz1,
	noz2,
	noz3,
	noz4,
	spawner1,
	spawner2,
	spawner3,
	spawner4,
	spawner5,
	big_daddy,
--	bad_pilot,
	health1,
	sound_shielda,
	sound_shieldb,
	sound_shieldc,
	sound_shieldd,
	sound_shielde,
	sound_shieldf,

	sound_polea,
	sound_poleb,
	sound_polec,
	sound_poled,
	sound_polee,
	sound_polef,
   
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
	Mission.player = GetPlayerHandle()
	Mission.core = GetHandle("core")
	Mission.dropship = nil
	Mission.msg1 = nil
	Mission.msg2 = nil
	Mission.msg3 = nil
	Mission.shielda = GetHandle("shielda")
	Mission.shieldb = GetHandle("shieldb")
	Mission.shieldc = GetHandle("shieldc")
	Mission.shieldd = GetHandle("shieldd")
	Mission.shielde = GetHandle("shielde")
	Mission.shieldf = GetHandle("shieldf")
	Mission.triggera = GetHandle("triggera")
	Mission.triggerb = GetHandle("triggerb")
	Mission.triggerc = GetHandle("triggerc")
	Mission.triggerd = GetHandle("triggerd")
	Mission.triggere = GetHandle("triggere")
	Mission.triggerf = GetHandle("triggerf")
	Mission.holdera = GetHandle("holdera")
	Mission.holderb = GetHandle("holderb")
	Mission.holderc = GetHandle("holderc")
	Mission.holderd = GetHandle("holderd")
	Mission.holdere = GetHandle("holdere")
	Mission.holderf = GetHandle("holderf")

	Mission.collapsea = GetHandle("collapsea")
	Mission.collapseb = GetHandle("collapseb")
	Mission.collapsec = GetHandle("collapsec")

	Mission.collapsea1 = nil
	Mission.collapseb1 = nil
	Mission.collapsec1 = nil
	Mission.turret1 = GetHandle("turret1")
	Mission.turret2 = GetHandle("turret2")
	Mission.turret3 = GetHandle("turret3")

	Mission.dropper1 = GetHandle("dropper1")
	Mission.dropper1b = GetHandle("dropper1b")
	Mission.dropper2 = GetHandle("dropper2")
	Mission.dropper2b = GetHandle("dropper2b")
	Mission.dropper3 = GetHandle("dropper3")
	Mission.dropper4 = GetHandle("dropper4")
	Mission.dropper5 = GetHandle("dropper5")
	Mission.dropper6 = GetHandle("dropper6")
	Mission.dropper7 = GetHandle("dropper7")
	Mission.dropper8 = GetHandle("dropper8")
	Mission.dropper9 = GetHandle("dropper9")
	Mission.dropper10 = GetHandle("dropper10")
	Mission.dropper11 = GetHandle("dropper11")

	Mission.noz1 = GetHandle("noz1")
	Mission.noz2 = GetHandle("noz2")
	Mission.noz3 = GetHandle("noz3")
	Mission.noz4 = GetHandle("noz4")
	Mission.spawner1 = GetHandle("spawner1")
	Mission.spawner2 = GetHandle("spawner2")
	Mission.spawner3 = GetHandle("spawner3")
	Mission.spawner4 = GetHandle("spawner4")
	Mission.spawner5 = GetHandle("spawner5")
	Mission.big_daddy = GetHandle("big_daddy")
--	Mission.bad_pilot = nil
	Mission.health1 = nil
	Mission.sound_shielda = GetHandle("sound_shielda")
	Mission.sound_shieldb = GetHandle("sound_shieldb")
	Mission.sound_shieldc = GetHandle("sound_shieldc")
	Mission.sound_shieldd = GetHandle("sound_shieldd")
	Mission.sound_shielde = GetHandle("sound_shielde")
	Mission.sound_shieldf = GetHandle("sound_shieldf")

	Mission.sound_polea = GetHandle("sound_polea")
	Mission.sound_poleb = GetHandle("sound_poleb")
	Mission.sound_polec = GetHandle("sound_polec")
	Mission.sound_poled = GetHandle("sound_poled")
	Mission.sound_polee = GetHandle("sound_polee")
	Mission.sound_polef = GetHandle("sound_polef")


	Mission.player = UnitToVSR(Mission.player, "ivtank_vsr", 1)
   
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

	if (not Mission.missionstart) then
	
		SetMaxHealth(Mission.player,4000)
		SetCurHealth(Mission.player,4000)
		Mission.vo1time = (GetTime() + 2)
		SetSkill(Mission.turret1,1)
		SetSkill(Mission.turret2,1)
		SetSkill(Mission.turret3,1)
		GiveWeapon(Mission.player,"gspstab_c")
		GiveWeapon(Mission.player,"gmortar")
		SetAnimation(Mission.big_daddy,"spin",0)	
		Mission.missionstart = true
	end

	if ((not Mission.vo_robot) and (GetDistance(Mission.player,"end_mission") < 30)) then
	
		AudioMessage("isdf1703.wav")--Are you picking up these robot signals major??
		Mission.vo_robot = true
	end

	--makes big daddy spin
	if (not Mission.anim_spin) then
	
		SetAnimation(Mission.big_daddy,"spin",0)	
		Mission.anim_spin = true
	end

	if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
	
		Mission.msg1 = AudioMessage("isdf1701.wav")	--Ok cowboy, it's time to see what you're really made of.  Find the Mission.core and blow this place up
		Mission.vo1 = true
	end

	if ((not Mission.obj1) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
	
		ClearObjectives()
		AddObjective("isdf1701.otf", "WHITE")
		Mission.obj1 = true
	end


	--Controlling the shield doors and their de-activation
	--Shield A
	if ((not Mission.shielda_down) and (not IsAround(Mission.triggera))) then
	
		Mission.power_down_soundtime = (GetTime() + 0.1)

		Mission.pos_holdera = GetTransform(Mission.holdera)
		RemoveObject(Mission.holdera)
		Mission.holdera = BuildObject("cbhangd2",0,Mission.pos_holdera)
		
		Mission.pos_shielda = GetTransform(Mission.shielda)
		RemoveObject(Mission.shielda)
		BuildObject("cbroad04",0,Mission.pos_shielda)

		RemoveObject(Mission.sound_polea)
		RemoveObject(Mission.sound_shielda)

		Mission.shielda_down = true	
	end
	--Shield B
	if ((not Mission.shieldb_down) and (not IsAround(Mission.triggerb))) then
	
		Mission.power_down_soundtime = (GetTime() + 0.1)

		pos_holderb = GetTransform(Mission.holderb)
		RemoveObject(Mission.holderb)
		Mission.holderb = BuildObject("cbhangd2",0,pos_holderb)

		pos_shieldb = GetTransform(Mission.shieldb)
		RemoveObject(Mission.shieldb)
		BuildObject("cbroad04",0,pos_shieldb)

		RemoveObject(Mission.sound_poleb)
		RemoveObject(Mission.sound_shieldb)

		Mission.shieldb_down = true	
	end
	--Shield C
	if ((not Mission.shieldc_down) and (not IsAround(Mission.triggerc))) then
	
		Mission.power_down_soundtime = (GetTime() + 0.1)

		pos_holderc = GetTransform(Mission.holderc)
		RemoveObject(Mission.holderc)
		Mission.holderc = BuildObject("cbhangd2",0,pos_holderc)

		pos_shieldc = GetTransform(Mission.shieldc)
		RemoveObject(Mission.shieldc)
		BuildObject("cbroad04",0,pos_shieldc)

		RemoveObject(Mission.sound_polec)
		RemoveObject(Mission.sound_shieldc)

		Mission.shieldc_down = true	
	end
	--Shield D
	if ((not Mission.shieldd_down) and (not IsAround(Mission.triggerd))) then
	
		Mission.power_down_soundtime = (GetTime() + 0.1)

		pos_holderd = GetTransform(Mission.holderd)
		RemoveObject(Mission.holderd)
		Mission.holderd = BuildObject("cbhangd2",0,pos_holderd)

		pos_shieldd = GetTransform(Mission.shieldd)
		RemoveObject(Mission.shieldd)
		BuildObject("cbroad04",0,pos_shieldd)

		RemoveObject(Mission.sound_poled)
		RemoveObject(Mission.sound_shieldd)

		Mission.shieldd_down = true	
	end
	--Shield E
	if ((not Mission.shielde_down) and (not IsAround(Mission.triggere))) then
	
		Mission.power_down_soundtime = (GetTime() + 0.1)

		pos_holdere = GetTransform(Mission.holdere)
		RemoveObject(Mission.holdere)
		Mission.holdere = BuildObject("cbhangd2",0,pos_holdere)

		pos_shielde = GetTransform(Mission.shielde)
		RemoveObject(Mission.shielde)
		BuildObject("cbroad04",0,pos_shielde)

		RemoveObject(Mission.sound_polee)
		RemoveObject(Mission.sound_shielde)

		Mission.shielde_down = true	
	end
	--Shield F
	if ((not Mission.shieldf_down) and (not IsAround(Mission.triggerf))) then
	
		Mission.power_down_soundtime = (GetTime() + 0.1)

		pos_holderf = GetTransform(Mission.holderf)
		RemoveObject(Mission.holderf)
		Mission.holderf = BuildObject("cbhangd2",0,pos_holderf)

		pos_shieldf = GetTransform(Mission.shieldf)
		RemoveObject(Mission.shieldf)
		BuildObject("cbroad04",0,pos_shieldf)

		RemoveObject(Mission.sound_polef)
		RemoveObject(Mission.sound_shieldf)

		Mission.shieldf_down = true	
	end
	--playing powerdown sound whenever a shield is deactivated
	if ((Mission.power_down_soundtime < GetTime())) then
	
		AudioMessage("tcmort02.wav")
		Mission.power_down_soundtime = 999999.9
	end

	--This controls the swapping of the Turrets once they are destroyed
	if ((not Mission.swap_turret1) and (GetCurHealth(Mission.turret1) < 400)) then
	
		pos_turret1 = GetPosition(Mission.turret1)
		Damage(Mission.turret1,999)
		BuildObject("cbturrd1",0,pos_turret1)	
		Mission.swap_turret1 = true
	end

	if ((not Mission.swap_turret2) and (GetCurHealth(Mission.turret2) < 400)) then
	
		pos_turret2 = GetPosition(Mission.turret2)
		Damage(Mission.turret2,999)
		BuildObject("cbturrd1",0,pos_turret2)	
		Mission.swap_turret2 = true
	end

	if ((not Mission.swap_turret3) and (GetCurHealth(Mission.turret3) < 400)) then
	
		pos_turret3 = GetPosition(Mission.pos_turret3)
		Damage(Mission.turret3,999)
		BuildObject("cbturrd1",0,pos_turret3)	
		Mission.swap_turret3 = true
	end

	--will play a VO when Mission.player is sort of near Mission.core
	if ((not Mission.vo4) and (GetDistance(Mission.player,Mission.core) < 500)) then
	
		AudioMessage("isdf1704.wav") --You should be nearing the Mission.core now
		Mission.vo4 = true
	end



	--checking when the Mission.player gets to the Mission.core
	if ((not Mission.playeratcore) and (GetDistance(Mission.player,Mission.core) < 260)) then
	
		SetObjectiveOn(Mission.noz1)
		tempstr = TranslateString("Mission1701")  -- Beam Emitter

		SetObjectiveName(Mission.noz1,tempstr)
		SetObjectiveOn(Mission.noz2)
		SetObjectiveName(Mission.noz2,tempstr)
		SetObjectiveOn(Mission.noz3)
		SetObjectiveName(Mission.noz3,tempstr)
		SetObjectiveOn(Mission.noz4)
		SetObjectiveName(Mission.noz4,tempstr)
		AudioMessage("isdf1705.wav") --Ah, there it is...the brain of planet Mission.core...
		Mission.playeratcore = true
	end

	--this controls the objects that spawn into the computer room while Mission.player is trying to blow up the nozzles
	if ((not Mission.spawners_over) and (Mission.playeratcore)) then
	
		if (not Mission.set_spawner_times) then
		
			Mission.spawner1time = (GetTime() + 1)
			Mission.spawner234time = (GetTime() + 31)
			Mission.spawner5time = (GetTime() + 50)
			Mission.set_spawner_times = true
		end

		if (Mission.spawner1time < GetTime()) then
		
			pos_spawner1 = GetPosition(Mission.spawner1)
			BuildObject("Cseeker",2,pos_spawner1)	
			Mission.spawner1time = (GetTime() + 10)
		end

		if (Mission.spawner234time < GetTime()) then
		
			pos_spawner2 = GetPosition(Mission.spawner2)
			BuildObject("Cseeker",2,pos_spawner2)	

			pos_spawner3 = GetPosition(Mission.spawner3)
			BuildObject("Cseeker",2,pos_spawner3)	
		
			pos_spawner4 = GetPosition(Mission.spawner4)
			BuildObject("Cseeker",2,pos_spawner4)	

			Mission.spawner234time = (GetTime() + 30)		
		end

		if (Mission.spawner5time < GetTime()) then
		
			pos_spawner5 = GetPosition(Mission.spawner5)
			BuildObject("apcserv",0,pos_spawner5)	
			Mission.spawner5time = (GetTime() + 50)
		end

		if (Mission.all_noz_killed) then
		
			Mission.spawners_over = true
		end
	
	end

	--checking when the nozzles (beam emitters) are destroyed
	if (Mission.playeratcore) then
	
		if ((not Mission.noz1_killed) and (not IsAround(Mission.noz1))) then
		
			Mission.noz1_killed = true
		end

		if ((not Mission.noz2_killed) and (not IsAround(Mission.noz2))) then
		
			Mission.noz2_killed = true
		end

		if ((not Mission.noz3_killed) and (not IsAround(Mission.noz3))) then
		
			Mission.noz3_killed = true
		end

		if ((not Mission.noz4_killed) and (not IsAround(Mission.noz4))) then
		
			Mission.noz4_killed = true
		end
		
		--tells me when ANY two nozzles have been killed
		if (not Mission.two_noz_killed) then
		
			if ((not IsAround(Mission.noz1)) and (not IsAround(Mission.noz2))) then
			
				Mission.two_noz_killed = true
			end
		
			if ((not IsAround(Mission.noz1)) and (not IsAround(Mission.noz3))) then
			
				Mission.two_noz_killed = true
			end
		
			if ((not IsAround(Mission.noz1)) and (not IsAround(Mission.noz4))) then
			
				Mission.two_noz_killed = true
			end		
		
			if ((not IsAround(Mission.noz2)) and (not IsAround(Mission.noz3))) then
			
				Mission.two_noz_killed = true
			end
			
			if ((not IsAround(Mission.noz2)) and (not IsAround(Mission.noz4))) then
			
				Mission.two_noz_killed = true
			end

			if ((not IsAround(Mission.noz3)) and (not IsAround(Mission.noz4))) then
			
				Mission.two_noz_killed = true
			end
		end

		--tells me when ALL  nozzles are killed
		if ((not Mission.all_noz_killed) and (Mission.noz1_killed) and (Mission.noz2_killed) and (Mission.noz3_killed) and (Mission.noz4_killed)) then
		
			Mission.vo2time = (GetTime() + 5)
			Mission.dropship = BuildObject("ivpdrop2",1,"dropship_spawn")
			Mission.all_noz_killed = true
		end

		--when 2 nozs killed, object first tilts, then spins while tilted...
		if ((not Mission.anim_side) and (Mission.two_noz_killed)) then
		
			SetAnimation(Mission.big_daddy,"side",1)	
			Mission.anim_spinsidetime = (GetTime() + 5)
		    Mission.anim_side = true
		end

		if ((not Mission.anim_spinside) and (Mission.anim_spinsidetime < GetTime())) then
		
			SetAnimation(Mission.big_daddy,"spinside",0)
			Mission.anim_spinside = true
		end

		--when all nozs are killed, object is destroyed (falling animation)
		if ((not Mission.anim_fall) and (Mission.all_noz_killed)) then
		
			SetAnimation(Mission.big_daddy,"fall",1)
		--	Mission.remove_big_daddytime = (GetTime() + 10)
			Mission.anim_fall = true
		end

	--	if ((not Mission.remove_big_daddy) and (Mission.remove_big_daddytime < GetTime())) then
	--	
	--		RemoveObject(Mission.big_daddy)
	--		Mission.remove_big_daddy = true
	--	end
	end


	--**Escape Sequence**--
	if ((not Mission.vo2) and (Mission.vo2time < GetTime())) then
	
		Mission.msg2 = AudioMessage("isdf1702.wav")	--Get out of there
		StartEarthQuake(15) --starting earthquake
		Mission.vo2 = true
	end

	if ((not Mission.obj3) and (Mission.vo2) and (IsAudioMessageDone(Mission.msg2))) then
	
		ClearObjectives()
		AddObjective("isdf1703.otf", "WHITE")
		SetObjectiveOn(Mission.dropship)
		tempstr = TranslateString("Mission1702")  -- Dropship

		SetObjectiveName(Mission.dropship,tempstr)
		Mission.planet_go_boomtime = (GetTime() + 100)
		StartCockpitTimer(100, 60, 10) 
		SetAnimation(Mission.dropship,"deploy",1)
		Mission.obj3 = true
	end

	--Controlling the collapsing tunnelsnot not 
	if (Mission.playeratcore) then
	
		if ((not Mission.collapse_1) and (GetDistance(Mission.player,Mission.collapsea) < 100)) then
		
			pos_collapsea = GetTransform(Mission.collapsea)
			RemoveObject(Mission.collapsea)
			Mission.collapsea1 = BuildObject("cbroadA4",0,pos_collapsea)
			Mission.collapse_1 = true
		end

		if ((not Mission.collapse_1a) and (IsAround(Mission.collapsea1))) then
		
			StopEarthQuake()
			StartEarthQuake(50)
			Mission.reset_quake1time = (GetTime() + 6)
			SetAnimation(Mission.collapsea1,"collapse",1)	
			Mission.collapse_soundtime = (GetTime() +1)
			Mission.collapse_1a = true
		end

		if ((not Mission.reset_quake1) and (Mission.reset_quake1time < GetTime())) then
		
			StopEarthQuake()
			StartEarthQuake(15)
			Mission.reset_quake1 = true
		end
------------------/
		if ((not Mission.collapse_2) and (GetDistance(Mission.player,Mission.collapseb) < 100)) then
		
			pos_collapseb = GetTransform(Mission.collapseb)
			RemoveObject(Mission.collapseb)
			Mission.collapseb1 = BuildObject("cbroadA4",0,pos_collapseb)	
			Mission.collapse_2 = true
		end

		if ((not Mission.collapse_2a) and (IsAround(Mission.collapseb1))) then
		
			StopEarthQuake()
			StartEarthQuake(50)
			Mission.reset_quake2time = (GetTime() + 6)

			SetAnimation(Mission.collapseb1,"collapse",1)	
			Mission.collapse_soundtime = (GetTime() +1)
			Mission.collapse_2a = true
		end

		if ((not Mission.reset_quake2) and (Mission.reset_quake2time < GetTime())) then
		
			StopEarthQuake()
			StartEarthQuake(15)
			Mission.reset_quake2 = true
		end
--------------------------
		if ((not Mission.collapse_3) and (GetDistance(Mission.player,Mission.collapsec) < 100)) then
		
			pos_collapsec = GetTransform(Mission.collapsec)
			RemoveObject(Mission.collapsec)
			Mission.collapsec1 = BuildObject("cbroadA4",0,pos_collapsec)
			Mission.collapse_3 = true
		end

		if ((not Mission.collapse_3a) and (IsAround(Mission.collapsec1))) then
		
			StopEarthQuake()
			StartEarthQuake(50)
			Mission.reset_quake3time = (GetTime() + 6)

			SetAnimation(Mission.collapsec1,"collapse",1)	
			Mission.collapse_soundtime = (GetTime() +1)
			Mission.collapse_3a = true
		end

		if ((not Mission.reset_quake3) and (Mission.reset_quake3time < GetTime())) then
		
			StopEarthQuake()
			StartEarthQuake(15)
			Mission.reset_quake3 = true
		end
------------------/
		if (Mission.collapse_soundtime < GetTime()) then
		
			AudioMessage("xcollapse.wav")
			Mission.collapse_soundtime = 999999.9
		end
	end


	--checking to see when Mission.player gets back to his Mission.dropship
	if ((not Mission.playeratdropship) and (Mission.obj3) and (GetDistance(Mission.player,"end_mission") < 40)) then
	
		SucceedMission(GetTime() + 0.1)
		--	Mission.msg3 = AudioMessage("isdf1703.wav") --yahoo we did it	
		Mission.playeratdropship = true
	end

--	if ((not Mission.obj4) and (Mission.playeratdropship) and (IsAudioMessageDone(Mission.msg3))) then
--	
--		ClearObjectives()
--		AddObjective("isdf1704.otf", "WHITE")	--mission accomplished
--		SucceedMission(GetTime() + 10)
--		Mission.obj4 = true
--	end

	--PLANET GO BOOM if Mission.player doesn't make it back to Mission.dropship in time then
	if ((not Mission.planet_go_boom) and (Mission.obj3) and (not Mission.playeratdropship) and (Mission.planet_go_boomtime < GetTime())) then
	
		Damage(Mission.player,10000)
	--	Mission.kill_player_moretime = (GetTime() + 0.5)
		ClearObjectives()
		AddObjective("isdf1705.otf", "WHITE") --mission failed
		FailMission(GetTime() + 2,"isdf17L1.txt")
		Mission.planet_go_boom = true
	end

--	if ((not Mission.kill_player_more) and (Mission.kill_player_moretime < GetTime())) then
--	
--		Damage(Mission.player,10000)
--		FailMission(GetTime() + 10.0)
--		Mission.kill_player_more = true
--	end




	--this makes some of the robots drop health

	if ((not Mission.dropper1_drop) and (GetCurHealth(Mission.dropper1) < 350)) then
	
		pos_dropper1 = GetPosition(Mission.dropper1)
		Damage(Mission.dropper1,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper1)
		Mission.dropper1_drop = true
	end

	if ((not Mission.dropper1b_drop) and (GetCurHealth(Mission.dropper1b) < 350)) then
	
		pos_dropper1b = GetPosition(Mission.dropper1b)
		Damage(Mission.dropper1b,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper1b)
		Mission.dropper1b_drop = true
	end

	if ((not Mission.dropper2_drop) and (GetCurHealth(Mission.dropper2) < 350)) then
	
		pos_dropper2 = GetPosition(Mission.dropper2)
		Damage(Mission.dropper2,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper2)
		Mission.dropper2_drop = true
	end

	if ((not Mission.dropper2b_drop) and (GetCurHealth(Mission.dropper2b) < 350)) then
	
		pos_dropper2b = GetPosition(Mission.dropper2b)
		Damage(Mission.dropper2b,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper2b)
		Mission.dropper2b_drop = true
	end

	if ((not Mission.dropper3_drop) and (GetCurHealth(Mission.dropper3) < 350)) then
	
		pos_dropper3 = GetPosition(Mission.dropper3)
		Damage(Mission.dropper3,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper3)
		Mission.dropper3_drop = true
	end

	if ((not Mission.dropper4_drop) and (GetCurHealth(Mission.dropper4) < 350)) then
	
		pos_dropper4 = GetPosition(Mission.dropper4)
		Damage(Mission.dropper4,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper4)
		Mission.dropper4_drop = true
	end

--	if ((not Mission.dropper5_drop) and (GetCurHealth(Mission.dropper5) < 350)) then
--	
--		pos_dropper5 = GetPosition(Mission.dropper5)
--		Damage(Mission.dropper5,999)
--		Mission.health1 = BuildObject("apcserv",0,pos_dropper5)
--		Mission.dropper5_drop = true
--	end

	if ((not Mission.dropper6_drop) and (GetCurHealth(Mission.dropper6) < 350)) then
	
		pos_dropper6 = GetPosition(Mission.dropper6)
		Damage(Mission.dropper6,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper6)
		Mission.dropper6_drop = true
	end

	if ((not Mission.dropper7_drop) and (GetCurHealth(Mission.dropper7) < 350)) then
	
		pos_dropper7 = GetPosition(Mission.dropper7)
		Damage(Mission.dropper7,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper7)
		Mission.dropper7_drop = true
	end

	if ((not Mission.dropper8_drop) and (GetCurHealth(Mission.dropper8) < 350)) then
	
		pos_dropper8 = GetPosition(Mission.dropper8)
		Damage(Mission.dropper8,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper8)
		Mission.dropper8_drop = true
	end

--	if ((not Mission.dropper9_drop) and (GetCurHealth(Mission.dropper9) < 350)) then
--	
--		pos_dropper9 = GetPosition(Mission.dropper9)
--		Damage(Mission.dropper9,999)
--		Mission.health1 = BuildObject("apcserv",0,pos_dropper9)
--		Mission.dropper9_drop = true
--	end

	if ((not Mission.dropper10_drop) and (GetCurHealth(Mission.dropper10) < 350)) then
	
		pos_dropper10 = GetPosition(Mission.dropper10)
		Damage(Mission.dropper10,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper10)
		Mission.dropper10_drop = true
	end

	if ((not Mission.dropper11_drop) and (GetCurHealth(Mission.dropper11) < 350)) then
	
		pos_dropper11 = GetPosition(Mission.dropper11)
		Damage(Mission.dropper11,999)
		Mission.health1 = BuildObject("apcserv",0,pos_dropper11)
		Mission.dropper11_drop = true
	end

 	
end