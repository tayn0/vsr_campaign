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
	-- bools
		b_first,
		botched_rescue,
		start_done,
		b_last,

	-- floats
		f_first,
		shab_message,
		get_going,
		machine_time1,
		machine_time2,
		f_last,

	-- handles
		h_first,
		aud,
		apc1,
		player,
		ruin,
		objective,
		atk1,
		atk2,
		shabayev,
		nav,
		machine,
		crystal,
		turr1,
		turr2,
		turr3,
		turr4,
		h_last,
		sent,
		temp,


	-- integers
		i_first,
		shab_state,   -- your progress in rescuing shab, independent of the mission
		mission_state,  -- your progree in the mission
		ruin_cam,
		i_last,
   
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

--  bools
	Mission.botched_rescue = false

	
--  floats
	Mission.shab_message = GetTime()+95.0  -- was 30
	Mission.get_going = 370.0  -- get going to that base Sgtnot 
	
--  handles
	Mission.ruin = GetHandle("ruins")
	Mission.objective = GetHandle("objective")
	Mission.player = GetPlayerHandle()
	Mission.misl1 = GetHandle("missile1")
	Mission.misl2 = GetHandle("missile2")
	Mission.misl3 = GetHandle("missile3")
	Mission.tank1 = GetHandle("tank1")
	Mission.tank2 = GetHandle("tank2")
	Mission.tank3 = GetHandle("tank3")
	Mission.serv = GetHandle("unnamed_ivserv")
	Mission.fact = GetHandle("unnamed_ibfact")
	Mission.scav = GetHandle("unnamed_ivscav")
	Mission.rec = GetHandle("unnamed_ivrecy")
--  integers
	Mission.mission_state = 0
	Mission.shab_state = 0
	
	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	GiveWeapon(Mission.player,"gchainvsr_c")
	GiveWeapon(Mission.player,"gshadowvsr_c")
	GiveWeapon(Mission.player,"gproxminvsr")
	
	Mission.misl1 = UnitToVSR(Mission.misl1, "ivmisl_vsr", 0)
	SetGroup(Mission.misl1, 1)

	Mission.misl2 = UnitToVSR(Mission.misl2, "ivmisl_vsr", 0)
	SetGroup(Mission.misl2, 1)
	
	Mission.misl3 = UnitToVSR(Mission.misl3, "ivmisl_vsr", 0)
	SetGroup(Mission.misl3, 1)
	
	Mission.tank1 = UnitToVSR(Mission.tank1, "ivtank_vsr", 0)
	SetGroup(Mission.tank1, 0)
	
	Mission.tank2 = UnitToVSR(Mission.tank2, "ivtank_vsr", 0)
	SetGroup(Mission.tank2, 0)
	
	Mission.tank3 = UnitToVSR(Mission.tank3, "ivtank_vsr", 0)
	SetGroup(Mission.tank3, 0)
	
	Mission.serv = UnitToVSR(Mission.serv, "ivserv_vsr", 0)
	SetGroup(Mission.serv, 4)
	
	Mission.scav = UnitToVSR(Mission.scav, "ivscav_vsr", 0)
	SetGroup(Mission.scav, 5)
	
	Mission.fact = UnitToVSR(Mission.fact, "ibfact_vsr", 0)
	
	Mission.rec = UnitToVSR(Mission.rec, "ibrecy_vsr", 0)

	Mission.gun1 = UnitToVSR(GetHandle("gun1"), "fbspir_vsr", 0)
	
	temp = UnitToVSR(GetHandle("unnamed_fvcons"), "fvcons_vsr", 0)


   
end

function UnitToVSR(h, odf, player)

	PlayerTeam = GetTeamNum(h)
	xfrm = GetTransform(h)
	group = GetGroup(h)
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
	
	SetGroup(h, group)

	return h


end

