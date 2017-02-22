-- Author: Kostya12rus
-- Version: 0.03
-- Updated: 15.02.2017
local alchemist = {}

alchemist.optionEnable = Menu.AddOption({ "Hero Specific","Alchemist" }, "Enabled", "")
alchemist.soul = Menu.AddOption({ "Hero Specific","Alchemist" }, "Use Item Soul Ring", "")
alchemist.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

local myHero = Heroes.GetLocal()
Bot = false 
			--local game = GameRules.GetGameTime()  --Игровое время
			--Renderer.DrawText(alchemist.font, 10, 235, "Секунд прошло " .. math.floor(game), 1)

function alchemist.OnDraw()
	if not Menu.IsEnabled(alchemist.optionEnable) then 
		return
	else
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
			Renderer.DrawText(alchemist.font, 10, 220, "First skill " .. (skill1) .. " lvl", 1)
			-- Renderer.DrawText(alchemist.font, 10, 240,NPC.GetAbsOrigin(myHero):GetX().." X", 1)
			-- Renderer.DrawText(alchemist.font, 10, 260,NPC.GetAbsOrigin(myHero):GetY().." Y", 1)
			-- Renderer.DrawText(alchemist.font, 10, 280,NPC.GetAbsOrigin(myHero):GetZ().." Z", 1)
			-- Renderer.DrawText(alchemist.font, 10, 300,Entity.GetTeamNum(myHero).."teamNum", 1)
		end
	end
end
return alchemist