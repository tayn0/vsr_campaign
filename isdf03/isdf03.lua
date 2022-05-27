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
	ON_HOLD = false,
	start_done = false,
	briefing_message = false,
	in_combat = false,
	john_injured = false,
	john_full_health = false,
	john_low_ammo = false,
	player_lost = false,
	shab_leave_base = false,
	shab_to_building = false,
	shab_at_building = false,
	shab_outside = false,
	enter_building = false,
	search_message = false,
	ship_destroyed = false,
	tech_found = false,
	shab_inside = false,
	john_inside = false,
	game_over = false,
	complain1 = false,
	complain2 = false,
	complain_message = false,
	start_check = false,
	at_check1 = false,
	at_check2 = false,
	at_check3 = false,
	at_check4 = false,
	hauler_move = false,
	wait_there_message = false,
	stop_it_message = false,
	hauler_message = false,
	back_in = false,
	shab_dead = false,
	suspend_death = false,
	go_to_tunnel = false,
	shab_through = false,
	hauler_swap = false,
	shab_at_extank = false,
	shab_tech_comment = false,
	shab_at_tech = false,
	mayday_message = false,
	respond1 = false,
	respond2 = false,
	respond3 = false,
	respond4 = false,
	respond5 = false,
	to_comm = false,
	tunnel_to_comm = false,
	reroute1 = false,
	reroute2 = false,
	reroute3 = false,
	reroute_cbunk = false,
	cbunk_message1 = false,
	cbunk_message2 = false,
	cbunk_message3 = false,
	cbunk_message4 = false,
	cbunk_message5 = false,
	pickup1 = false,
	pickup2 = false,

	first_spawn = false,
	start_attack1 = false,
	hauler1_for_extank1 = false,
	go_for_extank2 = false,
	hauler1_at_check1 = false,
	hauler2_at_check1 = false,
	hauler1_at_base = false,
	hauler2_at_base = false,
	hauler1_return = false,
	hauler2_return = false,
	hauler_escape = false,
	first_h1_chance = false,
	first_h2_chance = false,
	haulers_dead = true,
	attack_wave_dead = true,
	attack_go = false,
	attack_power = false,
	haulers_go = false,
	braddock_message1 = false,
	braddock_message2 = false,
	braddock_message3 = false,
	truck_message = false,
	truck_message2 = false,
	truck_message3 = false,
	truck_message4 = false,
	fix_armory_message = false,
	get_weapon_message = false,
	shab_mayday1 = false,
	shab_mayday2 = false,
	shab_mayday3 = false,
	shab_mayday4 = false,
	the_end = false,
	movie_set = false,
	tunnel_look = false,
	shab_whatever = false,
	at_tunnel = false,
	player_in_tank = false,
	john_in_ship = true,
	remove_shab = false,
	nav_alive = false,
	finish_message = false,
	power_up_alive = false,
	prep_truck = false,
	armory_message1 = false,
	armory_message2 = false,
	armory_message3 = false,
	shab_return = false,
	shab_home = false,
	endbrad_message = false,
	scion1_defend = false,
	scion2_defend = false,
	change_look = false,
	fire_message = false,
	disconnect = false,
	wadadilly = false,
	tank_message = false,
	clear_tank = false,
	doo = false,
	weapon_look = false,
	extra_spawn = false, 
	extras_dead = false, 
	extra1_dead = false,
	extra2_dead = false, 
	extra_attack = false,
	new_orders = false,
	power_hit = false,
	first_tank_check = false,
	set_brad_time = false,
	go_on_shab = false,
	hauler1_escape = false,
	hauler2_escape = false,
	camera1 = false,
	nav_otf = false,
	blah1 = false,
	blah2 = false, 
	sweet_nothings = false,
	service_help = false,
	scion3_move = false,
	scion4_move = false,
	brad_warning = true,
	get_this_done = false,

--  floats
	briefing_time = 1.0,
	player_check = 1.0,
	last_fucking_time = 999999.9,
	player_lost_time = 999999.9,
	return_message = 999999.9,
	move_out_time = 999999.9,
	wait_time = 999999.9,
	check_john_time = 999999.9,
	ship_destroyed_time = 999999.9,
	tech_check = 1.0,
	stop_check = 999999.9,
	shab_check = 999999.9,
	shab_message_time = 999999.9,
	mayday_message_time = 999999.9,

	hauler_time = 999999.9,
	escape_check1 = 999999.9,
	wave1_time = 999999.9,
	wave2_time = 999999.9,
	wave3_time = 999999.9,
	wave4_time = 999999.9,
	attack_check = 999999.9,
	escape_check2 = 999999.9,
	braddock_time = 999999.9,
	truck_message_time = 999999.9,
	movie_start_time = 999999.9,
	hop_time = 999999.9,
	remove_time = 999999.9,
	looky_time = 999999.9,
	fire_reset = 999999.9,
	new_wave_time = 999999.9,
	power_fire_reset = 999999.9,
	brad_time = 999999.9,
	movie_time = 999999.9,
	nav_otf_time = 999999.9,
	

--  handles
	player,
	player_ship,
	shabayev,
	truck,
	power1,
--	power2,
--	tech_power,
	tech_hanger,
	armory,
	tech_center,
	--startbase_cbunk,
	endbase_cbunk,
	field_cbunk,
	dead_tank,
	sdrop,
	escape_tug,
	scion1,
	scion2,
	scion3,
	scion4,
	scion5,
	scion6,
	hauler1,
	hauler2,
	hauler3,
	stranded1,
	stranded2,
	shab,
	ex_tank1,
	ex_tank2,
	ex_tank3,
	talk = 0,
	audmsg = 0,
	speak = 0,
	nav1,
	friend1,
	friend2,
	shab2,
	miller,
	simms,
	power_up,
	extra1,
	extra2,
	pilot
   
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
	Mission.shabayev = GetHandle("shabayev")
	Mission.truck = GetHandle("truck")
	Mission.power1 = GetHandle("power1")
--	Mission.power2 = GetHandle("power2")
--	Mission.tech_power = GetHandle("tech_power")
	Mission.tech_hanger = GetHandle("tech_hanger")
	Mission.armory = GetHandle("armory")
	Mission.tech_center = GetHandle("tech_center")
	--startbase_cbunk = GetHandle("startbase_cbunk")
	Mission.endbase_cbunk = GetHandle("endbase_cbunk")
	Mission.field_cbunk = GetHandle("field_cbunk")
	Mission.dead_tank = GetHandle("dead_tank")
	Mission.sdrop = GetHandle("sdrop")
	Mission.escape_tug = nil
	Mission.scion1 = nil
	Mission.scion2 = nil
	Mission.scion3 = nil
	Mission.scion4 = nil
	Mission.scion5 = nil
	Mission.scion6 = nil
	Mission.hauler1 = GetHandle("hauler1")
	Mission.hauler2 = nil
	Mission.hauler3 = nil
	Mission.stranded1 = nil
	Mission.stranded2 = nil
	Mission.shab = nil
	Mission.ex_tank1 = GetHandle("ex_tank1")
	Mission.ex_tank2 = GetHandle("ex_tank2")
	Mission.ex_tank3 = nil
	Mission.talk = 0
	Mission.audmsg = 0
	Mission.speak = 0
	Mission.nav1 = nil
	Mission.friend1 = nil
	Mission.friend2 = nil
	Mission.shab2 = nil
	Mission.miller = nil
	Mission.simms = nil
	Mission.power_up = nil
	Mission.extra1 = nil
	Mission.extra2 = nil
	Mission.pilot = nil
	
	PlayerTeam = GetTeamNum(Mission.dead_tank)
	xfrm = GetTransform(Mission.dead_tank)
	RemoveObject(Mission.dead_tank)
	Mission.dead_tank = BuildObject("ivtank_vsr", PlayerTeam, xfrm)
	RemovePilot(Mission.dead_tank)
	SetLabel(Mission.dead_tank, "dead_tank")
	
	PlayerTeam = GetTeamNum(Mission.player)
	xfrm = GetTransform(Mission.player)
	RemoveObject(Mission.player)
	Mission.player = BuildObject("ivscout_vsr", PlayerTeam, xfrm)
	SetAsUser(Mission.player, PlayerTeam)
	SetLabel(Mission.player, "player_ship")
	Mission.player_ship = GetPlayerHandle()
	

PreloadODF("fvtug3")
PreloadODF("fvpscou3")
PreloadODF("fvpsnt3")

end

function AddObject(h) --This function is called when an object appears in the game. --
	if ((Mission.shab == nil) and (IsOdf(h,"ispilo"))) then
	
		if (h ~= Mission.player) then
		
			Mission.shab = h
			Mission.suspend_death = true
		end
	
	elseif ((Mission.cbunk_message3) and (not Mission.john_in_ship) and (Mission.nav1 == nil) and (IsOdf(h,"ibnav"))) then
	
		Mission.nav1 = h
		Mission.nav_alive = true
	
	elseif ((Mission.power_up == nil) and (IsOdf(h,"apshdw"))) then
	
		Mission.power_up = h
		Mission.power_up_alive = true
	
	elseif (IsOdf(h,"fspilo")) then
	
		Mission.pilot = h
		Damage(Mission.pilot,100)
		--RemoveObject(Mission.pilot)	
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


--------------------------------------------------------------------------/
--[[
if (not Mission.start_done) then

	Mission.hauler2 = BuildObject("fvtug3",2,"final_check")
	Mission.escape_check1 = GetTime() + 5.0
	Mission.shab_leave_base = true
	Mission.hauler2_return = true
	Mission.start_done = true
end
]]

if (not Mission.ON_HOLD) then

