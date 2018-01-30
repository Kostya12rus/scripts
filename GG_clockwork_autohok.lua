local gg_clockwork = {}

gg_clockwork.is_enable = Menu.AddOption({"General Goblin", "Clockwork"}, "Enabled", "")
gg_clockwork.HOOK_KEY = Menu.AddKeyOption({"General Goblin", "Clockwork"}, "hook key", Enum.ButtonCode.KEY_F)

gg_clockwork.lastTick = 0

function gg_clockwork.OnUpdate()
	if not Menu.IsEnabled(gg_clockwork.is_enable) then return true end
	gg_clockwork.AutoHook()
end

function gg_clockwork.AutoHook()
	local myHero = Heroes.GetLocal()
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_rattletrap" then return end
	local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if not enemy then return end

	local HookShot = NPC.GetAbility(myHero, "rattletrap_hookshot")
	local myMana = NPC.GetMana(myHero)

	local cogsTargeter
	if NPC.IsRunning(enemy) then
		cogsTargeter = 100
	else
		cogsTargeter = 200
	end

	if gg_clockwork.clockwerkHookshotChecker(myHero, myMana, enemy, HookShot) == true then
		gg_clockwork.clockwerkHookUpValue = true
	else
		gg_clockwork.clockwerkHookUpValue = false
	end

	if Menu.IsKeyDown(gg_clockwork.HOOK_KEY) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and gg_clockwork.heroCanCastSpells(myHero, enemy) == true then
		if not NPC.IsEntityInRange(myHero, enemy, cogsTargeter) then
			if HookShot and Ability.IsCastable(HookShot, myMana) and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(HookShot)) and gg_clockwork.clockwerkHookUpValue == true then
				local hookshotPrediction = Ability.GetCastPoint(HookShot) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / Ability.GetLevelSpecialValueFor(HookShot, "speed")) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(HookShot, gg_clockwork.castLinearPrediction(myHero, enemy, hookshotPrediction))
				gg_clockwork.lastTick = os.clock()
				return
			end
		end
	end
end

function gg_clockwork.clockwerkHookshotChecker(myHero, myMana, enemy, HookShot)

	if not myHero then return false end
	if not enemy then return false end

	if not HookShot then return false end
	if not Ability.IsReady(HookShot) or not Ability.IsCastable(HookShot, myMana) then return false end

	local latchRadius = 135
	local distance = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() - 125
	if distance < 75 then return false end
	if distance + 150 > Ability.GetCastRange(HookShot) then return false end

	if #Entity.GetUnitsInRadius(myHero, 125, Enum.TeamType.TEAM_BOTH) > 0 then return false end

	for i = 2, math.floor(distance / latchRadius) do
		local checkVec = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized()
		local checkPos = Entity.GetAbsOrigin(myHero) + checkVec:Scaled(i*latchRadius)
		if #NPCs.InRadius(checkPos, latchRadius, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_BOTH) > 0 then
			return false
		end
	end

	return true

end

