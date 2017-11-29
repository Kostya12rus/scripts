local MeepoHazk = {}
MeepoHazk.optionEnable = Menu.AddOption({"Kostya12rus","MeepoPeppa"},"Activate", "")
MeepoHazk.optionKey = Menu.AddKeyOption({"Kostya12rus","MeepoPeppa"},"Key for farm",Enum.ButtonCode.KEY_R)
MeepoHazk.FontSkill = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function MeepoHazk.init()
	MeepoTable = nil
	JangleSpots = nil
	fountan = nil
	NeedFarm = false
end
function MeepoHazk.OnGameStart()
	MeepoHazk.init()
end
function MeepoHazk.OnGameEnd()
	MeepoHazk.init()
end
MeepoHazk.init()

function MeepoHazk.OnDraw()
	if not Menu.IsEnabled(MeepoHazk.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	local mouse = Input.GetWorldCursorPos()
	local mouseX = math.floor(mouse:GetX())
	local mouseY = math.floor(mouse:GetY())
	local mouseZ = math.floor(mouse:GetZ())
	Renderer.SetDrawColor(255,255,255,255)
	Renderer.DrawText(MeepoHazk.FontSkill, 600, 80,mouseX .. "|" .. mouseY .. "|" .. mouseZ , 1)	
	
	-- local ypos = 100
	-- for i=1,24 do
		-- Renderer.DrawText(MeepoHazk.FontSkill, 700, ypos, tostring(Ability.GetName(NPC.GetAbilityByIndex(myHero,i))), 1)
		-- ypos=ypos+14
	-- end
	if MeepoHazk.FindNpc(Entity.GetAbsOrigin(myHero),500) then
		Renderer.DrawText(MeepoHazk.FontSkill, 600, 100, "Есть враги", 1)
	end
	
	if JangleSpots then
		local ypos = 100
		for i=1,#JangleSpots do
			Renderer.DrawText(MeepoHazk.FontSkill, 500, ypos, i.."|"..tostring(JangleSpots[i].CanFarm), 1)
			ypos=ypos+14
		end
	end
	
	local ycord = 100
	if MeepoTable then
		for i,key in pairs(MeepoTable) do
			Renderer.DrawText(MeepoHazk.FontSkill, 700, ycord, tostring(MeepoTable[i].farmnum).."|"..tostring(MeepoTable[i].free), 1)
			ycord = ycord + 15
			if MeepoHazk.IsInSpot(MeepoTable[i].hero,MeepoTable[i].farmnum,1000) then
				Renderer.DrawText(MeepoHazk.FontSkill, 600, 120, "На позиции", 1)
			end
		end
	end
	if NeedFarm then 
		Renderer.DrawText(MeepoHazk.FontSkill, 800, 120, "Бот включен", 1)
	else
		Renderer.DrawText(MeepoHazk.FontSkill, 800, 120, "Бот выключен", 1)
	end
end

function MeepoHazk.OnUpdate()
	if not Menu.IsEnabled(MeepoHazk.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	if Menu.IsKeyDownOnce(MeepoHazk.optionKey) then
		NeedFarm = not NeedFarm
	end
	if not Entity.IsAlive(myHero) then return end
	if not NeedFarm then return end
	if JangleSpots == nil then
		if Entity.GetTeamNum(myHero) ~= 3 then
			JangleSpots = 
			{
				 {pos = Vector(-1873,-4250,256),CanFarm = true},{pos = Vector(-431,-3298,256), CanFarm = true},{pos = Vector(423,-4653,384), CanFarm = true}
				,{pos = Vector(2964,-4595,256), CanFarm = true},{pos = Vector(4567,-4366,256), CanFarm = true},{pos = Vector(84,-1880,384),  CanFarm = true}
				,{pos = Vector(-4824,-382,256), CanFarm = true},{pos = Vector(-3738,873,256),  CanFarm = true},{pos = Vector(-3080,-64,384), CanFarm = true}
			}
		else
			JangleSpots = 
			{
				 {pos = Vector(1224,3346,384), CanFarm = true},{pos = Vector(-190,3410,256), CanFarm = true},{pos = Vector(-1927,4274,256),CanFarm = true}
				,{pos = Vector(-2809,4595,256),CanFarm = true},{pos = Vector(-4307,3536,256),CanFarm = true},{pos = Vector(-849,2305,384), CanFarm = true}
				,{pos = Vector(4291,830,384),  CanFarm = true},{pos = Vector(2624,126,384),  CanFarm = true},{pos = Vector(3838,-602,256), CanFarm = true}
			}
		end
	end
	
	for i=1,#JangleSpots do
		local gametimesec = (GameRules.GetGameTime()-GameRules.GetGameStartTime())%60
		local gametime = (GameRules.GetGameTime()-GameRules.GetGameStartTime())
		if gametimesec >= 0 and gametimesec <= 1 and gametime >= 60 then
			JangleSpots[i].CanFarm = true
		elseif gametime < 60 then
		end
	end
	if (GameRules.GetGameTime()-GameRules.GetGameStartTime()) < 60 or GameRules.GetGameState() ~= 5 then return end
	for i=1,Heroes.Count() do
		local hero = Heroes.Get(i)
		if Entity.IsHero(hero) and Entity.IsAlive(hero) and not NPC.IsIllusion(hero) and Entity.IsSameTeam(hero,myHero) and hero ~= myHero then
			if NPC.GetUnitName(hero) == "npc_dota_hero_meepo" then
				if MeepoTable == nil then
					MeepoTable = {}
				end
				if MeepoTable[i] == nil then
					MeepoTable[i] = {hero = hero, free = true, pos = Vector(0,0,0),farmnum = 0,poofpause = 0}
				end
				if NPC.IsIllusion(hero) then
					MeepoTable[i] = nil
				end
			end
		end
	end
	ycord = 100
	if MeepoTable then
		for i,key in pairs(MeepoTable) do
			if not Entity.IsAlive(MeepoTable[i].hero) then MeepoTable[i] = nil end
			local poof = NPC.GetAbility(MeepoTable[i].hero,"meepo_poof")
			local HealthProc = Entity.GetHealth(MeepoTable[i].hero)/Entity.GetMaxHealth(MeepoTable[i].hero)*100	
			local ManaProc = NPC.GetMana(MeepoTable[i].hero)/NPC.GetMaxMana(MeepoTable[i].hero)*100			
			local travel_boots = NPC.GetItem(MeepoTable[i].hero, "item_travel_boots", true)
			local travel_boots_2 = NPC.GetItem(MeepoTable[i].hero, "item_travel_boots_2", true)
			local tpBoots = nil
			if travel_boots then
				tpBoots = travel_boots
			end
			if travel_boots_2 then
				tpBoots = travel_boots_2
			end 
			if HealthProc < 30 then
				MeepoTable[i].farmnum = 10				
				if not NPC.IsRunning(MeepoTable[i].hero) and MeepoTable[i].poofpause < GameRules.GetGameTime() then
					MeepoHazk.GoToPos(MeepoTable[i].hero,MeepoHazk.NeedFountan())
				end
				MeepoTable[i].free = false
			end
			if MeepoTable[i].farmnum == 10 then
				if not MeepoHazk.FindEnemy(MeepoTable[i].hero,2000) then
					if HealthProc > 90 and ManaProc > 90 then
						MeepoTable[i].free = true
						MeepoTable[i].farmnum = 0
					end
				end
				local Distance = (Entity.GetAbsOrigin(MeepoTable[i].hero):Distance(MeepoHazk.NeedFountan()):Length2D())
				if Distance > 2000 and MeepoTable[i].poofpause <= GameRules.GetGameTime() then
					if MeepoHazk.PoofToFountanMeepo(MeepoTable[i].hero,1000) and MeepoHazk.IsPoofReady(MeepoTable[i].hero,MeepoTable[i].poofpause,true) then
						MeepoHazk.NeedPoof(MeepoTable[i].hero,MeepoHazk.PoofToFountanMeepo(MeepoTable[i].hero,1000),poof)
						MeepoTable[i].poofpause = GameRules.GetGameTime() + 1.6
					else
						if tpBoots and MeepoTable[i].poofpause <= GameRules.GetGameTime() then
							if Ability.IsReady(tpBoots) and Ability.IsCastable(tpBoots, NPC.GetMana(MeepoTable[i].hero)) and NPC.GetMana(MeepoTable[i].hero) >= Ability.GetManaCost(tpBoots) then
								Ability.CastPosition(tpBoots, MeepoHazk.NeedFountan())
								MeepoTable[i].poofpause = GameRules.GetGameTime() + 3.1
							end
						end
					end
				end
			end
			if MeepoHazk.FindEnemy(MeepoTable[i].hero,2000) then
				MeepoTable[i].farmnum = 10				
				if not NPC.IsRunning(MeepoTable[i].hero) and MeepoTable[i].poofpause < GameRules.GetGameTime() then
					MeepoHazk.GoToPos(MeepoTable[i].hero,MeepoHazk.NeedFountan())
				end
				MeepoTable[i].free = false
			end
			if MeepoTable[i].farmnum >= 0 and MeepoTable[i].farmnum <= #JangleSpots then
				if MeepoTable[i].farmnum ~= 0 then
					if MeepoHazk.IsInSpot(MeepoTable[i].hero, MeepoTable[i].farmnum, 300) then
						if MeepoHazk.FindNpc(Entity.GetAbsOrigin(MeepoTable[i].hero),400) then
							MeepoTable[i].free = false
							if MeepoHazk.IsPoofReady(MeepoTable[i].hero,MeepoTable[i].poofpause) then
								MeepoHazk.NeedPoof(MeepoTable[i].hero,MeepoTable[i].hero,poof)
								MeepoTable[i].poofpause = GameRules.GetGameTime() + 1.6
							else
								if MeepoTable[i].poofpause < GameRules.GetGameTime() then
									if not NPC.IsAttacking(MeepoTable[i].hero) then
										MeepoHazk.AttackNpc(MeepoTable[i].hero, MeepoHazk.FindNpc(Entity.GetAbsOrigin(MeepoTable[i].hero), 400))
									end
								end
							end
						else
							JangleSpots[MeepoTable[i].farmnum].CanFarm = false
							MeepoTable[i].free = true
						end
					else
						if not NPC.IsRunning(MeepoTable[i].hero) and MeepoTable[i].poofpause < GameRules.GetGameTime() then
							MeepoHazk.GoToPos(MeepoTable[i].hero, JangleSpots[MeepoTable[i].farmnum].pos)
						end
						local Distance = (Entity.GetAbsOrigin(MeepoTable[i].hero):Distance(JangleSpots[MeepoTable[i].farmnum].pos):Length2D())
						if Distance > 1000 then
							if MeepoHazk.PoofToMeepo(MeepoTable[i].hero,JangleSpots[MeepoTable[i].farmnum].pos,1500) then
								if MeepoHazk.IsPoofReady(MeepoTable[i].hero,MeepoTable[i].poofpause) then
									MeepoHazk.NeedPoof(MeepoTable[i].hero,MeepoHazk.PoofToMeepo(MeepoTable[i].hero,JangleSpots[MeepoTable[i].farmnum].pos,1500),poof)
									MeepoTable[i].poofpause = GameRules.GetGameTime() + 1.6
								end
							end
						end
					end
				end
				
				if MeepoTable[i].free then
					MeepoTable[i].farmnum = MeepoHazk.NeedSpot()
					if MeepoTable[i].farmnum == 10 and not NPC.IsRunning(MeepoTable[i].hero) then
						MeepoHazk.GoToPos(MeepoTable[i].hero, MeepoHazk.NeedFountan())
					elseif not NPC.IsRunning(MeepoTable[i].hero) then
						MeepoHazk.GoToPos(MeepoTable[i].hero, JangleSpots[MeepoTable[i].farmnum].pos)
					end
					MeepoTable[i].free = false
				end
			end
		end
	end
end

function MeepoHazk.IsPoofReady(hero,timepoof,truger)
	local poof = NPC.GetAbility(hero,"meepo_poof")
	if 	Ability.IsCastable(poof, NPC.GetMana(hero)) and Ability.IsReady(poof) and timepoof <= GameRules.GetGameTime() then
		if truger and NPC.GetMana(hero) >= Ability.GetManaCost(poof) then
			return true
		elseif NPC.GetMana(hero) >= Ability.GetManaCost(poof)*2 then
			return true
		else
			return false
		end
	else
		return false
	end
end

function MeepoHazk.FindEnemy(hero,distance)
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if Entity.IsHero(unitNA) and Entity.IsAlive(unitNA) and not NPC.IsIllusion(unitNA) and not Entity.IsSameTeam(unitNA,hero) and not Entity.IsDormant(unitNA) then
			local HeroDistance = (Entity.GetAbsOrigin(hero):Distance(Entity.GetAbsOrigin(unitNA)):Length2D())
			if HeroDistance <= distance then
				return true
			end
		end
	end	
	return false
end

function MeepoHazk.PoofToMeepo(Hero,NeedPos,distancemin)
	local MinDistanse = (Entity.GetAbsOrigin(Hero):Distance(NeedPos):Length2D())
	local MinHero = nil
	local LocalHeroDistance = (Entity.GetAbsOrigin(Heroes.GetLocal()):Distance(NeedPos):Length2D())
	if LocalHeroDistance + distancemin <= MinDistanse then
		MinHero = Heroes.GetLocal()
		MinDistanse = LocalHeroDistance
	end
	for i,key in pairs(MeepoTable) do
		if Hero ~= MeepoTable[i].hero then
			local distanse = (Entity.GetAbsOrigin(MeepoTable[i].hero):Distance(NeedPos):Length2D())
			if distanse + distancemin <= MinDistanse then
				MinHero = MeepoTable[i].hero
				MinDistanse = distanse
			end
		end
	end
	return MinHero
end

function MeepoHazk.PoofToFountanMeepo(hero,distancemin)
	local MinDistanse = (Entity.GetAbsOrigin(hero):Distance(MeepoHazk.NeedFountan()):Length2D())
	local MinHero = nil
	local LocalHeroDistance = (Entity.GetAbsOrigin(Heroes.GetLocal()):Distance(MeepoHazk.NeedFountan()):Length2D())
	if LocalHeroDistance <= distancemin then
		MinHero = Heroes.GetLocal()
		MinDistanse = LocalHeroDistance
	end
	for i,key in pairs(MeepoTable) do
		if hero ~= MeepoTable[i].hero then
			local distanse = (Entity.GetAbsOrigin(MeepoTable[i].hero):Distance(MeepoHazk.NeedFountan()):Length2D())
			if distanse <= MinDistanse and distanse <= distancemin then
				MinHero = MeepoTable[i].hero
				MinDistanse = distanse
			end
		end
	end
	return MinHero
end

function MeepoHazk.NeedFountan()
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if NPC.GetUnitName(unitNA) == "dota_fountain" and Entity.IsSameTeam(Heroes.GetLocal(),unitNA) then 
			return Entity.GetOrigin(unitNA)
		end
	end	
	return nil
end

function MeepoHazk.FindNpc(pos,NeedDistance)
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if Entity.IsAlive(unitNA) and NPC.IsNeutral(unitNA) and not NPC.IsWaitingToSpawn(unitNA) then
			local distance = pos:Distance(Entity.GetAbsOrigin(unitNA)):Length2D()
			if distance <= NeedDistance then
				return unitNA
			end
		end
	end	
	return nil
end

function MeepoHazk.IsInSpot(Hero,Spot,NeedDistance)
	if Spot == 0 or Spot == nil then return false end
	if Spot < 1 or Spot > #JangleSpots then return false end
	local JunglPos = JangleSpots[Spot].pos
	local distance = JunglPos:Distance(Entity.GetAbsOrigin(Hero)):Length2D()
	if distance <= NeedDistance then
		return true
	end
	return false
end

function MeepoHazk.NeedSpot()
	local FreeSpots = {}
	local coint = 0
	for i=1,#JangleSpots do
		if JangleSpots[i].CanFarm then
			coint = coint + 1
			FreeSpots[coint] = i
		end
	end
	if coint == 0 then return 10 end
	local intrandom = math.random(1,#FreeSpots)
	return FreeSpots[intrandom]
end

function MeepoHazk.AttackNpc(hero,target)
	Player.AttackTarget(Players.GetLocal(),hero,target)
end
function MeepoHazk.NeedPoof(hero,myhero,poof)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, myhero, Vector(0,0,0), poof, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,hero)
	return
end
function MeepoHazk.GoToPos(hero,pos)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, hero, pos, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, hero)
	return
end

return MeepoHazk