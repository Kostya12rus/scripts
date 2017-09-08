local event = {
    -- Author: https://github.com/wscherphof/lua-events --
}

function event:new(object)

    object = object or {}
    object._on = {}

    function object:on (event, listener)
        self._on[event] = self._on[event] or {}
        table.insert(self._on[event], listener)
    end

    function object:listeners (event)
        return self._on[event] or {}
    end

    function object:emit (event, ...)
        for _,listener in ipairs(self:listeners(event)) do
        if "function" == type(listener) then
            listener(...)
        end
        end
    end

    return object

end

Event = event:new({})
Event.InGame = false

-- NPC DATA
Event.EntityList = {}

-- NPC CONST
NPC_OLD_HEALTH = 1
NPC_TARGET = 2
NPC_IN_ATTACK = 3
NPC_ATTACK_START = 4
NPC_DEAD = 5


function Event.OnDraw()

    if Event.InGame and not Engine.IsInGame() then
        Event.InGame = false
        Event:emit('reset')
    elseif not Event.InGame and Engine.IsInGame() then
        Event.InGame = true
    end

end


-- INVALID!!!!!
function Event.OnEntityCreate(ent)
    if not Event.InGame then return end

    if Entity.IsNPC(ent) then
        Event:emit('spawn', ent)
    end
--     -- Event:emit('summoned_creature', ent)
end


function Event.OnEntityDestroy(ent)
    if not Event.InGame then return end

    Event.EntityList[Entity.GetIndex(ent)] = nil
    for i, item in pairs(Event.EntityList) do
        if item[NPC_TARGET] == ent then
            item[NPC_TARGET] = nil
        end
    end
    Event:emit('invalid', ent)

end


function Event.OnProjectile(projectile) 
    if not projectile or not projectile.source or not projectile.target then return end
    if not projectile.isAttack then return end

    local npc = projectile.source
    -- if not Entity.IsNPC(npc) or Entity.GetHealth(npc) <= 0 then return end
    local target = projectile.target

    local i = Entity.GetIndex(npc)
    Event:emit('trace_attack', npc, target, Event.GetHitDamage(npc, target), os.time() + Event.RangedHitDelay(npc, target, projectile.moveSpeed))

    if Event.EntityList[i] == nil then return end
    Event.EntityList[i][NPC_TARGET] = target
end


function Event.OnUpdate()
    if not Event.InGame then return end

    for i = 1, NPCs.Count() do 
        local npc = NPCs.Get(i)
        if Entity.IsNPC(npc) then

            local health = Entity.GetHealth(npc)

            if Event.EntityList[i] == nil or (Event.EntityList[i][NPC_DEAD] == true and health > 0) then
                -- if Event.EntityList[i] ~= nil --> emit respawn!
                Event.EntityList[i] = {
                    NPC_OLD_HEALTH = health,
                    NPC_TARGET = nil,
                    NPC_IN_ATTACK = false,
                    NPC_ATTACK_START = 0,
                    NPC_DEAD = false,
                }
                -- Event:emit('spawn', npc)
            end

            -- check death event
            if health <= 0.0 then
                if not Event.EntityList[i][NPC_DEAD] then
                    Event.EntityList[i][NPC_DEAD] = true
                    Event.EntityList[i][NPC_OLD_HEALTH] = health
                    Event:emit('death', npc)
                end
            else
                -- ALL LOGIC
                if Event.EntityList[i][NPC_OLD_HEALTH] and Event.EntityList[i][NPC_OLD_HEALTH] > health then
                    Event:emit('trace_damage', npc, Event.EntityList[i][NPC_OLD_HEALTH] - health)
                end
                Event.EntityList[i][NPC_OLD_HEALTH] = health

                if Event.EntityList[i][NPC_IN_ATTACK] and os.time() > Event.EntityList[i][NPC_ATTACK_START] + Event.HitDelay(npc, target, true) then
                    Event.EntityList[i][NPC_ATTACK_START] = 0
                    Event.EntityList[i][NPC_IN_ATTACK] = false
                    -- Event:emit('trace_attack', npc, target, Event.GetHitDamage(npc, target), Event.EntityList[i][NPC_ATTACK_START] + Event.HitDelay(npc, target, false))
                end
                if NPC.IsAttacking(npc) then
                    if not Event.EntityList[i][NPC_IN_ATTACK] then
                        Event.EntityList[i][NPC_IN_ATTACK] = true
                        Event.EntityList[i][NPC_ATTACK_START] = os.time()
                    end
                    if not Event.EntityList[i][NPC_TARGET] then
                        if not NPC.IsRanged(npc) then
                            local target_at = Entity.GetAbsOrigin(npc) + Entity.GetRotation(npc):GetForward():Normalized():Scaled(NPC.GetAttackRange(npc) + NPC.GetHullRadius(npc))
                            target = Event.GetTarget(npc, target_at)
                            if target ~= nil then
                                Event.EntityList[i][NPC_TARGET] = target
                                Event:emit('trace_attack', npc, target, Event.GetHitDamage(npc, target), Event.EntityList[i][NPC_ATTACK_START] + Event.HitDelay(npc, target, false))
                            end
                        else
                            Event:emit('trace_attack', npc, nil, Event.GetHitDamage(npc, target), Event.EntityList[i][NPC_ATTACK_START] + Event.HitDelay(npc, nil, false))
                        end
                    end
                else
                    Event.EntityList[i][NPC_IN_ATTACK] = false
                    Event.EntityList[i][NPC_ATTACK_START] = 0
                    Event.EntityList[i][NPC_TARGET] = nil
                end
            end
        end
    end