--------------------------------------------------------------------------/

	-- this is keeping the Mission.armory around

	if ((IsAround(Mission.armory)) and (GetHealth(Mission.armory) < .2)) then
	
		SetCurHealth(Mission.armory,100)
	end
	--------------------------------------------


	-- this is keeping the relics around

	if ((IsAround(Mission.ex_tank1)) and (GetCurHealth(Mission.ex_tank1) < 2000)) then
	
		SetCurHealth(Mission.ex_tank1,2000)
	end

	if ((IsAround(Mission.ex_tank2)) and (GetCurHealth(Mission.ex_tank2) < 2000)) then
	
		SetCurHealth(Mission.ex_tank2,2000)
	end
	--------------------------------------------

	
	-- this is checking to see what vehicle the Mission.player is in


	if (IsOdf(Mission.player,"ivtank_vsr")) then
	
		Mission.first_tank_check = true
		Mission.player_in_tank = true
	
	else
	
		Mission.player_in_tank = false
	end


	if ((IsOdf(Mission.player,"ivscout_vsr")) or (IsOdf(Mission.player,"ivtank_vsr"))) then
	
		Mission.john_in_ship = true
	
	else
	
		Mission.john_in_ship = false
	end
	--------------------------------------------


	-- this is hopefully going to objectify the power plant

	if (IsAround(Mission.power1)) then
	
		if (not Mission.power_hit) then
		
			if (GetTime() - GetLastEnemyShot(Mission.power1) < .2) then
			
				SetObjectiveOn(Mission.power1)
				tempstr = TranslateString("Mission0301")  -- Power Gen. Damaged

				SetObjectiveName(Mission.power1, tempstr)
				Mission.power_fire_reset = GetTime() + 10.0
				Mission.power_hit = true
			end
		end
	end

	if ((Mission.power_hit) and (Mission.fire_reset < GetTime())) then
	
		Mission.power_fire_reset = GetTime() + 999999.9
		SetObjectiveOn(Mission.power1)
		tempstr = TranslateString("Mission0302")  -- Power Gen. Damaged

		SetObjectiveName(Mission.power1, tempstr)
		Mission.power_hit = false
	end
	--------------------------------------------



	-- this is checking to make sure the Mission.player does not attack Mission.shabayev

	if (not Mission.in_combat) then
	
		if ((not Mission.fire_message) and (IsAlive(Mission.shabayev))) then
		
			if (GetTime() - GetLastFriendShot(Mission.shabayev) < .2) then
			
				AudioMessage("ff01.wav") -- (Mission.shab) watch your firingnot 
				Mission.fire_reset = GetTime() + 2.0
				Mission.fire_message = true
			end
		end
	end

	if ((Mission.fire_message) and (Mission.fire_reset < GetTime())) then
	
		Mission.fire_reset = GetTime() + 999999.9
		Mission.fire_message = false
	end
	--------------------------------------------


	-- this is checking the condition of the Mission.player

	if ((IsAlive(Mission.player)) and (Mission.john_in_ship) and (not Mission.john_injured)) then
	
		if (GetCurHealth(Mission.player) < 500) then
		
			Mission.john_injured = true
			Mission.john_full_health = false
		end
	end


	if ((IsAlive(Mission.player)) and (Mission.john_in_ship) and (Mission.john_injured)) then
	
		if (GetCurHealth(Mission.player) > 1700) then
		
			Mission.john_injured = false
		end
	end
	--------------------------------------------


--[[
	if ((IsAlive(Mission.player)) and (Mission.john_in_ship) and (not Mission.john_low_ammo)) then
	
		if (GetCurAmmo(Mission.player) < 200) then
		
			Mission.john_low_ammo = true
		end
	end


	if ((IsAlive(Mission.player)) and (Mission.john_in_ship) and (Mission.john_low_ammo)) then
	
		if (GetCurAmmo(Mission.player) > 700) then
		
			Mission.john_low_ammo = false
		end
	end
]]

	if ((not Mission.john_injured) and (not Mission.john_low_ammo)) then
	
		Mission.john_full_health = true
	end


-- checking to see of the Mission.player is lost code

--[[
if (IsAlive(Mission.player)) then

	if ((not Mission.player_lost) and (Mission.player_check < GetTime())) then
	
		Mission.player_check = GetTime() + 1.5


		if (GetDistance(Mission.shabayev,Mission.player) > 500.0) then
		
			Mission.player_check = GetTime() + 1.5
			Mission.player_lost_time = GetTime() + 120.0
			Mission.return_message = false
			Mission.player_lost = true
		end
	end


	-- when the Mission.player returns to Mission.shab
	if ((Mission.player_lost) and (Mission.player_check < GetTime())) then
	
		Mission.player_check = GetTime() + 1.5


		if (GetDistance(Mission.shabayev,Mission.player) < 150.0) then
		
			Mission.player_lost = false
		end
	end


	-- if he is told to return and doesn't then
	if ((not Mission.return_message) and (Mission.player_lost) and (Mission.player_lost_time < GetTime())) then
	
		AudioMessage("wohoo.wav") -- (Mission.shab) 
		Mission.player_check = GetTime() + 1.5
		Mission.player_lost_time = GetTime() + 300.0
		Mission.return_message = true
	end
end
]]


	if (not Mission.start_done) then
	
		--SetColorFade(1,0.5,Make_RGBA(0, 0, 0, 255))

		SetPerceivedTeam(Mission.ex_tank1,2)
		SetPerceivedTeam(Mission.ex_tank2,2)
		SetObjectiveOff(Mission.hauler1)
		SetAnimation(Mission.sdrop,"open",1)
		SetAvoidType(Mission.shabayev,0)
		Pickup(Mission.hauler1,Mission.ex_tank1)
		SetGroup(Mission.shabayev,-1)
		LookAt(Mission.shabayev,Mission.player)
		SetObjectiveOn(Mission.shabayev)
		SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
		Mission.start_done = true
	end


	-- this makes the Scion Hauler stay still until I'm ready

	if ((Mission.start_done) and (not Mission.hauler_move)) then
	
		if (HasCargo(Mission.hauler1)) then
		
			Stop(Mission.hauler1)
		end
	end
	--------------------------------------------


-- this is where I start the mission

