local AutoTrack = {}

AutoTrack.optionEnable = Menu.AddOption({"Hero Specific", "Bounty Hunter"}, "Auto Track", "Script by Rednelss")
AutoTrack.autoInvisibility = Menu.AddOption({ "Hero Specific", "Bounty Hunter" }, "Auto Invisibility After Auto Track", "Script by Rednelss")

function AutoTrack.OnUpdate()
	if not Menu.IsEnabled(AutoTrack.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_bounty_hunter" then return end
	local myTeam = Entity.GetTeamNum(myHero)
	local shadowwalk = NPC.GetAbilityByIndex(myHero, 2)
	local track = NPC.GetAbilityByIndex(myHero, 3)

	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		local sameTeam = Entity.GetTeamNum(hero) == myTeam
		if not sameTeam and not Entity.IsDormant(hero) and Entity.GetHealth(hero) > 0 then
			local pos = Entity.GetAbsOrigin(hero)
			if Menu.IsEnabled(AutoTrack.autoInvisibility) then
				if Ability.IsReady(track) and Ability.IsReady(shadowwalk) and NPC.GetMana(myHero) > Ability.GetManaCost(shadowwalk) + Ability.GetManaCost(track) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(track) - 10) and not NPC.HasModifier(hero, "modifier_bounty_hunter_track") and not NPC.IsLinkensProtected(hero) then
					Ability.CastTarget(track, hero)
					Ability.CastNoTarget(shadowwalk)
				end
			else
				if Ability.IsReady(track) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(track) - 10) and not NPC.HasModifier(hero, "modifier_bounty_hunter_track") and not NPC.IsLinkensProtected(hero) then
					Ability.CastTarget(track, hero)
				end
			end
		end
	end
end

return AutoTrack