function gg_clockwork.heroCanCastSpells(myHero, enemy)

	if not myHero then return false end
	if not Entity.IsAlive(myHero) then return false end

	if NPC.IsSilenced(myHero) then return false end 
	if NPC.IsStunned(myHero) then return false end
	if NPC.HasModifier(myHero, "modifier_bashed") then return false end
	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then return false end	
	if NPC.HasModifier(myHero, "modifier_eul_cyclone") then return false end
	if NPC.HasModifier(myHero, "modifier_obsidian_destroyer_astral_imprisonment_prison") then return false end
	if NPC.HasModifier(myHero, "modifier_shadow_demon_disruption") then return false end	
	if NPC.HasModifier(myHero, "modifier_invoker_tornado") then return false end
	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_HEXED) then return false end
	if NPC.HasModifier(myHero, "modifier_legion_commander_duel") then return false end
	if NPC.HasModifier(myHero, "modifier_axe_berserkers_call") then return false end
	if NPC.HasModifier(myHero, "modifier_winter_wyvern_winters_curse") then return false end
	if NPC.HasModifier(myHero, "modifier_bane_fiends_grip") then return false end
	if NPC.HasModifier(myHero, "modifier_bane_nightmare") then return false end
	if NPC.HasModifier(myHero, "modifier_faceless_void_chronosphere_freeze") then return false end
	if NPC.HasModifier(myHero, "modifier_enigma_black_hole_pull") then return false end
	if NPC.HasModifier(myHero, "modifier_magnataur_reverse_polarity") then return false end
	if NPC.HasModifier(myHero, "modifier_pudge_dismember") then return false end
	if NPC.HasModifier(myHero, "modifier_shadow_shaman_shackles") then return false end
	if NPC.HasModifier(myHero, "modifier_techies_stasis_trap_stunned") then return false end
	if NPC.HasModifier(myHero, "modifier_storm_spirit_electric_vortex_pull") then return false end
	if NPC.HasModifier(myHero, "modifier_tidehunter_ravage") then return false end
	if NPC.HasModifier(myHero, "modifier_windrunner_shackle_shot") then return false end
	if NPC.HasModifier(myHero, "modifier_item_nullifier_mute") then return false end

	if enemy then
		if NPC.HasModifier(enemy, "modifier_item_aeon_disk_buff") then return false end
	end

	return true

end

function gg_clockwork.castLinearPrediction(myHero, enemy, adjustmentVariable)

	if not myHero then return end
	if not enemy then return end

	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)


	local cosGamma = (NPC.GetAbsOrigin(myHero) - enemyOrigin):Dot2D(enemyRotation:Scaled(100)) / ((NPC.GetAbsOrigin(myHero) - enemyOrigin):Length2D() * enemyRotation:Scaled(100):Length2D())
		if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(gg_clockwork.GetMoveSpeed(enemy) * adjustmentVariable * (1 - cosGamma)))
			end
		end
end

function gg_clockwork.GetMoveSpeed(enemy)

	if not enemy then return end

	local base_speed = NPC.GetBaseSpeed(enemy)
	local bonus_speed = NPC.GetMoveSpeed(enemy) - NPC.GetBaseSpeed(enemy)
	local modifierHex
    	local modSheep = NPC.GetModifier(enemy, "modifier_sheepstick_debuff")
    	local modLionVoodoo = NPC.GetModifier(enemy, "modifier_lion_voodoo")
    	local modShamanVoodoo = NPC.GetModifier(enemy, "modifier_shadow_shaman_voodoo")

	if modSheep then
		modifierHex = modSheep
	end
	if modLionVoodoo then
		modifierHex = modLionVoodoo
	end
	if modShamanVoodoo then
		modifierHex = modShamanVoodoo
	end

	if modifierHex then
		if math.max(Modifier.GetDieTime(modifierHex) - GameRules.GetGameTime(), 0) > 0 then
			return 140 + bonus_speed
		end
	end

    	if NPC.HasModifier(enemy, "modifier_invoker_ice_wall_slow_debuff") then 
		return 100 
	end

	if NPC.HasModifier(enemy, "modifier_invoker_cold_snap_freeze") or NPC.HasModifier(enemy, "modifier_invoker_cold_snap") then
		return (base_speed + bonus_speed) * 0.5
	end

	if NPC.HasModifier(enemy, "modifier_spirit_breaker_charge_of_darkness") then
		local chargeAbility = NPC.GetAbility(enemy, "spirit_breaker_charge_of_darkness")
		if chargeAbility then
			local specialAbility = NPC.GetAbility(enemy, "special_bonus_unique_spirit_breaker_2")
			if specialAbility then
				 if Ability.GetLevel(specialAbility) < 1 then
					return Ability.GetLevel(chargeAbility) * 50 + 550
				else
					return Ability.GetLevel(chargeAbility) * 50 + 1050
				end
			end
		end
	end

	return base_speed + bonus_speed
end

return gg_clockwork
