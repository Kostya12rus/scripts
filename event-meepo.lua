local font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
local Meepo = {}
Meepo.optionHero = Menu.AddOption({ "Utility", "[Meepo bot]" }, "Enable", "Meepo bot controls your hero also..")
Meepo.List = {}
Meepo.CampsClean = {}
Meepo.TEAM = nil
Meepo.TEAM_CONTAIN = 'radiant'

Meepo.NPC = 0
Meepo.THINK = 1
Meepo.LAST_THINK = 2

Meepo.THINK_IDLE = 0
Meepo.THINK_MOVE = 1
Meepo.THINK_ATTACK = 2
Meepo.THINK_HEAL = 3

-- forest special
Meepo.THINK_FOREST = 4
Meepo.THINK_STACK = 5
Meepo.THINK_GOLD_RUNE = 6
-- Meepo.THINK_ATTACK_POOF = 7

-- attack special
Meepo.THINK_VISION_ATTACK = 8
Meepo.THINK_DEFEND = 9
Meepo.THINK_POOF_STRIKE = 10
Meepo.THINK_TEAMFIGHT = 11


function Meepo.OnUpdate()

    if not Event.InGame then return end
    local myHero = Heroes.GetLocal()
    if not myHero then return end
    if not Meepo.TEAM then
        Meepo.TEAM = Entity.GetTeamNum(myHero)
        if Meepo.TEAM == 3 then
            Meepo.TEAM_CONTAIN = 'dire'
        end
        Log.Write(Meepo.TEAM_CONTAIN)
    end

    local health = Entity.GetHealth(myHero)

    if health <= 0.0 then return end

    -- if MeepoList is empty and myHero.string == meepo, there was a RESET.

    local time = os.time()
    local meepo_count = 0
    for i, entity in pairs(Meepo.List) do
        Meepo.Decision(entity, time)
        Meepo.think(entity, time)
        meepo_count = meepo_count + 1
    end

    if (GameRules.GetGameTime() - GameRules.GetGameStartTime()) / 60 % 1 < 0.01 then
        Meepo.CampsClean = {}
    end


    -- dota_item_rune

    if meepo_count < 1 then
        local ability = NPC.GetAbility(myHero, "meepo_divided_we_stand")
        if Ability.GetLevel(ability) > 0 then
            for i = 1, NPCs.Count() do 
                local npc = NPCs.Get(i)
                local name = NPC.GetUnitName(npc)
                if name ~= nil and Entity.IsSameTeam(myHero, npc) and Entity.GetHealth(npc) > 0 then
                    if name == 'npc_dota_hero_meepo' then
                        if not Menu.IsEnabled(Meepo.optionHero) and myHero == npc then
                            --
                        else
                            local i = Entity.GetIndex(npc)
                            Meepo.List[i] = {}
                            Meepo.List[i][Meepo.NPC] = npc
                            Meepo.List[i][Meepo.THINK] = Meepo.THINK_IDLE
                            Meepo.List[i][Meepo.LAST_THINK] = os.time()
                        end
                    end
                end
            end
        end
    end

end


function Meepo.OnDraw()

    if not Event.InGame then
        return
    end

    local size = 30
    for i, item in pairs(Meepo.List) do
        local npc = item[Meepo.NPC]
        local origin = Entity.GetAbsOrigin(npc)
        local x, y, visible = Renderer.WorldToScreen(origin)
        Renderer.SetDrawColor(255, 215, 0, 255)
        Renderer.DrawText(font, x-size, y-size, Meepo.DebugThink(item), 1)
    end

end


function Meepo.DebugThink(entity)
    if entity[Meepo.THINK] == Meepo.THINK_IDLE then
        return 'IDLE'
    end
    if entity[Meepo.THINK] == Meepo.THINK_MOVE then
        return 'MOVE'
    end
    if entity[Meepo.THINK] == Meepo.THINK_ATTACK then
        return 'ATTACK'
    end
    if entity[Meepo.THINK] == Meepo.THINK_HEAL then
        return 'HEAL'
    end
    if entity[Meepo.THINK] == Meepo.THINK_STACK then
        return 'STACK'
    end
    if entity[Meepo.THINK] == Meepo.THINK_GOLD_RUNE then
        return 'GOLD'
    end
    if entity[Meepo.THINK] == Meepo.THINK_POOF_STRIKE then
        return 'POOF STRIKE'
    end
    if entity[Meepo.THINK] == Meepo.THINK_FOREST then
        return 'FOREST'
    end
    if entity[Meepo.THINK] == Meepo.THINK_VISION_ATTACK then
        return 'VISION ATTACK'
    end
    if entity[Meepo.THINK] == Meepo.THINK_TEAMFIGHT then
        return 'TEAMFIGHT'
    end
    return 'X'
