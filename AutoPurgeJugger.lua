--Author: spiregor
local AutoPurge = {}

AutoPurge.optionEnable = Menu.AddOption({"Hero Specific","Juggernaut"},"Enabled","Auto Dispel")

function AutoPurge.OnUpdate()
    if not Menu.IsEnabled(AutoPurge.optionEnable) then return true end
	--if Menu.IsKeyDown(AutoPurge.optionKey)then
    AutoPurge.Combo()
	--end
end	

function AutoPurge.Combo()
    local myHero = Heroes.GetLocal()
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_juggernaut" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	local heroPos = Entity.GetAbsOrigin(hero)
	local myMana = NPC.GetMana(myHero)
			
	if not hero then return end
	
	local Omnislash = NPC.GetAbility(myHero, "juggernaut_omni_slash")
	local Diffus = NPC.GetItem(myHero, "item_diffusal_blade", true)
	if not Diffus then
		for i = 2, 2 do
			Diffus = NPC.GetItem(myHero, "item_diffusal_blade_" .. i, true)
			if Diffus then break end
		end
	end	 
	
	if Menu.IsEnabled(AutoPurge.optionEnable) and NPC.HasModifier(myHero, "modifier_juggernaut_omnislash_invulnerability") and 
	 (NPC.HasModifier(hero, "modifier_ghost_state") or 
	   NPC.HasModifier(hero, "modifier_eul_cyclone") or 
	   NPC.HasModifier(hero, "modifier_item_ethereal_blade_ethereal") or
	   NPC.HasModifier(hero, "modifier_necrolyte_sadist_active")or
	   NPC.HasModifier(hero, "modifier_omninight_guardian_angel") or
	   NPC.HasModifier(hero, "modifier_pugna_decrepify") or
	   NPC.HasModifier(hero, "modifier_item_glimmer_cape_fade")) then
		   
	   if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(hero)
	   and Diffus and Ability.IsCastable(Diffus, 0) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Diffus)) then Ability.CastTarget(Diffus, hero) return end
	end
end
return AutoPurge	   