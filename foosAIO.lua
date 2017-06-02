-- foosAIO.lua
-- Version: 0.33a (alpha initial release)
-- Author: foo0oo
-- Release Date: 2017/5/03

local fooAllInOne = {}
-- Menu Items
	-- general Menu
fooAllInOne.optionEnable = Menu.AddOption({ "Utility","foos AllInOne" }, "Enabled", "Helpers helper")
fooAllInOne.optionComboKey = Menu.AddKeyOption({ "Utility","foos AllInOne" }, "Combo Key", Enum.ButtonCode.KEY_SPACE)
fooAllInOne.optionDebugEnable = Menu.AddOption({ "Utility","foos AllInOne" }, "Debug", "shoulb be off, just for developers")
	-- killsteal Menu
fooAllInOne.optionKillStealEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Kill Steal" }, "Enabled", "uses skill nukes to kill enemy (only nukes, no disable abilities)")
fooAllInOne.optionKillStealInvoker = Menu.AddOption({ "Utility","foos AllInOne", "Auto Kill Steal", "Invoker" }, "Auto Sunstrike KillSteal", "tries to kill steal MOVING enemys")
fooAllInOne.optionKillStealInvokerTurn = Menu.AddOption({ "Utility","foos AllInOne", "Auto Kill Steal", "Invoker" }, "Turn check adjustment", "amount of game ticks enemy must run in a straight line (30 ticks ~ 1 sec)", 10, 60, 5)
fooAllInOne.optionKillStealAutoInvoke = Menu.AddOption({ "Utility","foos AllInOne", "Auto Kill Steal", "Invoker" }, "Auto Invoke Sunstrike", "will auto invoke SS if not in slot and enemy killable")
	-- Items Menu
fooAllInOne.optionItemEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Enabled", "Helpers helper")
fooAllInOne.optionItemStyle = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Choose activation style", "", 0, 2, 1)
fooAllInOne.optionItemSoulring = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Soulring", "Use Soulring before using spells")
fooAllInOne.optionItemVeil = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Veil Of Discord", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemHex = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Scythe Of Vyse", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemBlood = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Bloodthorn ", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemeBlade = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Ethereal Blade", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemOrchid = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Orchid Malevolence", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemAtos = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Rod Of Atos", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemAbyssal = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Abyssal Blade", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemHalberd = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Heavens Halbert", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemShivas = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Shivas Guard", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemDagon = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Dagon", "cast order - highest number will be cast first", -1, 10, 1)
fooAllInOne.optionItemUrn = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Urn of shadows", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemManta = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Manta Style", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemMjollnir = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Mjollnir", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemMedallion = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Medallion of Courage", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemCrest = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage", "Items" }, "Use Item Solar Crest", "cast order - highest number will be cast first", 0, 10, 1)
	-- Linkens Menu
fooAllInOne.optionLinkensEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Enabled", "Helpers helper")
fooAllInOne.optionLinkensForce = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Force Staff", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensEul = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Eul", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensHalberd = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Halberd", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensHex = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Hex", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensBlood = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Bloodthorn", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensOrchid = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Orchid", "to break Linkens - highest number will be prioritized", 0, 6, 1)
	-- Utility Items Menu
fooAllInOne.optionUtilityEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Enabled", "Helpers helper")
fooAllInOne.optionUtilityMidas = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items", "Midas" }, "Auto Use Midas", "use midas on creeps automatically")
fooAllInOne.optionUtilityMidasXP = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items", "Midas" }, "Min XP threshold", "", 0, 1, 1)
fooAllInOne.optionUtilityStick = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Stick/Wand", "will auto use stick/wand when hp below hp threshold")
fooAllInOne.optionUtilityHealth = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Treshold Hero Health", "Threshold for auto use stick, wand, mek, greaves", 5, 75, 5)
fooAllInOne.optionUtilityMek = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Mekansm", "will use mek when you or teammate in range is below hp threshold")
fooAllInOne.optionUtilityGreaves = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Greaves", "same as mek")
fooAllInOne.optionUtilityTalon = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Talon", "will use talon on highest hp creep (only neutrals)")
fooAllInOne.optionUtilityArcane = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Arcane Boots", "will use arcanes if you are mana missing or teammate in range is below 40% mana")
	-- Hero Menu
fooAllInOne.optionHeroAxe = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Axe" }, "Axe Combo", "basic axe script, will focus nearest hero to cursor")
fooAllInOne.optionHeroAxeJump = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Axe" }, "Axe Jump Style", "blink to nearest enemy to cursor or blink to best position if multiple enemies could be called", 0, 1, 1)
fooAllInOne.optionHeroAxeForceBlink = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Axe" }, "Force blink", "hero will blink when combo button is pressed, even if no enemy is around (e.g. for blinking in FoW) or cursor is not in range of enemy (adjust the range below!)")
fooAllInOne.optionHeroAxeForceBlinkRange = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Axe" }, "Force Blink Check Range", "if force blink is activated, hero will blink to mouse cursor instead of enemy, if mouse cursor is outside of force blink check range", 150, 750, 50)
fooAllInOne.optionHeroClock = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Clockwerk Combo", "full combo with hookshot prediction (will not check for collision with npcs)")
fooAllInOne.optionHeroSky = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Skywrath Combo", "full combo")
fooAllInOne.optionHeroTiny = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Tiny Combo", "full combo")
fooAllInOne.optionHeroWindrunner = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Windrunner Combo", "if branch in inventory, full combo with tree plant ;); else: if target shakled, then combo")
fooAllInOne.optionHeroTimber = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Timber Combo", "meh, cant target trees.. timberchain to cursor, if enemys are hit, full combo with chakram prediction")
fooAllInOne.optionHeroEmber = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Ember Combo" }, "Ember Combo", "hold combo key -> full combo with remnant, release key after ~ 1 sec -> fist+chains")
fooAllInOne.optionHeroEmberUlt = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Ember Combo" }, "Ember Ult Usage in Combo", "", 0, 1, 1)
fooAllInOne.optionHeroUrsa = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Ursa Combo", "full combo, trigger enrage if 2 or more heroes in range")
fooAllInOne.optionHeroTA = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Templar Assassin" }, "TA Combo", "full combo")
fooAllInOne.optionHeroTATrap = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Templar Assassin" }, "Cast/Pop trap before combo", "")
fooAllInOne.optionHeroTABlink = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Templar Assassin" }, "Use blink in Combo", "")
fooAllInOne.optionHeroLegion = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Legion Commander Combo", "full combo")
fooAllInOne.optionHeroSlardar = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Slardar" }, "Slardar Combo", "full combo")
fooAllInOne.optionHeroSlardarStyle = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Slardar" }, "Slardar Jump Style", "blink to nearest enemy to cursor or blink to best position if multiple enemies could be crushed", 0, 1, 1)
fooAllInOne.optionHeroClinkz = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Clinkz" }, "Clinkz Combo", "full combo")
fooAllInOne.optionHeroClinkzUlt = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Clinkz" }, "Auto Ultimate", "auto ult on enemy creeps or neutrals when ready")
fooAllInOne.optionHeroQoP = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Queen of Pain Combo", "full combo; only uses ult if you have agahnims")
fooAllInOne.optionHeroSven = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Sven Combo", "full combo, MoM after everything is used")
fooAllInOne.optionHeroVisage = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Visage" }, "Visage Combo", "full combo with Familiars")
fooAllInOne.optionHeroVisageDMGStacks = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Visage" }, "Familiar DMG stacks", "number of remaining familiar damage stacks when starting stun chain", 1, 6, 1)
fooAllInOne.optionHeroArcWarden = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "1.0 Arc Warden Combo", "full combo with double")
fooAllInOne.optionHeroArcWardenMagnetic = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "1.1 Use magnetic field", "cast magnetic field with main hero in combo (double always uses magnetic field)")
fooAllInOne.optionHeroArcWardenPush = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "3.0 Arc Warden TP Push Mode", "push mode with double, if you have BoTs")
fooAllInOne.optionHeroArcWardenTempest = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "2.0 Tempest double combo", "will only combo with your double, not with main. BUTTON NEEDS TO BE PRESSED DOWN! will target first enemies nearest mouse, then enemies in range, then creeps in range, if nothing in range, it will push (fountain or cursor)")
fooAllInOne.optionArcWardenPushKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "3.1TP Push Key", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroArcWardenPushTPStyle = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "3.2 TP targeting style", "", 0, 1, 1)
fooAllInOne.optionHeroArcWardenPushTPSelect = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "3.3 Auto line selector", "", 0, 1, 1)
fooAllInOne.optionArcWardenTempestKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "2.1 Tempest double combo/push key", Enum.ButtonCode.KEY_O)
fooAllInOne.optionHeroArcWardenTempestTarget = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden" }, "2.2 Tempest direction", "if tempest double combo/push key is pressed, push in the direction of cursor or enemy fountain", 0, 1, 1)
fooAllInOne.optionHeroArcWardenDraw = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden", "Drawings" }, "Draw Item Cooldowns on Double", "will shot the cooldown of BoTs, midas, necronomicon")
--fooAllInOne.optionHeroArcWardenFont = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden", "Drawings" }, "Font size", "", 10, 50, 5)
fooAllInOne.optionHeroArcWardenXPos = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden", "Drawings" }, "X-position", "", -500, 500, 10)
fooAllInOne.optionHeroArcWardenYPos = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Arc Warden", "Drawings" }, "Y-position", "", -500, 500, 10)
fooAllInOne.optionHeroMorphling = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Morphling" }, "Morphling Combo", "full shotgun combo")
fooAllInOne.optionHeroMorphlingKill = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts", "Morphling" }, "Draw kill indicator", "will draw a kill indicator if target is killable with full shotgun combo")
	-- Menu set values
Menu.SetValueName(fooAllInOne.optionItemVeil, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemHex, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemBlood, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemeBlade, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemOrchid, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemAtos, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemAbyssal, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemHalberd, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemShivas, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemUrn, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemDagon, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemDagon, -1, 'only if killable')
Menu.SetValueName(fooAllInOne.optionItemManta, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemMjollnir, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemMedallion, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemCrest, 0, 'OFF')

Menu.SetValueName(fooAllInOne.optionItemVeil, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemHex, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemBlood, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemeBlade, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemOrchid, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemAtos, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemAbyssal, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemHalberd, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemShivas, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemUrn, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemDagon, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemManta, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemMjollnir, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemMedallion, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemCrest, 1, 'ON')

Menu.SetValueName(fooAllInOne.optionItemStyle, 0, 'max speed, no order')
Menu.SetValueName(fooAllInOne.optionItemStyle, 1, 'ordered')
Menu.SetValueName(fooAllInOne.optionItemStyle, 2, 'smart ordered')

Menu.SetValueName(fooAllInOne.optionLinkensForce, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensEul, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensHalberd, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensHex, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensBlood, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensOrchid, 0, 'OFF')

Menu.SetValueName(fooAllInOne.optionUtilityMidasXP, 0, 'melee creep')
Menu.SetValueName(fooAllInOne.optionUtilityMidasXP, 1, 'range creep')

Menu.SetValueName(fooAllInOne.optionHeroEmberUlt, 0, 'use all charges')
Menu.SetValueName(fooAllInOne.optionHeroEmberUlt, 1, 'use one charge')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPStyle, 0, 'auto select lane')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPStyle, 1, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPSelect, 0, 'furthest pushed')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPSelect, 1, 'least pushed')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenTempestTarget, 0, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenTempestTarget, 1, 'fountain')
Menu.SetValueName(fooAllInOne.optionHeroAxeJump, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroAxeJump, 1, 'blink best position')
Menu.SetValueName(fooAllInOne.optionHeroSlardarStyle, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroSlardarStyle, 1, 'blink best position')

	-- global Variables
fooAllInOne.lastCastTime = 0
fooAllInOne.lastCastTime2 = 0
fooAllInOne.lastTick = 0
fooAllInOne.delay = 0
fooAllInOne.itemDelay = 0
fooAllInOne.lastItemTick = 0
fooAllInOne.ItemCastStop = false
fooAllInOne.ControlledUnitCastTime = 0
fooAllInOne.ControlledUnitPauseTime = 0
fooAllInOne.lastAttackTime = 0
fooAllInOne.lastAttackTime2 = 0
fooAllInOne.LastTarget = nil
fooAllInOne.LastTickManta1 = 0
fooAllInOne.LastTickManta2 = 0
fooAllInOne.ArcWardenEntity = nil
fooAllInOne.IconPath = "resource/flash3/images/small_boost_icons/"
fooAllInOne.font = Renderer.LoadFont("Tahoma", 25, Enum.FontWeight.EXTRABOLD)
	-- global Tables
fooAllInOne.LinkensBreakerItemOrder = {}
fooAllInOne.ItemCastOrder = {}
fooAllInOne.rotationTable = {}
fooAllInOne.invokerInvokeOrder =
	{
		invoker_sun_strike = { 2, 2, 2 },
		invoker_emp = { 1, 1, 1 },
		invoker_tornado = { 0, 1, 1 },
		invoker_alacrity = { 1, 1, 2 },
		invoker_ghost_walk = { 0, 0, 1 },
		invoker_deafening_blast = { 0, 1, 2 },
		invoker_chaos_meteor = { 1, 2, 2 },
		invoker_cold_snap = { 0, 0, 0 },
		invoker_ice_wall = { 0, 0, 2 },
		invoker_forge_spirit = { 0, 2, 2 }
	}
