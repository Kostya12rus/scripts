local ability_alert_info = {}
local KostyaUtils = require("KostyaUtils/Utils")
ability_alert_info.optionEnable =   Menu.AddOption({"Kostya12rus", "Ability Alert Info"}, "Activate", "")
ability_alert_info.size_panel =     Menu.AddOption({"Kostya12rus", "Ability Alert Info"}, "Panel size", "customizing the panel size", 10, 200, 5)
ability_alert_info.invise =         Menu.AddOption({"Kostya12rus", "Ability Alert Info"}, "Invise", "customizing the panel size", 5, 255, 5)


function ability_alert_info.OnUpdate()
    if not Menu.IsEnabled(ability_alert_info.optionEnable) then return end

    if not Players.GetLocal() then return end
    if not Player.GetPlayerData(Players.GetLocal()) or not Player.GetPlayerData(Players.GetLocal()).teamNum then return end
    if ability_alert_info.my_team == nil then
        ability_alert_info.my_team = Player.GetPlayerData(Players.GetLocal()).teamNum
        return
    end

    ability_alert_info.clear_ability_table()
end

function ability_alert_info.OnDraw()
    if not Menu.IsEnabled(ability_alert_info.optionEnable) then return end
    if ability_alert_info.my_team == nil then return end
    
    local index = 0
    for modifier, ability_info in pairs(ability_alert_info.ability_table) do
        index = index + 1
        ability_alert_info.draw_table(ability_info.sourse, ability_info.ability, ability_info.target, index)
    end
end

function ability_alert_info.OnModifierGained(npc, modifier)
    if not Menu.IsEnabled(ability_alert_info.optionEnable) then return end
    if ability_alert_info.my_team == nil then return end
    if not Entity.IsEntity(npc) then return end
    local name_modifier = Modifier.GetName(modifier)

    if 
        name_modifier == 'modifier_invoker_sun_strike' or
        name_modifier == 'modifier_kunkka_torrent_thinker' or
        name_modifier == 'modifier_item_fallen_sky_land'
    then
        if Entity.GetTeamNum(npc) == ability_alert_info.my_team then return end
        local target = Heroes.InRadius(Entity.GetAbsOrigin(npc), 1000, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
        if #target > 0 then target = target[1] end
        if not Entity.IsEntity(target) or not Entity.IsHero(target) then
            target = Modifier.GetCaster(modifier)
        end
        ability_alert_info.ability_table[modifier] = {}
        ability_alert_info.ability_table[modifier].sourse = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].ability = Modifier.GetAbility(modifier)
        ability_alert_info.ability_table[modifier].target = target
        ability_alert_info.ability_table[modifier].time_dead = GameRules.GetGameTime() + 5
    elseif 
        name_modifier == 'modifier_item_invisibility_edge_windwalk' or
        name_modifier == 'modifier_item_silver_edge_windwalk' or
        name_modifier == 'modifier_item_trickster_cloak_invis' or
        name_modifier == 'modifier_visage_silent_as_the_grave'
    then
        if Entity.GetTeamNum(npc) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[modifier] = {}
        ability_alert_info.ability_table[modifier].sourse = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].ability = Modifier.GetAbility(modifier)
        ability_alert_info.ability_table[modifier].target = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].time_dead = GameRules.GetGameTime() + 5
    elseif 
        name_modifier == 'modifier_smoke_of_deceit'
    then
        if Entity.GetTeamNum(npc) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[modifier] = {}
        ability_alert_info.ability_table[modifier].sourse = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].ability = 'panorama/images/items/smoke_of_deceit_png.vtex_c'
        ability_alert_info.ability_table[modifier].target = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].time_dead = GameRules.GetGameTime() + 5
    elseif 
        name_modifier == 'modifier_spirit_breaker_charge_of_darkness_vision' or
        name_modifier == 'modifier_sniper_assassinate' or
        name_modifier == 'modifier_tusk_snowball_target'
    then
        if Entity.GetTeamNum(npc) ~= ability_alert_info.my_team then return end
        ability_alert_info.ability_table[modifier] = {}
        ability_alert_info.ability_table[modifier].sourse = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].ability = Modifier.GetAbility(modifier)
        ability_alert_info.ability_table[modifier].target = npc
        ability_alert_info.ability_table[modifier].time_dead = GameRules.GetGameTime() + 5
    elseif name_modifier == 'modifier_undying_tombstone_bunker_friendly' then
        if Entity.GetTeamNum(npc) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[modifier] = {}
        ability_alert_info.ability_table[modifier].sourse = Modifier.GetCaster(modifier)
        ability_alert_info.ability_table[modifier].ability = Modifier.GetAbility(modifier)
        ability_alert_info.ability_table[modifier].target = npc
        ability_alert_info.ability_table[modifier].time_dead = GameRules.GetGameTime() + 5
    end
