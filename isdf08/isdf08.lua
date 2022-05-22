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
		start_done,
		shab_still,
    trigger1,
	trigger2,
	turret_attacked,
	patrol_attacked,
	reached_base,
	inside_espir1,
	inside_scout1,
		inside_scout2,
	inside_scout3,
	killed_attack1,
	killed_attack2,
	inside_turret1,
	inside_turret2,
	detected,
	played_0802,
	played_0803,
	played_0804,
	played_0805,
	played_0806,
	played_0807,
	played_0808,
	played_0809,
	played_0810,
	played_0811,
	played_0812,
	jak1_attack,
	jak2_attack,
	jak3_attack,
	jak4_attack,
	jak5_attack,
	edge_attack,
	b_last,

	-- floats

		f_first,

		f_last,

	-- handles

		h_first,
		player,
		turret1,
		turret2,
		attack1,
		attack2,
		attack3,
		rescue1,
		rescue2,
		rescue3,
		scout1,
		scout2,
		scout3,
	pilot1,
	pilot2,
	pilot3,
	pilot4,
	pilot5,
	pilot6,
	pilot7,
	pilot8,
	espir1,
	message1,
	jak1,
	jak2,
	jak3,
	jak4,
	jak5,
	jak7,
		fvartl,
		shab,
		first_aud,
		h_last,

	-- integers

		i_first,

		i_last
   
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


	Mission.start_done = false
  Mission.trigger1 = false
  Mission.trigger2 = false
  Mission.turret_attacked = false
  Mission.patrol_attacked = false
  Mission.reached_base = false
  Mission.inside_espir1 = false
  Mission.inside_scout1 = false
  Mission.inside_scout2 = false
  Mission.inside_scout3 = false
  Mission.killed_attack1 = false
  Mission.killed_attack2 = false
	Mission.inside_turret1 = false
	Mission.inside_turret2 = false
	Mission.played_0802 = false
	Mission.played_0803 = false
	Mission.played_0804 = false
	Mission.played_0805 = false
	Mission.played_0806 = false
	Mission.played_0807 = false
	Mission.played_0808 = false
	Mission.played_0809 = false
	Mission.played_0810 = false
	Mission.played_0811 = false
	Mission.played_0812 = false
	Mission.jak1_attack = false
	Mission.jak2_attack = false
	Mission.jak3_attack = false
	Mission.jak4_attack = false
	Mission.jak5_attack = false
	Mission.detected = false
	Mission.shab_still = false
	Mission.edge_attack = false
	
	PreloadODF("ivtank")
	PreloadODF("ivmbike")
   
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

	if (not Mission.start_done) then
	
		Mission.shab = GetHandle("shabayev")

		temp = BuildObject("ibnav",1,"manson_base")
		tempstr = TranslateString("Mission0801")  -- West Base
		SetObjectiveName(temp,tempstr)
		GiveWeapon(Mission.player, "igsatc")
		Mission.first_aud = AudioMessage("mes0801.wav")  -- was isdf0801
-- I don't know what these are or where they go
--[[
	sp = BuildObject("fvtank",2,"spawn1")
		SetSkill(sp,3)
		sp = BuildObject("fvsent",2,"spawn2")
		SetSkill(sp,3)
		sp = BuildObject("fvtank",2,"spawn3")
		SetSkill(sp,3)
		sp = BuildObject("fvsent",2,"spawn4")
		SetSkill(sp,4)
		SetScrap(1,30)
]]	
-- These ships circle the ruin you're in at the beginning, then leave
		Mission.pilot1 = BuildObject("fvtank",2,"pilot_1")
		Mission.pilot2 = BuildObject("fvtank",2,"pilot_2")
		Mission.pilot3 = BuildObject("fvsent",2,"pilot_3")

-- They are dumb
		SetIndependence(Mission.pilot1,0)
		SetIndependence(Mission.pilot2,0)
		SetIndependence(Mission.pilot3,0)

-- These are the patrol paths for the vehicles

    Goto(Mission.pilot1,"start1")
    Goto(Mission.pilot2,"start2")
    Goto(Mission.pilot3,"start3")


-- These turrets block the path to the south
    Mission.turret1 = BuildObject("fvturr",2,"turret_1")
		Mission.turret2 = BuildObject("fvturr",2,"turret_2")