end


Event:on('spawn', function(ent)

    local myHero = Heroes.GetLocal()
    if not myHero then return end

    local name = NPC.GetUnitName(npc)
    if name ~= 'npc_dota_hero_meepo' then return end
    if not Menu.IsEnabled(Meepo.optionHero) and myHero == ent then return end

    local i = Entity.GetIndex(ent)

    Meepo.List[i] = {}
    Meepo.List[i][Meepo.NPC] = ent
    Meepo.List[i][Meepo.THINK] = Meepo.THINK_IDLE
    Meepo.List[i][Meepo.LAST_THINK] = os.time()

end)


Event:on('reset', function()
    Meepo.List = {}
end)


Event:on('invalid', function(ent)
    local i = Entity.GetIndex(ent)
    if Meepo.List[i] ~= nil then
        Meepo.List[i] = nil
    end
end)


Event:on('death', function(ent)
    local i = Entity.GetIndex(ent)
    if Meepo.List[i] ~= nil then
        Meepo.List[i] = nil
    end
end)


Event:on('respawn', function(ent)

    local myHero = Heroes.GetLocal()
    if not myHero then return end

    local name = NPC.GetUnitName(npc)
    if name ~= 'npc_dota_hero_meepo' then return end
    if not Menu.IsEnabled(Meepo.optionHero) and  myHero == ent then return end

    local i = Entity.GetIndex(ent)

    Meepo.List[i] = {}
    Meepo.List[i][Meepo.NPC] = ent
    Meepo.List[i][Meepo.THINK] = Meepo.THINK_IDLE
    Meepo.List[i][Meepo.LAST_THINK] = os.time()

end)


Event:on('trace_damage', function(ent, damage)
    local i = Entity.GetIndex(ent)
    if Meepo.List[i] ~= nil then
        Log.Write('WTF?!?!?!')
        -- check for enemy hero, that's a gank or must escape situation!!!!!
        -- if damage > 80
        if damage > 800 then
            -- ESCAAAAPE
        else
            if Entity.GetHealth(ent) < 150 then
                Meepo.List[i][Meepo.THINK] = Meepo.THINK_HEAL
            end
        end
    end
end)