fooAllInOne.AbilityList = {
{ "npc_dota_hero_abaddon", "abaddon_death_coil", "nuke", "target" , "target_damage" },
{ "npc_dota_hero_abaddon", "abaddon_frostmourne", "utility", "0" , "0" },
{ "npc_dota_hero_abaddon", "abaddon_aphotic_shield", "utility", "0" , "0" },
{ "npc_dota_hero_abaddon", "abaddon_borrowed_time", "utility", "0" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_pit_of_malice", "disable", "position" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_firestorm", "nuke", "position" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_atrophy_aura", "utility", "0" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_dark_rift", "utility", "0" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_unstable_concoction", "disable", "target" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_unstable_concoction_throw", "disable", "target" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_acid_spray", "utility", "0" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_chemical_rage", "utility", "0" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_goblins_greed", "utility", "0" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_blast", "nuke", "position" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_blast_release", "nuke", "position" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_chilling_touch", "utility", "0" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_cold_feet", "utility", "0" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_vortex", "utility", "0" , "0" },
{ "npc_dota_hero_antimage", "antimage_mana_void"    , "nuke", "target" , "0" },
{ "npc_dota_hero_antimage", "antimage_blink", "utility", "0" , "0" },
{ "npc_dota_hero_antimage", "antimage_mana_break", "utility", "0" , "0" },
{ "npc_dota_hero_antimage", "antimage_spell_shield", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_flux", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_magnetic_field", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_spark_wraith", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_tempest_double", "utility", "0" , "0" },
{ "npc_dota_hero_axe", "axe_berserkers_call", "disable", "no target" , "0" },
{ "npc_dota_hero_axe", "axe_culling_blade", "nuke", "target" , "0" },
{ "npc_dota_hero_axe", "axe_battle_hunger", "utility", "0" , "0" },
{ "npc_dota_hero_axe", "axe_counter_helix", "utility", "0" , "0" },
{ "npc_dota_hero_bane", "bane_brain_sap", "nuke", "target" , "brain_sap_damage" },
{ "npc_dota_hero_bane", "bane_fiends_grip", "nuke", "target" , "0" },
{ "npc_dota_hero_bane", "bane_enfeeble", "utility", "0" , "0" },
{ "npc_dota_hero_bane", "bane_nightmare", "utility", "0" , "0" },
{ "npc_dota_hero_bane", "bane_nightmare_end", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_firefly", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_flamebreak", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_flaming_lasso", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_sticky_napalm", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_wild_axes", "nuke", "position" , "axe_damage" },
{ "npc_dota_hero_beastmaster", "beastmaster_primal_roar", "disable", "no target" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_boar_poison", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_call_of_the_wild", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_call_of_the_wild_boar", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_greater_boar_poison", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_hawk_invisibility", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_inner_beast", "utility", "0" , "0" },
{ "npc_dota_hero_bloodseeker", "bloodseeker_blood_bath", "nuke", "position" , "damage" },
{ "npc_dota_hero_bloodseeker", "bloodseeker_rupture", "utility", "0" , "0" },
{ "npc_dota_hero_bloodseeker", "bloodseeker_thirst", "utility", "0" , "0" },
{ "npc_dota_hero_bounty_hunter", "bounty_hunter_shuriken_toss", "nuke", "target" , "bonus_damage" },
{ "npc_dota_hero_bounty_hunter", "bounty_hunter_jinada", "utility", "0" , "0" },
{ "npc_dota_hero_bounty_hunter", "bounty_hunter_track", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_thunder_clap", "nuke", "no target" , "damage" },
{ "npc_dota_hero_brewmaster", "brewmaster_earth_hurl_boulder", "disable", "target" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_drunken_brawler", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_drunken_haze", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_earth_pulverize", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_earth_spell_immunity", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_fire_permanent_immolation", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_primal_split", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_storm_cyclone", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_storm_dispel_magic", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_storm_wind_walk", "utility", "0" , "0" },
{ "npc_dota_hero_bristleback", "bristleback_quill_spray", "nuke", "no target" , "quill_base_damage" },
{ "npc_dota_hero_bristleback", "bristleback_bristleback", "utility", "0" , "0" },
{ "npc_dota_hero_bristleback", "bristleback_viscous_nasal_goo", "utility", "0" , "0" },
{ "npc_dota_hero_bristleback", "bristleback_warpath", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spawn_spiderlings", "nuke", "target" , "damage" },
{ "npc_dota_hero_broodmother", "broodmother_incapacitating_bite", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_insatiable_hunger", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_poison_sting", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spawn_spiderite", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spin_web", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spin_web_destroy"  , "utility", "0" , "0" },
{ "npc_dota_hero_centaur", "centaur_double_edge", "nuke", "no target" , "edge_damage" },
{ "npc_dota_hero_centaur", "centaur_hoof_stomp", "disable", "no target" , "0" },
{ "npc_dota_hero_centaur", "centaur_return", "utility", "0" , "0" },
{ "npc_dota_hero_centaur", "centaur_stampede", "utility", "0" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_chaos_bolt", "disable", "target" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_chaos_strike", "utility", "0" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_phantasm", "utility", "0" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_reality_rift", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_test_of_faith", "nuke", "target" , "damage_min" },
{ "npc_dota_hero_chen", "chen_hand_of_god", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_holy_persuasion", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_penitence", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_test_of_faith_teleport", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_death_pact", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_searing_arrows", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_strafe", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_wind_walk", "utility", "0" , "0" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_crystal_nova", "nuke", "position" , "nova_damage" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_frostbite", "disable", "target" , "0" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_freezing_field", "nuke", "no target" , "0" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_brilliance_aura", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_ion_shell", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_surge", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_vacuum", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_wall_of_replica", "utility", "0" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_poison_touch", "nuke", "target" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_shadow_wave", "utility", "0" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_shallow_grave", "utility", "0" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_weave", "utility", "0" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_silence", "disable", "position" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_carrion_swarm", "nuke", "position" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_exorcism", "utility", "0" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_spirit_siphon", "utility", "0" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_witchcraft", "utility", "0" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_thunder_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_glimpse", "utility", "0" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_kinetic_field", "utility", "0" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_static_storm", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_devour", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_doom", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_infernal_blade", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_scorched_earth", "utility", "0" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_dragon_tail", "disable", "target" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_breathe_fire", "nuke", "position" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_dragon_blood", "utility", "0" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_elder_dragon_form", "utility", "0" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_frost_breath", "utility", "0" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_silence", "disable", "position" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_wave_of_silence", "disable", "position" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_frost_arrows", "utility", "0" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_marksmanship", "utility", "0" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_trueshot", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_boulder_smash", "disable", "position" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_geomagnetic_grip", "disable", "position" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_magnetize", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_petrify", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_rolling_boulder", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_stone_caller", "utility", "0" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_aftershock", "disable", "no target" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_fissure", "disable", "position" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_echo_slam", "nuke", "no target" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_enchant_totem", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_ancestral_spirit", "nuke", "position" , "pass_damage" },
{ "npc_dota_hero_elder_titan", "elder_titan_echo_stomp_spirit", "disable", "no target" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_earth_splitter", "nuke", "position" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_natural_order", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_echo_stomp", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_natural_order_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_return_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_searing_chains", "disable", "no target" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_activate_fire_remnant", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_fire_remnant", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_flame_guard", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_sleight_of_fist", "utility", "0" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_impetus", "nuke", "target" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_enchant", "utility", "0" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_natures_attendants", "utility", "0" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_untouchable", "utility", "0" , "0" },
{ "npc_dota_hero_enigma", "enigma_black_hole", "disable", "position" , "0" },
{ "npc_dota_hero_enigma", "enigma_demonic_conversion", "utility", "0" , "0" },
{ "npc_dota_hero_enigma", "enigma_malefice", "utility", "0" , "0" },
{ "npc_dota_hero_enigma", "enigma_midnight_pulse", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_chronosphere", "disable", "position" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_backtrack", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_time_dilation", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_time_lock", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_time_walk", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_force_of_nature", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_sprout", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_teleportation", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_wrath_of_nature", "utility", "0" , "0" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_call_down", "nuke", "position" , "damage_first" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_homing_missile", "disable", "target" , "0" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_rocket_barrage", "nuke", "no target" , "0" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_flak_cannon", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_berserkers_blood", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_burning_spear", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_inner_vitality", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_life_break", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_cold_snap", "disable", "no target" , "0" },
{ "npc_dota_hero_invoker", "invoker_tornado", "disable", "position" , "0" },
{ "npc_dota_hero_invoker", "invoker_alacrity", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_attribute_bonus", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_chaos_meteor", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_deafening_blast", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_emp", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_exort", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_forge_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_ghost_walk", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_ice_wall", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_invoke", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_quas", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_sun_strike", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_wex", "utility", "0" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_ice_path", "disable", "position" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_macropyre", "nuke", "position" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_dual_breath", "utility", "0" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_liquid_fire", "utility", "0" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_omni_slash", "nuke", "target" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_blade_dance", "utility", "0" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_blade_fury", "utility", "0" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_healing_ward", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_blinding_light", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_chakra_magic", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_illuminate", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_illuminate_end", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_mana_leak", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_recall", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form_illuminate", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form_illuminate_end", "utility", "0" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_ghostship", "nuke", "position" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_torrent", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_return", "utility", "0" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_tidebringer", "utility", "0" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_x_marks_the_spot", "utility", "0" , "0" },
{ "npc_dota_hero_legion_commander", "legion_commander_overwhelming_odds", "nuke", "position" , "damage" },
{ "npc_dota_hero_legion_commander", "legion_commander_duel", "disable", "target" , "0" },
{ "npc_dota_hero_legion_commander", "legion_commander_moment_of_courage", "utility", "0" , "0" },
{ "npc_dota_hero_legion_commander", "legion_commander_press_the_attack", "utility", "0" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_split_earth", "disable", "position" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_lightning_storm", "nuke", "target" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_pulse_nova", "utility", "0" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_diabolic_edict", "utility", "0" , "0" },
{ "npc_dota_hero_lich", "lich_chain_frost", "nuke", "target" , "damage" },
{ "npc_dota_hero_lich", "lich_frost_nova", "nuke", "position" , "0" },
{ "npc_dota_hero_lich", "lich_dark_ritual", "utility", "0" , "0" },
{ "npc_dota_hero_lich", "lich_frost_armor", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_assimilate", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_assimilate_eject", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_consume", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_control", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_1", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_2", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_3", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_4", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_feast", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_infest", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_open_wounds", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_rage", "utility", "0" , "0" },
{ "npc_dota_hero_lina", "lina_laguna_blade", "nuke", "target" , "damage" },
{ "npc_dota_hero_lina", "lina_light_strike_array", "disable", "position" , "0" },
{ "npc_dota_hero_lina", "lina_dragon_slave", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_lina", "lina_fiery_soul", "utility", "0" , "0" },
{ "npc_dota_hero_lion", "lion_finger_of_death", "nuke", "target" , "damage" },
{ "npc_dota_hero_lion", "lion_impale", "disable", "position" , "0" },
{ "npc_dota_hero_lion", "lion_voodoo", "disable", "target" , "0" },
{ "npc_dota_hero_lion", "lion_mana_drain", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_rabid", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_savage_roar", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_savage_roar_bear", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_demolish", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_entangle", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_return", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_true_form", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_true_form_battle_cry", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_true_form_druid", "utility", "0" , "0" },
{ "npc_dota_hero_luna", "luna_lucent_beam", "nuke", "target" , "beam_damage" },
{ "npc_dota_hero_luna", "luna_eclipse", "nuke", "no target" , "0" },
{ "npc_dota_hero_luna", "luna_lunar_blessing", "utility", "0" , "0" },
{ "npc_dota_hero_luna", "luna_moon_glaive", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_feral_impulse", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_howl", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_shapeshift", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_summon_wolves", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_summon_wolves_critical_strike", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_summon_wolves_invisibility", "utility", "0" , "0" },
{ "npc_dota_hero_magnataur", "magnataur_shockwave", "nuke", "skillshot" , "shock_damage" },
{ "npc_dota_hero_magnataur", "magnataur_reverse_polarity", "disable", "no target" , "0" },
{ "npc_dota_hero_magnataur", "magnataur_empower", "utility", "0" , "0" },
{ "npc_dota_hero_magnataur", "magnataur_skewer", "utility", "0" , "0" },
{ "npc_dota_hero_medusa", "medusa_mystic_snake", "nuke", "target" , "snake_damage" },
{ "npc_dota_hero_medusa", "medusa_mana_shield", "utility", "0" , "0" },
{ "npc_dota_hero_medusa", "medusa_split_shot", "utility", "0" , "0" },
{ "npc_dota_hero_medusa", "medusa_stone_gaze", "utility", "0" , "0" },
{ "npc_dota_hero_meepo", "meepo_earthbind", "disable", "position" , "0" },
{ "npc_dota_hero_meepo", "meepo_poof", "utility", "0" , "0" },
{ "npc_dota_hero_meepo", "meepo_divided_we_stand", "utility", "0" , "0" },
{ "npc_dota_hero_meepo", "meepo_geostrike", "utility", "0" , "0" },
{ "npc_dota_hero_mirana", "mirana_arrow", "disable", "position" , "0" },
{ "npc_dota_hero_mirana", "mirana_starfall", "nuke", "no target" , "0" },
{ "npc_dota_hero_mirana", "mirana_invis", "utility", "0" , "0" },
{ "npc_dota_hero_mirana", "mirana_leap", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_primal_spring", "disable", "position" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_primal_spring_early", "disable", "position" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_boundless_strike", "nuke", "position" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_jingu_mastery", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_mischief", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_tree_dance", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_untransform", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_wukongs_command", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_adaptive_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_morphling", "morphling_waveform", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_hybrid", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph_agi", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph_replicate", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph_str", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_replicate", "utility", "0" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_ensnare", "disable", "target" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_rip_tide", "nuke", "no target" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_mirror_image", "utility", "0" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_song_of_the_siren", "utility", "0" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_song_of_the_siren_cancel", "utility", "0" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_reapers_scythe", "disable", "target" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_death_pulse", "nuke", "no target" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_heartstopper_aura", "utility", "0" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_sadist", "utility", "0" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_sadist_stop", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_dark_lord", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_necromastery", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_requiem", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_shadowraze1", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_shadowraze2", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_shadowraze3", "utility", "0" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_void", "nuke", "target" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_crippling_fear", "utility", "0" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_darkness", "utility", "0" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_hunter_in_the_night", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_impale", "disable", "position" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_mana_burn", "nuke", "special" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_burrow", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_spiked_carapace", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_unburrow", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_vendetta", "utility", "0" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_astral_imprisonment", "nuke", "target" , "damage" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_sanity_eclipse", "nuke", "position" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_arcane_orb", "utility", "0" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_essence_aura", "utility", "0" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_mind_over_matter", "utility", "0" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_fireblast", "nuke", "target" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_unrefined_fireblast", "nuke", "target" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_bloodlust", "utility", "0" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_ignite", "utility", "0" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_multicast", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_degen_aura", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_guardian_angel", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_purification", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_repel", "utility", "0" , "0" },
{ "npc_dota_hero_oracle", "oracle_fortunes_end", "disable", "target" , "0" },
{ "npc_dota_hero_oracle", "oracle_false_promise", "utility", "0" , "0" },
{ "npc_dota_hero_oracle", "oracle_fates_edict", "utility", "0" , "0" },
{ "npc_dota_hero_oracle", "oracle_purifying_flames", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_stifling_dagger", "nuke", "target" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_blur", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_coup_de_grace", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_phantom_strike", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_spirit_lance", "nuke", "target" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_doppelwalk", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_juxtapose", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_phantom_edge", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_fire_spirits", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_icarus_dive", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_icarus_dive_stop", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_launch_fire_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray_stop", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray_toggle_move", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray_toggle_move_empty", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_supernova", "utility", "0" , "0" },
{ "npc_dota_hero_puck", "puck_dream_coil", "disable", "position" , "0" },
{ "npc_dota_hero_puck", "puck_waning_rift", "disable", "no target" , "0" },
{ "npc_dota_hero_puck", "puck_ethereal_jaunt", "utility", "0" , "0" },
{ "npc_dota_hero_puck", "puck_illusory_orb", "utility", "0" , "0" },
{ "npc_dota_hero_puck", "puck_phase_shift", "utility", "0" , "0" },
{ "npc_dota_hero_pudge", "pudge_dismember", "disable", "target" , "0" },
{ "npc_dota_hero_pudge", "pudge_flesh_heap", "utility", "0" , "0" },
{ "npc_dota_hero_pudge", "pudge_meat_hook", "utility", "0" , "0" },
{ "npc_dota_hero_pudge", "pudge_rot", "utility", "0" , "0" },
{ "npc_dota_hero_pugna", "pugna_nether_blast", "nuke", "skillshot" , "blast_damage" },
{ "npc_dota_hero_pugna", "pugna_life_drain", "nuke", "target" , "0" },
{ "npc_dota_hero_pugna", "pugna_decrepify", "utility", "0" , "0" },
{ "npc_dota_hero_pugna", "pugna_nether_ward", "utility", "0" , "0" },
{ "npc_dota_hero_queenofpain", "queenofpain_sonic_wave", "nuke", "position" , "damage" },
{ "npc_dota_hero_queenofpain", "queenofpain_shadow_strike", "nuke", "target" , "strike_damage" },
{ "npc_dota_hero_queenofpain", "queenofpain_scream_of_pain", "nuke", "special" , "0" },
{ "npc_dota_hero_queenofpain", "queenofpain_blink", "utility", "0" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_battery_assault", "disable", "no target" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_hookshot", "disable", "position" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_rocket_flare", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_power_cogs", "utility", "0" , "0" },
{ "npc_dota_hero_razor", "razor_plasma_field", "nuke", "no target" , "damage_max" },
{ "npc_dota_hero_razor", "razor_eye_of_the_storm", "nuke", "no target" , "0" },
{ "npc_dota_hero_razor", "razor_static_link", "utility", "0" , "0" },
{ "npc_dota_hero_razor", "razor_unstable_current", "utility", "0" , "0" },
{ "npc_dota_hero_riki", "riki_smoke_screen", "disable", "position" , "0" },
{ "npc_dota_hero_riki", "riki_blink_strike", "utility", "0" , "0" },
{ "npc_dota_hero_riki", "riki_permanent_invisibility", "utility", "0" , "0" },
{ "npc_dota_hero_riki", "riki_tricks_of_the_trade", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_fade_bolt", "nuke", "target" , "damage" },
{ "npc_dota_hero_rubick", "rubick_telekinesis", "disable", "target" , "0" },
{ "npc_dota_hero_rubick", "rubick_telekinesis_land", "disable", "target" , "0" },
{ "npc_dota_hero_rubick", "rubick_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_hidden1", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_hidden2", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_hidden3", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_null_field", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_spell_steal", "utility", "0" , "0" },
{ "npc_dota_hero_sand_king", "sandking_burrowstrike", "disable", "position" , "0" },
{ "npc_dota_hero_sand_king", "sandking_epicenter", "nuke", "no target" , "0" },
{ "npc_dota_hero_sand_king", "sandking_caustic_finale", "utility", "0" , "0" },
{ "npc_dota_hero_sand_king", "sandking_sand_storm", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_demonic_purge", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_disruption", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_shadow_poison", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_shadow_poison_release", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_soul_catcher", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_ether_shock", "nuke", "target" , "damage" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_shackles", "disable", "target" , "0" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_voodoo", "disable", "target" , "0" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_mass_serpent_ward", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_whirling_death", "nuke", "no target" , "whirling_damage" },
{ "npc_dota_hero_shredder", "shredder_chakram", "nuke", "position" , "0" },
{ "npc_dota_hero_shredder", "shredder_chakram_2", "nuke", "position" , "0" },
{ "npc_dota_hero_shredder", "shredder_reactive_armor", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_return_chakram", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_return_chakram_2", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_timber_chain", "utility", "0" , "0" },
{ "npc_dota_hero_silencer", "silencer_last_word", "nuke", "target" , "damage" },
{ "npc_dota_hero_silencer", "silencer_global_silence", "disable", "no target" , "0" },
{ "npc_dota_hero_silencer", "silencer_curse_of_the_silent", "utility", "0" , "0" },
{ "npc_dota_hero_silencer", "silencer_glaives_of_wisdom", "utility", "0" , "0" },
{ "npc_dota_hero_skeleton_king", "skeleton_king_hellfire_blast", "disable", "target" , "0" },
{ "npc_dota_hero_skeleton_king", "skeleton_king_reincarnation", "utility", "0" , "0" },
{ "npc_dota_hero_skeleton_king", "skeleton_king_vampiric_aura", "utility", "0" , "0" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_arcane_bolt", "nuke", "target" , "bolt_damage" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_ancient_seal", "disable", "target" , "0" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_mystic_flare", "nuke", "position" , "0" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_concussive_shot", "utility", "0" , "0" },
{ "npc_dota_hero_slardar", "slardar_slithereen_crush", "disable", "no target" , "0" },
{ "npc_dota_hero_slardar", "slardar_amplify_damage", "utility", "0" , "0" },
{ "npc_dota_hero_slardar", "slardar_bash", "utility", "0" , "0" },
{ "npc_dota_hero_slardar", "slardar_sprint", "utility", "0" , "0" },
{ "npc_dota_hero_slark", "slark_dark_pact", "nuke", "no target" , "total_damage" },
{ "npc_dota_hero_slark", "slark_essence_shift", "utility", "0" , "0" },
{ "npc_dota_hero_slark", "slark_pounce", "utility", "0" , "0" },
{ "npc_dota_hero_slark", "slark_shadow_dance", "utility", "0" , "0" },
{ "npc_dota_hero_sniper", "sniper_assassinate", "nuke", "target" , "0" },
{ "npc_dota_hero_sniper", "sniper_headshot", "utility", "0" , "0" },
{ "npc_dota_hero_sniper", "sniper_shrapnel", "utility", "0" , "0" },
{ "npc_dota_hero_sniper", "sniper_take_aim", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_spectral_dagger", "nuke", "target" , "damage" },
{ "npc_dota_hero_spectre", "spectre_desolate", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_dispersion", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_haunt", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_reality", "utility", "0" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_nether_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_charge_of_darkness", "utility", "0" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_empowering_haste", "utility", "0" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_greater_bash", "utility", "0" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_electric_vortex", "disable", "target" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_ball_lightning", "utility", "0" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_overload", "utility", "0" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_static_remnant", "utility", "0" , "0" },
{ "npc_dota_hero_sven", "sven_storm_bolt", "disable", "target" , "0" },
{ "npc_dota_hero_sven", "sven_gods_strength", "utility", "0" , "0" },
{ "npc_dota_hero_sven", "sven_great_cleave", "utility", "0" , "0" },
{ "npc_dota_hero_sven", "sven_warcry", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_land_mines", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_stasis_trap", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_suicide", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_remote_mines", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_focused_detonate", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_remote_mines_self_detonate", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_minefield_sign", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_meld", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_psi_blades", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_psionic_trap", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_refraction", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_self_trap", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_trap", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_conjure_image", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_metamorphosis", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_reflection", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_sunder", "utility", "0" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_ravage", "disable", "no target" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_anchor_smash", "nuke", "no target" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_gush", "nuke", "target" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_kraken_shell", "utility", "0" , "0" },
{ "npc_dota_hero_tinker", "tinker_laser", "nuke", "target" , "laser_damage" },
{ "npc_dota_hero_tinker", "tinker_heat_seeking_missile", "nuke", "no target" , "0" },
{ "npc_dota_hero_tinker", "tinker_march_of_the_machines", "utility", "0" , "0" },
{ "npc_dota_hero_tinker", "tinker_rearm", "utility", "0" , "0" },
{ "npc_dota_hero_tiny", "tiny_toss", "nuke", "position" , "toss_damage" },
{ "npc_dota_hero_tiny", "tiny_avalanche", "disable", "position" , "0" },
{ "npc_dota_hero_tiny", "tiny_craggy_exterior", "utility", "0" , "0" },
{ "npc_dota_hero_tiny", "tiny_grow", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_overgrowth", "disable", "no target" , "0" },
{ "npc_dota_hero_treant", "treant_eyes_in_the_forest", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_leech_seed", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_living_armor", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_natures_guise", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_battle_trance", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_berserkers_rage", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_fervor", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_whirling_axes_melee", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_whirling_axes_ranged", "utility", "0" , "0" },
{ "npc_dota_hero_tusk", "tusk_ice_shards", "nuke", "skillshot" , "shard_damage" },
{ "npc_dota_hero_tusk", "tusk_walrus_kick", "nuke", "target" , "0" },
{ "npc_dota_hero_tusk", "tusk_walrus_punch", "nuke", "target" , "0" },
{ "npc_dota_hero_tusk", "tusk_frozen_sigil", "utility", "0" , "0" },
{ "npc_dota_hero_tusk", "tusk_launch_snowball", "utility", "0" , "0" },
{ "npc_dota_hero_tusk", "tusk_snowball", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_decay", "nuke", "position" , "decay_damage" },
{ "npc_dota_hero_undying", "undying_flesh_golem", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_soul_rip", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_tombstone", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_tombstone_zombie_aura", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_tombstone_zombie_deathstrike", "utility", "0" , "0" },
{ "npc_dota_hero_ursa", "ursa_earthshock", "nuke", "no target" , "0" },
{ "npc_dota_hero_ursa", "ursa_enrage", "utility", "0" , "0" },
{ "npc_dota_hero_ursa", "ursa_fury_swipes", "utility", "0" , "0" },
{ "npc_dota_hero_ursa", "ursa_overpower", "utility", "0" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_magic_missile", "disable", "target" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_wave_of_terror", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_command_aura", "utility", "0" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_nether_swap", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_plague_ward", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_poison_nova", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_poison_sting", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_venomous_gale", "utility", "0" , "0" },
{ "npc_dota_hero_viper", "viper_viper_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_viper", "viper_corrosive_skin", "utility", "0" , "0" },
{ "npc_dota_hero_viper", "viper_nethertoxin", "utility", "0" , "0" },
{ "npc_dota_hero_viper", "viper_poison_attack", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_soul_assumption", "nuke", "target" , "0" },
{ "npc_dota_hero_visage", "visage_grave_chill", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_gravekeepers_cloak", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_summon_familiars", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_summon_familiars_stone_form", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_rain_of_chaos", "disable", "position" , "0" },
{ "npc_dota_hero_warlock", "warlock_shadow_word", "nuke", "target" , "0" },
{ "npc_dota_hero_warlock", "warlock_fatal_bonds", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_golem_flaming_fists", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_golem_permanent_immolation", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_upheaval", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_geminate_attack", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_shukuchi", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_the_swarm", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_time_lapse", "utility", "0" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_shackleshot", "disable", "target" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_powershot", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_focusfire", "utility", "0" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_windrun", "utility", "0" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_winters_curse", "disable", "target" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_splinter_blast", "nuke", "target" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_arctic_burn", "utility", "0" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_cold_embrace", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_overcharge", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_relocate", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_spirits", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_spirits_in", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_spirits_out", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_tether", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_tether_break", "utility", "0" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_paralyzing_cask", "disable", "target" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_death_ward", "utility", "0" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_maledict", "utility", "0" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_voodoo_restoration", "utility", "0" , "0" },
{ "npc_dota_hero_zuus", "zuus_arc_lightning", "nuke", "target" , "0" },
{ "npc_dota_hero_zuus", "zuus_lightning_bolt", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_zuus", "zuus_thundergods_wrath", "nuke", "no target" , "0" },
{ "npc_dota_hero_zuus", "zuus_cloud", "utility", "0" , "0" },
{ "npc_dota_hero_zuus", "zuus_static_field", "utility", "0" , "0" } }

function fooAllInOne.ResetGlobalVariables()

	fooAllInOne.lastCastTime = 0
	fooAllInOne.lastCastTime2 = 0
	fooAllInOne.lastTick = 0
	fooAllInOne.delay = 0
	fooAllInOne.itemDelay = 0
	fooAllInOne.lastItemTick = 0
	fooAllInOne.ItemCastStop = false
	fooAllInOne.ControlledUnitCastTime = 0
	fooAllInOne.lastAttackTime = 0
	fooAllInOne.lastAttackTime2 = 0
	fooAllInOne.LastTarget = nil
	fooAllInOne.LastTickManta1 = 0
	fooAllInOne.LastTickManta2 = 0
	fooAllInOne.ControlledUnitPauseTime = 0
	fooAllInOne.ArcWardenEntity = nil
	fooAllInOne.LinkensBreakerItemOrder = {}
	fooAllInOne.ItemCastOrder = {}
	fooAllInOne.rotationTable = {}

end

-- main callback
function fooAllInOne.OnUpdate()
	if not Menu.IsEnabled(fooAllInOne.optionEnable) then return end
	if not GameRules.GetGameState() == 5 then return end
	local myHero = Heroes.GetLocal()
		if not myHero then return end
		if not Entity.IsAlive(myHero) then return end

	if next(fooAllInOne.ItemCastOrder) == nil then
		fooAllInOne.setOrderItem(false)
	end
 	if next(fooAllInOne.LinkensBreakerItemOrder) == nil then
		fooAllInOne.setOrderLinkens(false)
	end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))

	local isHeroSupported = fooAllInOne.heroSupported(myHero)

	if enemy then
		if isHeroSupported then
		
			if NPC.GetUnitName(myHero) == "npc_dota_hero_axe" then
				fooAllInOne.axeCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_rattletrap" then
				fooAllInOne.clockwerkCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_skywrath_mage" then
				fooAllInOne.skywrathCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_tiny" then
				fooAllInOne.tinyCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_windrunner" then
				fooAllInOne.WindRunnerCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_ember_spirit" then
				fooAllInOne.EmberCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_ursa" then
				fooAllInOne.UrsaCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_templar_assassin" then
				fooAllInOne.TACombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_legion_commander" then
				fooAllInOne.LegionCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_shredder" then
				fooAllInOne.TimberCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_slardar" then
				fooAllInOne.SlardarCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_clinkz" then
				fooAllInOne.ClinkzCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_queenofpain" then
				fooAllInOne.QoPCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_sven" then
				fooAllInOne.SvenCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_visage" then
				fooAllInOne.VisageCombo(myHero, enemy)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then
				fooAllInOne.MorphCombo(myHero, enemy)
			end
		
		else fooAllInOne.itemUsage(myHero, enemy)

		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_arc_warden" then
		fooAllInOne.ArcWardenCombo(myHero, enemy)
	end
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_clinkz" then
		if Menu.IsEnabled(fooAllInOne.optionHeroClinkzUlt) then
			fooAllInOne.ClinkzAutoUlt(myHero)
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_axe" then
		if Menu.IsEnabled(fooAllInOne.optionHeroAxeForceBlink) then
			fooAllInOne.ForceBlink(myHero, enemy, Menu.GetValue(fooAllInOne.optionHeroAxeForceBlinkRange))
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_shredder" then
		fooAllInOne.TimberSaveChakramReturn(myHero, enemy)
	end
	
	if Menu.IsEnabled(fooAllInOne.optionUtilityEnable) then
		fooAllInOne.utilityItemUsage(myHero)
	end

	if Menu.IsEnabled(fooAllInOne.optionKillStealEnable) then
		if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
			if Menu.IsEnabled(fooAllInOne.optionKillStealInvoker) then
				fooAllInOne.AutoSunstrikeKillSteal(myHero)
			end
		else
			fooAllInOne.AutoNukeKillSteal(myHero)
		end
	end	

--	local test = 0
--	for i = 1, Heroes.Count() do
--      local hero = Heroes.Get(i)
	
--	local sentry = NPC.GetItem(hero, "item_ward_sentry", true)
--	local observer = NPC.GetItem(hero, "item_ward_observer", true)
--	local obsSentry = NPC.GetItem(hero, "item_ward_dispenser", true)

--		if not Entity.IsSameTeam(myHero, hero) and not NPC.IsDormant(hero) then
--				and observer and Ability.SecondsSinceLastUse(observer) > 0.0 and Ability.SecondsSinceLastUse(observer) < 0.3 then
--			if Ability.SecondsSinceLastUse(observer) > 0 and Ability.SecondsSinceLastUse(observer) < 1 then
--					test = 1
--			end
--		end
--	end

--	Log.Write(test)	


--	for i = 1, NPCs.Count() do
--	local npc = NPCs.Get(i)
--	Log.Write(tostring(NPC.GetUnitName(npc)) .. " " .. tostring(Entity.GetOwner(npc)) .. " " .. tostring(Entity.OwnedBy(npc, myHero)))
--	end

--	local modifiers = NPC.GetModifiers(myHero)
--	for _, modifier in ipairs(modifiers) do
--	local modifierName = Modifier.GetName(modifier)
--	Log.Write(modifierName)
--	end
--	Log.Write(NPC.GetAttackRange(myHero))

--	for i = 1, Abilities.Count() do
--	local abilities = Abilities.Get(i)
--	local abilityNames = Ability.GetName(abilities)
--	Log.Write(abilityNames)
--	end
	
end

--fooAllInOne.particleTable = {}

--function fooAllInOne.OnParticleCreate(particle)
--	if not particle or not particle.index then return end
--	if not particle.name == "ward_spawn_generic" then return end
    
--	Log.Write("2. OnParticleUpdate: " .. tostring(particle.index) .. " " .. tostring(particle.name))

--	fooAllInOne.particleTable[particle.index] = particle.name

--end

--function fooAllInOne.OnParticleUpdate(particle)
--	if not particle or not particle.index then return end

--	for k, v in ipairs(fooAllInOne.particleTable) do
--	if v[k] == "ward_spawn_generic" then
--		Log.Write(tostring(particle.position))
--	end
--	end
--end

--function fooAllInOne.OnUnitAnimation(animation)
--	if not animation then return end
--
--	Log.Write("1. OnUnitAnimation: " .. tostring(animation.sequenceName))
--
--end

function fooAllInOne.OnDraw()

	if not Engine.IsInGame() then
		fooAllInOne.ResetGlobalVariables()
	end

	local myHero = Heroes.GetLocal()
        	if not myHero then return end
		if not Entity.IsAlive(myHero) then return end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then
		if Menu.IsEnabled(fooAllInOne.optionHeroMorphlingKill) then
			fooAllInOne.drawMorphlingKillIndicator(myHero)
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_arc_warden" then
		if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenDraw) then
			fooAllInOne.drawArcWardenIndicators(fooAllInOne.ArcWardenEntity)
		end
	end

end

-- utility functions
function fooAllInOne.heroSupported(myHero)

	local supportedHeroList = { "npc_dota_hero_axe",
		"npc_dota_hero_rattletrap", 
		"npc_dota_hero_skywrath_mage",
		"npc_dota_hero_tiny",
		"npc_dota_hero_windrunner",
		"npc_dota_hero_ember_spirit",
		"npc_dota_hero_ursa",
		"npc_dota_hero_templar_assassin",
		"npc_dota_hero_legion_commander",
		"npc_dota_hero_shredder",
		"npc_dota_hero_slardar",
		"npc_dota_hero_clinkz",
		"npc_dota_hero_queenofpain",
		"npc_dota_hero_sven",
		"npc_dota_hero_visage",
		"npc_dota_hero_morphling"
			}

	for _, heroName in pairs(supportedHeroList) do
		if heroName == NPC.GetUnitName(myHero) then
			return true
		end
	end
	return false
end

function fooAllInOne.setOrderItem(printed)

	fooAllInOne.ItemCastOrder = {
        	{Menu.GetValue(fooAllInOne.optionItemVeil), "item_veil_of_discord", "position"},
        	{Menu.GetValue(fooAllInOne.optionItemHex), "item_sheepstick", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemBlood), "item_bloodthorn", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemeBlade), "item_ethereal_blade", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemOrchid),"item_orchid", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemAtos),"item_rod_of_atos", "target"},
		{Menu.GetValue(fooAllInOne.optionItemAbyssal),"item_abyssal_blade", "target"},
		{Menu.GetValue(fooAllInOne.optionItemHalberd),"item_heavens_halberd", "target"},
		{Menu.GetValue(fooAllInOne.optionItemShivas),"item_shivas_guard", "no target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_2", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_3", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_4", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_5", "target"},
		{Menu.GetValue(fooAllInOne.optionItemUrn),"item_urn_of_shadows", "target"},
	--	{Menu.GetValue(fooAllInOne.optionItemManta),"item_manta", "no target"},
	--	{Menu.GetValue(fooAllInOne.optionItemMjollnir),"item_mjollnir", "target"},
		{Menu.GetValue(fooAllInOne.optionItemMedallion),"item_medallion_of_courage", "target"},
		{Menu.GetValue(fooAllInOne.optionItemCrest),"item_solar_crest", "target"}
    				}

    	table.sort(fooAllInOne.ItemCastOrder, function(a, b)
        	return a[1] > b[1]
    	end)
	Log.Write(".....Item Cast Order....")
	local printed = false
		if not printed then
			for k,v in ipairs(fooAllInOne.ItemCastOrder) do
			Log.Write(v[1]..':'..v[2])
			printed = true
			end
		end
end			

function fooAllInOne.setOrderLinkens(printed)
	
	fooAllInOne.LinkensBreakerItemOrder = {
        	{Menu.GetValue(fooAllInOne.optionLinkensForce), "item_force_staff"},
        	{Menu.GetValue(fooAllInOne.optionLinkensEul), "item_cyclone"},
        	{Menu.GetValue(fooAllInOne.optionLinkensHalberd), "item_heavens_halberd"},
        	{Menu.GetValue(fooAllInOne.optionLinkensHex), "item_sheepstick"},
        	{Menu.GetValue(fooAllInOne.optionLinkensBlood),"item_bloodthorn"},
        	{Menu.GetValue(fooAllInOne.optionLinkensOrchid),"item_orchid"}
    				}

    	table.sort(fooAllInOne.LinkensBreakerItemOrder, function(a, b)
        	return a[1] > b[1]
    	end)
	Log.Write(".....Linkens Breaker Priorization Order....")
	local printed = false
		if not printed then
			for k,v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
			Log.Write(v[1]..':'..v[2])
			printed = true
			end
		end			
	
end

function fooAllInOne.OnMenuOptionChange(option, old, new)

    	if option == fooAllInOne.optionItemVeil or
		option == fooAllInOne.optionItemHex or
		option == fooAllInOne.optionItemBlood or
		option == fooAllInOne.optionItemeBlade or 
		option == fooAllInOne.optionItemOrchid or 
		option == fooAllInOne.optionItemAtos or 
		option == fooAllInOne.optionItemAbyssal or 
		option == fooAllInOne.optionItemHalberd or 
		option == fooAllInOne.optionItemShivas or 
		option == fooAllInOne.optionItemDagon or 
		option == fooAllInOne.optionItemUrn or
		option == fooAllInOne.optionItemManta or
		option == fooAllInOne.optionItemMjollnir or
		option == fooAllInOne.optionItemMedallion or
		option == fooAllInOne.optionItemCrest then
			fooAllInOne.setOrderItem(false)
	end
	
	if option == fooAllInOne.optionLinkensForce or
		option == fooAllInOne.optionLinkensEul or
		option == fooAllInOne.optionLinkensHalberd or
		option == fooAllInOne.optionLinkensHex or
		option == fooAllInOne.optionLinkensBlood or
		option == fooAllInOne.optionLinkensOrchid then
        		fooAllInOne.setOrderLinkens(false)
    	end

end

function fooAllInOne.targetChecker(genericEnemyEntity)

	if genericEnemyEntity and not NPC.IsDormant(genericEnemyEntity) and not NPC.IsIllusion(genericEnemyEntity) and Entity.GetHealth(genericEnemyEntity) > 0 then

		if NPC.GetUnitName(genericEnemyEntity) == "npc_dota_hero_antimage" and NPC.HasItem(genericEnemyEntity, "item_ultimate_scepter", true) and NPC.HasModifier(genericEnemyEntity, "modifier_antimage_spell_shield") and Ability.IsReady(NPC.GetAbility(genericEnemyEntity, "antimage_spell_shield")) then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_item_lotus_orb_active") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_winter_wyvern_winters_curse") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_item_blade_mail_reflect") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_nyx_assassin_spiked_carapace") then
			return
		end

	return genericEnemyEntity
	end	
end

function fooAllInOne.makeDelay(sec)
	fooAllInOne.delay = sec + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)
	fooAllInOne.lastTick = os.clock()
end

function fooAllInOne.noItemCastFor(sec)
	fooAllInOne.itemDelay = sec
	fooAllInOne.lastItemTick = os.clock()
end

function fooAllInOne.SleepReady(sleep)

	if (os.clock() - fooAllInOne.lastTick) >= sleep then
		return true
	end
	return false

end

function fooAllInOne.GetAvgLatency()

	local AVGlatency = NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2
	return AVGlatency

end

function fooAllInOne.CastAnimationDelay(ability)

	local abilityAnimation = Ability.GetCastPoint(ability) + fooAllInOne.GetAvgLatency()

	return abilityAnimation

end
	
function fooAllInOne.castLinearPrediction(myHero, enemy, adjustmentVariable)
	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)


	local cosGamma = (NPC.GetAbsOrigin(myHero) - enemyOrigin):Dot2D(enemyRotation:Scaled(100)) / ((NPC.GetAbsOrigin(myHero) - enemyOrigin):Length2D() * enemyRotation:Scaled(100):Length2D())
		if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(NPC.GetMoveSpeed(enemy) * adjustmentVariable * (1 - cosGamma)))
			end
		end
end

function fooAllInOne.castPrediction(myHero, enemy, adjustmentVariable)
	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)

	if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(NPC.GetMoveSpeed(enemy) * adjustmentVariable))
			end
	end
end

function fooAllInOne.isEnemyTurning(enemy)

	if enemy == nil then return true end

	local rotation = Entity.GetRotation(enemy):GetVectors()
	table.insert(fooAllInOne.rotationTable, rotation:__tostring())
		if #fooAllInOne.rotationTable > (Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn) + 1) then
			table.remove(fooAllInOne.rotationTable, 1)
		end
	
	for _, rotationCheck in ipairs(fooAllInOne.rotationTable) do
		if #fooAllInOne.rotationTable < Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn) then return true end
		if fooAllInOne.rotationTable[#fooAllInOne.rotationTable] == fooAllInOne.rotationTable[#fooAllInOne.rotationTable - Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn)] then
			return false
		end
	return true
		
	end   
end

function fooAllInOne.GetMoveSpeed(enemy)

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

    	return base_speed + bonus_speed
end

function fooAllInOne.getBestPosition(unitsAround, radius)
	if not unitsAround or #unitsAround < 1 then
		return 
	end

	local countEnemies = #unitsAround

	if countEnemies == 1 then 
		return Entity.GetAbsOrigin(unitsAround[1]) 
	end

	local maxCount = 1
	local bestPosition = Entity.GetAbsOrigin(unitsAround[1])
	for i = 1, (countEnemies - 1) do
		for j = i + 1, countEnemies do
			if unitsAround[i] and unitsAround[j] then
				local pos1 = Entity.GetAbsOrigin(unitsAround[i])
				local pos2 = Entity.GetAbsOrigin(unitsAround[j])
				local mid = pos1:__add(pos2):Scaled(0.5)

				local heroesCount = 0
				for k = 1, countEnemies do
					if NPC.IsPositionInRange(unitsAround[k], mid, radius, 0) then
						heroesCount = heroesCount + 1
					end
				end

				if heroesCount > maxCount then
					maxCount = heroesCount
					bestPos = mid
				end
			end
		end
	end
	return bestPos
end

function fooAllInOne.GetMyFaction(myHero)
	
	local radiantFountain = Vector(-7600, -7300, 640)
	local direFountain = Vector(7800, 7250, 640)
	
	local myFountain
	if myFountain == nil then
		for i = 1, NPCs.Count() do 
		local npc = NPCs.Get(i)
    			if Entity.IsSameTeam(myHero, npc) and NPC.IsStructure(npc) then
    				if NPC.GetUnitName(npc) ~= nil then
        				if NPC.GetUnitName(npc) == "dota_fountain" then
						myFountain = npc
					end
				end
			end
		end
	end

	local myFaction
	if myFaction == nil then
		if NPC.IsPositionInRange(myFountain, radiantFountain, 1000, 0) then
			myFaction = "radiant"
		else myFaction = "dire"
		end
	end

	return myFaction

end

function fooAllInOne.GetMyFountainPos(myHero)

	local myFaction = fooAllInOne.GetMyFaction(myHero)

	local myFountainPos
	if myFaction == "radiant" then
		myFountainPos = Vector(-7600, -7300, 640)
	else myFountainPos = Vector(7800, 7250, 640)
	end

	return myFountainPos

end

function fooAllInOne.GetEnemyFountainPos(myHero)

	local myFaction = fooAllInOne.GetMyFaction(myHero)

	local enemyFountainPos
	if myFaction == "radiant" then
		enemyFountainPos = Vector(7800, 7250, 640)
	else enemyFountainPos = Vector(-7600, -7300, 640)
	end

	return enemyFountainPos

end

function fooAllInOne.GetNecronomiconEntityTable(myHero, caster)

	local necronomiconTable = {}
	for i, npc in ipairs(NPC.GetUnitsInRadius(myHero, 99999, Enum.TeamType.TEAM_FRIEND)) do
    		if Entity.IsSameTeam(myHero, npc) and Entity.GetOwner(npc) == caster then
    			if NPC.GetUnitName(npc) ~= nil then
				if NPC.GetUnitName(npc) == string.match(NPC.GetUnitName(npc) , 'npc_dota_necronomicon_archer_.') or NPC.GetUnitName(npc) == string.match(NPC.GetUnitName(npc) , 'npc_dota_necronomicon_warrior_.') then
					if npc ~= nil then
						table.insert(necronomiconTable, npc)
					end
				end
			end
		end
	end
	
	return necronomiconTable

end

function fooAllInOne.GetIllusionEntityTable(myHero, caster)

	local controllableTable = {}
	if next(controllableTable) == nil then
		for i = 1, NPCs.Count() do 
		local npc = NPCs.Get(i)
			if Entity.IsSameTeam(myHero, npc) then
				if npc ~= myHero then
					if Entity.GetOwner(npc) == Entity.GetOwner(caster) then
						if NPC.HasModifier(npc, "modifier_illusion") then
							if npc ~= nil then
								table.insert(controllableTable, npc)
							else controllableTable = {}
							break
							end
						end
					end
				end
			end
		end
	end
	
	return controllableTable

end

function fooAllInOne.NecronomiconController(necronomiconEntity, target, position)

	if not necronomiconEntity then return end
	if not target and not position then return end

	if target ~= nil then
		if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_archer_.') then
			if not NPC.IsAttacking(necronomiconEntity) then
				if (os.clock() - fooAllInOne.lastCastTime) >= 0.5 then
					if not NPC.IsEntityInRange(necronomiconEntity, target, 600) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
						fooAllInOne.lastCastTime = os.clock()
						fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
					else			
						if Ability.IsReady(NPC.GetAbilityByIndex(necronomiconEntity, 0)) then
							if NPC.IsHero(target) then
								Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, target, Vector(0,0,0), NPC.GetAbilityByIndex(necronomiconEntity, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
								fooAllInOne.lastCastTime = os.clock()
								fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "manaBurn", "DOTA_UNIT_ORDER_CAST_TARGET")
							end
						end
						if not Ability.IsReady(NPC.GetAbilityByIndex(necronomiconEntity, 0)) then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
							fooAllInOne.lastCastTime = os.clock()
							fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
						end	
					end
				end
			end
		end
		if (os.clock() - fooAllInOne.lastCastTime) >= 0.25 then
			if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_warrior_.') then
				if not NPC.IsAttacking(necronomiconEntity) then
					if (os.clock() - fooAllInOne.lastCastTime2) >= 0.5 then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
						fooAllInOne.lastCastTime2 = os.clock()
						fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
					end
				end
			end
		end
	end

	if position ~= nil then
		if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_archer_.') then
			if not NPC.IsAttacking(necronomiconEntity) and not NPC.IsRunning(necronomiconEntity) then
				if (os.clock() - fooAllInOne.lastCastTime) >= 0.5 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
					fooAllInOne.lastCastTime = os.clock()
					fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
		if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_warrior_.') then
			if (os.clock() - fooAllInOne.lastCastTime) >= 0.25 then
				if not NPC.IsAttacking(necronomiconEntity) and not NPC.IsRunning(necronomiconEntity) then
					if (os.clock() - fooAllInOne.lastCastTime2) >= 0.5 then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
						fooAllInOne.lastCastTime2 = os.clock()
						fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
					end
				end
			end
		end	
	end

end

function fooAllInOne.MantaIlluController(target, position, myHero, tempestDoubleEntity)

	if next(fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity)) == nil then return end
	if not target and not position then return end
	 
	local mantaIllu1 = fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity)[1]
	local mantaIllu2 = fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity)[2]

	if target ~= nil then
		if mantaIllu1 then
			if os.clock() - fooAllInOne.LastTickManta1 >= 0.5 then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu1)
				fooAllInOne.LastTickManta1 = os.clock()
				fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu1, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			end
		end
		if mantaIllu2 then
			if os.clock() - fooAllInOne.LastTickManta2 >= 0.5 then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu2)
				fooAllInOne.LastTickManta2 = os.clock()
				fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu2, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			end
		end
	end

	if position ~= nil then
		if mantaIllu1 then
			if not NPC.IsAttacking(mantaIllu1) and not NPC.IsRunning(mantaIllu1) then
				if os.clock() - fooAllInOne.LastTickManta1 >= 0.5 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu1)
					fooAllInOne.LastTickManta1 = os.clock()
					fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu1, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
		if mantaIllu2 then
			if not NPC.IsAttacking(mantaIllu2) and not NPC.IsRunning(mantaIllu2) then
				if os.clock() - fooAllInOne.LastTickManta2 >= 0.5 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu2)
					fooAllInOne.LastTickManta2 = os.clock()
					fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu2, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
	end	