if ((not Mission.shab_leave_base) and (IsAlive(Mission.player))) then

	-- this is shabs opening biefing

	if ((not Mission.briefing_message) and (Mission.briefing_time < GetTime())) then
	
		Mission.talk = AudioMessage("isdf0301.wav") -- (Mission.shab) search the tunnels
		Mission.move_out_time = GetTime() + 3.0
		Mission.check_john_time = GetTime() + 240.0
		Mission.briefing_message = true
	end
	------------------------------------------/

	
	-- this is Mission.shab looking at the tunnel during opening briefing

	if ((Mission.briefing_message) and (not Mission.tunnel_look) and (Mission.move_out_time < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.tech_center)
		Mission.tunnel_look = true
	end
	------------------------------------------/


	-- checking to see if the Mission.player is carrying out his orders then

	if (not Mission.hauler_move) then
	
		if ((Mission.briefing_message) and (not Mission.search_message) and (Mission.check_john_time < GetTime())) then
		
			ClearObjectives()
			AddObjective("isdf0301.otf", "WHITE")
			Mission.check_john_time = GetTime() + 240.0
			AudioMessage("isdf0302.wav") -- (Mission.shab) Have you checked the tunnels john?
			Mission.search_message = true
		end
	end
	--------------------------------------------
	
	
	-- this is sending Mission.shab to the tall building

	if ((Mission.briefing_message) and (not Mission.at_check3) and (not Mission.shab_to_building) and (IsAudioMessageDone(Mission.talk))) then
	
		ClearObjectives()
		AddObjective("isdf0301.otf", "WHITE")
		Goto(Mission.shabayev,"building_point")
		Mission.shab_to_building = true
	end
	--------------------------------------------


	-- Mission.shab reached the tall building

	if ((Mission.shab_to_building) and (not Mission.shab_at_building) and (GetDistance(Mission.shabayev,"building_point") < 50.0)) then
	
		LookAt(Mission.shabayev,Mission.player)
		Mission.wait_time = GetTime() + 3.0
		Mission.shab_at_building = true
	end
	--------------------------------------------

--[[
	-- this is Mission.shabayev compaining if the Mission.player does not follow her orders then

	if (not Mission.complain_message) then
	
		if (Mission.complain1) then
		
			--TriggerAnimation(Mission.shabayev,"") -- this is where I might trigger an animation of something
			Mission.complain_message = true
		end

		if (Mission.complain2) then
		
			ClearObjectives()
			AddObjective("isdf0301.otf", "WHITE")
			AudioMessage("isdf0303.wav") -- (Mission.shab) I ordered you to check out the tunnels john - I can check out the buildings
			Mission.complain_message = true
		end
	end
	--------------------------------------------
]]
	
-- this is the first hauler encounter code

	-- first I have to make sure the Mission.player is in the tunnels

	if ((Mission.briefing_message) and (not Mission.at_check4)) then
	
		if (InBuilding(Mission.player)) then
		
--[[			if ((not Mission.start_check) and (GetDistance(Mission.player,"check_start1") < 8.0)) then
			
				Mission.start_check = true
			end

			if ((not Mission.start_check) and (GetDistance(Mission.player,"check_start2") < 8.0)) then
			
				Mission.start_check = true
			end

			if ((Mission.start_check) and (not Mission.at_check1) and (GetDistance(Mission.player,"check1") < 8.0)) then
			
				Mission.at_check1 = true
			end

			if ((Mission.at_check1) and (not Mission.at_check2) and (GetDistance(Mission.player,"check2") < 8.0)) then
			
				Mission.at_check2 = true
			end
]]
			if (--[[(Mission.at_check2) and (not Mission.at_check3) and ]](GetDistance(Mission.player,"check3") < 12.0)) then
			
				Mission.at_check3 = true
			end

			if ((Mission.at_check3) and (not Mission.at_check4) and (GetDistance(Mission.player,"check4") < 8.0)) then
			
				Mission.at_check4 = true
			end
			--------------------------------------------


			-- now *in theory* the Mission.player is in the tunnel and sees the hauler

			if ((Mission.at_check3)--[[(Mission.start_check)]] and (not Mission.hauler_move)) then
			
				if (IsAlive(Mission.hauler1)) then
				
					Mission.stop_check = GetTime() + 1.0
					Retreat(Mission.hauler1,"haulerout_path1")
					Mission.hauler_move = true
				end	
			end
			--------------------------------------------
		end
	end


	-- this is the code that make Mission.shab comment on the hauler

	if (not Mission.hauler_message) then
	
		if (Mission.at_check3) then
		
			ClearObjectives()
			AddObjective("isdf0301.otf", "WHITE")
			AddObjective("isdf0302.otf", "WHITE")
			AudioMessage("isdf0304.wav")-- (Mission.shab) I'm picking up something to the north of you - I'm on my waynot 
			Mission.hauler_message = true
		end
	end
	--------------------------------------------


	-- this is the code when the Mission.player reached the Mission.tech_center

	if ((not Mission.tech_found) and (Mission.tech_check < GetTime())) then
	
		Mission.tech_check = GetTime() + 1.0


		if (GetDistance(Mission.player,Mission.tech_center) < 80.0) then
		
			Mission.tech_found = true
		end
	end


	if ((Mission.tech_found) and (not Mission.hauler_move) and (not Mission.wait_there_message)) then
	
		AudioMessage("isdf0305.wav") -- (Mission.shab) I've never seen a building like that one - wait there, I'm coming over
		Mission.at_check3 = true
		Mission.wait_there_message = true
	end
	--------------------------------------------


	-- sending Mission.shab to tunnel

	if ((Mission.at_check3) and (not Mission.go_to_tunnel)) then
	
		SetObjectiveOn(Mission.shabayev)
		SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")
		Retreat(Mission.shabayev,"tunnel_start")
		--Goto(Mission.shabayev,"tunnel_path1",1)
		Mission.shab_check = GetTime() + 1.0
		Mission.go_to_tunnel = true
	end
	--------------------------------------------


	-- sending Mission.shab somewhere when she exits tunnel

	if ((Mission.go_to_tunnel) and (not Mission.shab_through) and (Mission.shab_check < GetTime())) then
	
		Mission.shab_check = GetTime() + 1.0


		if ((not Mission.at_tunnel) and (GetDistance(Mission.shabayev,"tunnel_start") < 30.0)) then
		
			Retreat(Mission.shabayev,"tunnel_path1")
			Mission.at_tunnel = true
		end


		if ((Mission.at_tunnel) and (GetDistance(Mission.shabayev,"shab_check1") < 55.0)) then
		
			if (IsAlive(Mission.hauler1)) then
			
				if (not Mission.stop_it_message) then
				
					ClearObjectives()
					AddObjective("isdf0302.otf", "GREEN")
					AddObjective("isdf0303.otf", "WHITE")
					AudioMessage("isdf0306.wav") -- (Mission.shab) stop that thing - don't let it get away
					Mission.stop_it_message = true
				end

				Attack(Mission.shabayev,Mission.hauler1)
				Mission.shab_through = true
			
			elseif ((Mission.hauler_swap) and (not Mission.respond3)) then
			
				Goto(Mission.shabayev,Mission.ex_tank1)
				Mission.shab_through = true
			end
		end
	end
	--------------------------------------------


	-- Mission.shab telling john to stop the hauler

	if ((Mission.hauler_move) and (not Mission.stop_it_message) and (Mission.stop_check < GetTime())) then
	
		Mission.stop_check = GetTime() + 0.5

		if ((IsAlive(Mission.hauler1)) and (GetDistance(Mission.hauler1,"hauler_check1") < 90.0)) then
		
			ClearObjectives()
			AddObjective("isdf0302.otf", "GREEN")
			AddObjective("isdf0303.otf", "WHITE")
			AudioMessage("isdf0306.wav") -- (Mission.shab) stop that thing - don't let it get away
			Mission.stop_it_message = true
		end
	end
	--------------------------------------------


	-- this is keeping the hauler alive just long enouph to get out of the tunnel
	
	if (not Mission.stop_it_message) then

		if (GetHealth(Mission.hauler1) < .8) then

			AddHealth(Mission.hauler1,100)
		end
	end
	--------------------------------------------


	-- this is temp code that spawns in the experimental tank when the hauler is killed

	if ((not IsAround(Mission.hauler1)) and (not Mission.hauler_swap)) then
	
		ClearObjectives()
		AddObjective("isdf0303.otf", "GREEN")

		if ((not Mission.shab_through) and (not Mission.respond3)) then
		
			AudioMessage("isdf0307.wav") -- (Mission.shab) good job john - stay there I'm on my way
			Goto(Mission.shabayev,Mission.ex_tank1)
		
		elseif (not Mission.respond3) then
		
			Goto(Mission.shabayev,Mission.ex_tank1)
		end

		Mission.hauler_swap = true
	end
	--------------------------------------------


	-- this is when Mission.shab reaches the ex_tank

	if ((Mission.hauler_swap) and (not Mission.shab_at_extank)) then
	
		if ((Mission.hauler_swap) and (GetDistance(Mission.shabayev,Mission.ex_tank1) < 30.0)) then
		
			LookAt(Mission.shabayev,Mission.ex_tank1)
			Mission.talk = AudioMessage("isdf0308.wav") -- (Mission.shab) whatever these are they are obviously interested in us
			Mission.shab_message_time = GetTime() + 10.0
			Mission.shab_at_extank = true
		end
	end
	--------------------------------------------


	-- Mission.shab goes to the Mission.tech_center

	if ((Mission.shab_at_extank) and (not Mission.shab_tech_comment) and (IsAudioMessageDone(Mission.talk))) then
	
		Goto(Mission.shabayev,Mission.tech_center)
		AudioMessage("isdf0309a.wav") -- (Mission.shab) I've never seen this buidling before either - Looks like weapons storage	
		Mission.shab_message_time = GetTime() + 1.0  --I dont know what isdf was doing here but this was no "outpost"
		Mission.mayday_message_time  = GetTime() + 15.0 
		Mission.braddock_time = GetTime() + 10.0
		Mission.shab_tech_comment = true
	end
	--------------------------------------------


	-- shes at tech center

	if ((not Mission.braddock_message1) and (Mission.shab_tech_comment) and (not Mission.shab_at_tech) and (Mission.shab_message_time < GetTime())) then
	
		Mission.shab_message_time = GetTime() + 1.0


		if (GetDistance(Mission.shabayev,Mission.tech_center) < 70.0) then
		
			LookAt(Mission.shabayev,Mission.tech_center)
			Mission.shab_at_tech = true
		end
	end
	--------------------------------------------


	-- this makes Mission.shab look at the weapons storage

	if ((not Mission.weapon_look) and (Mission.shab_at_tech)) then
	
		LookAt(Mission.shabayev,Mission.tech_hanger)
		Mission.weapon_look = true
	end
	--------------------------------------------
	

	-- this is the mayday message code

	if ((Mission.shab_at_tech) and (not Mission.mayday_message) and (Mission.braddock_time < GetTime())) then
	
		LookAt(Mission.shabayev,Mission.player)
		Mission.audmsg = AudioMessage("isdf0325b.wav") -- (Mission.miller) "mayday"
		Mission.mayday_message_time  = GetTime() + 10.0 
		Mission.mayday_message = true
	end

--[[
	-- Mission.shab responds

	if ((Mission.mayday_message) and (not Mission.respond1) and (IsAudioMessageDone(Mission.audmsg))) then
	
		Mission.audmsg = AudioMessage("isdf0314.wav") -- (Mission.shab) copy - barely go ahead
		Mission.mayday_message_time  = GetTime() + 10.0 
		Mission.respond1 = true
	end


	if ((Mission.respond1) and (not Mission.respond2) and (IsAudioMessageDone(Mission.audmsg))) then
	
		Mission.audmsg = AudioMessage("isdf0325.wav") -- (Mission.miller) The outpost come under heavy fire -we had to evac Can you assistnot 
		Mission.mayday_message_time  = GetTime() + 10.0 
		Mission.respond2 = true
	end
]]
	
	if ((Mission.mayday_message) and (not Mission.respond3) and (IsAudioMessageDone(Mission.audmsg))) then
	
		Mission.audmsg = AudioMessage("isdf0326.wav") -- (Mission.shab) Can you transmit location?
		Mission.mayday_message_time  = GetTime() + 10.0 
		Mission.respond3 = true
	end


	if ((Mission.respond3) and (not Mission.respond4) and (IsAudioMessageDone(Mission.audmsg))) then
	
		Mission.audmsg = AudioMessage("isdf0315.wav") -- (Mission.miller) negative?
		Mission.mayday_message_time  = GetTime() + 10.0 
		Mission.respond4 = true
	end


	if ((Mission.respond4) and (not Mission.respond5) and (IsAudioMessageDone(Mission.audmsg))) then
	
		Mission.audmsg = AudioMessage("isdf0316.wav") -- (Mission.shab) damn - follow menot 
		Mission.mayday_message_time  = GetTime() + 10.0 
		Mission.respond5 = true
	end
	
	
	if ((Mission.respond5) and (not Mission.to_comm) and (IsAudioMessageDone(Mission.audmsg))) then
	
		ClearObjectives()
		AddObjective("isdf0304.otf", "WHITE")
		--Goto(Mission.shabayev,"buba_point")
		Goto(Mission.shabayev,"tunnel_pathz") -- NEW
		Mission.mayday_message_time = GetTime() + 0.1 
		Mission.tunnel_to_comm = true
		Mission.to_comm = true
	end
	--------------------------------------------


	-- this Mission.shab heading back under the tunnel

	if ((Mission.tunnel_to_comm) and (not Mission.reroute1)) then
	
		--Mission.mayday_message_time  = GetTime() + 1.0 

		--if (GetDistance(Mission.shabayev,"buba_point") < 20.0) then
		if (GetDistance(Mission.shabayev,"check2") < 8.0) then
		
			Goto(Mission.shabayev,"check_start2")
			Mission.mayday_message_time = GetTime() + 1.0 
			--Mission.reroute2 = true
			Mission.reroute2 = true
			Mission.reroute1 = true
		end
	end
	--------------------------------------------


	-- this is getting her to go into the tunnel again
	
	if ((Mission.reroute1) and (not Mission.reroute2) and (Mission.mayday_message_time < GetTime())) then
	
		--Mission.mayday_message_time  = GetTime() + 0.5 


		if (GetDistance(Mission.shabayev,"tunnel_point1") < 8.0) then
		
			Goto(Mission.shabayev,"check_start2")
			Mission.mayday_message_time = GetTime() + 1.0 
			Mission.reroute2 = true
		end
	end
	--------------------------------------------


	if ((Mission.reroute2) and (not Mission.reroute3)--[[ and (Mission.mayday_message_time < GetTime())]]) then
	
		--Mission.mayday_message_time  = GetTime() + 1.0 


		if (GetDistance(Mission.shabayev,"check_start2") < 40.0) then
		
			Goto(Mission.shabayev,"bunker_point1")
			Mission.mayday_message_time = GetTime() + 1.0 
			AudioMessage("isdf0327.wav") --(Mission.shab) I hope those things haven't taken out the satellitesnot 
			Mission.reroute3 = true
		end
	end


	if ((not Mission.reroute_cbunk) and (Mission.reroute3) and (Mission.mayday_message_time < GetTime())) then
	
		--Mission.mayday_message_time  = GetTime() + 0.5 


		if (GetDistance(Mission.shabayev,"bunker_point1") < 40.0) then
		
			Goto(Mission.shabayev,Mission.endbase_cbunk)
			Mission.mayday_message_time = GetTime() + 1.0 
			Mission.reroute_cbunk = true
		end
	end


	if ((not Mission.reroute_cbunk) and (not Mission.reroute3) and (Mission.reroute1) and (GetCurrentCommand(Mission.shabayev) == 0)) then
	
		Goto(Mission.shabayev,Mission.endbase_cbunk)
		Mission.mayday_message_time = GetTime() + 1.0 
		Mission.reroute_cbunk = true
	end


	-- this is an alternative if i cannot get Mission.shab back in the tunnel successfully then
--[[
	if ((Mission.respond3) and (not Mission.to_comm) and (Mission.mayday_message_time < GetTime())) then
	
		Goto(Mission.shabayev,"bunker_path1")
		Mission.mayday_message_time = GetTime() + 1.0 
		outside_to_comm = true
		Mission.to_comm = true
	end

	
	if ((outside_to_comm) and (not Mission.reroute_cbunk) and (Mission.mayday_message_time < GetTime())) then
	
		Mission.mayday_message_time  = GetTime() + 1.0 


		if (GetDistance(Mission.shabayev,"bunker_point1") < 30.0) then
		
			Goto(Mission.shabayev,Mission.endbase_cbunk)
			Mission.mayday_message_time = GetTime() + 1.0 
			Mission.reroute_cbunk = true
		end
	end

]]
	

	if((Mission.tunnel_to_comm) and (not Mission.reroute3) and (GetDistance(Mission.shabayev,Mission.endbase_cbunk) < 250.0)) then
	
		Mission.reroute3 = true
		Goto(Mission.shabayev,Mission.endbase_cbunk)
		Mission.mayday_message_time = GetTime() + 1.0 
		Mission.reroute_cbunk = true
	end


	if ((not Mission.cbunk_message1) and (not Mission.player_lost) and (GetDistance(Mission.shabayev,Mission.endbase_cbunk) < 50.0)) then 
	
		Mission.reroute_cbunk = true
	end


	-- now Mission.shab is at the cbunk and tells john to go inside
	if ((Mission.reroute_cbunk) and (not Mission.cbunk_message1) and (Mission.mayday_message_time < GetTime())) then
	
		Mission.mayday_message_time  = GetTime() + 1.0 


		if ((not Mission.player_lost) and (GetDistance(Mission.shabayev,Mission.endbase_cbunk) < 50.0)) then
		
			LookAt(Mission.shabayev,Mission.player)
			ClearObjectives()
			AddObjective("isdf0305.otf", "WHITE")
			Mission.talk = AudioMessage("isdf0317.wav") -- (Mission.shab) I'm going to need you to find them for menot 
			Mission.mayday_message_time = GetTime() + 1.0 
			Mission.cbunk_message1 = true
		end		
	end


	if ((Mission.cbunk_message1) and (not Mission.cbunk_message2) and (not Mission.john_in_ship))  then
	
		StopAudioMessage(Mission.talk)
		Mission.talk = AudioMessage("isdf0318.wav") -- (Mission.shab) head into the bunkernot 
		Mission.cbunk_message2 = true
	end
	--------------------------------------------


	-- this is the code for when the Mission.player enters the comm bunker

	if ((Mission.cbunk_message2) and (not Mission.cbunk_message3)  and (GetDistance(Mission.player,Mission.endbase_cbunk) < 10.0)) then
	
		if (InBuilding(Mission.player)) then
		


			Mission.talk = AudioMessage("isdf0319.wav") -- (Mission.shab) Now move to the map terminal. When you point your reticle at it you will notice... push space bar to interface
			ClearObjectives()
			AddObjective("isdf0306.otf", "GREEN")
			AddObjective("isdf0307.otf", "WHITE")
			
			-- spawing in the distressed units
			Mission.miller = BuildObject("ivscout",1,"miller_spawn1")
			Mission.simms = BuildObject("ivscout",1,"simms_spawn1")
			LookAt(Mission.miller,Mission.simms)
			LookAt(Mission.simms,Mission.miller)
			Mission.looky_time = GetTime() + 5.0

			--Ally(3,2)
			--Ally(2,3)

			Mission.cbunk_message3 = true
		end
	end
	--------------------------------------------


	-- this is when the Mission.player interfaces with the terminal

	if ((Mission.cbunk_message3) and (not Mission.cbunk_message4) and (AtTerminal(Mission.player) == Mission.endbase_cbunk)) then
	
		StopAudioMessage(Mission.talk)
		Mission.talk = AudioMessage("isdf0328.wav") -- (Mission.shab) you should see other bunkers - look for players - place nav beacon

		if (IsAround(Mission.miller)) then
		
			SetObjectiveOn(Mission.miller)
			tempstr = TranslateString("Mission0102")  -- Red 1

			SetObjectiveName(Mission.miller,tempstr)
		end	
		
		-- because the Mission.player is in the bunker I will spawn in the first attack wave
		Mission.scion1 = BuildObject("fvpscou3",2,"base2_espawn1")
		Mission.scion2 = BuildObject("fvpscou3",2,"base2_espawn2")
		Mission.hauler1 = BuildObject("fvtug3",2,"base2_espawn3")
		Mission.hauler2 = BuildObject("fvtug3",2,"base2_espawn4")
		
		SetAvoidType(Mission.scion1,0)
		SetAvoidType(Mission.scion2,0)
		SetAvoidType(Mission.hauler1,0)

		Stop(Mission.scion1)
		Stop(Mission.scion2)
		Stop(Mission.hauler1)

		Mission.wave1_time = GetTime() + 180.0  -- was 180
		Mission.wave2_time = GetTime() + 360.0	-- was 360
		Mission.wave3_time = GetTime() + 540.0	-- was 540
--		Mission.wave4_time = GetTime() + 900.0 

		Mission.haulers_dead = false
		Mission.attack_wave_dead = false
		Mission.first_spawn = true		
		Mission.cbunk_message4 = true
	end

	
	if ((Mission.cbunk_message4) and (not Mission.cbunk_message5) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0330.wav") -- (Mission.shab) once you've located them drop a nav. To drop a nav...
		--BuildObject("ibnav",1,"miller_spawn1")-- TEMP
		Mission.nav_otf_time = GetTime() + 8.0
		Mission.cbunk_message5 = true
	end
	--------------------------------------------


	-- this is adding the nav otf

	if ((Mission.cbunk_message5) and (not Mission.nav_otf) and (Mission.nav_otf_time < GetTime())) then
	
		ClearObjectives()
		AddObjective("isdf0310.otf", "WHITE")
		Mission.nav_otf = true
	end
	--------------------------------------------


	-- this is going to have to check to see if the nav beacon exhists then

	if ((Mission.nav_alive) and (not Mission.go_on_shab)) then
	
		if ((Mission.cbunk_message3) and (GetDistance(Mission.miller,Mission.nav1) > 200.0)) then
		
			StopAudioMessage(Mission.talk)
			Mission.talk = AudioMessage("isdf0331.wav") -- (Mission.shab) make sure the nav is near the units
			ClearObjectives()
			AddObjective("isdf0310.otf", "RED")
			Mission.nav1 = nil
			Mission.nav_alive = false
		
		elseif (Mission.nav_alive) then
		
			ClearObjectives()
			AddObjective("isdf0310.otf", "GREEN")
			Mission.go_on_shab = true
		end
	end
	--------------------------------------------


	-- this sends her away
	
	if ((Mission.go_on_shab) and (not Mission.shab_leave_base)) then
	
		StopAudioMessage(Mission.talk)
		Mission.talk = AudioMessage("isdf0320.wav") -- (Mission.shab) thanks john - I'm on my way. Stay here and protect thos power plantsnot 
		Goto(Mission.shabayev,"leave_path") -- this will have to be the nav
		Mission.remove_time = GetTime() + 2.0
		SetPerceivedTeam(Mission.shabayev,2)
		Mission.shab_leave_base = true
	end
	--------------------------------------------
end

	-- this is Mission.shab saying stay alive

	if ((not Mission.sweet_nothings) and (Mission.shab_leave_base) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0332a.wav") -- (Mission.shab) you're a good Mission.pilot stay alive out herenot 
		--AudioMessage("isdf0310.wav")
		Mission.last_fucking_time = GetTime() + 15.0
		Mission.sweet_nothings = true
	end


	if ((not Mission.get_this_done) and (Mission.last_fucking_time < GetTime())) then
	
		AudioMessage("isdf0310.wav")

		if (IsAround(Mission.ex_tank1)) then
		
			SetObjectiveOn(Mission.ex_tank1)
			tempstr = TranslateString("Mission0303")  -- Hardware
			SetObjectiveName(Mission.ex_tank1,tempstr)
		end
		
		if (IsAround(Mission.ex_tank2)) then
		
			SetObjectiveOn(Mission.ex_tank2)
			tempstr = TranslateString("Mission0303")  -- Hardware
			SetObjectiveName(Mission.ex_tank2,tempstr)
		end

		Mission.get_this_done = true
	end


	-- this is checking to see when the Mission.player disconnects from the terminal

	if ((Mission.cbunk_message4) and (not Mission.disconnect) and (AtTerminal(Mission.player) == 0))  then
	
		if (Mission.shab_leave_base) then
		
			ClearObjectives()
			AddObjective("isdf0308.otf", "WHITE")

			if (IsAround(Mission.miller)) then
			
				SetObjectiveOff(Mission.miller)
			end

			if (IsAround(Mission.shabayev)) then
			
				SetObjectiveOff(Mission.shabayev)
			end
		
		elseif (not Mission.wadadilly) then
		
			StopAudioMessage(Mission.speak)
			Mission.speak = AudioMessage("isdf0328a.wav") -- (Mission.shab) where are you going John? I need you to find those men for me
			Mission.wadadilly = true
		end

		Mission.disconnect = true
	end


	if ((not Mission.shab_leave_base) and (Mission.disconnect) and (AtTerminal(Mission.player) == Mission.endbase_cbunk)) then
	
		Mission.wadadilly = false
		Mission.disconnect = false
	end


	-- this is checking to see of the Mission.player heads off towards Mission.miller and Mission.simms

	if (not Mission.shab_leave_base) then
	
		if ((Mission.cbunk_message3) and (not Mission.finish_message) and (Mission.john_in_ship)) then
		
			StopAudioMessage(Mission.speak)
			Mission.speak = AudioMessage("isdf0328b.wav") -- (Mission.shab) where are you going John? I need you to find those men for me
			Mission.finish_message = true
		end

		if ((Mission.finish_message) and (not Mission.john_in_ship)) then
		
			Mission.finish_message = false
		end
	end
	--------------------------------------------

	-- this is the Mission.miller and Mission.simms code

	if ((Mission.cbunk_message3) and (not Mission.remove_shab)) then
	
		if (Mission.looky_time < GetTime()) then
		
			Mission.looky_time = GetTime() + 5.0

			if (not Mission.change_look) then
			
				if (IsAround(Mission.miller)) then
				
					LookAt(Mission.miller,Mission.player)
				end

				if (IsAround(Mission.simms)) then
				
					LookAt(Mission.simms,Mission.field_cbunk)
				end

				Mission.change_look = true
			
			else
			
				if (IsAround(Mission.miller)) then
				
					LookAt(Mission.miller,Mission.field_cbunk)
				end

				if (IsAround(Mission.simms)) then
				
					LookAt(Mission.simms,Mission.player)
				end

				Mission.change_look = false
			end
		end
	end
	--------------------------------------------

	
--------------------------------------------------------------------------/
end

--[[
if ((not Mission.shab_leave_base) and (InBuilding(Mission.player))) then

		Mission.scion1 = BuildObject("fvpscou3",2,"base2_espawn1")
		Mission.scion2 = BuildObject("fvpscou3",2,"base2_espawn2")
		Mission.hauler1 = BuildObject("fvtug3",2,"base2_espawn3")
		--Mission.hauler2 = BuildObject("fvtug3",2,"base2_espawn4")

		SetAvoidType(Mission.scion1,0)
		SetAvoidType(Mission.scion2,0)
		SetAvoidType(Mission.hauler1,0)
		
		Stop(Mission.scion1)
		Stop(Mission.scion2)
		Stop(Mission.hauler1)

		Mission.wave1_time = GetTime() + 180.0 -- 3 minutes 
		Mission.wave2_time = GetTime() + 360.0 -- 6 minutes
		Mission.wave3_time = GetTime() + 540.0 -- 9 minutes
--		Mission.wave4_time = GetTime() + 900.0 

		Mission.haulers_dead = false
		Mission.attack_wave_dead = false
		Mission.first_spawn = true		

	SetObjectiveOn(Mission.power1)
	SetObjectiveName(Mission.power1,"Power Gen.")
	StopAudioMessage(Mission.talk)
	ClearObjectives()
	AddObjective("isdf0308.otf", "WHITE")
	Mission.talk = AudioMessage("isdf0320.wav") -- (Mission.shab) thanks john - I'm on my way. Stay here and protect thos power plantsnot 
	Goto(Mission.shabayev,"leave_path") -- this will have to be the nav
	Mission.remove_time = GetTime() + 2.0
	SetPerceivedTeam(Mission.shabayev,2)
	Mission.shab_leave_base = true
end
]]
--------------------------------------------------------------------------/


-- this is the code after Mission.shab leaves the base --------------------------


if ((Mission.shab_leave_base) and (IsAlive(Mission.player))) then


	-- this will remove Mission.shab

	if ((not Mission.remove_shab) and (Mission.remove_time < GetTime())) then
	
		Mission.remove_time = GetTime() + 2.0


		if (GetDistance(Mission.shabayev,Mission.player) > 400.0) then
		
			RemoveObject(Mission.shabayev)
			Mission.remove_time = GetTime() + 999999.9
			Mission.looky_time = GetTime() + 999999.9

			if (IsAround(Mission.miller)) then
			
				RemoveObject(Mission.miller)
			end

			if (IsAround(Mission.simms)) then
			
				RemoveObject(Mission.simms)
			end

			Mission.remove_shab = true
		end
	end
	--------------------------------------------


	-- this is the attack wave code ----/

	if ((Mission.attack_wave_dead) and (Mission.haulers_dead) and (not Mission.the_end)) then
	
		if (Mission.wave1_time < GetTime()) then -- and (GetDistance(Mission.player,"base2_espawn1") > 400.0)) then
		
			Mission.scion1 = BuildObject("fvpscou3",2,"base2_espawn1")
			Mission.scion2 = BuildObject("fvpscou3",2,"base2_espawn2")
			--Mission.scion3 = BuildObject("fvtank",2,"base2_espawn3")

			Mission.hauler1 = BuildObject("fvtug3",2,"base2_espawn3")
			Mission.hauler2 = BuildObject("fvtug3",2,"base2_espawn4")
			
			SetAvoidType(Mission.scion1,0)
			SetAvoidType(Mission.scion2,0)
			SetAvoidType(Mission.hauler1,0)
			SetAvoidType(Mission.hauler2,0)

			Mission.wave1_time = GetTime() + 999999.9
			Mission.new_wave_time = GetTime() + 90.0
			Mission.prep_truck = true
			Mission.haulers_dead = false
			Mission.attack_wave_dead = false
		end

		if (Mission.wave2_time < GetTime()) then -- and (GetDistance(Mission.player,"base2_espawn1") > 400.0)) then
		
			Mission.scion1 = BuildObject("fvpscou3",2,"base2_espawn1")
			Mission.scion2 = BuildObject("fvpsnt3",2,"base2_espawn2")
			Mission.scion3 = BuildObject("fvpsnt3",2,"base_espawn1")
			Mission.scion4 = BuildObject("fvpsnt3",2,"base_espawn2")

			Mission.hauler1 = BuildObject("fvtug3",2,"base2_espawn3")
			Mission.hauler2 = BuildObject("fvtug3",2,"base2_espawn4")
			
			SetAvoidType(Mission.scion1,0)
			SetAvoidType(Mission.scion2,0)
			SetAvoidType(Mission.scion3,0)
			SetAvoidType(Mission.scion4,0)
			SetAvoidType(Mission.hauler1,0)
			SetAvoidType(Mission.hauler2,0)
			
			Mission.wave2_time = GetTime() + 999999.9
			Mission.new_wave_time = GetTime() + 90.0
			Mission.service_help = false
			Mission.haulers_dead = false
			Mission.attack_wave_dead = false
		end

		if (Mission.wave3_time < GetTime()) then-- and (GetDistance(Mission.player,"base2_espawn1") > 400.0)) then
		
			Mission.scion1 = BuildObject("fvpsnt3",2,"base2_espawn1")
			Mission.scion2 = BuildObject("fvpsnt3",2,"base2_espawn2")
			
			if ((GetDistance(Mission.player,"bad_guy1")) > (GetDistance(Mission.player,"base_espawn1"))) then
			
				Mission.scion3 = BuildObject("fvpsnt3",2,"bad_guy1")
				Mission.scion4 = BuildObject("fvpsnt3",2,"bad_guy2")
			
			else
			
				Mission.scion3 = BuildObject("fvpsnt3",2,"base_espawn1")
				Mission.scion4 = BuildObject("fvpsnt3",2,"base_espawn2")
			end

			Mission.hauler1 = BuildObject("fvtug3",2,"base2_espawn3")
			Mission.hauler2 = BuildObject("fvtug3",2,"base2_espawn4")

			SetAvoidType(Mission.scion1,0)
			SetAvoidType(Mission.scion2,0)
			SetAvoidType(Mission.scion3,0)
			SetAvoidType(Mission.scion4,0)
			--SetAvoidType(Mission.scion5,0)
			--SetAvoidType(Mission.scion6,0)
			SetAvoidType(Mission.hauler1,0)
			SetAvoidType(Mission.hauler2,0)
			
			Mission.wave3_time = GetTime() + 999999.9
			Mission.new_wave_time = GetTime() + 90.0
			Mission.service_help = false
			Mission.attack_wave_dead = false
			Mission.haulers_dead = false
			Mission.the_end = true
		end
	--	if ((Mission.wave4_time < GetTime()) and (GetDistance(Mission.player,"base2_espawn1") > 400.0)) then
	--	
	--		Mission.scion1 = BuildObject("fvtank",2,"base2_espawn1")
	--		Mission.scion2 = BuildObject("fvtank",2,"base2_espawn2")
	--		Mission.scion3 = BuildObject("fvtank",2,"base2_espawn3")
	--		Mission.scion4 = BuildObject("fvtank",2,"base2_espawn4")
	--		Mission.scion5 = BuildObject("fvtank",2,"base2_espawn5")
	--		Mission.scion6 = BuildObject("fvtank",2,"base2_espawn6")
	--		Mission.wave4_time = GetTime() + 999999.9
	--		Mission.attack_wave_dead = false
	--	end
	end


	if ((not Mission.attack_wave_dead) and (not Mission.attack_go)) then
	
		if (IsAlive(Mission.scion1)) then
		
			if (IsAlive(Mission.hauler1)) then
			
				Follow(Mission.scion1,Mission.hauler1,0)
			
			else
			
				Goto(Mission.scion1,"attack_path1",0)
			end
		end
		if (IsAlive(Mission.scion2)) then
		
			if (IsAlive(Mission.hauler2)) then
			
				Follow(Mission.scion2,Mission.hauler2,0)
			
			else
			
				Goto(Mission.scion2,"attack_path1",0)
			end
		end
		if (IsAlive(Mission.scion3)) then
		
			Goto(Mission.scion3,"bad_guy2_path",0)
		end
		if (IsAlive(Mission.scion4)) then
		
			Goto(Mission.scion4,"bad_guy2_path",0)
		end
		if (IsAlive(Mission.scion5)) then
		
			Goto(Mission.scion5,"bad_guy1_path",0)
		end
		if (IsAlive(Mission.scion6)) then
		
			Goto(Mission.scion6,"bad_guy1_path",0)
		end

		Mission.attack_check = GetTime() + 5.0
		Mission.attack_go = true
	end


	if ((Mission.attack_go) and (not Mission.attack_power) and (Mission.attack_check < GetTime())) then
	
		Mission.attack_check = GetTime() + 5.0

		if ((not Mission.scion1_defend) and (Mission.hauler1_return)) then
		
			if ((IsAlive(Mission.scion1)) and (IsAlive(Mission.hauler1))) then
			
				Follow(Mission.scion1,Mission.hauler1,0)
				Mission.scion1_defend = true
			end
		end


		if ((not Mission.scion2_defend) and (Mission.hauler2_return)) then
		
			if ((IsAlive(Mission.scion2)) and (IsAlive(Mission.hauler2))) then
			
				Follow(Mission.scion2,Mission.hauler2,0)
				Mission.scion2_defend = true
			end
		end


		if (IsAround(Mission.power1)) then
		
			if (IsAround(Mission.scion3)) then
			
				if (GetDistance(Mission.scion3,Mission.power1) < 100.0) then
				
					Attack(Mission.scion3,Mission.power1,0)

					if (IsAround(Mission.scion4)) then
					
						if (IsAlive(Mission.truck)) then
						
							Attack(Mission.scion4,Mission.truck,0)
						
						else
						
							Attack(Mission.scion4,Mission.player)
						end
					end

					if (IsAlive(Mission.truck)) then
					
						if (IsAround(Mission.scion5)) then
						
							Attack(Mission.scion5,Mission.truck,0)
						end
						if (IsAround(Mission.scion6)) then
						
							Attack(Mission.scion6,Mission.truck,0)
						end
					
					else
					
						if (IsAround(Mission.scion5)) then
						
							Attack(Mission.scion5,Mission.player)
						end
						if (IsAround(Mission.scion6)) then
						
							Attack(Mission.scion6,Mission.player)
						end
					end

					Mission.attack_power = true
				end
			
			
			elseif (IsAround(Mission.scion4)) then
			
				if (GetDistance(Mission.scion4,Mission.power1) < 100.0) then
				
					Attack(Mission.scion4,Mission.power1,0)

					if (IsAlive(Mission.truck)) then
					
						if (IsAround(Mission.scion5)) then
						
							Attack(Mission.scion5,Mission.truck,0)
						end
						if (IsAround(Mission.scion6)) then
						
							Attack(Mission.scion6,Mission.truck,0)
						end
					
					else
					
						if (IsAround(Mission.scion5)) then
						
							Attack(Mission.scion5,Mission.player)
						end
						if (IsAround(Mission.scion6)) then
						
							Attack(Mission.scion6,Mission.player)
						end
					end

					Mission.attack_power = true
				end
			
			elseif (IsAround(Mission.scion5)) then
			
				if (GetDistance(Mission.scion5,Mission.power1) < 100.0) then
				
					Attack(Mission.scion5,Mission.power1,0)

					if (IsAlive(Mission.truck)) then
					
						if (IsAround(Mission.scion6)) then
						
							Attack(Mission.scion6,Mission.truck,0)
						end
					
					else
					
						if (IsAround(Mission.scion6)) then
						
							Attack(Mission.scion6,Mission.player)
						end
					end

					Mission.attack_power = true
				end
			
			elseif ((IsAround(Mission.scion6)) and (GetDistance(Mission.scion6,Mission.power1) < 100.0)) then
			
				Attack(Mission.scion6,Mission.power1,0)
				Mission.attack_power = true
			end
		
		elseif (IsAlive(Mission.truck)) then
		
			if (IsAround(Mission.scion3)) then
			
				if (GetDistance(Mission.scion3,Mission.armory) < 200.0) then
				
					Attack(Mission.scion3,Mission.truck,0)

					if (IsAround(Mission.scion4)) then
					
						Attack(Mission.scion4,Mission.truck,0)
					end

					if (IsAround(Mission.scion5)) then
					
						Attack(Mission.scion5,Mission.player)
					end
					if (IsAround(Mission.scion6)) then
					
						Attack(Mission.scion6,Mission.player)
					end

					Mission.attack_power = true
				end
			
			
			elseif (IsAround(Mission.scion4)) then
			
				if (GetDistance(Mission.scion4,Mission.armory) < 200.0) then
				
					Attack(Mission.scion4,Mission.truck,0)


					if (IsAround(Mission.scion5)) then
					
						Attack(Mission.scion5,Mission.player)
					end
					if (IsAround(Mission.scion6)) then
					
						Attack(Mission.scion6,Mission.player)
					end

					Mission.attack_power = true
				end
			
			elseif (IsAround(Mission.scion5)) then
			
				if (GetDistance(Mission.scion5,Mission.armory) < 200.0) then
				
					Attack(Mission.scion5,Mission.truck,0)

					if (IsAround(Mission.scion6)) then
					
						Attack(Mission.scion6,Mission.player)
					end

					Mission.attack_power = true
				end
			
			elseif ((IsAround(Mission.scion6)) and (GetDistance(Mission.scion6,Mission.armory) < 200.0)) then
			
				Attack(Mission.scion6,Mission.truck,0)
				Mission.attack_power = true
			end
		end
	end


	-- this is building the extra enemies