function Meepo.Decision(entity, time)

    if time < entity[Meepo.LAST_THINK] then return end

    -- attack closest enemies
    local DISTANCE_ENEMY = 950
    local DISTANCE_DANGER = 1200

    local origin = Entity.GetAbsOrigin(entity[Meepo.NPC])
    local creeps = NPC.GetUnitsInRadius(entity[Meepo.NPC], DISTANCE_ENEMY, Enum.TeamType.TEAM_ENEMY)
    local min_distance = 1500
    local min_distance_hero = 1200
    local target = nil
    local hero_target = nil
    if not NPC.HasModifier(entity[Meepo.NPC], "modifier_fountain_aura_buff") then
        for i, npc in ipairs(creeps) do
            local target_origin = Entity.GetAbsOrigin(npc)
            local distance = (origin - target_origin):Length()
            if not Entity.IsDormant(npc) and Entity.GetHealth(npc) > 0 and NPC.IsKillable(npc) then
                if NPC.IsLaneCreep(npc) or NPC.IsHero(npc) or NPC.IsStructure(npc) then
                    if NPC.IsHero(npc) and distance < min_distance_hero then
                        min_distance_hero = distance
                        hero_target = npc
                    end
                    if distance < min_distance then
                        target = npc
                        min_distance = distance
                        if NPC.IsHero(npc) and distance < 1200 then
                            -- entity[Meepo.THINK] = THINK_DEFEND
                            Meepo.Net(entity, target)
                            if distance < 350 and not NPC.IsStructure(npc) then
                                Meepo.PoofStrike(entity)
                            end
                        end
                    end
                end
            end
        end
    end
    if hero_target then
        target = hero_target
    elseif entity[Meepo.THINK] == Meepo.THINK_TEAMFIGHT then
        entity[Meepo.THINK] = Meepo.THINK_VISION_ATTACK
    end
    if target and entity[Meepo.THINK] ~= Meepo.THINK_HEAL then
        entity[Meepo.THINK] = Meepo.THINK_VISION_ATTACK
        if NPC.IsHero(target) then
            entity[Meepo.THINK] = Meepo.THINK_TEAMFIGHT
        end
        Player.AttackTarget(Players.GetLocal(), entity[Meepo.NPC], target)
    elseif not target and entity[Meepo.THINK] == Meepo.THINK_VISION_ATTACK then
        entity[Meepo.THINK] = Meepo.THINK_IDLE
    end

    -- check danger
    if Entity.GetHealth(entity[Meepo.NPC]) * 100 / Entity.GetMaxHealth(entity[Meepo.NPC]) < 43.0 then
        for i = 1, Heroes.Count() do
            local enemy = Heroes.Get(i)
            if not NPC.IsIllusion(enemy) and not Entity.IsSameTeam(entity[Meepo.NPC], enemy) and not Entity.IsDormant(enemy) and Entity.IsAlive(enemy) and (Entity.GetAbsOrigin(entity[Meepo.NPC]) - Entity.GetAbsOrigin(enemy)):Length() < DISTANCE_DANGER then
                entity[Meepo.THINK] = Meepo.THINK_HEAL
            end
        end
    end

    if entity[Meepo.THINK] == Meepo.THINK_IDLE then
        -- 1. Check woods and meepo's level.
        entity[Meepo.THINK] = Meepo.THINK_FOREST
    end

end


function Meepo.FastHeal(entity)

    local origin = Entity.GetAbsOrigin(entity[Meepo.NPC])
    local location = Meepo.BuildingLocation['dire_fountain']
    if Meepo.TEAM ~= 3 then
        location = Meepo.BuildingLocation['radiant_fountain']
    end
    local entity_distance = (origin - location):Length()
    if entity_distance < 1775 then
        return false
    end

    local min_distance = 9999999
    local mana = NPC.GetMana(entity[Meepo.NPC])

    -- use teleport
    local travel = NPC.GetItem(entity[Meepo.NPC], "item_travel_boots", true)
    if travel and Ability.IsCastable(travel, mana) and Ability.IsReady(travel) and Meepo.IsSuitableToCastSpell(entity[Meepo.NPC]) then
        local target = 0
        Ability.CastPosition(travel, location)
        return true
    end
    -- check targets for poof
    local spell = NPC.GetAbility(entity[Meepo.NPC], "meepo_poof")
    if spell and Ability.IsCastable(spell, mana) and Ability.IsReady(spell) and Meepo.IsSuitableToCastSpell(entity[Meepo.NPC]) then
        for i = 1, NPCs.Count() do 
            local npc = NPCs.Get(i)
            local name = NPC.GetUnitName(npc)
            if name ~= nil and Entity.IsSameTeam(entity[Meepo.NPC], npc) and Entity.GetHealth(npc) > 0 then
                if name == 'npc_dota_hero_meepo' and entity[Meepo.NPC] ~= npc then
                    local target_origin = Entity.GetAbsOrigin(npc)
                    local distance = (location - target_origin):Length()
                    if min_distance > distance and entity_distance < distance then
                        min_distance = distance
                        target = npc
                    end
                end
            end
        end
        if target then
            Ability.CastTarget(spell, target)
            return true
        end
    end

    return false

end


function Meepo.Net(entity, target)
    local spell = NPC.GetAbility(entity[Meepo.NPC], "meepo_earthbind")
    if not spell or not Ability.IsCastable(spell, NPC.GetMana(entity[Meepo.NPC])) then return end

    local range = Ability.GetCastRange(spell)
    local radius = 220

    local enemies = NPC.GetUnitsInRadius(entity[Meepo.NPC], range+radius, Enum.TeamType.TEAM_ENEMY)
    if not enemies or #enemies <= 0 then return end

    local vec1 = Entity.GetAbsOrigin(target)
    local vec2 = Meepo.GetPredictedPosition(target, 1.2)
    local mid = (vec1 + vec2):Scaled(0.5)

    if NPC.IsPositionInRange(entity[Meepo.NPC], mid, range, 0) and Meepo.CanNet(target) then
        Ability.CastPosition(spell, mid)
        return
    end