-- These jaks inhabit the swamp just west of the starting point
		Mission.jak1 = BuildObject("mcjak01",0,"jak_1")
		Patrol(Mission.jak1,"jakpatrol1",1)
		SetIndependence(Mission.jak1,1)
    Mission.jak2 = BuildObject("mcjak01",0,"jak_2")
		Patrol(Mission.jak2,"jakpatrol2",1)
		SetIndependence(Mission.jak2,1)
    Mission.jak3 = BuildObject("mcjak01",0,"jak_3")
		Patrol(Mission.jak3,"jakpatrol3",1)
		SetIndependence(Mission.jak3,1)

-- This spire guards the entrance to the Scion base
    Mission.espir1 = BuildObject("fbspir",2,"espir_1")
 --   SetIndependence(Mission.espir1,0)

-- These 3 ships patrol different areas
    Mission.scout1 = BuildObject("fvtank",2,"patrol_1")
		Patrol(Mission.scout1,"patrol_1",0)
		Mission.scout2 = BuildObject("fvtank",2,"patrol_2")
		Patrol(Mission.scout2,"patrol_2",0)

		-- this should be a bazooka or something
		BuildObject("aptech",0,"weapon_1")

-- pilots around second patrol ship

		-- 'sssold' won't save/reload properly - NM 9/28/04
		Mission.pilot7 = BuildObject("fspilo",2,"pilot_5")
    Patrol(Mission.pilot7,"pilotpatrol1",0)
		Mission.pilot8 = BuildObject("fspilo",2,"pilot_6")
    Patrol(Mission.pilot8,"pilotpatrol2",0)
	

		-- jak blocking power ups before ruins
		Mission.jak7 = BuildObject("mcjak01",0,"jak_7")
    Patrol(Mission.jak7,"jakpatrol7",1)

		-- power up in the second nest of puff plants
		BuildObject("aprepa",0,"health_1")
		BuildObject("apammo",0,"ammo_1")
		BuildObject("apbazo",0,"weapon1")

-- jak creatures hanging around ruins
		Mission.jak4 = BuildObject("mcjak01",0,"jak_4")
    Patrol(Mission.jak4,"jakpatrol4",1)
		Mission.jak5 = BuildObject("mcjak01",0,"jak_5")
    Patrol(Mission.jak5,"jakpatrol5",1)

		-- power ups near ruins
		BuildObject("aprepa",0,"health_2")
		BuildObject("apammo",0,"ammo_2")
		SetAnimation(Mission.shab,"speak")
		Mission.fvartl = BuildObject("fvartl",2,"fvartl")
		Mission.start_done = true
		

	end

	if ((IsAudioMessageDone(Mission.first_aud)) and (not Mission.shab_still)) then
	
		Mission.shab_still = true
		SetAnimation(Mission.shab,"speak",1)
	end
	if ((not IsAround(Mission.shab)) and (not Mission.reached_base)) then
	
		FailMission(GetTime()+5.0,"genFail.txt")
		Mission.reached_base = true

	end
-- Gun tower shoots at you if you get within 100 meters then
  if (Mission.inside_espir1) then
  
    if (GetDistance(Mission.espir1,Mission.player) > 50.0) then
    
      Mission.inside_espir1 = false
      Stop(Mission.espir1)
    end

  else
  
    if (GetDistance(Mission.espir1,Mission.player) < 50.0) then
    
      Mission.inside_espir1 = true
      Attack(Mission.espir1,Mission.player)
    end
  end

  if ((not Mission.jak1_attack) and (GetDistance(Mission.jak1,Mission.player)<50.0)) then
  
	  Mission.jak1_attack = true
	  Attack(Mission.jak1,Mission.player)
  end
  if ((not Mission.jak2_attack) and (GetDistance(Mission.jak2,Mission.player)<50.0)) then
  
		Mission.jak2_attack = true
		Attack(Mission.jak2,Mission.player)
  end
  if ((not Mission.jak3_attack) and (GetDistance(Mission.jak3,Mission.player)<50.0)) then
  
	  Mission.jak3_attack = true
	  Attack(Mission.jak3,Mission.player)
  end
  if ((not Mission.jak4_attack) and (GetDistance(Mission.jak4,Mission.player)<50.0)) then
  
	  Mission.jak4_attack = true
	  Attack(Mission.jak4,Mission.player)
  end
   if ((not Mission.jak5_attack) and (GetDistance(Mission.jak5,Mission.player)<50.0)) then
  
	  Mission.jak5_attack = true
	  Attack(Mission.jak5,Mission.player)
  end