--[[
	if (not Mission.attack_wave_dead) then
	
		if ((not Mission.extra_spawn) and (Mission.new_wave_time < GetTime())) then
		
			if ((GetDistance(Mission.player,"bad_guy1")) > (GetDistance(Mission.player,"base_espawn1"))) then
			
				Mission.extra1 = BuildObject("fvpsnt",2,"bad_guy1")
				Mission.extra2 = BuildObject("fvpsnt",2,"bad_guy2")
				SetAvoidType(Mission.extra1,0)
				SetAvoidType(Mission.extra2,0)
				Retreat(Mission.extra1,"bad_guy1_path")
				Follow(Mission.extra2,Mission.extra1,1)
				Mission.new_wave_time = GetTime() + 999999.9
			
			else
			
				Mission.extra1 = BuildObject("fvpsnt",2,"base_espawn1")
				Mission.extra2 = BuildObject("fvpsnt",2,"base_espawn2")
				SetAvoidType(Mission.extra1,0)
				SetAvoidType(Mission.extra2,0)
				Retreat(Mission.extra1,"bad_guy2_path")
				Follow(Mission.extra2,Mission.extra1,1)
				Mission.new_wave_time = GetTime() + 999999.9
			end
			
			Mission.extras_dead = false
			Mission.extra_spawn = true
		end
	end
	--------------------------------------------


	-- this determines when the two extra scoins are dead

	if ((not Mission.extras_dead) and (Mission.extra_spawn)) then
	
		if ((not Mission.extra1_dead) and (not IsAlive(Mission.extra1))) then
		
			Mission.extra1_dead = true
		end

		if ((not Mission.extra2_dead) and (not IsAlive(Mission.extra2))) then
		
			Mission.extra2_dead = true
		end

		if (not Mission.extra_attack) then
		
			if (not Mission.extra1_dead) then
			
				if (IsAround(Mission.power1)) then
				
					if (GetDistance(Mission.extra1,Mission.power1) < 40.0) then
					
						Attack(Mission.extra1,Mission.power1)

						if (IsAlive(Mission.extra2)) then
						
							if (IsAlive(Mission.truck)) then
							
								Attack(Mission.extra2,Mission.truck)
							
							else
							
								Attack(Mission.extra2,Mission.player)
							end
						end

						Mission.extra_attack = true
					end
				
				elseif (IsAlive(Mission.truck)) then
				
					if (GetDistance(Mission.extra1,Mission.armory) < 60.0) then
					
						Attack(Mission.extra2,Mission.truck)

						if (IsAlive(Mission.extra2)) then
						
							Attack(Mission.extra2,Mission.player)
						end

						Mission.extra_attack = true
					end
				
				else
				
					if (GetDistance(Mission.extra1,Mission.armory) < 60.0) then
					
						Attack(Mission.extra2,Mission.player)

						if (IsAlive(Mission.extra2)) then
						
							Attack(Mission.extra2,Mission.player)
						end

						Mission.extra_attack = true
					end
				end
			
			elseif (not Mission.extra2_dead) then
			
				if (IsAround(Mission.power1)) then
				
					Attack(Mission.extra2,Mission.power1)
					Mission.extra_attack = true
				
				elseif (IsAlive(Mission.truck)) then
				
					Attack(Mission.extra2,Mission.truck)
					Mission.extra_attack = true
				
				else
				
					Attack(Mission.extra2,Mission.player)
					Mission.extra_attack = true
				end
			end
		end

		if ((Mission.extra1_dead) and (Mission.extra2_dead)) then
		
			Mission.extra_spawn = false
			Mission.extra1_dead = false
			Mission.extra2_dead = false
			Mission.extra_attack = false
			Mission.extras_dead = true
		end
	end
	--------------------------------------------
]]


	-- this keeps the scions from looking stupid

	if ((not Mission.scion3_move) and (IsAlive(Mission.scion3))) then
	
		if (GetCurAmmo(Mission.scion3) < 100) then
		
			Attack(Mission.scion3,Mission.player)
			Mission.scion3_move = true
		end
	end

		
	if ((not Mission.scion4_move) and (IsAlive(Mission.scion4))) then
	
		if (GetCurAmmo(Mission.scion4) < 100) then
		
			if (IsAlive(Mission.truck)) then
			
				Attack(Mission.scion4,Mission.truck,0)
				Mission.scion4_move = true
			
			else
			
				Attack(Mission.scion3,Mission.player)
				Mission.scion4_move = true
			end
		end
	end
	--------------------------------------------

		
	-- checking to see when the attack waves are dead

	if (not Mission.attack_wave_dead) then
	
		if ((not IsAlive(Mission.scion1)) and (not IsAlive(Mission.scion2)) and (not IsAlive(Mission.scion3)) and (not IsAlive(Mission.scion4)) and (not IsAlive(Mission.scion5)) and (not IsAlive(Mission.scion6))) then
		
			Mission.attack_check = GetTime() + 999999.9

			Mission.scion1_defend = false
			Mission.scion2_defend = false
			Mission.attack_go = false
			Mission.attack_power = false
			Mission.scion3_move = false
			Mission.scion4_move = false
			Mission.attack_wave_dead = true
		end
	end
	--------------------------------------------


	-- this is getting the service Mission.truck to help

	if ((not Mission.service_help) and (Mission.attack_wave_dead)) then
	
		if ((IsAlive(Mission.truck)) and (IsAlive(Mission.power1))) then
		
			if (GetCurHealth(Mission.power1) < 2500) then
			
				Service(Mission.truck,Mission.power1,0)
			end
		end

		Mission.service_help = true
	end
	--------------------------------------------



