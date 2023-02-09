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
	got_to_scav = false,
	warning = false,
	defend_warning = false,
	repair_hint = false,
	con_arrived = false,
	
--  floats


--  handles
	cbunker,
	atk1,
	atk2,
	atk3,
	atk4,
	atk5,
	atk6,
	atk7,
	atk8,
	guntow1,
	guntow2,
	constructor,
	player,
	scout1,
	scout2,
	scrap_pool,
	bomber,
	goal,
	mbike1,
	mbike2,
	ivmisl2,
	ivmisl3,
--	mbike3,
--	Mission.constructor,
	scav,
	escav,
	scav1,
	scav2,
	scav3,
	scav_count = 3,
	--  integers
	wave_count = 0,
	time_counter = 0,
	mission_state = 0, 
   
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
	
--  handles
	Mission.cbunker = nil
	Mission.guntow1 = nil
	Mission.guntow2 = nil
	Mission.constructor = nil
	Mission.player = GetPlayerHandle();

	Mission.scrap_pool=GetHandle("goal1")
	Mission.goal=GetHandle("goal")
	Mission.mbike1=GetHandle("bike1")
	Mission.mbike2=GetHandle("bike2")
	Mission.misl2=GetHandle("ivmisl2")
	Mission.misl3=GetHandle("ivmisl3")
--	mbike3=GetHandle("bike3")
--	constructor=GetHandle("constructor")
	Mission.scav1=GetHandle("scav1")
	Mission.scav2=GetHandle("scav2")
	Mission.scav3=GetHandle("scav3")
	
	Mission.basepool1 = GetHandle("basepool1")
	Mission.basepool2 = GetHandle("basepool2")
	Mission.basepool3 = GetHandle("basepool3")

	Mission.player = UnitToVSR(Mission.player, "ivscout_vsr", 1)
	GiveWeapon(Mission.player,"gchainvsr_c")
	GiveWeapon(Mission.player,"gshadowvsr_c")
	GiveWeapon(Mission.player,"gproxminvsr")
	
	Mission.mbike1 = UnitToVSR(Mission.mbike1, "ivmbike_vsr", 0)
	SetGroup(Mission.mbike1, 1)	
	
	Mission.mbike2 = UnitToVSR(Mission.mbike2, "ivmbike_vsr", 0)	
	SetGroup(Mission.mbike2, 1)
	
	Mission.misl2 = UnitToVSR(Mission.misl2, "ivmisl_vsr", 0)
	SetGroup(Mission.misl2, 0)
	
	Mission.misl3 = UnitToVSR(Mission.misl3, "ivmisl_vsr", 0)
	SetGroup(Mission.misl3, 0)
	
	PreloadODF("ivcon6")
	PreloadODF("fvscav")
	PreloadODF("fvtank")
	PreloadODF("fvsent")
	PreloadODF("fvarch")
	PreloadODF("fvscout")

   
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


	if (Mission.start_done) then
	
		if ((Mission.cbunker==nil) and (IsOdf(h,"ibcbun"))) then
		
			if (GetDistance(h,"pool")<200.0) then
			
				Mission.cbunker=h
				ConstructionMessage()
			
			else
			
				-- consturction Mission.warning
				ClearObjectives()
				AddObjective("isdf0610.otf","RED",10.0)
			end
		
		else 
			if ((Mission.guntow1==nil) and (IsOdf(h,"ibgtow"))) then
			
				if (GetDistance(h,"pool")<400.0) then
				
					Mission.guntow1=h
					ConstructionMessage()
				
				else
				
					-- construction Mission.warning
					ClearObjectives()
					AddObjective("isdf0610.otf","RED",10.0)
				end
			
			else
			
				if ((Mission.guntow2==nil) and (IsOdf(h,"ibgtow"))) then
				
					if (GetDistance(h,"pool")<400.0) then
					
						Mission.guntow2=h
						ConstructionMessage()
					
					else
					
						-- construction Mission.warning
						ClearObjectives()
						AddObjective("isdf0610.otf","RED",10.0)
					end
				end
			end
		end
		if (IsOdf(h,"fbscav")) then  -- assuming fvscav-> ibscav then
		
			Mission.escav=h
		end

		if (IsOdf(h,"ivbomb_vsr")) then
		
			SetPerceivedTeam(h,2)  -- so they won't shoot it
			Stop(h,1)
		end
	end
	if (IsOdf(h,"ibscav_vsr"))  then
		Mission.scav_count = Mission.scav_count + 1
	end

	-- Tweak NM 12/20/03 if the spawned-in scav dies, use any built scav then
	-- as a replacement
	if((Mission.mission_state == 4) and (Mission.scav == nil) and (IsOdf(h,"ivscav_vsr"))) then
		Mission.scav = h
		Goto(Mission.scav,"pool")
	end

