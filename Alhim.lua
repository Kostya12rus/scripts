-- Author: Kostya12rus
-- Version: 0.07
-- Updated: 20.03.2017
local alchemist = {}
alchemist.optionEnable = Menu.AddOption		({ "Hero Specific","Alchemist" }, "1. Enabled", 			"")
alchemist.autopick = Menu.AddOption			({ "Hero Specific","Alchemist" }, "2. AutoPick", 			"Автоматический пик Алхимика")
alchemist.soul = Menu.AddOption				({ "Hero Specific","Alchemist" }, "3. Use Item Soul Ring", 	"Использовать Soul Ring в боте")
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
			
			-- Renderer.DrawText(alchemist.font, 10, 240,NPC.GetAbsOrigin(myHero):GetX().." X", 1)		x
			-- Renderer.DrawText(alchemist.font, 10, 260,NPC.GetAbsOrigin(myHero):GetY().." Y", 1)		y
			-- Renderer.DrawText(alchemist.font, 10, 280,NPC.GetAbsOrigin(myHero):GetZ().." Z", 1)		z
			-- Renderer.DrawText(alchemist.font, 10, 300,Entity.GetTeamNum(myHero).."teamNum", 1)		Номер команды
			
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
		local soul = NPC.GetItem(myHero, "item_soul_ring", true)
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
			Renderer.DrawText(alchemist.font, 10, 220, "First skill " .. (skill1) .. " lvl", 1)
		end
	end
end
return alchemist