end

function fooAllInOne.GenericAttackIssuer(attackType, target, position, npc)
	
	if not npc then return end
	if not target and not position then return end
	if os.clock() - fooAllInOne.lastAttackTime2 < 0.5 then return end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET" then
		if target ~= nil then
			if target ~= fooAllInOne.LastTarget then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
				fooAllInOne.LastTarget = target
				fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			end
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE" then
		if position ~= nil then
			if not NPC.IsAttacking(npc) or not NPC.IsRunning(npc) then
				if position:__tostring() ~= fooAllInOne.LastTarget then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
					fooAllInOne.LastTarget = position:__tostring()
					fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION" then
		if position ~= nil then
			if not NPC.IsRunning(npc) then
				if position:__tostring() ~= fooAllInOne.LastTarget then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
					fooAllInOne.LastTarget = position:__tostring()
					fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "move", "DOTA_UNIT_ORDER_MOVE_TO_POSITION")
				end
			end
		end
	end

	if target ~= nil then
		if target == fooAllInOne.LastTarget then
			if not NPC.IsAttacking(npc) then
				fooAllInOne.LastTarget = nil
				fooAllInOne.lastAttackTime2 = os.clock()
				return
			end
		end
	end

	if position ~= nil then
		if position:__tostring() == fooAllInOne.LastTarget then
			if not NPC.IsRunning(npc) then
				fooAllInOne.LastTarget = nil
				fooAllInOne.lastAttackTime2 = os.clock()
				return
			end
		end
	end

