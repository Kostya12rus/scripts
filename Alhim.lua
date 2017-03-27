local alchemist = {}
alchemist.optionEnable = Menu.AddOption		({"Hero Specific","Alchemist"},		"1. Enabled", 			"")
alchemist.soul = Menu.AddOption				({"Hero Specific","Alchemist"},		"2. Use Item Soul Ring","Использовать Soul Ring в боте")
alchemist.autopick = Menu.AddOption			({"Hero Specific","Alchemist"}, 	"3. AutoPick", 			"Автоматический пик Алхимика")
alchemist.autobuy = Menu.AddOption			({"Hero Specific","Alchemist"}, 	"4. AutoBuy", 			"Автоматически закупаться")
alchemist.optionKey = Menu.AddKeyOption		({"Hero Specific","Alchemist"},		"5. Combo Key",Enum.ButtonCode.KEY_D)
alchemist.optionKeyCord = Menu.AddKeyOption		({"Hero Specific","Alchemist"},		"6. Cords",Enum.ButtonCode.KEY_1)
alchemist.font = Renderer.LoadFont			("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

local myHero = Heroes.GetLocal()
Bot = false 
gomove = true
MoveAttack1 = true
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
		local Second = math.floor(RealTime-(Minute*60))
		Renderer.DrawText(alchemist.font, 10, 235, "Игровое время "..Minute..":"..Second, 1)
		if Menu.IsEnabled(alchemist.autopick) and Menu.IsEnabled(alchemist.optionEnable) then
			if GameRules.GetGameState() == 2 and Heroes.GetLocal() == nil then
				Engine.ExecuteCommand("dota_select_hero npc_dota_hero_alchemist")
			end
		end
		if NPC.GetUnitName(myHero) ~= "npc_dota_hero_alchemist" then return end
		soul = NPC.GetItem(myHero, "item_soul_ring", true)
		Bot = true 
		Renderer.DrawText(alchemist.font, 10, 190, "Bot On", 1)
		if soul and Menu.IsEnabled(alchemist.soul) then
			Renderer.DrawText(alchemist.font, 10, 205, "Soul Ring", 1)
			local myMana = NPC.GetMana(myHero)
			if Ability.IsCastable(soul, myMana) then
				Ability.CastNoTarget(soul)
			end 
		end
		local skill1 = Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))
		if skill1 > 0 then
		end
		local mousePos = Input.GetWorldCursorPos() Renderer.DrawText(alchemist.font, 1, 250,math.floor(mousePos:GetX()).." X", 1) Renderer.DrawText(alchemist.font, 70, 250,math.floor(mousePos:GetY()).." Y", 1)	Renderer.DrawText(alchemist.font, 140, 250,math.floor(mousePos:GetZ()).." Z", 1)		--Коодината Z
		
		local spot1 = Vector(-1806, -4454, 0)
		local spot2 = Vector(0, 0, 0)
		local x1L = (-1928) 
		local x1H = (-1681) 
		local y1H = (-4339)
		local y1L = (-4544) 
		local PHX = (NPC.GetAbsOrigin(myHero):GetX())
		local PHY = (NPC.GetAbsOrigin(myHero):GetY())
		if not Menu.IsKeyDown(alchemist.optionKey) then
			return
		else
			if MoveAttack1 == true then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, myHero, spot1, myHero, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, true)
				if (x1H > PHX and PHX > x1L) and (y1H > PHY and PHY > y1L) then
					local MoveAttack1 = false
					local MoveAttack2 = true
					Engine.ExecuteCommand("say Прибыл на спот1")
				end
			end
			if MoveAttack2 == true then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, myHero, spot2, myHero, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, true)
				Engine.ExecuteCommand("say Прибыл на спот2")
			end
		end
	end
end
return alchemist