function ShowObjectives()

	ClearObjectives()
	AddObjective("isdf0901.otf","WHITE",15.0)
	if (Mission.mission_state<1) then
	
		AddObjective("isdf0902.otf","WHITE",15.0)
		AddObjective("isdf0903.otf","WHITE",15.0)
	
	else
	
		AddObjective("isdf0902.otf","GREEN",15.0)
		if (Mission.mission_state<2) then
		
			AddObjective("isdf0903.otf","WHITE",15.0)
		
		else
			AddObjective("isdf0903.otf","GREEN",15.0)
		end
	end
end

function AddObject(h) --This function is called when an object appears in the game. --

if IsOdf(h, "fvturr") then h = UnitToVSR(h, "fvturr_vsr", 0) 
elseif IsOdf(h, "fvtank") then h = UnitToVSR(h, "fvtank_vsr", 0) 
elseif IsOdf(h, "fvsent") then h = UnitToVSR(h, "fvsent_vsr", 0)
elseif IsOdf(h, "fvscout") then h = UnitToVSR(h, "fvscout_vsr", 0)
elseif IsOdf(h, "fbscav") then h = UnitToVSR(h, "fbscav_vsr",0)
elseif IsOdf(h, "ibpgen") then h = UnitToVSR(h, "ibpgen_vsr",0)
elseif IsOdf(h, "ibgtow") then h = UnitToVSR(h, "ibgtow_vsr",0)
elseif IsOdf(h, "ibscav") then h = UnitToVSR(h, "ibscav_vsr",0)
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
	if (not Mission.start_done) then
	
		
		AudioMessage("isdf0904.wav")
		--[[		MANSON
				Surviving that march through
				the jungle shows you've got some
				moxie.  
		]]		
		AudioMessage("isdf0905.wav")
		--[[
				I've decided to strike at the scion
				base you discovered.  
				Unfortunantely the base is surrounded 
				by thick jungles and high canyon walls.  

				Attacking from the ground will be too
				difficult.  We should use this as an
				opportunity to test our new experimental
				flying APCs.  
		]]
		
		AudioMessage("isdf0906.wav")
		--[[
			Take a small force to the edge of the base.  
				Once you get close I'll assign a squadron
				of APCs to your command.  

				When you get close enough to find a safe landing 
				zone inside the base.  Send the APCs into 
				the base.  

				This will be extremely dangerous.  
		]]
		Mission.nav = BuildObject("ibnav",1,"shab_def_spawn")
		SetObjectiveName(Mission.nav,"Shabayev")

		Mission.shabayev = BuildObject("ispilo",1,"shab_stay")  -- let's see if that works.   then


		Mission.machine= GetHandle("unnamed_mbdata00")
		Mission.crystal= GetHandle("power_crystal")

		Mission.turr1 = GetHandle("base_turr1")
		Mission.turr2 = GetHandle("base_turr2")
		Mission.turr3 = GetHandle("base_turr3")
		Mission.turr4 = GetHandle("base_turr4")

		Patrol(Mission.shabayev,"shab_stay")
		Mission.sent = BuildObject("fvsent_vsr",2,"fury_patrol1")
		Patrol(Mission.sent,"fury_patrol1")
		Mission.sent = BuildObject("fvsent_vsr",2,"fury_patrol2")
		Patrol(Mission.sent,"fury_patrol2")

		-- We got tha boom
		Mission.sent = BuildObject("fvtank_vsr",2,"defend1")
		Goto(Mission.sent,"strike2")
		Mission.sent = BuildObject("fvtank_vsr",2,"defend1")
		Goto(Mission.sent,"strike2")
		ShowObjectives()

		SetAIP("isdf0901.aip",2)
		SetScrap(1,60)  -- so its always the same
		Mission.start_done = true
	end
	
	if ((Mission.shab_state<6) and (GetDistance(Mission.player,Mission.ruin)<200.0)
		and (not Mission.botched_rescue)) then 
	

		if (IsOdf(Mission.player,"ispilo"))   then -- the Mission.player needs wheels to resuce then
		
			Mission.atk1 = BuildObject("fvsent_vsr",2,"shab_attack")
			Mission.shab_state = 4
			Attack(Mission.atk1,Mission.shabayev)
			Mission.botched_rescue = true
		
		else
		

			-- Cooke you're approaching 
			-- my position.
			AudioMessage("isdf0909.wav")
			Mission.shab_state = 6
		end
	end
 
	if Mission.shab_state == 0 then -- first message
		 -- so it is ok with temp 
			if (IsAlive(Mission.player)) then
				Mission.temp = GetNearestEnemy(Mission.player)
			if ((GetTime()>Mission.shab_message)
				and (GetDistance(Mission.temp,Mission.player)>100.0)) then
			
				Mission.aud = AudioMessage("isdf0730.wav")  -- was 0901
				-- SHABAYEV
				-- Cook, are you out there?  
				-- I'm still at Mission.ruin. 
				Mission.shab_message = GetTime()+360.0 -- was 100
				CameraReady()
				Mission.shab_state = Mission.shab_state + 1
			end	
		end
		
	elseif Mission.shab_state == 1 then -- second message
		if (not IsAudioMessageDone(Mission.aud)) then
		
			CameraObject(Mission.shabayev,25,2,8,Mission.shabayev) -- was -15
		
		else
		
			CameraFinish()
		end

		if (GetTime()>Mission.shab_message) then
		
			Mission.sent = BuildObject("fvtank_vsr",2,"defend1")
			Goto(Mission.sent,"strike1")
			Mission.sent = BuildObject("fvtank_vsr",2,"defend1")
			Goto(Mission.sent,"strike1")
			AudioMessage("isdf0903.wav")
			-- SHABAYEV
			-- Cooke are you still alive?  
			-- Perhaps you could have your
			-- friend Manson send someone to 
			-- pick me up.  
			Mission.shab_message = GetTime()+450.0  -- was 100
			Mission.shab_state = Mission.shab_state + 1
		end
	elseif Mission.shab_state == 2 then
		if (GetTime()>Mission.shab_message) then
		
			AudioMessage("isdf0733a.wav")   -- Cooke come quickly, was 0901
			-- SHABAYEV
			-- All unitsnot   This is leutenant Shabayev
			-- I'm trapped in the ruins to the east
			-- of our main base.  I need assistance.  
			Mission.shab_message = GetTime()+390.0  
			Mission.shab_state = Mission.shab_state + 1
		end
		
	elseif Mission.shab_state == 3 then
		if (GetTime()>Mission.shab_message) then
		
			-- now things get desperate
			SetTeamNum(Mission.ruin,1)
			SetCurHealth(Mission.ruin, static_cast<long>(0.1 * GetMaxHealth(Mission.ruin)))
			Mission.atk1 = BuildObject("fvsent_vsr",2,"shab_attack")
			Mission.atk2 = BuildObject("fvsent_vsr",2,"shab_attack")
			Attack(Mission.atk1,Mission.shabayev)
			Attack(Mission.atk2,Mission.shabayev)
			Mission.shab_state = Mission.shab_state + 1
		end
		
	elseif Mission.shab_state == 4 then
		if (Mission.ruin_cam>0) then
		
			CameraObject(Mission.shabayev,20,6,12,Mission.shabayev)
			Mission.ruin_cam = Mission.ruin_cam + 1
			if (Mission.ruin_cam==75) then
			
				CameraFinish()
				Mission.shab_state = Mission.shab_state + 1
			end
		end
		if (((GetDistance(Mission.atk1,Mission.shabayev)<75.0) or (GetDistance(Mission.atk2,Mission.shabayev)<75.0))
			and (Mission.ruin_cam==0)) then
		
			AudioMessage("isdf0912.wav")
			-- Shabayev
			-- They found menot 
			--[[
				Cineractive on Mission.ruin dying
			]]
			CameraReady()
			Mission.ruin_cam = 1
		end
		
	elseif Mission.shab_state == 5 then
		if (not IsAlive(Mission.shabayev)) then
		
			AudioMessage("isdf0913.wav")
			-- Shabayev
			-- I'm deadnot 
			Mission.shab_state = 999
			FailMission(GetTime()+5.0,"isdf09l1.txt")
		end
		
	elseif Mission.shab_state == 6 then
		-- you to the rescue
		if (GetDistance(Mission.player,Mission.ruin)<75.0) then
		
			-- Cineractive and end..
			AudioMessage("isdf0915.wav")
			--[[
				Put a cineractive in here
			]]
			RemoveObject(Mission.nav)
			RemoveObject(Mission.shabayev)
			Mission.shab_state = Mission.shab_state + 1
		end
		

	--[[
		If you wait to long
		units from
		shab_attack
		blow up her building and
		kill her.  
	]]
	end



	if Mission.mission_state == 0 then   --opening cineractive..
		if (GetTime()>Mission.get_going) then
		
			AudioMessage("isdf0907.wav")
			-- 
			-- Cookenot   I thought you said you 
			-- knew where that base wasnot   
			-- Well?  Get over therenot   
			Mission.get_going = 99999.0

		end
		if (GetDistance(Mission.player,Mission.objective)<250.0) then
		
			AudioMessage("isdf0908.wav")
			-- That's itnot   Send in the APCsnot 
			grp = GetFirstEmptyGroup()

			Mission.apc1 = BuildObject("ivapc",1,"spawn_apc")
			apc2 = BuildObject("ivapc",1,"spawn_apc")	
			SetGroup(Mission.apc1, grp)
			SetGroup(apc2,grp)
			tank = BuildObject("fvtank_vsr",2,"defend1")
			Patrol(tank,"defend_patrol")
			BuildObject("fvtank_vsr",2,"defend1")
			Mission.mission_state = Mission.mission_state + 1
			ShowObjectives()

			SetObjectiveOn(Mission.objective)
		end
		
	elseif Mission.mission_state == 1 then  -- APCs attacking
		if (GetDistance(Mission.apc1,Mission.objective)<250.0) then
		
			AudioMessage("avapcvj.wav")
			-- APCs ready to attack
			-- AudioMessage("isdf0911.wav")
			-- Soldier
			-- Let's get themnot 
			Mission.mission_state = Mission.mission_state + 1
		
		else
		
			if (not IsAlive(Mission.objective)) then
			
				-- in case you do it without the apcs
				Mission.mission_state = Mission.mission_state + 1
			end
		end
		
	elseif Mission.mission_state == 2 then 
		if ((not IsAlive(Mission.objective)) 
			and (not IsAlive(Mission.turr1)) and (not IsAlive(Mission.turr2)) and 
			(not IsAlive(Mission.turr3)) and (not IsAlive(Mission.turr4))
			) then
		
			Mission.aud = 0
