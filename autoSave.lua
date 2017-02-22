local autoSave = {}

autoSave.option = Menu.AddOption({"Awareness","Auto Save"},"Active", "Enable/Disable AutoSave")
autoSave.option2 = Menu.AddOption({"Awareness","Auto Save"}, "HP <", "Count HP for use Save", 250, 1250, 50)
autoSave.option3 = Menu.AddOption({"Awareness","Auto Save"},"Cancel Debuff", "Enable/Disable Cancel Debuff")
autoSave.itemGlimmerCape = Menu.AddOption({"Awareness","Auto Save"},"Use Glimmer Cape" ,"On/Off")
autoSave.itemLotusOrb = Menu.AddOption({"Awareness","Auto Save"},"Use Lotus Orb" ,"On/Off")
autoSave.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

function autoSave.OnUpdate()
	if not Menu.IsEnabled(autoSave.option) then return end
	
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	
	local skill1 = NPC.GetAbilityByIndex(myHero, 0)
	local skill2 = NPC.GetAbilityByIndex(myHero, 1)
	local skill3 = NPC.GetAbilityByIndex(myHero, 2)
	local skill4 = NPC.GetAbilityByIndex(myHero, 3)
	local skill5 = NPC.GetAbilityByIndex(myHero, 4)
	local skill6 = NPC.GetAbilityByIndex(myHero, 5)
	local skill7 = NPC.GetAbilityByIndex(myHero, 6)
	local glimmer_cape = NPC.GetItem( myHero, "item_glimmer_cape", true)
	local lotusOrb = NPC.GetItem( myHero, "item_lotus_orb", true)
	local myMana = NPC.GetMana(myHero)
	
	local myTeam =  Entity.GetTeamNum(myHero)
	
	local hero = Input.GetNearestHeroToCursor( Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_FRIEND)
	
	local units = 0 
	if NPC.GetUnitName(myHero) == "npc_dota_hero_dazzle" and skill2 ~= nil then
		units = Ability.GetLevelSpecialValueFor(skill2, "range_tooltip") + NPC.GetCastRangeBonus(myHero) - 1
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_oracle" and skill4 ~= nil then
		units = 1000 + NPC.GetCastRangeBonus(myHero) - 1
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_omniknight" and skill1 ~= nil then
		units = 575 + NPC.GetCastRangeBonus(myHero) - 1
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_abaddon" and skill2 ~= nil then
		units = 500 + NPC.GetCastRangeBonus(myHero) - 1
	elseif Menu.IsEnabled(autoSave.itemGlimmerCape) and glimmer_cape ~= nil then
		units = 900 + NPC.GetCastRangeBonus(myHero) - 1
	elseif Menu.IsEnabled(autoSave.itemLotusOrb) and lotusOrb ~= nil then
		units = 900 + NPC.GetCastRangeBonus(myHero) - 1
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_legion_commander" and Menu.IsEnabled(autoSave.option3) and skill2 ~= nil then
		units = 800 + NPC.GetCastRangeBonus(myHero) - 1
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_treant" and skill3 ~= nil then
		units = 99999
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_chen" and skill5 ~= nil then
		units = 99999
	end
	
	
	local friendlyHero = NPC.GetHeroesInRadius(myHero, units, Enum.TeamType.TEAM_FRIEND)
	for key,value in ipairs(friendlyHero) do
		local health =  Entity.GetHealth(value)
		if health <= Menu.GetValue(autoSave.option2) then
			if NPC.GetUnitName(myHero) == "npc_dota_hero_dazzle" and skill2 ~= nil and Ability.IsCastable(skill2, myMana) then
				Ability.CastTarget(skill2, value, true)
			elseif  NPC.GetUnitName(myHero) == "npc_dota_hero_oracle" and skill4 ~= nil and  Ability.IsCastable(skill4, myMana) then
				Ability.CastTarget(skill4, value, true)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_abaddon" and skill2 ~= nil and Ability.IsCastable(skill2, myMana) then
				Ability.CastTarget(skill2, value, true)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_omniknight" and skill1 ~= nil and Ability.IsCastable(skill1, myMana) then
				Ability.CastTarget(skill1, value, true)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_treant" and skill3 ~= nil and Ability.IsCastable(skill3, myMana) then
				Ability.CastTarget(skill3, value, true)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_chen" and skill5 ~= nil and Ability.IsCastable(skill5, myMana) then
				Ability.CastNoTarget(skill5, true)
			elseif Menu.IsEnabled(autoSave.itemGlimmerCape) and glimmer_cape ~= nil and Ability.IsCastable(glimmer_cape, myMana) then
				Ability.CastTarget(glimmer_cape, value, true)
			end
		elseif NPC.IsStunned(value) or NPC.IsSilenced(value) then
			if NPC.GetUnitName(myHero) == "npc_dota_hero_legion_commander" and skill2 ~= nil and Ability.IsCastable(skill2, myMana) then
				Ability.CastTarget(skill2, value, true)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_abaddon" and skill2 ~= nil and Ability.IsCastable(skill2, myMana) then
				Ability.CastTarget(skill2, value, true)
			elseif Menu.IsEnabled(autoSave.itemLotusOrb) and not NPC.IsStunned(value) and lotusOrb ~= nil and Ability.IsCastable(lotusOrb, myMana) then
				Ability.CastTarget(lotusOrb, value, true)
			end
		end
	end
end

return autoSave