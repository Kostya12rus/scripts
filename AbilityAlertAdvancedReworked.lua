local AbilityAlert2 = {}
--resource\flash3\images\miniheroes\lina.png
AbilityAlert2.option = Menu.AddOption({ "Awareness", "Ability Alert Advanced"}, "Enable", "Alerts you when certain abilities are used.")
AbilityAlert2.boxSizeOption = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "Map Display Size", "", 30, 100, 1)
AbilityAlert2.miniBoxSizeOption = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "MiniMap Display Size", "", 10, 50, 1)
AbilityAlert2.font = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
AbilityAlert2.mapFont = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.NORMAL)
AbilityAlert2.miniHero = "resource/flash3/images/heroes/"
-- current active alerts.
AbilityAlert2.alerts = {}
AbilityAlert2.mapOrigin = {x=-7000, y=7000}
AbilityAlert2.cachedIcons = {}

AbilityAlert2.ratioOffset = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "Ratio", "", -400, 400, 2)
AbilityAlert2.xAlert = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "x Alert", "", -1000, 1000, 50)
AbilityAlert2.yAlert = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "y Alert", "", -1000, 1000, 50)
AbilityAlert2.xOffset = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "x Offset", "", -200, 200, 2)
AbilityAlert2.yOffset = Menu.AddOption({ "Awareness", "Ability Alert Advanced" }, "y Offset", "", -200, 200, 2)