--			AudioMessage("isdf0914.wav")
			ClearObjectives()
			AddObjective("isdf0904.otf","WHITE",10.0)
			if (Mission.shab_state~=7) then
			
				AudioMessage("isdf0901.wav")
			end
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 3  then -- end cineractive
		if ((Mission.aud==0) and (Mission.shab_state==7)) then
		
			Mission.aud = AudioMessage("isdf0914.wav")  -- Congrats on clearing the base
			
			ShowObjectives()
		end
		if ((Mission.shab_state==7) and (IsAudioMessageDone(Mission.aud))) then
			Mission.machine_time1 = GetTime()+20.0
			AudioMessage("cin0601.wav")
			CameraReady()
			Mission.mission_state = Mission.mission_state + 1

		end

		
	elseif Mission.mission_state == 4 then
		if (GetTime()<Mission.machine_time1)  then
			CameraPath("end_camera_path",10,250,Mission.machine)
		
		else 
			Mission.machine_time2 = GetTime()+12.0
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 5 then
		if (GetTime()<Mission.machine_time2)  then
			CameraPath("crystal_camera",60,0,Mission.crystal)
		
		else 

			SucceedMission(GetTime()+20.0,"isdf09w1.txt")
			CameraFinish()
			Mission.mission_state = Mission.mission_state + 1
		end
		
	end
	
		

 	
end