end


Event.attackPointTable = {

    -- creeps
    npc_dota_creep_badguys_melee = { 0.467, 0.533, 0 },
    npc_dota_creep_badguys_melee_upgraded ={ 0.467, 0.533, 0 },
    npc_dota_creep_badguys_ranged = { 0.5, 0.3, 500 },
    npc_dota_creep_badguys_ranged_upgraded = { 0.5, 0.3, 500 },
    npc_dota_creep_goodguys_melee = { 0.467, 0.533, 0 },
    npc_dota_creep_goodguys_melee_upgraded = { 0.467, 0.533, 0 },
    npc_dota_creep_goodguys_ranged = { 0.5, 0.3, 500 },
    npc_dota_creep_goodguys_ranged_upgraded = { 0.5, 0.3, 500 },
    npc_dota_goodguys_siege = { 0.7, 2.0, 690 },
    npc_dota_goodguys_siege_upgraded = { 0.7, 2.0, 690 },
    npc_dota_badguys_siege = { 0.7, 2.0, 690 },
    npc_dota_badguys_siege_upgraded = { 0.7, 2.0, 690 },

    -- buildings
    npc_dota_badguys_tower1_bot = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower1_mid = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower1_top = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower2_bot = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower2_mid = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower2_top = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower3_bot = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower3_mid = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower3_top = { 0.6, 0.4, 700 },
    npc_dota_badguys_tower4 = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower1_bot = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower1_mid = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower1_top = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower2_bot = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower2_mid = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower2_top = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower3_bot = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower3_mid = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower3_top = { 0.6, 0.4, 700 },
    npc_dota_goodguys_tower4 = { 0.6, 0.4, 700 },

    -- heroes
    npc_dota_hero_abaddon = { 0.56, 0.41, 0 },
    npc_dota_hero_alchemist = { 0.35, 0.65, 0 },
    npc_dota_hero_antimage = { 0.45, 0.3, 1250 },
    npc_dota_hero_ancient_apparition = { 0.3, 0.6, 0 },
    npc_dota_hero_arc_warden = { 0.3, 0.7, 800 },
    npc_dota_hero_axe = { 0.5, 0.5, 0 },
    npc_dota_hero_bane = { 0.3, 0.7, 900 },
    npc_dota_hero_batrider = { 0.3, 0.54, 900 },
    npc_dota_hero_beastmaster = { 0.3, 0.7, 0 },
    npc_dota_hero_bloodseeker = { 0.43, 0.74, 0 },
    npc_dota_hero_bounty_hunter = { 0.59, 0.59, 0 },
    npc_dota_hero_brewmaster = { 0.35, 0.65, 0 },
    npc_dota_hero_bristleback = { 0.3, 0.3, 0 },
    npc_dota_hero_broodmother = { 0.4, 0.5, 0 },
    npc_dota_hero_centaur = { 0.3, 0.3, 0 },
    npc_dota_hero_chaos_knight = { 0.5, 0.5, 0 },
    npc_dota_hero_chen = { 0.5, 0.5, 1100 },
    npc_dota_hero_clinkz = { 0.7, 0.3, 900 },
    npc_dota_hero_rattletrap = { 0.33, 0.64, 0 },
    npc_dota_hero_crystal_maiden = { 0.55, 0, 900 },
    npc_dota_hero_dark_seer = { 0.59, 0.58, 0 },
    npc_dota_hero_dazzle = { 0.3, 0.3, 1200 },
    npc_dota_hero_death_prophet = { 0.56, 0.51, 1000 },
    npc_dota_hero_disruptor = { 0.4, 0.5, 1200 },
    npc_dota_hero_doom_bringer = { 0.5, 0.7, 0 },
    npc_dota_hero_dragon_knight = { 0.5, 0.5, 0 },
    npc_dota_hero_drow_ranger = { 0.7, 0.3, 1250 },
    npc_dota_hero_earth_spirit = { 0.35, 0.65, 0 },
    npc_dota_hero_earthshaker = { 0.467, 0.863, 0 },
    npc_dota_hero_elder_titan = { 0.35, 0.97, 0 },
    npc_dota_hero_ember_spirit = { 0.4, 0.3, 0 },
    npc_dota_hero_enchantress = { 0.3, 0.7, 900 },
    npc_dota_hero_enigma = { 0.4, 0.77, 900 },
    npc_dota_hero_faceless_void = { 0.5, 0.56, 0 },
    npc_dota_hero_gyrocopter = { 0.2, 0.97, 3000 },
    npc_dota_hero_huskar = { 0.4, 0.5, 1400 },
    npc_dota_hero_invoker = { 0.4, 0.7, 900 },
    npc_dota_hero_wisp = { 0.15, 0.4, 1200 },
    npc_dota_hero_jakiro = { 0.4, 0.5, 1100 },
    npc_dota_hero_juggernaut = { 0.33, 0.84, 0 },
    npc_dota_hero_keeper_of_the_light = { 0.3, 0.85, 900 },
    npc_dota_hero_kunkka = { 0.4, 0.3, 0 },
    npc_dota_hero_legion_commander = { 0.46, 0.64, 0 },
    npc_dota_hero_leshrac = { 0.4, 0.77, 900 },
    npc_dota_hero_lich = { 0.46, 0.54, 900 },
    npc_dota_hero_life_stealer = { 0.39, 0.44, 0 },
    npc_dota_hero_lina = { 0.75, 0.78, 1000 },
    npc_dota_hero_lion = { 0.43, 0.74, 1000 },
    npc_dota_hero_lone_druid = { 0.33, 0.53, 900 },
    npc_dota_hero_luna = { 0.46, 0.54, 900 },
    npc_dota_hero_lycan = { 0.55, 0.55, 0 },
    npc_dota_hero_magnataur = { 0.5, 0.84, 0 },
    npc_dota_hero_medusa = { 0.5, 0.6, 1200 },
    npc_dota_hero_meepo = { 0.38, 0.6, 0 },
    npc_dota_hero_mirana = { 0.3, 0.7, 900 },
    npc_dota_hero_morphling = { 0.45, 0.2, 0 },
    npc_dota_hero_monkey_king = { 0.5, 0.5, 1300 },
    npc_dota_hero_naga_siren = { 0.5, 0.5, 0 },
    npc_dota_hero_furion = { 0.4, 0.77, 1125 },
    npc_dota_hero_necrolyte = { 0.53, 0.47, 900 },
    npc_dota_hero_night_stalker = { 0.55, 0.55, 0 },
    npc_dota_hero_nyx_assassin = { 0.46, 0.54, 0 },
    npc_dota_hero_ogre_magi = { 0.3, 0.3, 0 },
    npc_dota_hero_omniknight = { 0.433, 0.567, 0 },
    npc_dota_hero_oracle = { 0.3, 0.7, 900 },
    npc_dota_hero_obsidian_destroyer = { 0.46, 0.54, 900 },
    npc_dota_hero_phantom_assassin = { 0.3, 0.7, 0 },
    npc_dota_hero_phantom_lancer = { 0.5, 0.5, 0 },
    npc_dota_hero_phoenix = { 0.35, 0.633, 1100 },
    npc_dota_hero_puck = { 0.5, 0.8, 900 },
    npc_dota_hero_pudge = { 0.5, 1.17, 0 },
    npc_dota_hero_pugna = { 0.5, 0.5, 900 },
    npc_dota_hero_queenofpain = { 0.56, 0.41, 1500 },
    npc_dota_hero_razor = { 0.3, 0.7, 2000 },
    npc_dota_hero_riki = { 0.3, 0.3, 0 },
    npc_dota_hero_rubick = { 0.4, 0.77, 1125 },
    npc_dota_hero_sand_king = { 0.53, 0.47, 0 },
    npc_dota_hero_shadow_demon = { 0.35, 0.5, 900 },
    npc_dota_hero_nevermore = { 0.5, 0.54, 1200 },
    npc_dota_hero_shadow_shaman = { 0.3, 0.5, 900 },
    npc_dota_hero_silencer = { 0.5, 0.5, 1000 },
    npc_dota_hero_skywrath_mage = { 0.4, 0.78, 1000 },
    npc_dota_hero_slardar = { 0.36, 0.64, 0 },
    npc_dota_hero_slark = { 0.5, 0.3, 0 },
    npc_dota_hero_sniper = { 0.17, 0.7, 3000 },
    npc_dota_hero_spectre = { 0.3, 0.7, 0 },
    npc_dota_hero_spirit_breaker = { 0.6, 0.3, 0 },
    npc_dota_hero_storm_spirit = { 0.5, 0.3, 1100 },
    npc_dota_hero_sven = { 0.4, 0.3, 0 },
    npc_dota_hero_techies = { 0.5, 0.5, 900 },
    npc_dota_hero_templar_assassin = { 0.3, 0.5, 900 },
    npc_dota_hero_terrorblade = { 0.3, 0.6, 0 },
    npc_dota_hero_tidehunter = { 0.6, 0.56, 0 },
    npc_dota_hero_shredder = { 0.36, 0.64, 0 },
    npc_dota_hero_tinker = { 0.35, 0.65, 900 },
    npc_dota_hero_tiny = { 0.49, 1, 0 },
    npc_dota_hero_treant = { 0.6, 0.4, 0 },
    npc_dota_hero_troll_warlord = { 0.3, 0.3, 1200 },
    npc_dota_hero_tusk = { 0.36, 0.64, 0 },
    npc_dota_hero_abyssal_underlord = { 0.45, 0.7, 0 },
    npc_dota_hero_undying = { 0.3, 0.3, 0 },
    npc_dota_hero_ursa = { 0.3, 0.3, 0 },
    npc_dota_hero_vengefulspirit = { 0.33, 0.64, 1500 },
    npc_dota_hero_venomancer = { 0.3, 0.7, 900 },
    npc_dota_hero_viper = { 0.33, 1, 1200 },
    npc_dota_hero_visage = { 0.46, 0.54, 900 },
    npc_dota_hero_warlock = { 0.3, 0.3, 1200 },
    npc_dota_hero_weaver = { 0.64, 0.36, 900 },
    npc_dota_hero_windrunner = { 0.4, 0.3, 1250 },
    npc_dota_hero_winter_wyvern = { 0.25, 0.8, 700 },
    npc_dota_hero_witch_doctor = { 0.4, 0.5, 1200 },
    npc_dota_hero_skeleton_king = { 0.56, 0.44, 0 },
    npc_dota_hero_zuus = { 0.633, 0.366, 1100 },

}