end
function ability_alert_info.OnUnitAnimation(animation)
    if not Menu.IsEnabled(ability_alert_info.optionEnable) then return end
    if not Entity.IsEntity(animation.unit) then return end
    if Entity.GetTeamNum(animation.unit) == ability_alert_info.my_team then return end
    if not Entity.IsDormant(animation.unit) then return end
    if animation.sequenceName == 'cast_blast_off' then
        local sourse, ability = ability_alert_info.get_entity_has_ability('techies_suicide')
        ability_alert_info.ability_table[animation.sequenceName] = {}
        ability_alert_info.ability_table[animation.sequenceName].sourse = sourse
        ability_alert_info.ability_table[animation.sequenceName].ability = ability
        ability_alert_info.ability_table[animation.sequenceName].target = sourse
        ability_alert_info.ability_table[animation.sequenceName].time_dead = GameRules.GetGameTime() + 1
    elseif animation.sequenceName == 'phantasm_anim' then
        local sourse, ability = ability_alert_info.get_entity_has_ability('chaos_knight_phantasm')
        ability_alert_info.ability_table[animation.sequenceName] = {}
        ability_alert_info.ability_table[animation.sequenceName].sourse = sourse
        ability_alert_info.ability_table[animation.sequenceName].ability = ability
        ability_alert_info.ability_table[animation.sequenceName].target = sourse
        ability_alert_info.ability_table[animation.sequenceName].time_dead = GameRules.GetGameTime() + 2
    end
end