end

function fooAllInOne.GenericLanePusher(npc)

	if not Entity.IsAlive(npc) then return end

	local myFaction = fooAllInOne.GetMyFaction(npc)
	local myFountainPos = fooAllInOne.GetMyFountainPos(npc)
	local enemyFountainPos = fooAllInOne.GetEnemyFountainPos(npc)

	local leftCornerPos = Vector(-5750, 6050, 384)
	local rightCornerPos = Vector(6000, -5800, 384)
	local midPos = Vector(-600, -300, 128)

	local radiantTop2 = Vector(-6150, -800, 384)
	local radiantBot2 = Vector(-800, -6250, 384)
	local radiantMid2 = Vector(-2800, -2250, 256)
	
	local direTop2 = Vector(800, 6000, 384)
	local direBot2 = Vector(6200, 400, 384)
	local direMid2 = Vector(2800, 2100, 256)


	local myBotTower2
		if myFaction == "radiant"
			then myBotTower2 = radiantBot2
		else myBotTower2 = direBot2
		end

	local myTopTower2
		if myFaction == "radiant"
			then myTopTower2 = radiantTop2
		else myTopTower2 = direTop2
		end

	local myMidTower2
		if myFaction == "radiant"
			then myMidTower2 = radiantMid2
		else myMidTower2 = direMid2
		end


	local myPos = Entity.GetAbsOrigin(npc)

	local homeSide
	if myPos:__sub(myFountainPos):Length2D() < myPos:__sub(enemyFountainPos):Length2D() then
		homeSide = true
	else homeSide = false
	end
	
	if not homeSide then
		return enemyFountainPos
	end

	if homeSide then
		if myPos:__sub(leftCornerPos):Length2D() <= 800 then
			return enemyFountainPos
		elseif myPos:__sub(rightCornerPos):Length2D() <= 800 then
			return enemyFountainPos
		elseif myPos:__sub(midPos):Length2D() <= 800 then
			return enemyFountainPos
		end
	end

	if homeSide then
		if myPos:__sub(leftCornerPos):Length2D() > 800 and myPos:__sub(rightCornerPos):Length2D() > 800 and myPos:__sub(midPos):Length2D() > 800 then
			
			if myPos:__sub(leftCornerPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(leftCornerPos):Length2D() < myPos:__sub(midPos):Length2D() then
				return leftCornerPos
			elseif myPos:__sub(leftCornerPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(myTopTower2):Length2D() < myPos:__sub(midPos):Length2D() and myPos:__sub(myMidTower2):Length2D() > myPos:__sub(myTopTower2):Length2D() then
				return leftCornerPos
			elseif myPos:__sub(rightCornerPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(rightCornerPos):Length2D() < myPos:__sub(midPos):Length2D() then
				return rightCornerPos
			elseif myPos:__sub(rightCornerPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(myBotTower2):Length2D() < myPos:__sub(midPos):Length2D() and myPos:__sub(myMidTower2):Length2D() > myPos:__sub(myBotTower2):Length2D() then
				return rightCornerPos
			elseif myPos:__sub(midPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(midPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(myMidTower2):Length2D() < myPos:__sub(myTopTower2):Length2D() then
				return enemyFountainPos
			elseif myPos:__sub(midPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(midPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(myMidTower2):Length2D() < myPos:__sub(myBotTower2):Length2D() then
				return enemyFountainPos
			else return enemyFountainPos
			end
		end
	end
end

function fooAllInOne.ForceBlink(myHero, enemy, range)

	if not myHero then return end
	
	local blink = NPC.GetItem(myHero, "item_blink", true)
		if not blink then return end
		if blink and not Ability.IsReady(blink) then return end

	if not enemy or (enemy and not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), range, 0)) then
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
			if NPC.IsPositionInRange(myHero, Input.GetWorldCursorPos(), 1100, 0) then
				Ability.CastPosition(blink, Input.GetWorldCursorPos())
				return
			else
				if fooAllInOne.SleepReady(0.1) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Input.GetWorldCursorPos(), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end	
		end
	end
end

-- item usage functions
function fooAllInOne.itemUsage(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionItemEnable) then return end
	if (os.clock() - fooAllInOne.lastItemTick) < fooAllInOne.itemDelay then return end
	if fooAllInOne.ItemCastStop then return end

	if Menu.GetValue(fooAllInOne.optionItemStyle) == 0 then 
		fooAllInOne.itemUsageNoOrder(myHero, enemy)
	elseif Menu.GetValue(fooAllInOne.optionItemStyle) == 1 then
		fooAllInOne.itemUsageOrder(myHero, enemy)
	elseif Menu.GetValue(fooAllInOne.optionItemStyle) == 2 then
		fooAllInOne.itemUsageSmartOrder(myHero, enemy)
	end

end

function fooAllInOne.itemUsageNoOrder(myHero, enemy)

	local myMana = NPC.GetMana(myHero)

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local hex = NPC.GetItem(myHero, "item_sheepstick", true)
	local blood = NPC.GetItem(myHero, "item_bloodthorn", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local orchid = NPC.GetItem(myHero, "item_orchid", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
	local atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local abyssal = NPC.GetItem(myHero, "item_abyssal_blade", true)
	local halberd = NPC.GetItem(myHero, "item_heavens_halberd", true)
	local shivas = NPC.GetItem(myHero, "item_shivas_guard", true)
	local urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
	local crest = NPC.GetItem(myHero, "item_solar_crest", true)

	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
		
		if soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				return
			end
		end

		if abyssal and NPC.IsEntityInRange(myHero, enemy, 140) and Ability.IsCastable(abyssal, myMana) and Menu.GetValue(fooAllInOne.optionItemAbyssal) > 0 then 
			Ability.CastTarget(abyssal, enemy)
			fooAllInOne.Debugger(GameRules.GetGameTime(), myHero, "abyssal", "DOTA_UNIT_ORDER_CAST_TARGET")
			return
		end

		if shivas and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(shivas, myMana) and Menu.GetValue(fooAllInOne.optionItemShivas) > 0 then 
			Ability.CastNoTarget(shivas)
			return
		end

		if mjollnir and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) and Menu.GetValue(fooAllInOne.optionItemMjollnir) > 0 then 
			Ability.CastTarget(mjollnir, myHero)
			return
		end

		if manta and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) and Menu.GetValue(fooAllInOne.optionItemManta) > 0 then 
			Ability.CastNoTarget(manta)
			return
		end

		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then

			if orchid and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(orchid, myMana) and Menu.GetValue(fooAllInOne.optionItemOrchid) > 0 then 
				Ability.CastTarget(orchid, enemy)
				return
			end

			if blood and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(blood, myMana) and Menu.GetValue(fooAllInOne.optionItemBlood) > 0 then 
				Ability.CastTarget(blood, enemy)
				fooAllInOne.Debugger(GameRules.GetGameTime(), myHero, "bloodthorn", "DOTA_UNIT_ORDER_CAST_TARGET")
				return
			end

			if veil and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(veil, myMana) and Menu.GetValue(fooAllInOne.optionItemVeil) > 0 then 
				Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
				return
			end

			if hex and NPC.IsEntityInRange(myHero, enemy, 800 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(hex, myMana) and Menu.GetValue(fooAllInOne.optionItemHex) > 0 then 
				Ability.CastTarget(hex, enemy)
				return
			end

			if eBlade and NPC.IsEntityInRange(myHero, enemy, 800 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(eBlade, myMana) and Menu.GetValue(fooAllInOne.optionItemeBlade) > 0 then 
				Ability.CastTarget(eBlade, enemy)
				return
			end
	
			if atos and NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(atos, myMana) and Menu.GetValue(fooAllInOne.optionItemAtos) > 0 then 
				Ability.CastTarget(atos, enemy)
				return
			end

			if halberd and NPC.IsEntityInRange(myHero, enemy, 600 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(halberd, myMana) and Menu.GetValue(fooAllInOne.optionItemHalberd) > 0 then
				Ability.CastTarget(halberd, enemy)
				return
			end

			if urn and NPC.IsEntityInRange(myHero, enemy, 950 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(urn, myMana) and Item.GetCurrentCharges(urn) >= 3 and Entity.GetHealth(enemy) >= 300 and Menu.GetValue(fooAllInOne.optionItemUrn) > 0 then
				Ability.CastTarget(urn, enemy)
				return
			end

			if medallion and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(medallion, myMana) and Menu.GetValue(fooAllInOne.optionItemMedallion) > 0 then 
				Ability.CastTarget(medallion, enemy)
				return
			end

			if crest and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(crest, myMana) and Menu.GetValue(fooAllInOne.optionItemCrest) > 0 then 
				Ability.CastTarget(crest, enemy)
				return
			end

			if dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) and Menu.GetValue(fooAllInOne.optionItemDagon) > 0 then
				if eBlade then
					if NPC.HasModifier(enemy, "modifier_item_ethereal_blade_ethereal") then
						Ability.CastTarget(dagon, enemy)
						return
					end
				else
					Ability.CastTarget(dagon, enemy)
					return
				end
			end

			if Menu.GetValue(fooAllInOne.optionItemDagon) == -1 then

				if dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
					local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 14 / 100)))
					if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
						if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							Ability.CastTarget(dagon, enemy)
							return
						end
					end
				end
			end
		end
	end
end

function fooAllInOne.itemUsageOrder(myHero, enemy)

	local myMana = NPC.GetMana(myHero)

	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
		
		if soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				return
			end
		end

		if Menu.GetValue(fooAllInOne.optionItemDagon) == -1 then

			if dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
				local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 14 / 100)))
				if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(dagon, enemy)
					end
				end
			end
		end

		local orderItem
		local customOrder = 0
		local itemActivation

		for k, v in ipairs(fooAllInOne.ItemCastOrder) do

			local skipItem = 0

			if NPC.HasModifier(enemy, "modifier_black_king_bar_immune") then
				if v[2] == "item_veil_of_discord" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or
					v[2] == "item_ethereal_blade" or v[2] == "item_orchid" or v[2] == "item_rod_of_atos" or
					v[2] == "item_heavens_halberd" or v[2] == "item_urn_of_shadows" or v[2] == "item_dagon"
					or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" or v[2] == "item_medallion_of_courage" or v[2] == "item_solar_crest" then
						skipItem = v[1]
				end
			end

			if NPC.HasModifier(myHero, "item_ethereal_blade") then
				if v[2] == "item_dagon" or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" and not NPC.HasModifier(enemy, "modifier_item_ethereal_blade_ethereal") then
					skipItem = v[1]
				end
			end

			if NPC.HasItem(myHero, v[2], true) then
				if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and (v[1] - skipItem) > customOrder then
						orderItem = NPC.GetItem(myHero, v[2], true)
						customOrder = v[1]
						itemActivation = v[3]
				end
			end	
		end
		
			if customOrder > 0 then
				if NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(orderItem)) then
					if itemActivation == "target" then
						Ability.CastTarget(orderItem, enemy)
						customOrder = 0
					end
					if itemActivation == "no target" then
						Ability.CastNoTarget(orderItem)
						customOrder = 0
					end
					if itemActivation == "position" then
						Ability.CastPosition(orderItem, Entity.GetAbsOrigin(enemy))
						customOrder = 0
					end
				end
			end

		if mjollnir and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) and Menu.GetValue(fooAllInOne.optionItemMjollnir) > 0 then
			Ability.CastTarget(mjollnir, myHero)
			return
		end

		if manta and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) and Menu.GetValue(fooAllInOne.optionItemManta) > 0 then
			Ability.CastNoTarget(manta)
			return
		end
	end
end