Event.projective_speed = {
   npc_dota_hero_abaddon = 0,
   npc_dota_hero_abyssal_underlord = 0,
   npc_dota_hero_alchemist = 0,
   npc_dota_hero_ancient_apparition = 0,
   npc_dota_hero_antimage = 0,
   npc_dota_hero_arc_warden = 900,
   npc_dota_hero_axe = 0,
   npc_dota_hero_bane = 900,
   npc_dota_hero_batrider = 900,
   npc_dota_hero_beastmaster = 0,
   npc_dota_hero_bloodseeker = 0,
   npc_dota_hero_bounty_hunter = 0,
   npc_dota_hero_brewmaster = 0,
   npc_dota_hero_bristleback = 0,
   npc_dota_hero_broodmother = 0,
   npc_dota_hero_centaur = 0,
   npc_dota_hero_chaos_knight = 0,
   npc_dota_hero_chen = 1100,
   npc_dota_hero_clinkz = 900,
   npc_dota_hero_crystal_maiden = 900,
   npc_dota_hero_dark_seer = 0,
   npc_dota_hero_dazzle = 1200,
   npc_dota_hero_death_prophet = 1000,
   npc_dota_hero_disruptor = 1200,
   npc_dota_hero_doom_bringer = 0,
   npc_dota_hero_dragon_knight = 0,
   npc_dota_hero_drow_ranger = 1250,
   npc_dota_hero_earth_spirit = 0,
   npc_dota_hero_earthshaker = 0,
   npc_dota_hero_elder_titan = 0,
   npc_dota_hero_ember_spirit = 0,
   npc_dota_hero_enchantress = 900,
   npc_dota_hero_enigma = 900,
   npc_dota_hero_faceless_void = 0,
   npc_dota_hero_furion = 1125,
   npc_dota_hero_gyrocopter = 3000,
   npc_dota_hero_huskar = 1400,
   npc_dota_hero_invoker = 900,
   npc_dota_hero_jakiro = 1100,
   npc_dota_hero_juggernaut = 0,
   npc_dota_hero_keeper_of_the_light = 900,
   npc_dota_hero_kunkka = 0,
   npc_dota_hero_legion_commander = 0,
   npc_dota_hero_leshrac = 900,
   npc_dota_hero_lich = 900,
   npc_dota_hero_life_stealer = 0,
   npc_dota_hero_lina = 1000,
   npc_dota_hero_lion = 900,
   npc_dota_hero_lone_druid = 900,
   npc_dota_hero_luna = 900,
   npc_dota_hero_lycan = 0,
   npc_dota_hero_magnataur = 0,
   npc_dota_hero_medusa = 1200,
   npc_dota_hero_meepo = 0,
   npc_dota_hero_mirana = 900,
   npc_dota_hero_morphling = 1300,
   npc_dota_hero_naga_siren = 0,
   npc_dota_hero_necrolyte = 900,
   npc_dota_hero_nevermore = 1200,
   npc_dota_hero_night_stalker = 0,
   npc_dota_hero_nyx_assassin = 0,
   npc_dota_hero_obsidian_destroyer = 900,
   npc_dota_hero_ogre_magi = 0,
   npc_dota_hero_omniknight = 0,
   npc_dota_hero_oracle = 900,
   npc_dota_hero_phantom_assassin = 0,
   npc_dota_hero_phantom_lancer = 0,
   npc_dota_hero_phoenix = 1100,
   npc_dota_hero_puck = 900,
   npc_dota_hero_pudge = 0,
   npc_dota_hero_pugna = 900,
   npc_dota_hero_queenofpain = 1500,
   npc_dota_hero_rattletrap = 0,
   npc_dota_hero_razor = 2000,
   npc_dota_hero_riki = 0,
   npc_dota_hero_rubick = 1125,
   npc_dota_hero_sand_king = 0,
   npc_dota_hero_shadow_demon = 900,
   npc_dota_hero_shadow_shaman = 900,
   npc_dota_hero_shredder = 0,
   npc_dota_hero_silencer = 1000,
   npc_dota_hero_skeleton_king = 0,
   npc_dota_hero_skywrath_mage = 1000,
   npc_dota_hero_slardar = 0,
   npc_dota_hero_slark = 0,
   npc_dota_hero_sniper = 3000,
   npc_dota_hero_spectre = 0,
   npc_dota_hero_spirit_breaker = 0,
   npc_dota_hero_storm_spirit = 1100,
   npc_dota_hero_sven = 0,
   npc_dota_hero_techies = 900,
   npc_dota_hero_templar_assassin = 900,
   npc_dota_hero_terrorblade = 0,
   npc_dota_hero_tidehunter = 0,
   npc_dota_hero_tinker = 900,
   npc_dota_hero_tiny = 0,
   npc_dota_hero_treant = 0,
   npc_dota_hero_troll_warlord = 1200,
   npc_dota_hero_tusk = 0,
   npc_dota_hero_undying = 0,
   npc_dota_hero_ursa = 0,
   npc_dota_hero_vengefulspirit = 1500,
   npc_dota_hero_venomancer = 900,
   npc_dota_hero_viper = 1200,
   npc_dota_hero_visage = 900,
   npc_dota_hero_warlock = 1200,
   npc_dota_hero_weaver = 900,
   npc_dota_hero_windrunner = 1250,
   npc_dota_hero_winter_wyvern = 700,
   npc_dota_hero_wisp = 1200,
   npc_dota_hero_witch_doctor = 1200,
   npc_dota_hero_zuus = 1100,

   npc_dota_creep_badguys_ranged = 900,
    npc_dota_creep_badguys_ranged_upgraded = 900,
    npc_dota_creep_goodguys_ranged = 900,
    npc_dota_creep_goodguys_ranged_upgraded = 900,
    npc_dota_badguys_tower1_bot =  750,
    npc_dota_badguys_tower1_mid =  750,
    npc_dota_badguys_tower1_top =  750,
    npc_dota_badguys_tower2_bot =  750,
    npc_dota_badguys_tower2_mid =  750,
    npc_dota_badguys_tower2_top =  750,
    npc_dota_badguys_tower3_bot =  750,
    npc_dota_badguys_tower3_mid =  750,
    npc_dota_badguys_tower3_top =  750,
    npc_dota_badguys_tower4 =  750,
    npc_dota_goodguys_tower1_bot =  750,
    npc_dota_goodguys_tower1_mid =  750,
    npc_dota_goodguys_tower1_top =  750,
    npc_dota_goodguys_tower2_bot =  750,
    npc_dota_goodguys_tower2_mid =  750,
    npc_dota_goodguys_tower2_top =  750,
    npc_dota_goodguys_tower3_bot =  750,
    npc_dota_goodguys_tower3_mid =  750,
    npc_dota_goodguys_tower3_top =  750,
    npc_dota_goodguys_tower4 =  750,
    npc_dota_goodguys_siege = 1100,
    npc_dota_goodguys_siege_upgraded = 1100,
    npc_dota_badguys_siege = 1100,
    npc_dota_badguys_siege_upgraded = 1100,
}