AbilityAlert2.ambiguous =
{
    {  
        name = "nyx_assassin_vendetta_start",
        msg = " has used Vendetta",
        ability = "nyx_assassin_vendetta",
        duration = 15,
        unique = true
    },
    {
        name = "smoke_of_deceit",
        shortName = "smoke",
        msg = "Smoke of Deceit has been used",
        ability ="",
        duration = 35,
        unique = false
    },
    {
         name = "blink_dagger_start",
         shortName = "dagger",
         msg = "dagger",
         ability ="",
         duration = 4,
         unique = false
     },
    {  
        name = "queen_blink_start",
        msg ='',
        ability = "queenofpain_blink",
        duration = 4,
        unique = true
    },
    {  
        name = "bounty_hunter_windwalk",
        msg ='bounty is invisiable',
        ability = "bounty_hunter_wind_walk",
        duration = 8,
        unique = true
    },
    {  
        name = "antimage_blink_start",
        msg ='',
        ability = "antimage_blink",
        duration = 4,
        unique = true
    },
    {  
        name = "invoker_ice_wall",
        msg ='',
        ability = "invoker_ice_wall",
        duration = 4,
        unique = true
    },
    {  
        name = "invoker_emp",
        msg ='',
        ability = "invoker_emp",
        duration = 4,
        unique = true
    },
    {  
        name = "invoker_quas_orb",
        msg ='',
        ability = "invoker_quas",
        duration = 4,
        unique = true
    },
    {  
        name = "invoker_wex_orb",
        msg ='',
        ability = "invoker_wex",
        duration = 4,
        unique = true
    },
    {  
        name = "invoker_exort_orb",
        msg ='',
        ability = "invoker_exort",
        duration = 4,
        unique = true
    },
    {  
        name = "legion_commander_odds",
        msg ='',
        ability = "legion_commander_overwhelming_odds",
        duration = 4,
        unique = true
    },
    {  
        name = "roshan_spawn",
        msg ='Roshan respawned',
        ability = "",
        duration = 4,
        unique = true
    },
    {  
        name = "roshan_slam",
        shortName = "rosh",
        msg ='Roshan is under attack',
        ability = "",
        duration = 4,
        unique = true
    },
    {  
        name = "tiny_avalanche",
        msg ='',
        ability = "tiny_avalanche",
        duration = 4,
        unique = true
    },
    {  
        name = "tiny_toss",
        msg ='',
        ability = "tiny_toss",
        duration = 4,
        unique = true
    },
    {  
        name = "earthshaker_fissure",
        msg ='',
        ability = "earthshaker_fissure",
        duration = 4,
        unique = true
    },
    {  
        name = "shredder_tree_dmg",
        msg ='',
        ability = "shredder_timber_chain",
        duration = 4,
        unique = true
    },
    {  
        name = "shredder_chakram_stay",
        msg ='',
        ability = "shredder_chakram",
        duration = 4,
        unique = true
    },
    {  
        name = "shredder_chakram_return",
        msg ='',
        ability = "shredder_chakram",
        duration = 4,
        unique = true
    },
    {  
        name = "sandking_burrowstrike",
        msg ='',
        ability = "sandking_burrowstrike",
        duration = 4,
        unique = true
    },
    {  
        name = "sandking_sandstorm",
        msg ='',
        ability = "sandking_sand_storm",
        duration = 10,
        unique = true
    },
    {  
        name = "alchemist_unstable_concoction_timer",
        msg ='Alchemist has started unstable ',
        ability = "alchemist_unstable_concoction",
        duration = 10,
        unique = true
    },
    {  
        name = "alchemist_acid_spray",
        msg ='',
        ability = "alchemist_acid_spray",
        duration = 10,
        unique = true
    },
    {  
        name = "clinkz_windwalk",
        msg ='clinkz is invisble',
        ability = "clinkz_wind_walk",
        duration = 35,
        unique = true
    },
    {  
        name = "clinkz_death_pact",
        msg ='',
        ability = "clinkz_death_pact",
        duration = 4,
        unique = true
    },
    {  
        name = "razor_plasmafield",
        msg ='',
        ability = "razor_plasma_field",
        duration = 4,
        unique = true
    },
    {  
        name = "venomancer_ward_cast",
        msg ='',
        ability = "venomancer_plague_ward",
        duration = 4,
        unique = true
    },
    {  
        name = "meepo_poof_end",
        msg ='',
        ability = "meepo_poof",
        duration = 4,
        unique = true
    },
    {  
        name = "slark_dark_pact_pulses",
        msg ='',
        ability = "slark_dark_pact",
        duration = 4,
        unique = true
    },
    {  
        name = "slark_pounce_start",
        msg ='',
        ability = "slark_pounce",
        duration = 4,
        unique = true
    },
    {  
        name = "ember_spirit_sleight_of_fist_cast",
        msg ='',
        ability = "ember_spirit_sleight_of_fist",
        duration = 4,
        unique = true
    },
    {  
        name = "zuus_arc_lightning_head",
        msg ='',
        ability = "zuus_arc_lightning",
        duration = 4,
        unique = true
    },
    {  
        name = "zuus_thundergods_wrath_start",
        msg ='',
        ability = "zuus_thundergods_wrath",
        duration = 4,
        unique = true
    },
    {  
        name = "zuus_lightning_bolt_start",
        msg ='',
        ability = "zuus_lightning_bolt",
        duration = 4,
        unique = true
    },
    {  
        name = "lina_spell_light_strike_array",
        msg ='',
        ability = "lina_light_strike_array",
        duration = 4,
        unique = true
    },
    {  
        name = "leshrac_split_earth",
        msg ='',
        ability = "leshrac_split_earth",
        duration = 4,
        unique = true
    },
    {  
        name = "disruptor_kineticfield_formation",
        msg ='',
        ability = "disruptor_kinetic_field",
        duration = 4,
        unique = true
    },
    {  
        name = "jakiro_ice_path",
        msg ='',
        ability = "jakiro_ice_path",
        duration = 4,
        unique = true
    },
    {  
        name = "jakiro_dual_breath_ice",
        msg ='',
        ability = "jakiro_dual_breath",
        duration = 4,
        unique = true
    },
    {  
        name = "maiden_crystal_nova",
        msg ='',
        ability = "crystal_maiden_crystal_nova",
        duration = 4,
        unique = true
    },
    {  
        name = "phantom_assassin_phantom_strike_start",
        msg ='',
        ability = "phantom_assassin_phantom_strike",
        duration = 4,
        unique = true
    },
    {  
        name = "phantom_assassin_phantom_strike_end",
        msg ='',
        ability = "phantom_assassin_phantom_strike",
        duration = 4,
        unique = true
    },
    {  
        name = "stormspirit_ball_lightning",
        msg ='',
        ability = "storm_spirit_ball_lightning",
        duration = 4,
        unique = true
    },
    {  
        name = "ancient_apparition_ice_blast_final",
        msg ='has Ulted!!',
        ability = "ancient_apparition_ice_blast",
        duration = 4,
        unique = true
    },
    {  
        name = "ancient_apparition_chilling_touch",
        msg ='',
        ability = "ancient_apparition_chilling_touch",
        duration = 4,
        unique = true
    },
    {  
        name = "ancient_ice_vortex",
        msg ='',
        ability = "ancient_apparition_ice_vortex",
        duration = 4,
        unique = true
    },
    {  
        name = "weaver_shukuchi_damage",
        msg ='',
        ability = "weaver_shukuchi",
        duration = 4,
        unique = true
    },
    {  
        name = "weaver_shukuchi_start",
        msg ='',
        ability = "weaver_shukuchi",
        duration = 4,
        unique = true
    },
    {  
        name = "pudge_meathook",
        msg ='',
        ability = "pudge_meat_hook",
        duration = 4,
        unique = true
    },
    {  
        name = "rattletrap_cog_ambient",
        msg ='',
        ability = "rattletrap_power_cogs",
        duration = 4,
        unique = true
    },
    {  
        name = "rattletrap_hookshot",
        msg ='',
        ability = "rattletrap_hookshot",
        duration = 4,
        unique = true
    },
    {  
        name = "rattletrap_rocket_flare",
        msg ='',
        ability = "rattletrap_rocket_flare",
        duration = 4,
        unique = true
    },
    {  
        name = "tinker_rearm",
        msg ='',
        ability = "tinker_rearm",
        duration = 4,
        unique = true
    },
    {  
        name = "luna_lucent_beam",
        msg ='',
        ability = "luna_lucent_beam",
        duration = 4,
        unique = true
    },
    {  
        name = "pugna_netherblast",
        msg ='',
        ability = "pugna_nether_blast",
        duration = 4,
        unique = true
    },
    {  
        name = "monkey_king_strike_cast",
        msg ='',
        ability = "monkey_king_boundless_strike",
        duration = 4,
        unique = true
    },
    {  
        name = "monkey_king_jump_trail",
        msg ='',
        ability = "monkey_king_tree_dance",
        duration = 4,
        unique = true
    },
    {  
        name = "monkey_king_jump_launch_ring",
        msg ='',
        ability = "monkey_king_tree_dance",
        duration = 4,
        unique = true
    },
     {  
        name = "monkey_king_spring_channel",
        msg ='',
        ability = "monkey_king_primal_spring",
        duration = 4,
        unique = true
    },
    {  
        name = "axe_counterhelix",
        msg ='',
        ability = "axe_counter_helix",
        duration = 4,
        unique = true
    },
    {  
        name = "legion_commander_courage_hit",
        msg ='',
        ability = "legion_commander_moment_of_courage",
        duration = 4,
        unique = true
    },
    {  
        name = "legion_commander_press_owner",
        msg ='',
        ability = "legion_commander_press_the_attack",
        duration = 4,
        unique = true
    },
    {  
        name = "stormspirit_overload_discharge",
        msg ='',
        ability = "storm_spirit_overload",
        duration = 4,
        unique = true
    },
    {  
        name = "tinker_missile_dud",
        msg ='',
        ability = "tinker_heat_seeking_missile",
        duration = 4,
        unique = true
    },
    {  
        name = "warlock_fatal_bonds_pulse",
        msg ='',
        ability = "warlock_fatal_bonds",
        duration = 4,
        unique = true
    },
    {  
        name = "enchantress_natures_attendants_heal",
        msg ='',
        ability = "enchantress_natures_attendants",
        duration = 4,
        unique = true
    },
    {  
        name = "keeper_of_the_light_recall_cast",
        msg ='',
        ability = "keeper_of_the_light_recall",
        duration = 4,
        unique = true
    },
    {  
        name = "keeper_of_the_light_illuminate_charge",
        msg ='',
        ability = "keeper_of_the_light_illuminate",
        duration = 4,
        unique = true
    },
    {  
        name = "furion_teleport",
        msg ='',
        ability = "furion_teleportation",
        duration = 4,
        unique = true
    },
	{  
        name = "furion_teleport_end",
        msg ='',
        ability = "furion_teleportation",
        duration = 4,
        unique = true
    },
    {  
        name = "furion_force_of_nature_cast",
        msg ='',
        ability = "furion_force_of_nature",
        duration = 4,
        unique = true
    },
    {  
        name = "furion_sprout",
        msg ='',
        ability = "furion_sprout",
        duration = 4,
        unique = true
    },
    {  
        name = "invoker_chaos_meteor_fly",
        msg ='',
        ability = "invoker_chaos_meteor",
        duration = 4,
        unique = true
    },
    {  
        name = "lone_druid_true_form_end",
        msg ='',
        ability = "lone_druid_true_form",
        duration = 4,
        unique = true
    },
    {  
        name = "lone_druid_true_form",
        msg ='',
        ability = "lone_druid_true_form",
        duration = 4,
        unique = true
    },
    {  
        name = "lone_druid_rabid_buff",
        msg ='',
        ability = "lone_druid_rabid",
        duration = 4,
        unique = true
    },
    {  
        name = "lone_druid_bear_spawn",
        msg ='',
        ability = "lone_druid_spirit_bear",
        duration = 4,
        unique = true
    },
    {  
        name = "enchantress_natures_attendants_heal",
        msg ='',
        ability = "enchantress_natures_attendants",
        duration = 4,
        unique = true
    },
	
    {  
        name = "disruptor_thunder_strike_bolt",
        msg ='',
        ability = "disruptor_thunder_strike",
        duration = 4,
        unique = true
    },
    {  
        name = "disruptor_thunder_strike_aoe",
        msg ='',
        ability = "disruptor_thunder_strike",
        duration = 4,
        unique = true
    },
    {  
        name = "ursa_overpower_buff",
        msg ='',
        ability = "ursa_overpower",
        duration = 4,
        unique = true
    },
    {  
        name = "chen_teleport_cast",
        msg ='',
        ability = "chen_test_of_faith_teleport",
        duration = 4,
        unique = true
    },
    {  
        name = "chen_cast_1",
        msg ='',
        ability = "chen_penitence",
        duration = 4,
        unique = true
    },
	{  
        name = "chen_cast_3",
        msg ='',
        ability = "chen_holy_persuasion",
        duration = 4,
        unique = true
    },
    {  
        name = "chen_cast_4",
        msg ='',
        ability = "chen_hand_of_god",
        duration = 4,
        unique = true
    },
	{  
        name = "chen_cast_2",
        msg ='',
        ability = "chen_test_of_faith",
        duration = 4,
        unique = true
    },
    {  
        name = "chen_penitence",
        msg ='',
        ability = "chen_penitence",
        duration = 4,
        unique = true
    },
    {  
        name = "omniknight_purification_cast",
        msg ='',
        ability = "omniknight_purification",
        duration = 4,
        unique = true
    },
    {  
        name = "omniknight_repel_cast",
        msg ='',
        ability = "omniknight_repel",
        duration = 4,
        unique = true
    },
    {  
        name = "mirana_moonlight_cast",
        msg ='',
        ability = "mirana_invis",
        duration = 4,
        unique = true
    },
    {  
        name = "maiden_frostbite_buff",
        msg ='',
        ability = "crystal_maiden_frostbite",
        duration = 4,
        unique = true
    },
    {  
        name = "arc_warden_tempest_cast",
        msg ='',
        ability = "arc_warden_tempest_double",
        duration = 4,
        unique = true
    },
    {  
        name = "arc_warden_wraith_cast",
        msg ='',
        ability = "arc_warden_spark_wraith",
        duration = 4,
        unique = true
    },
    {  
        name = "arc_warden_magnetic_cast",
        msg ='',
        ability = "arc_warden_magnetic_field",
        duration = 4,
        unique = true
    },
    {  
        name = "emberspirit_flame_shield_aoe_impact",
        msg ='',
        ability = "ember_spirit_flame_guard",
        duration = 4,
        unique = true
    },
    {  
        name = "ember_spirit_flameguard",
        msg ='',
        ability = "ember_spirit_flame_guard",
        duration = 4,
        unique = true
    },
    {  
        name = "huskar_life_break",
        msg ='',
        ability = "huskar_life_break",
        duration = 4,
        unique = true
    },
    {  
        name = "oracle_fortune_cast_channel",
        msg ='',
        ability = "oracle_fortunes_end",
        duration = 4,
        unique = true
    },
    {  
        name = "oracle_fatesedict_cast",
        msg ='',
        ability = "oracle_fates_edict",
        duration = 4,
        unique = true
    },
    {  
        name = "templar_assassin_refract_hit",
        msg ='',
        ability = "templar_assassin_refraction",
        duration = 4,
        unique = true
    },
    {  
        name = "templar_assassin_refraction",
        msg ='',
        ability = "templar_assassin_refraction",
        duration = 4,
        unique = true
    },
    {  
        name = "skywrath_mage_ancient_seal_debuff",
        msg ='',
        ability = "skywrath_mage_ancient_seal",
        duration = 4,
        unique = true
    },
    {  
        name = "skywrath_mage_arcane_bolt_cast",
        msg ='',
        ability = "skywrath_mage_arcane_bolt",
        duration = 4,
        unique = true
    },
    {  
        name = "abbadon_weapon_create",
        msg ='',
        ability = "abaddon_aphotic_shield",
        duration = 4,
        unique = true
    },
    {  
        name = "abbadon_weapon_destroy",
        msg ='',
        ability = "abaddon_aphotic_shield",
        duration = 4,
        unique = true
    },
    {  
        name = "abaddon_borrowed_time",
        msg ='',
        ability = "abbadon_borrowed_time",
        duration = 4,
        unique = true
    },
    {  
        name = "abbadon_aphotic_shield_hit",
        msg ='',
        ability = "abaddon_aphotic_shield",
        duration = 4,
        unique = true
    },
    {  
        name = "sven_spell_storm_bolt_lightning",
        msg ='',
        ability = "sven_storm_bolt",
        duration = 4,
        unique = true
    },
    {  
        name = "wisp_overcharge",
        msg ='',
        ability = "wisp_overcharge",
        duration = 4,
        unique = true
    },
    {  
        name = "wisp_relocate_teleport_out",
        msg ='',
        ability = "wisp_relocate",
        duration = 4,
        unique = true
    },
    {  
        name = "wisp_relocate_channel",
        msg ='',
        ability = "wisp_relocate",
        duration = 4,
        unique = true
    },
    {  
        name = "broodmother_spin_web_cast",
        msg ='',
        ability = "broodmother_spin_web",
        duration = 4,
        unique = true
    },
    {  
        name = "broodmother_huger_buff",
        msg ='',
        ability = "broodmother_insatiable_hunger",
        duration = 4,
        unique = true
    },
	{  
        name = "shredder_timber_chain_tree",
        msg ='',
        ability = "shredder_timber_chain",
        duration = 4,
        unique = true
    },
	{  
        name = "shredder_whirling_death",
        msg ='',
        ability = "shredder_whirling_death",
        duration = 4,
        unique = true
    },
	{  
        name = "death_prophet_silence_cast",
        msg ='',
        ability = "death_prophet_silence",
        duration = 4,
        unique = true
    },
	{  
        name = "ember_spirit_fire_remnant",
        msg ='',
        ability = "ember_spirit_fire_remnant",
        duration = 4,
        unique = true
    },
	{  
        name = "ember_spirit_sleight_of_fist_cast",
        msg ='',
        ability = "ember_spirit_sleight_of_fist",
        duration = 4,
        unique = true
    },
	{  
        name = "veil_of_discord",
        msg ='',
        ability = "item_veil_of_discord",
        duration = 4,
        unique = true
    },
	{  
        name = "hand_of_midas",
        msg ='',
        ability = "item_hand_of_midas",
        duration = 4,
        unique = true
    },
	{  
        name = "chain_lightning",
        msg ='',
        ability = "item_mjollnir",
        duration = 4,
        unique = true
    },
	{  
        name = "pipe_of_insight_launch",
        msg ='',
        ability = "item_pipe",
        duration = 4,
        unique = true
    },
	{  
        name = "refresher",
        msg ='',
        ability = "item_refresher",
        duration = 4,
        unique = true
    },
	{  
        name = "vanguard_active_launch",
        msg ='',
        ability = "item_crimson_guard",
        duration = 4,
        unique = true
    },
	{  

        name = "teleport_end", "teleport_start",
        msg ='',
        ability = "item_tpscroll","item_travel_boots",
        duration = 4,
        unique = true
    },
	{  
        name = "dagon",
        msg ='',
        ability = "item_dagon",
        duration = 4,
        unique = true
    },
	{  
        name = "butterfly_active",
        msg ='',
        ability = "item_butterfly",
        duration = 4,
        unique = true
    },
	{  
        name = "smoke_of_deceit",
        msg ='',
        ability = "item_smoke_of_deceit",
        duration = 4,
        unique = true
    },
	{  
        name = "dust_of_appearance",
        msg ='',
        ability = "item_dust",
        duration = 4,
        unique = true
    },
	{  
        name = "pipe_of_insight",
        msg ='',
        ability = "item_pipe", "item_hood_of_defiance",
        duration = 4,
        unique = true
    },
	{  
        name = "iron_talon_active",
        msg ='',
        ability = "item_iron_talon",
        duration = 4,
        unique = true
    },
	
	{  
        name = "dagon",
        msg ='',
        ability = "item_dagon",
        duration = 4,
        unique = true
    },
	{  
        name = "urn_of_shadows",
        msg ='',
        ability = "item_urn_of_shadows",
        duration = 4,
        unique = true
    },
	{  
        name = "ogre_magi_bloodlust_cast",
        msg ='',
        ability = "ogre_magi_bloodlust",
        duration = 4,
        unique = true
    },
	{  
        name = "tidehunter_anchor_hero",
        msg ='',
        ability = "tidehunter_anchor_smash",
        duration = 4,
        unique = true
    },
    {  
        name = "techies_remote_mine_plant",
        msg ='',
        ability = "techies_remote_mines",
        duration = 100,
        unique = true
    },
    {  
        name = "techies_stasis_trap_plant",
        msg ='',
        ability = "techies_stasis_trap",
        duration = 100,
        unique = true
    }
}