end


function Meepo.PoofStrike(entity)
    for i, item in pairs(Meepo.List) do
        local npc = item[Meepo.NPC]
        if item == entity then
            --
        else
            local health = Entity.GetHealth(item[Meepo.NPC])
            local mana = NPC.GetMana(item[Meepo.NPC])
            local spell = NPC.GetAbility(item[Meepo.NPC], "meepo_poof")
            if health * 100 / Entity.GetMaxHealth(entity[Meepo.NPC]) > 45.0 and mana > 80 * 2 and Ability.IsCastable(spell, mana) and Ability.IsReady(spell) and Meepo.IsSuitableToCastSpell(item[Meepo.NPC]) then
                Ability.CastTarget(spell, entity[Meepo.NPC])
                entity[Meepo.LAST_THINK] = os.time() + 1.5
                if entity[Meepo.THINK] ~= Meepo.THINK_HEAL then
                    entity[Meepo.THINK] = Meepo.THINK_POOF_STRIKE
                end
                Meepo.sleep(0.03)
            end
        end
    end
end


function Meepo.GetPredictedPosition(npc, delay)
    local pos = Entity.GetAbsOrigin(npc)
    if not NPC.IsRunning(npc) or not delay then return pos end
    local totalLatency = (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) -- * 2 -- this may fix bot is not stopping at high ping
    delay = delay + totalLatency

    local dir = Entity.GetRotation(npc):GetForward():Normalized()
    local speed = Meepo.GetMoveSpeed(npc)

    return pos + dir:Scaled(speed * delay)
end


function Meepo.GetMoveSpeed(npc)
    local base_speed = NPC.GetBaseSpeed(npc)
    local bonus_speed = NPC.GetMoveSpeed(npc) - NPC.GetBaseSpeed(npc)

    return base_speed + bonus_speed
end


function Meepo.CanNet(target)
    local stunRootList = {
        "modifier_stunned",
        "modifier_bashed",
        "modifier_alchemist_unstable_concoction", 
        "modifier_ancientapparition_coldfeet_freeze", 
        "modifier_axe_berserkers_call",
        "modifier_bane_fiends_grip",
        "modifier_bane_nightmare",
        "modifier_bloodseeker_rupture",
        "modifier_rattletrap_hookshot", 
        "modifier_earthshaker_fissure_stun", 
        "modifier_earth_spirit_boulder_smash",
        "modifier_enigma_black_hole_pull",
        "modifier_faceless_void_chronosphere_freeze",
        "modifier_jakiro_ice_path_stun", 
        "modifier_keeper_of_the_light_mana_leak_stun", 
        "modifier_kunkka_torrent", 
        "modifier_legion_commander_duel", 
        "modifier_lion_impale", 
        "modifier_magnataur_reverse_polarity", 
        "modifier_medusa_stone_gaze_stone", 
        "modifier_morphling_adaptive_strike", 
        "modifier_naga_siren_ensnare", 
        "modifier_nyx_assassin_impale", 
        "modifier_pudge_dismember", 
        "modifier_sandking_impale", 
        "modifier_shadow_shaman_shackles", 
        "modifier_techies_stasis_trap_stunned", 
        "modifier_tidehunter_ravage", 
        "modifier_treant_natures_guise",
        "modifier_windrunner_shackle_shot",
        "modifier_rooted", 
        "modifier_crystal_maiden_frostbite", 
        "modifier_ember_spirit_searing_chains", 
        "modifier_meepo_earthbind",
        "modifier_lone_druid_spirit_bear_entangle_effect",
        "modifier_slark_pounce_leash",
        "modifier_storm_spirit_electric_vortex_pull",
        "modifier_treant_overgrowth", 
        "modifier_abyssal_underlord_pit_of_malice_ensare", 
        "modifier_item_rod_of_atos_debuff",
        "modifier_eul_cyclone",
        "modifier_obsidian_destroyer_astral_imprisonment_prison",
        "modifier_shadow_demon_disruption"
            }
    
    local searchMod
    for _, modifier in ipairs(stunRootList) do
        if NPC.HasModifier(target, modifier) then
            searchMod = NPC.GetModifier(target, modifier)
            break
        end
    end

    return not searchMod