function ability_alert_info.OnParticleCreate(particle)
    if not Menu.IsEnabled(ability_alert_info.optionEnable) then return end
    if ability_alert_info.my_team == nil then return end
    if particle.name == "earthshaker_totem_leap_blur" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('earthshaker_enchant_totem')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 2
        ability_alert_info.ability_table[particle.index].name = 'earthshaker_totem_leap_blur'
    elseif particle.name == "mirana_moonlight_cast" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('mirana_invis')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 20
    elseif particle.name == "smoke_of_deceit" then
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = 'panorama/images/items/smoke_of_deceit_png.vtex_c'
        ability_alert_info.ability_table[particle.index].ability = 'panorama/images/items/smoke_of_deceit_png.vtex_c'
        ability_alert_info.ability_table[particle.index].target = 'panorama/images/items/smoke_of_deceit_png.vtex_c'
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 10
        ability_alert_info.ability_table[particle.index].name = 'smoke_of_deceit'
    elseif particle.name == "nyx_assassin_vendetta_start" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('nyx_assassin_vendetta')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 10
    elseif particle.name == "clinkz_windwalk" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('clinkz_wind_walk')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "bounty_hunter_windwalk" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('bounty_hunter_wind_walk')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "sven_spell_gods_strength" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('sven_gods_strength')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 10
    elseif particle.name == "wisp_relocate_channel" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('wisp_relocate')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "lycan_shapeshift_cast" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('lycan_shapeshift')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "alchemist_unstableconc_bottles" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('alchemist_unstable_concoction_throw')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "alchemist_chemichalrage_effect" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('alchemist_chemical_rage')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "centaur_stampede" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('centaur_stampede')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "teleport_start" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].ability = 'panorama/images/items/tpscroll_png.vtex_c'
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 4
    elseif particle.name == "sandking_epicenter_tell" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('sandking_epicenter')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "pudge_meathook" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('pudge_meat_hook')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'pudge_meat_hook'
        ability_alert_info.ability_table[particle.index].start_pos = nil
        ability_alert_info.ability_table[particle.index].end_pos = nil
    elseif particle.name == "ursa_enrage_buff" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('ursa_enrage')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "roshan_spawn" then
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = 'panorama/images/spellicons/roshan_bash_png.vtex_c'
        ability_alert_info.ability_table[particle.index].ability = 'panorama/images/spellicons/roshan_halloween_angry_png.vtex_c'
        ability_alert_info.ability_table[particle.index].target = 'panorama/images/spellicons/roshan_bash_png.vtex_c'
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 20
    elseif particle.name == "roshan_slam" then
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = 'panorama/images/spellicons/roshan_slam_png.vtex_c'
        ability_alert_info.ability_table[particle.index].ability = 'panorama/images/spellicons/roshan_halloween_angry_png.vtex_c'
        ability_alert_info.ability_table[particle.index].target = 'panorama/images/spellicons/roshan_slam_png.vtex_c'
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "primal_beast_onslaught_chargeup" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('primal_beast_onslaught')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "primal_beast_rock_throw_arc" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('primal_beast_rock_throw')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'primal_beast_rock_throw'
    elseif particle.name == "phantom_assassin_active_start" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('phantom_assassin_blur')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "hoodwink_sharpshooter" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('hoodwink_sharpshooter')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "undying_tombstone" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('undying_tombstone')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "ancient_apparition_ice_blast_final" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('ancient_apparition_ice_blast')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'ancient_apparition_ice_blast'
    elseif particle.name == "batrider_firefly" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('batrider_firefly')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "batrider_flamebreak" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('batrider_flamebreak')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'batrider_flamebreak'
    elseif particle.name == "furion_teleport_end" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('furion_teleportation')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'furion_teleportation'
    elseif particle.name == "techies_blast_off_trail" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('techies_suicide')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "broodmother_hunger_buff" then
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        local sourse, ability = ability_alert_info.get_entity_has_ability('broodmother_insatiable_hunger')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "brewmaster_primal_split" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('brewmaster_primal_split')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "zuus_thundergods_wrath_start" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('zuus_thundergods_wrath')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "keeper_of_the_light_illuminate_charge" or particle.name == "keeper_of_the_light_illuminate_charge_spirit_form" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('keeper_of_the_light_illuminate')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "grimstroke_cast2_ground" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('grimstroke_dark_artistry')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "grimstroke_ink_swell_buff" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('grimstroke_spirit_walk')
        if not Entity.IsEntity(particle.entity) or Entity.GetTeamNum(particle.entity) == ability_alert_info.my_team then return end
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "dark_willow_shadow_realm" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('dark_willow_shadow_realm')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "dark_willow_wisp_spell_channel" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('dark_willow_terrorize')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "weaver_shukuchi" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('weaver_shukuchi')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "nevermore_wings" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('nevermore_requiem')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'nevermore_requiem'
    elseif particle.name == "pangolier_gyroshell_cast" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('pangolier_gyroshell')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "naga_siren_siren_song_cast" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('naga_siren_song_of_the_siren')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "marci_unleash_cast" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('marci_unleash')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "beastmaster_call_bird" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('beastmaster_call_of_the_wild_hawk')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "monkey_king_spring_channel" then
        local sourse, ability = ability_alert_info.get_entity_has_ability('monkey_king_primal_spring')
        if not Entity.IsEntity(sourse) or Entity.GetTeamNum(sourse) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = sourse
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = sourse
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'monkey_king_spring_channel'
    elseif particle.name == "rubick_spell_steal" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local ability = NPC.GetAbility(particle.entityForModifiers, 'rubick_spell_steal')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.ability_table[particle.index].name = 'rubick_spell_steal'
    elseif particle.name == "phoenix_supernova_scepter" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local ability = NPC.GetAbility(particle.entityForModifiers, 'phoenix_supernova')
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].ability = ability
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "team_portal_pull" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        ability_alert_info.ability_table[particle.index] = {}
        ability_alert_info.ability_table[particle.index].sourse = particle.entityForModifiers
        ability_alert_info.ability_table[particle.index].ability = 'panorama/images/spellicons/twin_gate_portal_warp_png.vtex_c'
        ability_alert_info.ability_table[particle.index].target = particle.entity
        ability_alert_info.ability_table[particle.index].time_dead = GameRules.GetGameTime() + 10
        ability_alert_info.ability_table[particle.index].name = 'team_portal_pull'
    elseif particle.name == "fol_active" then
        if not Entity.IsEntity(particle.entityForModifiers) or Entity.GetTeamNum(particle.entityForModifiers) == ability_alert_info.my_team then return end
        local name_ability = 'mango_tree_png'..Entity.GetClassName(particle.entityForModifiers)
        ability_alert_info.ability_table[name_ability] = {}
        ability_alert_info.ability_table[name_ability].sourse = 'panorama/images/items/mango_tree_png.vtex_c'
        ability_alert_info.ability_table[name_ability].ability = 'panorama/images/items/famango_png.vtex_c'
        ability_alert_info.ability_table[name_ability].target = particle.entityForModifiers
        ability_alert_info.ability_table[name_ability].time_dead = GameRules.GetGameTime() + 5
    elseif particle.name == "miniboss_damage_reflect" or particle.name == "miniboss_damage_reflect_dire" then
        if not Entity.IsEntity(particle.entityForModifiers) then return end
        ability_alert_info.custom_ability[particle.index] = {}
        ability_alert_info.custom_ability[particle.index].sourse = 'panorama/images/items/mango_tree_png.vtex_c'
        ability_alert_info.custom_ability[particle.index].ability = 'panorama/images/items/famango_png.vtex_c'
        ability_alert_info.custom_ability[particle.index].target = particle.entityForModifiers
        ability_alert_info.custom_ability[particle.index].time_dead = GameRules.GetGameTime() + 5
        ability_alert_info.custom_ability[particle.index].name = 'miniboss_damage_reflect'
    end