-- this is hauler code --------------------------------/

	-- when they are first built

	if ((not Mission.haulers_dead) and (not Mission.haulers_go)) then
	
		Mission.hauler_time = GetTime() + 2.0


		if (IsAlive(Mission.hauler1)) then
		
			if ((GetDistance(Mission.hauler1,Mission.ex_tank1)) < (GetDistance(Mission.hauler1,"hauler_check1"))) then
			
				Pickup(Mission.hauler1,Mission.ex_tank1)

				if (not Mission.blah1) then
				
					SetObjectiveOn(Mission.hauler1)
					Mission.blah1 = true
				end

				Mission.pickup1 = true

				if (IsAlive(Mission.hauler2)) then
				
					if ((GetDistance(Mission.hauler2,Mission.ex_tank2)) < (GetDistance(Mission.hauler2,"hauler_check1"))) then
					
						Pickup(Mission.hauler2,Mission.ex_tank2)

						if (not Mission.blah2) then
						
							SetObjectiveOn(Mission.hauler2)
							Mission.blah2 = true
						end

						Mission.pickup2 = true
					
					else
					
						Retreat(Mission.hauler2,"haulerin_path2")
						Mission.pickup2 = false
					end
				end
				
				Mission.haulers_go = true
			
			else
			
				Retreat(Mission.hauler1,"haulerin_path1")
				Mission.pickup1 = false

				if (IsAlive(Mission.hauler2)) then
				
					if ((GetDistance(Mission.hauler2,Mission.ex_tank2)) < (GetDistance(Mission.hauler2,"hauler_check1"))) then
					
						Pickup(Mission.hauler2,Mission.ex_tank2)

						if (not Mission.blah2) then
						
							SetObjectiveOn(Mission.hauler2)
							Mission.blah2 = true
						end

						Mission.pickup2 = true
					
					else
					
						Retreat(Mission.hauler2,"haulerin_path2")
						Mission.pickup2 = false
					end
				end
			end
		
		elseif (IsAlive(Mission.hauler2)) then
		
			if ((GetDistance(Mission.hauler2,Mission.ex_tank2)) < (GetDistance(Mission.hauler2,"hauler_check1"))) then
			
				Pickup(Mission.hauler2,Mission.ex_tank2)

				if (not Mission.blah2) then
				
					SetObjectiveOn(Mission.hauler2)
					Mission.blah2 = true
				end

				Mission.pickup2 = true
			
			else
			
				Retreat(Mission.hauler2,"haulerin_path2")
				Mission.pickup2 = false
			end
		end


		Mission.haulers_go = true
	end
	--------------------------------------------


	-- this is making the haulers go for ships when in range

	if ((Mission.haulers_go) and (Mission.hauler_time < GetTime())) then
	
		Mission.hauler_time = GetTime() + 2.0


		-- this is checkpoint 1

		if ((not Mission.pickup1) and (not Mission.hauler1_at_check1)) then
		
			if ((IsAlive(Mission.hauler1)) and (GetDistance(Mission.hauler1,"hauler_check1") < 30.0)) then
			
				if ((GetDistance(Mission.hauler1,Mission.ex_tank1)) < (GetDistance(Mission.hauler1,"hauler_check2"))) then
				
					Pickup(Mission.hauler1,Mission.ex_tank1)

					if (not Mission.blah1) then
					
						SetObjectiveOn(Mission.hauler1)
						Mission.blah1 = true
					end

					Mission.pickup1 = true
				
				else
				
					Mission.hauler1_at_check1 = true
				end
			end
		end

		if ((not Mission.pickup2) and (not Mission.hauler2_at_check1)) then
		
			if ((IsAlive(Mission.hauler2)) and (GetDistance(Mission.hauler2,"hauler_check1") < 30.0)) then
			
				if ((GetDistance(Mission.hauler2,Mission.ex_tank2)) < (GetDistance(Mission.hauler2,"hauler_check2"))) then
				
					Pickup(Mission.hauler2,Mission.ex_tank2)

					if (not Mission.blah2) then
					
						SetObjectiveOn(Mission.hauler2)
						Mission.blah2 = true
					end

					Mission.pickup2 = true
				
				else
				
					Mission.hauler2_at_check1 = true
				end
			end
		end

		-- this is checkpoint 2


		if ((not Mission.pickup1) and (Mission.hauler1_at_check1)) then
		
			if ((IsAlive(Mission.hauler1)) and (GetDistance(Mission.hauler1,"hauler_check2") < 30.0)) then
			
				Pickup(Mission.hauler1,Mission.ex_tank1)

				if (not Mission.blah1) then
				
					SetObjectiveOn(Mission.hauler1)
					Mission.blah1 = true
				end

				Mission.pickup1 = true
			end
		end

		if ((not Mission.pickup2) and (Mission.hauler2_at_check1)) then
		
			if ((IsAlive(Mission.hauler2)) and (GetDistance(Mission.hauler2,"hauler_check2") < 30.0)) then
			
				Pickup(Mission.hauler2,Mission.ex_tank2)

				if (not Mission.blah2) then
				
					SetObjectiveOn(Mission.hauler2)
					Mission.blah2 = true
				end

				Mission.pickup2 = true
			end
		end
	end
	--------------------------------------------

	-- this is brads first message

	if ((not Mission.brad_warning) and ((Mission.pickup1) or (Mission.pickup2))) then
	
