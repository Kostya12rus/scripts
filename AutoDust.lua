--Author: spiregor
local AutoDust = {}

AutoDust.IsToggled = Menu.AddOption( {"Utility"}, "Auto Dust", "")
AutoDust.sleepers = {}
AutoDust.Modifiers = { 
--Enemy modifier
[0] = "modifier_bounty_hunter_wind_walk", 
[1] = "", 
[2] = "modifier_mirana_moonlight_shadow", 
[3] = "modifier_weaver_shukuchi", 
[4] = "modifier_broodmother_spin_web_invisible_applier", 
[5] = "modifier_clinkz_wind_walk", 
[6] = "modifier_treant_natures_guise_invis", 
[7] = "modifier_item_invisibility_edge_windwalk", 
[8] = "modifier_item_silver_edge_windwalk",
[9] = "modifier_item_glimmer_cape_fade",
[10] = "modifier_item_shadow_amulet_fade",
[11] = "modifier_rune_invis",
[12] = "modifier_windrunner_windrun_invis",
[13] = "modifier_invoker_ghost_walk_enemy",

--Allies modifier
[14] = "modifier_bounty_hunter_track",
[15] = "modifier_bloodseeker_thirst_vision",
[16] = "modifier_slardar_amplify_damage",
[17] = "modifier_item_dustofappearance"


 }
 
 AutoDust.Unique = {}
 
 AutoDust.skills =
{
    {  
        name = "nyx_assassin_vendetta_start",
		ability = "nyx_assassin_vendetta",
		duration = 2
    },
	{  
        name = "sandking_sandstorm",
		ability = "sandking_sand_storm",
		duration = 2
    }
}
function AutoDust.InsertNyx(particle)
    local myHero = Heroes.GetLocal()
    for i, enemyAbility in ipairs(AutoDust.skills) do
		if particle.name == enemyAbility.name then
		    local enemy = nil
            local ally = nil
            for i = 1, Heroes.Count() do
                local hero = Heroes.Get(i)
                if not NPC.IsIllusion(hero) then
                    local sameTeam = Entity.GetTeamNum(hero) == Entity.GetTeamNum(myHero)
                    if not sameTeam and NPC.GetAbility(hero, enemyAbility.ability) and not NPC.GetAbility(myHero, enemyAbility.ability) then
                        enemy = hero
                    end
                    if sameTeam and NPC.GetAbility(hero, enemyAbility.ability) then
                        ally = hero
                    end
                end
            end
            local newAlert = {
                index = particle.index,
                name = enemyAbility.name,
				endTime = os.clock() + enemyAbility.duration
             }
            if enemy then
                newAlert['enemy'] = NPC.GetUnitName(enemy)
                table.insert(AutoDust.Unique, newAlert)
            end 
            if ally then return end
            return true
        end
    end

    return false
end
 
function AutoDust.OnParticleCreate(particle)
    if not Menu.IsEnabled(AutoDust.IsToggled) then return end
	AutoDust.InsertNyx(particle)
end

function AutoDust.OnParticleUpdate(particle)
    if particle.controlPoint ~= 0 then return end
    for k, alert in ipairs(AutoDust.Unique) do
        if particle.index == alert.index then
            alert.position = particle.position
        end
    end
end

function AutoDust.OnUpdate()
    local hero = Heroes.GetLocal()
	local player = Players.GetLocal()
	if not hero or not Menu.IsEnabled(AutoDust.IsToggled) or not AutoDust.SleepCheck(0.1, "updaterate") or not Entity.IsAlive(hero) then return end
	local dust = NPC.GetItem(hero, "item_dust", true)
	if not dust or not Ability.IsReady(dust) or not Ability.IsCastable(dust, 0) then return end
	local target = AutoDust.FindTarget(hero, dust)
	if (NPC.IsEntityInRange(hero, target, 1000) and not NPC.IsChannellingAbility(hero) and not NPC.HasModifier(target, "modifier_truesight") and (not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) or NPC.HasModifier(hero,"modifier_riki_permanent_invisibility"))) and not NPC.HasModifier(target,"modifier_riki_tricks_of_the_trade_phase") or (NPC.HasModifier(hero, AutoDust.Modifiers[12])) then
	Ability.CastNoTarget(dust)	
	AutoDust.Sleep(0.1, "updaterate");
	end
	for i, alert in ipairs(AutoDust.Unique) do
		local timeLeft = alert.endTime - os.clock()
        if timeLeft < 0 then
        table.remove(AutoDust.Unique, i)
		 elseif alert.enemy and NPC.IsPositionInRange(hero, alert.position, 1000) and not NPC.IsChannellingAbility(hero) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
		 Ability.CastNoTarget(dust)	
		 AutoDust.Sleep(0.1, "updaterate");
		end
	end
	for i = 1, Heroes.Count() do
        local TAhero = Heroes.Get(i)
	    local TA = NPC.GetUnitName(TAhero)=="npc_dota_hero_templar_assassin"
	    if TA and NPC.IsEntityInRange(hero, TAhero, 1000) and (Entity.GetHealth(TAhero)/Entity.GetMaxHealth(TAhero)<0.3) and not NPC.IsChannellingAbility(hero) and not NPC.HasModifier(TAhero, "modifier_truesight") and not NPC.IsIllusion(TAhero) and not Entity.IsSameTeam(hero, TAhero) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
	    Ability.CastNoTarget(dust)	
	    AutoDust.Sleep(0.1, "updaterate");
	    end
	end	
end

function AutoDust.FindTarget(me, item)
	for _, enemyhero in pairs(Heroes.GetAll()) do
		if not Entity.IsSameTeam(me, enemyhero) and not NPC.IsIllusion(enemyhero) and NPC.IsEntityInRange(me, enemyhero, 1050) and Entity.IsAlive(enemyhero) then
			local isNotValid = AutoDust.CheckForModifiers(enemyhero)
			local isPosValid = AutoDust.CheckForPositiveModifiers(enemyhero)
			local riki_invis = NPC.GetAbility(enemyhero,"riki_permanent_invisibility")
			if riki_invis and Ability.GetLevel(riki_invis) ~= 0 and Ability.GetCooldownTimeLeft(riki_invis) <= 1 and isPosValid then 
				return enemyhero 
			end
			if not isNotValid and isPosValid then 
				return enemyhero 
			end
		end
	end
end
--NegativeModifiers
function AutoDust.CheckForModifiers(target)
	 for i=0,12 do
		if NPC.HasModifier(target, AutoDust.Modifiers[i]) then
			return false
		end
	end
	return true
end
--PositiveModifiers
function AutoDust.CheckForPositiveModifiers(target)
	 for i=14,17 do
		if NPC.HasModifier(target, AutoDust.Modifiers[i]) then
			return false
		end
	end
	return true	

end

function AutoDust.SleepCheck(delay, id)
	if not AutoDust.sleepers[id] or (os.clock() - AutoDust.sleepers[id]) > delay then
		return true
	end
	return false
end

function AutoDust.Sleep(delay, id)
	if not AutoDust.sleepers[id] or AutoDust.sleepers[id] < os.clock() + delay then
		AutoDust.sleepers[id] = os.clock() + delay
	end
end

return AutoDust