function fooAllInOne.itemUsageSmartOrder(myHero, enemy, activation)
	local alternateActivation
	if activation == nil then
		alternateActivation = false
	else alternateActivation = activation
	end
	

	local myMana = NPC.GetMana(myHero)

	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if (Menu.IsKeyDown(fooAllInOne.optionComboKey) or alternateActivation) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
		
		if soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				return
			end
		end

		if Menu.GetValue(fooAllInOne.optionItemDagon) == -1 then

			if dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
				local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 14 / 100)))
				if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(dagon, enemy)
					end
				end
			end
		end

		local orderItem
		local customOrder = 0
		local itemActivation

		for k, v in ipairs(fooAllInOne.ItemCastOrder) do

			local skipItem = 0

			if NPC.HasModifier(enemy, "modifier_black_king_bar_immune") then
				if v[2] == "item_veil_of_discord" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or
					v[2] == "item_ethereal_blade" or v[2] == "item_orchid" or v[2] == "item_rod_of_atos" or
					v[2] == "item_heavens_halberd" or v[2] == "item_urn_of_shadows" or v[2] == "item_dagon"
					or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" or v[2] == "item_medallion_of_courage" or v[2] == "item_solar_crest" then
						skipItem = v[1]
				end
			end

			if NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") then
				if v[2] == "item_abyssal_blade" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
					skipItem = v[1]
				end
			end

			if NPC.HasModifier(enemy, "modifier_sheepstick_debuff") then
				if v[2] == "item_abyssal_blade" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
					skipItem = v[1]
				end
			end

			if NPC.IsSilenced(enemy) then
				if v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
					skipItem = v[1]
				end
			end

			if NPC.HasModifier(myHero, "item_ethereal_blade") then
				if v[2] == "item_dagon" or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" and not NPC.HasModifier(enemy, "modifier_item_ethereal_blade_ethereal") then
					skipItem = v[1]
				end
			end

			if NPC.HasItem(myHero, v[2], true) then
				if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and (v[1] - skipItem) > customOrder then
				orderItem = NPC.GetItem(myHero, v[2], true)
						customOrder = v[1]
						itemActivation = v[3]
				end
			end	
		end
		
			if customOrder > 0 then
				if NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(orderItem)) then
					if itemActivation == "target" then
						Ability.CastTarget(orderItem, enemy)
						customOrder = 0
						return
					end
					if itemActivation == "no target" then
						Ability.CastNoTarget(orderItem)
						customOrder = 0
						return
					end
					if itemActivation == "position" then
						Ability.CastPosition(orderItem, Entity.GetAbsOrigin(enemy))
						customOrder = 0
						return
					end
				end
			end

		if mjollnir and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) and Menu.GetValue(fooAllInOne.optionItemMjollnir) > 0 then
			Ability.CastTarget(mjollnir, myHero)
			return
		end

		if manta and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) and Menu.GetValue(fooAllInOne.optionItemManta) > 0 then
			Ability.CastNoTarget(manta)
			return
		end
	end
end

-- linkens breaker functions
function fooAllInOne.LinkensBreakerNew(myHero)
	if not Menu.IsEnabled(fooAllInOne.optionLinkensEnable) then return end

	local myMana = NPC.GetMana(myHero)

 	local prioItem
	local prioOrder = 0

	for k, v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
	
	
		if NPC.HasItem(myHero, v[2], true) then
			if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and v[1] > prioOrder then
					prioItem = v[2]
					prioOrder = v[1]
				
			end
		end	
	
	end
	return prioItem	
end
	
-- utility item usage functions
function fooAllInOne.utilityItemUsage(myHero)

	local stick = NPC.GetItem(myHero, "item_magic_stick", true)
	local wand = NPC.GetItem(myHero, "item_magic_wand", true)
	local mekansm = NPC.GetItem(myHero, "item_mekansm", true)
	local greaves = NPC.GetItem(myHero, "item_guardian_greaves", true)
	local arcane = NPC.GetItem(myHero, "item_arcane_boots", true)
	local midas = NPC.GetItem(myHero, "item_hand_of_midas", true)
	local talon = NPC.GetItem(myHero, "item_iron_talon", true)

	local myMana = NPC.GetMana(myHero)

	if (stick or wand) and Menu.IsEnabled(fooAllInOne.optionUtilityStick) then
		fooAllInOne.utilityItemStick(myHero, stick, wand)
	end
	if mekansm and Menu.IsEnabled(fooAllInOne.optionUtilityMek) then
		fooAllInOne.utilityItemMek(myHero, mekansm, myMana)
	end
	if greaves and Menu.IsEnabled(fooAllInOne.optionUtilityGreaves) then
		fooAllInOne.utilityItemGreaves(myHero, greaves)
	end
	if arcane and Menu.IsEnabled(fooAllInOne.optionUtilityArcane) then
		fooAllInOne.utilityItemArcane(myHero, arcane)
	end
	if midas and Menu.IsEnabled(fooAllInOne.optionUtilityMidas) then
		fooAllInOne.utilityItemMidas(myHero, midas)
	end
	if talon and Menu.IsEnabled(fooAllInOne.optionUtilityTalon) then
		fooAllInOne.utilityItemTalon(myHero, talon)
	end
end

function fooAllInOne.utilityItemStick(myHero, stick, wand)
	
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	
	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast")and not NPC.IsChannellingAbility(myHero) then
		if stick and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(stick) then
			if Item.GetCurrentCharges(stick) >= 1 then 
				Ability.CastNoTarget(stick)
				return
			end
		end
		if wand and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(wand) then 
			if Item.GetCurrentCharges(wand) >= 1 then 
				Ability.CastNoTarget(wand)
				return
			end
		end
	end
end

function fooAllInOne.utilityItemMek(myHero, mekansm, myMana)
	if not mekansm then return end
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	Log.Write(myHealthPerc)
	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
		if (myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth)) and Ability.IsCastable(mekansm, myMana) then 
			Ability.CastNoTarget(mekansm) 
			return
		end
	end

	for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
		if teamMates then
			if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(teamMates, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
				if (Entity.GetHealth(teamMates) / Entity.GetMaxHealth(teamMates)) * 100 <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsCastable(mekansm, myMana) then
					Ability.CastNoTarget(mekansm) 
					return 
				end
			end
		end
	end
end

function fooAllInOne.utilityItemGreaves(myHero, greaves)
	if not greaves then return end
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
		if greaves and (myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth)) and Ability.IsReady(greaves) then 
			Ability.CastNoTarget(greaves) 
			return
		end
	end

	for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
		if teamMates then
			if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(teamMates, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
				if greaves and (Entity.GetHealth(teamMates) / Entity.GetMaxHealth(teamMates)) * 100 <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(greaves) then
					Ability.CastNoTarget(greaves) 
					return 
				end
			end
		end
	end
end

function fooAllInOne.utilityItemArcane(myHero, arcane)
	if not arcane then return end
	local myManaMissing = NPC.GetMaxMana(myHero) - NPC.GetMana(myHero)
	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.IsChannellingAbility(myHero) then
		if arcane and myManaMissing >= 200 and Ability.IsReady(arcane) then 
			Ability.CastNoTarget(arcane)
			return 
		end
	end


	for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
		if teamMates then
			if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.IsChannellingAbility(myHero) then
				if arcane and (NPC.GetMana(teamMates) / NPC.GetMaxMana(teamMates)) * 100 <= 40 and Ability.IsReady(arcane) then 
					Ability.CastNoTarget(arcane)
					return 
				end 
			end
		end
	end
end

function fooAllInOne.utilityItemMidas(myHero, midas, bountyXPthreshold)
	if not midas then return end

	local bountyXP
	if bountyXPthreshold == nil then
		if Menu.GetValue(fooAllInOne.optionUtilityMidasXP) == 0 then
			bountyXP = 40
		else
			bountyXP = 88
		end
	else bountyXP = bountyXPthreshold
	end

	AncientNameList = { "npc_dota_neutral_black_drake",
    				"npc_dota_neutral_black_dragon",
    				"npc_dota_neutral_blue_dragonspawn_sorcerer",
    				"npc_dota_neutral_blue_dragonspawn_overseer",
    				"npc_dota_neutral_granite_golem",
    				"npc_dota_neutral_elder_jungle_stalker",
    				"npc_dota_neutral_prowler_acolyte",
    				"npc_dota_neutral_prowler_shaman",
    				"npc_dota_neutral_rock_golem",
    				"npc_dota_neutral_small_thunder_lizard",
    				"npc_dota_neutral_jungle_stalker",
    				"npc_dota_neutral_big_thunder_lizard",
    				"npc_dota_roshan" }

	for _, creeps in pairs(NPC.GetUnitsInRadius(myHero, 580, Enum.TeamType.TEAM_ENEMY)) do
		local bounty = NPC.GetBountyXP(creeps)
		local creepName = NPC.GetUnitName(creeps)
			for _, ancientName in ipairs(AncientNameList) do
				if creepName ~= nil then	
					if creepName == ancientName then 
						return
					end
				end
			end
			if (NPC.IsLaneCreep(creeps) or NPC.IsCreep(creeps)) and not NPC.IsDormant(creeps) and bounty >= bountyXP and Ability.IsReady(midas) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
				Ability.CastTarget(midas, creeps)
				return
			end
	end
end

function fooAllInOne.utilityItemTalon(myHero, talon, midas)
	if not talon then return end
	if midas and Ability.IsReady(midas) then return end

	AncientNameList = { "npc_dota_neutral_black_drake",
    				"npc_dota_neutral_black_dragon",
    				"npc_dota_neutral_blue_dragonspawn_sorcerer",
    				"npc_dota_neutral_blue_dragonspawn_overseer",
    				"npc_dota_neutral_granite_golem",
    				"npc_dota_neutral_elder_jungle_stalker",
    				"npc_dota_neutral_prowler_acolyte",
    				"npc_dota_neutral_prowler_shaman",
    				"npc_dota_neutral_rock_golem",
    				"npc_dota_neutral_small_thunder_lizard",
    				"npc_dota_neutral_jungle_stalker",
    				"npc_dota_neutral_big_thunder_lizard",
    				"npc_dota_roshan" }

	local maxHPcreep
	local maxHP = 0
	for _, creeps in ipairs(NPC.GetUnitsInRadius(myHero, 250, Enum.TeamType.TEAM_ENEMY)) do
		if Entity.IsHero(creeps) or NPC.IsLaneCreep(creeps) then return end
	local creepName = NPC.GetUnitName(creeps)
			for _, ancientName in ipairs(AncientNameList) do
				if creepName ~= nil then	
					if creepName == ancientName then 
						return
					end
				end
			end


        if NPC.IsNeutral(creeps) and (Entity.GetHealth(creeps) / Entity.GetMaxHealth(creeps)) >= 0.7 and Entity.GetHealth(creeps) >= maxHP then
            maxHPcreep = creeps
            maxHP = Entity.GetMaxHealth(creeps)
        end
   	end

	if next(NPC.GetUnitsInRadius(myHero, 330, Enum.TeamType.TEAM_ENEMY)) == nil then
		maxHP = 0
	end

	if maxHPcreep and NPC.IsAttacking(myHero) and Ability.IsReady(talon) then
		Ability.CastTarget(talon, maxHPcreep)
		return
	end
end

-- hero functions
function fooAllInOne.axeCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroAxe) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1700)	then return end

	local call = NPC.GetAbilityByIndex(myHero, 0)
	local hunger = NPC.GetAbilityByIndex(myHero, 1)
	local culling = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local myMana = NPC.GetMana(myHero)

	local cursorCheck
	if Menu.IsEnabled(fooAllInOne.optionHeroAxeForceBlink) then
		if NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(fooAllInOne.optionHeroAxeForceBlinkRange)-1, 0) then
			cursorCheck = true
		else
			cursorCheck = false
		end
	else
		cursorCheck = true
	end
	
	fooAllInOne.itemUsage(myHero, enemy)
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and cursorCheck then
		if not NPC.IsEntityInRange(myHero, enemy, 260) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150) then
					if Menu.GetValue(fooAllInOne.optionHeroAxeJump) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					else
						Ability.CastPosition(blink, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 300, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 280))
					end
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) then
				if fooAllInOne.SleepReady(0.1) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		else
			if culling and Entity.GetHealth(enemy) <= Ability.GetLevelSpecialValueFor(culling, "kill_threshold") and NPC.IsEntityInRange(myHero, enemy, 150) and Ability.IsCastable(culling, myMana) then 
				Ability.CastTarget(culling, enemy)
				fooAllInOne.lastTick = os.clock()
				return 
			end 
			if fooAllInOne.SleepReady(Ability.GetCastPoint(culling)) and call and Ability.IsCastable(call, myMana) then 
				Ability.CastNoTarget(call)
				fooAllInOne.lastTick = os.clock()
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(call)) and Blademail and NPC.HasModifier(enemy, "modifier_axe_berserkers_call") and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(call)) and hunger and NPC.HasModifier(enemy, "modifier_axe_berserkers_call") and Ability.IsCastable(hunger, myMana - Ability.GetManaCost(culling)) then 
				Ability.CastTarget(hunger, enemy)
			end
		end
	end
end

function fooAllInOne.clockwerkCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroClock) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3100)	then return end
	
	local BatteryAssault = NPC.GetAbilityByIndex(myHero, 0)
	local PowerCogs = NPC.GetAbilityByIndex(myHero, 1)
	local RocketFlair = NPC.GetAbilityByIndex(myHero, 2)
	local HookShot = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local myMana = NPC.GetMana(myHero)
	
	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 225) then
			if HookShot and Ability.IsCastable(HookShot, myMana) and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(HookShot)) then
				local hookshotPrediction = Ability.GetCastPoint(HookShot) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / Ability.GetLevelSpecialValueFor(HookShot, "speed")) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(HookShot, fooAllInOne.castLinearPrediction(myHero, enemy, hookshotPrediction))
				fooAllInOne.lastTick = os.clock()
			end
		else
			if fooAllInOne.SleepReady(Ability.GetCastPoint(HookShot)) and PowerCogs and Ability.IsCastable(PowerCogs, myMana) then 
				Ability.CastNoTarget(PowerCogs)
				fooAllInOne.lastTick = os.clock()
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(PowerCogs)) and BatteryAssault and Ability.IsCastable(BatteryAssault, myMana) then 
				Ability.CastNoTarget(BatteryAssault)
				fooAllInOne.lastTick = os.clock()
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(BatteryAssault)) and Blademail and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
			end			
			if fooAllInOne.SleepReady(Ability.GetCastPoint(BatteryAssault)) and RocketFlair and Ability.IsCastable(RocketFlair, myMana) then 
				Ability.CastPosition(RocketFlair, Entity.GetAbsOrigin(enemy))
				return 
			end
		end
	end
end

function fooAllInOne.skywrathCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroSky) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1800)	then return end

	local arcaneBolt = NPC.GetAbilityByIndex(myHero, 0)
    	local concussiveShot = NPC.GetAbilityByIndex(myHero, 1)
    	local ancientSeal = NPC.GetAbilityByIndex(myHero, 2)
    	local mysticFlare = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	fooAllInOne.itemUsage(myHero, enemy)
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 800) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(500)))
				return
			end
		else
	
			if ancientSeal and Ability.IsCastable(ancientSeal, myMana) then
				Ability.CastTarget(ancientSeal, enemy)
				fooAllInOne.lastTick = os.clock()
			end

			if fooAllInOne.SleepReady(Ability.GetCastPoint(ancientSeal)) and arcaneBolt and Ability.IsCastable(arcaneBolt, myMana) then
				Ability.CastTarget(arcaneBolt, enemy)
				fooAllInOne.lastTick = os.clock()
			end

			if fooAllInOne.SleepReady(Ability.GetCastPoint(arcaneBolt)) and concussiveShot and Ability.IsCastable(concussiveShot, myMana) then
				Ability.CastNoTarget(concussiveShot)
			end

			if fooAllInOne.SleepReady(Ability.GetCastPoint(ancientSeal)) and mysticFlare and Ability.IsCastable(mysticFlare, myMana) then
				if NPC.HasModifier(enemy, "modifier_rod_of_atos_debuff") or NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.HasModifier(enemy, "modifier_rooted") or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
					Ability.CastPosition(mysticFlare, Entity.GetAbsOrigin(enemy))
				else
					local flarePrediction = Ability.GetCastPoint(mysticFlare) + 0.2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
					Ability.CastPosition(mysticFlare, fooAllInOne.castPrediction(myHero, enemy, flarePrediction))
				end
			end

			if fooAllInOne.SleepReady(0.1) and not (Ability.IsReady(ancientSeal) and Ability.IsReady(arcaneBolt) and Ability.IsReady(concussiveShot) and Ability.IsReady(mysticFlare)) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end
end			

function fooAllInOne.tinyCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroTiny) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
    
    	local avalanche = NPC.GetAbilityByIndex(myHero, 0)
    	local toss = NPC.GetAbilityByIndex(myHero, 1)
    	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 275) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
			end
		else
			fooAllInOne.itemUsage(myHero, enemy)
			if avalanche and Ability.IsCastable(avalanche, myMana) then 
				Ability.CastPosition(avalanche, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
			end
    			if fooAllInOne.SleepReady(Ability.GetCastPoint(avalanche)) and toss and Ability.IsCastable(toss, myMana) then 
				Ability.CastTarget(toss, enemy)
				return 
			end
		end
	end
end

function fooAllInOne.WindRunnerCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroWindrunner) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
	if (os.clock() - fooAllInOne.lastTick) < fooAllInOne.delay then return end

	local shackleShot = NPC.GetAbilityByIndex(myHero, 0)
	local powerShot = NPC.GetAbilityByIndex(myHero, 1)
	local windRun = NPC.GetAbilityByIndex(myHero, 2)
	local focusFire = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)
	
	local branch = NPC.GetItem(myHero, "item_branches", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and NPC.IsEntityInRange(myHero, enemy, 750) then
		if branch then
			if blink then	
				if shackleShot and Ability.IsCastable(shackleShot, myMana) then
					Ability.CastTarget(shackleShot, enemy)
			--		return
				end
				if blink and Ability.IsReady(blink) and not Ability.IsReady(shackleShot) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Rotated(Angle(0,45,0)):Normalized():Scaled(200))
					Ability.CastPosition(branch, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(150))
			--		return
				end
			end
		else fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Entity.GetHealth(enemy) > 0 then
		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then

			local shackleMod = NPC.GetModifier(enemy, "modifier_windrunner_shackle_shot")
				if not shackleMod then return end
			local shackleTime = Modifier.GetCreationTime(shackleMod) + Modifier.GetDuration(shackleMod)

			if NPC.HasModifier(enemy, "modifier_windrunner_shackle_shot") and Modifier.GetDuration(shackleMod) >= 1.5 then
				fooAllInOne.itemUsage(myHero, enemy, true)
				if focusFire and Ability.IsCastable(focusFire, myMana) then
					Ability.CastTarget(focusFire, enemy)
					return
				end
				if windRun and Ability.IsCastable(windRun, myMana) and #NPC.GetHeroesInRadius(myHero, 600, Enum.TeamType.TEAM_ENEMY) >= 3 then
					Ability.CastNoTarget(windRun)
					return
				end
				if powerShot and Ability.IsCastable(powerShot, myMana) and Entity.GetHealth(enemy) <= (Ability.GetDamage(powerShot) * (1 - NPC.GetMagicalArmorValue(enemy))) then
					if GameRules.GetGameTime() <= (shackleTime - 1) then
						Ability.CastPosition(powerShot, Entity.GetAbsOrigin(enemy))
						return
					end
				end
			end
		end
	end
end