end


function Meepo.think(entity, time)

    if time < entity[Meepo.LAST_THINK] then return end

    local health = Entity.GetHealth(entity[Meepo.NPC])

    if health <= 0.0 then return end

    if health * 100 / Entity.GetMaxHealth(entity[Meepo.NPC]) < 20.0 or health < 175 then
        entity[Meepo.THINK] = Meepo.THINK_HEAL
    end

    if entity[Meepo.THINK] == Meepo.THINK_HEAL then
        if health * 100 / Entity.GetMaxHealth(entity[Meepo.NPC]) > 85.0 then
            entity[Meepo.THINK] = Meepo.THINK_IDLE
        else
            local team = Meepo.TEAM
            local location = Meepo.BuildingLocation['dire_fountain']
            if team ~= 3 then
                location = Meepo.BuildingLocation['radiant_fountain']
            end
            if not Meepo.FastHeal(entity) then
                NPC.MoveTo(entity[Meepo.NPC], location)
            end
            entity[Meepo.LAST_THINK] = time + 2.5
            return
        end
    end

    if entity[Meepo.THINK] == Meepo.THINK_FOREST then
        local only_small = 2
        if Entity.GetMaxHealth(entity[Meepo.NPC]) > 820 then
            only_small = 1
        end
        if Entity.GetMaxHealth(entity[Meepo.NPC]) > 1200 then
            only_small = false
        end
        local location = Meepo.ClosestCamp(entity, only_small)
        if location then
            local origin = Entity.GetAbsOrigin(entity[Meepo.NPC])
            NPC.MoveTo(entity[Meepo.NPC], location['origin'])
            if (origin - location['origin']):Length() <= 120 then
                entity[Meepo.THINK] = Meepo.THINK_ATTACK
            end
        else
            Log.Write('no camps...')
        end
    end

    if entity[Meepo.THINK] == Meepo.THINK_ATTACK then
        -- if can cast POOF then DO IT!!! [THINK_ATTACK_POOF]

        local target_range = 500
        local target = nil
        local min_distance = 9999
        local creeps = NPC.GetUnitsInRadius(entity[Meepo.NPC], target_range, Enum.TeamType.TEAM_ENEMY)
        local origin = Entity.GetAbsOrigin(entity[Meepo.NPC])
        for i, npc in ipairs(creeps) do
            local target_origin = Entity.GetAbsOrigin(npc)
            local distance = (origin - target_origin):Length()
            if Entity.GetHealth(npc) > 0 and min_distance > distance then
                target = npc
                min_distance = distance
            end
        end
        if target then
            local origin = Entity.GetAbsOrigin(entity[Meepo.NPC])
            local mana = NPC.GetMana(entity[Meepo.NPC])
            local spell = NPC.GetAbility(entity[Meepo.NPC], "meepo_poof")
            if mana * 100 / NPC.GetMaxMana(entity[Meepo.NPC]) > 50.0 and Ability.IsCastable(spell, mana) and Ability.IsReady(spell) and Meepo.IsSuitableToCastSpell(entity[Meepo.NPC]) then
                Ability.CastTarget(spell, entity[Meepo.NPC])
                -- Ability.CastPosition(spell, origin)
                entity[Meepo.LAST_THINK] = time + 1.5
                return
            end
            Player.AttackTarget(Players.GetLocal(), entity[Meepo.NPC], target)
            entity[Meepo.LAST_THINK] = time + 0.7
            return
        else
            local location = Meepo.ClosestCamp(entity, false, 350)
            if location then
                Meepo.CampCleaned(location) -- clean closest woodcamp if exists
            end
            entity[Meepo.THINK] = Meepo.THINK_IDLE
        end
    end

    entity[Meepo.LAST_THINK] = time + 0.3

end


