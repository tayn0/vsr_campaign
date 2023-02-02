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
	vo1 = false,
	vo2 = false,
	vo3 = false,
	unitsbuilt = false,
	obj1 = false,
	obj2 = false,	
	bridgegoboom = false,
	bseg1goboom = false,
	bseg2goboom = false,
	bseg3goboom = false,
	bstr1goboom = false,
	bstr2goboom = false,
	bridgegoboomover = false,
	vo5 = false,
	obj3 = false,
	playeratAAN = false,
	playeratbridge = false,
	atankattack = false,
	reroute1 = false,
	reroute1a = false,
	reroute1b = false,
	bridgedone = false,
	spawn2 = false,
	spawn3 = false,
	spawn4 = false,	
	spawn5 = false,
	spawn6 = false,
	spawn7 = false,
	spawn8 = false,
	wave1over = false,
	vo7 = false,
	obj4 = false,
	spire1built = false,
	vo8 = false,
	changeplan1 = false,
	checkturret1alive = false,
	turret1movetime = false,
	checkturret1dead = false,
	turret1go = false,
	checkbasetank1alive = false,
	basetank1alive = false,
	checkbasetank1dead = false,
	basetank1dead = false,
	basetank1go = false,
	checkbasetank2alive = false,
	basetank2alive = false,
	checkbasetank2dead = false,
	basetank2dead = false,
	basetank2go = false,
	checkbasetank3alive = false,
	basetank3alive = false,
	checkbasetank3dead = false,
	basetank3dead = false,
	basetank3go = false,
	pk1attack = false,
	pk2attack = false,
	pk3attack = false,
	aanrecykilled = false,
	vo9 = false,
	obj5 = false,
	wavesover = false,
	vo10 = false,
	obj6 = false,
	pk4attack = false,
	pk5attack = false,
	pk6attack = false,
	pk7attack = false,
	pk8attack = false,
	pk9attack = false,
	pk10attack = false,
	spawn1 = false,
	delay1 = false,
	tank1alive = false,
	tank2alive = false,
	tank3alive = false,
	sent1alive = false,
	sent2alive = false,
	sent3alive = false,
	pkover = false,
	pk10dead = false,
	playersrecy_dead = false,
	vo_recydead = false,
	obj7 = false,
	playertakingtoolong1 = false,
	cin1over = false,
	shot1over = false,
	rdycam1 = false,
	rckt_attack = false,
	rckt_attackcbunk = false,
	player_at_aan_early = false,
	cutvo1 = false,
	pk11attack = false,
	pk12attack = false,
	pk13attack = false,
	pk14attack = false,
	reset_atank1 = false,
	reset_atank2 = false,
	reset_bridge_tanks = false,
	spawn9 = false,
	spawn10 = false,
	spawn11 = false,
	spawn12 = false,
	aan_recy_goboom = false,
	shit = false,
	ass1_attacked = false,
	ass2_attacked = false,
	after_spawn = false,

--  floats
	vo1time = 999999.9,
	vo2time = 999999.9,
	vo3time = 999999.9,
	bstr1boomtime = 999999.9,	
	bstr2boomtime = 999999.9,
	bseg1boomtime = 999999.9,
	bseg2boomtime = 999999.9,
	bseg3boomtime = 999999.9,
	vo5time = 999999.9,
	spawn2time = 999999.9,
	spawn3time = 999999.9,
	spawn4time = 999999.9,
	spawn5time = 999999.9,
	spawn6time = 999999.9,
	spawn7time = 999999.9,
	spawn8time = 999999.9,
	vo7time = 999999.9,
	vo8time = 999999.9,
	ChangePlanTime1 = 999999.9,
	turret1movetime = 999999.9,
	basetank1movetime = 999999.9,
	basetank2movetime = 999999.9,
	basetank3movetime = 999999.9,
	pk1time = 999999.9,
	pk2time = 999999.9,
	pk3time = 999999.9,
	vo9time = 999999.9,
	vo10time = 999999.9,
	pk4time = 999999.9,
	pk5time = 999999.9,
	pk6time = 999999.9,
	pk7time = 999999.9,
	pk8time = 999999.9,
	pk9time = 999999.9,
	pk10time = 999999.9,
	pk11time = 999999.9,
	pk12time = 999999.9,
	pk13time = 999999.9,
	pk14time = 999999.9,
	spawn1time = 999999.9,
	vo_recydeadtime = 999999.9,
	playertakingtoolong1time = 999999.9,
	rckt_attacktime = 999999.9,
	cin1overtime = 999999.9,
	cutvo1time = 999999.9,
	spawn9time = 999999.9,
	spawn10time = 999999.9,
	spawn11time = 999999.9,
	spawn12time = 999999.9,
	aan_recy_goboomtime = 999999.9,
	after_spawntime = 999999.9,
