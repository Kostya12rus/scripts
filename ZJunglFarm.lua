local JunglFarm = {}
JunglFarm.optionEnable = Menu.AddOption({"Kostya12rus","JunglFarm"}, "Activate", "")
JunglFarm.autopick = Menu.AddOption({"Kostya12rus","JunglFarm"}, "AutoPick", "")
JunglFarm.optionKey = Menu.AddKeyOption({"Kostya12rus","JunglFarm"},"TestKey",Enum.ButtonCode.KEY_D)
JunglFarm.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
JunglFarm.fontNps = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
local coints
local ucanmove
local npsVisb
local spotneed
local CreepTable = {}
function JunglFarm.OnDraw()
	if not Menu.IsEnabled(JunglFarm.optionEnable) then return end
	if Menu.IsEnabled(JunglFarm.autopick) then
		if GameRules.GetGameState() == 2 then
			Engine.ExecuteCommand("dota_select_hero npc_dota_hero_sand_king")
			coints = 1
		end
	end
    local myHero = Heroes.GetLocal()
	if not myHero then return end
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_sand_king" then return end
	local mouse = Input.GetWorldCursorPos()
	local mouseX = math.floor(mouse:GetX())
	local mouseY = math.floor(mouse:GetY())
	local mouseZ = math.floor(mouse:GetZ())
	Renderer.DrawText(JunglFarm.font, 10, 290,mouseX .. " " .. mouseY .. " " .. mouseZ , 1)
	
	
	local lvlskill2 = Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1))
    local skil2 = NPC.GetAbilityByIndex(myHero, 1)
	local GameTime = GameRules.GetGameTime()
	local PreGameTime = GameRules.GetGameStartTime()
	local RealTime = GameTime-PreGameTime
	local Minute = math.floor(RealTime/60)
	local Second = math.floor(RealTime-(Minute*60))
	local CointNPC = 0
	local CointNPC2 = 0
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if Entity.IsAlive(unitNA) then
			local UnitPos = Entity.GetAbsOrigin(unitNA)
			myPos = Entity.GetAbsOrigin(myHero)
			local Health = Entity.GetHealth(unitNA)
			local MaxHealth = Entity.GetMaxHealth(unitNA)
			local HealthProc = Health/MaxHealth*100
			
			local x1, y1 , worldVis= Renderer.WorldToScreen(UnitPos)
			if worldVis and NPC.IsNeutral(unitNA) and NPC.IsPositionInRange(unitNA, myPos, 700, 0) and not NPC.IsWaitingToSpawn(unitNA) then
				JunglFarm.DrawCircle(UnitPos, 100, 5)
				if NPC.GetUnitName(unitNA) then
					Renderer.DrawText(JunglFarm.fontNps, x1, y1, (Health/MaxHealth*100), 1) --:__tostring()
					npsVisb = true
					CointNPC = CointNPC + 1
				end	
			else
				npsVisb = false
			end
		end
	end	
	

	
	local team = false
    my_team = Entity.GetTeamNum(myHero)
    if my_team ~= DOTA_TEAM_BADGUYS then
		spot = {Vector(-2089,-2833,256),Vector(-1802,-4071,141),Vector(-793,-3263,256),Vector(654,-4439,384),Vector(3334,-4575,256),Vector(4652,-4210,256)} 
	else	
		spot = {Vector(88,5016,384),Vector(1113,3549,384),Vector(-496,3558,256),Vector(-1671,4026,256),Vector(-3018,5134,384),Vector(-4410,3841,256)}  
	end
	for i = 1, #spot do
		JunglFarm.DrawCircle(spot[i], 20, 30)
	end
	
	

	if not Entity.IsAlive(myHero) then
		coints = 2
		ucanmove = true
	else
		if GameRules.GetGameState() == 5 then
			
			if Minute == 0 and Second == 30 then
				ucanmove = true
				coints = 2
			elseif Minute == 0 and Second <= 30 then
				ucanmove = true
				coints = 1
			elseif Minute == 0 and Second == 0 then
				ucanmove = false
			end
			
			if coints == nil or coints == 0 then
				coints = 2
			end
			if coints > 6 or coints < 0 then
				coints = 2
			end
			local distanc = myPos:Distance(spot[coints])
			local distance = distanc:Length2D()
			if distance <= 2 then
				if CointNPC ~= 0 then
					ucanmove = false
					if lvlskill2 ~= 0 and Ability.IsReady(skil2) and not Ability.IsChannelling(skil2) then
						Ability.CastNoTarget(skil2)
					end
				elseif CointNPC == 0 then
					coints = coints + 1
					if coints == 7 then
						coints = 2
					end
					ucanmove = true
				end
				
				
				
				-- if lvlskill2 >= 1 and Ability.IsReady(skil2) and not Ability.IsChannelling(skil2) and CointNPC ~= 0 then
					-- Ability.CastNoTarget(skil2)
					-- timecast = GameTime + 5 
					-- if coints == 7 then
						-- coints = 2
					-- else
						-- coints = coints + 1
						-- AddCoints = false
					-- end
				-- end
				-- if CointNPC < 1 then
					-- ucanmove = true
					-- if AddCoints and not ucanmove then
						-- coints = coints + 1
						-- AddCoints = false
					-- else
						-- AddCoints = true
					-- end
				-- else
					-- ucanmove = false
				-- end
			end
			
			Renderer.DrawText(JunglFarm.font, 10, 350, math.floor(GameTime) .. " " ..math.floor(timecast), 1)
			Renderer.DrawText(JunglFarm.font, 10, 400, "coints = " .. coints, 1)
			Renderer.DrawText(JunglFarm.font, 10, 420, "CointNPC = " .. CointNPC, 1)
			if ucanmove then
				Renderer.DrawText(JunglFarm.font, 10, 440, "ucanmove = true", 1)
			else
				Renderer.DrawText(JunglFarm.font, 10, 440, "ucanmove = false", 1)
			end
			
			
			if ucanmove then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, myHero, spot[coints], nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
			end

		elseif GameRules.GetGameState() == 4 then
			coints = 1
		end
	end
		
	if Menu.IsKeyDown(JunglFarm.optionKey) then
		ucanmove = true
	end
	
end

function JunglFarm.Reset()
	if coints == nil then
		local coints = 1
		local ucanmove = true
		local npsVisb = false
	end
end

local size_x, size_y = Renderer.GetScreenSize()
function JunglFarm.DrawCircle(UnitPos, radius, index)
    local x1, y1 = Renderer.WorldToScreen(UnitPos)
    if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
        local x4, y4, x3, y3, visible3
        local dergee = index
        for angle = 0, 360 / dergee do
            x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
            y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
            x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
            Renderer.DrawLine(x1,y1,x3,y3)
            x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
        end
    end
end	

return JunglFarm