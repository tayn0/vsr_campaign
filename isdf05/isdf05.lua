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
	out_of_range = false,
	out_of_ship = false,
	in_combat = false,
	fire_message = false,

	patrol_phase = false,  -- while you patrol
	scout_phase = false,  -- while you scout
	attack_phase = false,
	get_mbike = false,		-- you get mbikes to destroy turret
	turrets_destroyed = false,  -- turrets destroyed
	been_north = false,
	been_south = false,
	been_east = false,
	been_west = false,
	found_field1 = false,
	found_field2 = false,
	found_field3 = false,
	scav1_deployed = false,
	scav2_deployed = false,
	killed_turrets = false,
	manson_message = false,
	gun_tower_message = false,  -- got gun tower message
	hop_out_message = false,
	warning_message = false,
	teleport_blown = false,
	wait_up = true,
	power2 = true,
	drop_off = false,
	com1 = false,
	factory = false,
	out_of_ship_ever = false,  -- if you ever get out of your ship then
	shab_dead = false,
	wasDead1 = false,
	wasDead2 = false,
	MoviePlaying = false,

	--  floats
	fire_reset = 1.0,
	range_check = 999999.9,

	--  handles
	player,
	--	player_ship,
	--	recycler,
	--	wingman1,
	off_power,
	off_service,
	teleportal,
	--	empty_scav1,
	--	empty_scav2,
	--	empty_scav3,
	--	empty_construct1,
	--	empty_construct2,
	--	empty_construct3,
	--	recycler2,
	recy,
	shabayev,
	pool1,
	pool2,
	condor1,
	sturret1,
	sturret2,
	sturret3,
	sturret4,
	sturret5,
	sturret6,
	minion1,
	minion2,


	lurker1,
	lurker2,
	lurker3,
	lurker4,
	gun1,
	scav_comp,

	scav1,
	scav2,
	manson,
	nav1,
	nav2,
	atk1,
	pgen1,
	pgen2,
	cbunker,
	constructor,
	--  integers
	mission_state = 0,
	raid_count = 0,
	wait_count = 0,
	ReallyKillCineractive = 0,
	gun_tower_counter
   
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
	SetTeamColor(3,0,127,255)  --Blue
	
	SetAutoGroupUnits(false)
	--[[
	Here's where you set the values at the start.  
	]]
	Ally(3,1)
	Ally(1,3)
	
	--  handles
	Mission.player = GetPlayerHandle()
	Mission.condor1 = GetHandle("unnamed_ivpdrop2")
	Mission.off_power = GetHandle("off_power")
	Mission.off_service = GetHandle("off_service")
	Mission.teleportal = GetHandle("unnamed_ibtele")


	Mission.pool1 = GetHandle("pool1")
	Mission.pool2 = GetHandle("pool2")
	

	Mission.sturret1 = GetHandle("sturret1")
	Mission.sturret2 = GetHandle("sturret2")
	Mission.sturret3 = GetHandle("sturret3")
	Mission.sturret4 = GetHandle("sturret4")
	Mission.sturret5 = GetHandle("sturret5")
	Mission.sturret6 = GetHandle("sturret6")
	Mission.gun1 = GetHandle("gun1")

	Mission.lurker1 = nil
	Mission.lurker2 = nil
	Mission.lurker3 = nil
	Mission.lurker4 = nil

	Mission.scav1 = nil
	Mission.scav2 = nil
	Mission.manson = nil
	Mission.nav1 = nil
	Mission.nav2 = nil
	Mission.atk1 = nil
	Mission.pgen1 = nil
	Mission.pgen2 = nil
	Mission.cbunker = nil
	
	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	
	Mission.sturret1 = UnitToVSR(Mission.sturret1, "fvturr_vsr", 0)
	Mission.sturret2 = UnitToVSR(Mission.sturret2, "fvturr_vsr", 0)
	Mission.sturret3 = UnitToVSR(Mission.sturret3, "fvturr_vsr", 0)
	Mission.sturret4 = UnitToVSR(Mission.sturret4, "fvturr_vsr", 0)
	Mission.sturret5 = UnitToVSR(Mission.sturret5, "fvturr_vsr", 0)
	Mission.sturret6 = UnitToVSR(Mission.sturret6, "fvturr_vsr", 0)
	
	Mission.ivscav1 = UnitToVSR(GetHandle("ivscav1"), "ivscav_vsr", 0)
	RemovePilot(Mission.ivscav1)
	
	Mission.ivscav2 = UnitToVSR(GetHandle("ivscav2"), "ivscav_vsr", 0)
	RemovePilot(Mission.ivscav2)

	GiveWeapon(Mission.player,"gproxminvsr")
	
	Mission.scav_comp = UnitToVSR(GetHandle("scav3"), "ivscav_vsr", 0)
	
	PreloadODF("fvsent_vsr")
	PreloadODF("ivtank_vsr")
	PreloadODF("fvtank_vsr")
   
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


	if (IsOdf(h,"ibrec5_vsr")) then
	
		Mission.recy=h
	end
	if (IsOdf(h,"ibpgen")) then
	
		if (not Mission.pgen1) then
		

			Mission.pgen1=h
			--			Follow(Mission.shabayev,Mission.pgen1)
			Stop(Mission.shabayev,1)
			SetIndependence(Mission.shabayev,1)
		
		else 
		
			Stop(Mission.shabayev,1)
			Mission.pgen2=h
		end
	end
	if (IsOdf(h,"ibcbun")) then
	
		Mission.cbunker=h
		Stop(Mission.shabayev,1)
	end
	if (Mission.start_done) then
	
		if ((Mission.scav1  == nil) and (IsOdf(h,"ivscav_vsr")) or IsOdf(h, "ivscav_vsr:1")) then
		
			Mission.scav1 = h
		
		elseif ((Mission.scav2 == nil) and (IsOdf(h,"ivscav_vsr:1"))) then
		
			Mission.scav2 = h
		
		elseif ((Mission.scav3==nil) and (IsOdf(h,"ivscav_vsr:1"))) then
		
			Mission.scav3=h
		
		elseif ((scav4==nil) and (IsOdf(h,"ivscav_vsr:1"))) then
		
			scav4=h
		
		elseif (IsOdf(h,"ibscav_vsr"))  then
		
			if (not Mission.scav1_deployed) then
				PrintConsoleMessage("scav1 deployed")
				Mission.scav1_deployed=true
			
			else
				PrintConsoleMessage("scav2 deployed")
				Mission.scav2_deployed=true
			end
		end

	end
	if ((IsOdf(h,"satchel1")) and Mission.mission_state >=9)  then
		--Goto(Mission.manson,"manson_path1",1)
		Retreat(Mission.manson,"manson_path2",0,1)
		SetIndependence(Mission.minion1,0)
		SetIndependence(Mission.minion2,0)
		AudioMessage("isdf0542.wav")
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
	--[[
	a) The Mission.player is asked to patrol around the base

	(through steps b-d sent and scouts attack)

	b) Once the base is secure, the Mission.player is supposed
	to look for scrap veins and send a scavenger (twice)

	c)Eventually you get to some turrets.  
	Shebayev detaches some mortar bikes to help you take 
	out the turrets.  

	d) Once the turrets are destroyed you need to
	deploy

	e) Follow Manson to the teleporter?  Drop off a bomb
	]]
	nearguy = 0
	-- this is the start of the mission
	if (not Mission.start_done) then
	

		--[[
		Alright Sgt Cooke, this looks like
		a good place to establish a base.  
		Patrol the area around this recycler.  
		If it looks safe, deploy the recycler.  
		]]
		Mission.shabayev = BuildObject("ivtan5",1,"shab_start")--"patrol_east")
		Mission.constructor = BuildObject("ivcon5_vsr",1,"spawn_constructor")
		Stop(Mission.constructor,1)

		
		SetGroup(Mission.scav_comp,-1)
		temppool=GetHandle("poolx")
		Goto(Mission.scav_comp,temppool,1)
		--	SetAIP("isdf05.aip",3)  -- build stuff
		AudioMessage("isdf0500.wav")
		SetObjectiveOn(Mission.shabayev)
		SetObjectiveName(Mission.shabayev,"Cmdr. Shabayev")


		audmsg=AudioMessage("isdf0501.wav")
		Mission.patrol_phase=true
		Mission.start_done = true


		--		Handle fv=BuildObject("fvarch",2,"scrap_field1")
		--		SetSkill(fv,3)
		SetSkill(Mission.shabayev,3)
		--		Patrol(Mission.shabayev,"patrol1",1)
		--		Attack(Mission.shabayev,fv,1)
		Mission.recy=BuildObject("ivrec5_vsr",1,"recy_start")
		--		Goto(Mission.recy,"recy_deploy")
		Dropoff(Mission.recy, "recy_deploy")
		Follow(Mission.shabayev,Mission.recy,1)
		SetScrap(1,40)
		SetScrap(3,40)  -- allied resources
		
		SetAnimation(Mission.condor1,"takeoff",1)
		StartSoundEffect("dropleav.wav",Mission.condor1)
	end

	Mission.player = GetPlayerHandle()
	if ((not IsAlive(Mission.shabayev) and (not Mission.shab_dead))) then
	
		AudioMessage("isdf0732.wav")
		ClearObjectives()
		AddObjective("isdf05l1.otf","RED",15.0)
		FailMission(GetTime()+5.0,"isdf05l1.otf")
		Mission.shab_dead=true
	end

	-- determining if the Mission.player is out of his ship then
	if (IsOdf(Mission.player,"ispilo")) then
	
		if (not Mission.out_of_ship) then 
		GiveWeapon(Mission.player, "igsatc")
		Mission.out_of_ship = true
		end
	
	else
	
		Mission.out_of_ship = false
	end

	if ((GetDistance(Mission.player,"spawn2")<150.0) and (not Mission.warning_message)) then
	
		AudioMessage("isdf0520.wav")
		--[[
		Stay away from those alien structures
		they aren't 
		vital to our mission-
		but they may be dangerous. 
		]]
		Mission.warning_message=true
	end
	-- this is checking to make sure the Mission.player does not attack his wingman --------/
	if ((not Mission.in_combat) and (not Mission.fire_message)) then
	
		if ((IsAlive(Mission.shabayev)) and (IsAlive(Mission.player))) then
		
			if (GetTime() - GetLastFriendShot(Mission.shabayev) < .2) then
			
				AudioMessage("ff01.wav") -- (shab) watch your firingnot 
				Mission.fire_reset = GetTime() + 2.0
				Mission.fire_message = true
			end
		end

		if ((IsAlive(Mission.manson)) and (IsAlive(Mission.player))) then
		
			if (GetTime() - GetLastFriendShot(Mission.manson) < .2) then
			
				AudioMessage("isdf0555.wav") -- (Mission.manson) watch your firingnot 
				Mission.fire_reset = GetTime() + 2.0
				Mission.fire_message = true
			end
		end
	end

	if ((Mission.fire_message) and (Mission.fire_reset < GetTime())) then
	
		Mission.fire_reset = GetTime() + 999999.9
		Mission.fire_message = false
	end
	if ((not IsAlive(Mission.constructor)) and (Mission.mission_state<10)) then
	
		-- the constructor is dead, you lose
		Mission.mission_state=12
	end

	
	if (Mission.mission_state == 0 ) then

		-- Shabayev starts the base
		if (GetDistance(Mission.recy,"recy_deploy") < 25.0) then
		
			--				Dropoff(Mission.recy,"recy_deploy")
			Patrol(Mission.shabayev,"patrol1",1)
			SetIndependence(Mission.shabayev,1)
			ClearObjectives()
			AddObjective("isdf0501.otf", "WHITE", 10.0)
			patrol_reminder_time=GetTime()+30.0
			Mission.MoviePlaying=true
			CameraReady()
			-- but danger looms..
			Mission.atk1=BuildObject("fvscout_vsr",2,"spawn1")
			Mission.wasDead1=false
			Attack(Mission.atk1,Mission.player)
			Mission.mission_state = Mission.mission_state + 1
		end
		

	elseif (Mission.mission_state == 1) then 

		if (Mission.MoviePlaying) then
		
			--CameraObject(recycler,5,5,5,recycler)
			Mission.MoviePlaying = PlayMovie("isdf0501.cin")	
			--		if (IsAudioMessageDone(audmsg))  then
			if (not Mission.MoviePlaying) then
			
				--	Mission.MoviePlaying=false
				CameraFinish()
				PrintConsoleMessage("power cmd")
				Build(Mission.constructor,"ibpge5",1)
				
				Mission.drop_off=true
				Attack(Mission.shabayev,Mission.atk1)
				Mission.mission_state = Mission.mission_state + 1
			end
		end
		Mission.ReallyKillCineractive = 0
		

	elseif (Mission.mission_state == 2) then

		-- Kick this out a few extra times.
		if((Mission.ReallyKillCineractive == 0) or (Mission.ReallyKillCineractive == 10) or 
			(Mission.ReallyKillCineractive == 20)) then 
			CameraFinish()
		Mission.ReallyKillCineractive = Mission.ReallyKillCineractive + 1
		end 
		
		if (Mission.drop_off) then
			PrintConsoleMessage("power1 build")

			--Follow(Mission.constructor, Mission.player)

			Dropoff(Mission.constructor,"pgen1",2)

			Mission.drop_off = false
			temp=GetHandle("unnamed_ivdrop")
			Attack(Mission.shabayev,Mission.atk1,1)
			RemoveObject(temp)
		end

		if (not IsAlive(Mission.atk1)) then
		
			Mission.wait_count = Mission.wait_count + 1
			if (Mission.wait_count==50) then
			
				Mission.wasDead1=false
				Mission.wasDead2=false
				raid1=BuildObject("fvsent_vsr",2,"raid1")
				Goto(raid1,Mission.recy)
				raid2=BuildObject("fvtank_vsr",2,"raid2")
				Goto(raid2,Mission.recy)
				--				raid3=BuildObject("fvsent_vsr",2,"raid3")
				--				Goto(raid3,Mission.recy)
				--				raid4=BuildObject("fvtank_vsr",2,"raid4")
				--				Goto(raid4,Mission.recy)
				ClearObjectives()
				AddObjective("isdf0517.otf","WHITE",10.0)
				Follow(Mission.shabayev,Mission.constructor)
				AudioMessage("isdf0543.wav")
				Mission.mission_state = Mission.mission_state + 1
				Mission.wait_count=0
			end
		end
		

	elseif (Mission.mission_state == 3) then

	--x = tostring(Mission.power2)
	--PrintConsoleMessage(x)
		if (Mission.power2) then
			PrintConsoleMessage("power2 build")
			Dropoff(Mission.constructor,"pgen2",2)
			Mission.power2=false
		end
		if (Mission.com1) then
		
			Dropoff(Mission.constructor,"rbunker1",1)
			Mission.com1=false
		end
		if (not IsAliveAndPilot(raid1))  then
			Mission.wasDead1=true	
		end
		if (not IsAliveAndPilot(raid2))  then
			Mission.wasDead2=true
		end
		if ((Mission.wasDead1) and (Mission.wasDead2)) then
		
			if (Mission.raid_count==1)  then -- should be 2 then
			
				--[[
				Now look for scrap veins
				around the base.  
				If you find one mark it with 
				a nav beacon.  
				]]
				Mission.scout_phase=true
				ClearObjectives()
				AddObjective("isdf0507.otf","WHITE",5.0)
				SetObjectiveOff(Mission.shabayev)
				Mission.nav1=BuildObject("ibnav",1,"scrap_field1")
				tempstr = TranslateString("Mission0501")  -- tempstr
				SetObjectiveName(Mission.nav1,tempstr)
				SetObjectiveOn(Mission.nav1)
				--					SetObjectiveName(Mission.pool1,"bio-metal")
				--					SetObjectiveOn(Mission.pool1)

				AudioMessage("isdf0507.wav")	
				-- Add an attacked for spice
				Mission.atk1=BuildObject("fvscout_vsr",2,"spawn1")
				Goto(Mission.atk1,"attack1")
				Patrol(Mission.shabayev,"patrol1",1)
				SetIndependence(Mission.shabayev,1)
				-- AudioMessage(
				-- You go on John, I'll guard the base
				Mission.mission_state = Mission.mission_state + 1
			
			else
			
				Mission.wait_count = Mission.wait_count + 1
				if (Mission.wait_count==400) then
				
					if  (Mission.pgen2==nil) then
						
						-- was follow
						Goto(Mission.shabayev,Mission.constructor,1)
						Build(Mission.constructor,"ibpge5")
						Mission.power2=true
					
					else 
					
						--was Follow
						PrintConsoleMessage("com build")
						Goto(Mission.shabayev,Mission.constructor,1)
						Build(Mission.constructor,"ibcbu5")
						Mission.com1=true
					end
					Mission.raid_count = Mission.raid_count + 1
					AddHealth(Mission.constructor,500)
					AddHealth(Mission.shabayev,500)
					raid1=BuildObject("fvtank_vsr",2,"raid1")
					Goto(raid1,Mission.recy)
					raid2=BuildObject("fvtank_vsr",2,"raid2")
					Goto(raid2,Mission.recy)
					Mission.wasDead1=false
					Mission.wasDead2=false
					--					raid3=BuildObject("fvsent",2,"raid3")
					--					Goto(raid3,Mission.recy)
					--					raid4=BuildObject("fvtank",2,"raid4")
					--					Goto(raid4,Mission.recy)
					Mission.wait_count=0
				end
			end
		end

		

	elseif (Mission.mission_state == 4) then 
	PrintConsoleMessage("missionstate 4")
		-- there is one, mark it with the geyser
		-- mark that with a power up
		-- good, now find another.  
		if ((GetDistance(Mission.player,Mission.pool1)<75.0) and (not Mission.found_field1)) then
		
			-- there is a field, deploy the scavenger

			AudioMessage("isdf0508.wav")
			Mission.found_field1=true
		end
		if (Mission.scav2_deployed) then -- any scav is deployed then
		
			Mission.mission_state = Mission.mission_state + 1
			Mission.scav1_deployed=true
			ClearObjectives()
			AddObjective("isdf0508.otf","WHITE",10.0)
			--[[
			SetObjectiveOff(Mission.pool1)
			SetObjectiveName(Mission.pool2,"bio-metal 1")
			SetObjectiveOn(Mission.pool2)
			]]
			Mission.nav2=BuildObject("ibnav",1,"scrap_field3")
			tempstr = TranslateString("Mission0502")  -- Bio-Metal 2
			SetObjectiveName(Mission.nav2,tempstr)
			SetObjectiveOff(Mission.nav1)
			SetObjectiveOn(Mission.nav2)
			AudioMessage("isdf0509.wav")  -- good job
			if (not Mission.found_field1) then
			
				AudioMessage("isdf0519.wav")
				--[[
				Don't send out scavengers unescorted.  
				Be sure to stay with them.
				]]
			end
		end
		

	elseif (Mission.mission_state == 5) then
	PrintConsoleMessage("missionstate 5")
		if ((Mission.scav2_deployed) and (not Mission.found_field3) and (GetDistance(Mission.player,"scrap_field3")<225.0)) then
		
			Mission.found_field3=true
			--[[
			Watch outnot 
			That field looks hot.  
			]]
			AudioMessage("isdf0512.wav")
			ClearObjectives()
			AddObjective("isdf0511.otf","RED",10.0)
			mortar_delay=GetTime()+15.0
		end
		nearguy=GetNearestEnemy(Mission.player)
		if ((Mission.found_field3) and (GetTime()>mortar_delay)
			and (GetDistance(Mission.player,nearguy)>150.0)) then
		
			--[[
			Cineractive
			Cooke, I'm sending you
			force to help 
			you take out those turretsnot 
			Here are some mortar bikes.  
			]]

			Build(Mission.constructor,"ibfact5_vsr",1)
			Mission.factory=true

			audmsg=AudioMessage("isdf0527.wav")
			--was AudioMessage("isdf0513.wav")
			ClearObjectives()
			AddObjective("isdf0516.otf","WHITE",10.0)
			--[[
			int grp=GetFirstEmptyGroup()			
			mbike1=BuildObject("ivmbike",1,"patrol_south")
			SetGroup(mbike1,grp)
			Follow(mbike1,Mission.player,0)
			Handle mb=BuildObject("ivmbike",1,"patrol_east")
			SetGroup(mb,grp)
			Follow(mb,Mission.player,0)
			mb=BuildObject("ivmbike",1,"patrol_west")
			SetGroup(mb,grp)
			Follow(mb,Mission.player,0)
			mb=BuildObject("ivmbike",1,"patrol_north")
			SetGroup(mb,grp)
			Follow(mb,Mission.player,0)
			]]
			Mission.mission_state = Mission.mission_state + 1
			CameraReady()
			Mission.MoviePlaying=true
		end
		

	elseif (Mission.mission_state == 6) then 
	--PrintConsoleMessage("missionstate 6")
		--[[
		First check to see if you blew up then
		Mission.sturret1-4
		then create Manson
		at manson_start
		"Good job Cooke, you show promise"
		Then follow Manson (he's an objective)
		into the base
		When you get close
		lets run past those towers

		when you get there
		hop out and use your demolition charge

		Then run away.  Everything blows up.  
		]]
		if (Mission.factory) then
		
			Dropoff(Mission.constructor,"fact")
			Mission.factory=false
		end
		if (Mission.MoviePlaying) then
		
			CameraObject(Mission.constructor,1,11,22,Mission.constructor)
			if (IsAudioMessageDone(audmsg)) then
			
				Mission.MoviePlaying=false
				CameraFinish()
			end
		end

		if ((not Mission.killed_turrets) and
			(not IsAlive(Mission.sturret1)) and 
			(not IsAlive(Mission.sturret2)) and
			(not IsAlive(Mission.sturret3)) and (not IsAlive(Mission.sturret4))
			and
			(not IsAlive(Mission.sturret5)) and (not IsAlive(Mission.sturret6))) then
		
			AudioMessage("isdf0514.wav") -- you show promise
			Mission.killed_turrets=true
			ClearObjectives()
			AddObjective("isdf0512.otf","WHITE",10.0)
			manson_shows=GetTime()+10.0
			Mission.manson=BuildObject("ivtank",3,"manson_start")
			SetObjectiveName(Mission.manson, "Maj. Manson")
			Mission.minion1=BuildObject("ivtank",3,"manson_escort1")
			SetObjectiveName(Mission.minion1, "Sgt. Zdarko")
			Follow(Mission.minion1,Mission.manson)
			Mission.minion2=BuildObject("ivtank",3,"manson_escort2")
			SetObjectiveName(Mission.minion2, "Sgt. Masiker")
			Follow(Mission.minion2,Mission.manson)
		end
		if ((Mission.killed_turrets) and (not Mission.manson_message) and 
			(GetTime()>manson_shows)) then
		
			--[[
			We found the objective, 
			follow me
			]]
			AudioMessage("isdf0515.wav")
			SetObjectiveOff(Mission.nav2)
			SetObjectiveOn(Mission.manson)
			ClearObjectives()
			AddObjective("isdf0518.otf","WHITE",10.0)
			Mission.manson_message=true
			Mission.mission_state = Mission.mission_state + 1
		end
		

	elseif (Mission.mission_state == 7) then
		if (GetDistance(Mission.player,Mission.manson)<50.0) then
		
			ClearObjectives()
			AddObjective("isdf0513.otf","WHITE",10.0)
			SetIndependence(Mission.manson,0)
			SetAvoidType(Mission.manson,0)
			AudioMessage("isdf0539a.wav")
			Goto(Mission.manson,"manson_path1")				
			Mission.mission_state = Mission.mission_state + 1
		end	
		

	elseif (Mission.mission_state == 8) then
		AddHealth(Mission.manson,100) -- we don't want him to die here
		if ((Mission.wait_up) and (GetDistance(Mission.player,Mission.manson)<100.0)) then
		
			-- right now this goes off too 
			-- soon.   You go on to path 2 before 1 is doen
			-- But at least it makes sure
			-- you are close once.  
			Mission.wait_up=false
			Goto(Mission.manson,"manson_path2")
		end
		if ((not Mission.gun_tower_message) and (GetDistance(Mission.manson,Mission.gun1)<200.0)) then
		
			--[[
			There are gun towers ahead
			let's try to go past fast.  
			]]
			AudioMessage("isdf0516.wav")
			Mission.gun_tower_message=true
			ClearObjectives()
			AddObjective("isdf0514.otf","WHITE",10.0)
			Mission.gun_tower_counter=0
		end
		if (Mission.gun_tower_message)  then
		
			Mission.gun_tower_counter = Mission.gun_tower_counter + 1
			if (Mission.gun_tower_counter>500)  then -- you are on a timer then
			
				AudioMessage("isdf0529.wav")
				ClearObjectives()
				AddObjective("isdf0520.otf","RED",10.0)
				FailMission(GetTime()+10.0,"isdf0520.otf")
				Mission.mission_state=12
			end
			if (Mission.gun_tower_counter==300) then
			
				--AudioMessage("isdf0528.wav")
			end
		end
		if ((Mission.gun_tower_message) and (not Mission.hop_out_message) and
			(GetDistance(Mission.player,Mission.teleportal)<100.0)) then
		
			--[[ 
			Get out and use your
			demolition charge on
			that building
			]]
			AudioMessage("isdf0173.wav")  -- that looks like one of ours?
			AudioMessage("isdf0517.wav")
			Mission.hop_out_message=true
			SetObjectiveOff(Mission.manson)
			SetObjectiveOn(Mission.teleportal)
			tempstr = TranslateString("Mission0503")  -- Excavator
			SetObjectiveName(Mission.teleportal,tempstr)
			ClearObjectives()
			AddObjective("isdf0515.otf","WHITE",10.0)
			SetIndependence(Mission.manson,1)
			Mission.mission_state = Mission.mission_state + 1
		end
		

	elseif (Mission.mission_state == 9) then
		if ((not Mission.out_of_ship_ever) and (Mission.out_of_ship))  then
			Mission.out_of_ship_ever=true
			ClearObjectives()
			AddObjective("isdf0521.otf","WHITE",5.0)
		end
		if (not IsAlive(Mission.teleportal)) then
		
			if (Mission.out_of_ship_ever) then
			
				AudioMessage("isdf0518.wav")
				SucceedMission(GetTime()+10.0,"isdf05w1.txt")
				Mission.mission_state = Mission.mission_state + 1
			
			else
			
				AudioMessage("isdf0521.wav")
				--[[
				I said use your
				demolition charge
				]]
				FailMission(GetTime()+10.0,"isdfl1.txt")
				Mission.mission_state = Mission.mission_state + 1
			end
		end
		

	elseif (Mission.mission_state == 12) then
		--[[
		If you lose the Mission.constructor
		this condition occurs.  
		]]
		AudioMessage("isdf0522.wav")
		ClearObjectives()
		AddObjective("isdf0519.otf","RED",10.0)
		FailMission(GetTime()+10.0,"isdf0519.otf")
		Mission.mission_state = Mission.mission_state + 1
		
	elseif (Mission.mission_state == 13) then
		-- waiting for the end of the world.  
		
	end



	--[[
	the lurkers
	]]
	if ((Mission.lurker1==nil) and (GetDistance(Mission.player,"lurker1")<150.0)) then
	
		Mission.lurker1=BuildObject("fvsent_vsr",2,"lurker1")
	end
	if ((Mission.lurker2==nil) and (GetDistance(Mission.player,"lurker2")<150.0)) then
	
		Mission.lurker2=BuildObject("fvsent_vsr",2,"lurker1")
	end
	if ((Mission.lurker3==nil) and (GetDistance(Mission.player,"lurker3")<250.0)) then
	
		Mission.lurker3=BuildObject("fvsent_vsr",2,"lurker3")
	end
	if ((Mission.lurker4==nil) and (GetDistance(Mission.player,"lurker4")<250.0)) then
	
		Mission.lurker4=BuildObject("fvsent_vsr",2,"lurker4")
	end

end