AbilityAlert2.teamSpecific = 
{
    -- unique because this particle gets created for every enemy team hero.
    {  
        name = "mirana_moonlight_recipient",
        msg = "Mirana has used her ult",
        duration = 15,
        unique = true
    }
}

-- Returns true if an alert was created, false otherwise.
function AbilityAlert2.InsertAmbiguous(particle)
    local myHero = Heroes.GetLocal()
    for i, enemyAbility in ipairs(AbilityAlert2.ambiguous) do
        if particle.name == enemyAbility.name then
            local enemy = nill
            local ally = nill
            for i = 1, Heroes.Count() do
                local hero = Heroes.Get(i)
                if not NPC.IsIllusion(hero) then
                    local sameTeam = Entity.GetTeamNum(hero) == Entity.GetTeamNum(myHero)
                    if not sameTeam and NPC.GetAbility(hero, enemyAbility.ability) or NPC.GetAbility(hero, enemyAbility.ability) and not NPC.GetAbility(myHero, enemyAbility.ability) then 
                        enemy = hero
                    end
                    if sameTeam and NPC.GetAbility(hero, enemyAbility.ability) then
                        ally = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_veil_of_discord", true) and particle.name == "veil_of_discord" and not NPC.GetItem(myHero, "item_veil_of_discord", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_hand_of_midas", true) and particle.name == "hand_of_midas" and not NPC.GetItem(myHero, "item_hand_of_midas", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_mjollnir", true) and particle.name == "chain_lightning" and not NPC.GetItem(myHero, "item_mjollnir", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_pipe", true) and (particle.name == "pipe_of_insight_launch" or  particle.name == "pipe_of_insight") and not NPC.GetItem(myHero, "item_pipe", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_tpscroll", true) and (particle.name == "teleport_end" or particle.name == "teleport_start")  and not NPC.GetItem(myHero, "item_tpscroll", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_travel_boots", true) and (particle.name == "teleport_end" or particle.name == "teleport_start") and not NPC.GetItem(myHero, "item_travel_boots", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_crimson_guard", true) and particle.name == "vanguard_active_launch" and not NPC.GetItem(myHero, "item_crimson_guard", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_refresher", true) and particle.name == "refresher" and not NPC.GetItem(myHero, "item_refresher", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_urn_of_shadows", true) and particle.name == "urn_of_shadows" and not NPC.GetItem(myHero, "item_urn_of_shadows", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_dagon", true) and particle.name == "dagon" and not NPC.GetItem(myHero, "item_dagon", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_iron_talon", true) and particle.name == "iron_talon_active" and not NPC.GetItem(myHero, "item_iron_talon", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_dust", true) and particle.name == "dust_of_appearance" and not NPC.GetItem(myHero, "item_dust", true) then 
                        enemy = hero
                    end
					if not sameTeam and NPC.GetItem(hero, "item_smoke_of_deceit", true) and particle.name == "smoke_of_deceit" and not NPC.GetItem(myHero, "item_smoke_of_deceit", true) then 
                        enemy = hero
                    end
                end
            end

            local newAlert = {
                index = particle.index,
                name = enemyAbility.name,
                msg = enemyAbility.msg,
                endTime = os.clock() + enemyAbility.duration,
                shortName = enemyAbility.shortName
            }
            if enemy then
                newAlert['enemy'] = NPC.GetUnitName(enemy)
                newAlert['msg'] = string.sub (NPC.GetUnitName(enemy),string.len("npc_dota_hero_")-string.len(NPC.GetUnitName(enemy)))..enemyAbility.msg
                table.insert(AbilityAlert2.alerts, newAlert)
            end 
            if ally then return end
            table.insert(AbilityAlert2.alerts, newAlert)

            return true
        end
    end

    return false