--[[
	if ((Mission.scav1 == nil) and (IsOdf(h,"ivscav"))) then
	
		Mission.scav1 = h
	
	elseif ((Mission.scav2 == nil) and (IsOdf(h,"ivscav"))) then
	
		Mission.scav2 = h
	
	elseif ((turret1 == nil) and (IsOdf(h,"ivturr"))) then
	
		turret1 = h
	
	elseif ((turret2 == nil) and (IsOdf(h,"ivturr"))) then
	
		turret2 = h
	
	elseif ((wingman1 == nil) and (IsOdf(h,"ivscout"))) then
	
		wingman1 = h
	
	elseif ((wingman2 == nil) and (IsOdf(h,"ivscout"))) then
	
		wingman2 = h
	end
]]
end

function ConstructionMessage()

		ClearObjectives()
		AddObjective("isdf0604.otf","WHITE",10.0)
		if (Mission.cbunker~=nil) then
		
			AddObjective("isdf0605.otf","GREEN",10.0)
		
		else
			AddObjective("isdf0605.otf","WHITE",10.0)
		end
		if ((Mission.guntow1~=nil) and (Mission.guntow2~=nil)) then
		
			AddObjective("isdf0606.otf","GREEN",10.0)
		
		else
			AddObjective("isdf0606.otf","WHITE",10.0)

		end		
end