function fooAllInOne.TimberCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTimber) then return end
	
	if (os.clock() - fooAllInOne.lastTick) < fooAllInOne.delay then return end

	local whirlingDeath = NPC.GetAbilityByIndex(myHero, 0)
	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
	local chakram = NPC.GetAbility(myHero, "shredder_chakram")
	local chakramReturn = NPC.GetAbility(myHero, "shredder_return_chakram")
	local chakramAgha = NPC.GetAbility(myHero, "shredder_chakram_2")
	local chakramAghaReturn = NPC.GetAbility(myHero, "shredder_return_chakram_2")

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	local chainCheckRange = Ability.GetCastRange(timberChain) + NPC.GetCastRangeBonus(myHero)
		if blink then
			chainCheckRange = chainCheckRange + 1150
		end
	if not NPC.IsPositionInRange(myHero, Input.GetWorldCursorPos(), chainCheckRange, 0) then return end

	local myMana = NPC.GetMana(myHero)

	if Entity.GetHealth(enemy) > 0 and NPC.HasModifier(myHero, "modifier_shredder_timber_chain") then
		if whirlingDeath and Ability.IsCastable(whirlingDeath, myMana) and NPC.IsEntityInRange(myHero, enemy, 300) then
			Ability.CastNoTarget(whirlingDeath)
			fooAllInOne.makeDelay(Ability.GetCastPoint(whirlingDeath))
			return
		end
	end

	fooAllInOne.itemUsage(myHero, enemy)
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
	
		if not NPC.IsPositionInRange(myHero, Input.GetWorldCursorPos(), Ability.GetCastRange(timberChain), 0) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) - (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(250))
			end
		else	
			if timberChain and Ability.IsCastable(timberChain, myMana) then
				Ability.CastPosition(timberChain, Input.GetWorldCursorPos())
				return
			end
			if NPC.HasModifier(enemy, "modifier_shredder_whirling_death_debuff") then
				local chakramPrediction = Ability.GetCastPoint(chakram) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 900) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				if blink and Ability.IsReady(blink) and (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D()) >= 800 then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					return
				elseif not Ability.IsHidden(chakram) then
					if chakram and Ability.IsCastable(chakram, myMana) then
						Ability.CastPosition(chakram, fooAllInOne.castLinearPrediction(myHero, enemy, chakramPrediction))
						fooAllInOne.lastCastTime = 1
						return
					end
				elseif not Ability.IsHidden(chakramAgha) and Ability.IsHidden(chakram) then
					if chakramAgha and Ability.IsCastable(chakramAgha, myMana) then
						Ability.CastPosition(chakramAgha, fooAllInOne.castLinearPrediction(myHero, enemy, chakramPrediction))
						fooAllInOne.lastCastTime2 = 1
						return
					end
				end
			end
		end
	end

	if not Ability.IsHidden(chakramReturn) and fooAllInOne.lastCastTime == 1 then
		if chakramReturn and Ability.IsCastable(chakramReturn, myMana) and (Ability.SecondsSinceLastUse(chakram) >= 1 and not NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff")) or (NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff") and Ability.SecondsSinceLastUse(chakram) >= 2.5) then
			Ability.CastNoTarget(chakramReturn)
			fooAllInOne.lastCastTime = 0
			return
		end
	end
	if not Ability.IsHidden(chakramAghaReturn) and fooAllInOne.lastCastTime2 == 1 then
		if chakramAghaReturn and Ability.IsCastable(chakramAghaReturn, myMana) and (Ability.SecondsSinceLastUse(chakramAgha) >= 1 and not NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff")) or (NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff") and Ability.SecondsSinceLastUse(chakramAgha) >= 2.5) then
			Ability.CastNoTarget(chakramAghaReturn)
			fooAllInOne.lastCastTime2 = 0
			return
		end
	end
end

function fooAllInOne.TimberSaveChakramReturn(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTimber) then return end

	local chakramReturn = NPC.GetAbility(myHero, "shredder_return_chakram")
	local chakramAghaReturn = NPC.GetAbility(myHero, "shredder_return_chakram_2")
	
	if Menu.IsKeyDownOnce(fooAllInOne.optionComboKey)then
		if not enemy then
			if not Ability.IsHidden(chakramReturn) and fooAllInOne.lastCastTime == 1 then
				if chakramReturn and Ability.IsReady(chakramReturn) then
					Ability.CastNoTarget(chakramReturn)
					fooAllInOne.lastCastTime = 0
					return
				end
			end
			if not Ability.IsHidden(chakramAghaReturn) and fooAllInOne.lastCastTime2 == 1 then
				if chakramAghaReturn and Ability.IsReady(chakramAghaReturn) then
					Ability.CastNoTarget(chakramAghaReturn)
					fooAllInOne.lastCastTime2 = 0
					return
				end
			end
		end
	end
end

function fooAllInOne.EmberCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroEmber) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1600)	then return end

	local chains = NPC.GetAbility(myHero, "ember_spirit_searing_chains")
	local fist = NPC.GetAbility(myHero, "ember_spirit_sleight_of_fist")
	local flameGuard = NPC.GetAbility(myHero, "ember_spirit_flame_guard")
	local activeRemnant = NPC.GetAbilityByIndex(myHero, 3)
	local remnant = NPC.GetAbility(myHero, "ember_spirit_fire_remnant")
	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	local remnantModifier = NPC.GetModifier(myHero, "modifier_ember_spirit_fire_remnant_charge_counter")

	local fistRange = 650
		if fist then
			fistRange = fistRange + Ability.GetLevelSpecialValueFor(fist, "radius")
		end
		
	fooAllInOne.itemUsage(myHero, enemy)

	local myPos = Entity.GetAbsOrigin(myHero)
	if NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") then
		if chains and Ability.IsCastable(chains, myMana) then
			if NPC.IsEntityInRange(myHero, enemy, 85) then
				Ability.CastNoTarget(chains)
			end
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, fistRange) then
			if blink and Ability.IsReady(blink) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(200)))
			end
		else
			
			if fist and Ability.IsCastable(fist, myMana) then
				fooAllInOne.noItemCastFor(0.5)
				if NPC.IsEntityInRange(myHero, enemy, 650) then
					Ability.CastPosition(fist, Entity.GetAbsOrigin(enemy))
				else
					Ability.CastPosition(fist, (Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(690)))
				end
			end

			if flameGuard and Ability.IsCastable(flameGuard, myMana) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				Ability.CastNoTarget(flameGuard)
			end
	
			if remnant and Ability.IsReady(remnant) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.GetMana(myHero) >= Ability.GetManaCost(activeRemnant) and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				local remnantCharges = Modifier.GetStackCount(remnantModifier)
				if Menu.GetValue(fooAllInOne.optionHeroEmberUlt) == 0 then
					if remnantCharges == 3 then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()			
					end
					if remnantCharges == 2 then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
					if remnantCharges == 1 then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
				end
				if Menu.GetValue(fooAllInOne.optionHeroEmberUlt) == 1 then
					if remnantCharges > 2 and fooAllInOne.SleepReady(3) then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
					if remnantCharges >= 2 and fooAllInOne.SleepReady(3) then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
				end
			end
			local remnantCharges = Modifier.GetStackCount(remnantModifier)
			if activeRemnant and remnantCharges < 3 and Ability.IsCastable(activeRemnant, myMana) and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				for i = 1, NPCs.Count() do 
				local npc = NPCs.Get(i)
					if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
						if Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero) then
							if NPC.GetUnitName(npc) == "npc_dota_ember_spirit_remnant" then
								if NPC.IsEntityInRange(npc, enemy, 350) then
									Ability.CastPosition(activeRemnant, Entity.GetAbsOrigin(npc))
									break
								end
							end
						end
					end
				end
			end
		end
	end	
end

function fooAllInOne.UrsaCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroUrsa) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end

	local earthShock = NPC.GetAbilityByIndex(myHero, 0)
	local overPower = NPC.GetAbilityByIndex(myHero, 1)
	local enrage = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if overPower and Ability.IsCastable(overPower, myMana) then
			Ability.CastNoTarget(overPower)
			fooAllInOne.lastTick = os.clock()
		end
		if fooAllInOne.SleepReady(Ability.GetCastPoint(overPower)) then
			if not NPC.IsEntityInRange(myHero, enemy, 375) then
				if blink and Ability.IsReady(blink) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
				end
			else
				if earthShock and Ability.IsCastable(earthShock, myMana) then
					Ability.CastNoTarget(earthShock)
					fooAllInOne.lastTick = os.clock()
				end
			end
		end
	end
	
	for k, _ in ipairs(NPC.GetHeroesInRadius(myHero, 650, Enum.TeamType.TEAM_ENEMY)) do		
		if (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) <= 0.35 and #NPC.GetHeroesInRadius(myHero, 650, Enum.TeamType.TEAM_ENEMY) >= 2 then
			if fooAllInOne.SleepReady(Ability.GetCastPoint(earthShock)) and enrage and Ability.IsCastable(enrage, myMana) then
				Ability.CastNoTarget(enrage)
				return
			end
		end
	end
end

function fooAllInOne.TACombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTA) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end

	local refraction = NPC.GetAbilityByIndex(myHero, 0)
	local meld = NPC.GetAbilityByIndex(myHero, 1)
	local psionicTrap = NPC.GetAbilityByIndex(myHero, 4)
	local trap = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local refractionModifier = NPC.GetModifier(myHero, "modifier_templar_assassin_refraction_damage")
	local meldModifier = NPC.GetModifier(myHero, "modifier_templar_assassin_meld")

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if refraction and Ability.IsCastable(refraction, myMana) then
			Ability.CastNoTarget(refraction)
		end
		if not Menu.IsEnabled(fooAllInOne.optionHeroTATrap) then
			if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)-25) then
				if blink and Ability.IsReady(blink) and Menu.IsEnabled(fooAllInOne.optionHeroTABlink) then
					Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(200)))
				end
				if fooAllInOne.SleepReady(0.1) and not blink or (blink and not Ability.IsReady(blink)) or not Menu.IsEnabled(fooAllInOne.optionHeroTABlink) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
				end	
			else
				if meld and Ability.IsCastable(meld, myMana) then
					fooAllInOne.noItemCastFor(0.1)
					Ability.CastNoTarget(meld)
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(0.05) and NPC.HasModifier(myHero, "modifier_templar_assassin_meld") then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(0.1) and psionicTrap and Ability.IsCastable(psionicTrap, myMana) and not NPC.HasModifier(myHero, "modifier_templar_assassin_meld") and not Ability.IsReady(meld) then
					Ability.CastPosition(psionicTrap, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) and trap and Ability.IsCastable(trap, myMana) and Ability.SecondsSinceLastUse(psionicTrap) > 0 and Ability.SecondsSinceLastUse(psionicTrap) < 1 then
					Ability.CastNoTarget(trap)
				end
			end
		else
			if psionicTrap and Ability.IsCastable(psionicTrap, myMana) then
				Ability.CastPosition(psionicTrap, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) and trap and Ability.IsReady(trap) and Ability.SecondsSinceLastUse(psionicTrap) > 0 and Ability.SecondsSinceLastUse(psionicTrap) < 1 then
				Ability.CastNoTarget(trap)
				fooAllInOne.lastTick = os.clock()
			end
			if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
				if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) then
					if fooAllInOne.SleepReady(0.1) and blink and Ability.IsReady(blink) and Menu.IsEnabled(fooAllInOne.optionHeroTABlink) then
						Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(200)))
					end
					if fooAllInOne.SleepReady(0.1) and not blink or (blink and not Ability.IsReady(blink)) or not Menu.IsEnabled(fooAllInOne.optionHeroTABlink) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
					end
				end
			else
				if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) and meld and Ability.IsCastable(meld, myMana) then
					fooAllInOne.noItemCastFor(0.1)
					Ability.CastNoTarget(meld)
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(0.1) and NPC.HasModifier(myHero, "modifier_templar_assassin_meld") then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
				end
			end
		end
	end		
end

function fooAllInOne.LegionCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroLegion) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end

	local odds = NPC.GetAbilityByIndex(myHero, 0)
	local pressTheAttack = NPC.GetAbilityByIndex(myHero, 1)
    	local duel = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then

		if not NPC.IsEntityInRange(myHero, enemy, 150) then
			if fooAllInOne.SleepReady(0.1) and not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) then
					if Blademail and Ability.IsCastable(Blademail, myMana) then
						Ability.CastNoTarget(Blademail)
					end
					if pressTheAttack and Ability.IsCastable(pressTheAttack, myMana) then
						Ability.CastTarget(pressTheAttack, myHero)
						fooAllInOne.lastTick = os.clock()
					end
					if fooAllInOne.SleepReady(Ability.GetCastPoint(pressTheAttack)) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.lastTick = os.clock()
			end
		end
		if NPC.IsEntityInRange(myHero, enemy, 150) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
				if Blademail and Ability.IsCastable(Blademail, myMana) then
					Ability.CastNoTarget(Blademail)
				end
				if pressTheAttack and Ability.IsCastable(pressTheAttack, myMana) then
					Ability.CastTarget(pressTheAttack, myHero)
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(pressTheAttack)) then
					if NPC.IsLinkensProtected(enemy) then
						if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
							Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
						end
					else
						Ability.CastTarget(duel, enemy)
						return
					end
				end
			end
		end
	end
end

function fooAllInOne.SlardarCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSlardar) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end

	local sprint = NPC.GetAbilityByIndex(myHero, 0)
	local crush = NPC.GetAbilityByIndex(myHero, 1)
	local haze = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, 300) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) then
					if Menu.GetValue(fooAllInOne.optionHeroSlardarStyle) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					else
						Ability.CastPosition(blink, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 350, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 330))
					end
				end
			end
			if fooAllInOne.SleepReady(0.1) and NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.lastTick = os.clock()
			end
		end
		if NPC.IsEntityInRange(myHero, enemy, 300) then
			
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
				if crush and Ability.IsCastable(crush, myMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastNoTarget(crush)
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(crush)) and NPC.IsLinkensProtected(enemy) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
					end
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(crush)) and haze and Ability.IsCastable(haze, myMana) and NPC.HasModifier(enemy, "modifier_stunned") then
					Ability.CastTarget(haze, enemy)
					return
				end
			end
		end
	end
end

function fooAllInOne.ClinkzCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkz) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end

	local strafe = NPC.GetAbilityByIndex(myHero, 0)
	local searingArrows = NPC.GetAbilityByIndex(myHero, 1)
	local skeletonWalk = NPC.GetAbilityByIndex(myHero, 2)
	local deathPact = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)
	
	local clinkzAttackRange = NPC.GetAttackRange(myHero)
		if NPC.HasModifier(myHero, "modifier_item_dragon_lance") then
			clinkzAttackRange = clinkzAttackRange + 140
		end
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if fooAllInOne.SleepReady(0.1) and not NPC.IsEntityInRange(myHero, enemy, clinkzAttackRange-160) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, NPC.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
			fooAllInOne.lastTick = os.clock()
		end
		if NPC.IsEntityInRange(myHero, enemy, clinkzAttackRange-140) then
			
			if strafe and Ability.IsCastable(strafe, myMana) then
				Ability.CastNoTarget(strafe)
			end
			if fooAllInOne.SleepReady(0.1) then
				Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
				fooAllInOne.lastTick = os.clock()
			end
			
		end
	end					
end

function fooAllInOne.ClinkzAutoUlt(myHero)

	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkz) then return end
	if (os.clock() - fooAllInOne.lastTick) < fooAllInOne.delay then return end

	AncientNameList = { "npc_dota_neutral_black_drake",
    				"npc_dota_neutral_black_dragon",
    				"npc_dota_neutral_blue_dragonspawn_sorcerer",
    				"npc_dota_neutral_blue_dragonspawn_overseer",
    				"npc_dota_neutral_granite_golem",
    				"npc_dota_neutral_elder_jungle_stalker",
    				"npc_dota_neutral_prowler_acolyte",
    				"npc_dota_neutral_prowler_shaman",
    				"npc_dota_neutral_rock_golem",
    				"npc_dota_neutral_small_thunder_lizard",
    				"npc_dota_neutral_jungle_stalker",
    				"npc_dota_neutral_big_thunder_lizard",
    				"npc_dota_roshan" }

	local deathPact = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)

	local maxHPcreep
	local maxHP = 0
	local ancientChecker = false
	for _, creeps in ipairs(NPC.GetUnitsInRadius(myHero, 380, Enum.TeamType.TEAM_ENEMY)) do
		if Entity.IsHero(creeps) then return end
	local creepName = NPC.GetUnitName(creeps)
			for _, ancientName in ipairs(AncientNameList) do
				if creepName ~= nil then	
					if creepName == ancientName then 
						ancientChecker = true
					end
				end
			end


      		if not ancientChecker and (NPC.IsCreep(creeps) or NPC.IsLaneCreep(creeps)) and Entity.GetMaxHealth(creeps) >= 550 and Entity.GetHealth(creeps) >= maxHP then
           		maxHPcreep = creeps
            		maxHP = Entity.GetMaxHealth(creeps)
        	end
   	end

	if next(NPC.GetUnitsInRadius(myHero, 380, Enum.TeamType.TEAM_ENEMY)) == nil then
		maxHP = 0
	end

	if maxHPcreep and deathPact and Ability.IsCastable(deathPact, myMana) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_clinkz_death_pact") then
		Ability.CastTarget(deathPact, maxHPcreep)
		fooAllInOne.makeDelay(Ability.GetCastPoint(deathPact))
		return
	end

end

function fooAllInOne.QoPCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroQoP) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end

	local shadowStrike = NPC.GetAbilityByIndex(myHero, 0)
	local qopBlink = NPC.GetAbilityByIndex(myHero, 1)
	local screamOfPain = NPC.GetAbilityByIndex(myHero, 2)
	local sonicWave = NPC.GetAbilityByIndex(myHero, 3)

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 425) then
			if qopBlink and Ability.IsCastable(qopBlink, myMana) then
				Ability.CastPosition(qopBlink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(350)))
				fooAllInOne.lastTick = os.clock()
			end
		else
			if screamOfPain and Ability.IsCastable(screamOfPain, myMana) then
				Ability.CastNoTarget(screamOfPain)
			end
			if shadowStrike and Ability.IsCastable(shadowStrike, myMana) then
				Ability.CastTarget(shadowStrike, enemy)
				fooAllInOne.lastTick = os.clock()
			end
		end
	end

	if aghanims then
		if NPC.IsEntityInRange(myHero, enemy, 1000) then
			if sonicWave and Ability.IsCastable(sonicWave, myMana) then
				if Entity.GetHealth(enemy) <= Ability.GetLevelSpecialValueFor(sonicWave, "damage_scepter") then
					Ability.CastPosition(sonicWave, (Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(600)))
				end
			end
		end
	end
end

