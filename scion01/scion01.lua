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
	rondevous1 = false,
	convoygo1 = false,
	escort1afarahead = false,
	escort1aclose = false,	
	missionwon = false,
	engage_escorts = false,
	ambush1over = false,
	ambushers1killed = false,
	escort1a_look = false,
	escort1b_look = false,
	tug_moveout_nav2 = false,
	vo1 = false,
	vo2 = false,
	vo3 = false,
	playermorphed = false,
	playernotmorphed =  false,
	warned1 = false,
	warned2 = false,
	morphdrill = false,
	vo6 = false,
	vo7 = false,
	shabgopatrol = false,
	baseattack1 = false,
	vo8 = false,
	shabdead = false,
	escortcall = false,
	vo10 = false,
	toolong1 = false,
	cooknotaround = false,
	vo16 = false,
	objectifynav1 = false,
	escortsgoinghome = false,
	attack2 = false,
	vo7B = false,
	vo8B = false,
	jaksgo = false,
	jakstop1 = false,
	jakstop2 = false,
	tugkilled = false,
	routeattack1 = false,
	routeattack2 = false,
	rockslide = false,
	rockslideambush = false,
	vo20 = false,
	rockslideambushersdead = false,
	playeronfoot = false,
	obj7 = false,
	vo22 = false,
	rondevous2 = false,
	leave = false,
	convoygo2 = false,
	escort2afarahead = false,
	escort2aclose = false,
	winmission = false,
	obj8 = false,
	obj9 = false,
	kill1 = false,
	kill2 = false,
	playerjumpgun1 = false,
	playeratnav1 = false,
	toolong2 = false,
	failtooktoolong = false,
	attack3 = false,
	vo7C = false,
	vo8C = false,
	attack3 = false,
	attack4 = false,
	vo7D = false,
	vo8D = false, 
	ambush1spawn = false,
	vo23 = false,
	delay2 = false,
	tugpickuppower = false,
	powerkilled = false,
	vo25 = false,
	obj11 = false,
	praise1 = false,
	praise2 = false,
	praise3 = false,
	praise4 = false,
	playersrecy_dead = false,
	vo_recydead = false,
	obj12 = false,
	tug_at_rockslide = false,
	player_at_rockslide = false,
	rockslide_sequence_over = false,
	begin_rockslide_sequence = false,
	rockslide_shot1 = false,
	rdycam1 = false,
	rockslide_shot1_over = false,
	rockslide_shot2 = false,
	rockslide_shot2_over = false,
	rockslide_shot2_settime = false,
	rockslide_shot3 = false,
	rockslide_shot3_over = false,
	rockslide_shot3_settime = false,
	vo19 = false,
	check1 = false,
	cin1over = false,
	intro_shot1over = false,
	intro_rdycam1 = false,
	intro_shot2over = false,
	shot2_settime = false,
	intro_shot3over = false,
	shot3_settime = false,
	intro_shot4over = false,
	shot4_settime = false,
	pilots_move2 = false,
	cons_move1 = false,
	cons_move2 = false,
	shab_relook = false,
	obj13 = false,
	lung_built = false,
	vo34 = false,
	got_lungs = false,
	setvo2time = false,
	camcancelled_vo1 = false,
	obj10 = false,
	vo35 = false,
	checkmsg21done = false,
	playsound1 = false,
	playsound2 = false,
	playsound3 = false,
	playsound4 = false,
	dropship_sequence_over = false,
	land = false,
	swap = false,
	doors_open = false,
	move_into_dropship = false,
	move_into_dropship2 = false,
	move_into_dropship3 = false,
	remove_escort2a = false,
	remove_escort2b = false,
	remove_tug1 = false,
	remove_power = false,
	all_aboard = false,
	dropship_shot1 = false,
	dropship_rdycam1 = false,
	dropship_endcin = false,
	msg6_stop = false,
	swap_rockslide1 = false,
	on_foot_cin_over = false,
	on_foot_shot1 = false,
	setup_on_foot_shot1 = false,
	pilo_go1 = false,
	pilo_stop1 = false,
	on_foot_shot2 = false,
	setup_on_foot_shot2 = false,
	amini_go = false,
	on_foot_shot3 = false,
	pilo_go2 = false,
	suprise_jaks = false,
	too_long_build_lung = false,
	take_off_sound = false,

--  floats
	escort_reaction_time = 999999.9,
	delay1_time = 999999.9,
	vo1time = 999999.9,
	vo2time = 999999.9,
	vo6time = 999999.9,
	vo7time = 999999.9,
	toolongtomorph = 999999.9,
	toolongtomorph2 = 999999.9,
	baseattack1time = 999999.9,
	escortcalltime = 999999.9,
	vo10time = 999999.9,
	toolongtime1 = 999999.9,
	vo16time = 999999.9,
	attack2time = 999999.9,
	vo7Btime = 999999.9,
	jakspawntime = 999999.9,
	jakgotime2 = 999999.9,
	rockslideambushtime = 999999.9,
	vo20time = 999999.9,
	vo22time = 999999.9,
	obj8time = 999999.9,
	obj7time = 999999.9,
	vo3time = 999999.9,
	convoygo1time = 999999.9,
	cooknotaroundtime = 999999.9,
	toolong2time = 999999.9,
	attack3time = 999999.9,
	attack4time = 999999.9,
	vo7Ctime = 999999.9,
	vo7Dtime = 999999.9,
	vo23time = 999999.9,
	tugpickuppowertime = 999999.9,
	vo25time = 999999.9,
	praise1time = 999999.9,
	praise2time = 999999.9,
	praise3time = 999999.9,
	praise4time = 999999.9,
	vo_recydeadtime = 999999.9,
	rockslidetime = 999999.9,
	rockslide_shot1_overtime = 999999.9,
	rockslide_shot2_overtime = 999999.9,
	rockslide_shot3_overtime = 999999.9,
	vo19time = 999999.9,
	intro_shot1overtime = 999999.9,
	intro_shot2overtime = 999999.9,
	intro_shot3overtime = 999999.9,
	intro_shot4overtime = 999999.9,
	pilots_move2time = 999999.9,
	vo34time = 999999.9,
	lung_check = 999999.9,
	vo35time = 999999.9,
	jak_9_10_spawntime = 999999.9,
	dropship_landtime = 999999.9,
	swap_dropshiptime = 999999.9,
	doors_opentime = 999999.9,
	move_into_dropshiptime = 999999.9,
	move_into_dropshiptime2 = 999999.9,
	move_into_dropshiptime3 = 999999.9,
	dropship_endcintime = 999999.9,
	on_foot_shot1_overtime = 999999.9,
	amini_gotime = 999999.9,
	on_foot_shot2_overtime = 999999.9,
	pilo_go2time = 999999.9,
	on_foot_shot3_overtime = 999999.9,
	too_long_build_lungtime = 999999.9,
	take_off_soundtime = 999999.9,
--  handles
	nav1,
	nav2,
	escort1a,
	escort1b,
	tug1,
	shab,
	attack1tanka,
	attack1tankb,
	player,
	ambush1tanka,
	ambush1tankb,
	msg2,
	msg1,
	msg3,
	msg4,
	attack2tanka,
	attack2tankb,
	attack3tanka,
	attack3tankb,
	attack4tanka,
	attack4tankb,
	jak1,
	jak2,
	jak3,
	jak4,
	jak5,
	jak6,
	jak7,
	jak8,
	jakstay1,
	jakstay2,
	routeattacker1,
	routeattacker1a,
	routeattacker1b,
	routeattacker1c,
	routeattacker2a,
	routeattacker2b,
	routeattacker3a,
	routeattacker3b,
	routeattacker3c,
	routeattacker4a,
	routeattacker4b,
	msg20,
	msg22,
	escort2a,
	escort2b,
	msg24,
	msg23,
	msg25,
	power,
	emptygroup,
	playersrecy,
	vofail1,
	landslide,
	camlook1,
	camlook2,
	player_pilo1,
	shab_pilo,
	intro_shot2look,
	kiln,
	shab_pilo3,
	pilots_look1,
	fvcons1,
	player_pilo,
	msg6,
	lung,
	msg34,
	CutSc01msg,
	msg21,
	jak9,
	jak10,
	lands1,
	lands2,
	lands3,
	lands4,
	dropship,
	suprise_jak1,
	suprise_jak2,
	suprise_jak3,
	escort_cin1,
	escort_cin2,
	tug_cin,
	power_cin,

	dropship_cam1look,
	amini,
	pilo_on_foot,
	coll01,
	stall,
	stall2,
	blah1,