end

-- Returns true if an alert was created (or an existing one was extended), false otherwise.
function AbilityAlert2.InsertTeamSpecific(particle)
    local myHero = Heroes.GetLocal()

    
    if particle.entity == nil then return end
	
    if Entity.GetTeamNum(particle.entity) == Entity.GetTeamNum(myHero) then return end

    for i, enemyAbility in ipairs(AbilityAlert2.teamSpecific) do
        if particle.name == enemyAbility.name then
            local newAlert = {
                index = particle.index,
                name = enemyAbility.name,
                msg = enemyAbility.msg,
                endTime = os.clock() + enemyAbility.duration,
                shortName = enemyAbility.shortName
            }

            if not enemyAbility.unique then
                table.insert(AbilityAlert2.alerts, newAlert)
                
                return true
            else 
                -- Look for an existing alert.
                for k, alert in ipairs(AbilityAlert2.alerts) do
                    if alert.msg == newAlert.msg then
                        alert.endTime = newAlert.endTime -- Just extend the existing time.

                        return true
                    end
                end

                -- Insert the new alert.
                table.insert(AbilityAlert2.alerts, newAlert)

                return true
            end
        end
    end

    return false
end

--
-- Callbacks
--
function AbilityAlert2.OnParticleCreate(particle)

    if not Menu.IsEnabled(AbilityAlert2.option) then return end

    if not AbilityAlert2.InsertAmbiguous(particle) then
        AbilityAlert2.InsertTeamSpecific(particle)
    end
