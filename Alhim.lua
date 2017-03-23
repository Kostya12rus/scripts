-- Author: Kostya12rus
-- Version: 0.07
-- Updated: 20.03.2017
local alchemist = {}
alchemist.optionEnable = Menu.AddOption		({"Hero Specific","Alchemist"},		"1. Enabled", 			"")
alchemist.soul = Menu.AddOption				({"Hero Specific","Alchemist"},		"2. Use Item Soul Ring","Использовать Soul Ring в боте")
alchemist.autopick = Menu.AddOption			({"Hero Specific","Alchemist"}, 	"3. AutoPick", 			"Автоматический пик Алхимика")
alchemist.autobuy = Menu.AddOption			({"Hero Specific","Alchemist"}, 	"4. AutoBuy", 			"Автоматически закупаться")
alchemist.optionKey = Menu.AddKeyOption		({"Hero Specific","Alchemist"},		"5. Combo Key",Enum.ButtonCode.KEY_D)
alchemist.font = Renderer.LoadFont			("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

local myHero = Heroes.GetLocal()
Bot = false 

function alchemist.OnDraw()
	if not Menu.IsEnabled(alchemist.optionEnable) then 
		return
	else

			--GameRules.GetGameState() == -1 в меню
			--GameRules.GetGameState() == 1 загрузка в игру
			--GameRules.GetGameState() == 2 пик героев
			--GameRules.GetGameState() == 3 Стратегическая подготовка
			--GameRules.GetGameState() == 8 китайские мувы
			--GameRules.GetGameState() == 10 загрузка карты
			--GameRules.GetGameState() == 4 Размика (передигровая до 00:00)
			--GameRules.GetGameState() == 5 Игра (после 00:00)
			
			-- Renderer.DrawText(alchemist.font, 10, 240,NPC.GetAbsOrigin(myHero):GetX().." X", 1)    	--Коодината X
			-- Renderer.DrawText(alchemist.font, 10, 260,NPC.GetAbsOrigin(myHero):GetY().." Y", 1)		--Коодината Y
			-- Renderer.DrawText(alchemist.font, 10, 280,NPC.GetAbsOrigin(myHero):GetZ().." Z", 1)		--Коодината Z
			-- Renderer.DrawText(alchemist.font, 10, 300,Entity.GetTeamNum(myHero).."teamNum", 1)		--Номер команды
			
		if GameRules.GetGameState() == -1 then return end
	    local GameTime = GameRules.GetGameTime()  --Игровое время
		local PreGameTime = GameRules.GetGameStartTime()
		local RealTime = GameTime-PreGameTime
		local Minute = math.floor(RealTime/60)
		local Secund = math.floor(RealTime-(Minute*60))
		Renderer.DrawText(alchemist.font, 10, 235, "Игровое время "..Minute..":"..Secund, 1)
		if Menu.IsEnabled(alchemist.autopick) and Menu.IsEnabled(alchemist.optionEnable) then
			if GameRules.GetGameState() == 2 and Heroes.GetLocal() == nil then
				Engine.ExecuteCommand("dota_select_hero npc_dota_hero_alchemist")
			end
		end
		if NPC.GetUnitName(myHero) ~= "npc_dota_hero_alchemist" then return end
		soul = NPC.GetItem(myHero, "item_soul_ring", true)
		Bot = true 
		Renderer.DrawText(alchemist.font, 10, 190, "Bot On", 1)
		
			-- 	if Menu.IsEnabled(alchemist.optionEnable) then
			-- 		local mousePos = Input.GetWorldCursorPos()	
			-- 		Renderer.DrawText(alchemist.font, 10, 250,math.floor(mousePos:GetX()).." x", 1)
			-- 		Renderer.DrawText(alchemist.font, 10, 270,math.floor(mousePos:GetY()).." y", 1)
			-- 		Renderer.DrawText(alchemist.font, 10, 290,math.floor(mousePos:GetZ()).." z", 1)
			-- 		if Menu.IsKeyDown(alchemist.optionKey) then
			-- 			Engine.ExecuteCommand("say " .. math.floor(mousePos:GetX()) .. "-X," .. math.floor(mousePos:GetY()) .. "-Y," .. math.floor(mousePos:GetZ()) .. "-Z")
			-- 		end
			-- 	end
		
		local spot1 = Vector(-1851, -4443, 128)
		local spot2 = Vector(-472, 	-3311, 256)
		local spot1 = Vector(468, 	-4659, 384)
		
		if Menu.IsKeyDown(alchemist.optionKey) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, hero, spot1, hero, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, hero)
		end
		
		
		if soul and Menu.IsEnabled(alchemist.soul) then
			Renderer.DrawText(alchemist.font, 10, 205, "Soul Ring", 1)
			local myMana = NPC.GetMana(myHero)
			if Ability.IsCastable(soul, myMana) then
				Ability.CastNoTarget(soul)
			end 
		end
		local skill1 = Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))
		if skill1 > 0 then
			Renderer.DrawText(alchemist.font, 10, 220, "First skill " .. (skill1) .. " lvl", 1)
		end
	end
end
return alchemist