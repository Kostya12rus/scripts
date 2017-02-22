local ZeusExtended = {}

ZeusExtended.AutoBolt = Menu.AddOption({ "Hero Specific", "Zeus" }, "Auto Steal", "")
ZeusExtended.FarmKey = Menu.AddKeyOption({ "Hero Specific", "Zeus" }, "Farm Key", Enum.ButtonCode.KEY_F)
ZeusExtended.SpamKey = Menu.AddKeyOption({ "Hero Specific", "Zeus" }, "Spam Key", Enum.ButtonCode.KEY_D)
ZeusExtended.Hero = nil
ZeusExtended.ManaPoint = 0

function ZeusExtended.OnUpdate()
	if not GameRules.GetGameState() == 5 then return end
	
	-- Initialize
    ZeusExtended.Hero = Heroes.GetLocal()
    if NPC.GetUnitName(ZeusExtended.Hero) ~= "npc_dota_hero_zuus" then return end
    ZeusExtended.ManaPoint = NPC.GetMana(ZeusExtended.Hero)
	
    local light = NPC.GetAbilityByIndex(ZeusExtended.Hero, 0)
    local bolt = NPC.GetAbilityByIndex(ZeusExtended.Hero, 1)
    local static = NPC.GetAbilityByIndex(ZeusExtended.Hero, 2)
	
	local uniquebonusrng = NPC.GetAbilityByIndex(ZeusExtended.Hero, 11)	
    local uniquebonusdmg = NPC.GetAbilityByIndex(ZeusExtended.Hero, 12)	
	
	local lens = NPC.GetItem(ZeusExtended.Hero, "item_aether_lens", true)
		
	local light_radius = 850
	local bolt_radius = 700
	
	if lens then 
		light_radius = light_radius + 220
		bolt_radius = bolt_radius + 220
	end

	if Ability.GetLevel(uniquebonusrng) == 1 then
		light_radius = light_radius + 200
		bolt_radius = bolt_radius + 200
	end
	--
	local staticdmg = 0
	-- Auto Steal
	if Menu.IsEnabled( ZeusExtended.AutoBolt ) then
		if Ability.GetLevel(static) > 0 then
			staticdmg = 2 + (2 * Ability.GetLevel(static))
			if Ability.GetLevel(uniquebonusdmg) == 1 then
				staticdmg = staticdmg + 1.5
			end
		end
			
		for n, npc in pairs(NPC.GetHeroesInRadius(ZeusExtended.Hero, bolt_radius, Enum.TeamType.TEAM_ENEMY)) do	
			if Entity.IsHero(npc) and not NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				local boltdmg = Ability.GetDamage(bolt)
				if Ability.GetLevel(static) > 0 then
					boltdmg  = boltdmg + (Entity.GetHealth(npc) * (staticdmg / 100) )
				end
				boltdmg = NPC.GetMagicalArmorDamageMultiplier(npc) * boltdmg
				
				local lightdmg = Ability.GetDamage(light)
				if Ability.GetLevel(static) > 0 then
					lightdmg = lightdmg + (Entity.GetHealth(npc) * (staticdmg / 100) )
				end
				lightdmg = NPC.GetMagicalArmorDamageMultiplier(npc) * lightdmg
				
				if Entity.GetHealth(npc) < lightdmg and Ability.IsCastable(light, ZeusExtended.ManaPoint) then
					Ability.CastTarget(light, npc)
				elseif Entity.GetHealth(npc) < boltdmg and Ability.IsCastable(bolt, ZeusExtended.ManaPoint) then
					Ability.CastTarget(bolt, npc)
				return end
			end
		end
		
	end
	
	-- Farm
    if Menu.IsKeyDown(ZeusExtended.FarmKey) or Menu.IsKeyDown(ZeusExtended.SpamKey) then
		for n, npc in pairs(NPC.GetUnitsInRadius(ZeusExtended.Hero, light_radius, Enum.TeamType.TEAM_ENEMY)) do	
			if not NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				if (Entity.GetHealth(npc) < Ability.GetDamage(light)) or Menu.IsKeyDown(ZeusExtended.SpamKey) then 
					if light and Ability.IsCastable(light, ZeusExtended.ManaPoint) then Ability.CastTarget(light, npc) return end
				end
			end
		end
	end	
end

return ZeusExtended