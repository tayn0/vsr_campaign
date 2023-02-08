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
	SetAutoGroupUnits(false),
--[[
	Here's where you set the values at the start.  
]]
--  bools

	power_strike = false,
	scav_strike = false,
	start_takeoff = false,
	takeoff = false,

--  floats

--  handles
	player,
	power1 = nil,
	gtow1 = nil,
	scav1 = nil,
	dropship = nil,
	dropship2 = nil,
	recy,
--	SetObjectiveOn(Mission.recy),
--[[
	pool1 = GetHandle("pool1"),
	pool2 = GetHandle("pool2"),
	pool3 = GetHandle("pool3"),
	pool4 = GetHandle("pool4"),
	pool5 = GetHandle("pool5"),
]]
	atk2_1 =  nil,
	atk2_2 =  nil,
	atk2_3 =  nil,
	atk2_4 =  nil,
	atk2_5 =  nil,
	atk2_6 =  nil,
	atk2_7 =  nil,
	atk2_8 =  nil,
	atk2_9 =  nil,
	ConvoyTug,
	tug,
	convoy_timer,
	sneak1,
	sneak2,
	sneak3,
	atk1,
	atk2,
	atk3,
	atk4,
	atk5,
	atk6,
	stranded_truck1,
	healer1,
	healer2,
	titan1,
	titan2,
	sentry1,
	sentry2,
	
	
	goal1 = GetHandle("goal1"),
	goal2 = GetHandle("goal2"),
	goal3 = GetHandle("goal3"),
	goal4 = GetHandle("goal4"),
--SetObjectiveOn(goal1),
--SetObjectiveOn(Mission.goal2),
--SetObjectiveOn(Mission.goal3),
--SetObjectiveOn(Mission.goal4),

	--  integers
	time_counter = 1,
	comp_team = 2,
	comp_teamb = 4,
	comp_teamc = 5,
	sneak_timer,
	emit_time = 999999,
	condor1_remove_time = 999999,

	mission_state = 0
   
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
	SetAutoGroupUnits(false)
--[[
	Mission.Here's where you set the values at the start.  
]]
--  bools

	Mission.power_strike = false
	Mission.scav_strike = false
	Mission.start_takeoff = false
	Mission.takeoff = false

--  floats

--  handles
	Mission.player = GetPlayerHandle()
	Mission.power1 = nil
	Mission.gtow1 = nil
	Mission.scav1 = nil
	Mission.dropship = GetHandle("dropship")
	Mission.dropship2 = GetHandle("dropship2")
	
	Mission.recy = GetHandle("recycler")
--	SetObjectiveOn(Mission.recy)
--[[
	Mission.pool1 = GetHandle("pool1")
	Mission.pool2 = GetHandle("pool2")
	Mission.pool3 = GetHandle("pool3")
	Mission.pool4 = GetHandle("pool4")
	Mission.pool5 = GetHandle("pool5")
]]
	Mission.atk2_1 =  nil
	Mission.atk2_2 =  nil
	Mission.atk2_3 =  nil
	Mission.atk2_4 =  nil
	Mission.atk2_5 =  nil
	Mission.atk2_6 =  nil
	Mission.atk2_7 =  nil
	Mission.atk2_8 =  nil
	Mission.atk2_9 =  nil

	
	goal1 = GetHandle("goal1")
	Mission.goal2 = GetHandle("goal2")
	Mission.goal3 = GetHandle("goal3")
	Mission.goal4 = GetHandle("goal4")
--SetObjectiveOn(goal1)
--SetObjectiveOn(Mission.goal2)
--SetObjectiveOn(Mission.goal3)
--SetObjectiveOn(Mission.goal4)

	--  integers

	Ally(Mission.comp_team,Mission.comp_teamb)
	Ally(Mission.comp_teamb,Mission.comp_team)
	Ally(Mission.comp_team,Mission.comp_teamc)
	Ally(Mission.comp_teamc,Mission.comp_team)
	Ally(Mission.comp_teamc,Mission.comp_teamb)
	Ally(Mission.comp_teamb,Mission.comp_teamc)
	
	PreloadODF("fvatank")

   
end