--		Mission.audmsg = AudioMessage("isdf0310.wav") -- (braddock) Don't let those enemies get the experimental tanksnot 
		Mission.brad_warning = true
	end


	-- checking to see when they have cargo

	if ((Mission.pickup1) and (not Mission.hauler1_return)) then
	
		if ((IsAlive(Mission.hauler1)) and (HasCargo(Mission.hauler1))) then
		
			Mission.escape_check1 = GetTime() + 5.0

			if ((GetDistance(Mission.hauler1,"hauler_check1")) > (GetDistance(Mission.hauler1,"hauler_check2"))) then
			
				Retreat(Mission.hauler1,"haulerout_path2")
			
			else
			
				Retreat(Mission.hauler1,"final_check")
			end

			Mission.hauler1_return = true
		end
	end

	if ((Mission.pickup2) and (not Mission.hauler2_return)) then
	
		if ((IsAlive(Mission.hauler2)) and (HasCargo(Mission.hauler2))) then
		
			Mission.escape_check1 = GetTime() + 5.0

			if ((GetDistance(Mission.hauler2,"hauler_check1")) > (GetDistance(Mission.hauler2,"hauler_check2"))) then
			
				Retreat(Mission.hauler2,"haulerout_path2")
			
			else
			
				Retreat(Mission.hauler2,"final_check")
			end

			Mission.hauler2_return = true
		end
	end
	--------------------------------------------
	

	-- this determines if the haulers have escaped then

	if ((not Mission.hauler_escape) and (Mission.escape_check1 < GetTime())) then
	
		Mission.escape_check1 = GetTime() + 1.0


		if ((Mission.hauler1_return) and (IsAlive(Mission.hauler1))) then
		
			if (GetDistance(Mission.hauler1,"final_check") < 30.0) then
			
				CameraReady()
				Goto(Mission.hauler1,"drop_path")
				SetCurHealth(Mission.hauler1,1000)
				AudioMessage("isdf0324.wav") -- (Braddock) you allowed my vehicles to fall in enemy hands
				Mission.movie_time = GetTime() + 20.0
				Mission.hauler1_escape = true
				Mission.hauler_escape = true
			end
		end


		if ((Mission.hauler2_return) and (IsAlive(Mission.hauler2))) then
		
			if (GetDistance(Mission.hauler2,"final_check") < 30.0) then
			
				CameraReady()
				Goto(Mission.hauler2,"drop_path")
				SetCurHealth(Mission.hauler2,1000)
				AudioMessage("isdf0324.wav") -- (Braddock) you allowed my vehicles to fall in enemy hands
				Mission.movie_time = GetTime() + 20.0
				Mission.hauler2_escape = true
				Mission.hauler_escape = true
			end
		end
	end
	--------------------------------------------

	
	-- this is checking to see when the hauler gets to the dropship

	if ((not Mission.camera1) and (Mission.hauler1_escape)) then
	
		if (GetDistance(Mission.hauler1,"drop_point") < 15.0) then
		
			SetAnimation(Mission.sdrop,"deploy",1)
			Mission.camera1 = true
		end
	end

	-- this is going to be the loosing movie

	if  ((not Mission.camera1) and (Mission.hauler1_escape)) then
	
		CameraPath("camera_spawn",500,0,Mission.hauler1)
	end
	--------------------------------------------


	-- this is checking to see when the hauler gets to the dropship

	if ((not Mission.camera1) and (Mission.hauler2_escape)) then
	
		if (GetDistance(Mission.hauler2,"drop_point") < 15.0) then
		
			SetAnimation(Mission.sdrop,"deploy",1)
			Mission.camera1 = true
		end
	end

	-- this is going to be the loosing movie

	if  ((not Mission.camera1) and (Mission.hauler2_escape)) then
	
		CameraPath("camera_spawn",500,0,Mission.hauler2)
	end
	--------------------------------------------


	if ((not Mission.game_over) and (Mission.camera1)) then
	
		CameraPath("final_check",40,0,Mission.sdrop)
	end
	--------------------------------------------


	-- if the haulers are killed then

	if ((not Mission.haulers_dead) and (not IsAlive(Mission.hauler1)) and (not IsAlive(Mission.hauler2))) then
	
		Mission.hauler_time = GetTime() + 999999.9
		Mission.escape_check1 = GetTime() + 999999.0

		Mission.hauler1_at_check1 = false
		Mission.hauler2_at_check1 = false
		Mission.pickup1 = false
		Mission.pickup2 = false
		Mission.haulers_go = false
		Mission.hauler1_at_base = false
		Mission.hauler2_at_base = false
		Mission.hauler1_return = false
		Mission.hauler2_return = false
		Mission.first_h1_chance = false
		Mission.first_h2_chance = false

		Mission.haulers_dead = true
	end
	--------------------------------------------


