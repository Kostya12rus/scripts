local antimageUlt = {}

antimageUlt.optionEnabled = Menu.AddOption({"Hero Specific","Anti-Mage"},"Enable ult 2", "on/off")
antimageUlt.optionSee = Menu.AddOption({"Hero Specific","Anti-Mage"},"See Target For Ult?", "on/off")
antimageUlt.font = Renderer.LoadFont("Arial", 22, Enum.FontWeight.EXTRABOLD)

function antimageUlt.OnDraw()
	if not Menu.IsEnabled(antimageUlt.optionEnabled) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_antimage" then return end
	local myMana = NPC.GetMana(myHero)
	
	
	local skillManaVoid = NPC.GetAbilityByIndex(myHero, 3)
	local rangeManaVoid = 600--Ability.GetLevelSpecialValueFor(skillManaVoid, "mana_void_aoe_radius")
	local rangeTargetManaVoid = Ability.GetLevelSpecialValueFor(skillManaVoid, "mana_void_aoe_radius")
	local damageManaVoid = Ability.GetLevelSpecialValueFor(skillManaVoid, "mana_void_damage_per_mana")
	
	local unitsAround = NPC.GetHeroesInRadius(myHero, rangeManaVoid, Enum.TeamType.TEAM_ENEMY)
	
	if not Ability.IsCastable(skillManaVoid, myMana) then return end
	for key,value in ipairs(unitsAround) do
		if not NPC.IsLinkensProtected(value) then
			local index = Entity.GetIndex(value)
			local enemyMana = NPC.GetMana(value)
			local enemyMaxMana = NPC.GetMaxMana(value)
			local unitsAroundTarget = NPC.GetHeroesInRadius(value, rangeTargetManaVoid - 80, Enum.TeamType.TEAM_FRIEND)
			Log.Write(#unitsAroundTarget)
			for number,target in ipairs(unitsAroundTarget) do
				local enemyHp = Entity.GetHealth(target)
				local damage = (damageManaVoid * (enemyMaxMana - enemyMana)) - (damageManaVoid * (enemyMaxMana - enemyMana)) * NPC.GetMagicalArmorValue(value)
				if damage >= enemyHp and not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastTarget(skillManaVoid, value, true)
				end
			end
		end
	end
	if not Menu.IsEnabled(antimageUlt.optionSee) then return end
	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		if not NPC.IsLinkensProtected(hero) then
			local sameTeam =  Entity.GetTeamNum(hero) == myTeam	
			local pos = NPC.GetAbsOrigin(hero)
			local x, y, visible = Renderer.WorldToScreen(pos)
			local enemyMana = NPC.GetMana(hero)
			local enemyMaxMana = NPC.GetMaxMana(hero)
			local unitsAroundCheck = NPC.GetHeroesInRadius(hero, rangeTargetManaVoid, Enum.TeamType.TEAM_FRIEND)
			for number,target in ipairs(unitsAroundCheck) do
				local enemyHp = Entity.GetHealth(target)
				local damage = (damageManaVoid * (enemyMaxMana - enemyMana)) - (damageManaVoid * (enemyMaxMana - enemyMana)) * NPC.GetMagicalArmorValue(target)
				local pos_victim = NPC.GetAbsOrigin(target)
				local x_victim, y_victim, visible_victim = Renderer.WorldToScreen(pos_victim)
				if damage >=  enemyHp and not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Renderer.SetDrawColor(0, 255, 0, 255)
					Renderer.DrawTextCentered(antimageUlt.font, x, y,"TARGET", 255)
					Renderer.SetDrawColor(255, 22, 0, 255)
					Renderer.DrawTextCentered(antimageUlt.font, x_victim, y_victim,"KILL", 255)
				end
			end
		end
	end
end
return antimageUlt