end

function ability_alert_info.OnParticleUpdate(particle)
    if ability_alert_info.ability_table[particle.index] then
        if ability_alert_info.ability_table[particle.index].name == "smoke_of_deceit" and particle.controlPoint == 0 then
            local my_team = Heroes.InRadius(particle.position, 500, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index] = nil
            end
        elseif ability_alert_info.ability_table[particle.index].name == "pudge_meat_hook" and particle.controlPoint == 1 then
            ability_alert_info.ability_table[particle.index].end_pos = particle.position
            if ability_alert_info.ability_table[particle.index].end_pos and ability_alert_info.ability_table[particle.index].start_pos then
                local target = Trace.FindEntities(
                    ability_alert_info.ability_table[particle.index].start_pos, ability_alert_info.ability_table[particle.index].end_pos, 
                    100, 200, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND, Enum.TargetType.DOTA_UNIT_TARGET_HERO, 
                    function(ent) return true end, true)
                if target and #target > 0 then
                    ability_alert_info.ability_table[particle.index].target = target[1]
                end
            end
        elseif ability_alert_info.ability_table[particle.index].name == "primal_beast_rock_throw" and particle.controlPoint == 1 then
            local my_team = Heroes.InRadius(particle.position, 500, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index].target = my_team[1]
            end
        elseif ability_alert_info.ability_table[particle.index].name == "ancient_apparition_ice_blast" then
            if particle.controlPoint == 0 then
                ability_alert_info.ability_table[particle.index].start_pos = particle.position
            elseif particle.controlPoint == 1 then
                ability_alert_info.ability_table[particle.index].move_vector = particle.position
            elseif particle.controlPoint == 5 then
                local start_vector = ability_alert_info.ability_table[particle.index].start_pos
                local move_vector = ability_alert_info.ability_table[particle.index].move_vector
                local end_pos = start_vector + (move_vector:Scaled(particle.position:GetX()))
                local my_team = Heroes.InRadius(end_pos, 1000, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
                if my_team and #my_team > 0 then
                    ability_alert_info.ability_table[particle.index].target = my_team[1]
                end
            end
        elseif ability_alert_info.ability_table[particle.index].name == "batrider_flamebreak" and particle.controlPoint == 5 then
            local my_team = Heroes.InRadius(particle.position, 700, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index].target = my_team[1]
            end
        elseif ability_alert_info.ability_table[particle.index].name == "furion_teleportation" and particle.controlPoint == 1 then
            local my_team = Heroes.InRadius(particle.position, 500, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index].target = my_team[1]
            end
        end
    end
end
function ability_alert_info.OnParticleUpdateEntity(particle)
    if ability_alert_info.ability_table[particle.index] then
        if ability_alert_info.ability_table[particle.index].name == "pudge_meat_hook" and particle.controlPoint == 0 then
            ability_alert_info.ability_table[particle.index].start_pos = particle.position
        elseif ability_alert_info.ability_table[particle.index].name == "nevermore_requiem" and particle.controlPoint == 1 then
            local my_team = Heroes.InRadius(particle.position, 500, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index].target = my_team[1]
            end
        elseif ability_alert_info.ability_table[particle.index].name == "earthshaker_totem_leap_blur" and particle.controlPoint == 1 then
            local my_team = Heroes.InRadius(particle.position, 950, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index].target = my_team[1]
            end
        elseif ability_alert_info.ability_table[particle.index].name == "monkey_king_spring_channel" and particle.controlPoint == 1 then
            local my_team = Heroes.InRadius(particle.position, 1000, ability_alert_info.my_team, Enum.TeamType.TEAM_FRIEND)
            if my_team and #my_team > 0 then
                ability_alert_info.ability_table[particle.index].target = my_team[1]
            end
        elseif ability_alert_info.ability_table[particle.index].name == "rubick_spell_steal" and particle.controlPoint == 0 then
            ability_alert_info.ability_table[particle.index].target = particle.entity
        elseif ability_alert_info.ability_table[particle.index].name == "team_portal_pull" then
            if particle.controlPoint == 1 and Entity.IsEntity(particle.entity) then
                local position = Entity.GetAbsOrigin(particle.entity)
                local y = position:GetY()
                if y > 0 then
                    ability_alert_info.ability_table[particle.index].target = 'panorama/images/control_icons/arrow_dropdown_png.vtex_c'
                else
                    ability_alert_info.ability_table[particle.index].target = 'panorama/images/control_icons/arrow_dropdown_up_png.vtex_c'
                end
            end
        end
    elseif ability_alert_info.custom_ability[particle.index] then
        if ability_alert_info.custom_ability[particle.index].name == 'miniboss_damage_reflect' and particle.controlPoint == 1 then
            if Entity.GetTeamNum(particle.entity) ~= ability_alert_info.my_team then
                local name_ability = 'miniboss_damage_reflect'..Entity.GetClassName(particle.entity)
                ability_alert_info.ability_table[name_ability] = {}
                ability_alert_info.ability_table[name_ability].sourse = particle.entity
                ability_alert_info.ability_table[name_ability].ability = 'panorama/images/spellicons/action_attack_png.vtex_c'
                ability_alert_info.ability_table[name_ability].target = 'panorama/images/spellicons/miniboss_reflect_png.vtex_c'
                ability_alert_info.ability_table[name_ability].time_dead = GameRules.GetGameTime() + 5
            end
            ability_alert_info.custom_ability[particle.index] = nil
        end
    end
end
function ability_alert_info.OnParticleDestroy(particle)
    if ability_alert_info.ability_table[particle.index] then
        if ability_alert_info.ability_table[particle.index].name == "rubick_spell_steal" then
            local target = ability_alert_info.ability_table[particle.index].target
            local sourse = ability_alert_info.ability_table[particle.index].sourse
            for i=0,25,1 do
                local ability = NPC.GetAbilityByIndex(sourse, i)
                if Entity.IsEntity(ability) and Entity.IsAbility(ability) and Ability.IsStolen(ability) then
                    if NPC.HasAbility(target, Ability.GetName(ability)) then
                        ability_alert_info.ability_table[particle.index].target = ability
                        return
                    end
                end
            end
        end
    end
end

function ability_alert_info.OnPanoramaUIEvent(event)
    if not Menu.IsEnabled(ability_alert_info.optionEnable) then return true end
    if ability_alert_info.my_team == nil then return true end
    local panarama_is_open = KostyaUtils.PanaramaIsOpen(event)
    if panarama_is_open ~= nil then
        ability_alert_info.shop_is_open = panarama_is_open
    end
	
    return true
end

function ability_alert_info.draw_table(sourse, ability, target, index)
    if ability_alert_info.shop_is_open then return end
    if Entity.IsEntity(sourse) then
        sourse = KostyaUtils.LoadingImg(sourse, true)
    else
        if type(sourse) == 'string' then
            sourse = Renderer.LoadImage(sourse)
        else
            return
        end
    end

    local ability_userdata = ability
    if Entity.IsEntity(ability) then
        ability = KostyaUtils.LoadingImg(ability, true)
    else
        if type(ability) == 'string' then
            ability = Renderer.LoadImage(ability)
        else
            return
        end
    end

    if Entity.IsEntity(target) then
        target = KostyaUtils.LoadingImg(target, true)
    else
        if type(target) == 'string' then
            target = Renderer.LoadImage(target)
        else
            return
        end
    end

    local backgroundsize = Menu.GetValue(ability_alert_info.size_panel)
    local imgsize = math.ceil(backgroundsize * 0.8)
    local size_x, size_y = Renderer.GetScreenSize()

    Renderer.SetDrawColor(255, 255, 255, Menu.GetValue(ability_alert_info.invise))
    local posx = math.ceil(size_x - backgroundsize * 3)
    local posy = math.ceil(size_y - 225 - backgroundsize * 1.1 * index)
    Renderer.DrawImage(Renderer.LoadImage('panorama/images/weekend_tourney/battle_cup_tooltip_backer_champions_fall_psd.vtex_c'), posx, posy, backgroundsize * 3, backgroundsize)
    
    local img_pos_y = math.ceil(posy + (backgroundsize - imgsize) / 2)

    local imgposx1 = math.ceil(posx + (backgroundsize * 0) + (backgroundsize - imgsize) / 2)
    Renderer.DrawImage(sourse, imgposx1, img_pos_y, imgsize, imgsize)

    local imgposx2 = math.ceil(posx + (backgroundsize * 1) + (backgroundsize - imgsize) / 2)
    Renderer.DrawImage(ability, imgposx2, img_pos_y, imgsize, imgsize)

    if Entity.IsEntity(ability_userdata) and Entity.IsAbility(ability_userdata) then
        if Input.IsCursorInRect(imgposx2, img_pos_y, imgsize, imgsize) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
            Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PING_ABILITY, 0, Vector(), ability_userdata, 0, nil)
        end
    end

    local imgposx3 = math.ceil(posx + (backgroundsize * 2) + (backgroundsize - imgsize) / 2)
    Renderer.DrawImage(target, imgposx3, img_pos_y, imgsize, imgsize)