--  handles
	player,
	msg1,
	msg2,
	msg5,
	fvtank1,
	fvtank2,
	fvtank3,
	fvsent1,
	fvsent2,
	fvsent3,
	spawner1,
	spawner2,
	spawner3,
	spawner4,
	spawner5,
	spawner6,
	spawner7,
	spawner8,
	spawner9,
	spawner10,
	spawner11 =  nil,
	spawner12,
	spawner13,
	spawner14,
	spawner15,
	spawner16,
	spawner17,
	spawner18,
	spawner19,
	spawner20,
	spawner21,
	spawner22,
	baseturr1,
	basetank1,
	basetank2,
	basetank3,
	lastspawn1,
	lastspawn2,
	lastspawn3,
	lastspawn4,
	lastspawn5,
	atank1,
	atank2,
	vofail1,
	bseg1,
	bseg2,
	bseg3,
	bstr1,
	bstr2,
	rhino1,
	rhino2,
	rhino3,
	aanbase,
	bridgetank,
	bridgescout,
	spire1site,
	aanrecy,
	playersrecy,
	aan_fact,
	aansbay,
	aanpgen1,
	aanpgen2,
	msg7,
	msg8,
	gspire1,
	pk1,
	pk1b,
	pk2,
	pk2b,
	pk3,
	pk3b,
	pk4,
	pk4b,
	pk5,
	pk5b,
	pk6,
	pk6b,
	pk7,
	pk7b,
	pk8,
	pk8b,
	pk9,
	pk9b,
	pk9c,
	pk10,
	pk10b,
	pk10c,
	pk11,
	pk11b,
	pk11c,
	pk12,
	pk12b,
	pk12c,
	pk13,
	pk13b,
	pk14,
	pk14b,
	msg9,
	msg10,
	msg6,
	death1,
	death2,
	death3,
	death4,
	death5,
	death6,
	death7,
	death8,
	look1,
	aan_cbunk,
	msgcin1,
	aan_cons,
	--Cineractive handles
	aan_cintank1,
	aan_cintank2,
	aan_cinturr1,
	aan_cinturr2,
	aan_cingtow1,
	nr_cinrckt1,
	nr_cinmbike1,
	nr_cinmbike2,
	nr_cintank1,
	nr_cintank2,
	aan_cinscout1

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
	Mission.msg1 = nil
	Mission.msg2 = nil
	Mission.msg5 = nil
	Mission.fvtank1 = nil
	Mission.fvtank2 = nil
	Mission.fvtank3 = nil
	Mission.fvsent1 = nil
	Mission.fvsent2 = nil
	Mission.fvsent3 = nil
	Mission.spawner1 = nil
	Mission.spawner2 = nil
	Mission.spawner3 = nil
	Mission.spawner4 = nil
	Mission.spawner5 = nil
	Mission.spawner6 = nil
	Mission.spawner7 = nil
	Mission.spawner8 = nil
	Mission.spawner9 = nil
	Mission.spawner10 = nil
	Mission.spawner11 =  nil
	Mission.spawner12 = nil
	Mission.spawner13 = nil
	Mission.spawner14 = nil
	Mission.spawner15 = nil
	Mission.spawner16 = nil
	Mission.spawner17 = nil
	Mission.spawner18 = nil
	Mission.spawner19 = nil
	Mission.spawner20 = nil
	Mission.spawner21 = nil
	Mission.spawner22 = nil
	Mission.baseturr1 = nil
	Mission.basetank1 = nil
	Mission.basetank2 = nil
	Mission.basetank3 = nil
	Mission.lastspawn1 = nil
	Mission.lastspawn2 = nil
	Mission.lastspawn3 = nil
	Mission.lastspawn4 = nil
	Mission.lastspawn5 = nil
	Mission.atank1 = nil
	Mission.atank2 = nil
	Mission.vofail1 = nil
	Mission.bseg1 = GetHandle("bseg1")
	Mission.bseg2 = GetHandle("bseg2")
	Mission.bseg3 = GetHandle("bseg3")
	Mission.bstr1 = GetHandle("bstr1")
	SetCurHealth(Mission.bstr1,5000)
	SetMaxHealth(Mission.bstr1,5000)
	Mission.bstr2 = GetHandle("bstr2")
	SetCurHealth(Mission.bstr2,5000)
	SetMaxHealth(Mission.bstr2,5000)
	Mission.rhino1 = GetHandle("rhino1")
	Mission.rhino2 = GetHandle("rhino2")
	Mission.rhino3 = GetHandle("rhino3")
	Mission.aanbase = nil
	Mission.bridgetank = GetHandle("bridgetank")
	Mission.bridgescout = GetHandle("bridgescout")
	Mission.spire1site = nil
	Mission.aanrecy = GetHandle("aanrecy")
	Mission.playersrecy = GetHandle("playersrecy")
	Mission.aan_fact = GetHandle("aan_fact")
	Mission.aansbay = GetHandle("aansbay")
	Mission.aanpgen1 = GetHandle("aanpgen1")
	Mission.aanpgen2 = GetHandle("aanpgen2")
	Mission.msg7 = nil
	Mission.msg8 = nil
	Mission.gspire1 = nil
	Mission.pk1 = nil
	Mission.pk1b = nil
	Mission.pk2 = nil
	Mission.pk2b = nil
	Mission.pk3 = nil
	Mission.pk3b = nil
	Mission.pk4 = nil
	Mission.pk4b = nil
	Mission.pk5 = nil
	Mission.pk5b = nil
	Mission.pk6 = nil
	Mission.pk6b = nil
	Mission.pk7 = nil
	Mission.pk7b = nil
	Mission.pk8 = nil
	Mission.pk8b = nil
	Mission.pk9 = nil
	Mission.pk9b = nil
	Mission.pk9c = nil
	Mission.pk10 = nil
	Mission.pk10b = nil
	Mission.pk10c = nil
	Mission.pk11 = nil
	Mission.pk11b = nil
	Mission.pk11c = nil
	Mission.pk12 = nil
	Mission.pk12b = nil
	Mission.pk12c = nil
	Mission.pk13 = nil
	Mission.pk13b = nil
	Mission.pk14 = nil
	Mission.pk14b = nil
	Mission.msg9 = nil
	Mission.msg10 = nil
	Mission.msg6 = nil
	Mission.death1 = nil
	Mission.death2 = nil
	Mission.death3 = nil
	Mission.death4 = nil
	Mission.death5 = nil
	Mission.death6 = nil
	Mission.death7 = nil
	Mission.death8 = nil
	Mission.look1 = GetHandle("look1")
	Mission.aan_cbunk = GetHandle("aan_cbunk")
	Mission.msgcin1 = nil
	Mission.aan_cons = GetHandle("aan_cons")
	--Cineractive handles
	Mission.aan_cintank1 = GetHandle("aan_cintank1")
	Mission.aan_cintank2 = GetHandle("aan_cintank2")
	Mission.aan_cinturr1 = GetHandle("aan_cinturr1")
	Mission.aan_cinturr2 = GetHandle("aan_cinturr2")
	Mission.aan_cingtow1 = GetHandle("aan_cingtow1")
	Mission.nr_cinrckt1 = GetHandle("nr_cinrckt1")
	Mission.nr_cinmbike1 = GetHandle("nr_cinmbike1")
	Mission.nr_cinmbike2 = GetHandle("nr_cinmbike2")
	Mission.nr_cintank1 = GetHandle("nr_cintank1")
	Mission.nr_cintank2 = GetHandle("nr_cintank2")
	Mission.aan_cinscout1 = GetHandle("aan_cinscout1")

	SetTeamColor(3,0,127,255)  --BRADDOCK

	Mission.playersrecy = UnitToVSR(Mission.playersrecy, "fvrecy_vsr", 0)
	SetGroup(Mission.playersrecy, 2)
	Mission.bridgetank = UnitToVSR(Mission.bridgetank, "ivatank_vsr", 0)
	Mission.bridgescout = UnitToVSR(Mission.bridgescout, "ivscout_vsr", 0)
	Mission.cons = UnitToVSR(GetHandle("unnamed_fvcons"), "fvcons_vsr", 0)
	SetGroup(Mission.cons,0)

	Mission.player = UnitToVSR(Mission.player, "fvsent_vsr", 1)
   
end

function UnitToVSR(h, odf, player)

	PlayerTeam = GetTeamNum(h)
	xfrm = GetTransform(h)
	RemoveObject(h)
	h = BuildObject(odf, PlayerTeam, xfrm)

	if player == 1 then
	SetAsUser(h, PlayerTeam)
	else
	end

	return h

end


function AddObject(h) --This function is called when an object appears in the game. --

	if (Mission.missionstart) then
	

		
--****PLAYER'S VEHICLES****--
		--TANKS

	--[[	if (not Mission.tank1alive) then
		
			if ((IsOdf(h,"fvtank") and (Mission.fvtank1 == nil))) then
			
				Mission.fvtank1 = h
				Mission.tank1alive = true
			end
		end

		elseif (not Mission.tank2alive) then
		
			if ((IsOdf(h,"fvtank") and (Mission.fvtank2 == nil))) then
			
				Mission.fvtank2 = h
				Mission.tank2alive = true
			end
		end

		elseif (not Mission.tank3alive) then
		
			if ((IsOdf(h,"fvtank") and (Mission.fvtank3 == nil))) then
			
				Mission.fvtank3 = h
				Mission.tank3alive = true
			end
		end
		

			--SENTS
		elseif (not Mission.sent1alive) then
		
			if ((IsOdf(h,"fvsent") and (Mission.fvsent1 == nil))) then
			
				Mission.fvsent1 = h
				Mission.sent1alive = true
			end
		end

		elseif (not Mission.sent2alive) then
		
			if ((IsOdf(h,"fvsent") and (Mission.fvsent2 == nil))) then
			
				Mission.fvsent2 = h
				Mission.sent2alive = true
			end
		end
	
		elseif (not Mission.sent3alive) then
		
			if ((IsOdf(h,"fvsent") and (Mission.fvsent3 == nil))) then
			
				Mission.fvsent3 = h
				Mission.sent3alive = true
			end
		end
		]]

		--GUN SPIRES
		if  (IsOdf(h,"fbspir")) then
		
			Mission.gspire1 = h
		end

--****AAN BASE VEHICLES****--
		if ((Mission.baseturr1 == nil) and (GetTeamNum(h) == 2) and (GetDistance(h,"aanbase") < 150) 
		and (IsOdf(h,"ivturr_vsr"))) then
		
			Mission.baseturr1 = h
		end

--TANK1
		if (not Mission.basetank1alive) then
		
			if ((IsOdf(h,"ivtank_vsr")) and (GetTeamNum(h) == 2) and (GetDistance(h,"aanbase") < 150)) then
		
			
				Mission.basetank1 = h
				Mission.basetank1movetime = (GetTime() + 1.4)
				Mission.basetank1go = false
				Mission.basetank1alive = true
			end
		