function fooAllInOne.SvenCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSven) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end

	local stormHammer = NPC.GetAbilityByIndex(myHero, 0)
	local warCry = NPC.GetAbilityByIndex(myHero, 2)
	local godsStrength = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	local maskOfMadness = NPC.GetItem(myHero, "item_mask_of_madness", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, 150) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) then
					if warCry and Ability.IsCastable(warCry, myMana) then
						Ability.CastNoTarget(warCry)
					end
					if godsStrength and Ability.IsCastable(godsStrength, myMana) then
						Ability.CastNoTarget(godsStrength)
						fooAllInOne.lastTick = os.clock()
					end
					if fooAllInOne.SleepReady(0.05) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					end
				end
				if not blink or (blink and not Ability.IsReady(blink)) then
					if stormHammer and Ability.IsCastable(stormHammer, myMana) and not (NPC.IsLinkensProtected(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
						Ability.CastTarget(stormHammer, enemy)
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				if fooAllInOne.SleepReady(0.1) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
				end
			end
		else
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
				if stormHammer and Ability.IsCastable(stormHammer, myMana) and not (NPC.IsLinkensProtected(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
					Ability.CastTarget(stormHammer, enemy)
					fooAllInOne.lastTick = os.clock()
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(stormHammer)) and warCry and Ability.IsCastable(warCry, myMana) then
					Ability.CastNoTarget(warCry)
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(stormHammer)) and godsStrength and Ability.IsCastable(godsStrength, myMana) then
					Ability.CastNoTarget(godsStrength)
					fooAllInOne.lastTick = os.clock()
				end
				if NPC.IsLinkensProtected(enemy) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
					end
				end
				if not (Ability.IsCastable(stormHammer, myMana) and Ability.IsCastable(warCry, myMana) and Ability.IsCastable(godsStrength, myMana)) then
					if fooAllInOne.SleepReady(0.3) and maskOfMadness and Ability.IsCastable(maskOfMadness, myMana) then
						Ability.CastNoTarget(maskOfMadness)
					end
				end
			end
		end
	end
end

function fooAllInOne.VisageCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroVisage) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end

	local graveChill = NPC.GetAbilityByIndex(myHero, 0)
	local soulAssumption = NPC.GetAbilityByIndex(myHero, 1)
	local soulMaxStacks = Ability.GetLevelSpecialValueFor(soulAssumption, "stack_limit")
	local myMana = NPC.GetMana(myHero)

	local soulModifier = NPC.GetModifier(myHero, "modifier_visage_soul_assumption")
	local soulStackCounter 
		if soulModifier then
			soulStackCounter = Modifier.GetStackCount(soulModifier)
		end
	
	local familiars = NPC.GetAbilityByIndex(myHero, 3)
	local familiarsLevel = Ability.GetLevel(familiars)

	for _, npc in ipairs(NPC.GetUnitsInRadius(myHero, 99999, Enum.TeamType.TEAM_FRIEND)) do
		if familiars then
			if npc and npc ~= myHero then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_visage_familiar" .. familiarsLevel then
						if not (NPC.HasModifier(npc, "modifier_visage_summonfamiliars_timer") or NPC.HasModifier(npc, "modifier_rooted")) then
							local stoneForm = NPC.GetAbilityByIndex(npc, 0)
							if (os.clock() - fooAllInOne.ControlledUnitCastTime) >= (Ability.GetLevelSpecialValueForFloat(stoneForm, "stun_duration") - 0.1 - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
								fooAllInOne.VisageFamiliarControl(myHero, enemy, npc, false, soulAssumption, soulMaxStacks, soulStackCounter, stoneForm, myMana)
							end
						end
					end
				end
			end
		end
	end

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)-50) then
			if fooAllInOne.SleepReady(0.2) then
				Player.AttackTarget(Players.GetLocal(), myHero, enemy)
				fooAllInOne.lastTick = os.clock()
			end
		else
			if graveChill and Ability.IsCastable(graveChill, myMana) then
				Ability.CastTarget(graveChill, enemy)
				fooAllInOne.lastTick = os.clock()
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(graveChill)) and soulAssumption and Ability.IsCastable(soulAssumption, myMana) then
				if soulMaxStacks <= soulStackCounter then
					Ability.CastTarget(soulAssumption, enemy)
				end
			end
			if not Ability.IsReady(graveChill) then
				if not Ability.IsReady(soulAssumption) or soulStackCounter < soulMaxStacks then
					if fooAllInOne.SleepReady(0.2) then
						Player.AttackTarget(Players.GetLocal(), myHero, enemy)
						fooAllInOne.lastTick = os.clock()
					end
				end
			end	
		end
	end
end

function fooAllInOne.VisageFamiliarControl(myHero, enemy, familiarEntity, attackIssued, soulAssumption, soulMaxStacks, soulStackCounter, stoneForm, myMana)

	local familiarDMGmod = NPC.GetModifier(familiarEntity, "modifier_visage_summon_familiars_damage_charge")
	local familiarDMGcharges 
		if familiarDMGmod then
			familiarDMGcharges  = Modifier.GetStackCount(familiarDMGmod)
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not attackIssued then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
			attackIssued = true
		end
		if attackIssued and NPC.IsEntityInRange(familiarEntity, enemy, 300) then
			if stoneForm and Ability.IsReady(stoneForm) then
				if familiarDMGcharges < Menu.GetValue(fooAllInOne.optionHeroVisageDMGStacks) then
					if not NPC.HasModifier(enemy, "modifier_rooted") or not NPC.HasModifier(enemy, "modifier_sheepstick_debuff") then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, enemy, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
						fooAllInOne.ControlledUnitCastTime = os.clock()
					end
				end
			end
		end
		if soulAssumption and Ability.IsCastable(soulAssumption, myMana) then
			if soulMaxStacks <= soulStackCounter then
				Ability.CastTarget(soulAssumption, enemy)
			end
		end
	end
end

function fooAllInOne.ArcWardenCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroArcWarden) then return end

	local flux = NPC.GetAbilityByIndex(myHero, 0)
	local magneticField = NPC.GetAbilityByIndex(myHero, 1)
	local sparkWraith = NPC.GetAbilityByIndex(myHero, 2)
	local tempestDouble = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)
	
	for i = 1, NPCs.Count() do
        local npc = NPCs.Get(i)
		if tempestDouble then
			if npc and npc ~= myHero then
				if NPC.GetUnitName(npc) == "npc_dota_hero_arc_warden" then
					if NPC.HasModifier(npc, "modifier_arc_warden_tempest_double") then
						if npc ~= nil then
							if Entity.IsAlive(npc) then
								fooAllInOne.TempestDoubleHandler(myHero, enemy, npc, tempestDouble, myMana)
							end
						end
					end
				end
			end
		end
	end

	local necronomicon = NPC.GetItem(myHero, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(myHero, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	fooAllInOne.itemUsage(myHero, enemy)
	
	if Menu.IsKeyDown(fooAllInOne.optionArcWardenTempestKey) then
		if tempestDouble and Ability.IsCastable(tempestDouble, myMana) then
			Ability.CastNoTarget(tempestDouble)
			return
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenTempest) then
		if Menu.IsKeyDown(fooAllInOne.optionArcWardenPushKey) then
			if fooAllInOne.ArcWardenPort(myHero) ~= nil then
				if tempestDouble and Ability.IsCastable(tempestDouble, myMana) then
					Ability.CastNoTarget(tempestDouble)
					return
				end
			end
		end
	end
	
	if enemy and NPC.IsEntityInRange(myHero, enemy, 1200) then
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
			if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
				if fooAllInOne.SleepReady(0.2) then
					if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, NPC.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
					end
					if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
					end
				end
			else
				if fooAllInOne.SleepReady(0.2) and NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.noItemCastFor(0.3)
					fooAllInOne.lastTick = os.clock()
				end
				if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
					
					if tempestDouble and Ability.IsCastable(tempestDouble, myMana) then
						Ability.CastNoTarget(tempestDouble)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
				
					if fooAllInOne.SleepReady(0.2) and flux and Ability.IsCastable(flux, myMana) and #NPC.GetHeroesInRadius(enemy, 225, Enum.TeamType.TEAM_FRIEND) < 1 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(flux, enemy)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
					
					if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenMagnetic) and fooAllInOne.SleepReady(0.2) and magneticField and Ability.IsCastable(magneticField, myMana) then
						Ability.CastPosition(magneticField, Entity.GetAbsOrigin(myHero))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
					if fooAllInOne.SleepReady(0.2) and sparkWraith and Ability.IsCastable(sparkWraith, myMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						local sparkPrediction = 2.3 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
						Ability.CastPosition(sparkWraith, fooAllInOne.castPrediction(myHero, enemy, sparkPrediction))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
					if necronomicon and Ability.IsCastable(necronomicon, myMana) then
						Ability.CastNoTarget(necronomicon)
					end
					if fooAllInOne.SleepReady(0.2) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
						fooAllInOne.lastTick = os.clock()
						return
					end
					for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, myHero)) do
						fooAllInOne.NecronomiconController(necro, enemy, nil)
					end
					if #fooAllInOne.GetIllusionEntityTable(myHero, myHero) > 0 then
						fooAllInOne.MantaIlluController(enemy, nil, myHero, myHero)
					end
				end
			end	
		end
	end	
end

function fooAllInOne.TempestDoubleHandler(myHero, enemy, tempestDoubleEntity, tempestDouble, myMana)
	
	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end
	if os.clock() - fooAllInOne.ControlledUnitPauseTime < 3.1 then return end

	if tempestDoubleEntity then
		fooAllInOne.ArcWardenEntity = tempestDoubleEntity
	end

	local travelBoots1 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots", true)
	local travelBoots2 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots_2", true)
	local wardenMana = NPC.GetMana(tempestDoubleEntity)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		if enemy and Entity.GetHealth(enemy) > 0 then
			fooAllInOne.ArcWardenFight(myHero, enemy, tempestDoubleEntity)
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionArcWardenTempestKey) then
		fooAllInOne.ArcWardenDoubleCombo(myHero, tempestDoubleEntity, enemy)
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenTempest) then
		if Menu.IsKeyDown(fooAllInOne.optionArcWardenPushKey) then
			if fooAllInOne.ArcWardenPort(myHero) ~= nil then
			--	if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPStyle) == 1 then
					if travelBoots1 and Ability.IsCastable(travelBoots1, wardenMana) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.ArcWardenPort(myHero), travelBoots1, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
						fooAllInOne.ControlledUnitPauseTime = os.clock()
						return
					end
					if travelBoots2 and Ability.IsCastable(travelBoots2, wardenMana) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.ArcWardenPort(myHero), travelBoots2, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
						fooAllInOne.ControlledUnitPauseTime = os.clock()
						return
					end
			--	end
			--	if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPStyle) == 0 then
			--		if travelBoots1 and Ability.IsCastable(travelBoots1, wardenMana) then
			--			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.ArcWardenPort(myHero), travelBoots1, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			--		end
			--		if travelBoots2 and Ability.IsCastable(travelBoots2, wardenMana) then
			--			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.ArcWardenPort(myHero), travelBoots2, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			--		end
			--	end
			end
		end
	end
			
	if not Menu.IsKeyDown(fooAllInOne.optionArcWardenTempestKey) then
		if not NPC.HasModifier(tempestDoubleEntity ,"modifier_teleporting") then
			if NPC.HasItem(myHero, "item_travel_boots", true) or NPC.HasItem(myHero, "item_travel_boots_2", true) then
				if not ((travelBoots1 and Ability.IsReady(travelBoots1)) or (travelBoots2 and Ability.IsReady(travelBoots2))) then
					fooAllInOne.ArcWardenTPPush(myHero, tempestDoubleEntity)
				end
			end
		end
	end

	if not NPC.HasModifier(tempestDoubleEntity ,"modifier_teleporting") then
		if not Menu.IsKeyDown(fooAllInOne.optionArcWardenPushKey) then
			fooAllInOne.utilityItemMidas(tempestDoubleEntity, NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true), 40)
		end
	end
end	

function fooAllInOne.ArcWardenFight(myHero, enemy, tempestDoubleEntity)

	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end

	local flux = NPC.GetAbilityByIndex(tempestDoubleEntity, 0)
	local magneticField = NPC.GetAbilityByIndex(tempestDoubleEntity, 1)
	local sparkWraith = NPC.GetAbilityByIndex(tempestDoubleEntity, 2)

	local blink = NPC.GetItem(tempestDoubleEntity, "item_blink", true)
	local silverEdge = NPC.GetItem(tempestDoubleEntity, "item_silver_edge", true)
	local bkb = NPC.GetItem(tempestDoubleEntity, "item_black_king_bar", true)

	local diffusalBlade = NPC.GetItem(tempestDoubleEntity, "item_diffusal_blade", true)
	if not diffusalBlade then
		for i = 2, 2 do
			diffusalBlade = NPC.GetItem(myHero, "item_diffusal_blade_" .. i, true)
			if diffusalBlade then 
				break 
			end
		end
	end

	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end	 

	local wardenMana = NPC.GetMana(tempestDoubleEntity)

	if silverEdge and Ability.IsCastable(silverEdge, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), silverEdge, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "silverEdge", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
		fooAllInOne.noItemCastFor(0.5)
	end

	fooAllInOne.itemUsage(tempestDoubleEntity, enemy)

	if not NPC.IsEntityInRange(tempestDoubleEntity, enemy, NPC.GetAttackRange(tempestDoubleEntity)-20) then
		if blink and Ability.IsReady(blink) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(250)), blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "blink", "DOTA_UNIT_ORDER_CAST_POSITION")
		end
		if not blink or (blink and not Ability.IsReady(blink)) then
			fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, NPC.GetAbsOrigin(enemy), tempestDoubleEntity)
		end
	else
		
		if NPC.HasModifier(tempestDoubleEntity, "modifier_item_silver_edge_windwalk") then
			fooAllInOne.noItemCastFor(0.3)
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			return
		end
			
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and diffusalBlade and Ability.IsReady(diffusalBlade) and Item.GetCurrentCharges(diffusalBlade) >= 1 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, enemy, Vector(0,0,0), diffusalBlade, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "diffusalBlade", "DOTA_UNIT_ORDER_CAST_TARGET")
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and necronomicon and Ability.IsCastable(necronomicon, wardenMana) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), necronomicon, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "necrobook", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and bkb and Ability.IsReady(bkb) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), bkb, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "bkb", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
		end		
	
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(flux) and flux and Ability.IsCastable(flux, wardenMana) and #NPC.GetHeroesInRadius(enemy, 225, Enum.TeamType.TEAM_FRIEND) < 1 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, enemy, Vector(0,0,0), flux, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "flux", "DOTA_UNIT_ORDER_CAST_TARGET")
			return
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(magneticField) and magneticField and Ability.IsCastable(magneticField, wardenMana) and not NPC.HasModifier(tempestDoubleEntity, "modifier_arc_warden_magnetic_field") and not Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(myHero, 1)) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(tempestDoubleEntity) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(tempestDoubleEntity)):Normalized():Scaled(50), magneticField, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
			return
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(sparkWraith) and sparkWraith and Ability.IsCastable(sparkWraith, wardenMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			local sparkPrediction = 2.3 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.castPrediction(tempestDoubleEntity, enemy, sparkPrediction), sparkWraith, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "sparkWraith", "DOTA_UNIT_ORDER_CAST_POSITION")
			return
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > 0.5 then
			fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, tempestDoubleEntity)
		end

		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, enemy, nil)
		end

		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(enemy, nil, myHero, tempestDoubleEntity)
		end
	end
end
	
function fooAllInOne.ArcWardenPort(myHero)

	if not Menu.IsEnabled(fooAllInOne.optionHeroArcWardenPush) then return end

	local enemyFountainPos = fooAllInOne.GetEnemyFountainPos(myHero)
	local myFountainPos = fooAllInOne.GetMyFountainPos(myHero)

	if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPStyle) == 1 then
		return Input.GetWorldCursorPos()
	end

	if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPStyle) == 0 then
		local targetCreep
		local pushDistance = 99999
		if NPC.HasItem(myHero, "item_travel_boots", true) or NPC.HasItem(myHero, "item_travel_boots_2", true) then
			for i = 1, NPCs.Count() do 
			local npc = NPCs.Get(i)
    				if Entity.IsSameTeam(myHero, npc) and NPC.IsLaneCreep(npc) and NPC.IsRanged(npc) and not NPC.IsDormant(npc) then
					if #NPC.GetUnitsInRadius(npc, 1200, Enum.TeamType.TEAM_ENEMY) >= 3 and #NPC.GetHeroesInRadius(npc, 900, Enum.TeamType.TEAM_ENEMY) <= 1  and #NPC.GetHeroesInRadius(npc, 1000, Enum.TeamType.TEAM_FRIEND) <= 1 then
						if (Entity.GetHealth(npc) / Entity.GetMaxHealth(npc)) >= 0.8 and #NPC.GetUnitsInRadius(npc, 500, Enum.TeamType.TEAM_FRIEND) >= 2 then	
							if npc ~= nil then
								if (Entity.GetAbsOrigin(npc) - Entity.GetAbsOrigin(myHero)):Length2D() > 3000 then
									if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPSelect) == 0 then
										if (Entity.GetAbsOrigin(npc) - enemyFountainPos):Length2D() < pushDistance then
											targetCreep = npc
											pushDistance = (Entity.GetAbsOrigin(npc) - enemyFountainPos):Length2D()
											break
										end
									end
									if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPSelect) == 1 then
										if (Entity.GetAbsOrigin(npc) - myFountainPos):Length2D() < pushDistance then
											targetCreep = npc
											pushDistance = (Entity.GetAbsOrigin(npc) - myFountainPos):Length2D()
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end

		if targetCreep == nil then
			pushDistance = 99999
		end

		if targetCreep ~= nil then
			return Entity.GetAbsOrigin(targetCreep)
		end
	end
end

function fooAllInOne.ArcWardenDoubleCombo(myHero, tempestDoubleEntity, enemy)

	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end

	local wardenMana = NPC.GetMana(tempestDoubleEntity)

	fooAllInOne.utilityItemMidas(tempestDoubleEntity, NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true), 40)

	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and necronomicon and Ability.IsCastable(necronomicon, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), necronomicon, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.ControlledUnitCastTime = os.clock()
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "necronomicon", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
	end

	local targetHero
	local enemyHeroHealth = 99999
	local targetCreep
	local enemyCreepHealth = 99999

	if enemy and NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 200, 0) then
		targetHero = enemy
	else targetHero = nil
	end
	if not targetHero then
		for i, heroes in ipairs(NPC.GetHeroesInRadius(tempestDoubleEntity, 1499, Enum.TeamType.TEAM_ENEMY)) do
			if heroes then
        			if Entity.IsAlive(heroes) and not Entity.IsDormant(heroes) and not NPC.IsIllusion(heroes) then
					if NPC.IsPositionInRange(heroes, Input.GetWorldCursorPos(), 200, 0) then
						targetHero = heroes
						enemyHeroHealth = 99999
					else
						if Entity.GetHealth(heroes) < enemyHeroHealth then
							targetHero = heroes
							enemyHeroHealth = Entity.GetHealth(heroes)
						end
					end
				end
			end
		end
		if #NPC.GetHeroesInRadius(tempestDoubleEntity, 1499, Enum.TeamType.TEAM_ENEMY) < 1 then
			for i = 1, NPCs.Count() do 
			local creeps = NPCs.Get(i)
				if not Entity.IsSameTeam(myHero, creeps) then
					if NPC.IsEntityInRange(tempestDoubleEntity, creeps, 1499) then
						if Entity.IsAlive(creeps) and not Entity.IsDormant(creeps) and NPC.IsKillable(creeps) and not NPC.IsWaitingToSpawn(creeps) then
							if Entity.GetHealth(creeps) < enemyCreepHealth then
								if creeps ~= nil then
									targetCreep = creeps
									enemyCreepHealth = Entity.GetHealth(creeps)
								end
							end
						end
					end
				end
			end
		end
	end

	if #NPC.GetUnitsInRadius(tempestDoubleEntity, 1500, Enum.TeamType.TEAM_ENEMY) < 1 then
		targetHero = nil
		enemyHeroHealth = 99999
		targetCreep = nil
		enemyCreepHealth = 99999
	end

	if targetHero then
		targetCreep = nil
		enemyCreepHealth = 99999
	end
	
	if targetHero then
		fooAllInOne.ArcWardenFight(myHero, targetHero, tempestDoubleEntity)
		fooAllInOne.itemUsageSmartOrder(tempestDoubleEntity, targetHero, true)
	end

	if targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", targetCreep, nil, tempestDoubleEntity)

		if #NPC.GetUnitsInRadius(tempestDoubleEntity, 600, Enum.TeamType.TEAM_ENEMY) > 3 then
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 1)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 1) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 1), wardenMana) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(tempestDoubleEntity), NPC.GetAbilityByIndex(tempestDoubleEntity, 1), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 2)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 2) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 2), wardenMana) and not NPC.IsStructure(targetCreep) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(targetCreep), NPC.GetAbilityByIndex(tempestDoubleEntity, 2), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
		end
		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end
		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end		
	end

	if not targetHero and not targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), tempestDoubleEntity)

		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end

		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end
	end	