--[[
	-- this builds more haulers

	if ((Mission.haulers_dead) and (not Mission.the_end)) then
	
		Mission.hauler1 = BuildObject("fvtug3",2,"base2_espawn3")
		Mission.hauler2 = BuildObject("fvtug3",2,"base2_espawn4")
		Mission.haulers_dead = false
	end
	--------------------------------------------
]]

	-- this is where Braddock contacts the Mission.player

	if ((Mission.first_spawn) and (not Mission.braddock_message1)) then
	
		if ((Mission.hauler1_return) or (Mission.hauler1_return)) then
		
			if (IsAround(Mission.ex_tank1)) then
			
				SetObjectiveOn(Mission.ex_tank1)
				tempstr = TranslateString("Mission0303")  -- Hardware
				SetObjectiveName(Mission.ex_tank1,tempstr)
			end
			
			if (IsAround(Mission.ex_tank2)) then
			
				SetObjectiveOn(Mission.ex_tank2)
				tempstr = TranslateString("Mission0303")  -- Hardware
				SetObjectiveName(Mission.ex_tank2,tempstr)
			end
				
			--Mission.audmsg = AudioMessage("isdf0310.wav") -- (braddock) Don't let those enemies get the experimental tanksnot 
			Mission.braddock_message1 = true
		end

		if ((not Mission.braddock_message1) and (Mission.attack_wave_dead) and (Mission.haulers_dead)) then
		
			if (not Mission.set_brad_time) then
			
				Mission.brad_time = GetTime() + 3.0
				Mission.set_brad_time = true
			end

			if ((Mission.set_brad_time) and (Mission.brad_time < GetTime())) then
			
				if (IsAround(Mission.ex_tank1)) then
				
					SetObjectiveOn(Mission.ex_tank1)
					tempstr = TranslateString("Mission0303")  -- Hardware
					SetObjectiveName(Mission.ex_tank1,tempstr)
				end

				if (IsAround(Mission.ex_tank2)) then
				
					SetObjectiveOn(Mission.ex_tank2)
					tempstr = TranslateString("Mission0303")  -- Hardware
					SetObjectiveName(Mission.ex_tank2,tempstr)
				end
				