-- If you shoot any of the patrol ships in the beginning, they will attack you
  if (((GetWhoShotMe(Mission.pilot1)  ==  Mission.player) or
      (GetWhoShotMe(Mission.pilot2)  ==  Mission.player)  or
      (GetWhoShotMe(Mission.pilot3)  ==  Mission.player))  and
      (not Mission.patrol_attacked)) then 
  
    Attack(Mission.pilot1,Mission.player)
    Attack(Mission.pilot2,Mission.player)
    Attack(Mission.pilot3,Mission.player)
    Mission.patrol_attacked = true
  end

-- Once the patrol from the beginning leaves the ruins, they disappear from the map
  if ((GetDistance(Mission.pilot1,"killpatrol1")<64.0)) then
  
    RemoveObject(Mission.pilot1)
  end

  if ((GetDistance(Mission.pilot2,"killpatrol1")<64.0)) then
  
    RemoveObject(Mission.pilot2)
  end

  if ((GetDistance(Mission.pilot3,"killpatrol1")<64.0)) then
  
    RemoveObject(Mission.pilot3)
  end

  if (((GetDistance(Mission.pilot1,"turret_1")<192.0)  or
       (GetDistance(Mission.pilot2,"turret_1")<192.0)  or
       (GetDistance(Mission.pilot3,"turret_1")<192.0))  and
       (not Mission.played_0802)) then 
  
--		Mission.message1 = AudioMessage("isdf0802.wav")
		ClearObjectives()
		AddObjective("isdf0801.otf","WHITE",15.0)
		Mission.played_0802 = true
  end

--[[
  if ((Mission.played_0802)  and  (IsAudioMessageDone(Mission.message1))  and
      (GetDistance(Mission.player,"start_point")<20.0)  and  (not Mission.played_0803)) then 
  
--    AudioMessage("isdf0803.wav")
    Mission.played_0803 = true
  end
]]
  if ((not Mission.played_0804)  and  (Mission.played_0802)  and  (GetDistance(Mission.player,"play_0804")<80.0)) then
  
    AudioMessage("isdf0804.wav")
    Mission.played_0804 = true
  end

  if ((not Mission.played_0805)  and  (Mission.played_0802)  and  (GetDistance(Mission.player,"play_0805")<80.0)) then
  
    AudioMessage("isdf0805.wav")
    Mission.played_0805 = true
  end

  if ((GetDistance(Mission.player,Mission.turret1)<150.0)    and
      (not Mission.played_0806)) then 
  
    AudioMessage("isdf0806.wav")
    Mission.played_0806 = true
  end

  if ((not Mission.played_0807)  and  (GetDistance(Mission.player,"sees_datatransfer")<100.0)) then
  
    AudioMessage("isdf0807.wav")
    Mission.played_0807 = true
    ClearObjectives()
    AddObjective("isdf0801.otf","WHITE",10.0)
  end


-- As you exit the ruins, 3 Scion ships spawn in the Scion base and head towards you
	if (((GetDistance(Mission.player,"exitruin_1")<80.0)  or
      (GetDistance(Mission.player,"exitruin_2")<80.0))  and
      (not trigger1)) then
  
    Mission.attack1 = BuildObject("fvtank",2,"attack_1")
    Mission.attack2 = BuildObject("fvsent",2,"attack_2")
    Mission.attack3 = BuildObject("fvtank",2,"attack_3")
    Attack(Mission.attack1,Mission.player)
    Attack(Mission.attack2,Mission.player)
    Attack(Mission.attack3,Mission.player)
    trigger1 = true
  end

  if ((trigger1)  and  (not Mission.played_0808)) then
  
    AudioMessage("isdf0808.wav")
    Mission.played_0808 = true
  end

  if (((GetDistance(Mission.player,Mission.attack1)<300.0)  or
      (GetDistance(Mission.player,Mission.attack2)<300.0)  or
      (GetDistance(Mission.player,Mission.attack3)<300.0))  and
      (not Mission.played_0809)) then 
  
    AudioMessage("isdf0809.wav")
    Mission.played_0809 = true
  end

	-- isdf0811.wav doesn't exist - NM 11/14/03
  if (((GetDistance(Mission.player,Mission.attack1)<100.0)  or
      (GetDistance(Mission.player,Mission.attack2)<100.0)  or
      (GetDistance(Mission.player,Mission.attack3)<100.0))  and
      (not Mission.played_0811)) then 
  
    --AudioMessage("isdf0811.wav")
    Mission.played_0811 = true
  end