function Event.HitDelay(source, target, full)

    if source == nil then return 9999 end

    local increasedAS = NPC.GetIncreasedAttackSpeed(source)
    local attackTime = NPC.GetAttackTime(source)
    local attackPoint
    local attackBackSwing
    local unit_name = NPC.GetUnitName(source)
    if unit_name == nil then return 9999 end

    for i, v in pairs(Event.attackPointTable) do
        if i == unit_name then
            attackPoint = v[1] / (1 + (increasedAS/100))
            attackBackSwing = v[2] / (1 + (increasedAS/100))
            break
        end
    end

    if attackPoint == nil then
        Log.Write('[Event.lua] nil attackPoint for '..unit_name)
        return attackTime
    end

    -- local totalLatency = (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) -- / 2
    -- local attack_time = attackTime + attackPoint + NPC.GetTimeToFace(source, target) + totalLatency + attackBackSwing
    -- HIT HAPPENS AT attackPoint!!!!!

    local attack_time = NPC.GetTimeToFace(source, target) + attackTime
    if full then
        attack_time = attack_time + attackPoint + attackBackSwing
    else
        attack_time = attack_time + attackPoint
    end

    if target ~= nil and NPC.IsRanged(source) and Entity.IsNPC(target) then
        local distance = (Entity.GetAbsOrigin(source) - Entity.GetAbsOrigin(target)):Length() -- + 12 -- HERO_COLLISION/2
        for i, v in pairs(Event.projective_speed) do
            if i == unit_name then
                attack_time = attack_time + (distance / v)
                break
            end
        end
    end

    return attack_time