end

function fooAllInOne.ArcWardenTPPush(myHero, tempestDoubleEntity)
	
	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end
	if (NPC.GetAbsOrigin(myHero) - NPC.GetAbsOrigin(tempestDoubleEntity)):Length2D() < 500 then return end

	local wardenMana = NPC.GetMana(tempestDoubleEntity)
	local mantaStyle = NPC.GetItem(tempestDoubleEntity, "item_manta", true)

	fooAllInOne.utilityItemMidas(tempestDoubleEntity, NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true), 40)

	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and necronomicon and Ability.IsCastable(necronomicon, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), necronomicon, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.ControlledUnitCastTime = os.clock()
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "necronomicon", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
	end
	if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and mantaStyle and Ability.IsCastable(mantaStyle, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), mantaStyle, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.ControlledUnitCastTime = os.clock()
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "mantaStyle", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
	end

	local targetHero
	local enemyHeroHealth = 99999
	local targetCreep
	local enemyCreepHealth = 99999
	for i, heroes in ipairs(NPC.GetHeroesInRadius(tempestDoubleEntity, 799, Enum.TeamType.TEAM_ENEMY)) do
		if heroes then
        		if Entity.IsAlive(heroes) and not Entity.IsDormant(heroes) and not NPC.HasState(heroes, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsIllusion(heroes) then
				if Entity.GetHealth(heroes) < enemyHeroHealth then
					targetHero = heroes
					enemyHeroHealth = Entity.GetHealth(heroes)
				end
			end
		end
	end
	if #NPC.GetHeroesInRadius(tempestDoubleEntity, 799, Enum.TeamType.TEAM_ENEMY) < 1 then
		for i = 1, NPCs.Count() do 
		local creeps = NPCs.Get(i)
			if not Entity.IsSameTeam(myHero, creeps) then
				if NPC.IsEntityInRange(tempestDoubleEntity, creeps, 799) then
					if Entity.IsAlive(creeps) and not Entity.IsDormant(creeps) and NPC.IsKillable(creeps) and not NPC.IsWaitingToSpawn(creeps) then
						if Entity.GetHealth(creeps) < enemyCreepHealth then
							if creeps ~= nil then
								targetCreep = creeps
								enemyCreepHealth = Entity.GetHealth(creeps)
							end
						end
					end
				end
			end
		end
	end
	
	if #NPC.GetUnitsInRadius(tempestDoubleEntity, 800, Enum.TeamType.TEAM_ENEMY) < 1 then
		targetHero = nil
		enemyHeroHealth = 99999
		targetCreep = nil
		enemyCreepHealth = 99999
	end
	
	if targetHero then
		fooAllInOne.ArcWardenFight(myHero, targetHero, tempestDoubleEntity)
		fooAllInOne.itemUsageSmartOrder(tempestDoubleEntity, targetHero, true)
	end

	if targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", targetCreep, nil, tempestDoubleEntity)

		if #NPC.GetUnitsInRadius(tempestDoubleEntity, 600, Enum.TeamType.TEAM_ENEMY) > 3 then
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 1)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 1) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 1), wardenMana) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(tempestDoubleEntity), NPC.GetAbilityByIndex(tempestDoubleEntity, 1), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 2)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 2) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 2), wardenMana) and not NPC.IsStructure(targetCreep) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(targetCreep), NPC.GetAbilityByIndex(tempestDoubleEntity, 2), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
		end
		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end
		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end		
	end

	if not targetHero and not targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), tempestDoubleEntity)

		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end

		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end
	end
end

function fooAllInOne.drawArcWardenIndicators(tempestDoubleEntity)

	if not Menu.IsEnabled(fooAllInOne.optionHeroArcWardenDraw) then return end
	if not tempestDoubleEntity then return end

	local travelBoots1 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots", true)
	local travelBoots2 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots_2", true)
	local midas = NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true)
	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	local tempTable = {}
	if travelBoots1 then
		table.insert(tempTable, travelBoots1)
	end
	if travelBoots2 then
		table.insert(tempTable, travelBoots2)
	end
	if midas then
		table.insert(tempTable, midas)
	end
	if necronomicon then
		table.insert(tempTable, necronomicon)
	end

	local w, h = Renderer.GetScreenSize()
	for i, item in ipairs(tempTable) do 
		fooAllInOne.drawArcWardenCooldowns(item, w, h, i-1)
	end

end

function fooAllInOne.drawArcWardenCooldowns(item, w, h, index)

	if item then
		if math.floor(Ability.GetCooldownTimeLeft(item)) > 0 then
			Renderer.SetDrawColor(255, 0, 0)
			Renderer.DrawText(fooAllInOne.font, (w-300) + Menu.GetValue(fooAllInOne.optionHeroArcWardenXPos), 300 + Menu.GetValue(fooAllInOne.optionHeroArcWardenYPos) + (index*25) + 5, Ability.GetName(item).." - "..math.floor(Ability.GetCooldownTimeLeft(item)), 1)
		else
			Renderer.SetDrawColor(0, 255, 0)
			Renderer.DrawText(fooAllInOne.font, (w-300) + Menu.GetValue(fooAllInOne.optionHeroArcWardenXPos), 300 + Menu.GetValue(fooAllInOne.optionHeroArcWardenYPos) + (index*25) + 5, Ability.GetName(item).." - "..math.floor(Ability.GetCooldownTimeLeft(item)), 1)
		end	
	end

end
		
function fooAllInOne.MorphCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroMorphling) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end

	local waveForm = NPC.GetAbilityByIndex(myHero, 0)
	local adaptiveStrike = NPC.GetAbilityByIndex(myHero, 1)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local maxDMG
	local maxDMGwoWave
	for k, v in ipairs(fooAllInOne.GetMorphShotgunDMG(myHero, myMana, enemy)) do
		maxDMG = v[1]
		maxDMGwoWave = v[2]
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 800) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(300)))
			end
			if fooAllInOne.SleepReady(0.1) and not blink or (blink and not Ability.IsReady(blink)) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, NPC.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.lastTick = os.clock()
			end	
		else
			if NPC.HasItem(myHero, "item_ethereal_blade", true) then
				if NPC.HasModifier(enemy, "modifier_item_ethereal_blade_ethereal") then
					if Entity.GetHealth(enemy) < maxDMGwoWave then
						if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
							Ability.CastTarget(adaptiveStrike, enemy)
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
					if Entity.GetHealth(enemy) >= maxDMGwoWave then
						if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
							Ability.CastTarget(adaptiveStrike, enemy)
							fooAllInOne.lastTick = os.clock()
						end
						if fooAllInOne.SleepReady(0.4) and waveForm and Ability.IsCastable(waveForm, myMana) and not Ability.IsReady(adaptiveStrike) then
						Ability.CastPosition(waveForm, Entity.GetAbsOrigin(enemy))
						end
					end
				end
			else
				if Entity.GetHealth(enemy) < maxDMGwoWave then
					if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
						Ability.CastTarget(adaptiveStrike, enemy)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
				if Entity.GetHealth(enemy) >= maxDMGwoWave then
					if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
						Ability.CastTarget(adaptiveStrike, enemy)
						fooAllInOne.lastTick = os.clock()
					end
					if fooAllInOne.SleepReady(0.4) and waveForm and Ability.IsCastable(waveForm, myMana) and not Ability.IsReady(adaptiveStrike) then
						Ability.CastPosition(waveForm, Entity.GetAbsOrigin(enemy))
					end
				end
			end
		end
	end
end

function fooAllInOne.GetMorphShotgunDMG(myHero, myMana, enemy)

	if not myHero then return end
	if not NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then return end

	local waveForm = NPC.GetAbilityByIndex(myHero, 0)
	local adaptiveStrike = NPC.GetAbilityByIndex(myHero, 1)

	local waveFormLevel
	if waveForm then
		waveFormLevel = Ability.GetLevel(waveForm)
	end
	local waveFormDMG
	if waveForm and Ability.IsCastable(waveForm, myMana) then
		waveFormDMG = 100 + 75 * (waveFormLevel - 1)
	elseif not waveForm or (waveForm and not Ability.IsCastable(waveForm, myMana)) then
		waveFormDMG = 0
	end

	local adaptiveStrikeLevel
	if adaptiveStrike then
		adaptiveStrikeLevel = Ability.GetLevel(adaptiveStrike)
	end
	local adaptiveStrikeDMG
	if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
		local basicDamage = 100
		local myAgility = Hero.GetAgilityTotal(myHero)
		local myStrength = Hero.GetStrengthTotal(myHero)
		local minMultiplier = 0.25
		local maxMultiplier = 0.5 + 0.5 * (adaptiveStrikeLevel - 1)

		local ratio = myAgility / myStrength
		local minRatio = 2/3
		local maxRatio = 3/2
		local multiplier = minMultiplier+(maxMultiplier-minMultiplier)*(ratio-minRatio)/(maxRatio-minRatio)
		multiplier = multiplier > maxMultiplier and maxMultiplier or multiplier
		multiplier = multiplier < minMultiplier and minMultiplier or multiplier

		adaptiveStrikeDMG = basicDamage + myAgility * multiplier
	elseif not adaptiveStrike or (adaptiveStrike and not Ability.IsCastable(adaptiveStrike, myMana)) then
		adaptiveStrikeDMG = 0
	end
	
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local eBladeDMG
	if eBlade and Ability.IsCastable(eBlade, myMana) then
		local myAgility = Hero.GetAgilityTotal(myHero)
		eBladeDMG = (2 * myAgility + 75)
	elseif not eBlade or (eBlade and not Ability.IsCastable(eBlade, myMana)) then
		eBladeDMG = 0
	end

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)

	local overAllDMG = waveFormDMG + adaptiveStrikeDMG + eBladeDMG
	if veil and Ability.IsCastable(veil, myMana) then
		overAllDMG = overAllDMG * 1.25
	end
	if eBlade and Ability.IsCastable(eBlade, myMana) then
		overAllDMG = overAllDMG * 1.4
	end

	local overAllDMGwoWave = adaptiveStrikeDMG + eBladeDMG
	if veil and Ability.IsCastable(veil, myMana) then
		overAllDMGwoWave = overAllDMGwoWave * 1.25
	end
	if eBlade and Ability.IsCastable(eBlade, myMana) then
		overAllDMGwoWave = overAllDMGwoWave * 1.4
	end
	
	local trueOverallDMG = math.floor((1 - NPC.GetMagicalArmorValue(enemy)) * overAllDMG + overAllDMG * (Hero.GetIntellectTotal(myHero) / 14 / 100))
	local trueOverallDMGwoWave = math.floor((1 - NPC.GetMagicalArmorValue(enemy)) * overAllDMGwoWave + overAllDMGwoWave * (Hero.GetIntellectTotal(myHero) / 14 / 100))
	return { {trueOverallDMG, trueOverallDMGwoWave} }
end		

function fooAllInOne.drawMorphlingKillIndicator(myHero)
	
	if not NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then return end
	
	if imageHandle == nil then
		imageHandle = Renderer.LoadImage(fooAllInOne.IconPath .. "15401" .. ".png")
	end

	local myMana = NPC.GetMana(myHero)
	
	
	for _, heroes in ipairs(NPC.GetHeroesInRadius(myHero, 1200, Enum.TeamType.TEAM_ENEMY)) do
		if not heroes then return end
		local pos = Entity.GetAbsOrigin(heroes)

       		local x, y, vis = Renderer.WorldToScreen(pos)
			if not vis then return end
	
		if NPC.IsHero(heroes) and not NPC.IsIllusion(heroes) and not NPC.IsDormant(heroes) and Entity.GetHealth(heroes) > 0 and not NPC.HasState(heroes, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			for k, v in ipairs(fooAllInOne.GetMorphShotgunDMG(myHero, myMana, heroes)) do
				if Entity.GetHealth(heroes) <= v[1] - 35 then
					Renderer.SetDrawColor(255, 255, 255, 255)
					Renderer.DrawImage(imageHandle, x, y, 25, 25)
				end
			end
		end
	end  
end

function fooAllInOne.invokerInvokeAbility(myHero, ability)
	if not ability then return end

	local skillName = Ability.GetName(ability)
    		if not skillName then return end

	local invokeOrder = fooAllInOne.invokerInvokeOrder[skillName]
    		if not invokeOrder then return end

	local invoke = NPC.GetAbility(myHero, "invoker_invoke")
		if not invoke then return end

	for i, v in ipairs(invokeOrder) do
        	local orb = NPC.GetAbilityByIndex(myHero, v)

        	if orb then
			Ability.CastNoTarget(orb)
		end
	end

	Ability.CastNoTarget(invoke)

end
				

-- killsteal functions
function fooAllInOne.AutoNukeKillSteal(myHero)

	local myMana = NPC.GetMana(myHero)

	for _, stealEnemyEntity in ipairs(NPC.GetHeroesInRadius(myHero, 1200, Enum.TeamType.TEAM_ENEMY)) do
		if not stealEnemyEntity then return end

	stealEnemy = fooAllInOne.targetChecker(stealEnemyEntity)
		if not stealEnemy then return end
		if NPC.HasState(stealEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or NPC.IsChannellingAbility(myHero) or NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return end

		for n, v in ipairs(fooAllInOne.AbilityList) do
			local heroName = v[1]
	      		local skillName = v[2]
			local skillType = v[3]
			local targetMode = v[4]
			local specialAttribute = v[5]
		
			
			if NPC.GetUnitName(myHero) == heroName then
				if skillType == "nuke" and not Ability.IsUltimate(NPC.GetAbility(myHero, skillName)) then
					if Entity.GetHealth(stealEnemy) > 0 then
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) then
							local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0)
							if  skillDamage < 1 then
								skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute)
							end
							if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*skillDamage then
								if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
									if targetMode == "target" and not NPC.IsLinkensProtected(enemy) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
									if targetMode == "position" then
										Ability.CastPosition(NPC.GetAbility(myHero, skillName), Entity.GetAbsOrigin(stealEnemy))
										return
									end
									if targetMode == "no target" then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
									if targetMode == "skillshot" then
										if skillName == "windrunner_powershot" then
											local powershotPrediction = 1 + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 3000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, powershotPrediction))
											return
										end
										if skillName == "kunkka_torrent" then
											local kunkkaPrediction = 2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, kunkkaPrediction))
											return
										end
										if skillName == "lina_dragon_slave" then
											local dragonSlavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1200) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, dragonSlavePrediction))
											return
										end
										if skillName == "magnataur_shockwave" then
											local shockwavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1050) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, shockwavePrediction))
											return
										end
									--	if skillName == "morphling_waveform" then
									--		local wavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1250) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
									--		Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, wavePrediction))
									--		return
									--	end
										if skillName == "pugna_nether_blast" then
											local blastPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + 0.9 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, blastPrediction))
											return
										end
										if skillName == "rattletrap_rocket_flare" then
											local flairPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1750) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, flairPrediction))
											return
										end
										if skillName == "tusk_ice_shards" then
											local shardsPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, shardsPrediction))
											return
										end
										if skillName == "vengefulspirit_wave_of_terror" then
											local wavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 2000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, wavePrediction))
											return
										end
										if skillName == "zuus_lightning_bolt" then
											local boltPrediction = 0.4 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, boltPrediction))
											return
										end
									end
								end
							end	
						end
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) and targetMode == "special" then
							if skillName == "nyx_assassin_mana_burn" then
								local skillDamage = Ability.GetLevelSpecialValueForFloat(NPC.GetAbility(myHero, skillName), "float_multiplier") * Hero.GetIntellectTotal(stealEnemy) * (1 + Hero.GetIntellectTotal(myHero) / 16 / 100)
								if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*skillDamage and NPC.GetMana(stealEnemy) >= Entity.GetHealth(stealEnemy) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
								end
							end
						end
						if skillName == "queenofpain_scream_of_pain" then
							if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), "area_of_effect")) and targetMode == "special" then
								if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
								end
							end
						end	
					end
				end
			end
		end
	end
end

function fooAllInOne.AutoSunstrikeKillSteal(myHero)	

	if (os.clock() - fooAllInOne.lastTick) < fooAllInOne.delay then return end
	local myMana = NPC.GetMana(myHero)

	local exort = NPC.GetAbility(myHero, "invoker_exort")
	local invoke = NPC.GetAbility(myHero, "invoker_invoke")
	local agahnims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
	local sunStrikeDMG = 37.5 + (62.5 * Ability.GetLevel(exort))
		if agahnims then
			sunStrikeDMG = 37.5 + (62.5 * (Ability.GetLevel(exort) + 1))
		end
	
	local sunStrikeInSlot = false
		if Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_sun_strike" then
			sunStrikeInSlot = true
		elseif Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) == "invoker_sun_strike" then
			sunStrikeInSlot = true
		end

	for _, stealEnemyEntity in ipairs(NPC.GetHeroesInRadius(myHero, 99999, Enum.TeamType.TEAM_ENEMY)) do
		if not stealEnemyEntity then return end

	sunStrikeEnemy = fooAllInOne.targetChecker(stealEnemyEntity)
		if not sunStrikeEnemy then return end
		if NPC.IsChannellingAbility(myHero) or NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return end	
	
	local bestTarget
	local maxAgi = 0

	if Entity.GetHealth(sunStrikeEnemy) <= sunStrikeDMG and Hero.GetAgilityTotal(sunStrikeEnemy) > maxAgi then
	          bestTarget = sunStrikeEnemy
	        maxAgi = Hero.GetAgilityTotal(sunStrikeEnemy)
	end

	if Entity.GetHealth(sunStrikeEnemy) > sunStrikeDMG then
		bestTarget = nil
		maxAgi = 0
	end

		if bestTarget and sunStrike then
			if NPC.IsRunning(bestTarget) then
				if fooAllInOne.isEnemyTurning(bestTarget) == false then
					if Ability.IsReady(sunStrike) and Ability.IsCastable(sunStrike, myMana) then
						if not sunStrikeInSlot then
							if Menu.IsEnabled(fooAllInOne.optionKillStealAutoInvoke) then
								if invoke and Ability.IsCastable(invoke, myMana) then
									Ability.CastNoTarget(exort)
									Ability.CastNoTarget(exort)
									Ability.CastNoTarget(exort)
									Ability.CastNoTarget(invoke)
									fooAllInOne.makeDelay(0.05)
									return
								end
							end
						else
							local enemyRotation = Entity.GetRotation(bestTarget):GetVectors()
								enemyRotation:SetZ(0)
    							local enemyOrigin = NPC.GetAbsOrigin(bestTarget)
								enemyOrigin:SetZ(0)
							if enemyRotation and enemyOrigin then
								Ability.CastPosition(sunStrike, enemyOrigin:__add(enemyRotation:Normalized():Scaled(fooAllInOne.GetMoveSpeed(bestTarget) * (1.8 + 0.05 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)))))
							end
						end
					end
				end
			end
		end
	end
end

function fooAllInOne.Debugger(time, npc, ability, order)

	if not Menu.IsEnabled(fooAllInOne.optionDebugEnable) then return end
	Log.Write(tostring(time) .. " " .. tostring(NPC.GetUnitName(npc)) .. " " .. tostring(ability) .. " " .. tostring(order))

end

return fooAllInOne
