local AP = {}
AP.IsEnabled = Menu.AddOption({ "Utility", "Auto Pick" }, "Enabled", "You'll be the first who choose this hero.")
AP.Hero = Menu.AddOption({ "Utility", "Auto Pick" }, "Hero", "", 0, 113, 1)
AP.Code = nil
AP.Prev = nil
Menu.SetValueName(AP.Hero, 0, "Previous")

AP.Heroes = {}
AP.Heroes[1] = { ["name"] = "Abaddon", ["code"] = "npc_dota_hero_abaddon" }
AP.Heroes[2] = { ["name"] = "Alchemist", ["code"] = "npc_dota_hero_alchemist" }
AP.Heroes[3] = { ["name"] = "Anti-Mage", ["code"] = "npc_dota_hero_antimage" }
AP.Heroes[4] = { ["name"] = "Ancient Apparition", ["code"] = "npc_dota_hero_ancient_apparition" }
AP.Heroes[5] = { ["name"] = "Arc Warden", ["code"] = "npc_dota_hero_arcwarden" }
AP.Heroes[6] = { ["name"] = "Axe", ["code"] = "npc_dota_hero_axe" }
AP.Heroes[7] = { ["name"] = "Bane", ["code"] = "npc_dota_hero_bane" }
AP.Heroes[8] = { ["name"] = "Batrider", ["code"] = "npc_dota_hero_batrider" }
AP.Heroes[9] = { ["name"] = "Beastmaster", ["code"] = "npc_dota_hero_beastmaster" }
AP.Heroes[10] = { ["name"] = "Bloodseeker", ["code"] = "npc_dota_hero_bloodseeker" }
AP.Heroes[11] = { ["name"] = "Bounty Hunter", ["code"] = "npc_dota_hero_bounty_hunter" }
AP.Heroes[12] = { ["name"] = "Brewmaster", ["code"] = "npc_dota_hero_brewmaster" }
AP.Heroes[13] = { ["name"] = "Bristleback", ["code"] = "npc_dota_hero_bristleback" }
AP.Heroes[14] = { ["name"] = "Broodmother", ["code"] = "npc_dota_hero_broodmother" }
AP.Heroes[15] = { ["name"] = "Centaur Warrunner", ["code"] = "npc_dota_hero_centaur" }
AP.Heroes[16] = { ["name"] = "Chaos Knight", ["code"] = "npc_dota_hero_chaos_knight" }
AP.Heroes[17] = { ["name"] = "Chen", ["code"] = "npc_dota_hero_chen" }
AP.Heroes[18] = { ["name"] = "Clinkz", ["code"] = "npc_dota_hero_clinkz" }
AP.Heroes[19] = { ["name"] = "Clockwerk", ["code"] = "npc_dota_hero_rattletrap" }
AP.Heroes[20] = { ["name"] = "Crystal Maiden", ["code"] = "npc_dota_hero_crystal_maiden" }
AP.Heroes[21] = { ["name"] = "Dark Seer", ["code"] = "npc_dota_hero_dark_seer" }
AP.Heroes[22] = { ["name"] = "Dazzle", ["code"] = "npc_dota_hero_dazzle" }
AP.Heroes[23] = { ["name"] = "Death Prophet", ["code"] = "npc_dota_hero_death_prophet" }
AP.Heroes[24] = { ["name"] = "Disruptor", ["code"] = "npc_dota_hero_disruptor" }
AP.Heroes[25] = { ["name"] = "Doom", ["code"] = "npc_dota_hero_doom_bringer" }
AP.Heroes[26] = { ["name"] = "Dragon Knight", ["code"] = "npc_dota_hero_dragon_knight" }
AP.Heroes[27] = { ["name"] = "Drow Ranger", ["code"] = "npc_dota_hero_drow_ranger" }
AP.Heroes[28] = { ["name"] = "Earth Spirit", ["code"] = "npc_dota_hero_earth_spirit" }
AP.Heroes[29] = { ["name"] = "Earthshaker", ["code"] = "npc_dota_hero_earthshaker" }
AP.Heroes[30] = { ["name"] = "Elder Titan", ["code"] = "npc_dota_hero_elder_titan" }
AP.Heroes[31] = { ["name"] = "Ember Spirit", ["code"] = "npc_dota_hero_ember_spirit" }
AP.Heroes[32] = { ["name"] = "Enchantress", ["code"] = "npc_dota_hero_enchantress" }
AP.Heroes[33] = { ["name"] = "Enigma", ["code"] = "npc_dota_hero_enigma" }
AP.Heroes[34] = { ["name"] = "Faceless Void", ["code"] = "npc_dota_hero_faceless_void" }
AP.Heroes[35] = { ["name"] = "Gyrocopter", ["code"] = "npc_dota_hero_gyrocopter" }
AP.Heroes[36] = { ["name"] = "Huskar", ["code"] = "npc_dota_hero_huskar" }
AP.Heroes[37] = { ["name"] = "Invoker", ["code"] = "npc_dota_hero_invoker" }
AP.Heroes[38] = { ["name"] = "Io", ["code"] = "npc_dota_hero_wisp" }
AP.Heroes[39] = { ["name"] = "Jakiro", ["code"] = "npc_dota_hero_jakiro" }
AP.Heroes[40] = { ["name"] = "Juggernaut", ["code"] = "npc_dota_hero_juggernaut" }
AP.Heroes[41] = { ["name"] = "Keeper of the Light", ["code"] = "npc_dota_hero_keeper_of_the_light" }
AP.Heroes[42] = { ["name"] = "Kunkka", ["code"] = "npc_dota_hero_kunkka" }
AP.Heroes[43] = { ["name"] = "Legion Commander", ["code"] = "npc_dota_hero_legion_commander" }
AP.Heroes[44] = { ["name"] = "Leshrac", ["code"] = "npc_dota_hero_leshrac" }
AP.Heroes[45] = { ["name"] = "Lich", ["code"] = "npc_dota_hero_lich" }
AP.Heroes[46] = { ["name"] = "Lifestealer", ["code"] = "npc_dota_hero_life_stealer" }
AP.Heroes[47] = { ["name"] = "Lina", ["code"] = "npc_dota_hero_lina" }
AP.Heroes[48] = { ["name"] = "Lion", ["code"] = "npc_dota_hero_lion" }
AP.Heroes[49] = { ["name"] = "Lone Druid", ["code"] = "npc_dota_hero_lone_druid" }
AP.Heroes[50] = { ["name"] = "Luna", ["code"] = "npc_dota_hero_luna" }
AP.Heroes[51] = { ["name"] = "Lycan", ["code"] = "npc_dota_hero_lycan" }
AP.Heroes[52] = { ["name"] = "Magnus", ["code"] = "npc_dota_hero_magnataur" }
AP.Heroes[53] = { ["name"] = "Medusa", ["code"] = "npc_dota_hero_medusa" }
AP.Heroes[54] = { ["name"] = "Meepo", ["code"] = "npc_dota_hero_meepo" }
AP.Heroes[55] = { ["name"] = "Mirana", ["code"] = "npc_dota_hero_mirana" }
AP.Heroes[56] = { ["name"] = "Morphling", ["code"] = "npc_dota_hero_morphling" }
AP.Heroes[57] = { ["name"] = "Monkey King", ["code"] = "npc_dota_hero_monkey_king" }
AP.Heroes[58] = { ["name"] = "Naga Siren", ["code"] = "npc_dota_hero_naga_siren" }
AP.Heroes[59] = { ["name"] = "Nature's Prophet", ["code"] = "npc_dota_hero_furion" }
AP.Heroes[60] = { ["name"] = "Necrophos", ["code"] = "npc_dota_hero_necrolyte" }
AP.Heroes[61] = { ["name"] = "Night Stalker", ["code"] = "npc_dota_hero_night_stalker" }
AP.Heroes[62] = { ["name"] = "Nyx Assassin", ["code"] = "npc_dota_hero_nyx_assassin" }
AP.Heroes[63] = { ["name"] = "Ogre Magi", ["code"] = "npc_dota_hero_ogre_magi" }
AP.Heroes[64] = { ["name"] = "Omniknight", ["code"] = "npc_dota_hero_omniknight" }
AP.Heroes[65] = { ["name"] = "Oracle", ["code"] = "npc_dota_hero_oracle" }
AP.Heroes[66] = { ["name"] = "Outworld Devourer", ["code"] = "npc_dota_hero_obsidian_destroyer" }
AP.Heroes[67] = { ["name"] = "Phantom Assassin", ["code"] = "npc_dota_hero_phantom_assassin" }
AP.Heroes[68] = { ["name"] = "Phantom Lancer", ["code"] = "npc_dota_hero_phantom_lancer" }
AP.Heroes[69] = { ["name"] = "Phoenix", ["code"] = "npc_dota_hero_phoenix" }
AP.Heroes[70] = { ["name"] = "Puck", ["code"] = "npc_dota_hero_puck" }
AP.Heroes[71] = { ["name"] = "Pudge", ["code"] = "npc_dota_hero_pudge" }
AP.Heroes[72] = { ["name"] = "Pugna", ["code"] = "npc_dota_hero_pugna" }
AP.Heroes[73] = { ["name"] = "Queen of Pain", ["code"] = "npc_dota_hero_queenofpain" }
AP.Heroes[74] = { ["name"] = "Razor", ["code"] = "npc_dota_hero_razor" }
AP.Heroes[75] = { ["name"] = "Riki", ["code"] = "npc_dota_hero_riki" }
AP.Heroes[76] = { ["name"] = "Rubick", ["code"] = "npc_dota_hero_rubick" }
AP.Heroes[77] = { ["name"] = "Sand King", ["code"] = "npc_dota_hero_sand_king" }
AP.Heroes[78] = { ["name"] = "Shadow Demon", ["code"] = "npc_dota_hero_shadow_demon" }
AP.Heroes[79] = { ["name"] = "Shadow Fiend", ["code"] = "npc_dota_hero_nevermore" }
AP.Heroes[80] = { ["name"] = "Shadow Shaman", ["code"] = "npc_dota_hero_shadow_shaman" }
AP.Heroes[81] = { ["name"] = "Silencer", ["code"] = "npc_dota_hero_silencer" }
AP.Heroes[82] = { ["name"] = "Skywrath Mage", ["code"] = "npc_dota_hero_skywrath_mage" }
AP.Heroes[83] = { ["name"] = "Slardar", ["code"] = "npc_dota_hero_slardar" }
AP.Heroes[84] = { ["name"] = "Slark", ["code"] = "npc_dota_hero_slark" }
AP.Heroes[85] = { ["name"] = "Sniper", ["code"] = "npc_dota_hero_sniper" }
AP.Heroes[86] = { ["name"] = "Spectre", ["code"] = "npc_dota_hero_spectre" }
AP.Heroes[87] = { ["name"] = "Spirit Breaker", ["code"] = "npc_dota_hero_spirit_breaker" }
AP.Heroes[88] = { ["name"] = "Storm Spirit", ["code"] = "npc_dota_hero_storm_spirit" }
AP.Heroes[89] = { ["name"] = "Sven", ["code"] = "npc_dota_hero_sven" }
AP.Heroes[90] = { ["name"] = "Techies", ["code"] = "npc_dota_hero_techies" }
AP.Heroes[91] = { ["name"] = "Templar Assassin", ["code"] = "npc_dota_hero_templar_assassin" }
AP.Heroes[92] = { ["name"] = "Terrorblade", ["code"] = "npc_dota_hero_terrorblade" }
AP.Heroes[93] = { ["name"] = "Tidehunter", ["code"] = "npc_dota_hero_tidehunter" }
AP.Heroes[94] = { ["name"] = "Timbersaw", ["code"] = "npc_dota_hero_shredder" }
AP.Heroes[95] = { ["name"] = "Tinker", ["code"] = "npc_dota_hero_tinker" }
AP.Heroes[96] = { ["name"] = "Tiny", ["code"] = "npc_dota_hero_tiny" }
AP.Heroes[97] = { ["name"] = "Treant Protector", ["code"] = "npc_dota_hero_treant" }
AP.Heroes[98] = { ["name"] = "Troll Warlord", ["code"] = "npc_dota_hero_troll_warlord" }
AP.Heroes[99] = { ["name"] = "Tusk", ["code"] = "npc_dota_hero_tusk" }
AP.Heroes[100] = { ["name"] = "Underlord", ["code"] = "npc_dota_hero_abyssal_underlord" }
AP.Heroes[101] = { ["name"] = "Undying", ["code"] = "npc_dota_hero_undying" }
AP.Heroes[102] = { ["name"] = "Ursa", ["code"] = "npc_dota_hero_ursa" }
AP.Heroes[103] = { ["name"] = "Vengeful Spirit", ["code"] = "npc_dota_hero_vengefulspirit" }
AP.Heroes[104] = { ["name"] = "Venomancer", ["code"] = "npc_dota_hero_venomancer" }
AP.Heroes[105] = { ["name"] = "Viper", ["code"] = "npc_dota_hero_viper" }
AP.Heroes[106] = { ["name"] = "Visage", ["code"] = "npc_dota_hero_visage" }
AP.Heroes[107] = { ["name"] = "Warlock", ["code"] = "npc_dota_hero_warlock" }
AP.Heroes[108] = { ["name"] = "Weaver", ["code"] = "npc_dota_hero_weaver" }
AP.Heroes[109] = { ["name"] = "Windranger", ["code"] = "npc_dota_hero_windrunner" }
AP.Heroes[110] = { ["name"] = "Winter Wyvern", ["code"] = "npc_dota_hero_winter_wyvern" }
AP.Heroes[111] = { ["name"] = "Witch Doctor", ["code"] = "npc_dota_hero_witch_doctor" }
AP.Heroes[112] = { ["name"] = "Wraith King", ["code"] = "npc_dota_hero_skeleton_king" }
AP.Heroes[113] = { ["name"] = "Zeus", ["code"] = "npc_dota_hero_zuus" }

for i = 1, 113 do
	Menu.SetValueName(AP.Hero, i, AP.Heroes[i]["name"])
end

function AP.OnUpdate()
	if GameRules.GetGameState() < 4 then return end
	if Heroes.GetLocal() == nil then return end
	local name = NPC.GetUnitName(Heroes.GetLocal())
	if name ~= AP.Prev then
		AP.Prev = name
	end
end

function AP.OnDraw()
	if GameRules.GetGameState() == 2 and Menu.IsEnabled(AP.IsEnabled) then
		local val = Menu.GetValue(AP.Hero)
		if val == 0 and AP.Prev ~= nil then
			AP.Code = AP.Prev
		else
			if val == 0 then val = 1 end
			AP.Code = AP.Heroes[val]["code"]
		end		
		
		Engine.ExecuteCommand("dota_select_hero " .. AP.Code)
	end
end

return AP