function Meepo.ClosestCamp(entity, only_small, closest_only)
    local location = nil
    local origin = Entity.GetAbsOrigin(entity[Meepo.NPC])
    local min_distance = 99999
    local camps = Meepo.CampLocation
    if only_small == 1 then
        camps = Meepo.MiniCampLocation
    elseif only_small == 2 then
        camps = Meepo.MicroCampLocation
    end
    if closest_only then
        for i, camp in pairs(camps) do
            if string.match(i, Meepo.TEAM_CONTAIN) then
                -- local distance = (origin - camp):Length()
                -- if distance < min_distance and distance < closest_only then
                --     min_distance = distance
                --     location = camp
                -- end
                if (origin - camp):Length() <= closest_only then
                    location = {
                        name = i,
                        origin = camp,
                    }
                end
            end
        end
    else
        for i, camp in pairs(camps) do
            local distance = (origin - camp):Length()
            if string.match(i, Meepo.TEAM_CONTAIN) then
                if distance < min_distance and not Meepo.isCampCleaned(i) then
                    min_distance = distance
                    location = {
                        name = i,
                        origin = camp,
                    }
                end
            end
        end
    end
    return location
end


function Meepo.CampCleaned(location)
    local name = location['name']
    if Meepo.CampsClean[name] ~= nil then return true end
    Meepo.CampsClean[name] = true
    return true
end


function Meepo.isCampCleaned(location)
    -- for i, val in pairs(Meepo.CampsClean) do
    --     if val == location then
    --         return true
    --     end
    -- end
    if Meepo.CampsClean[location] ~= nil then return true end
    return false
end


Meepo.CampLocation = {
    radiant_ancient_camp_1 = Vector(-2700, -250, 384),
    radiant_ancient_camp_2 = Vector(150, -2000, 384),
    dire_ancient_camp_1 = Vector(-700, 2300, 384),
    dire_ancient_camp_2 = Vector(3600, -700, 256),
    radiant_small_camp = Vector(3250, -4500, 256),
    dire_small_camp = Vector(-3050, 4800, 384),
    radiant_mid_camp_1 = Vector(-3900, 600, 256),
    -- dire_mid_camp_2 = Vector(-1800, 4150, 128),
    radiant_mid_camp_3 = Vector(650, -4600, 384),
    dire_mid_camp_1 = Vector(-1650, 3968, 256),
    --dire_mid_camp_2 = Vector(1100, 3500, 384),
    dire_mid_camp_3 = Vector(2800, 100, 384),
    radiant_large_camp_1 = Vector(-4700, -350, 256),
    radiant_large_camp_2 = Vector(-600, -3300, 256),
    radiant_large_camp_3 = Vector(4500, -4300, 256),
    dire_large_camp_1 = Vector(-4350, 3700, 256),
    dire_large_camp_2 = Vector(-300, 3400, 256),
    dire_large_camp_3 = Vector(4350, 750, 384)
}


Meepo.MiniCampLocation = {
    radiant_small_camp = Vector(3250, -4500, 256),
    dire_small_camp = Vector(-3050, 4800, 384),
    radiant_mid_camp_1 = Vector(-3900, 600, 256),
    -- dire_mid_camp_2 = Vector(-1800, 4150, 128),
    radiant_mid_camp_3 = Vector(650, -4600, 384),
    dire_mid_camp_1 = Vector(-1650, 3968, 256),
    -- dire_mid_camp_2 = Vector(1100, 3500, 384),
    dire_mid_camp_3 = Vector(2800, 100, 384),
}


Meepo.MicroCampLocation = {
    radiant_small_camp = Vector(3250, -4500, 256),
    radiant_mid_camp_1 = Vector(-3900, 600, 256),
    dire_small_camp = Vector(-3050, 4800, 384),
    dire_mid_camp_1 = Vector(-1650, 3968, 256),
}


Meepo.BuildingLocation = {
    radiant_fountain = Vector(-7600, -7300, 640),
    dire_fountain = Vector(7800, 7250, 640)
}


local clock = os.clock
function Meepo.sleep(n)  -- seconds
    local t0 = clock()
    while clock() - t0 <= n do end
end


function Meepo.IsSuitableToCastSpell(myHero)
    if NPC.IsSilenced(myHero) or NPC.IsStunned(myHero) or not Entity.IsAlive(myHero) then return false end
    if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return false end
    if NPC.HasModifier(myHero, "modifier_teleporting") then return false end
    if NPC.IsChannellingAbility(myHero) then return false end

    return true
end


return Meepo