--				Mission.audmsg = AudioMessage("isdf0310.wav") -- (braddock) Don't let those enemies get the experimental tanksnot 
				Mission.braddock_message1 = true
			end
		end
	end
	--------------------------------------------


	-- this changes the objectives after braddocks message

	if ((not Mission.new_orders) and (Mission.braddock_message1) and (IsAudioMessageDone(Mission.audmsg))) then
	
		ClearObjectives()
		AddObjective("isdf0308a.otf", "WHITE")
		Mission.new_orders = true
	end


	-- this is the Mission.truck telling the Mission.player about the Mission.armory

	if ((Mission.prep_truck) and (Mission.attack_wave_dead) and (Mission.haulers_dead) and (not Mission.armory_message1)) then
	
		if (IsAround(Mission.truck)) then
		
			if (not Mission.power_up_alive) then
			
				Mission.talk = AudioMessage("isdf0334.wav") --(Mission.truck) with the Mission.armory online you can build more weapons
				Mission.armory_message1 = true
			end
		end
	end


	if ((Mission.armory_message1) and (not Mission.armory_message2) and (IsAudioMessageDone(Mission.talk))) then
	
		Mission.talk = AudioMessage("isdf0335.wav") --(Mission.truck) select the Mission.armory and have it build a missile power-up
		Mission.armory_message2 = true
	end


	if (not Mission.power_up_alive) then
	
		if ((Mission.armory_message1) and (not Mission.armory_message3) and (IsSelected(Mission.armory))) then
		
			StopAudioMessage(Mission.talk)
			Mission.talk = AudioMessage("isdf0336.wav") --(Mission.truck) Now you can have the Mission.armory build you a missile
			Mission.armory_message3 = true
		end
	end
	--------------------------------------------


	-- this is when the last enemies are destoyed

	if (not Mission.game_over) then
	
		if ((not Mission.shab_return) and (Mission.the_end) and (Mission.attack_wave_dead) and (Mission.haulers_dead)) then --(Mission.extras_dead)) then
		
			AudioMessage("isdf0338.wav")--(Mission.shab) I'm on my way back to younot 

			Mission.shabayev = BuildObject("ivpscou",1,"shab_spawn")
			Mission.miller = BuildObject("ivpscou",1,"miller_spawn2")
			Mission.simms = BuildObject("ivpscou",1,"simms_spawn2")

			SetObjectiveOn(Mission.shabayev)
			SetObjectiveName(Mission.shabayev,"Cmd. Shabayev")

			SetAvoidType(Mission.shabayev,0)
			SetAvoidType(Mission.miller,0)
			SetAvoidType(Mission.simms,0)

			Damage(Mission.shabayev,500)
			Damage(Mission.miller,1000)
			Damage(Mission.simms,1000)
			
			Goto(Mission.shabayev,"last_path")
			Follow(Mission.miller,Mission.shabayev)
			Follow(Mission.simms,Mission.miller)

			ClearObjectives()
			AddObjective("isdf0309.otf", "WHITE")

			Mission.shab_return = true
		end
	end


	if ((Mission.shab_return) and (IsAround(Mission.armory)) and (not Mission.shab_home)) then
	
		if (GetDistance(Mission.shabayev,Mission.armory) < 100.0) then
		
			if (GetDistance(Mission.shabayev,Mission.player) < 60.0) then
			
				Mission.speak = AudioMessage("isdf0321.wav")--(Mission.shab) I knew you could do it
				LookAt(Mission.shabayev,Mission.player)
				Mission.shab_home = true
			end
		end
	end


	if ((Mission.shab_home) and (not Mission.endbrad_message) and (IsAudioMessageDone(Mission.speak))) then
	
		AudioMessage("isdf0337.wav") --(brad) condors are on the waynot 
		Mission.movie_start_time = GetTime() + 9.0
		Mission.movie_set = true
		Mission.endbrad_message = true
	end
	--------------------------------------------

	--this is the Mission.shab movie of her entering the base followed by the movie of the drop ship landing

end

	-- this is if the Mission.player's ship gets destroyed then

	if ((not IsAround(Mission.player_ship)) and (not Mission.ship_destroyed)) then
		PrintConsoleMessage("Mission.player_ship is " .. tostring(Mission.player_ship))
		Mission.ship_destroyed_time = GetTime() + 5.0
		Mission.ship_destroyed = true
	end


	if ((not Mission.tank_message) and (Mission.ship_destroyed) and (Mission.ship_destroyed_time < GetTime())) then
	
		if ((IsAlive(Mission.truck)) and (IsAround(Mission.dead_tank)) and (not Mission.first_tank_check)) then
		
			AudioMessage("isdf0339.wav") -- (Mission.truck) get in the tanknot 
			SetObjectiveOn(Mission.dead_tank)
			tempstr = TranslateString("Mission0304")  -- Sabre
			SetObjectiveName(Mission.dead_tank,tempstr)
			Mission.doo = true
			Mission.tank_message = true
		
		else
		
			Mission.tank_message = true
		end
	end


	if ((not Mission.clear_tank) and (Mission.doo) and (IsAround(Mission.dead_tank))) then
	
		if (Mission.player_in_tank) then
		
			SetObjectiveOff(Mission.dead_tank)
			Mission.clear_tank = true
		end
	end
	--------------------------------------------



--------------------------------------------------------------------------/
--if (not Mission.ON_HOLD) then
--
--------------------------------------------------------------------------/


-- these are the win/loose conditions

if (not Mission.game_over) then

	if ((not Mission.remove_shab) and (not Mission.shab_outside) and (not IsAlive(Mission.shabayev))) then
	
		if (IsAlive(Mission.truck)) then
		
			AudioMessage("isdf0322.wav") -- (Mission.truck) you let Mission.shab die
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		
		else
		
			AudioMessage("isdf0323.wav") -- (Braddock) you let Mission.shab die
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
	end

--[[
	if ((Mission.suspend_death) and (not IsAround(Mission.shab))) then
	
		if (IsAlive(Mission.truck)) then
		
			AudioMessage("isdf0322.wav") -- (Mission.truck) you let Mission.shab die
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		
		else
		
			AudioMessage("isdf0323.wav") -- (Braddock) you let Mission.shab die
			FailMission(GetTime() + 15.0)
			Mission.game_over = true
		end
	end
]]

	if ((Mission.hauler_escape) and (not Mission.game_over) and (Mission.camera1)) then --(Mission.movie_time < GetTime())) then
	
		FailMission(GetTime() + 0.0)
		Mission.game_over = true
	end


	-- this is if the Mission.player approaches Mission.miller or Mission.simms then

	if ((Mission.cbunk_message3) and (not Mission.remove_shab)) then
	
		if (not InBuilding(Mission.player)) then
		
			if (IsAround(Mission.miller)) then
			
				if (GetDistance(Mission.player,Mission.miller) < 300.0) then
				
					AudioMessage("isdf0329a.wav") -- (Mission.shab) if you refuse to follow my orders you are dismissed then
					FailMission(GetTime() + 15.0)
					Mission.game_over = true
				end
			end
		end
	end


	-- this is the destruction of the power plant

	if (not IsAround(Mission.power1)) then
	
		ClearObjectives()
		AddObjective("isdf0308.otf", "RED")
		FailMission(GetTime() + 10.0)
		Mission.game_over = true
	end

	
	-- Mission.movie_set needs to be changed
	if ((Mission.movie_set) and (not Mission.game_over)) then
	
		SucceedMission(GetTime() + 20.0,"isdf03w1.txt")
		Mission.game_over = true
	end
end

--------------------------------------------------------------------------/
--end
--------------------------------------------------------------------------/



 	
end