--TANK2
		elseif (not Mission.basetank2alive) then
		
			if ((IsOdf(h,"ivtank_vsr")) and (GetTeamNum(h) == 2) and (GetDistance(h,"aanbase") < 150)) then
		
			
				Mission.basetank2 = h
				Mission.basetank2movetime = (GetTime() + 1.4)
				Mission.basetank2go = false
				Mission.basetank2alive = true
			end
		
--TANK3
		elseif (not Mission.basetank3alive) then
		
			if ((IsOdf(h,"ivtank_vsr")) and (GetTeamNum(h) == 2) and (GetDistance(h,"aanbase") < 150)) then
		
			
				Mission.basetank3 = h
				Mission.basetank3movetime = (GetTime() + 1.4)
				Mission.basetank3go = false
				Mission.basetank3alive = true
			end
		end

	elseif IsOdf(h, "fvturr") then
		h = UnitToVSR(h, "fvturr_vsr", 0)
		SetGroup(h, 1)

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

--AddScrap(2,10)

	-- INTRO CINERACTIVE SHOWING THE ANN BASE UNDER ATTACK BY BRADDOCK'S FORCES
	if (not Mission.cin1over) then
	
		if (not Mission.shot1over) then
		
			if (not Mission.rdycam1) then
			
				CameraReady()
				Mission.cin1overtime = (GetTime() + 35)
				Retreat(Mission.nr_cinrckt1,"nr_cinrckt1_path")

				SetTeamNum(Mission.nr_cinmbike1,3)
				SetTeamNum(Mission.nr_cinmbike2,3)
				SetTeamNum(Mission.nr_cintank1,3)
				SetTeamNum(Mission.nr_cintank2,3)

				SetTeamNum(Mission.nr_cinrckt1,3)


				SetMaxHealth(Mission.rhino1,1000)
				SetCurHealth(Mission.rhino1,1000)
				SetMaxHealth(Mission.rhino2,1000)
				SetCurHealth(Mission.rhino2,1000)
				SetMaxHealth(Mission.rhino3,1000)
				SetCurHealth(Mission.rhino3,1000)

				Patrol(Mission.rhino1,"rhino1path")
				Patrol(Mission.rhino2,"rhino2path")
				Patrol(Mission.rhino3,"rhino3path")

				SetMaxHealth(Mission.aan_cinscout1,8000)
				SetCurHealth(Mission.aan_cinscout1,8000)
			
				SetMaxHealth(Mission.aan_cintank1,8000)
				SetCurHealth(Mission.aan_cintank1,8000)

				SetMaxHealth(Mission.aan_cintank2,8000)
				SetCurHealth(Mission.aan_cintank2,8000)
				
				SetAvoidType(Mission.nr_cinmbike1,0)
				SetAvoidType(Mission.nr_cinmbike2,0)
				SetAvoidType(Mission.nr_cintank1,0)
				SetAvoidType(Mission.nr_cintank2,0)
				SetAvoidType(Mission.nr_cinrckt1,0)

		
				Attack(Mission.nr_cinmbike1,Mission.aan_cinturr1)
				Attack(Mission.nr_cinmbike2,Mission.aan_cinturr2)

				Attack(Mission.aan_cinturr1,Mission.nr_cinmbike1)

				Attack(Mission.nr_cintank1,Mission.aan_cintank1)
			--	Attack(Mission.aan_cintank1,Mission.nr_cintank1)

				Attack(Mission.nr_cintank2,Mission.aan_cintank2)
			--	Attack(Mission.aan_cintank2,Mission.nr_cintank2)		

				Mission.rckt_attacktime = (GetTime() + 5)
				Mission.cutvo1time = (GetTime() + 3)
				Mission.rdycam1 = true
			end
			
			CameraPath("campath1",2000,700,Mission.look1)
		end

		--cin vo
		if ((not Mission.cutvo1) and (Mission.cutvo1time < GetTime())) then
		
			Mission.msgcin1 = AudioMessage("CutSc0501.wav")
			Mission.cutvo1 = true
		end

	
		
		if ((not Mission.rckt_attack) and (Mission.rckt_attacktime < GetTime())) then
		

			Attack(Mission.nr_cinrckt1,Mission.aan_cingtow1)

			--Attack(Mission.aan_cingtow1,Mission.nr_cinrckt1)
			Mission.rckt_attack = true
		end

		if ((not Mission.rckt_attackcbunk) and (not IsAround(Mission.aan_cingtow1))) then
		
			if (IsAround(Mission.nr_cinrckt1)) then
			
				Attack(Mission.nr_cinrckt1,Mission.aan_cbunk)
			end

	
			
			Mission.rckt_attackcbunk = true
		end

		--this ends the cin
		if ((not Mission.cin1over) and (Mission.cin1overtime < GetTime())) then
		
			CameraFinish()

			--this deletes the CIN units
			if(IsAround(Mission.nr_cintank1)) then
			
				RemoveObject(Mission.nr_cintank1)
			end
			if(IsAround(Mission.nr_cintank2)) then
			
				RemoveObject(Mission.nr_cintank2) 
			end
			if(IsAround(Mission.nr_cinmbike1)) then
			
				RemoveObject(Mission.nr_cinmbike1)
			end
			if(IsAround(Mission.nr_cinmbike2)) then
			
				RemoveObject(Mission.nr_cinmbike2)
			end
			if(IsAround(Mission.nr_cinrckt1)) then
			
				RemoveObject(Mission.nr_cinrckt1)
			end

			if(IsAround(Mission.aan_cintank1)) then
			
				RemoveObject(Mission.aan_cintank1)
			end
			if(IsAround(Mission.aan_cintank2)) then
			
				RemoveObject(Mission.aan_cintank2)
			end
			if(IsAround(Mission.aan_cinscout1)) then
			
				RemoveObject(Mission.aan_cinscout1)
			end
			if(IsAround(Mission.aan_cinturr1)) then
			
				RemoveObject(Mission.aan_cinturr1)
			end
			if(IsAround(Mission.aan_cinturr2)) then
			
				RemoveObject(Mission.aan_cinturr2)
			end

			Mission.shot1over = true
			Mission.cin1over = true		
		end

	--if the user hits spacebar to bypass the cin... then
		if ((CameraCancelled() and (not Mission.cin1over))) then
		
			CameraFinish()
			
			--this deletes the CIN units
			if(IsAround(Mission.nr_cintank1)) then
			
				RemoveObject(Mission.nr_cintank1) 
			end 
			if(IsAround(Mission.nr_cintank2)) then
			
				RemoveObject(Mission.nr_cintank2)
			end
			if(IsAround(Mission.nr_cinmbike1)) then
			
				RemoveObject(Mission.nr_cinmbike1)
			end
			if(IsAround(Mission.nr_cinmbike2)) then
			
				RemoveObject(Mission.nr_cinmbike2)
			end
			if(IsAround(Mission.nr_cinrckt1)) then
			
				RemoveObject(Mission.nr_cinrckt1)
			end

			if(IsAround(Mission.aan_cintank1)) then
			 
				RemoveObject(Mission.aan_cintank1)
			end
			if(IsAround(Mission.aan_cintank2)) then
			
				RemoveObject(Mission.aan_cintank2)
			end
			if(IsAround(Mission.aan_cinscout1)) then
			
				RemoveObject(Mission.aan_cinscout1)
			end
			if(IsAround(Mission.aan_cinturr1)) then
			
				RemoveObject(Mission.aan_cinturr1)
			end
			if(IsAround(Mission.aan_cinturr2)) then
			
				RemoveObject(Mission.aan_cinturr2)
			end

			if ((Mission.cutvo1) and (not IsAudioMessageDone(Mission.msgcin1))) then
			
				StopAudioMessage(Mission.msgcin1)
			end
			Mission.shot1over = true
			Mission.cin1over = true
		end
	end


	-- after the intro cineractive, the mission begins
	if ((not Mission.missionstart) and (Mission.cin1over)) then
	
		Ally(1,2)
		--first i replace/build all the AAN base units so that they appear blue on Mission.player's radar in the mission (big ol workaround)
		if (IsAround(Mission.aan_cingtow1)) then
		
			RemoveObject(Mission.aan_cingtow1)
		end

		if (IsAround(Mission.aan_cbunk)) then
		
			RemoveObject(Mission.aan_cbunk)
		end

		if (IsAround(Mission.aan_cons)) then
		
			RemoveObject(Mission.aan_cons)
		end

		Mission.aan_cingtow1 = BuildObject("ibgtow_vsr",2,"aigtow")--gtow
		Mission.aan_cbunk = BuildObject("ibcbun_vsr",2,"aicbun")--com bunk
		Mission.aan_cons = BuildObject("ivcons_vsr",2,"aan_cons")--com bunk

		--factory
		pos_aan_fact = GetTransform(Mission.aan_fact)
		RemoveObject(Mission.aan_fact)
		Mission.aan_fact = BuildObject("ibfact_vsr",2,pos_aan_fact)

		--pgen1
		pos_aanpgen1 = GetTransform(Mission.aanpgen1)
		RemoveObject(Mission.aanpgen1)
		Mission.aanpgen1 = BuildObject("ibpgen_vsr",2,pos_aanpgen1)

		--pgen2
		pos_aanpgen2 = GetTransform(Mission.aanpgen2)
		RemoveObject(Mission.aanpgen2)
		Mission.aanpgen2 = BuildObject("ibpgen_vsr",2,pos_aanpgen2)

		--recy
		pos_aan_recy = GetTransform(Mission.aanrecy)
		RemoveObject(Mission.aanrecy)
		Mission.aanrecy = BuildObject("ibrecy_vsr",2,pos_aan_recy)

		--sbay
		pos_aan_recy = GetTransform(Mission.aansbay)
		RemoveObject(Mission.aansbay)
		Mission.aansbay = BuildObject("ibsbay_vsr",2,pos_aan_sbay)

		SetScrap(1,40)
		SetScrap(2,40)
		Mission.vo1time = (GetTime() + 3)
		Mission.vo3time = (GetTime() + 60)
		Mission.pk1time = (GetTime() + 70)
		SetAIP("scion0501.aip",2)
		Mission.missionstart = true
	end

	--Scout attacks on Mission.player's base near the beginning of mission
	if (not Mission.pkover) then
	
		if ((not Mission.pk1attack) and (Mission.pk1time < GetTime())) then
		
			Mission.pk1 = BuildObject("ivscout_vsr",3,"pk1")
			SetSkill(Mission.pk1,1)
			Goto(Mission.pk1,"playerbase")
			Mission.pk2time = (GetTime() + 60)
			Mission.pk1attack = true
		end

		if ((not Mission.pk2attack) and (Mission.pk2time < GetTime())) then
		
			Mission.pk2 = BuildObject("ivscout_vsr",3,"pk2")
			Mission.pk2b = BuildObject("ivscout_vsr",3,"pk3")
			SetSkill(Mission.pk2,1)
			SetSkill(Mission.pk2b,2)
			Goto(Mission.pk2,"playerbase")
			Goto(Mission.pk2b,"playerbase")
			Mission.pk3time = (GetTime() + 60)
			Mission.pk2attack = true
		end

		if ((not Mission.pk3attack) and (Mission.pk3time < GetTime())) then
		
			AudioMessage("scion0504.wav")  --Manson -- "We just lost a guntowernot "
			Mission.pk3 = BuildObject("ivmbike_vsr",3,"pk1")
			SetSkill(Mission.pk3,1)
			Goto(Mission.pk3,"playerbase")
			Mission.pk4time = (GetTime() + 75)
			Mission.pk3attack = true
		end

		if ((not Mission.pk4attack) and (Mission.pk4time < GetTime())) then
		
			Mission.pk4 = BuildObject("ivtank_vsr",3,"pk1")
			Mission.pk4b = BuildObject("ivmbike_vsr",3,"pk1")
			SetSkill(Mission.pk4,1)
			SetSkill(Mission.pk4b,1)
			Goto(Mission.pk4,"playerbase")
			Goto(Mission.pk4b,"playerbase")
			Mission.pk5time = (GetTime() + 60)
			Mission.pk4attack = true
		end

		if ((not Mission.pk5attack) and (Mission.pk5time < GetTime())) then
		
			Mission.pk5 = BuildObject("ivscout_vsr",3,"pk2")
			Mission.pk5b = BuildObject("ivtank_vsr",3,"pk1")
			SetSkill(Mission.pk5,1)
			SetSkill(Mission.pk5b,1)
			Goto(Mission.pk5,"playerbase")
			Goto(Mission.pk5b,"playerbase")
			Mission.pk6time = (GetTime() + 85)
			Mission.pk5attack = true
		end

		if ((not Mission.pk6attack) and (Mission.pk6time < GetTime())) then
		
			Mission.pk6 = BuildObject("ivscout_vsr",3,"pk1")
			Mission.pk6b = BuildObject("ivscout_vsr",3,"pk2")
			SetSkill(Mission.pk6,1)
			SetSkill(Mission.pk6b,1)
			Goto(Mission.pk6,"playerbase")
			Goto(Mission.pk6b,"playerbase")
			Mission.pk7time = (GetTime() + 70)
			Mission.pk6attack = true
		end

		if ((not Mission.pk7attack) and (Mission.pk7time < GetTime())) then
		
			Mission.pk7 = BuildObject("ivmbike_vsr",3,"pk1")
			Mission.pk7b = BuildObject("ivtank_vsr",3,"pk1b")
			SetSkill(Mission.pk7,2)
			SetSkill(Mission.pk7b,1)
			Goto(Mission.pk7,"playerbase")
			Goto(Mission.pk7b,"playerbase")
			Mission.pk8time = (GetTime() + 65)
			Mission.pk7attack = true
		end
		
		if ((not Mission.pk8attack) and (Mission.pk8time < GetTime())) then
		
			Mission.pk8 = BuildObject("ivtank_vsr",3,"pk1")
			Mission.pk8b = BuildObject("ivtank_vsr",3,"pk2")
			SetSkill(Mission.pk8,1)
			SetSkill(Mission.pk8b,2)
			Goto(Mission.pk8,"playerbase")
			Goto(Mission.pk8b,"playerbase")
			Mission.pk9time = (GetTime() + 3)
			Mission.pk8attack = true
		end	

		if ((not Mission.pk9attack) and (Mission.pk9time < GetTime())) then
		
			Mission.pk9 = BuildObject("ivscout_vsr",3,"pk1")
			Mission.pk9b = BuildObject("ivscout_vsr",3,"pk1")
			SetSkill(Mission.pk9,1)
			SetSkill(Mission.pk9b,2)
			Goto(Mission.pk9,"playerbase")
			Goto(Mission.pk9b,"playerbase")
			Mission.pk10time = (GetTime() + 20)
			Mission.pk9attack = true
		end
		
		if ((not Mission.pk10attack) and (Mission.pk10time < GetTime())) then
		
			AudioMessage("scion0512.wav")-- Manson We just lost powernot 
			Mission.pk10 = BuildObject("ivtank_vsr",3,"pk2")
			Mission.pk10b = BuildObject("ivscout_vsr",3,"pk2")
			Mission.pk10c = BuildObject("ivmbike_vsr",3,"pk2")
			SetSkill(Mission.pk10,1)
			SetSkill(Mission.pk10b,1)
			SetSkill(Mission.pk10c,2)
			Goto(Mission.pk10,"playerbase")
			Goto(Mission.pk10b,"playerbase")
			Goto(Mission.pk10c,"playerbase")
			Mission.pk11time = (GetTime() + 60)
			Mission.pk10attack = true

		end

		if ((not Mission.pk11attack) and (Mission.pk11time < GetTime())) then
		
			Mission.pk11 = BuildObject("ivtank_vsr",3,"pk2")
			Mission.pk11b = BuildObject("ivtank_vsr",3,"pk4")
			Mission.pk11c = BuildObject("ivmbike_vsr",3,"pk1")
			SetSkill(Mission.pk11,2)
			SetSkill(Mission.pk11b,2)
			SetSkill(Mission.pk11c,1)
			Goto(Mission.pk11,"playerbase")
			Goto(Mission.pk11b,"playerbase")
			Goto(Mission.pk11c,"playerbase")
			Mission.pk12time = (GetTime() + 50)
			Mission.pk11attack = true

		end

		if ((not Mission.pk12attack) and (Mission.pk12time < GetTime())) then
		
			Mission.pk12 = BuildObject("ivtank_vsr",3,"pk2")
			Mission.pk12b = BuildObject("ivtank_vsr",3,"pk4")
			Mission.pk12c = BuildObject("ivmbike_vsr",3,"pk4b")
			SetSkill(Mission.pk12,2)
			SetSkill(Mission.pk12b,2)
			SetSkill(Mission.pk12c,2)
			Goto(Mission.pk12,"playerbase")
			Goto(Mission.pk12b,"playerbase")
			Goto(Mission.pk12c,"playerbase")
			Mission.vo2time = (GetTime() + 70)
			Mission.pk12attack = true
			Mission.pkover = true
		end
	end
	
	------[[******--
	----
	if ((not Mission.vo1) and (Mission.vo1time < GetTime())) then
	
		Mission.msg1 = AudioMessage("scion0501.wav") --scion0501.wav We have no time to waste
		Mission.vo1 = true
	end

	if ((not Mission.obj1) and (Mission.vo1) and (IsAudioMessageDone(Mission.msg1))) then
	
		ClearObjectives()
		AddObjective("scion0501.otf", "WHITE")--/  Build your base as quickly as possible.
		Mission.obj1 = true
	end

	if ((not Mission.vo3) and (Mission.vo3time < GetTime())) then
	
		AudioMessage("scion0503.wav") -- scion0503.wav  (AAN BASE)  "Shabayev, hurry with that support, We are taking massive hits."
		Mission.vo3 = true
	end



--/telling Mission.player "go blow up bridge"
	if ((not Mission.vo2) and (Mission.vo2time < GetTime())) then
	
		Mission.msg2 = AudioMessage("scion0502.wav") -- scion0502.wav --  Ok, there is an ISDF bridge that braddock is using to easily get his forces to the AAN base, lets take it out.  It won't stop him completely but it will slow down his forces.  I'm giving you the coordinates, destroy that bridge.
		Mission.after_spawntime = (GetTime() + 120)
		SetTeamNum(Mission.bseg1,5)
		SetTeamNum(Mission.bseg2,5)
		SetTeamNum(Mission.bseg3,5)
		SetTeamNum(Mission.bstr1,5)
		SetTeamNum(Mission.bstr2,5)
		Mission.vo2 = true
	end

	if ((not Mission.obj2) and (Mission.vo2) and (IsAudioMessageDone(Mission.msg2))) then
	
		ClearObjectives()
		AddObjective("scion0502.otf", "WHITE") -- Destroy the ISDF bridge
		SetObjectiveOn(Mission.bseg2)
		tempstr = TranslateString("MissionS0501")  -- ISDF Bridge
		SetObjectiveName(Mission.bseg2,tempstr)
		Mission.playertakingtoolong1time = (GetTime() + 250) --CHANGE THISnot not not 
		Mission.obj2 = true
	end

	--this will spawn in a couple scouts to harras the players base after he has left base
	if ((not Mission.after_spawn) and (Mission.vo2) and (Mission.after_spawntime < GetTime())) then
	
		Mission.pk1 = BuildObject("ivscout_vsr",3,"pk4")	
		SetSkill(Mission.pk1,2)
		Goto(Mission.pk1,"playerbase")
		Mission.after_spawntime = (GetTime() + 250)
	end

	--if Mission.player takes too long in getting to bridge and begin defending, I spawn a huge then
	--force to nuke the AAN base
	if ((not Mission.playertakingtoolong1) and (not Mission.playeratbridge) and (Mission.playertakingtoolong1time < GetTime())) then
	
		Mission.death1 = BuildObject("ivmisl_vsr",3,"death1")	
		Mission.death2 = BuildObject("ivmisl_vsr",3,"death2")
		Mission.death3 = BuildObject("ivmisl_vsr",3,"death3")
		Mission.death4 = BuildObject("ivmisl_vsr",3,"death4")
		Mission.death5 = BuildObject("ivatank_vsr",3,"death5")
		Mission.death6 = BuildObject("ivatank_vsr",3,"death6")
		Mission.death7 = BuildObject("ivatank_vsr",3,"death7")
		Mission.death8 = BuildObject("ivatank_vsr",3,"death8")

		SetMaxHealth(Mission.death5,10000)
		SetCurHealth(Mission.death5,10000)
		SetMaxHealth(Mission.death6,10000)
		SetCurHealth(Mission.death6,10000)
		SetMaxHealth(Mission.death7,10000)
		SetCurHealth(Mission.death7,10000)
		SetMaxHealth(Mission.death8,10000)
		SetCurHealth(Mission.death8,10000)

		SetSkill(Mission.death1,3)
		SetSkill(Mission.death2,3)
		SetSkill(Mission.death3,3)
		SetSkill(Mission.death4,3)
		SetSkill(Mission.death5,3)
		SetSkill(Mission.death6,3)
		SetSkill(Mission.death7,3)
		SetSkill(Mission.death8,3)

		SetAvoidType(Mission.death1,0)
		SetAvoidType(Mission.death2,0)
		SetAvoidType(Mission.death3,0)
		SetAvoidType(Mission.death4,0)
		SetAvoidType(Mission.death5,0)
		SetAvoidType(Mission.death6,0)
		SetAvoidType(Mission.death7,0)
		SetAvoidType(Mission.death8,0)

		Attack(Mission.death1,Mission.aanrecy)
		Attack(Mission.death2,Mission.aanrecy)
		Attack(Mission.death3,Mission.aanrecy)
		Attack(Mission.death4,Mission.aanrecy)
		Attack(Mission.death5,Mission.aanrecy)
		Attack(Mission.death6,Mission.aanrecy)
		Attack(Mission.death7,Mission.aanrecy)
		Attack(Mission.death8,Mission.aanrecy)
		Mission.shit = true

		Mission.aan_recy_goboomtime = (GetTime() + 50)

		Mission.playertakingtoolong1 = true
	end

	--if the Mission.player goes to the AAN base too early, I spawn in the same spawn  then
	--to NUKE the base (bad playernot )
	if ((not Mission.player_at_aan_early) and (not Mission.vo2) and (GetDistance(Mission.player,"aanbase") < 200)) then
	
		Mission.death1 = BuildObject("ivmisl_vsr",3,"death1")	
		Mission.death2 = BuildObject("ivmisl_vsr",3,"death2")
		Mission.death3 = BuildObject("ivmisl_vsr",3,"death3")
		Mission.death4 = BuildObject("ivmisl_vsr",3,"death4")
		Mission.death5 = BuildObject("ivatank_vsr",3,"death5")
		Mission.death6 = BuildObject("ivatank_vsr",3,"death6")
		Mission.death7 = BuildObject("ivatank_vsr",3,"death7")
		Mission.death8 = BuildObject("ivatank_vsr",3,"death8")

		SetMaxHealth(Mission.death5,10000)
		SetCurHealth(Mission.death5,10000)
		SetMaxHealth(Mission.death6,10000)
		SetCurHealth(Mission.death6,10000)
		SetMaxHealth(Mission.death7,10000)
		SetCurHealth(Mission.death7,10000)
		SetMaxHealth(Mission.death8,10000)
		SetCurHealth(Mission.death8,10000)


		SetSkill(Mission.death1,3)
		SetSkill(Mission.death2,3)
		SetSkill(Mission.death3,3)
		SetSkill(Mission.death4,3)
		SetSkill(Mission.death5,3)
		SetSkill(Mission.death6,3)
		SetSkill(Mission.death7,3)
		SetSkill(Mission.death8,3)

		SetAvoidType(Mission.death1,0)
		SetAvoidType(Mission.death2,0)
		SetAvoidType(Mission.death3,0)
		SetAvoidType(Mission.death4,0)
		SetAvoidType(Mission.death5,0)
		SetAvoidType(Mission.death6,0)
		SetAvoidType(Mission.death7,0)
		SetAvoidType(Mission.death8,0)

		Attack(Mission.death1,Mission.aanrecy)
		Attack(Mission.death2,Mission.aanrecy)
		Attack(Mission.death3,Mission.aanrecy)
		Attack(Mission.death4,Mission.aanrecy)
		Attack(Mission.death5,Mission.aanrecy)
		Attack(Mission.death6,Mission.aanrecy)
		Attack(Mission.death7,Mission.aanrecy)
		Attack(Mission.death8,Mission.aanrecy)
		Mission.shit = true

		Mission.aan_recy_goboomtime = (GetTime() + 50)

		Mission.player_at_aan_early = true
	end

	--nuking the ann recycler as a result of the above
	if ((Mission.shit) and (not Mission.aan_recy_goboom) and  (Mission.aan_recy_goboomtime) < GetTime()) then
	
		Damage(Mission.aanrecy,999999)
		Mission.aan_recy_goboom = true
	end

----spawning in 2 IVATANK to be crossing the bridge when the Mission.player is there
	if ((not Mission.playeratbridge) and (Mission.vo2) and (GetDistance(Mission.player,Mission.bstr1) < 190)) then
	
		Mission.atank1 = BuildObject("ivatank_vsr",3,"atankspawn")
		Mission.atank2 = BuildObject("ivatank_vsr",3,"atankspawn2")
		SetMaxHealth(Mission.atank1,4500)
		SetCurHealth(Mission.atank1,4500)
		SetMaxHealth(Mission.atank2,4500)
		SetCurHealth(Mission.atank2,4500)
		SetSkill(Mission.atank1,1)
		SetSkill(Mission.atank2,1)
		Retreat(Mission.atank1,"bridgepath")
		Retreat(Mission.atank2,"bridgepath")
		Mission.playeratbridge = true
	end

	--if Mission.player attacks the ASSTANKS before they can cross the bridge, their then
	--independance gets set back to 1

	if ((not Mission.ass1_attacked) and (Mission.playeratbridge) and (GetCurHealth(Mission.atank1) < 4450)) then
	
		SetIndependence(Mission.atank1,1)
		Mission.ass1_attacked = true
	end

	if ((not Mission.ass2_attacked) and (Mission.playeratbridge) and (GetCurHealth(Mission.atank2) < 4450)) then
	
		SetIndependence(Mission.atank2,1)
		Mission.ass2_attacked = true
	end


--This sets the Ass Tanks independance back to 1 after i've told them to retreat over the bridge
	if ((not Mission.reset_bridge_tanks) and (Mission.playeratbridge)) then
	
		if ((not Mission.reset_atank1) and (GetDistance(Mission.atank1,"endbridgepath") < 25)) then
		
			SetIndependence(Mission.atank1,1)
			Mission.reset_atank1 = true
		end

		if ((not Mission.reset_atank2) and (GetDistance(Mission.atank2,"endbridgepath") < 25)) then
		
			SetIndependence(Mission.atank2,1)
			Mission.reset_atank2 = true
		end

		if ((Mission.reset_atank1) and (Mission.reset_atank2)) then
		
			Mission.reset_bridge_tanks = true
		end
	end
--if Mission.player destroys bridge before the atanks can cross, they are just told to Goto the Mission.player then
	if ((not Mission.reroute1) and (Mission.playeratbridge) and (Mission.bridgegoboomover)) then
	
		if (IsAround(Mission.atank1)) then
		
			Goto(Mission.atank1,"player")
		end

		if (IsAround(Mission.atank2)) then
		
			Goto(Mission.atank2,"player")
		end	

		Mission.reroute1 = true
	end
--when bridge is destroyed and the area is clear
	if ((not Mission.bridgedone) and (Mission.bridgegoboomover) and (Mission.playeratbridge) and
		(not IsAround(Mission.bridgetank) and (not IsAround(Mission.bridgescout) and (not IsAround(Mission.atank1)
		and (not IsAround(Mission.atank2)))))) then
	
		Mission.vo5time = (GetTime() + 5)
		Mission.bridgedone = true
	end


	if ((not Mission.vo5) and (Mission.vo2) and (Mission.vo5time < GetTime())) then
	
		Mission.msg5 = AudioMessage("scion0505.wav")	-- scion0505.wav Good job cook. That won't stop them completely but it will slow them down.  Now, go to the AAN base and help defend it from the incoming wavesnot 
		Mission.vo5 = true
	end

	if ((not Mission.obj3) and (Mission.vo5) and (IsAudioMessageDone(Mission.msg5))) then
	
		ClearObjectives()
		AddObjective("scion0503.otf", "WHITE") -- Goto the AAN base and help in it's defense against Braddock's forces.	
		Mission.aanbase = BuildObject("ibnav",1,"aan_base")
		SetObjectiveOn(Mission.aanbase)
		tempstr = TranslateString("MissionS0502")  -- AAN Base
		SetObjectiveName(Mission.aanbase,tempstr)
		Mission.obj3 = true
	end

--/ Player reaches the AAN base
	if ((not Mission.playeratAAN) and (Mission.vo5) and (GetDistance(Mission.player,"aanbase") < 200)) then
	  --WAVE 1
		Mission.msg6 = AudioMessage("scion0506.wav") -- scion0506.wav AAN BASE.  Cook, thank god you are here.  Help us stave off Braddock's forcesnot   I'm having my recycler make some repair and ammo  pods for you, to help you through the next few waves.  
		SetAIP("scion0502.aip",2)
		Mission.ChangePlanTime1 = (GetTime() + 50)
		SetObjectiveOff(Mission.aanbase)
		Mission.playeratAAN = true
	end

	if ((not Mission.delay1) and (Mission.playeratAAN) and (IsAudioMessageDone(Mission.msg6))) then
	
		Mission.vo7time = (GetTime() +5)
		Mission.delay1 = true
	end

--SHAB IS TELLING COOK TO BUILD A GUN SPIRE AT THE LOCATION SHE GIVES
	if ((not Mission.vo7) and (Mission.vo7time < GetTime())) then
	
		Mission.msg7 = AudioMessage("scion0507.wav") -- scion0507 SHAB FROM SCION BASE - Cook, I want you to build a Gun Spire near the main chokepoint into the AAN base, I will objectify just where I want you to build it.  This should help you considerably.
		Mission.spawn1time = (GetTime() + 2)
		Mission.vo7 = true
	end

	if ((not Mission.obj4) and (Mission.vo7) and (IsAudioMessageDone(Mission.msg7))) then
	
		Mission.spire1site = BuildObject("ibnav",1,"spire1site")
		ClearObjectives()
		AddObjective("scion0504.otf", "WHITE") -- build a gun spire at the specified location
		SetObjectiveOn(Mission.spire1site)
		tempstr = TranslateString("MissionS0503")  -- Gun Spire Site
		SetObjectiveName(Mission.spire1site,tempstr)
		Mission.obj4 = true
	end

	--Checking to see when the spire is built
	if ((not Mission.spire1built) and (Mission.vo7) and (IsAround(Mission.gspire1) and (GetDistance(Mission.gspire1,"spire1site") < 200))) then
	
		Mission.vo8time = (GetTime() + 3)
		Mission.spire1built = true
	end

	if ((not Mission.vo8) and (Mission.vo8time < GetTime())) then
	
		AudioMessage("scion0508.wav")	-- scion0508.wav Good job, now just try to hold off the rest of the waves. (confirmation of spire being built)
		SetObjectiveOff(Mission.spire1site)
		ClearObjectives()
		AddObjective("scion0504a.otf", "WHITE")
		AddObjective("scion0504b.otf", "GREEN")
		Mission.vo8 = true
	end

	--/This changes the plan back to the default plan after the AAN base has made health for Mission.player
	if ((not Mission.changeplan1) and (Mission.ChangePlanTime1 < GetTime())) then
	
		SetAIP("scion0501.aip",2)	
		Mission.changeplan1 = true
	end

	--incoming waves of braddock's forces VS the AAN base
	--WAVE 1
	if (Mission.playeratAAN) then
	
		if ((not Mission.spawn1) and (Mission.spawn1time < GetTime())) then
		
			Mission.spawner1 = BuildObject("ivtank_vsr",3,"spawn4")
			Mission.spawner2 = BuildObject("ivtank_vsr",3,"spawn1")
			SetSkill(Mission.spawner1,1)
			SetSkill(Mission.spawner2,1)
			Goto(Mission.spawner1,"aanbase")
			Goto(Mission.spawner2,"aanbase")
			Mission.spawn2time = (GetTime() + 60)
			Mission.spawn3time = (GetTime() + 145)
			Mission.spawn4time = (GetTime() + 245)
			Mission.spawn5time = (GetTime() + 350)
			Mission.spawn6time = (GetTime() + 450)
			Mission.spawn7time = (GetTime() + 550)
			Mission.spawn8time = (GetTime() + 655)
			Mission.spawn9time = (GetTime() + 755)
			Mission.spawn10time = (GetTime() + 850)
		--	Mission.spawn11time = (GetTime() + 690)
		--	Mission.spawn12time = (GetTime() + 690)
			Mission.spawn1 = true
		
		end

		--WAVE 2
		if ((not Mission.spawn2) and (Mission.spawn2time < GetTime())) then
		
			Mission.spawner4 = BuildObject("ivatank_vsr",3,"spawn4")
			Mission.spawner5 = BuildObject("ivatank_vsr",3,"spawn3")	
			SetSkill(Mission.spawner4,1)
			SetSkill(Mission.spawner5,1)
			Goto(Mission.spawner4,"trackedpath")
			Goto(Mission.spawner5,"trackedpath")
			Mission.spawn2 = true
		end

	-- WAVES 3 - 8 ATTACKING THE AAN BASE
		if ((not Mission.spawn3) and (Mission.spawn3time < GetTime())) then
		
			Mission.spawner6 = BuildObject("ivscout_vsr",3,"pk1")	
			Mission.spawner7 = BuildObject("ivtank_vsr",3,"below1")
			Mission.spawner8 = BuildObject("ivtank_vsr",3,"below2")
			SetSkill(Mission.spawner6,0)
			SetSkill(Mission.spawner7,0)
			SetSkill(Mission.spawner8,1)
			Goto(Mission.spawner6,"hoverpath")
			Goto(Mission.spawner7,"hoverpath")
			Goto(Mission.spawner8,"hoverpath")
			Mission.spawn3 = true
		end

		if ((not Mission.spawn4) and (Mission.spawn4time < GetTime())) then
		
			Mission.spawner9 = BuildObject("ivtank_vsr",3,"death7")	
			Mission.spawner10 = BuildObject("ivscout_vsr",3,"death8")
			SetSkill(Mission.spawner9,1)
			SetSkill(Mission.spawner10,1)
			Goto(Mission.spawner9,"hoverpath")
			Goto(Mission.spawner10,"hoverpath")
			Mission.spawn4 = true
		end

		if ((not spawn5) and (Mission.spawn5time < GetTime())) then
		
			Mission.spawner11 = BuildObject("ivtank_vsr",3,"below1")	
			Mission.spawner12 = BuildObject("ivtank_vsr",3,"below2")

			Mission.spawner14 = BuildObject("ivscout_vsr",3,"spawn3")		
			SetSkill(Mission.spawner11,1)
			SetSkill(Mission.spawner12,1)

			SetSkill(Mission.spawner14,1)		
			Goto(Mission.spawner11,"hoverpath")
			Goto(Mission.spawner12,"hoverpath")

			Goto(Mission.spawner14,"hoverpath")
			spawn5 = true
		end

		if ((not Mission.spawn6) and (Mission.spawn6time < GetTime())) then
		
			Mission.spawner13 = BuildObject("ivtank_vsr",3,"spawn2")
			Mission.spawner15 = BuildObject("ivtank_vsr",3,"spawn4")	
			Mission.spawner16 = BuildObject("ivtank_vsr",3,"spawn1")
			SetSkill(Mission.spawner13,1)	
			SetSkill(Mission.spawner15,1)
			SetSkill(Mission.spawner16,1)
			Goto(Mission.spawner13,"hoverpath")
			Goto(Mission.spawner15,"hoverpath")
			Goto(Mission.spawner16,"hoverpath")
			Mission.spawn6 = true
		end

		if ((not Mission.spawn7) and (Mission.spawn7time < GetTime())) then
		
			Mission.spawner17 = BuildObject("ivtank_vsr",3,"pk1")	
			Mission.spawner18 = BuildObject("ivatank_vsr",3,"spawn1")
			Mission.spawner19 = BuildObject("ivatank_vsr",3,"spawn2")
			SetSkill(Mission.spawner17,1)
			SetSkill(Mission.spawner18,1)
			SetSkill(Mission.spawner19,2)
			Goto(Mission.spawner17,"hoverpath")
			Goto(Mission.spawner18,"trackedpath")
			Goto(Mission.spawner19,"trackedpath")
			Mission.spawn7 = true
		end

		if ((not Mission.spawn8) and (Mission.spawn8time < GetTime())) then
		
			Mission.spawner20 = BuildObject("ivwalk_vsr",3,"walk2spawn")	
			Mission.spawner21 = BuildObject("ivwalk_vsr",3,"walk1spawn")
			Mission.spawner22 = BuildObject("ivtank_vsr",3,"spawn1")
			SetSkill(Mission.spawner20,1)
			SetSkill(Mission.spawner21,1)
			SetSkill(Mission.spawner22,2)
			Goto(Mission.spawner20,"walkerpath")
			Goto(Mission.spawner21,"walkerpath")
			Goto(Mission.spawner22,"hoverpath")
			Mission.spawn8 = true
		end

		if ((not Mission.spawn9) and (Mission.spawn9time < GetTime())) then
		
			Mission.spawner1 = BuildObject("ivwalk_vsr",3,"walk2spawn")	
			Mission.spawner2 = BuildObject("ivwalk_vsr",3,"walk1spawn")
			Mission.spawner3 = BuildObject("ivatank_vsr",3,"below1")
			SetSkill(Mission.spawner1,1)
			SetSkill(Mission.spawner2,1)
			SetSkill(Mission.spawner3,2)
			Goto(Mission.spawner1,"walkerpath")
			Goto(Mission.spawner2,"walkerpath")
			Goto(Mission.spawner3,"hoverpath")
			Mission.after_spawn = true
			Mission.spawn9 = true
		end

		if ((not Mission.spawn10) and (Mission.spawn10time < GetTime())) then
		
			Mission.lastspawn1 = BuildObject("ivwalk_vsr",3,"walk2spawn")	
			Mission.lastspawn2 = BuildObject("ivwalk_vsr",3,"walk1spawn")
			Mission.lastspawn3 = BuildObject("ivatank_vsr",3,"spawn1")
			SetSkill(Mission.lastspawn1,1)
			SetSkill(Mission.lastspawn2,1)
			SetSkill(Mission.lastspawn3,2)
			Goto(Mission.lastspawn1,"walkerpath")
			Goto(Mission.lastspawn2,"walkerpath")
			Goto(Mission.lastspawn3,"hoverpath")
			Mission.spawn10 = true
		end
	end

--****CONDITIONS FOR MISSION WIN****--
	--When all of Braddocks waves have been killed and tha AAN base is OK
	if ((not Mission.wavesover) and (Mission.spawn10) and (not IsAround(Mission.lastspawn1) and (not IsAround(Mission.lastspawn2)
		and (not IsAround(Mission.lastspawn3))))) then
	
		Mission.vo10time = (GetTime() + 5)
		Mission.wavesover = true
	end

	if ((not Mission.vo10) and (Mission.vo10time < GetTime())) then
	
		Mission.msg10 = AudioMessage("scion0510.wav")	-- scion0510.wav "it appears we've defeated the bulk of braddock's forces...."
		Mission.vo10 = true
	end

	if ((not Mission.obj6) and (Mission.vo10) and (IsAudioMessageDone(Mission.msg10))) then
	
		ClearObjectives()
		AddObjective("scion0506.otf", "WHITE") -- MISSION ACCOMPLISHED
		SucceedMission(GetTime() + 15,"scion05w1.txt")
		Mission.obj6 = true
	end

	--****CONDITIONS FOR MISSION FAILURE****--/
-- if the AAN recycler is destroyed.. then
	if ((not Mission.aanrecykilled) and (Mission.missionstart) and (not IsAround(Mission.aanrecy))) then
	
		Mission.vo9time = (GetTime() + 5)
		Mission.aanrecykilled = true
	end

	if ((not Mission.vo9) and (Mission.vo9time < GetTime())) then
	
		Mission.msg9 = AudioMessage("scion0509.wav")	-- scion0509.wav The AAN recylcer has been destroyednot  
		Mission.vo9 = true
	end

	if ((not Mission.obj5) and (Mission.vo9) and (IsAudioMessageDone(Mission.msg9))) then
	
		ClearObjectives()
		AddObjective("scion0505.otf", "WHITE")
		FailMission(GetTime() + 5,"scion05L1.txt")
		Mission.obj5 = true
	end

	--if the Mission.player's recycler is ever destroyed then --MISSION FAILED then
	if ((not Mission.playersrecy_dead) and (not IsAround(Mission.playersrecy))) then
	
		Mission.vo_recydeadtime = (GetTime() + 3)
		Mission.playersrecy_dead = true
	end

	if ((not Mission.vo_recydead) and (Mission.vo_recydeadtime < GetTime())) then
	
		Mission.vofail1 = AudioMessage("scion0599.wav") --TEMP to be replaced with standard "our recycler has been destroyed" asset--Dammit cooke, the recycler has been destroyed
		Mission.vo_recydead = true
	end

	if ((not Mission.obj7) and (Mission.vo_recydead) and (IsAudioMessageDone(Mission.vofail1))) then
	
		ClearObjectives()
		AddObjective("scion0507.otf", "WHITE")
		FailMission(GetTime() + 6,"scion05L2.txt")
		Mission.obj7 = true
	end

--****HELPING THE AIP****--
	--/BASETURR1
	if ((not Mission.checkturret1alive) and (IsAlive(Mission.baseturr1)))	 then
	
		Mission.turret1movetime = (GetTime() + 2)
		turret1alive = true
		Mission.checkturret1alive = true
		Mission.checkturret1dead = false
		Mission.turret1go = false
	end

	if ((not Mission.checkturret1dead) and (not IsAlive(Mission.baseturr1))) then
	
		turret1alive = false
		Mission.checkturret1alive = false
		Mission.checkturret1dead = true
	end

	if ((not Mission.turret1go) and (turret1alive) and (Mission.turret1movetime < GetTime())) then
	
		Goto(Mission.baseturr1,"baseturr1")
		Mission.turret1go = true
	end

--/BASETANK1

	if (Mission.basetank1alive) then
	
		if ((not Mission.basetank1go) and (Mission.basetank1movetime < GetTime())) then
		
			Goto(Mission.basetank1,"basetank1")
			Mission.basetank1go = true
		end

		if (not IsAlive(Mission.basetank1)) then
		
			Mission.basetank1alive = false
		end
	end

--/BASETANK2
	if (Mission.basetank2alive) then
	
		if ((not Mission.basetank2go) and (Mission.basetank2movetime < GetTime())) then
		
			Goto(Mission.basetank2,"basetank2")
			Mission.basetank2go = true
		end

		if (not IsAlive(Mission.basetank2)) then
		
			Mission.basetank2alive = false
		end
	end

--/BASETANK3
	if (Mission.basetank3alive) then
	
		if ((not Mission.basetank3go) and (Mission.basetank3movetime < GetTime())) then
		
			Goto(Mission.basetank3,"basetank3")
			Mission.basetank3go = true
		end

		if (not IsAlive(Mission.basetank3)) then
		
			Mission.basetank3alive = false
		end
	end

----------------------	
	--/THIS IS FOR THE BRIDGE THAT GETS BLOWN UP
	-- If one seg of the bridge is blown up, the other segs blow.  BRIDGE GO BOOM
	if (not bridgegoboom) then
	
		if ((not IsAround(Mission.bseg1))) then
		
			Mission.bstr2boomtime = (GetTime() + .7)
			Mission.bseg2boomtime = (GetTime() + .7)
			Mission.bseg3boomtime = (GetTime() + 1.4)
			Mission.bstr1boomtime = (GetTime() + 2.1)
			bridgegoboom = true
		end

		if ((not IsAround(Mission.bseg2))) then
		
			Mission.bstr2boomtime = (GetTime() + 1.4)
			Mission.bseg1boomtime = (GetTime() + .7)
			Mission.bseg3boomtime = (GetTime() + .7)
			Mission.bstr1boomtime = (GetTime() + 1.4)
			bridgegoboom = true
		end
	
		if ((not IsAround(Mission.bseg3))) then
		
			Mission.bstr2boomtime = (GetTime() + 2.1)
			Mission.bseg1boomtime = (GetTime() + 1.4)
			Mission.bseg2boomtime = (GetTime() + .7)
			Mission.bstr1boomtime = (GetTime() + .7)
			bridgegoboom = true
		end

		if ((not IsAround(Mission.bstr1))) then
		
			Mission.bstr2boomtime = (GetTime() + 2.8)
			Mission.bseg1boomtime = (GetTime() + 2.1)
			Mission.bseg2boomtime = (GetTime() + 1.4)
			Mission.bseg3boomtime = (GetTime() + .7)
			bridgegoboom = true
		end

		if ((not IsAround(Mission.bstr2))) then
		
			Mission.bstr1boomtime = (GetTime() + 2.8)
			Mission.bseg1boomtime = (GetTime() + .7)
			Mission.bseg2boomtime = (GetTime() + 1.4)
			Mission.bseg3boomtime = (GetTime() + 2.1)
			bridgegoboom = true
		end
	end

	if (not Mission.bridgegoboomover) then
	
		if ((not Mission.bseg1goboom) and (Mission.bseg1boomtime <= GetTime())) then
		
			Damage(Mission.bseg1,6000)
			Mission.bseg1goboom = true
		end

		if ((not Mission.bseg2goboom) and (Mission.bseg2boomtime <= GetTime())) then
		
			Damage(Mission.bseg2,6000)
			Mission.bseg2goboom = true
		end

		if ((not Mission.bseg3goboom) and (Mission.bseg3boomtime <= GetTime())) then
		
			Damage(Mission.bseg3,6000)
			Mission.bseg3goboom = true
		end

		if ((not Mission.bstr1goboom) and (Mission.bstr1boomtime <= GetTime())) then
		
			Damage(Mission.bstr1,6000)
			RemoveObject(Mission.bstr1)
			Mission.bstr1goboom = true
		end

		if ((not Mission.bstr2goboom) and (Mission.bstr2boomtime <= GetTime())) then
		
			Damage(Mission.bstr2,6000)
			RemoveObject(Mission.bstr2)
			Mission.bstr2goboom = true
		end

		if ((not IsAround(Mission.bstr1) and (not IsAround(Mission.bstr2) and (not IsAround(Mission.bseg1) and (not IsAround(Mission.bseg2) 
			and (not IsAround(Mission.bseg3))))))) then
		
			Mission.bridgegoboomover = true
		end
	end

 	
end