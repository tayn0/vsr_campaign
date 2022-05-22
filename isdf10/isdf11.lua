--[[

isdf11
Event Scripting: 
Ported to LUA: 
Date: 7-11-2021
Description: Campagin mission isdf11 ported to LUA
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
    build_smoke = false,
    start_done = false,
    part_two = false,
    at_city = false,
    free_recycler = false,
    near_city = false, 
    search_ordered = false,
    search_warning1 = false,
    in_temple = false,
    temple_message1 = false,
    temple_message2 = false,
    temple_message3 = false,
    temple_message4 = false,
    ruin_reset1 = false,
    near_temple = false,
    check_temple_message = false,
    search_warning2 = false,
    last_warning = false,
    game_over = false,
    srecycler_dead = false,
    start_convoy = false,
    end_convoy = false,
    srecycler_deployed = false,
    new_build_orders = false,
    lung1_dead = false,
    spire1_made = false,
    lung1_made = false,
    def1_made = false,
    spire2_made = false,
    lung2_made = false,
    def2_made = false,
    bridge_spire1_made = false,
    bridge_lung1_made = false,
    bridge_def1_made = false,
    both_builders = false,
    player_across = false,
    return_message1 = false,
    return_message2 = false,
    bomber_reroute = false,
    at_bridge2 = false,
    at_bridge3 = false,
    search_message1 = false,
    bomber_message1 = false,
    bomber_message2 = false,
    bomber_message3 = false,
    bomber_message4 = false,
    bomber_message5 = false,
    bomber_message6 = false,
    bomber_take_off = false,
    nav_noshow = false,
    bomb_going_message = false,
    bridge_collapse = false,
    shab_pissed = false,
    shuttle_message = false,
    bombbay_a = false,
    builder1_a = false,
    builder2_a = false,
    first_bridge = false,
    srecycler_message = false,
    srecy_found = false,
 
    bomber_message = false, -- make sure you change this back
 
    recycler_message = false,
    spire1_a = false, 
	spire2_a = false, 
	bridgespire_a = false,
    to1 = false, 
	at1 = false, 
	build1 = false, 
    to2 = false, 
	at2 = false, 
	build2 = false, 
    to_bridgespire = false, 
	at_bridgespire = false, 
	build_bridgespire = false, 
    guard1_a = false, 
	guard2_a = false, 
	guard3_a = false, 
	guard4_a = false,
    scout_contact = false, 
	scout_attack = false,
    scout_to_base = false,
    bomber_a = false,
	wrecker_a = false,
	remove_bomber1 = false,
    guard1_to_point = false,
	guard2_to_point = false,
	guard3_to_point = false,
	guard4_to_point = false,
    scout_free = false,
    player_clear = false,
    condor2_away = false,
    condor1_remove = false, 
	condor2_remove = false,
    keep_moving = false, 
	kill_ruin = false,
    quake_started = false,
    check_convoy = false,
    fight_message = false,
    door_open_sound = false,
 
 
 
    --  floats
    city_check = 999999.9,
    search_check1 = 999999.9,
    search_check2 = 999999.9,
    next_message_time = 999999.9,
    warning_time = 999999.9,
    convoy_check = 999999.9,
    bridge_check = 2.0,
    across_time = 999999.9,
    across_time2 = 999999.9,
    message_wait = 999999.9,
    nav_check = 999999.9,
    return_time = 999999.9,
    collapse_time = 999999.9,
    spire_check = 999999.9,
    first_scout_check = 999999.9,
    bomber_check = 999999.9,
    last_check = 999999.9,
    turret_time = 999999.9,
    convoy_time = 999999.9,
    condor1_time = 999999.9,
    condor2_time = 999999.9,
    holder_time = 999999.9,
    smoke_time = 999999.9,
    cheat_time = 999999.9,
    damage_time = 999999.9,
    quake_time = 30,
 
    --  handles
    player,
	
    recycler,
    srecycler,
    forge,
    dower,
    overseer,
    s1_turret1,
    s1_turret2,
    s1_turret3,
    s1_turret4,
    s1_scav1,
    s1_scav2,
    s1_scav3,
    center_ruin,
    start_sent1,
    start_sent2,
    start_war1,
    start_war2,
    start_scout1,
    start_scout2,
    start_scout3,
    start_scout4,
    condor1,
    condor2,
    ivturr1,
    ivturr2,
    cave,
    ruin1,
    ruin2,
    ruin3,
    ruin4,
    transmitter,
    convoy_scav1,
    convoy_scav2,
    convoy_cons,
    cpool1,
    cpool2,
    dropship = nil,
    cave_nav = nil,
    nav2 = nil,
    smoker1 = nil,
	smoker2 = nil,
    holder = nil,
    guard1 = nil,
    guard2 = nil,
    guard3 = nil,
    guard4 = nil,
    builder1 = nil,
    builder2 = nil,
    spire1 = nil,
    spire2 = nil,
    bridgespire = nil,
    def1 = nil,
    def2 = nil,
    lung1 = nil,
    lung2 = nil,
    bridge_def1 = nil,
    bridge_def2 = nil,
    bridge_lung1 = nil,
    bridge_lung2 = nil,
    bridge_spire1 = nil,
    bridge_spire2 = nil,
    bomber_bay = nil,
    bomber = nil,
    bridge = nil,
    bridge_nav = nil,
    bomber1 = nil,
    rescue_nav = nil,
    cheat_war1 = nil,
    cheat_war2 = nil,
    talk = 0
}

function Save()
   return Mission
end

function Load(...)
   if select("#", ...) > 0 then
      Mission = ...
   end
end

function AddObject(h) --This function is called when an object appears in the game. --
   if (Mission.start_done) then
    
 
        -- BOMBERS
    elseif ((not Mission.wrecker_a) and (IsOdf(h,"apwrck"))) then
 
            Mission.wrecker_a = true
       
 
        
 
        -- GUARDIAN
    elseif ((not Mission.guard1_a) and (IsOdf(h,"fvturr"))) then
        
            Mission.guard1 = h
            Mission.guard1_a = true
        
    elseif ((not Mission.guard2_a) and (IsOdf(h,"fvturr"))) then
        
            Mission.guard2 = h
            Mission.guard2_a = true
        
    elseif ((not Mission.guard3_a) and (IsOdf(h,"fvturr"))) then
        
            Mission.guard3 = h
            Mission.guard3_a = true
        
    elseif ((not Mission.guard4_a) and (IsOdf(h,"fvturr"))) then
        
            Mission.guard4 = h
            Mission.guard4_a = true
        
        
 
    -- SCAVENGERS
    elseif ((Mission.sscav1 == nil) and (IsOdf(h,"fvscav"))) then
        
            Mission.sscav1 = h
        
    elseif ((Mission.sscav2 == nil) and (IsOdf(h,"fvscav"))) then
        
            Mission.sscav2 = h
        
 
    -- BUILDERS
    elseif ((not Mission.builder1_a) and (IsOdf(h,"fvcons"))) then
        
            Mission.builder1 = h
            Mission.builder1_a = true
 
        
    elseif ((not Mission.builder2_a) and (IsOdf(h,"fvcons"))) then
        
            Mission.builder2 = h
            Mission.builder2_a = true
        
 
    -- SPIRES
    elseif ((not Mission.spire1_a) and (IsOdf(h,"fbspir"))) then
        
            Mission.spire1 = h
            Mission.spire1_a = true
        
    elseif ((not Mission.spire2_a) and (IsOdf(h,"fbspir"))) then
        
            Mission.spire2 = h
            Mission.spire2_a = true
        
    elseif ((not Mission.bridgespire_a) and (IsOdf(h,"fbspir"))) then
        
            Mission.bridgespire = h
            Mission.bridgespire_a = true
        
 
    -- NAV BEACONS
    elseif ((Mission.bridge_nav == nil) and (IsOdf(h,"ibnav"))) then
        
        if (Mission.bomber_message2) then
            
            if (GetDistance(h,"bridge_center") < 70.0) then
                
                    Mission.bridge_nav = h
			end
        end
    end
end




function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function Start() --This function is called upon the first frame
SetAutoGroupUnits(false)
 
    --  handles
    Mission.player = GetPlayerHandle()
    Mission.recycler = GetHandle("recycler")
    Mission.srecycler = GetHandle("srecycler")
    Mission.forge = GetHandle("forge")
    Mission.dower = GetHandle("dower")
    Mission.overseer = GetHandle("overseer")
    Mission.s1_turret1 = GetHandle("s1_turret1")
    Mission.s1_turret2 = GetHandle("s1_turret2")
    Mission.s1_turret3 = GetHandle("s1_turret3")
    Mission.s1_turret4 = GetHandle("s1_turret4")
    Mission.s1_scav1 = GetHandle("s1_scav1")
    Mission.s1_scav2 = GetHandle("s1_scav2")
    Mission.s1_scav3 = GetHandle("s1_scav3")
    Mission.center_ruin = GetHandle("center_ruin")
    Mission.start_sent1 = GetHandle("sent1")
    Mission.start_sent2 = GetHandle("sent2")
    Mission.start_war1 = GetHandle("war1")
    Mission.start_war2 = GetHandle("war2")
    Mission.start_scout1 = GetHandle("start_scout1")
    Mission.start_scout2 = GetHandle("start_scout2")
    Mission.start_scout3 = GetHandle("start_scout3")
    Mission.start_scout4 = GetHandle("start_scout4")
    Mission.condor1 = GetHandle("condor1")
    Mission.condor2 = GetHandle("condor2")
    Mission.ivturr1 = GetHandle("ivturr1")
    Mission.ivturr2 = GetHandle("ivturr2")
    Mission.cave = GetHandle("cave")
    Mission.ruin1 = GetHandle("ruin1")
    Mission.ruin2 = GetHandle("ruin2")
    Mission.ruin3 = GetHandle("ruin3")
    Mission.ruin4 = GetHandle("ruin4")
    Mission.transmitter = GetHandle("transmitter")
    Mission.convoy_scav1 = GetHandle("convoy_scav1")
    Mission.convoy_scav2 = GetHandle("convoy_scav2")
    Mission.convoy_cons = GetHandle("convoy_cons")
    Mission.cpool1 = GetHandle("cpool1")
    Mission.cpool2 = GetHandle("cpool2")

 
   
end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --
 
    tempstr = ""
    ----------------------------------------------------------
    if (not Mission.ON_HOLD ) then
    
        ----------------------------------------------------------
 
 
 
        if((not IsAround(Mission.srecycler)) and (not Mission.srecycler_dead)) then
        
            SetAIP("isdf1103.aip",2)
            Mission.spire_check = GetTime() + 999999.9
            Mission.turret_time = GetTime() + 999999.9
            Mission.srecycler_dead = true
        
		end
 
 

        --------------------------------------------
 
 
        -- this is reseting the alive-dead bools
 

        if ((Mission.guard1_a) and (not IsAlive(Mission.guard1))) then
        
            Mission.guard1_to_point = false
            Mission.guard1_a = false
        end
        if ((Mission.guard2_a) and (not IsAlive(Mission.guard2))) then
        
            Mission.guard2_to_point = false
            Mission.guard2_a = false
        end
        if ((Mission.guard3_a) and (not IsAlive(Mission.guard3))) then
        
            Mission.guard3_to_point = false
            Mission.guard3_a = false
        end
        if ((Mission.guard4_a) and (not IsAlive(Mission.guard4))) then
        
            Mission.guard4_to_point = false
            Mission.guard4_a = false
        end
		
	
        ----------------------------------------------------------
        if (not Mission.ON_HOLD) then
        
            ----------------------------------------------------------
 
 
            if (not Mission.start_done) then
            
                SetColorFade(1,0.5,Make_RGBA(0, 0, 0, 255)) 
 
                MaskEmitter(Mission.condor1, 0)
                StartEmitter(Mission.condor2, 1)
                StartEmitter(Mission.condor2, 2)
 
                AddScrap(1,40)
                AddScrap(2,40)
 
                Ally(3,1)
                Ally(1,3)
 
                SetAIP("isdf1101.aip",2)
 
                Mission.holder = BuildObject("stayput",0,Mission.player)
                Mission.holder_time = GetTime() + 3.0
                --Mission.smoker1 = BuildObject("kickupw",0,"smoke2_a")
                --Mission.smoker2 = BuildObject("kickupw",0,"smoke2_b")
                Mission.smoke_time = GetTime() + 5.0
 
                --Goto(s1_scav1,base_pool1)
                --Goto(s1_scav2,base_pool2)
                --Goto(s1_scav3,base_pool3)

                SetAvoidType(Mission.srecycler,0)
                SetAvoidType(Mission.start_sent1,0)
                SetAvoidType(Mission.start_sent2,0)
                SetAvoidType(Mission.start_war1,0)
                SetAvoidType(Mission.start_war2,0)
                SetAvoidType(Mission.convoy_scav1,0)
                SetAvoidType(Mission.convoy_scav2,0)
                --SetAvoidType(Mission.convoy_cons,0)
                RemoveObject(Mission.convoy_cons)
 
                Follow(Mission.convoy_scav1,Mission.srecycler)
                Follow(Mission.convoy_scav2,Mission.convoy_scav1)
                --Follow(Mission.convoy_cons,Mission.convoy_scav2)
 
                SetAvoidType(Mission.ivturr1,0)
                SetAvoidType(Mission.ivturr2,0)
                Follow(Mission.ivturr1,Mission.player,0)
                Follow(Mission.ivturr2,Mission.player,0)
                SetAnimation(Mission.condor1,"deploy",1)
                SetAnimation(Mission.condor2,"takeoff",1)
                StartSoundEffect("dropleav.wav",Mission.condor2)StartSoundEffect("dropleav.wav",Mission.condor2)
                Mission.condor2_time = GetTime() + 10.0
 
                Mission.convoy_time = GetTime() + 180.0
                Mission.first_scout_check = GetTime() + 3.0
                Mission.start_done = true
            end
 
 
            -- this removes the holder
 
            if (Mission.holder_time < GetTime()) then
            
                RemoveObject(Mission.holder)
                Mission.holder_time = GetTime() + 999999.9
            end
            --------------------------------------------
 
 
            -- this removes the smokers
 
            if ((Mission.condor2_away) and (Mission.smoke_time < GetTime())) then
            
                if (not Mission.build_smoke) then
                
                    StartSoundEffect("dropleav.wav",Mission.condor1)
                    StartEmitter(Mission.condor1, 1)
                    StartEmitter(Mission.condor1, 2)       
                    Mission.smoke_time = GetTime() + 5.0
                    Mission.build_smoke = true
                
                else
                
                    Mission.smoke_time = GetTime() + 999999.9
                end
            
 
            elseif (Mission.smoke_time < GetTime()) then
            
                Mission.smoke_time = GetTime() + 999999.9
            end
            --------------------------------------------
 
 
            -- tells the two turrets to follow the player
 
            if ((not Mission.player_clear) and (Mission.start_done)) then
            
                if (GetDistance(Mission.player,Mission.ivturr1) > 40.0) then
                
                    AudioMessage("isdf1101.wav")--(shab) alright John, you're on your own - lets get a base established
                    ClearObjectives()
                    AddObjective("isdf1101.otf", "WHITE")
                    AddObjective("isdf1102.otf", "WHITE")   
                    Goto(Mission.ivturr1,"turret_go",0)
                    Goto(Mission.ivturr2,"turret_go",0)
                    Mission.player_clear = true
                end
            end
            --------------------------------------------
 
 
            -- tells the second condor to take off
 
            if ((not Mission.condor2_away) and (Mission.player_clear)) then
            
                if ((GetDistance(Mission.ivturr1,"condor_center") > 20.0) and (GetDistance(Mission.ivturr2,"condor_center") > 20.0)) then
                
                    SetAnimation(Mission.condor1,"takeoff",1)
                    Mission.condor1_time = GetTime() + 8.0
                    Mission.smoke_time = GetTime() + 3.0
                    Mission.condor2_away = true
                end
            end
            --------------------------------------------
 
            -- this gets rid of the condor
 
            if ((not Mission.condor2_remove) and (Mission.condor2_time < GetTime())) then
            
                RemoveObject(Mission.condor2)
                Mission.condor2_remove = true
            
			end
            if ((not Mission.condor1_remove) and (Mission.condor1_time < GetTime())) then
            
                RemoveObject(Mission.condor1)
                Mission.condor1_remove = true
            end
            --------------------------------------------
			
			
            -- this holding the recycler until I am ready
 
            if (not Mission.start_convoy) then
            
                Stop(Mission.srecycler)
            end
            --------------------------------------------
 
 
            -- this starts the convoy
 
            if ((not Mission.start_convoy) and (Mission.convoy_time < GetTime())) then
            
                Retreat(Mission.srecycler,"convoy_path2")
                Follow(Mission.start_sent1,Mission.srecycler,0)
                Follow(Mission.start_sent2,Mission.start_sent1,0)
                Follow(Mission.start_war1,Mission.srecycler,0)
                Follow(Mission.start_war2,Mission.start_war1,0)
                Mission.convoy_check = GetTime() + 3.0
                Mission.start_convoy = true
            end
            --------------------------------------------

 
            -- this is monitoring the scion recycler
 
            if (not Mission.srecycler_dead) then
            
                -- checking to see if the srecycler reaches the bridge
 
                if ((not Mission.end_convoy) and (Mission.start_convoy) and (Mission.convoy_check < GetTime())) then
                
                    Mission.convoy_check = GetTime() + 3.0
 
                    if ((not Mission.srecycler_message) and (GetDistance(Mission.srecycler,"bridge_center") < 100.0)) then
                    
                        if (GetDistance(Mission.player,Mission.srecycler) > 150.0) then
                        
                            if (Mission.first_bridge) then
                            
                                ClearObjectives()
                                AddObjective("isdf1103.otf", "WHITE")
                                AddObjective("isdf1102.otf", "WHITE")
                                Mission.talk = AudioMessage("isdf1102.wav")--(brad) Detecing a scion recycler moving across the bridge!
                                --Mission.cave_nav = BuildObject("ibnav",1,"cave_nav_point")   
                                SetObjectiveOn(Mission.srecycler)
                                --TranslateString(tempstr, "Mission1101")  -- Convoy
                                SetObjectiveName(Mission.srecycler,"Convoy")
                                Mission.srecycler_message = true
                            
                            else
                            
                                ClearObjectives()
                                AddObjective("isdf1103.otf", "WHITE")
                                AddObjective("isdf1102.otf", "WHITE")
                                Mission.talk = AudioMessage("isdf1103.wav")--(brad) Detecing a scion recycler moving across A LAND bridge!
                                --Mission.cave_nav = BuildObject("ibnav",1,"cave_nav_point")   
                                SetObjectiveOn(Mission.srecycler)
                                --TranslateString(tempstr, "Mission1101")
                                SetObjectiveName(Mission.srecycler,"Convoy")
                                Mission.srecycler_message = true
                            end
                        
                        elseif (GetDistance(Mission.player,Mission.srecycler) < 250.0) then
                        
                            ClearObjectives()
                            AddObjective("isdf1103.otf", "GREEN")
                            AddObjective("isdf1102.otf", "WHITE")
                            Mission.talk = AudioMessage("isdf1104.wav")--(brad) There's a Scion convoy headed your way! Stop it!
                            --Mission.cave_nav = BuildObject("ibnav",1,"cave_nav_point")   
                            SetObjectiveOn(Mission.srecycler)
                            TranslateString(tempstr, "Mission1101")  -- Convoy
                            SetObjectiveName(Mission.srecycler,"Convoy")
                            Mission.srecycler_message = true
                        end
                    end
 
 
                    if ((Mission.srecycler_message) and (not Mission.srecy_found)) then
                    
                        if (GetDistance(Mission.player,Mission.srecycler) < 200.0) then
                        
                            SetObjectiveOff(Mission.srecycler)
 
                            ClearObjectives()
                            SetAIP("isdf1103.aip",2)
                            AddObjective("isdf1103.otf", "GREEN")
                            AddObjective("isdf1104.otf", "WHITE")
                            AddObjective("isdf1102.otf", "WHITE")
                            --AudioMessage("isdf1112.wav")--(brad) I don't like the look of this - they're up to something!
 
                            if (IsAlive(Mission.start_war1)) then
                            
                                Attack(Mission.start_war1,Mission.player)
                               
							end
                            if (IsAlive(Mission.start_war2)) then
                            
                                Attack(Mission.start_war2,Mission.player)
                               
							end
                            if (not Mission.scout_attack) then
                            
                                if ((IsAround(Mission.start_scout1)) and (IsAlive(Mission.start_scout1))) then
                                
                                    Goto(Mission.start_scout1,"attack_path1")
                                end
 
                                if ((IsAround(Mission.start_scout2)) and (IsAlive(Mission.start_scout2))) then
                                
                                    Goto(Mission.start_scout2,"attack_path1")
                                end
 
                                if ((IsAround(Mission.start_scout3)) and (IsAlive(Mission.start_scout3))) then
                                
                                    Goto(Mission.start_scout3,"attack_path2")
                                end
 
                                if ((IsAround(Mission.start_scout4)) and (IsAlive(Mission.start_scout4))) then
                                
                                    Goto(Mission.start_scout4,"attack_path2")
                                end
 
                                Mission.scout_attack = true
                            end
 
                            Mission.srecy_found = true
                        end
 
                        if (GetDistance(Mission.srecycler,"deploy_point") < 300.0) then
                        
                            SetObjectiveOff(Mission.srecycler)
 
                            ClearObjectives()
                            AddObjective("isdf1103.otf", "RED")
                            AddObjective("isdf1104.otf", "WHITE")
                            AddObjective("isdf1102.otf", "WHITE")
 
                            if (not Mission.scout_attack) then
                            
                                if ((IsAround(Mission.start_scout1)) and (IsAlive(Mission.start_scout1))) then
                                
                                    Goto(Mission.start_scout1,"attack_path1")
                                end
 
                                if ((IsAround(Mission.start_scout2)) and (IsAlive(Mission.start_scout2))) then
                                
                                    Goto(Mission.start_scout2,"attack_path1")
                                end
 
                                if ((IsAround(Mission.start_scout3)) and (IsAlive(Mission.start_scout3))) then
                                
                                    Goto(Mission.start_scout3,"attack_path2")
                                end
 
                                if ((IsAround(Mission.start_scout4)) and (IsAlive(Mission.start_scout4))) then
                                
                                    Goto(Mission.start_scout4,"attack_path2")
                                end
 
                                Mission.scout_attack = true
                                               
							end
                            Mission.srecy_found = true     
                            --Mission.bomber_message = true    
                        end                           
                    end
 
 
                    -- this is shab telling cook to check it out
 
                    if ((Mission.srecycler_message) and (not Mission.check_convoy) and (IsAudioMessageDone(Mission.talk))) then
                    
                        AudioMessage("isdf1142.wav")--(shab) All right check out the convoy!
                        Mission.check_convoy = true
                    end
 
 
                    -- this is keeping the scion recycler going
 
                    if ((Mission.srecy_found) and (not Mission.keep_moving)) then
                    
                        Retreat(Mission.srecycler,"deploy_point")
                        Mission.keep_moving = true
                    end
                    --------------------------------------------
 
 
                    -- this tells the recycler to deploy
 
                    if (GetDistance(Mission.srecycler,"deploy_point") < 50.0) then
                    
                        SetAIP("isdf1102.aip",2)
                        Dropoff(Mission.srecycler,"srecy_drop")
 
                        ClearObjectives()
                        AddObjective("isdf1104.otf", "WHITE")
                        AddObjective("isdf1102.otf", "WHITE")
 
                        Mission.nav2 = BuildObject("ibnav",1,"nav2_point")
                        SetObjectiveOn(Mission.nav2)
                        --TranslateString2(tempstr, sizeof(tempstr), "Mission1102")  -- Convoy
                        SetObjectiveName(Mission.nav2, "Convoy")
 
                        if (GetDistance(Mission.player,Mission.srecycler) > 200.0) then
                        
                            AudioMessage("isdf1105.wav")--(brad) We've lost track of those vehicles somewhere to the southwest of the bridge Find it!
                        end
 
                        if (IsAlive(Mission.start_sent1)) then
                        
                            Stop(Mission.start_sent1,0)
                        end
 
                        if (IsAlive(Mission.start_sent2)) then
                        
                            Stop(Mission.start_sent2,0)
                        end
 
                        if (IsAlive(Mission.start_war1)) then
                        
                            Stop(Mission.start_war1,0)
                        end
 
                        if (IsAlive(Mission.start_war2)) then
                        
                            Stop(Mission.start_war2,0)
                        end
 
                        if (IsAlive(Mission.convoy_scav1)) then
                        
                            Goto(Mission.convoy_scav1,Mission.cpool1)
                        end
 
                        if (IsAlive(Mission.convoy_scav2)) then
                        
                            Goto(Mission.convoy_scav2,Mission.cpool2)
                        end
 
                        --if (IsAlive(Mission.convoy_cons))
                        --
                        --  Stop(Mission.convoy_cons,0)
                        --
 
                        Mission.end_convoy = true
                    end
                end
                --------------------------------------------
            
            else
            
                if (Mission.bomber_message == false) then
                       
                    --AudioMessage("isdf1112.wav") --(brad) alright shab juice up my bomber - John go and drop nav at bridge - I'll tell you where
--                  AudioMessage("isdf1141.wav")--(brad) Good work Soldier that cave leaves our right flank too open! go and drop a nav!           
--                  AudioMessage("isdf1116.wav")--(brad) Good work Soldier that cave leaves our right flank too open! go and drop a nav!           
                    AudioMessage("isdf1106.wav") -- good job!
                    ClearObjectives()
                    --AddObjective("isdf1106.otf", "GREEN")
                    --AddObjective("isdf1105.otf", "WHITE")
                    AddObjective("isdf1107.otf", "WHITE")
                    --SetTeamNum(Mission.bomber_bay,0)
                    --SetTeamNum(bomber,0)
                    --Ally(0,1)
                    --Ally(1,0)
 
                    if (IsAround(Mission.nav2)) then
                    
                        SetObjectiveOff(Mission.nav2)
                    end
 
                    Mission.bridge_check = GetTime() + 1.0
                    Mission.bomber_message1 = true
                    Mission.bomber_message = true
                end
            end
            --------------------------------------------
 
 
            -- this is the first scout scout encounter
 
            if (not Mission.srecycler_message) then
            
                if (IsAlive(Mission.start_scout1)) then
                
                    if ((Mission.start_convoy) and (not Mission.scout_free)) then
                    
                        Goto(Mission.start_scout1,"attack_path1",0)
                        Mission.scout_free = true
                    end
				
			
                    -- scout attacks player
 
                    if ((not Mission.scout_contact) and (Mission.first_scout_check < GetTime())) then
                    
                        Mission.first_scout_check = GetTime() + 2.0
 
                        if (not Mission.door_open_sound) then
                        
                            StartSoundEffect("dropdoor.wav")
                            Mission.door_open_sound = true
                        end
 
                        if (GetDistance(Mission.player,Mission.start_scout1) < 300.0) then
                        
                            Attack(Mission.start_scout1,Mission.player)
                            Mission.scout_contact = true
                        end
                    end
 
                    -- scout runs to players base
 
                    if ((Mission.scout_contact) and (not Mission.scout_to_base)) then
                    
                        if (GetCurHealth(Mission.start_scout1) < 400) then
                        
                            Attack(Mission.start_scout1,Mission.recycler,0)
                            Mission.first_scout_check = GetTime() + 2.0
                            Mission.scout_to_base = true
                        end
                    end
 
                    if ((Mission.scout_to_base) and (not Mission.scout_attack) and (Mission.first_scout_check < GetTime())) then
                    
                        Mission.first_scout_check = GetTime() + 2.0
 
                        if (GetDistance(Mission.start_scout1,Mission.recycler) < 300.0) then
                        
                        
                            SetAIP("isdf1103.aip",2)
 
                            if ((IsAround(Mission.start_scout2)) and (IsAlive(Mission.start_scout2))) then
                            
                                Goto(Mission.start_scout2,"attack_path1",0)
                            end
 
                            if ((IsAround(Mission.start_scout3)) and (IsAlive(Mission.start_scout3))) then
                            
                                Goto(Mission.start_scout3,"attack_path2",0)
                            end
 
                            if ((IsAround(Mission.start_scout4)) and (IsAlive(Mission.start_scout4))) then
                            
                                Goto(Mission.start_scout4,"attack_path1",0)
                            end
 
                            Mission.scout_attack = true
                        end
                    end
                end
            end
 
 
            ----------------------------------------------------------
        end
        ----------------------------------------------------------
 
 
        -- this is bridge code
 
 
        -- this is checking to see if the player goes across the bridge
 
        if ((Mission.bridge_check < GetTime()) and (not Mission.player_across)) then
        
            Mission.bridge_check = GetTime() + 0.5
 
            if (not Mission.bomber_message1) then
            
                if (not Mission.recycler_message) then
                
 
                    if ((not Mission.first_bridge) and (GetDistance(Mission.player,"bridge_center") < 150.0)) then
                    
                        AudioMessage("isdf1109.wav")--(shab) That's the cave - it looks unstable best to stay on this side of the cravass
                        Mission.first_bridge = true
						
											
                    end
                end
 
                if  (((GetDistance(Mission.player,"bridge_check2") < GetDistance(Mission.player,"bridge_center"))) 
                    or ((GetDistance(Mission.player,"bridge_check3") < GetDistance(Mission.player,"bridge_center")))) then
                
                    --across_time = GetTime() + 300.0
                    Mission.player_across = true
                end
            
            elseif (Mission.bomber_message1) then
            
                if (not Mission.bomber_message2) then
                
                    if (GetDistance(Mission.player,"bridge_center") < 200.0) then
                    
                        SetAIP("isdf1101.aip",2)
                        Mission.talk = AudioMessage("isdf1116.wav")--(brad) *disturbance* that's good there drop the nav!
                        Mission.nav_check = GetTime() + 10.0
                        Mission.bomber_message2 = true
                    end
                end
 
 
                if (Mission.bomber_message6) then
                
                    if (GetDistance(Mission.player,"bridge_check2") < 250.0) then
                    
                        Mission.across_time2 = GetTime() + 300.0
                        Mission.at_bridge2 = true
                        Mission.player_across = true
					end
                    
                    if  (GetDistance(Mission.player,"bridge_check3") < 100.0) then
                    
                        Mission.across_time2 = GetTime() + 300.0
                        Mission.at_bridge3 = true
                        Mission.player_across = true
                    
                    end
				end
			end
		end
 
        if ((Mission.player_across) and (Mission.bridge_check < GetTime())) then
        
            Mission.bridge_check = GetTime() + 2.0
 
 
            if (not Mission.bomber_message1) then
            
                if (not Mission.return_message1) then
                
                    AudioMessage("isdf1107.wav") -- (braddock) I ordered you to not go accross - You have got 2 minutes to return to your post!
                    Mission.across_time = GetTime() + 120.0
                    Mission.return_message1 = true
                end
 
 
                if ((GetDistance(Mission.player,"bridgespire_point2")) < (GetDistance(Mission.player,"bridge_center"))) then
                
                    --across_time = GetTime() + 999999.9
                    Mission.return_message1 = false
                    Mission.return_message2 = false
                    Mission.player_across = false
                end
            
            elseif (Mission.bomber_message3) then
            
                if ((Mission.at_bridge2) and (not Mission.search_message1)) then
                
                    StopAudioMessage(Mission.talk)
                    AudioMessage("isdf1117.wav") -- (shab) your close John - just X meters to the south
                    Mission.across_time2 = GetTime() + 300.0
                    Mission.city_check = GetTime() + 1.0
                    SetObjectiveOn(Mission.center_ruin)
                    --TranslateString(tempstr, "Mission1103")  -- Signal Source
                    SetObjectiveName(Mission.center_ruin,"Signal Source")
 
 
                    Mission.bomber_message4 = true
                    Mission.bomber_message5 = true
                    Mission.bomber_message6 = true
 
                    Mission.search_message1 = true
                end
 
 
                if ((Mission.at_bridge3) and (not Mission.search_message1)) then
                
                    StopAudioMessage(Mission.talk)
                    AudioMessage("isdf1118.wav") -- (shab) your far John - just X meters to the south
                    Mission.across_time2 = GetTime() + 300.0
                    Mission.city_check = GetTime() + 1.0
                    SetObjectiveOn(Mission.center_ruin)
                    --TranslateString(tempstr, "Mission1103")  -- Signal Source
                    SetObjectiveName(Mission.center_ruin,"Signal Source")
 
                    Mission.bomber_message4 = true
                    Mission.bomber_message5 = true
                    Mission.bomber_message6 = true
 
                    Mission.search_message1 = true
                end
            end
        end
 
 
        -- this is the messages at the bridge
 
        if ((Mission.bomber_message2) and (not Mission.near_city)) then
        
            if ((not Mission.nav_noshow) and (IsAround(Mission.bridge_nav))) then
            
                if (not Mission.bomb_going_message) then
                
                    Mission.talk = AudioMessage("isdf1119.wav")--(bomber) I got the target!
                    Mission.bomb_going_message = true
                end
 
                if ((not Mission.bomber_message3) and (IsAudioMessageDone(Mission.talk))) then
                
                    AudioMessage("isdf1120.wav") -- (shab) *disturbance* Good job john - Hold on...We were getting radio interferrence
                    Mission.message_wait = GetTime() + 8.0
                    Mission.bomber_message3 = true
                end
 
 
                if ((not Mission.bomber_message4) and (Mission.bomber_message3) and (Mission.message_wait < GetTime())) then
                
                    Mission.talk = AudioMessage("isdf1121.wav")--(shab) Can you hear me now John?  General, we're picking up transmission I had to reroute to another channel! 
                    Mission.bomber_message4 = true
                
                end    
 
                if ((Mission.bomber_message4) and (not Mission.bomber_message5) and (IsAudioMessageDone(Mission.talk))) then
                
                    Mission.talk = AudioMessage("isdf1122.wav")--(brad) John locate source of tranasmissionnot 
                    ClearObjectives()
                    AddObjective("isdf1108.otf", "WHITE")
                    Mission.bomber_message5 = true
                end
 
 
                if ((Mission.bomber_message5) and (not Mission.bomber_message6) and (IsAudioMessageDone(Mission.talk))) then
                
                    Mission.talk = AudioMessage("isdf1123.wav")--(shab) Source is south east of current position
                    Mission.bomber_message6 = true
                end
            
            elseif (Mission.nav_check < GetTime()) then
            
                Mission.nav_noshow = true
 
                if ((not Mission.bomber_message3) and (IsAudioMessageDone(Mission.talk))) then
                
                    AudioMessage("isdf1124.wav") -- (shab) *disturbance* did you get that John? Drop the nav - Hold on...We were getting radio interferrence
                    Mission.message_wait = GetTime() + 8.0
                    Mission.bomber_message3 = true
                end
 
 
                if ((not Mission.bomber_message4) and (Mission.bomber_message3) and (Mission.message_wait < GetTime())) then
                
                    Mission.talk = AudioMessage("isdf1121.wav")--(shab) Can you hear me now John?  General, we're picking up transmission I  had to reroute to another channel! 
                    Mission.bomber_message4 = true
                end
 
 
                if ((Mission.bomber_message4) and (not Mission.bomber_message5) and (IsAudioMessageDone(Mission.talk))) then
                
                    Mission.talk = AudioMessage("isdf1122.wav")--(brad) John locate source of tranasmission!
                    ClearObjectives()
                    AddObjective("isdf1108.otf", "WHITE")
                    Mission.bomber_message5 = true
                end
 
 
                if ((Mission.bomber_message5) and (not Mission.bomber_message6) and (IsAudioMessageDone(Mission.talk))) then
                
                    Mission.talk = AudioMessage("isdf1123.wav")--(shab) Source is south east of current position
                    Mission.bomber_message6 = true
                end
            end
        end
        --------------------------------------------
 
 
        ----------------------------------------------------------
        if (not Mission.ON_HOLD) then
        
            ----------------------------------------------------------
 
 
            -- this is when the convoy makes it
 
 
            -- checking to see if the srecycler is deployed
 
            if ((not Mission.srecycler_deployed) and (Mission.end_convoy)) then
            
                SetAIP("isdf1102.aip",2)
                Mission.turret_time = GetTime() + 2.0
                Mission.spire_check = GetTime() + 3.0
                Mission.cheat_time = GetTime() + 240.0
                Mission.srecycler_deployed = true
            end
            --------------------------------------------
 
 
            -- this is to spice things up
 
            if ((Mission.end_convoy) and (not Mission.bomber_message) and (Mission.cheat_time < GetTime())) then
            
                if ((not IsAlive(Mission.cheat_war1)) and (not IsAlive(Mission.cheat_war2))) then
                
                    Mission.cheat_war1 = BuildObject("fvtank",2,"sbase1_spawn1")
                    Mission.cheat_war2 = BuildObject("fvtank",2,"sbase1_spawn2")
                    Goto(Mission.cheat_war1,"war_attack",0)
                    Follow(Mission.cheat_war2,Mission.cheat_war1,0)
                    Mission.cheat_time = GetTime() + 300.0
                end
            end
            --------------------------------------------
 
 
            -- this is builder code
 
            if ((Mission.srecycler_deployed) and (IsAround(Mission.srecycler))) then
            
                -- finding out when the spires exists (this is important)
 
                if (IsAround(Mission.spire1)) then
                
                    Mission.spire1_made = true
                end
                if (IsAround(Mission.lung1)) then
                
                    Mission.lung1_made = true
                end
 
 
                if (IsAround(Mission.spire2)) then
                
                    Mission.spire2_made = true
                end
                if (IsAround(Mission.lung2)) then
                
                    Mission.lung2_made = true
                end
 
 
                if (IsAround(Mission.bridge_spire1)) then
                
                    Mission.bridge_spire1_made = true
                end
                if (IsAround(Mission.bridge_lung1)) then
                
                    Mission.bridge_lung1_made = true
                end
                --------------------------------------------
 
 
                -- this is the turret code
 
                if (Mission.turret_time < GetTime()) then
                
                    Mission.turret_time = GetTime() + 2.0
 
                    if (Mission.guard1_a) then
                    
                        if (not Mission.guard1_to_point) then
                        
                            Goto(Mission.guard1,"sturret_point1",0)
                            Mission.guard1_to_point = true
                        end
                    end
 
                    if (Mission.guard2_a) then
                    
                        if (not Mission.guard2_to_point) then
                        
                            Goto(guard2,"sturret_point2",0)
                            Mission.guard2_to_point = true
                        end
                    end
 
                    if (Mission.guard3_a) then
                    
                        if (not Mission.guard3_to_point) then
                        
                            Goto(guard3,"sturret_point3",0)
                            Mission.guard3_to_point = true
                        end
                    end
 
                    if (Mission.guard4_a) then
                    
                        if (not Mission.guard4_to_point) then
                        
                            Goto(Mission.guard4,"sturret_point4",0)
                            Mission.guard4_to_point = true
                        end
                    end
                end
                --------------------------------------------
 
 
                -- finding out when the builders exists (this is important)
 
                if ((Mission.builder1_a) and (not IsAlive(Mission.builder1))) then
                
                    Mission.to1 = false
                    Mission.at1 = false
                    Mission.build1 = false
                    Mission.to2 = false
                    Mission.at2 = false
                    Mission.build2 = false
                    Mission.to_bridgespire = false
                    Mission.at_bridgespire = false
                    Mission.build_bridgespire = false
                    Mission.builder1_a = false
                end
 
                if ((Mission.builder2_a) and (not IsAlive(Mission.builder2))) then
                
                    Mission.builder2_a = false
                end
 
                if ((Mission.builder1_a) and (Mission.builder2_a)) then
                
                    Mission.both_builders = true
                
                else
                
                    Mission.builder1_a = false
                    Mission.builder2_a = false
                    Mission.both_builders = false
                end
 
                if ((Mission.spire1_a) and (not IsAround(Mission.spire1_a))) then
                
                    Mission.spire1_a = false
                end
 
                if ((Mission.spire2_a) and (not IsAround(Mission.spire2_a))) then
                
                    Mission.spire2_a = false
                end
                --------------------------------------------
 
 
                -- this is starting the builder to build the spires
 
                if (not Mission.new_build_orders) then
                
                    if (Mission.builder1_a) then
                    
                        if (not Mission.spire1_a) then
                        
                            if (not Mission.to1) then
                            
                                Goto(Mission.builder1,"s1_point",0)
                                Mission.spire_check = GetTime() + 3.0
                                Mission.to1 = true
                            end
 
                            if ((Mission.to1) and (not Mission.at1) and (Mission.spire_check < GetTime())) then
                            
                                Mission.spire_check = GetTime() + 3.0
 
                                if (GetDistance(Mission.builder1,"s1_point") < 20.0) then
                                
                                    Build(Mission.builder1,"fbspir")
                                    Mission.spire_check = GetTime() + 3.0
                                    Mission.at1 = true
                                end
                            end
 
                            if ((Mission.at1) and (not Mission.build1) and (Mission.spire_check < GetTime())) then
                            
                                Mission.spire_check = GetTime() + 3.0
 
                                if (GetScrap(2) > 50) then
                                
                                    Dropoff(Mission.builder1,"s1_point")
                                    Mission.spire_check = GetTime() + 3.0
                                    Mission.build1 = true
                                end
                            end
                       
                        elseif (not Mission.spire2_a) then
                        
                            if (not Mission.to2) then
                            
                                Goto(Mission.builder1,"s2_point",0)
                                Mission.spire_check = GetTime() + 3.0
                                Mission.to2 = true
                            end
 
                            if ((Mission.to2) and (not Mission.at2) and (Mission.spire_check < GetTime())) then
                            
                                Mission.spire_check = GetTime() + 3.0
 
                                if (GetDistance(Mission.builder1,"s2_point") < 20.0) then
                                
                                    Build(Mission.builder1,"fbspir")
                                    Mission.spire_check = GetTime() + 3.0
                                    Mission.at2 = true
                                end
                            end
 
                            if ((Mission.at2) and (not Mission.build2) and (Mission.spire_check < GetTime())) then
                            
                                Mission.spire_check = GetTime() + 3.0
 
                                if (GetScrap(2) > 50) then
                                
                                    Dropoff(Mission.builder1,"s2_point")
                                    Mission.spire_check = GetTime() + 3.0
                                    Mission.build2 = true
                                end
                            end
                        
                        elseif (not Mission.bridgespire_a) then
                        
                            if (not Mission.to_bridgespire) then
                            
                                Goto(Mission.builder1,"bridgespire_point2",0)
                                Mission.spire_check = GetTime() + 3.0
                                Mission.to_bridgespire = true
                            end
 
                            if ((Mission.to_bridgespire) and (not Mission.at_bridgespire) and (Mission.spire_check < GetTime())) then
                            
                                Mission.spire_check = GetTime() + 3.0
 
                                if (GetDistance(Mission.builder1,"bridgespire_point2") < 20.0) then
                                
                                    Build(Mission.builder1,"fbspir")
                                    Mission.spire_check = GetTime() + 3.0
                                    Mission.at_bridgespire = true
                                end
                            end
 
                            if ((Mission.at_bridgespire) and (not Mission.build_bridgespire) and (Mission.spire_check < GetTime())) then
                            
                                Mission.spire_check = GetTime() + 3.0
 
                                if (GetScrap(2) > 50) then
                                
                                    Dropoff(Mission.builder1,"bridgespire_point2")
                                    Mission.spire_check = GetTime() + 3.0
                                    Mission.build_bridgespire = true
                                end
                            end
                        end
                    end
                end
            end
            --------------------------------------------
 
		end
            ----------------------------------------------------------
        
        ----------------------------------------------------------
 
 
        -- this is bomber bay code --------------------------------------------
 
        -- this is checking to see when the player gets to the city
 
        if (Mission.bomber_message3) then
        
            if ((not Mission.at_city) and (Mission.city_check < GetTime())) then
            
                Mission.city_check = GetTime() + 1.0
 
 
                if ((not Mission.near_city) and (GetDistance(Mission.player,Mission.center_ruin) < 500.0)) then
                
                    Mission.talk = AudioMessage("isdf1125.wav")--(shab) You're coming up on the signal
                    Mission.near_city = true
                end
 
 
                if ((Mission.near_city) and (not Mission.at_city) and (GetDistance(Mission.player,Mission.center_ruin) < 400.0)) then
                
                    AudioMessage("isdf1126.wav")--(shab) Oh my god! Proceed inside with caution!
                    Mission.search_check1 = GetTime() + 240.0
                    Mission.search_ordered = true
                    Mission.at_city = true
                end
            end
            --------------------------------------------
 
            -- this is the fight message
 
            if ((Mission.at_city) and (not Mission.fight_message) and (GetDistance(Mission.player,Mission.center_ruin) < 200.0)) then
            
                Mission.talk = AudioMessage("isdf1108.wav")--(shab) looks like a city ruin
                Mission.fight_message = true
            end
            --------------------------------------------
 
 
            -- this is if the player does not go into city
 
            if ((Mission.search_ordered) and (not Mission.search_warning1) and (not Mission.near_temple)) then
            
                if (Mission.search_check1 < GetTime()) then
                
                    Mission.warning_time = GetTime() + 180.0
                    Mission.talk = AudioMessage("isdf1127.wav")--(braddock) Get the led out son - I want that city searched!   
                    Mission.search_warning1 = true
                end
            end
            --------------------------------------------
 
 
            -- this is if the player does not go into city
 
            if ((not Mission.near_temple) and (Mission.search_ordered) and (Mission.city_check < GetTime())) then
            
                Mission.city_check = GetTime() + 1.0
 
 
                if ((GetDistance(Mission.player,Mission.center_ruin) < 100.0) and (IsAudioMessageDone(Mission.talk))) then
                
                    if (Mission.ruin_reset1) then
                    
                        Mission.talk = AudioMessage("isdf1128.wav")--(braddock) The source of the transmition is coming from a building just above your location
                        Mission.search_check2 = GetTime() + 240.0
                        --SetObjectiveOn(Mission.center_ruin)
                        --SetObjectiveName(Mission.center_ruin,"Signal Source")
                        Mission.check_temple_message = true
                    
                    else
                    
                        Mission.talk = AudioMessage("isdf1129.wav")--(braddock) The source of the transmition is coming from the center of the city
                        Mission.search_check2 = GetTime() + 240.0
                        Mission.check_temple_message = true
                    end
 
                    Mission.search_check1 = GetTime() + 240.0
                    Mission.warning_time = GetTime() + 999999.9
                    --SetObjectiveOn(Mission.center_ruin)
                    --SetObjectiveName(Mission.center_ruin,"Signal Source")
                    Mission.near_temple = true
                end
            end
            --------------------------------------------
 
 
            -- this is if the player does not go into temple
 
            if ((Mission.near_temple) and (not Mission.search_warning2) and (not Mission.in_temple)) then
            
                if (Mission.search_check2 < GetTime()) then
                
                    AudioMessage("isdf1130.wav")--(braddock) Get the led out son - Check out the temple in the center!
                    Mission.warning_time = GetTime() + 180.0
                    Mission.search_warning2 = true
                end
            end
 
 
            -- this is what happens when the player is warned about something
 
            if ((not Mission.in_temple) and (Mission.warning_time < GetTime()) and (not Mission.last_warning)) then
            
                AudioMessage("isdf1131.wav")--(braddock) this is your last warning to carry out my orders!
                Mission.warning_time = GetTime() + 200.0
                Mission.last_warning = true
            end
            --------------------------------------------
 
 
            -- this is checking to see when the player is inside the temple
 
            if ((Mission.check_temple_message) and (not Mission.in_temple) and (GetDistance(Mission.player,Mission.transmitter) < 40.0)) then --(InBuilding(player) == Mission.center_ruin))
            
                StopAudioMessage(Mission.talk)
                Mission.talk = AudioMessage("isdf1132.wav")--(shab) That's is it John. Can you scan anything that looks like a transmission device.
                SetObjectiveOff(Mission.center_ruin)
                Mission.warning_time = GetTime() + 999999.9
                Mission.in_temple = true
            end
 
 
            if ((Mission.in_temple) and (not Mission.temple_message1) and (IsAudioMessageDone(Mission.talk))) then
            
                Mission.talk = AudioMessage("isdf1133.wav")--(braddock) I've seen enough - Liberator One, one do you copy those coordinates?
                Mission.temple_message1 = true
            end
 
 
            if ((Mission.temple_message1) and (not Mission.temple_message2) and (IsAudioMessageDone(Mission.talk))) then
            
                Mission.talk = AudioMessage("isdf1134.wav")--(bomber pilot) roger that - on my way there
                SetTeamNum(Mission.center_ruin,2)
                Mission.temple_message2 = true
            end
 
 
            if ((Mission.temple_message2) and (not Mission.temple_message3) and (IsAudioMessageDone(Mission.talk))) then
            
                Mission.talk = AudioMessage("isdf1135.wav")--(braddock) John, I'd get out of there if I were you!
                Mission.bomber1 = BuildObject("ivbomb",3,"bomber_spawn_point")
                Goto(Mission.bomber1,Mission.center_ruin)
                Mission.next_message_time = GetTime() + 5.0
                Mission.temple_message3 = true
            end
 
 
            if ((Mission.temple_message3) and (not Mission.temple_message4) and (Mission.next_message_time < GetTime())) then
            
                Mission.talk = AudioMessage("isdf1136.wav")--(shab) What are you doing - wait until my man is out of there! John get to base!
                ClearObjectives()
                AddObjective("isdf1109.otf", "WHITE")
                SetObjectiveOn(Mission.recycler)
                --TranslateString2(tempstr, sizeof(tempstr), "Mission1104")  -- Base
                SetObjectiveName(Mission.recycler,"Base")
                --Mission.next_message_time = GetTime() + 5.0
                Mission.return_time = GetTime() + 2.0
                Mission.temple_message4 = true
            end
            --------------------------------------------
        end
 
 
        if ((IsAround(Mission.transmitter)) and (not Mission.temple_message4)) then
        
            SetCurHealth(Mission.transmitter,100)
        end
 
 
        -- this is checking to see when the bomber reaches the center building
 
        if ((Mission.temple_message3) and (not Mission.bomber_reroute)) then
        
            if ((IsAround(Mission.bomber1)) and (GetDistance(Mission.bomber1,Mission.center_ruin) < 90.0)) then
            
                if (GetCurrentCommand(Mission.bomber1) == CMD_NONE) then --(CountUnitsNearObject(Mission.center_ruin,200.0,1,"apwrck") == 1)
                
                    BuildObject("apwrck",1,Mission.bomber1)
                    Goto(Mission.bomber1,"bomber_path1")
                    Mission.bomber_check = GetTime() + 2.0
                    Mission.damage_time = GetTime() + 10.0
                    Mission.bomber_reroute = true
                end
            end
        end
        --------------------------------------------
 
 
        -- this is assigning more damage to the ruin
 
        if ((Mission.bomber_reroute) and (Mission.damage_time < GetTime())) then
        
            if (not Mission.kill_ruin) then
            
                Mission.damage_time = GetTime() + 3.0
                StartEarthQuake(20.0)
 
                if (IsAround(Mission.center_ruin)) then
                
                    Damage(Mission.center_ruin,6000)
                end
 
                if (IsAround(Mission.ruin1)) then
                
                    Damage(Mission.ruin1,6000)
                end
 
                if (IsAround(Mission.ruin2)) then
                
                    Damage(Mission.ruin2,6000)
                end
 
                if (IsAround(Mission.ruin3)) then
                           
                    Damage(Mission.ruin3,6000)
                end
 
                if (IsAround(Mission.ruin4)) then
                           
                    Damage(Mission.ruin4,6000)
                
 
                Mission.kill_ruin = true
				end
            else
            
                StopEarthQuake()
                Mission.damage_time = GetTime() + 999999.9
            end
        end
        --------------------------------------------
 
 
        if ((Mission.bomber_reroute) and (not Mission.remove_bomber1) and (Mission.bomber_check < GetTime())) then
        
            Mission.bomber_check = GetTime() + 2.0
 
            if ((IsAround(Mission.bomber1)) and (GetDistance(Mission.bomber1,"bomber_remove1") < 50.0)) then
            
                RemoveObject(Mission.bomber1)
                Mission.remove_bomber1 = true
            end
        end
        --------------------------------------------
 
 
        -- this is when the player returns from the city
 
        if (Mission.temple_message4) then
        
            if ((not Mission.bridge_collapse) and (Mission.return_time < GetTime())) then
            
                Mission.return_time = GetTime() + 2.0
 
 
                if (GetDistance(Mission.player,"bridge_center") < 250.0) then
                
					--pos = GetPosition(cave)
					xfrm = GetTransform(Mission.cave)

                    RemoveObject(Mission.cave)
                    Mission.cave = BuildObject("betunna0",0,xfrm)
					SetTransform(Mission.cave, xfrm)

                    AudioMessage("isdf1137.wav")--(shab) John get back!
                    StartEarthQuake(15.0)
                    Mission.collapse_time = GetTime() + 10.0
                    SetAnimation(Mission.cave,"crumble",1)
					--StartAnimation(Mission.cave)
                    Mission.bridge_collapse = true
                    SetAIP("scionidle.aip", 2)
                end
            end
 
 
            if ((Mission.bridge_collapse) and (not Mission.shab_pissed) and (Mission.collapse_time < GetTime())) then
            
                Mission.talk = AudioMessage("isdf1138.wav")--(shab) Broddock - you've left my man there!
                StopEarthQuake()
                SetObjectiveOff(Mission.recycler)
                Mission.shab_pissed = true
            end
 
 
            if ((Mission.shab_pissed) and (not Mission.shuttle_message) and (IsAudioMessageDone(Mission.talk))) then
            
                Mission.talk = AudioMessage("isdf1139.wav")--(brad) Keep yout shirt on shab - go to the shuttle John!
                ClearObjectives()
                AddObjective("isdf1110.otf", "WHITE")
                Mission.last_check = GetTime() + 1.0
                Mission.rescue_nav = BuildObject("ibnav",1,"last_nav_point")
                SetObjectiveOn(Mission.rescue_nav)
                --TranslateString2(tempstr, sizeof(tempstr), "Mission1105")  -- Dust Site
                SetObjectiveName(Mission.rescue_nav,"Dust Site")
                Mission.dropship = BuildObject("ivpdrop",1,"condor_spawn")
                Mission.shuttle_message = true
            end
        end
 
 
        -- this makes the earth shake when the player is near the cave
 
        if (not Mission.temple_message4) then
        
            if (not Mission.quake_started) then
            
                if (Mission.quake_time < GetTime()) then
                
                    Mission.quake_time = GetTime() + 5.0
 
                    if (GetDistance(Mission.player,"bridge_center") < 80.0) then
                    
                        StartEarthQuake(5.0)
                        Mission.quake_time = GetTime() + 10.0
                        Mission.quake_started = true
                    end
                end
            
            else
            
                if (Mission.quake_time < GetTime()) then
                
                    StopEarthQuake()
                    Mission.quake_time = GetTime() + 15.0
                    Mission.quake_started = false
                end
            end
        end
 
 
        -- these are the win-lose conditions
        if (not Mission.game_over) then
        
            if ((Mission.last_warning) and (Mission.warning_time < GetTime())) then
            
                AudioMessage("isdf1110.wav")--(braddock) if you cannot follow my orders you are dismissed
                FailMission(GetTime() + 15.0)
                Mission.game_over = true
            end
 
 
            if ((Mission.return_message2) and (Mission.across_time < GetTime())) then
            
                AudioMessage("isdf1111.wav") -- (braddock) You have disobeyed my orders
                FailMission(GetTime() + 15.0)
                Mission.game_over = true
            end
 
 
 
            if ((Mission.shuttle_message) and (Mission.last_check < GetTime())) then
            
                Mission.last_check = GetTime() + 1.0
 
                if (GetDistance(Mission.player,Mission.rescue_nav) < 60.0) then
                
                    AudioMessage("isdf1106.wav") -- good job!
                    SetAnimation(Mission.dropship,"deploy",1)
                    ClearObjectives()
                    AddObjective("isdf1110.otf", "GREEN")
                    SucceedMission(GetTime() + 5.0,"isdf11w1.txt")
                    Mission.game_over = true
                end
 
                if (GetDistance(Mission.player,Mission.recycler) < 100.0) then
                
                    AudioMessage("isdf1106.wav") -- good job!
                    ClearObjectives()
                    AddObjective("isdf1110.otf", "RED")
                    AddObjective("isdf1111.otf", "GREEN")
                    SucceedMission(GetTime() + 5.0,"isdf11w1.txt")
                    Mission.game_over = true
					
				end
			end

		end 
    end
	
end