--  integers
	a = 0
	
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
	Mission.nav1 = nil
	Mission.nav2 = nil
	Mission.escort1a = nil
	Mission.escort1b = nil
	Mission.tug1 = nil
	Mission.shab = GetHandle("shab")
	Mission.attack1tanka = nil
	Mission.attack1tanka = nil
	Mission.player = nil
	Mission.ambush1tanka = nil
	Mission.ambush1tankb = nil
	Mission.msg2 = nil
	Mission.msg1 = nil
	Mission.msg3 = nil
	Mission.msg4 = nil
	Mission.attack2tanka = nil
	Mission.attack2tankb = nil
	Mission.attack3tanka = nil
	Mission.attack3tankb = nil
	Mission.attack4tanka = nil
	Mission.attack4tankb = nil
	Mission.jak1 = nil
	Mission.jak2 = nil
	Mission.jak3 = GetHandle("jak3")
	Mission.jak4 = GetHandle("jak4")
	Mission.jak5 = GetHandle("jak5")
	Mission.jak6 = nil
	Mission.jak7 = GetHandle("jak7")
	Mission.jak8 = GetHandle("jak8")
	Mission.jakstay1 = GetHandle("jakstay1")
	Mission.jakstay2 = GetHandle("jakstay2")
	Mission.routeattacker1 = nil
	Mission.routeattacker1a = nil
	Mission.routeattacker1b = nil
	Mission.routeattacker1c = nil
	Mission.routeattacker2a = nil
	Mission.routeattacker2b = nil
	Mission.routeattacker3a = nil
	Mission.routeattacker3b = nil
	Mission.routeattacker3c = nil
	Mission.routeattacker4a = nil
	Mission.routeattacker4b = nil
	Mission.msg20 = nil
	Mission.msg22 = nil
	Mission.escort2a = GetHandle("escort2a")
	Mission.escort2b = GetHandle("escort2b")
	Mission.msg24 = nil
	Mission.msg23 = nil
	Mission.msg25 = nil
	Mission.power = nil
	Mission.emptygroup = nil
	Mission.playersrecy = GetHandle("playersrecy")
	Mission.vofail1 = nil
	Mission.landslide = GetHandle("landslide")
	Mission.camlook1 = GetHandle("camlook1")
	Mission.camlook2 = GetHandle("camlook2")
	Mission.player_pilo1 = GetHandle("player_pilo1")
	Mission.shab_pilo = GetHandle("shab_pilo")
	Mission.intro_shot2look = GetHandle("intro_shot2look")
	Mission.kiln = GetHandle("kiln")
	Mission.shab_pilo3 = nil
	Mission.pilots_look1 = GetHandle("pilots_look1")
	Mission.fvcons1 = GetHandle("fvcons1")
	Mission.player_pilo = GetHandle("player_pilo")
	Mission.msg6 = nil
	Mission.lung = nil
	Mission.msg34 = nil
	Mission.CutSc01msg = nil
	Mission.msg21 = nil
	Mission.jak9 = nil
	Mission.jak10 = nil
	Mission.lands1 = nil
	Mission.lands2 = nil
	Mission.lands3 = nil
	Mission.lands4 = nil
	Mission.dropship = nil
	Mission.suprise_jak1 = nil
	Mission.suprise_jak2 = nil
	Mission.suprise_jak3 = nil
	Mission.escort_cin1 = GetHandle("escort_cin1")
	Mission.escort_cin2 = GetHandle("escort_cin2")
	Mission.tug_cin = GetHandle("tug_cin")
	Mission.power_cin = GetHandle("power_cin")

	Mission.dropship_cam1look = GetHandle("dropship_cam1look")
	Mission.amini = nil
	Mission.pilo_on_foot = nil
	Mission.coll01 = GetHandle("coll01")
	Mission.stall = nil
	Mission.stall2 = nil
	Mission.blah1 = nil
	
	SetTeamColor(5,85,255,85) --Amini (rebel scion)

	Mission.player = GetHandle("player")

	Mission.player = UnitToVSR(Mission.player, "fvsent_vsr", 0)
	RemovePilot(Mission.player)

	Mission.shab = UnitToVSR(Mission.shab, "fvsent_vsr", 0)
	RemovePilot(Mission.shab)





   
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
	if ((not Mission.lung_built) and (IsOdf(h,"fblung_vsr"))) then
	
		Mission.lung_built = true  
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

	--INTRO CINERACTIVE.  
	if (not Mission.cin1over) then
	
		if (not Mission.intro_shot1over) then
		
			if (not Mission.intro_rdycam1) then
			
				CameraReady()
				Mission.intro_shot1overtime = (GetTime() + 17)
				Mission.intro_rdycam1 = true
			end
			
			CameraPath("shot1_path1",500,1000,Mission.shab_pilo)

			--moving constructor for dramatic effect
			if (not Mission.cons_move1) then
			
				Goto(Mission.fvcons1,"builder_path1",0)
				Mission.cons_move1 = true
			end

			if ((Mission.intro_shot1overtime < GetTime())) then
			
				Mission.intro_shot1over = true
			end

		end

		if ((not Mission.intro_shot2over) and (Mission.intro_shot1over)) then
		
			if (not Mission.shot2_settime) then
			
				Mission.intro_shot2overtime = (GetTime() + 5)
				Retreat(Mission.player_pilo1,"player_pilo1_path1")
				Retreat(Mission.shab_pilo,"shab_pilo_path1")
				Goto(Mission.fvcons1,"builder_path2",0) --moving builder into position
				Mission.shot2_settime = true
			end
			
			CameraPath("intro_shot2path",500,0,Mission.intro_shot2look)
			
			if ((Mission.intro_shot2overtime < GetTime())) then
			
				RemoveObject(Mission.player_pilo1)
				RemoveObject(Mission.shab_pilo)
				Mission.intro_shot2over = true
			end
		end

		if ((not Mission.intro_shot3over) and (Mission.intro_shot2over)) then
		
			if (not Mission.shot3_settime) then
			
				Mission.intro_shot3overtime = (GetTime() + 28)
				Mission.CutSc01msg = AudioMessage("cutsc0101.wav") --"the scions gave me the same gift that they gave Yelena..."
				Mission.shot3_settime = true
			end
			
			CameraPath("intro_shot3path",1500,100,Mission.kiln)
			
			if ((Mission.intro_shot3overtime < GetTime())) then
			
				Mission.player_pilo1 = BuildObject("sspilo",0,"player_pilo1_spawn")
				Mission.shab_pilo = BuildObject("sspilo",0,"shab_pilo_spawn")
				LookAt(Mission.player_pilo1,Mission.pilots_look1)
				LookAt(Mission.shab_pilo,Mission.pilots_look1)
				Mission.pilots_move2time = (GetTime() + 5)
				Mission.intro_shot3over = true
			end
		end

		if ((not Mission.intro_shot4over) and (Mission.intro_shot3over)) then
		
			if (not Mission.shot4_settime) then
			
				Mission.intro_shot4overtime = (GetTime() + 18)
				Mission.shot4_settime = true
			end
			
			CameraPath("intro_shot4path",200,0,Mission.player_pilo1)

			if ((not Mission.pilots_move2) and (Mission.pilots_move2time < GetTime())) then
			
				Retreat(Mission.player_pilo1,"player_path")
				Retreat(Mission.shab_pilo,"shab_path")	
				Mission.pilots_move2 = true
			end

			if ((Mission.intro_shot4overtime < GetTime())) then
			
				Mission.intro_shot4over = true
				RemoveObject(Mission.player_pilo1)
				RemoveObject(Mission.shab_pilo)
				Mission.shab_pilo3 = BuildObject("sspilo",1,"shab_spawn2")
				SetMaxHealth(Mission.shab_pilo3,15000)
				SetCurHealth(Mission.shab_pilo3,15000)
				Retreat(Mission.shab_pilo3,Mission.shab)
				CameraFinish()
			
			--	if (not Mission.cons_move2) then
			--	
			--			Goto(Mission.fvcons1,"builder_path2",0)
			--		Mission.cons_move2 = true
	    	--	end

				Mission.cin1over = true
			end
		end

		--if the Mission.player hits spacebar and cancels the cineractive then
		if (CameraCancelled()) then
		
			if (IsAround(Mission.player_pilo1)) then
			
				RemoveObject(Mission.player_pilo1)
			end

			if (IsAround(Mission.shab_pilo)) then
			
				RemoveObject(Mission.shab_pilo)
			end

			if (IsAround(Mission.shab_pilo3)) then
			
				RemoveObject(Mission.shab_pilo3)
			end

			if (not Mission.cons_move2) then
			
				Goto(Mission.fvcons1,"builder_path2",0)
				Mission.cons_move2 = true
			end
			
			if (not IsAudioMessageDone(Mission.CutSc01msg)) then
			
				StopAudioMessage(Mission.CutSc01msg)
			end
			CameraFinish()
			Mission.shab_pilo3 = BuildObject("sspilo",1,"shab_spawn2")
			SetMaxHealth(Mission.shab_pilo3,15000)
			SetCurHealth(Mission.shab_pilo3,15000)
			Retreat(Mission.shab_pilo3,Mission.shab)
			Mission.cin1over = true
		end
	end
	
	if (Mission.cin1over) then
	
		if ((not Mission.missionstart) and (not IsAround(Mission.shab_pilo3))) then
		
			SetAvoidType(Mission.escort2a,0)
			SetAvoidType(Mission.escort2b,0)
			Stop(Mission.shab)
			LookAt(Mission.shab,Mission.player)
			SetScrap(1,0)
			SetMaxHealth(Mission.shab,10000)
			SetCurHealth(Mission.shab,10000)
			SetSkill(Mission.shab,3)
			SetObjectiveOn(Mission.shab)
			SetObjectiveName(Mission.shab,"Shabayev")
			Mission.vo1time = (GetTime() + 3)
			Patrol(Mission.jak3,"jak_3_4_path")
			Follow(Mission.jak4,Mission.jak3)
			Patrol(Mission.jak5,"jak_5_path")
			Patrol(Mission.jak6,"jak_6_path")
			Patrol(Mission.jak7,"jak_7_8_path")
			Follow(Mission.jak8,Mission.jak7)
			Stop(Mission.jakstay1)
			Stop(Mission.jakstay2)
			Mission.jak_9_10_spawntime = (GetTime() + 3)
			Pickup(Mission.tug_cin,Mission.power_cin)

			Mission.missionstart = true
		end

		--spawning in jak killers
		if (Mission.jak_9_10_spawntime < GetTime()) then
		
			Mission.jak9 = BuildObject("mcjak01",0,"jak9spawn")
			Mission.jak10 = BuildObject("mcjak01",0,"jak10spawn")
			Goto(Mission.jak9,"jak_go1")
			Goto(Mission.jak10,"jak_go1")
			Mission.jak_9_10_spawntime = (GetTime() + 300)
		end
		--telling Mission.shab to re-look at Mission.player if he gets in his tank then
		if ((not Mission.shab_relook) and (not Mission.shabgopatrol) and (not IsAround(Mission.player_pilo))) then
		
			LookAt(Mission.shab,Mission.player)
			Mission.shab_relook = true
		end

		if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
		
			Mission.msg1 = AudioMessage("scion0101.wav") --(You're new to your body, I understand...)
			Mission.vo1 = true
		end



		if ((not settime_vo6) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
		
			Mission.vo6time = (GetTime() + 2.5)	
			settime_vo6 = true
		end

		if ((not Mission.vo6) and (Mission.vo6time < GetTime())) then
		
			Mission.msg6 = AudioMessage("scion0106.wav") -- Shab, Explaining scion Mission.power rules, tells Mission.player to build Mission.a Mission.lung on Kiln
			Mission.jakspawntime = (GetTime() + 5)
		--	Mission.baseattack1time = (GetTime() + 110)  
			Mission.vo6 = true
		end

		if ((not Mission.obj13) and (Mission.vo6) and (not Mission.shabdead) and (IsAudioMessageDone(Mission.msg6))) then
		
			ClearObjectives()
			AddObjective("scion0113.otf", "WHITE") --build Mission.a Mission.lung on your Mission.kiln
			Mission.too_long_build_lungtime = (GetTime() + 90)
			Mission.obj13 = true
		end

		--this will fail the Mission.player if he takes too long to build the Mission.lung then
		if ((not Mission.too_long_build_lung) and (not Mission.lung_built) and (Mission.too_long_build_lungtime < GetTime())) then
		
			ClearObjectives()
			AddObjective("scion0113b.otf", "WHITE")	
			AddObjective("scion0113c.otf", "RED")
			AudioMessage("scion0136.wav")
			FailMission(GetTime() + 10,"scion01L6.txt") 
			Mission.too_long_build_lung = true
		end

		--This will stop MSG6 if the Mission.player builds the Mission.lung early then
		if ((not Mission.msg6_stop) and (Mission.vo6) and (Mission.lung_built) and (not IsAudioMessageDone(Mission.msg6))) then
		
			StopAudioMessage(Mission.msg6)
			Mission.msg6_stop = true
		end

		--checking to see when the Mission.lung is builtnot 
--[[
		if ((not Mission.lung_built) and (Mission.lung_check < GetTime())) then
		
			Mission.lung_check = GetTime() + 1.0

			Mission.a = CountUnitsNearObject(0,99999.0,1,"fblung_vsr")

			if (Mission.a > 1) then
			
				Mission.lung_check = GetTime() + 999999.9
				Mission.vo2time = (GetTime() + 2)
				Mission.lung_built = true
			end
		end

]]		--Checking when the Mission.lung is built
		if ((not Mission.setvo2time) and (Mission.lung_built) and (Mission.obj13) and (not Mission.too_long_build_lung)) then
		
			Mission.vo2time = (GetTime() + 2)
			Mission.setvo2time = true
		end

----Telling Mission.player to morph...
		if ((not Mission.vo2) and (Mission.lung_built) and (Mission.vo2time < GetTime())) then
		
			Mission.msg2 = AudioMessage("scion0102.wav") -- Good job, now the Kiln is powered.  You should also learn how to morph...
			Mission.toolongtomorph = (GetTime() + 40)
			Mission.vo2 = true
		end

		if ((not Mission.obj10) and (Mission.vo2) and (not Mission.shabdead) and (IsAudioMessageDone(Mission.msg2))) then
		
			ClearObjectives()
			AddObjective("scion0110.otf", "WHITE")	
			Mission.obj10 = true
		end

		--/this will stop Mission.shab's voice if Mission.player morphs his ship early then
		if ((not Mission.playerjumpgun1) and (not Mission.playermorphed) and (Mission.vo2) and (not IsAudioMessageDone(Mission.msg2) and (IsDeployed(Mission.player)))) then
		
			StopAudioMessage(Mission.msg2)
			Mission.vo3time = (GetTime() + 1)
			Mission.playermorphed = true
			Mission.playerjumpgun1 = true
		end
		----/

		if (not Mission.morphdrill) then
		
				--Mission.player morphs correctly
			if ((not Mission.playermorphed) and (not Mission.playerjumpgun1) and (Mission.vo2) and (IsAudioMessageDone(Mission.msg2) and (IsDeployed(Mission.player)))) then
			
			
				Mission.vo3time = (GetTime() + 1)
				Mission.morphdrill = true
				Mission.playermorphed = true
			end
				--Mission.player stalls to morph
			if ((not Mission.playermorphed) and (not Mission.warned1) and (Mission.toolongtomorph < GetTime())) then
			
				Mission.stall = AudioMessage("scion0104.wav") -- Mission.shab, There's no time to waste, John...morph your ship nownot 
				Mission.toolongtomorph2 = (GetTime() + 20)
				Mission.warned1 = true
			end
				--Mission.player still hasn't morphed
			if ((not Mission.playermorphed) and (not Mission.warned2) and (Mission.toolongtomorph2 < GetTime())) then
			
				Mission.stall2 = AudioMessage("scion0118.wav") -- Mission.shab You maybe have been Mission.a major in braddock's army, but you are just Mission.a student here...
				Mission.warned2 = true
				Mission.jakspawntime = (GetTime() + 5)
				Mission.vo34time = (GetTime() + 6)
			--	Mission.baseattack1time = (GetTime() + 45)
				Mission.morphdrill = true
			end
		end

		if ((not Mission.vo3) and (Mission.vo3time < GetTime())) then
		
			Mission.blah1 = AudioMessage("scion0103.wav") --Mission.shab, Good while morhped your ships can use different weapons and tactics.
			Mission.vo34time = (GetTime() + 6)
			Mission.vo3 = true
		end

		if ((not Mission.vo34) and (Mission.vo34time < GetTime())) then
		
			Mission.msg34 = AudioMessage("scion0134.wav")--scion0134.wav SHABAYEV OK JOHN, LETS GET READY FOR THE ESCORT.  UPGRADE THE KILN INTO A FORGE AND BEGIN BUILDING SOME WARRIORS AND SENTRY'S.
			Mission.baseattack1time = (GetTime() + 45)
			Mission.vo34 = true
		end

		--sending Mission.shab to patrol
		if ((not Mission.shabgopatrol) and (Mission.vo34) and (not Mission.shabdead) and (IsAudioMessageDone(Mission.msg34))) then
		
			Patrol(Mission.shab,"shab_patrol")
			ClearObjectives()
			AddObjective("scion0101.otf", "WHITE") --upgrade forge, build warriors and sentries.
			Mission.shabgopatrol = true
		end


	------controlling the Jak creatures....
		if ((not Mission.jaksgo) and (Mission.jakspawntime < GetTime())) then
		
			Mission.jak1 = BuildObject("mcjak01",0,"jak1spawn")
			Mission.jak2 = BuildObject("mcjak01",0,"jak2spawn")
			Goto(Mission.jak1,"jakstop1")
			Follow(Mission.jak2,Mission.jak1)
			Mission.jaksgo = true
		end

		if ((not Mission.jakstop1) and (IsAlive(Mission.jak1) and (GetDistance(Mission.jak1,"jakstop1") < 15))) then
		
			if (IsAlive(Mission.jak1)) then
			
				Stop(Mission.jak1)
				LookAt(Mission.jak1,Mission.playersrecy)		
			end
			if (IsAlive(Mission.jak2)) then
			
				Stop(Mission.jak2)
				LookAt(Mission.jak2,Mission.playersrecy)		
			end		

			Mission.jakgotime2 = (GetTime() + 10)
			Mission.jakstop1 = true
		end

		if ((not Mission.jakstop2) and (Mission.jakgotime2 < GetTime())) then
		
			if (IsAlive(Mission.jak1)) then
			
				Goto(Mission.jak1,"jakstop2")
			end
			if ((IsAlive(Mission.jak2) and (IsAlive(Mission.jak1)))) then
			
				Follow(Mission.jak2,Mission.jak1)
			end

			Mission.jakstop2 = true
		end
	----/

	--/WAVES
		--WAVE1
		if ((not Mission.baseattack1) and (Mission.baseattack1time < GetTime())) then
		
			Mission.attack1tanka = BuildObject("ivscout_vsr",2,"attack1a")
			Mission.attack1tankb = BuildObject("ivscout_vsr",2,"attack1b")
			SetSkill(Mission.attack1tanka,1)
			SetSkill(Mission.attack1tankb,1) 
			Attack(Mission.shab,Mission.attack1tanka)
			Attack(Mission.attack1tankb,Mission.player)
			Mission.vo7time = (GetTime() + 2)

			--setting times for the rest of the spawns
			Mission.attack2time = (GetTime() + 100) --100
			Mission.attack3time = (GetTime() + 220) --220
			Mission.attack4time = (GetTime() + 350) --350
			Mission.escortcalltime = (GetTime() + 500) --500
			Mission.baseattack1 = true
		end

		if ((not Mission.vo7) and (Mission.vo7time < GetTime())) then
		
			AudioMessage("scion0107.wav") -- Give me Mission.a hand, i'm under fire
			Mission.vo7 = true
		end

		if ((not Mission.vo8) and (Mission.vo7) and (IsAlive(Mission.shab) and (not IsAlive(Mission.attack1tanka) and (not IsAlive(Mission.attack1tankb))))) then
		
			Mission.praise1time = (GetTime() + 1.3)
			Patrol(Mission.shab,"shab_patrol")
 
			Mission.vo8 = true
		end

		if ((not Mission.praise1) and (Mission.praise1time < GetTime())) then
				
			AudioMessage("scion0108.wav")-- Good job (Mission.shab)
			Mission.praise1 = true
		end

		--/WAVE2
		if ((not Mission.attack2) and (Mission.attack2time < GetTime())) then
		
			Mission.attack2tanka = BuildObject("ivscout_vsr",2,"attack2a")
			Mission.attack2tankb = BuildObject("ivscout_vsr",2,"attack2b")
			SetSkill(Mission.attack2tanka,1)
			SetSkill(Mission.attack2tankb,1) 
			Attack(Mission.shab,Mission.attack2tanka)
			Attack(Mission.attack2tankb,Mission.player)
			Mission.vo7Btime = (GetTime() + 3)
			Mission.attack2 = true
		end

		if ((not Mission.vo7B) and (Mission.vo7Btime < GetTime())) then
		
		--	AudioMessage("scion0107.wav") -- Hostilesnot   John give me Mission.a handnot  (Mission.shab)
			Mission.vo7B = true
		end

		if ((not Mission.vo8B) and (Mission.vo7B) and (IsAlive(Mission.shab) and (not IsAlive(Mission.attack2tanka) and (not IsAlive(Mission.attack2tankb))))) then
		
			Mission.praise2time = (GetTime() + 1.3)
			Patrol(Mission.shab,"shab_patrol")

			Mission.vo8B = true
		end

		if ((not Mission.praise2) and (Mission.praise2time < GetTime())) then
				
		--	AudioMessage("scion0108.wav")-- Good job (Mission.shab)
			Mission.praise2 = true
		end


		
		--WAVE3

		if ((not Mission.attack3) and (Mission.attack3time < GetTime())) then
		
			Mission.attack3tanka = BuildObject("ivscout_vsr",2,"attack1a")
			Mission.attack3tankb = BuildObject("ivtank_vsr",2,"attack1b")
			SetSkill(Mission.attack3tanka,1)
			SetSkill(Mission.attack3tankb,1) 
			Attack(Mission.shab,Mission.attack3tanka)
			Attack(Mission.attack3tankb,Mission.player)
			Mission.vo7Ctime = (GetTime() + 3)
			Mission.attack3 = true
		end

		if ((not Mission.vo7C) and (Mission.vo7Ctime < GetTime())) then
		
		--	AudioMessage("scion0107.wav") -- Hostilesnot   John give me Mission.a handnot  (Mission.shab)
			Mission.vo7C = true
		end

		if ((not Mission.vo8C) and (Mission.vo7C) and (IsAlive(Mission.shab) and (not IsAlive(Mission.attack3tanka) and (not IsAlive(Mission.attack3tankb))))) then
		
			Mission.praise3time = (GetTime() + 1.3)
			Patrol(Mission.shab,"shab_patrol")

			Mission.vo8C = true
		end

		if ((not Mission.praise3) and (Mission.praise3time < GetTime())) then
				
		--	AudioMessage("scion0108.wav")-- Good job (Mission.shab)
			Mission.praise3 = true
		end

		--WAVE4

		if ((not Mission.attack4) and (Mission.attack4time < GetTime())) then
		
			Mission.attack4tanka = BuildObject("ivscout_vsr",2,"attack2a")
			Mission.attack4tankb = BuildObject("ivtank_vsr",2,"attack2b")
			SetSkill(Mission.attack4tanka,1)
			SetSkill(Mission.attack4tankb,1) 
			Attack(Mission.shab,Mission.attack4tanka)
			Attack(Mission.attack4tankb,Mission.player)
			Mission.vo7Dtime = (GetTime() + 3)
			Mission.attack4 = true
		end

		if ((not Mission.vo7D) and (Mission.vo7Dtime < GetTime())) then
		
		--	AudioMessage("scion0107.wav") -- Hostilesnot   John give me Mission.a handnot  (Mission.shab)
			Mission.vo7D = true
		end

		if ((not Mission.vo8D) and (Mission.vo7D) and (IsAlive(Mission.shab) and (not IsAlive(Mission.attack4tanka) and (not IsAlive(Mission.attack4tankb))))) then
		
			Mission.praise4time = (GetTime() + 1.3)
			Patrol(Mission.shab,"shab_patrol")
			Mission.vo8D = true
		end

		if ((not Mission.praise4) and (Mission.praise4time < GetTime())) then
				
		--	AudioMessage("scion0108.wav")-- Good job (Mission.shab)
			Mission.praise4 = true
		end


	--CALL FROM DELTA WING
		if ((not Mission.escortcall) and (Mission.escortcalltime < GetTime())) then
		
			AudioMessage("scion0109.wav")-- Delta wing--We have the Mission.power source, ETA to rondevous is 3 minutes.
			Mission.escort1a = BuildObject("fvscout_vsr",1,"escort1a")
			Mission.escort1b = BuildObject("fvscout_vsr",1,"escort1b")
			Mission.tug1 = BuildObject("fvtug",1,"tug1")
			Mission.power = BuildObject("cotran01",0,"power")
			Stop(Mission.escort1a)
			Stop(Mission.escort1b)
			Stop(Mission.tug1)
			SetMaxHealth(Mission.tug1,5000)
			SetCurHealth(Mission.tug1,5000)
			SetAvoidType(Mission.escort1a,0)
			SetAvoidType(Mission.escort1b,0)
			SetAvoidType(Mission.escort2a,0)
			SetAvoidType(Mission.escort2b,0)
			SetAvoidType(Mission.tug1,0)
			Mission.tugpickuppowertime = (GetTime() + 3)
			Mission.vo10time = (GetTime() + 3)
			Mission.convoygo1time = (GetTime() + 8)
			Mission.escortcall = true
		end

		if ((not Mission.tugpickuppower) and (Mission.tugpickuppowertime < GetTime())) then
		
			Pickup(Mission.tug1,Mission.power)
			Mission.tugpickuppower = true
		end

		if ((not Mission.vo10) and (Mission.vo10time < GetTime())) then
		
			Mission.msg3 = AudioMessage("scion0110.wav") -- Mission.shab: Excellent, Delta wing.  Cook you're up.  Take Mission.a couple wingmen, and meet them at Nav 1.  Leave Mission.a few ships to help me defend the base. (SHAB)
			Mission.vo10 = true
		end
		
		if ((not Mission.objectifynav1) and (Mission.vo10) and (not Mission.shabdead) and (IsAudioMessageDone(Mission.msg3))) then
		
			Mission.nav1 = BuildObject("ibnav",1,"nav1")			
			SetObjectiveOn(Mission.nav1)
			tempstr = TranslateString("MissionS0101")  -- Nav 1
			SetObjectiveName(Mission.nav1,tempstr)
			SetObjectiveOff(Mission.shab)
			ClearObjectives()
			AddObjective("scion0102.otf", "WHITE")
			Mission.objectifynav1 = true
		end

		if (not Mission.rondevous1) then
		
			if ((not Mission.convoygo1) and (Mission.convoygo1time < GetTime())) then
			
				Retreat(Mission.escort1a,"rondevous1")
				Retreat(Mission.tug1,"rondevous1")
				Follow(Mission.escort1b,Mission.tug1)
				Mission.cooknotaroundtime = (GetTime() + 100)
				Mission.convoygo1 = true
			end
			
			if ((not Mission.escort1afarahead) and (GetDistance(Mission.escort1a,Mission.tug1) > 100)) then
			
				Stop(Mission.escort1a)
				LookAt(Mission.escort1a,Mission.tug1)
				Mission.escort1aclose = false
				Mission.escort1afarahead = true
			end

			if ((not Mission.escort1aclose) and (Mission.escort1afarahead) and (GetDistance(Mission.escort1a,Mission.tug1) < 99)) then
			
				Retreat(Mission.escort1a,"rondevous1")
				Mission.escort1aclose = true
				Mission.escort1afarahead = false
			end

			if ((GetDistance(Mission.tug1,"rondevous1") < 125 and (GetDistance(Mission.tug1,Mission.player) < 125))) then
			
				msg13 = AudioMessage("scion0113.wav") --Delta wing here, we have Cook on radar. Lt. Shabayev, are you sure we can trust this man with the Mission.power source?   
				Stop(Mission.escort1a)
				SetObjectiveOff(Mission.nav1)
				Mission.rondevous1 = true
			end
		end

		if ((not Mission.delay2) and (Mission.rondevous1) and (IsAudioMessageDone(msg13))) then
		
			Mission.vo23time = (GetTime() +1)
			Mission.delay2 = true
		end

		if ((not Mission.vo23) and (Mission.vo23time < GetTime())) then
		
			Mission.msg23 = AudioMessage("scion0123.wav")  --SCION0123 SHAB - you have my word on it
			Mission.vo23 = true
		end

		--ambush when Mission.player first meets tug
		if ((not Mission.ambush1spawn) and (Mission.vo23) and (IsAudioMessageDone(Mission.msg23))) then
		
			Mission.ambush1tanka = BuildObject("ivtank_vsr",2,"ambush1a")
			Mission.ambush1tankb = BuildObject("ivscout_vsr",2,"ambush1b")
			SetSkill(Mission.ambush1tanka,2)
			SetSkill(Mission.ambush1tankb,1)
			Attack(Mission.ambush1tanka,Mission.tug1)
			Attack(Mission.ambush1tankb,Mission.player)
			Mission.escort_reaction_time = (GetTime() + 2)	
			Mission.ambush1spawn = true
		end

	--seeing when Mission.player is at Mission.nav1
		if ((not Mission.playeratnav1) and (Mission.vo10) and (GetDistance(Mission.player,"nav1") < 100)) then
		
			Mission.playeratnav1 = true
		end
		--/

		--/if cook is not there in 100 sec then
		if ((not Mission.cooknotaround) and (not Mission.rondevous1) and (Mission.cooknotaroundtime < GetTime())) then
		
			AudioMessage("scion0112.wav") -- Delta wing here, we are at Nav 1 but Cook is not aroundnot 
			Mission.toolongtime1 = (GetTime() + 30)
			Mission.cooknotaround = true
		end
		--/still not there
		if ((not Mission.toolong1) and (not Mission.rondevous1) and (Mission.toolongtime1 < GetTime())) then
		
			AudioMessage("scion0111.wav")	--Mission.shab:  Hurry up Cooknot   They could run into trouble out there.
			Mission.toolong2time = (GetTime() + 180)
			Mission.toolong1 = true
		end
		--if Mission.player takes too long in getting to Nav 1 the mission is failed... then
		if ((not Mission.toolong2) and (not Mission.rondevous1) and (Mission.toolong2time < GetTime())) then
		
			Mission.msg24 = AudioMessage("scion0124.wav") --SCION0124  That's it John, I have to let you gonot   If you cannot follow orders...
			Mission.toolong2 = true
		end

		if ((not Mission.failtooktoolong) and (Mission.toolong2) and (IsAudioMessageDone(Mission.msg24))) then
		
			ClearObjectives()
			AddObjective("scion0111.otf", "WHITE") --mission failed
			FailMission(GetTime() + 6,"scion01L1.txt")
			Mission.failtooktoolong = true
		end
		------


	--/After the rendezvous...
		if ((not Mission.engage_escorts) and (Mission.escort_reaction_time < GetTime())) then
		
			SetObjectiveOff(Mission.nav1)
			Attack(Mission.escort1a,Mission.ambush1tanka)
			Attack(Mission.escort1b,Mission.ambush1tankb)
			AudioMessage("scion0114.wav")  --Delta wing: What the..?not   Ambushnot   Protect the tugnot  
			Mission.engage_escorts = true
		end

		if (not Mission.ambush1over) then
		
			if ((not Mission.ambushers1killed) and (Mission.ambush1spawn) and (not IsAlive(Mission.ambush1tanka) and (not IsAlive(Mission.ambush1tankb)))) then
			
				if (IsAlive(Mission.escort1a)) then
				
					Retreat(Mission.escort1a, "escort1a_go1")
				end
				if (IsAlive(Mission.escort1b)) then
				
					Retreat(Mission.escort1b, "escort1b_go1")
				end

				Mission.ambushers1killed = true
				Mission.delay1_time = GetTime() + 5
			end

			if ((not Mission.escort1a_look) and (IsAlive(Mission.escort1a) and (Mission.ambushers1killed) and (GetDistance(Mission.escort1a,"escort1a_go1") < 20))) then
			
				LookAt(Mission.escort1a,Mission.player)
				Mission.escort1a_look = true
			end

			if ((not Mission.escort1b_look) and (IsAlive(Mission.escort1b) and (Mission.ambushers1killed) and (GetDistance(Mission.escort1b,"escort1b_go1") < 20))) then
			
				LookAt(Mission.escort1b,Mission.player)
				Mission.escort1b_look = true
			end	

		end
		--------------***************************
		--------------***************************
		if ((not Mission.escortsgoinghome) and (Mission.delay1_time < GetTime())) then
		
			AudioMessage("scion0115.wav")-- Delta wing:  We are handing the tug over to cook and heading to base
			Mission.vo16time = (GetTime() + 15)
			Retreat(Mission.escort1a,"escort1a_go2")
			Retreat(Mission.escort1b,"escort1b_go2") 
			Mission.routeattacker1 = BuildObject("ivscout_vsr",2,"routeattack1a")
			Mission.routeattacker1b = BuildObject("ivscout_vsr",2,"routeattack1b")
			Mission.routeattacker1c = BuildObject("ivscout_vsr",2,"routeattack1c")
			Mission.routeattacker2a = BuildObject("ivscout_vsr",2,"routeattack2a")
			Mission.routeattacker2b = BuildObject("ivtank_vsr",2,"routeattack2b")
			SetSkill(Mission.routeattacker1,2)
			SetSkill(Mission.routeattacker1b,1)
			SetSkill(Mission.routeattacker1c,1)
			SetSkill(Mission.routeattacker2a,2)
			SetSkill(Mission.routeattacker2b,1) 
			Mission.escortsgoinghome = true
		end

		if ((not Mission.vo16) and (Mission.vo16time < GetTime())) then
		
			Mission.msg4 = AudioMessage("scion0116.wav") --Mission.shab - Ok Cook, escort the tug to nav 2 where another wing will relieve you.  
			Mission.nav2 = BuildObject("ibnav",1,"nav2")			
			SetObjectiveOn(Mission.nav2)
			tempstr = TranslateString("MissionS0102")  -- Nav 2
			SetObjectiveName(Mission.nav2,tempstr)
			Mission.vo16 = true
		end

		if ((not Mission.tug_moveout_nav2) and (Mission.vo16) and (IsAudioMessageDone(Mission.msg4))) then
		
			Retreat(Mission.tug1,"tug_path1")
			SetObjectiveOn(Mission.tug1)
			tempstr = TranslateString("MissionS0103")  -- Hauler
			SetObjectiveName(Mission.tug1,tempstr)
			ClearObjectives()
			AddObjective("scion0103.otf", "WHITE") --escort tug to nav 2
			Mission.tug_moveout_nav2 = true
		end

		if ((not Mission.routeattack1) and (GetDistance(Mission.tug1,"trig_routeattack1") < 30)) then
		
			Attack(Mission.routeattacker1,Mission.player)
			Attack(Mission.routeattacker1b,Mission.tug1)
			Attack(Mission.routeattacker1c,Mission.tug1)
			Mission.routeattack1 = true

		end

		if ((not Mission.routeattack1) and (GetDistance(Mission.player,"trig_routeattack1") < 100)) then
		

			Attack(Mission.routeattacker1,Mission.player)
			Attack(Mission.routeattacker1b,Mission.tug1)
			Attack(Mission.routeattacker1c,Mission.tug1)
			Mission.routeattack1 = true

		end

		if ((not Mission.routeattack2) and (GetDistance(Mission.tug1,"trig_routeattack2") < 30)) then
		
	   		SetSkill(Mission.routeattacker2a,1)
			Attack(Mission.routeattacker2a,Mission.tug1)
			Mission.routeattack2 = true
		end

		--checking to see when tug is at Mission.rockslide
		if ((not Mission.tug_at_rockslide) and (Mission.tug_moveout_nav2) and (IsAround(Mission.tug1) and (GetDistance(Mission.tug1,"trig_rockslide") < 40))) then
		
			Mission.check1 = true
			Mission.tug_at_rockslide = true
		end

		--checking to see when Mission.player is at Mission.rockslide
		if ((not Mission.player_at_rockslide) and (Mission.tug_moveout_nav2) and (IsAround(Mission.tug1) and (GetDistance(Mission.player,"trig_rockslide") < 60))) then
		
			Mission.check1 = true
			Mission.player_at_rockslide = true
		end

		----------------/
		--**ROCKSLIDE**--
		----------------/
		if ((not Mission.rockslide_sequence_over) and (Mission.check1)) then
			--When Mission.player or tug reach the Mission.rockslide
			if ((not Mission.begin_rockslide_sequence) and (Mission.check1)) then
				--swapping the Mission.landslide with no collision with the one with collision (meslid1a for meslid2a)
				--and the secondary coll box as well
				pos_land1 = GetTransform(Mission.landslide)
				RemoveObject(Mission.landslide)
				Mission.landslide = BuildObject("meslida2",0,pos_land1)
				--
				pos_coll01 = GetTransform(Mission.coll01)
				RemoveObject(Mission.coll01)
				Mission.coll01 = BuildObject("mecoll02",0,pos_coll01)
				--
				Mission.rockslidetime = (GetTime() + 2)
				Mission.begin_rockslide_sequence = true	
			end

			if ((not Mission.rockslide) and (Mission.rockslidetime < GetTime())) then
			
				SetAnimation(Mission.landslide,"landslide",1)
				StartEarthQuake(10)
				Mission.rockslide = true
			end


			if ((not Mission.rockslide_shot1) and (Mission.begin_rockslide_sequence)) then
			
				if (not Mission.rdycam1) then
				
					CameraReady()
					Mission.rockslide_shot1_overtime = (GetTime() + 4)
					Mission.rdycam1 = true
				end
	
				CameraPath("campath1",2500,0,Mission.camlook1)
			end

			if ((not Mission.rockslide_shot1_over) and (Mission.rockslide_shot1_overtime < GetTime())) then
			
				Mission.rockslide_shot1 = true
				Mission.rockslide_shot1_over = true
			end

			if ((not Mission.rockslide_shot2) and (Mission.rockslide_shot1_over)) then
			
				if (not Mission.rockslide_shot2_settime) then
				
					Mission.rockslide_shot2_overtime = (GetTime() + 3)
					Mission.rockslide_shot2_settime = true
				end
				CameraPath("campath2",1500,0,Mission.camlook2)		
			end

			if ((not Mission.rockslide_shot2_over) and (Mission.rockslide_shot2_overtime < GetTime())) then
			
				Mission.rockslide_shot2 = true
				Mission.rockslide_shot2_over = true
			end

			if ((not Mission.rockslide_shot3) and (Mission.rockslide_shot2_over)) then
			
				if (not Mission.rockslide_shot3_settime) then
				
					Mission.rockslide_shot3_overtime = (GetTime() + 4)
					Mission.rockslide_shot3_settime = true
				end
				CameraPath("campath1",2500,0,Mission.camlook1)		
			end

			if ((not Mission.rockslide_shot3_over) and (Mission.rockslide_shot3_overtime < GetTime())) then
			
				CameraFinish()
				StopEarthQuake()
				Mission.vo19time = (GetTime() +1)
				Mission.rockslide_shot3 = true
				Mission.rockslide_shot3_over = true
			end

			if ((not Mission.vo19) and (Mission.vo19time < GetTime())) then
			
				AudioMessage("scion0119.wav") --Hauler here, our path has been blocked by Mission.a landslidenot   Looks like an ambushnot  	
				Mission.rockslideambushtime = (GetTime() + 7)		--("What was thatnot ?  We just lost the routenot   A Mission.landslide-")
				Mission.rockslide_sequence_over = true
				Mission.vo19 = true		
			end

		end

		--after Mission.rockslide, ambushers attack
		if ((not Mission.rockslideambush) and (Mission.rockslideambushtime < GetTime())) then
		
			AudioMessage("scion0129.wav") -- Ambushnot   Ambushnot   Protect the haulernot 

			Mission.routeattacker3a = BuildObject("ivscout_vsr",2,"routeattack3a")	
			SetSkill(Mission.routeattacker3a,1)
			Goto(Mission.routeattacker3a,Mission.player)	

			Mission.routeattacker3b = BuildObject("ivscout_vsr",2,"routeattack3b")	
			SetSkill(Mission.routeattacker3b,1)
			Goto(Mission.routeattacker3b,Mission.tug1)	

			Mission.routeattacker3c = BuildObject("ivtank_vsr",2,"routeattack3c")	
			SetSkill(Mission.routeattacker3c,1)
			Goto(Mission.routeattacker3c,Mission.player)
			
			SetObjectiveOff(Mission.nav2)
			Mission.rockslideambush = true
		end
	--when Mission.rockslide ambushers are dead
		if ((not Mission.rockslideambushersdead) and (Mission.rockslideambush) and (not IsAlive(Mission.routeattacker3a) and
		   (not IsAlive(Mission.routeattacker3b) and (not IsAlive(Mission.routeattacker3c))))) then
		
			Mission.vo20time = (GetTime() + 8)
			Mission.rockslideambushersdead = true
		end

		if ((not Mission.vo20) and (Mission.vo20time < GetTime())) then
		
			Mission.msg20 = AudioMessage("scion0120.wav")	--Hmm, our geologic data of the planet indicates that the surface should be perfectly stable in that area.  Cook, something is not right here.  I want you to hop out of your tank and take Mission.a close look and the Mission.landslide area. 
			Mission.vo20 = true
		end

		if ((not Mission.obj9) and (Mission.vo20) and (IsAudioMessageDone(Mission.msg20))) then
		
			ClearObjectives()
			AddObjective("scion0109.otf", "WHITE")  --Investigate the Mission.landslide area on foot.
			Mission.obj9 = true
		end
	--when Mission.player jumps out of tank, and is near the Mission.rockslide area, CINERACTIVE trigger
		if ((not Mission.playeronfoot) and (Mission.vo20) and (IsOdf(Mission.player,"fsuser") and
		   (GetDistance(Mission.player,Mission.landslide) < 125)))  then
		
			--swapping Mission.landslide with collision for Mission.a one without so the little pilot can get through (meslidea2 for meslidea3)
			pos_land2 = GetTransform(Mission.landslide)
			RemoveObject(Mission.landslide)
			Mission.landslide = BuildObject("meslida3",0,pos_land2)
			--

			--stoping shabs voice telling Mission.player to investigate Mission.landslide on foot if Mission.player jumps out of tank b4 she is finished then
			if ((Mission.vo20) and (not IsAudioMessageDone(Mission.msg20))) then
			
				StopAudioMessage(Mission.msg20)
			end
			Mission.playeronfoot = true
		end

	------------------------------------/
	--****START ON_FOOT CINERACTIVE****--
	------------------------------------/
		if ((not Mission.on_foot_cin_over) and (Mission.playeronfoot)) then
		
			if (not Mission.on_foot_shot1) then
			
				if (not Mission.setup_on_foot_shot1) then
				
					Mission.pilo_on_foot = BuildObject("fspilo",0,"pilo_on_foot_spawn")
					Mission.amini = BuildObject("fvsent_vsr",5,"amini_spawn")
					SetIndependence(Mission.amini,0)
					CameraReady()
					Mission.setup_on_foot_shot1 = true
				end

				if ((not Mission.pilo_go1) and (Mission.setup_on_foot_shot1)) then
				
					Retreat(Mission.pilo_on_foot,"pilo_on_foot_path1")
					Mission.pilo_go1 = true
				end

			--	CameraPath("on_foot_campath1",200,0,Mission.pilo_on_foot)
				CameraObject(Mission.pilo_on_foot,0,-1,-3,Mission.pilo_on_foot)

				if ((not Mission.pilo_stop1) and (Mission.pilo_go1) and (GetDistance(Mission.pilo_on_foot,"pilo_on_foot_endpath1") < 5)) then
				
					Stop(Mission.pilo_on_foot)
					LookAt(Mission.pilo_on_foot,Mission.amini)
					Mission.amini_gotime = (GetTime() + 5)
					Mission.pilo_stop1 = true
					Mission.on_foot_shot1 = true
				end
			end

			if ((not Mission.on_foot_shot2) and (Mission.on_foot_shot1)) then
			
				CameraPath("behind_pilo",10,0,Mission.amini)

				if ((not Mission.amini_go) and (Mission.amini_gotime < GetTime())) then
				
					Mission.on_foot_shot2_overtime = (GetTime() + 11)
					Retreat(Mission.amini,"amini_path1")
					AudioMessage("cutsc0206.wav") --cooke = it looks like Mission.a scion ship, but those marking....they aren't from The Collective
					Mission.amini_go = true
				end

				if (Mission.on_foot_shot2_overtime < GetTime()) then
				
					Mission.pilo_go2time = (GetTime() + 1)
					Mission.on_foot_shot2 = true
				end
			end

			if ((not Mission.on_foot_shot3) and (Mission.on_foot_shot2)) then
			
				CameraPath("on_foot_campath1",200,0,Mission.pilo_on_foot)

				if ((not Mission.pilo_go2) and (Mission.pilo_go2time < GetTime())) then
				
					Mission.on_foot_shot3_overtime = (GetTime() + 6)
					Retreat(Mission.pilo_on_foot,"pilo_on_foot_path2")
					Mission.pilo_go2 = true
				end

				if ((Mission.on_foot_shot3_overtime < GetTime())) then
				
					RemoveObject(Mission.pilo_on_foot)
					RemoveObject(Mission.amini)
					Mission.vo22time = (GetTime() + 5)

					--swapping Mission.landslide without collision, puttin in collision one
					pos_land3 = GetTransform(Mission.landslide,pos_land3)
					RemoveObject(Mission.landslide)
					Mission.landslide = BuildObject("meslida4",0,pos_land3)
					--

					CameraFinish()
					Mission.on_foot_shot3 = true
					Mission.on_foot_cin_over = true
				end
			end
		end

		if ((not Mission.vo22) and (Mission.vo22time < (GetTime()))) then
		
			Mission.msg22 = AudioMessage("scion0122.wav")	-- i don't know who that was...lets just say i don't think that Mission.landslide was Mission.a "natural phenomenon".
			Mission.obj7time = (GetTime() + 6)
			Mission.vo22 = true
		end

		if ((not Mission.obj7) and (Mission.vo22) and (IsAudioMessageDone(Mission.msg22))) then
		
			SetObjectiveOn(Mission.nav2)
			tempstr = TranslateString("MissionS0102")  -- Nav 2
			SetObjectiveName(Mission.nav2,tempstr)
			Stop(Mission.tug1,0) 
			Mission.emptygroup = GetFirstEmptyGroup()
			SetGroup(Mission.tug1,Mission.emptygroup)
			SetObjectiveOff(Mission.tug1)
			ClearObjectives()
			AddObjective("scion0107.otf", "WHITE")--find an alt route for the hauler
			Mission.routeattacker4a = BuildObject("ivscout_vsr",2,"routeattack4a")
			Mission.routeattacker4b = BuildObject("ivatank_vsr",2,"routeattack4b")
			SetSkill(Mission.routeattacker4a,0)
			SetSkill(Mission.routeattacker4b,1)
			LookAt(Mission.routeattacker4a,Mission.player)
			LookAt(Mission.routeattacker4b,Mission.player)
			Mission.obj7 = true
		end

		if ((not Mission.kill1) and (Mission.obj7) and (GetDistance(Mission.player,Mission.routeattacker4a) < 150)) then
		
			Attack(Mission.routeattacker4a,Mission.player)
			Mission.kill1 = true
		end

		if ((not Mission.kill2) and (Mission.obj7) and (GetDistance(Mission.player,Mission.routeattacker4b) < 150)) then
		
			Attack(Mission.routeattacker4b,Mission.player)
			Mission.kill2 = true
		end
		

		--When the tug reaches the rendezvous point, Mission.dropship comes down and picks it up
		if ((not Mission.rondevous2) and (Mission.obj7) and (GetDistance(Mission.tug1,"nav2") < 75))  then
																	   
			Mission.msg21 = AudioMessage("scion0121.wav") -- Epsilon wing reporting, we have visual on the Hauler and are takin it from here 
			SetObjectiveOff(Mission.nav2)
			Mission.dropship_landtime = (GetTime() + 3)
			Retreat(Mission.tug_cin,"tug_end_path",1) --getting tug positioned to go inside drop ship
			Mission.rondevous2 = true
		end

		if ((not Mission.checkmsg21done) and (Mission.rondevous2) and (IsAudioMessageDone(Mission.msg21))) then
		
			Mission.vo35time = (GetTime() + 2)
			Mission.checkmsg21done = true
		end

		if ((not Mission.vo35) and (Mission.vo35time < GetTime())) then
		
			AudioMessage("scion0135.wav") --excellent work, john, i knew you could do it
			Mission.vo35 = true
		end

		--controlling the Mission.dropship that picks up the tug
		if ((not Mission.dropship_sequence_over) and (Mission.rondevous2)) then
			--telling ship to Mission.land
			if ((not Mission.land) and (Mission.dropship_landtime < GetTime())) then
			
				Mission.dropship = BuildObject("fvdrop_land",1,"dropship")	
				SetAnimation(Mission.dropship,"land",1)
				Mission.swap_dropshiptime = (GetTime() + 15)
				Mission.land = true
			end
			--swapping ships
			if ((not Mission.swap) and (Mission.swap_dropshiptime < GetTime())) then
			
				RemoveObject(Mission.dropship)
				Mission.dropship = BuildObject("fvdrop",1,"dropship")	
				Mission.doors_opentime = (GetTime() + 1)
				Mission.swap = true		
			end
			--opening doors
			if ((not Mission.doors_open) and (Mission.doors_opentime < GetTime())) then
			
				SetAnimation(Mission.dropship,"deploy",1)	
				Mission.move_into_dropshiptime = (GetTime() + 4)
				Mission.doors_open = true
				PrintConsoleMessage("doors opened")
			end
			--moving units into Mission.dropship
			if ((not Mission.move_into_dropship) and (Mission.move_into_dropshiptime < GetTime())) then
			
				Retreat(Mission.escort2a,"dropship")
				Mission.move_into_dropshiptime2 = (GetTime() + 2)
				Mission.move_into_dropship = true
				PrintConsoleMessage("retreat1")
			end

			if ((not Mission.move_into_dropship2) and (Mission.move_into_dropshiptime2 < GetTime())) then
			
				Retreat(Mission.escort2b,"dropship")
				Mission.move_into_dropshiptime3 = (GetTime() + 2)
				Mission.move_into_dropship2 = true
				PrintConsoleMessage("retreat2")
			end

			if ((not Mission.move_into_dropship3) and (Mission.move_into_dropshiptime3 < GetTime())) then
			
				Retreat(Mission.tug1,"dropship")
				Mission.move_into_dropship3 = true
				PrintConsoleMessage("retreat3")
			end
			--removing units once they enter Mission.dropship
			if ((not Mission.remove_escort2a) and (Mission.move_into_dropship2) and (GetDistance(Mission.escort2a,"dropship") < 5)) then
			
				RemoveObject(Mission.escort2a)
				Mission.remove_escort2a = true
				PrintConsoleMessage("remove1")
			end
	
			if ((not Mission.remove_escort2b) and (Mission.move_into_dropship) and (GetDistance(Mission.escort2b,"dropship") < 5)) then
			
				RemoveObject(Mission.escort2b)
				Mission.remove_escort2b = true	
				PrintConsoleMessage("remove2")
			end
		
			if ((not Mission.remove_tug1) and (Mission.move_into_dropship3) and (GetDistance(Mission.tug1,"dropship") < 5)) then
			
				RemoveObject(Mission.tug1)
				RemoveObject(Mission.power)  
				Mission.remove_tug1 = true	
				PrintConsoleMessage("remove3")
			end		

			--Mission.dropship taking off
			if ((not Mission.all_aboard) and (Mission.remove_escort2a) and (Mission.remove_escort2b) and (Mission.remove_tug1)) then
			
				SetAnimation(Mission.dropship,"takeoff",1)	
				Mission.dropship_endcintime = (GetTime() + 12)--this will end the CIN and the mission
				SucceedMission(GetTime() + 12,"scion01w1.txt")
				Mission.take_off_soundtime = (GetTime() + 4)
				Mission.all_aboard = true
				PrintConsoleMessage("take off")
			end	

			--play Mission.dropship taking off sound
			if ((not Mission.take_off_sound) and (Mission.take_off_soundtime < GetTime())) then
			
				AudioMessage("droptoff.wav")
				Mission.take_off_sound = true
			end
			
			--camera controls
			if ((not Mission.dropship_shot1) and (Mission.rondevous2)) then
			
				if (not Mission.dropship_rdycam1) then
				
					CameraReady()
					Mission.dropship_rdycam1 = true
				end

				CameraPath("dropship_cam1",5000,0,Mission.dropship_cam1look)

				if ((not Mission.dropship_endcin) and (Mission.dropship_endcintime < GetTime())) then
				
					CameraFinish()
					Mission.dropship_sequence_over = true
					Mission.dropship_endcin = true
					Mission.dropship_shot1 = true
				end			
			end
		end

	--[[	if (Mission.rondevous2) then
		
			if (not Mission.convoygo2) then
			
				Retreat(Mission.escort2a,"leave")
				Follow(Mission.tug1,Mission.escort2a)
				Follow(Mission.escort2b,Mission.tug1)
				Mission.convoygo2 = true
			end
			
			if (not Mission.winmission) then
			
				SucceedMission(GetTime() + 30)
				Mission.obj8time = (GetTime() + 8)
				Mission.winmission = true
			end
		end
		
		if ((not Mission.obj8) and (Mission.obj8time < GetTime())) then
		
			ClearObjectives()
			AddObjective("scion0108.otf", "WHITE")
			Mission.obj8 = true
		end]]

--This is spawning in some jaks near the ruins if Mission.player gets out of his tank near the ruins then
	if ((not Mission.suprise_jaks) and (IsOdf(Mission.player,"fsuser") and (GetDistance(Mission.player,"suprise_jak1") < 150))) then
	
		Mission.suprise_jak1 = BuildObject("mcjak01",0,"suprise_jak1")	
		Mission.suprise_jak2 = BuildObject("mcjak01",0,"suprise_jak2")	
		Mission.suprise_jak3 = BuildObject("mcjak01",0,"suprise_jak3")	
		Attack(Mission.suprise_jak1,Mission.player)
		Attack(Mission.suprise_jak2,Mission.player)
		Attack(Mission.suprise_jak3,Mission.player)
		Mission.suprise_jaks = true
	end

	--***MISSION FAIL CONDITIONS***----

	-- If Shabayev ever dies, mission is lost
		if ((not Mission.shabdead) and (Mission.vo1) and (not IsAlive(Mission.shab))) then
		
			FailMission(GetTime() + 15,"scion01L2.txt")
			ClearObjectives()
			AddObjective("scion0105.otf", "WHITE")
	
	--this will stop Mission.shab from talking if she is every killed while talking then
		if ((Mission.vo1) and (not IsAudioMessageDone(Mission.msg1))) then
		
			StopAudioMessage(Mission.msg1)
		end

		if ((Mission.vo6) and (not IsAudioMessageDone(Mission.msg6))) then
		
			StopAudioMessage(Mission.msg6)
		end

		if ((Mission.vo2) and (not IsAudioMessageDone(Mission.msg2))) then
		
			StopAudioMessage(Mission.msg2)
		end

		if ((Mission.warned1) and (not IsAudioMessageDone(Mission.stall))) then
		
			StopAudioMessage(Mission.stall)
		end

		if ((Mission.warned2) and (not IsAudioMessageDone(Mission.stall2))) then
		
			StopAudioMessage(Mission.stall2)
		end

		if ((Mission.vo3) and (not IsAudioMessageDone(Mission.blah1))) then
		
			StopAudioMessage(Mission.blah1)
		end

		if ((Mission.vo34) and (not IsAudioMessageDone(Mission.msg34))) then
		
			StopAudioMessage(Mission.msg34)
		end

		if ((Mission.vo10) and (not IsAudioMessageDone(Mission.msg3))) then
		
			StopAudioMessage(Mission.msg3)
		end
			Mission.vo1 = true
			Mission.vo6 = true
			Mission.vo2 = true
			Mission.warned1 = true
			Mission.warned2 = true
			Mission.vo3 = true
			Mission.vo34 = true
			Mission.vo10 = true


			Mission.shabdead = true
		end
		
	--if tug is ever destroyed, mission failed then
		if ((not Mission.tugkilled) and (Mission.tugpickuppower) and (not Mission.rondevous2) and (not IsAround(Mission.tug1))) then
		
			FailMission(GetTime() + 15,"scion01L3.txt")
			AudioMessage("scion0117.wav")-- Dammit Cooke, you let the tug get destroyednot 
			ClearObjectives()
			AddObjective("scion0104.otf", "WHITE")
			Mission.tugkilled = true
		end

	--if the powersource is killed, mission failed then
		if ((not Mission.powerkilled) and (Mission.tugpickuppower) and (not Mission.rondevous2) and (not IsAround(Mission.power))) then
				
			Mission.vo25time = (GetTime() + 3)
			Mission.powerkilled = true
		end

		if ((not Mission.vo25) and (Mission.vo25time < GetTime())) then
		
			Mission.msg25 = AudioMessage("scion0125.wav") -- Dammit Cooke, you let the Mission.power get destroyed
			Mission.vo25 = true
		end

		if ((not Mission.obj11) and (Mission.vo25) and (IsAudioMessageDone(Mission.msg25))) then
		
			ClearObjectives()
			AddObjective("scion0111.otf", "WHITE")	
			FailMission(GetTime() + 5,"scion01L4.txt")
			Mission.obj11 = true
		end

		--if the Mission.player's recycler is ever destroyed then --MISSION FAILED then
		if ((not Mission.playersrecy_dead) and (not IsAround(Mission.playersrecy))) then
		
			Mission.vo_recydeadtime = (GetTime() + 3)
			Mission.playersrecy_dead = true
		end

		if ((not Mission.vo_recydead) and (Mission.vo_recydeadtime < GetTime())) then
		
			Mission.vofail1 = AudioMessage("scion0131.wav")--Dammit cooke, the recycler has been destroyed
			Mission.vo_recydead = true
		end

		if ((not Mission.obj12) and (Mission.vo_recydead) and (IsAudioMessageDone(Mission.vofail1))) then
		
			ClearObjectives()
			AddObjective("scion0112.otf", "WHITE")
			FailMission(GetTime() + 6,"scion01L5.txt")
			Mission.obj12 = true
		end
	end
end