end


function Event.RangedHitDelay(npc, target, speed)
    local attack_time = 0
    local distance = (Entity.GetAbsOrigin(npc) - Entity.GetAbsOrigin(target)):Length()
    return (distance / speed)
end


function Event.GetHitDamage(source, npc)
    if not source or not npc then return 0 end
    if not Entity.IsNPC(source) or not Entity.IsNPC(npc) then return 0 end

    local damage = NPC.GetDamageMultiplierVersus(source, npc) * NPC.GetTrueDamage(source) * NPC.GetArmorDamageMultiplier(npc) -- * 0.946

    if Heroes.GetLocal() == source then
        return damage - 5
    end

    return damage
end


function Event.GetTarget(source, origin)

    local creeps = NPC.GetUnitsInRadius(source, NPC.GetAttackRange(source) + NPC.GetHullRadius(source), Enum.TeamType.TEAM_ENEMY)
    if not creeps or #creeps <= 0 then return nil end
    local creeps_count = #creeps

    if creeps_count == 1 then return creeps[1] end

    local min_distance = NPC.GetAttackRange(source) + NPC.GetHullRadius(source)
    local closest_creep = nil
    for i = 1, creeps_count-1 do
        local pos = Entity.GetAbsOrigin(creeps[i])
        -- local mid = origin:__add(pos):Scaled(0.5)
        local distance = (pos - origin):Length()
        if distance <= min_distance then
            min_distance = distance
            closest_creep = creeps[i]
        end
    end

    return closest_creep

end


return Event