end
function AbilityAlert2.OnParticleUpdateEntity(particle)
    for k, alert in ipairs(AbilityAlert2.alerts) do
	
        if particle.index == alert.index then
            alert.position = particle.position
        end
    end
end 
function AbilityAlert2.OnParticleUpdate(particle)
    if particle.controlPoint ~= 0 then return end
    for k, alert in ipairs(AbilityAlert2.alerts) do
	
        if particle.index == alert.index then
            alert.position = particle.position
        end
    end
end



function AbilityAlert2.OnDraw()
    for i, alert in ipairs(AbilityAlert2.alerts) do
        local timeLeft = alert.endTime - os.clock()

        if timeLeft < 0 then
            table.remove(AbilityAlert2.alerts, i)
        else
            -- Fade out the last 5 seconds of the alert.
            local alpha = 255 * math.min(timeLeft / 5, 1)

            -- Some really obnoxious color to grab your attention.
            Renderer.SetDrawColor(255, 0, 255, math.floor(alpha))

            local w, h = Renderer.GetScreenSize()
	local xAlert = Menu.GetValue(AbilityAlert2.xAlert)
    local yAlert = Menu.GetValue(AbilityAlert2.yAlert)
            Renderer.DrawTextCentered(AbilityAlert2.font, w+xAlert, h+yAlert + (i - 1) * 22, alert.msg, 1)

            if alert.position then 
                local x, y, onScreen = Renderer.WorldToScreen(alert.position)

                if onScreen then
                    if alert.enemy then
                        AbilityAlert2.DrawMiniHero(x, y, alert.enemy)
                    else  
                        Renderer.DrawTextCentered(AbilityAlert2.mapFont, x, y, alert.name, 1)
                    end 
                    --Renderer.DrawFilledRect(x - 5, y - 5, 10, 10)
                end
                if alert.enemy then
                    AbilityAlert2.drawMiniHeroOnMap(alert.position:GetX(), alert.position:GetY(),alert.enemy)
                else
                    AbilityAlert2.drawPosition(alert.position, alert.shortName)
                end 
            end
        end
    end