function DeleteObject(h) --This function is called when an object is deleted in the game.
	if (IsOdf(h,"ivscav_vsr"))  then
		Mission.scav_count = Mission.scav_count - 1
	end
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
		Stuff in 6
		You are responsible for
		the northern aproach to the base
		Alien units approach from the south
		and you battle them.  

		Shabayev discovers a scrap pool.
		She highlights it.  
		You must go to it and destroy a 
		scion scavenger.  

		You are given control of 
		Mission.constructor.  Your job is to build
		a bunker and a gun tower around it
		to protect it.  

		Once the bunker is built
		you are told to go on the 
		offensive.  

	  
		At the first place
		you go you find the 
		voyager probe.  

		The second is the 
		climatic battle.  
	]]
	
	Mission.player = GetPlayerHandle()

	if (not Mission.start_done) then
	

		--[[
			This is one of our three 
			key bases on the Planet
			You must defend this approach.  
		]]
		ClearObjectives()
		AddObjective("isdf0601.otf","WHITE",20.0)
		AudioMessage("isdf0601.wav")
		-- Manson:
		-- Prepare for enemy attacks
		-- You are a reserve for a counter attack
		-- or in case they break through.  
		attack_wave_time=GetTime()+10.0
		wave_launched=false
		SetScrap(1,20)

		Mission.escav=BuildObject("fvscav",2,"pool")
		SetIndependence(Mission.escav,0)
		Goto(Mission.escav,Mission.scrap_pool,0)
		
		Goto(Mission.scav3, Mission.basepool1,1)
		Goto(Mission.scav2, Mission.basepool2,1)
		Goto(Mission.scav1, Mission.basepool3,1)
		

		
		temp=GetHandle("gtow1")
		AddHealth(temp,-2500)
		temp=GetHandle("gtow2")
		AddHealth(temp,-2500)
		GiveWeapon(Mission.player, "gshadowvsr_c")
		--[[
		turret1=BuildObject("ivturr_vsr",3,"turret1")
		turret2=BuildObject("ivturr_vsr",3,"turret2")
		Deploy(turret1)
		Deploy(turret2)
		]]
		
		
		Mission.start_done=true
	end
	
	if ((not IsAlive(Mission.constructor)) and (Mission.mission_state>1) and (Mission.mission_state~=99)) then
	
			-- you loose
			AudioMessage("isdf0607.wav")
			-- Manson:
			-- That Mission.constructor was vital
			-- to our effort.  I'm pulling
			-- back immeadiately.  
			FailMission(GetTime()+15.0,"isdf06l2.txt")
			Mission.mission_state=99  -- out of the loop
	end
	
	if Mission.mission_state == 0 then -- attack starts
		if ((not Mission.warning) and
			(GetDistance(Mission.atk1,turret1)<250.0)) then
		
			AudioMessage("isdf0602.wav")
			Mission.warning=true
		end
		if ((not wave_launched) and (GetTime()>attack_wave_time)) then
		
			Mission.atk1=BuildObject("fvtank_vsr",2,"attack_start1")
			Goto(Mission.atk1,"attack_path1")
			SetSkill(Mission.atk1,3)
			Mission.atk2=BuildObject("fvtank_vsr",2,"attack_start1")
			Goto(Mission.atk2,"attack_path1")
			SetSkill(Mission.atk2,3)
			Mission.atk3=BuildObject("fvsent_vsr",2,"attack_start1")
			Goto(Mission.atk3,"attack_path1")
			SetSkill(Mission.atk3,3)
			Mission.atk4=BuildObject("fvsent_vsr",2,"attack_start1")
			Goto(Mission.atk4,"attack_path1")
			SetSkill(Mission.atk4,3)
			Mission.atk5=BuildObject("fvtank_vsr",2,"attack_start2")
			Goto(Mission.atk5,"attack_path2")
			SetSkill(Mission.atk5,3)
			Mission.atk6=BuildObject("fvtank_vsr",2,"attack_start2")
			Goto(Mission.atk6,"attack_path2")
			SetSkill(Mission.atk6,3)
			Mission.atk7=BuildObject("fvsent_vsr",2,"attack_start2")
			Goto(Mission.atk7,"attack_path2")
			SetSkill(Mission.atk7,3)
	--		atk8=BuildObject("fvsent_vsr",2,"attack_start2")
	--		Goto(atk8,"attack_path2")
	--		SetSkill(atk8,3)
			wave_launched=true
		end
		if ((wave_launched) and (not IsAlive(Mission.atk1))
			and (not IsAlive(Mission.atk2))
			and (not IsAlive(Mission.atk3))
			and (not IsAlive(Mission.atk4)) 
			and (not IsAlive(Mission.atk5))
			and (not IsAlive(Mission.atk6))
			and (not IsAlive(Mission.atk7))
			and (not IsAlive(Mission.atk8))) then
		
			Mission.warning=false
			wave_launched=false
			Mission.wave_count = Mission.wave_count + 1
			if (not Mission.repair_hint) then
			
				Mission.repair_hint=true
				AudioMessage("isdf0612.wav")
				--[[
					MANSON
					Take advantage of the
					breaks between attacks 
					to repair your forces at the service 
					bay.  
				]]
			end
			if (Mission.wave_count==2) then
			
				back1=BuildObject("fvarch_vsr",2,"back1")
				Goto(back1,"back_door")
				back2=BuildObject("fvarch_vsr",2,"back2")
				Goto(back2,"back_door")
				back3=BuildObject("fvsent_vsr",2,"back3")
				Goto(back3,"back_door")
				SetObjectiveOn(back1)
				AudioMessage("isdf0614.wav")
			end
			if (Mission.wave_count>(2)) then --was 2 then
			
				if ((not IsAlive(back1))
					and (not IsAlive(back2))
					and (not IsAlive(back3))) then
				

					Mission.mission_state = Mission.mission_state + 1
					SetObjectiveOn(Mission.escav)
					ClearObjectives()
					AddObjective("isdf0602.otf","WHITE",10.0)
					AudioMessage("isdf0603.wav")
					-- Shabayev
					-- I have detected the scavenger
					-- which is supplying the enemy.  
					-- Its time to counter attack.  
					-- Manson
					-- Alright, Cooke, you heard
						-- the lieutenant.  Get that
					-- scavenger
					AudioMessage("isdf0604.wav")
				end
			
			else attack_wave_time=GetTime()+5.0
			-- hold back your forces
			end 
			if ((GetDistance(turret1,Mission.mbike1)<50.0) and (not Mission.defend_warning)) then
			
				AudioMessage("isdf0610.wav")
				-- MansoN:
				-- Cooke, hold back your forces.  
				Mission.defend_warning=true

			end
		end
		
	elseif Mission.mission_state == 1 then -- shabayev highlights the scavenger
		--[[
		]]
		if (Mission.scav_count<3) then
		
			FailMission(GetTime()+5.0,"isdf06l1.txt")
			Mission.mission_state=99
		
		else
		

			if ((GetDistance(Mission.player,Mission.escav)<150.0)
				and (not Mission.got_to_scav)) then
			
				AudioMessage("isdf0605.wav")
				-- Shabayev: Attacknot 
				Mission.got_to_scav=true	

			end
			if (not IsAlive(Mission.escav)) then
			
				ClearObjectives()
				AddObjective("isdf0603.otf","WHITE",10.0)
		
				Mission.constructor=BuildObject("ivcon6",1,"constructor_spawn")
				grp=GetFirstEmptyGroup()			
				SetGroup(Mission.constructor,grp)
				Goto(Mission.constructor,"pool",0)
	
				Mission.mission_state = Mission.mission_state + 1
				AudioMessage("isdf0606.wav")
				-- Manson:
				-- Cooke, I'm sending you a 
				-- Mission.constructor to fortify your
				-- position.  Use the Mission.constructor
				-- to build defenses around that
				-- scrap pool.  
			end
		end
		
	elseif Mission.mission_state == 2 then	 -- you get a Mission.constructor 
		if (GetDistance(Mission.constructor,"pool")<250.0 and not Mission.con_arrived) then
		
			AudioMessage("isdf0611.wav")
			-- Shabayev
			-- Build a communications bunker to 
			-- anchor the base.  
			-- Once you have a communications bunker
			-- build two adjacent
			-- gun towers
			-- The gun towers will be powered from
			-- the surplus power of the main base.  
			-- Good luck. 

			ConstructionMessage()
			-- spawn in attackers
			Mission.scout1=BuildObject("fvscout_vsr",2,"patrol_spawn")
			Mission.scout2=BuildObject("fvscout_vsr",2,"patrol_spawn")
			if (IsAlive(Mission.mbike1)) then
			
				Attack(Mission.scout1,Mission.player)
			
			else
			
				Attack(Mission.scout1,Mission.player)
			end
			if (IsAlive(Mission.mbike2)) then
			
				Attack(Mission.scout2,Mission.player)
			
			else Attack(Mission.scout2,Mission.mbike2)
			
			end
			Mission.con_arrived = true
			Mission.mission_state = Mission.mission_state + 1
		end

		
	elseif Mission.mission_state == 3 then
		if ((not IsAlive(Mission.scout1)) and (not IsAlive(Mission.scout2))) then
		
			Mission.scout1=BuildObject("fvscout_vsr",2,"patrol_spawn")
			Mission.scout2=BuildObject("fvscout_vsr",2,"patrol_spawn")
			if (IsAlive(Mission.mbike1)) then
			
				Attack(Mission.scout1,Mission.mbike1)
			
			else 
				Attack(Mission.scout1,Mission.player)
			end
			if (IsAlive(Mission.mbike2)) then
			
				Attack(Mission.scout2,Mission.mbike2)
			
			else	
				Attack(Mission.scout2,Mission.player)
			end
		end
		if ((Mission.cbunker~=nil) and (Mission.guntow1~=nil)
			and (Mission.guntow2~=nil)) then
		
			AudioMessage("isdf0608.wav")
			--[[
				Manson:
				Greatnot   
				I'm sending a scavenger to secure
				that pool.  
				Prepare for further orders.  

			]]
			-- more cannon foder to get pulverized
			Mission.atk1=BuildObject("fvtank_vsr",2,"patrol_spawn1")
			Attack(Mission.atk1,Mission.guntow1)  -- cannon foder
			Mission.atk2=BuildObject("fvtank_vsr",2,"patrol_spawn2")
			Attack(Mission.atk2,Mission.guntow2)  -- cannon foder

			-- FraKTal says this scav doesn't want to deploy on its
			-- own. So, put it under 100% human control - NM 6/27/03

			-- was
			--Mission.scav=BuildObject("ivscav",3,"constructor_spawn")

			-- now
			Mission.scav=BuildObject("ivscav",1,"constructor_spawn")


			Goto(Mission.scav,"pool")
			ClearObjectives()
			AddObjective("isdf0607.otf","WHITE",10.0)
			Mission.mission_state = Mission.mission_state + 1
		end
		
	elseif Mission.mission_state == 4 then  -- when the scavenger gets there-- attacknot not 
			if (GetDistance(Mission.scav,"pool")<100.0) then
			
				AudioMessage("isdf0609.wav")
				AudioMessage("isdf0613.wav")
				-- Shabayev:
				-- Its time we finish them off.  
				-- All forces, converge on the enemy basenot  
				SetObjectiveOn(Mission.goal)
				Mission.mission_state = Mission.mission_state + 1
				-- spawn in patrols
				Mission.atk1=BuildObject("fvtank_vsr",2,"patrol_spawn2")
				Mission.atk2=BuildObject("fvtank_vsr",2,"patrol_spawn2")
				Mission.atk3=BuildObject("fvsent_vsr",2,"patrol_spawn")
				Mission.atk4=BuildObject("fvsent_vsr",2,"patrol_spawn")
				Patrol(Mission.atk1,"patrol")
				Patrol(Mission.atk2,"patrol")
				Patrol(Mission.atk3,"patrol")
				Patrol(Mission.atk4,"patrol")
				-- spawn in attackers
				Mission.atk1=BuildObject("ivtank_vsr",3,"constructor_spawn")
				Mission.atk2=BuildObject("ivtank_vsr",3,"constructor_spawn")
				Goto(Mission.atk1,Mission.goal)
				Goto(Mission.atk2,Mission.goal)
				--BuildObject("ibbomb",1,"bomber")  -- you get a bomber
--				BuildObject("ivbomb",1,"bomber")
				Mission.bomber = GetHandle("unnamed_ivbomb_vsr")
				Stop(Mission.bomber,0)
				SetBestGroup(Mission.bomber)
				ClearObjectives()
				AddObjective("isdf0608.otf","WHITE",10.0)
			end
		
	elseif Mission.mission_state == 5 then  -- test to destroy base
			Mission.time_counter = Mission.time_counter + 1
			if (Mission.time_counter%1200==0) then -- every minute 1/2 then
			
				Mission.atk1=BuildObject("fvtank_vsr",2,"patrol_spawn2")
				Mission.atk2=BuildObject("fvtank_vsr",2,"patrol_spawn2")
				Patrol(Mission.atk1,"patrol")
				Patrol(Mission.atk2,"patrol")
			end
			if (not IsAlive(Mission.goal)) then
			
				-- you win
				SucceedMission(GetTime()+20.0,"isdf06w1.txt")
				Mission.mission_state = Mission.mission_state + 1
				ClearObjectives()
				AddObjective("isdf0609.otf","WHITE",10.0)
			end
		
	elseif Mission.mission_state == 6 then
		-- cineractive
		-- Through the worm hole
		

	end -- switch		

 	
end