function AddObject(h) --This function is called when an object appears in the game. --
	if (start_done) then
	
		if (IsOdf(h,"ibpgen") and ((Mission.power1==nil) or (not IsAlive(Mission.power1)))) then
		
			Mission.power1 = h
		end
		if (IsOdf(h,"ibgtow") and ((Mission.gtow1==nil) or (not IsAlive(Mission.gtow1)))) then
		
			Mission.gtow1 = h
		end
		if ((IsOdf(h,"ibscav")) and (Mission.scav1==nil)) then
		
			Mission.scav1 = h
		end
	end

	if (IsOdf(h,"ibrecy")) then
	
		Mission.recy = h
--SetObjectiveOn(Mission.recy)
	end
--[[
	if ((Mission.scav1 == nil) and (IsOdf(h,"ivscav"))) then
	
		Mission.scav1 = h
	
	elseif ((scav2 == nil) and (IsOdf(h,"ivscav"))) then
	
		scav2 = h
	
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


function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function CounterAttacks()

	if ((not Mission.power_strike) and (Mission.power1~=nil)) then
	
		Attack(Mission.atk1,Mission.power1)
		Attack(Mission.atk2,Mission.power1)
--		Attack(Mission.atk3,Mission.power1)
		if (IsOdf(Mission.atk3,"fvserv")) then
		
			if (IsAlive(Mission.atk1)) then
				Follow(Mission.atk3,Mission.atk1)
			elseif (IsAlive(Mission.atk2)) then
				Follow(Mission.atk3,Mission.atk2)
			else
			
				Mission.stranded_truck1 = true
--				SetTeamNum(atk6,Mission.comp_team)
			end

			if (Mission.stranded_truck1) then
			
				Goto(Mission.atk3, "attack3")
				Mission.stranded_truck1 = false
			end
		end
		Mission.power_strike = true
	end
end

function LateAttacks()

		if (Mission.time_counter%3000==0)	 then -- every 90 seconds then
		
			if ((not IsAlive(Mission.atk2_1)) and (not IsAlive(Mission.atk2_2)) and (not IsAlive(Mission.atk2_3))) then
			
				Mission.atk2_1 = BuildObject("fvwalk",Mission.comp_team,"convoy1")
--				GiveWeapon(Mission.atk2_1,"gquill_a")
--				Attack(Mission.atk2_1,Mission.recy)
--			PrintConsoleMessage("fvwalk-Mission.atk2_1 built at convoy1")
				Mission.atk2_2 = BuildObject("fvwalk",Mission.comp_team,"convoy2")
--				GiveWeapon(Mission.atk2_2,"gquill_a")
--				Attack(Mission.atk2_2,Mission.recy)
--			PrintConsoleMessage("fvwalk-Mission.atk2_2 built at convoy2")
				Mission.atk2_3 = BuildObject("fvwalk",Mission.comp_team,"convoy3")
--				GiveWeapon(Mission.atk2_3,"gquill_a")
--				Attack(Mission.atk2_3,Mission.recy)
--			PrintConsoleMessage("fvwalk-Mission.atk2_3 built at convoy3")
--			SetObjectiveOn(Mission.atk2_1)
--			SetObjectiveOn(Mission.atk2_2)
--			SetObjectiveOn(Mission.atk2_3)               
			end

			if ((not IsAlive(Mission.atk2_7)) and (not IsAlive(Mission.atk2_8)) and (not IsAlive(Mission.atk2_9))) then
			
				Mission.atk2_7 = BuildObject("fvscout",Mission.comp_teamc,"attack1")
				GiveWeapon(Mission.atk2_7,"garc_c")
				GiveWeapon(Mission.atk2_7,"gshield")
				Mission.atk2_8 = BuildObject("fvscout",Mission.comp_teamc,"attack2")
				GiveWeapon(Mission.atk2_8,"garc_c")
				GiveWeapon(Mission.atk2_8,"gshield")
				Mission.atk2_9 = BuildObject("fvscout",Mission.comp_teamc,"attack3")
				GiveWeapon(Mission.atk2_9,"garc_c")
				GiveWeapon(Mission.atk2_9,"gshield")
--		SetObjectiveOn(Mission.atk2_7)
--		SetObjectiveOn(Mission.atk2_8)
--		SetObjectiveOn(Mission.atk2_9)
			end
		end

		if (Mission.time_counter%3001==0)  then -- it takes 5 minutes to get back to this then
		
			if ((IsAlive(Mission.atk2_1)) and (IsAlive(Mission.atk2_2)) and (IsAlive(Mission.atk2_3)) 
			and (not IsAlive(Mission.atk2_4)) and (not IsAlive(Mission.atk2_5)) and (not IsAlive(Mission.atk2_6))) then
			
				Mission.atk2_4 = BuildObject("fvsent",Mission.comp_teamc,"convoy4")
				GiveWeapon(Mission.atk2_4,"glock_c")
				GiveWeapon(Mission.atk2_4,"gshield")
				Mission.atk2_5 = BuildObject("fvsent",Mission.comp_teamc,"convoy5")
				GiveWeapon(Mission.atk2_5,"glock_c")
				GiveWeapon(Mission.atk2_5,"gshield")
				Mission.atk2_6 = BuildObject("fvsent",Mission.comp_teamc,"convoy6")
				GiveWeapon(Mission.atk2_6,"glock_c")
				GiveWeapon(Mission.atk2_6,"gshield")

				Follow(Mission.atk2_4,Mission.atk2_1)
				Follow(Mission.atk2_5,Mission.atk2_2)
				Follow(Mission.atk2_6,Mission.atk2_3)
--		SetObjectiveOn(Mission.atk2_4)
--		SetObjectiveOn(Mission.atk2_5)
--		SetObjectiveOn(Mission.atk2_6)

				if (not IsAlive(Mission.gtow1)) then
				
					Attack(Mission.atk2_1,Mission.player)
					Attack(Mission.atk2_2,Mission.player)
					Attack(Mission.atk2_3,Mission.player)
				
				elseif (IsAlive(Mission.gtow1)) then
				
					Attack(Mission.atk2_1,Mission.gtow1)
					Attack(Mission.atk2_2,Mission.gtow1)
					Attack(Mission.atk2_3,Mission.gtow1)
				
				elseif (IsAlive(Mission.recy)) then
				
					Attack(Mission.atk2_1,Mission.recy)
					Attack(Mission.atk2_2,Mission.recy)
					Attack(Mission.atk2_3,Mission.recy)
				end
			end
		end
		
		if (Mission.time_counter%100==0)	 then -- every 10 seconds then
		
			-- clear everything out
			--if (IsAlive(Mission.atk2_1)) then
			--	Attack(Mission.atk2_1,Mission.recy)
			--
			--if (IsAlive(Mission.atk2_2)) then
			--	Attack(Mission.atk2_2,Mission.recy)

			--if (IsAlive(Mission.atk2_3)) then
			--	Attack(Mission.atk2_3,Mission.recy)
			
			if (IsAlive(Mission.atk2_4)) then
			
				if (IsAlive(Mission.atk2_1)) then
					Follow(Mission.atk2_4, Mission.atk2_1)
				elseif (IsAlive(Mission.atk2_2)) then
					Follow(Mission.atk2_4, Mission.atk2_2)
				elseif (IsAlive(Mission.atk2_3)) then
					Follow(Mission.atk2_4, Mission.atk2_3)
				else Attack(Mission.atk2_4,Mission.player)
				end
			end

			if (IsAlive(Mission.atk2_5)) then
			
				if (IsAlive(Mission.atk2_2)) then
					Follow(Mission.atk2_5, Mission.atk2_2)
				elseif (IsAlive(Mission.atk2_1)) then
					Follow(Mission.atk2_5, Mission.atk2_1)
				elseif (IsAlive(Mission.atk2_3)) then
					Follow(Mission.atk2_5, Mission.atk2_3)
				else Attack(Mission.atk2_5,Mission.player)
				end
			end

			if (IsAlive(Mission.atk2_6)) then
			
				if (IsAlive(Mission.atk2_3)) then
					Follow(Mission.atk2_6, Mission.atk2_3)
				elseif (IsAlive(Mission.atk2_2)) then
					Follow(Mission.atk2_6, Mission.atk2_2)
				elseif (IsAlive(Mission.atk2_1)) then
					Follow(Mission.atk2_6, Mission.atk2_1)
				else Attack(Mission.atk2_6,Mission.player)
				end
			end


			if (IsAlive(Mission.atk2_7)) then
			Attack(Mission.atk2_7,Mission.player)
			end 
			
			if (IsAlive(Mission.atk2_8)) then
			Attack(Mission.atk2_8,Mission.player)
			end
			
			if (IsAlive(Mission.atk2_9)) then
			Attack(Mission.atk2_9,Mission.player)
			end
		end
end


function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --
 
 	Mission.player = GetPlayerHandle()

	CounterAttacks()	-- only executes if boolean Mission.power_strike = true and Mission.power1 ~= nil then

	if (not start_done) then
	
		-- AudioMessage("isdf1601.wav")
		--[[
			The fate of humanity depends
			on our successful invasion of
			Core.  
			I have no doubt this will be the
			most hostile planet we have yet
			encountered, and the fiercest
			resistance.  
			Establish your forces carefully
			and press the attack into the
			enemy data transfer facillity.  
		]]

		Mission.atk1 = BuildObject("fvarch",Mission.comp_team,"attack1")
		Mission.atk2 = BuildObject("fvarch",Mission.comp_team,"attack2")
		Mission.atk3 = BuildObject("fvarch",Mission.comp_team,"attack3")
		Mission.atk4 = BuildObject("fvatank",Mission.comp_team,"attack4")
		Mission.atk5 = BuildObject("fvatank",Mission.comp_team,"attack5")
		Mission.atk6 = BuildObject("fvserv",Mission.comp_team,"ScoutEnemy2")
--SetObjectiveOn(Mission.atk1)
--SetObjectiveName(Mission.atk1, "Attack1")
--SetObjectiveOn(Mission.atk2)
--SetObjectiveName(Mission.atk2, "Attack2")
--SetObjectiveOn(Mission.atk3)
--SetObjectiveName(Mission.atk3, "Attack3")
	--SetObjectiveOn(Mission.atk4)
	--SetObjectiveOn(Mission.atk5)
	--SetObjectiveOn(atk6)
--	Mission.pool1 = GetHandle("pool1")
--	SetObjectiveOn(Mission.pool1)
		tempturr = BuildObject("fvturr",Mission.comp_team,"turret1")
		Deploy(tempturr)
		tempturr = BuildObject("fvturr",Mission.comp_team,"turret2")
		Deploy(tempturr)
		tempturr = BuildObject("fvturr",Mission.comp_team,"turret3")
		Deploy(tempturr)
		tempturr = BuildObject("fvturr",Mission.comp_team,"turret4")
		BuildObject("fvrecy",Mission.comp_team,"RecyclerEnemy")
		BuildObject("fvrecy",Mission.comp_teamb,"base2") -- buh hah hahnot not 
		SetScrap(1,60)
		SetScrap(Mission.comp_team,40)
		SetAIP("misn16.aip",Mission.comp_team)
		SetScrap(Mission.comp_teamb,40)
		SetAIP("misn16b.aip",Mission.comp_teamb)
		ClearObjectives()
		AddObjective("isdf1601.otf","WHITE",10.0)
		AudioMessage("isdf1601.wav")

		-- this is for the drop ship
 		takeoff_time = GetTime()+10.0
		SetAnimation(Mission.dropship,"deploy",1)
		start_done = true
	end	-- not start_done

	if ((not Mission.start_takeoff) and (GetTime()>takeoff_time)) then
	
		Mission.start_takeoff = true
		SetAnimation(Mission.dropship,"takeoff",1)
		SetAnimation(Mission.dropship2,"takeoff",1)
		Mission.emit_time = GetTime() + 3.0
		Mission.condor1_remove_time = GetTime() + 20.0
	end
	
	if (Mission.emit_time < GetTime()) then
	
		StartEmitter(Mission.dropship, 1)
		StartEmitter(Mission.dropship, 2)
		--smoker1 = BuildObject("kickup",0,"smoker1_a")
		--smoker2 = BuildObject("kickup",0,"smoker1_b")
		Mission.emit_time = GetTime() + 999999.9
	end
	if (not Mission.takeoff) then
	
		if (Mission.condor1_remove_time < GetTime()) then
		
			RemoveObject(Mission.dropship)
			--RemoveObject(smoker1)
			--RemoveObject(smoker2)
			Mission.takeoff = true
		end
	end
	
	if (Mission.time_counter == 400)	 then -- at 50 seconds into the mission then
	
		AudioMessage("isdf1640.wav")
		tempturr = BuildObject("fvwalk",Mission.comp_team,"turret1")
--	PrintConsoleMessage("fvwalk-tempturr built at turret1")
--	SetObjectiveOn(tempturr)
		Attack(tempturr,Mission.player)
		tempturr = BuildObject("fvwalk",Mission.comp_team,"turret2")
--	PrintConsoleMessage("fvwalk-tempturr built at turret2")
--	SetObjectiveOn(tempturr)
		Attack(tempturr,Mission.player)
	end
	
	--[[
		If you lose the recycler
		you lose.  
	]]
	if ((Mission.mission_state<12) and (not IsAlive(Mission.recy))) then
	
		Mission.mission_state = 12 -- buh-byenot 
		ClearObjectives()
		AddObjective("isdf1605.otf","RED",10.0)
	end
		
	if (((GetDistance(Mission.player,goal1)<150.0) 
	or	 (GetDistance(Mission.player,Mission.goal2)<150.0)
	or	 (GetDistance(Mission.player,Mission.goal3)<150.0)
	or	 (GetDistance(Mission.player,Mission.goal4)<150.0))
	and	 (Mission.mission_state<7)) then
	
		ClearObjectives()
		AddObjective("isdf1602.otf","WHITE",10.0)
		AudioMessage("isdf1602.wav")
		--[[
			That's itnot   
			We need to get to that
			structure.
		]]
		Mission.titan1 = BuildObject("fvatank",Mission.comp_team,"convoy1")
		Goto(Mission.titan1, "convoy_path")
		Mission.ConvoyTug = BuildObject("fvtug",Mission.comp_team,"convoy2")
--		Goto(Mission.ConvoyTug,"convoy_path")
		Follow(Mission.ConvoyTug, Mission.titan1)
		Mission.titan2 = BuildObject("fvatank",Mission.comp_team,"convoy3")
		Follow(Mission.titan2,Mission.ConvoyTug)
		Mission.sentry1 = BuildObject("fvsent",Mission.comp_team,"convoy4")
		Follow(Mission.sentry1, Mission.titan2)
		Mission.sentry2 = BuildObject("fvsent",Mission.comp_team,"convoy5")
		Follow(Mission.sentry2,Mission.ConvoyTug)
		Mission.healer1 = BuildObject("fvserv",Mission.comp_team,"convoy4")
		Follow(Mission.healer1, Mission.titan1)
		Mission.healer2 = BuildObject("fvserv",Mission.comp_team,"convoy5")
		Follow(Mission.healer2, Mission.ConvoyTug)
		Mission.mission_state = 7
		Mission.convoy_timer = 200
	end

	if (Mission.time_counter%50==0)	 then -- every 5 seconds then
	
		if (IsOdf(Mission.atk6,"fvserv")) then
		
			if (IsAlive(Mission.atk4)) then
				Follow(Mission.atk6,Mission.atk4)
			elseif (IsAlive(Mission.atk5)) then
				Follow(Mission.atk6,Mission.atk5)
			else
			
				Mission.stranded_truck1 = true
--				SetTeamNum(atk6,Mission.comp_team)
			end

			if (Mission.stranded_truck1) then
			
				Goto(Mission.atk6, "convoy6")
				Mission.stranded_truck1 = false
			end
		end

		if (IsOdf(Mission.atk3,"fvserv")) then
		
			if (IsAlive(Mission.atk1)) then
				Follow(Mission.atk3,Mission.atk1)
			elseif (IsAlive(Mission.atk2)) then
				Follow(Mission.atk3,Mission.atk2)
			else
			
				Mission.stranded_truck1 = true
--				SetTeamNum(atk6,Mission.comp_team)
			end

			if (Mission.stranded_truck1) then
			
				Goto(Mission.atk3, "attack3")
				Mission.stranded_truck1 = false
			end
		end
--		else Attack(Mission.atk3,Mission.recy)

		if ((IsAlive(Mission.ConvoyTug)) and (not IsAlive(Mission.titan1)) and (IsAlive(Mission.titan2))) then
		
			Goto(Mission.titan2, "convoy_path")
			Follow(Mission.ConvoyTug, Mission.titan2)
			Follow(Mission.sentry1, Mission.ConvoyTug)
			Follow(Mission.sentry2, Mission.ConvoyTug)
			Follow(Mission.healer1, Mission.titan2)
			Follow(Mission.healer2, Mission.ConvoyTug)
--			PrintConsoleMessage("titan1 dead following Mission.titan2")
		
		elseif ((IsAlive(Mission.ConvoyTug)) and (not IsAlive(Mission.titan2)) and (IsAlive(Mission.sentry1)) and (IsAlive(Mission.sentry2))) then
		
			Goto(Mission.ConvoyTug, "convoy_path")
			Defend2(Mission.sentry1, Mission.ConvoyTug)
			Defend2(Mission.sentry2, Mission.ConvoyTug)
			Follow(Mission.healer1, Mission.ConvoyTug)
			Follow(Mission.healer2, Mission.ConvoyTug)
--			PrintConsoleMessage("titan1 and Mission.titan2 dead sentries and healers defending Mission.tug")
		
		elseif ((IsAlive(Mission.ConvoyTug)) and (not IsAlive(Mission.sentry1)) and (IsAlive(Mission.sentry2))) then
		
			Goto(Mission.ConvoyTug, "convoy_path")
			Defend2(Mission.sentry2, Mission.ConvoyTug)
			Follow(Mission.healer1, Mission.ConvoyTug)
			Follow(Mission.healer2, Mission.ConvoyTug)
--			PrintConsoleMessage("titan1, Mission.titan2, Mission.sentry1 dead Mission.sentry2 and healers protecting Mission.tug")
		
		elseif ((IsAlive(Mission.ConvoyTug)) and (IsAlive(Mission.sentry1)) and (not IsAlive(Mission.sentry2))) then
		
			Goto(Mission.ConvoyTug, "convoy_path")
			Defend2(Mission.sentry1, Mission.ConvoyTug)
			Follow(Mission.healer1, Mission.ConvoyTug)
			Follow(Mission.healer2, Mission.ConvoyTug)
--			PrintConsoleMessage("titan1, Mission.titan2, Mission.sentry1 dead Mission.sentry1 and healers protecting Mission.tug")
		
		elseif ((IsAlive(Mission.ConvoyTug)) and (not IsAlive(Mission.sentry1)) and (not IsAlive(Mission.sentry2))) then
		
			Goto(Mission.ConvoyTug, "convoy_path")
			Follow(Mission.healer1, Mission.ConvoyTug)
			Follow(Mission.healer2, Mission.ConvoyTug)
--			PrintConsoleMessage("escorts dead healers following Mission.tug")
		
		elseif (IsAlive(Mission.ConvoyTug)) then
		
			Goto(Mission.ConvoyTug, "convoy_path")
			Follow(Mission.healer1, Mission.ConvoyTug)
			Follow(Mission.healer2, Mission.ConvoyTug)
--			PrintConsoleMessage("tug following convoy path")
		end
	end

	-- just for general purpose
	Mission.time_counter = Mission.time_counter + 1
	
	if Mission.mission_state == 0 then  -- haven't found defenses
		 -- build up
			AddScrap(Mission.comp_team,1)
			AddScrap(Mission.comp_teamb,1)
		
		if ((GetDistance(Mission.player,"turret1")<200.0) 
		or  (GetDistance(Mission.player,"turret4")<200.0)) then
		
			--[[
				Satellite recon shows
				you are heading into the
				heart of enemy defenses.  
			]]
			-- finish up these attacks
			Attack(Mission.atk1,Mission.recy)
			Attack(Mission.atk2,Mission.recy)

			if (IsOdf(Mission.atk3,"fvserv")) then
			
				if (IsAlive(Mission.atk1)) then
					Follow(Mission.atk3,Mission.atk1)
				elseif (IsAlive(Mission.atk2)) then
					Follow(Mission.atk3,Mission.atk2)
				else
				
					Mission.stranded_truck1 = true
	--				SetTeamNum(atk6,Mission.comp_team)
				end

				if (Mission.stranded_truck1) then
				
					Goto(Mission.atk3, "attack3")
					Mission.stranded_truck1 = false
				end
			
			else Attack(Mission.atk3,Mission.recy)
			end 
			
			if (not IsAlive(Mission.power1)) then
			
				Attack(Mission.atk4,Mission.recy)
				Attack(Mission.atk5,Mission.recy)

				if (IsOdf(Mission.atk6,"fvserv")) then
				
					if (IsAlive(Mission.atk4)) then
						Follow(Mission.atk6,Mission.atk4)
					elseif (IsAlive(Mission.atk5)) then
						Follow(Mission.atk6,Mission.atk5)
					else
					
						Mission.stranded_truck1 = true
		--				SetTeamNum(atk6,Mission.comp_team)
					end

					if (Mission.stranded_truck1) then
					
						Goto(Mission.atk6, "convoy6")
						Mission.stranded_truck1 = false
					end
				
				else Attack(Mission.atk6,Mission.recy)
				end
			
			else
			
				Attack(Mission.atk4,Mission.power1)
				Attack(Mission.atk5,Mission.power1)

				if (IsOdf(Mission.atk6,"fvserv")) then
				
					if (IsAlive(Mission.atk4)) then
						Follow(Mission.atk6,Mission.atk4)
					elseif (IsAlive(Mission.atk5)) then
						Follow(Mission.atk6,Mission.atk5)
					else
					
						Mission.stranded_truck1 = true
		--				SetTeamNum(atk6,Mission.comp_team)
					end

					if (Mission.stranded_truck1) then
					
						Goto(Mission.atk6, "convoy6")
						Mission.stranded_truck1 = false
					end
				
				else Attack(Mission.atk6,Mission.power1)
				end
			end

			AudioMessage("isdf1603.wav")
			Mission.sneak_timer = 0
			Mission.mission_state = 5
		end

		if (Mission.time_counter%1800==0)   then -- every 180 sec, surprise then
		
			--[[
			if (not Mission.takeoff) then
			
				Mission.takeoff = true
				RemoveObject(Mission.dropship)
			end
			]]
			Attack(Mission.atk1,Mission.recy)
			Attack(Mission.atk2,Mission.recy)
			if (IsOdf(Mission.atk3,"fvserv")) then
			
				if (IsAlive(Mission.atk1)) then
					Follow(Mission.atk3,Mission.atk1)
				elseif (IsAlive(Mission.atk2)) then
					Follow(Mission.atk3,Mission.atk2)
				else
				
					Mission.stranded_truck1 = true
	--				SetTeamNum(atk6,Mission.comp_team)
				end

				if (Mission.stranded_truck1) then
				
					Goto(Mission.atk3, "attack3")
					Mission.stranded_truck1 = false
				end
			
			else Attack(Mission.atk3,Mission.recy)
			end

		end	-- every 180 seconds

		if (Mission.time_counter%1801==0)  then -- it takes 3 min time to get back to this then
		
			if (not IsAlive(Mission.power1)) then
			
				Attack(Mission.atk4,Mission.recy)
				Attack(Mission.atk5,Mission.recy)
				if (IsOdf(Mission.atk6,"fvserv")) then
				
					if (IsAlive(Mission.atk4)) then
						Follow(Mission.atk6,Mission.atk4)
					elseif (IsAlive(Mission.atk5)) then
						Follow(Mission.atk6,Mission.atk5)
					else
					
						Mission.stranded_truck1 = true
		--				SetTeamNum(atk6,Mission.comp_team)
					end

					if (Mission.stranded_truck1) then
					
						Goto(Mission.atk6, "convoy6")
						Mission.stranded_truck1 = false
					end
				
				else Attack(Mission.atk6,Mission.recy)
				end
			
			else
			
				Attack(Mission.atk4,Mission.power1)
				Attack(Mission.atk5,Mission.power1)
				if (IsOdf(Mission.atk6,"fvserv")) then
				
					if (IsAlive(Mission.atk4)) then
						Follow(Mission.atk6,Mission.atk4)
					elseif (IsAlive(Mission.atk5)) then
						Follow(Mission.atk6,Mission.atk5)
					else
					
						Mission.stranded_truck1 = true
		--				SetTeamNum(atk6,Mission.comp_team)
					end

					if (Mission.stranded_truck1) then
					
						Goto(Mission.atk6, "convoy6")
						Mission.stranded_truck1 = false
					end
				
				else Attack(Mission.atk6,Mission.power1)
				end

			end
--			end	-- every 180 seconds/3 minutes

			if ((not IsAlive(Mission.atk1)) and (not IsAlive(Mission.atk2)) and (not IsAlive(Mission.atk3))) then
			
				Mission.atk1 = BuildObject("fvatank",Mission.comp_team,"attack1")
				Mission.atk2 = BuildObject("fvatank",Mission.comp_team,"attack2")
				Mission.atk3 = BuildObject("fvserv",Mission.comp_team,"attack3")
		--SetObjectiveOn(Mission.atk1)
		--SetObjectiveOn(Mission.atk2)
		--SetObjectiveOn(Mission.atk3)
			end

			if ((not IsAlive(Mission.atk4)) and (not IsAlive(Mission.atk5)) and (not IsAlive(Mission.atk6))) then
			
				Mission.atk4 = BuildObject("fvwalk",Mission.comp_team,"attack4")
--				PrintConsoleMessage("fvwalk-Mission.atk4 built at attack4")
				Mission.atk5 = BuildObject("fvwalk",Mission.comp_team,"attack5")
--				PrintConsoleMessage("fvwalk-Mission.atk5 built at attack5")
				Mission.atk6 = BuildObject("fvwalk",Mission.comp_team,"attack6")
--				PrintConsoleMessage("fvwalk-atk6 built at attack6")
			--SetObjectiveOn(Mission.atk4)
			--SetObjectiveOn(Mission.atk5)
			--SetObjectiveOn(atk6)
			end
		end	-- every 180 seconds
			-- case 0

	elseif Mission.mission_state == 5 then
		-- in case we didn't before
		LateAttacks()
		Mission.sneak_timer = Mission.sneak_timer + 1
		if (Mission.sneak_timer%4000==0)   then -- was 8000 then
		
			Mission.sneak1 = BuildObject("fvartl",Mission.comp_team,"attack1")
			Mission.sneak2 = BuildObject("fvartl",Mission.comp_team,"attack2")
			Mission.sneak3 = BuildObject("fvartl",Mission.comp_team,"attack3")
		--SetObjectiveOn(Mission.sneak1)
		--SetObjectiveOn(Mission.sneak2)
		--SetObjectiveOn(Mission.sneak3)
			Goto(Mission.sneak1,"sneak1")
			Goto(Mission.sneak2,"sneak2")
			Goto(Mission.sneak3,"sneak3")
			Mission.mission_state = Mission.mission_state + 1
		end
			-- case 5

	elseif Mission.mission_state == 6 then
		LateAttacks()
		if ((GetDistance(Mission.sneak1,"sneak1")<10.0) and
			(GetDistance(Mission.sneak2,"sneak2")<10.0) and 
			(GetDistance(Mission.sneak3,"sneak3")<10.0) ) then
		
			Attack(Mission.sneak1,Mission.recy)
			Attack(Mission.sneak2,Mission.recy)
			Mission.mission_state = 5-- get back
		end
			--case 6

	elseif Mission.mission_state == 7 then
		--[[
			We've identified retreating 
			units coming towards your position.  
			Destroy them.  
		]]

		Mission.convoy_timer = Mission.convoy_timer - 1
		if (Mission.convoy_timer==0) then
		
			AudioMessage("isdf1603a.wav")
			AudioMessage("isdf1604.wav")
			ClearObjectives()
			AddObjective("isdf1603.otf","WHITE",5.0)
			SetObjectiveOn(Mission.ConvoyTug)
			tempstr = TranslateString("Mission1101")  -- Convoy
			SetObjectiveName(Mission.ConvoyTug,tempstr)
			Mission.mission_state = Mission.mission_state + 1
		end
			-- case 7
	
	elseif Mission.mission_state == 8 then
		if (not IsAlive(Mission.ConvoyTug)) then
		
			ClearObjectives()
			AddObjective("isdf1604.otf","WHITE",5.0)
			Mission.mission_state = Mission.mission_state + 1
			SucceedMission(GetTime()+15.0,"isdf16w1.txt")
			AudioMessage("isdf1605.wav")
		end
		--[[
		if (GetDistance(Mission.tug,"gtow3")<100.0) then
		
			FailMission(GetTime()+5.0,"isdf16l1")
			Mission.mission_state = 10
		end
		]]
			--case 8
		
	elseif Mission.mission_state == 9 then  -- Mission.player gets into the bigh
		if ((GetDistance(Mission.player,goal1)<25.0) 
			or
			(GetDistance(Mission.player,Mission.goal2)<25.0)
			or
			(GetDistance(Mission.player,Mission.goal3)<25.0)
			or
			(GetDistance(Mission.player,Mission.goal4)<25.0)) then
		
			-- Play cineractive
			Mission.mission_state = Mission.mission_state + 1
		end
			-- case 9
		--[[
			End cineractive.
		]]
	
		

	elseif Mission.mission_state == 12 then
		--[[
			You lose

		]]
			FailMission(GetTime()+10.0,"isdf1605.otf")
			Mission.mission_state = Mission.mission_state + 1
		

	end -- switch		
 
end