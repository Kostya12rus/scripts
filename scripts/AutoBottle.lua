local AB = {}

AB.optionEnable = Menu.AddOption({ "Awareness" }, "Auto Bottle", "Auto Bottle when you on your base. Script by Rednelss")

function AB.OnUpdate()
	if not Menu.IsEnabled(AB.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	local BB = NPC.GetItem(myHero, "item_bottle", true)
	if BB and NPC.HasModifier(myHero, "modifier_fountain_aura_buff") and Ability.IsReady(BB) then
		if Entity.GetHealth(myHero) < Entity.GetMaxHealth(myHero) or NPC.GetMana(myHero) < NPC.GetMaxMana(myHero) then
			if not NPC.HasModifier(myHero, "modifier_bottle_regeneration") and not NPC.IsChannellingAbility(myHero) then
				Ability.CastNoTarget(BB)
			end
		end
	end
end

return AB