end

function ability_alert_info.clear_ability_table()
    if ability_alert_info.clear_ability_table_timer == nil then
        ability_alert_info.clear_ability_table_timer = 0
    end
    if ability_alert_info.clear_ability_table_timer > os.clock() then return end

    for modifier, ability_info in pairs(ability_alert_info.ability_table) do
        if ability_info.time_dead and ability_info.time_dead <= GameRules.GetGameTime() then
            ability_alert_info.ability_table[modifier] = nil
        end
    end

    ability_alert_info.clear_ability_table_timer = os.clock() + 1
end

function ability_alert_info.get_entity_has_ability(ability_name)
    if not ability_name then return end
    for _, hero_user_data in pairs(Heroes.GetAll()) do
        if Entity.IsEntity(hero_user_data) and Entity.GetTeamNum(hero_user_data) ~= ability_alert_info.my_team and NPC.HasAbility(hero_user_data, ability_name) then
            return hero_user_data, NPC.GetAbility(hero_user_data, ability_name)
        end
    end
end


function ability_alert_info.OnInit()
    ability_alert_info.my_team = nil
    ability_alert_info.ability_table = {}
    ability_alert_info.custom_ability = {}
    ability_alert_info.shop_is_open = false
end
function ability_alert_info.OnGameEnd()
    ability_alert_info.OnInit()
end
ability_alert_info.OnInit()
return ability_alert_info
