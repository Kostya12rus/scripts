local MeepoHazk = {}
MeepoHazk.optionEnable = Menu.AddOption({"Kostya12rus","MeepoPeppa"},"Activate", "")
MeepoHazk.optionKey = Menu.AddKeyOption({"Kostya12rus","MeepoPeppa"},"Key for waltz",Enum.ButtonCode.KEY_F)
MeepoHazk.FontSkill = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function MeepoHazk.OnDraw()
	if not Menu.IsEnabled(MeepoHazk.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	local mouse = Input.GetWorldCursorPos()
	local mouseX = math.floor(mouse:GetX())
	local mouseY = math.floor(mouse:GetY())
	local mouseZ = math.floor(mouse:GetZ())
	Renderer.DrawText(MeepoHazk.FontSkill, 100, 500,mouseX .. "|" .. mouseY .. "|" .. mouseZ , 1)
end

function MeepoHazk.OnUpdate()
	if not Menu.IsEnabled(MeepoHazk.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	if JangleSpots == nil then
		if Entity.GetTeamNum(myHero) ~= 3 then
			JangleSpots = 
			{
				 {pos = Vector(-1873,-4250,256), CanFarm = true},{pos = Vector(-431,-3298,256), CanFarm = true},{pos = Vector(423,-4653,384), CanFarm = true}
				,{pos = Vector(2964,-4595,256), CanFarm = true},{pos = Vector(4567,-4366,256), CanFarm = true},{pos = Vector(84,-1880,384), CanFarm = true}
				,{pos = Vector(-4824,-382,256), CanFarm = true},{pos = Vector(-3738,873,256), CanFarm = true},{pos = Vector(-3080,-64,384), CanFarm = true}
			}
		else
			JangleSpots = 
			{
				 {pos = Vector(1224,3346,384), CanFarm = true},{pos = Vector(-190,3410,256), CanFarm = true},{pos = Vector(-1927,4274,256), CanFarm = true}
				,{pos = Vector(-2809,4595,256), CanFarm = true},{pos = Vector(-4307,3536,256), CanFarm = true},{pos = Vector(-849,2305,384), CanFarm = true}
				,{pos = Vector(4291,830,384), CanFarm = true},{pos = Vector(2624,126,384), CanFarm = true},{pos = Vector(3838,-602,256), CanFarm = true}
			}
		end
	end
	
	for i=1,Heroes.Count() do
		local hero = Heroes.Get(i)
		if Entity.IsHero(hero) and Entity.IsAlive(hero) and not NPC.IsIllusion(hero) and Entity.IsSameTeam(hero,myHero) and hero ~= myHero then
			if NPC.GetUnitName(hero) == "npc_dota_hero_meepo" then
					MeepoTable[i] = {hero = hero, free = true, pos = Entity.GetAbsOrigin(hero)}
				
				
				
				-- Renderer.DrawText(MeepoHazk.FontSkill, 500, ypos, NPC.GetUnitName(hero), 1)
				-- ypos = ypos + 14			
				-- poof = NPC.GetAbility(hero, "meepo_poof")
				-- if poof and Ability.IsCastable(poof, NPC.GetMana(hero)) and Ability.IsReady(poof) then 
					-- MeepoHazk.NeedPoof(hero,myHero,poof)
				-- end
			end
		end
	end
	for i,key in pairs(MeepoTable) do
	
		if MeepoHazk.IsInPositionFarm(MeepoTable[i].hero) and MeepoTable[i].free then
			Renderer.DrawText(MeepoHazk.FontSkill, 500, 100, i, 1)
			MeepoHazk.FindJunglNPC(hero)
		else
			if not NPC.IsRunning(MeepoTable[i].hero) then
				if MeepoTable[i].free then 
					MeepoHazk.FindFarmPos(MeepoTable[i].hero,i)
					MeepoTable[i].free = false
				end
			else
				MeepoTable[i].free = true
			end
		end
	end
end

function MeepoHazk.FindFarmPos(hero,i)
	local randomint = math.random(1,#JangleSpots)
	if JangleSpots[randomint].CanFarm then
		MeepoHazk.GoToPos(hero,JangleSpots[randomint].pos)
		MeepoTable[i].free = false
		MeepoTable[i].pos = JangleSpots[randomint].pos
	else
		MeepoHazk.FindFarmPos(hero,i)
	end
end

function MeepoHazk.IsInPositionFarm(hero)
	for i=1,#JangleSpots do
		if Entity.GetAbsOrigin(hero):Distance(JangleSpots[i].pos):Length2D() < 50 then
			return true
		end
	end
	return false
end

function MeepoHazk.FindJunglNPC(hero)
	maxhp = 0
	heromaxhp = nil
	for i=1,Heroes.Count() do
		local jungnps = Heroes.Get(i)
		if Entity.IsAlive(jungnps) and NPC.IsNeutral(jungnps) and NPC.IsPositionInRange(jungnps, Entity.GetAbsOrigin(hero), 100, 0) and not NPC.IsWaitingToSpawn(jungnps) then
			MeepoHazk.AtackNpc(hero,jungnps)
			return
		end
	end
end

function MeepoHazk.AtackNpc(hero,target)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,hero)
	return
end

function MeepoHazk.NeedPoof(hero,myhero,poof)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, myhero, Vector(0,0,0), poof, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,hero)
	return
end

function MeepoHazk.GoToPos(hero,pos)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, hero, pos, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, hero)
	return
end


function MeepoHazk.init()
	MeepoTable = {}
end
function MeepoHazk.OnGameStart()
	MeepoHazk.init()
end
function MeepoHazk.OnGameEnd()
	MeepoHazk.init()
end
MeepoHazk.init()
return MeepoHazk