end

function AbilityAlert2.DrawMiniHero(x, y, heroName)
    local shortName =   string.sub (heroName, string.len("npc_dota_hero_")-string.len(heroName))
    local imageHandle = AbilityAlert2.cachedIcons[shortName]

    if imageHandle == nil then
        imageHandle = Renderer.LoadImage(AbilityAlert2.miniHero .. shortName .. ".png")
        AbilityAlert2.cachedIcons[shortName] = imageHandle
    end
    local imageColor = { 255, 255, 255 }
    Renderer.SetDrawColor(imageColor[1], imageColor[2], imageColor[3], 255)
    local size = Menu.GetValue(AbilityAlert2.boxSizeOption)
    Renderer.DrawImage(imageHandle, x-math.floor(size/2), y-math.floor(size/2), size, size)
end

function AbilityAlert2.drawMiniHeroOnMap(x,y,enemyName)
    if not enemyName then return end
    local w, h = Renderer.GetScreenSize()
    local x0 =AbilityAlert2.mapOrigin['x']
    local y0 =AbilityAlert2.mapOrigin['y']

    local ratio = 14000/300

    local ratioOffset = Menu.GetValue(AbilityAlert2.ratioOffset)
    local xOffset = Menu.GetValue(AbilityAlert2.xOffset)
    local yOffset = Menu.GetValue(AbilityAlert2.yOffset)

    local newX = math.floor((x -x0)/(ratio+ratioOffset/10))
    local newY = math.floor((y -y0)/(ratio+ratioOffset/10))

    local shortName =   string.sub (enemyName, string.len("npc_dota_hero_")-string.len(enemyName))
    local imageHandle = AbilityAlert2.cachedIcons[shortName]

    if imageHandle == nil then
        imageHandle = Renderer.LoadImage(AbilityAlert2.miniHero .. shortName .. ".png")
        AbilityAlert2.cachedIcons[shortName] = imageHandle
    end
    local imageColor = { 255, 255, 255 }
    Renderer.SetDrawColor(imageColor[1], imageColor[2], imageColor[3], 255)
    local size = Menu.GetValue(AbilityAlert2.miniBoxSizeOption)

    Renderer.DrawImage(imageHandle, 15+newX-math.floor(size/2)+xOffset, (h-315-newY-math.floor(size/2)-yOffset), size , size)
end

function AbilityAlert2.drawPosition(pos,enemyName)
    if not enemyName then return end
    local w, h = Renderer.GetScreenSize()
    local x0 =AbilityAlert2.mapOrigin['x']
    local y0 =AbilityAlert2.mapOrigin['y']

    local ratio = 14000/300

    local ratioOffset = Menu.GetValue(AbilityAlert2.ratioOffset)
    local xOffset = Menu.GetValue(AbilityAlert2.xOffset)
    local yOffset = Menu.GetValue(AbilityAlert2.yOffset)

    local x = pos:GetX()
    local y = pos:GetY()

    local newX = math.floor((x -x0)/(ratio+ratioOffset/10))
    local newY = math.floor((y -y0)/(ratio+ratioOffset/10))
    Renderer.SetDrawColor(0, 255, 127)
    Renderer.DrawTextCentered(AbilityAlert2.mapFont, 15+newX +xOffset , (h-315-newY-yOffset) , enemyName, 1)
end
return AbilityAlert2