-- If you head south, the turrets will kill you
  -- if I am between entering the swamp and
  -- I hide in water (near swampn) then the patrols ignore me
  if ((Mission.played_0804) and
	  (not Mission.trigger2)) then 
  	
	  if ((GetDistance(Mission.player,"swamp1")<50.0) or
			(GetDistance(Mission.player,"swamp2")<50.0) or
			(GetDistance(Mission.player,"swamp3")<50.0) or
			(GetDistance(Mission.player,"swamp4")<50.0) or
			(GetDistance(Mission.player,"swamp5")<50.0) or
			(GetDistance(Mission.player,"swamp6")<50.0) or
			(GetDistance(Mission.player,"swamp7")<50.0)) then 
	  
		  SetPerceivedTeam(Mission.player,2)
		  SetIndependence(Mission.scout1,0)
		  SetIndependence(Mission.scout2,0)
	  
		else
	  
		  SetPerceivedTeam(Mission.player,1)
		  SetIndependence(Mission.scout1,1)
		  SetIndependence(Mission.scout2,1)
		end
		if ((not Mission.detected) and
			((GetWhoShotMe(Mission.scout1)==Mission.player) 
				or(GetWhoShotMe(Mission.scout2)==Mission.player))) then 
		
			Attack(Mission.scout1,Mission.player)
			Attack(Mission.scout2,Mission.player)
			Mission.detected = true
		end
	
  end
 -- As you approach the ISDF base, 3 friendly units launch to protect you from the Scion attackers
  if (((GetDistance(Mission.player,"enterbase_1")<100.0)  or
      (GetDistance(Mission.player,"enterbase_2")<100.0)  or
      (GetDistance(Mission.player,"enterbase_3")<100.0))  and
      (not Mission.trigger2)) then 
  
    Mission.rescue1 = BuildObject("ivtank",1,"rescue_1")
    Mission.rescue2 = BuildObject("ivmbike",1,"rescue_2")
    Mission.rescue3 = BuildObject("ivtank",1,"rescue_3")
    Attack(Mission.rescue1,Mission.attack1)
    Attack(Mission.rescue2,Mission.attack1)
    Attack(Mission.rescue3,Mission.attack1)
    Mission.trigger2 = true
  end

  if ((not IsAlive(Mission.attack1))  and
      (not Mission.killed_attack1)) then
  
    Attack(Mission.rescue1,Mission.attack2)
    Attack(Mission.rescue2,Mission.attack2)
    Attack(Mission.rescue3,Mission.attack2)
    Mission.killed_attack1 = true
  end

  if ((not IsAlive(Mission.attack2))  and
      (not Mission.killed_attack2)) then
  
    Attack(Mission.rescue1,Mission.attack3)
    Attack(Mission.rescue2,Mission.attack3)
    Attack(Mission.rescue3,Mission.attack3)
    Mission.killed_attack2 = true
  end



  if ((GetDistance(Mission.player,"edge_warning1")<25.0)
	  and (GetDistance(Mission.player,"edge_warning1")<25.0)
	  and (not Mission.edge_attack)) then
  
		Mission.edge_attack = true
		Attack(Mission.fvartl,Mission.player)
  end
-- If the ISDF ships get close to the Scion attack squadron, the Scions will stop chasing you and fight the ships
  if ((GetDistance(Mission.rescue1,Mission.attack1)<50.0)  or
      (GetDistance(Mission.rescue1,Mission.attack2)<50.0)  or
      (GetDistance(Mission.rescue1,Mission.attack3)<50.0)  or
      (GetDistance(Mission.rescue2,Mission.attack1)<50.0)  or
      (GetDistance(Mission.rescue2,Mission.attack2)<50.0)  or
      (GetDistance(Mission.rescue2,Mission.attack3)<50.0)  or
      (GetDistance(Mission.rescue3,Mission.attack1)<50.0)  or
      (GetDistance(Mission.rescue3,Mission.attack2)<50.0)  or
      (GetDistance(Mission.rescue3,Mission.attack3)<50.0)) then 
  
    Attack(Mission.attack1,Mission.rescue1)
    Attack(Mission.attack2,Mission.rescue2)
    Attack(Mission.attack3,Mission.rescue3)
  end

-- If you've killed all the attack vehicles and entered the base, the mission is a success
  if  (((GetDistance(Mission.player,"endmission1")<100.0)  or
      (GetDistance(Mission.player,"endmission2")<100.0))  and
      (not IsAlive(Mission.attack1))  and
      (not IsAlive(Mission.attack2))  and
      (not IsAlive(Mission.attack3))  and
      (not Mission.reached_base)) then 
	
  
		AudioMessage("isdf0514.wav")
		SucceedMission(GetTime()+10.0,"isdf08w1.txt")
		Mission.reached_base = true
  end
 	
end