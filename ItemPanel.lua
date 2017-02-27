-- Author: paroxysm
-- Updated: 22.02.2017
local ItemPanel = {}

ItemPanel.Enable = Menu.AddOption({ "Utility","Item Panel" }, "Enabled", "")
ItemPanel.Key = Menu.AddKeyOption({ "Utility", "Item Panel" }, "Key", Enum.ButtonCode.KEY_F)
ItemPanel.Size = Menu.AddOption({ "Utility","Item Panel" }, "Size", "", 16, 64, 8)

ItemPanel.IsOpen = false
ItemPanel.IconPath = "resource/flash3/images/items/"
ItemPanel.ItemIcons = {}
ItemPanel.HeroPath = "resource/flash3/images/heroes/"
ItemPanel.HeroIcons = {}

ItemPanel.items = {}
ItemPanel.items["item_aegis"] = "Aegis of the Immortal"
ItemPanel.items["item_courier"] = "Animal Courier"
ItemPanel.items["item_boots_of_elves"] = "Band of Elvenskin"
ItemPanel.items["item_belt_of_strength"] = "Belt of Strength"
ItemPanel.items["item_blade_of_alacrity"] = "Blade of Alacrity"
ItemPanel.items["item_blades_of_attack"] = "Blades of Attack"
ItemPanel.items["item_blight_stone"] = "Blight Stone"
ItemPanel.items["item_blink"] = "Blink Dagger"
ItemPanel.items["item_boots"] = "Boots of Speed"
ItemPanel.items["item_bottle"] = "Bottle"
ItemPanel.items["item_broadsword"] = "Broadsword"
ItemPanel.items["item_chainmail"] = "Chainmail"
ItemPanel.items["item_cheese"] = "Cheese"
ItemPanel.items["item_circlet"] = "Circlet"
ItemPanel.items["item_clarity"] = "Clarity"
ItemPanel.items["item_claymore"] = "Claymore"
ItemPanel.items["item_cloak"] = "Cloak"
ItemPanel.items["item_demon_edge"] = "Demon Edge"
ItemPanel.items["item_dust"] = "Dust of Appearance"
ItemPanel.items["item_eagle"] = "Eaglesong"
ItemPanel.items["item_enchanted_mango"] = "Enchanted Mango"
ItemPanel.items["item_energy_booster"] = "Energy Booster"
ItemPanel.items["item_faerie_fire"] = "Faerie Fire"
ItemPanel.items["item_flying_courier"] = "Flying Courier"
ItemPanel.items["item_gauntlets"] = "Gauntlets of Strength"
ItemPanel.items["item_gem"] = "Gem of True Sight"
ItemPanel.items["item_ghost"] = "Ghost Scepter"
ItemPanel.items["item_gloves"] = "Gloves of Haste"
ItemPanel.items["item_flask"] = "Healing Salve"
ItemPanel.items["item_helm_of_iron_will"] = "Helm of Iron Will"
ItemPanel.items["item_hyperstone"] = "Hyperstone"
ItemPanel.items["item_infused_raindrop"] = "Infused Raindrop"
ItemPanel.items["item_branches"] = "Iron Branch"
ItemPanel.items["item_javelin"] = "Javelin"
ItemPanel.items["item_magic_stick"] = "Magic Stick"
ItemPanel.items["item_mantle"] = "Mantle of Intelligence"
ItemPanel.items["item_mithril_hammer"] = "Mithril Hammer"
ItemPanel.items["item_lifesteal"] = "Morbid Mask"
ItemPanel.items["item_mystic_staff"] = "Mystic Staff"
ItemPanel.items["item_ward_observer"] = "Observer Ward"
ItemPanel.items["item_ogre_axe"] = "Ogre Club"
ItemPanel.items["item_orb_of_venom"] = "Orb of Venom"
ItemPanel.items["item_platemail"] = "Platemail"
ItemPanel.items["item_point_booster"] = "Point Booster"
ItemPanel.items["item_quarterstaff"] = "Quarterstaff"
ItemPanel.items["item_quelling_blade"] = "Quelling Blade"
ItemPanel.items["item_reaver"] = "Reaver"
ItemPanel.items["item_ring_of_health"] = "Ring of Health"
ItemPanel.items["item_ring_of_protection"] = "Ring of Protection"
ItemPanel.items["item_ring_of_regen"] = "Ring of Regen"
ItemPanel.items["item_robe"] = "Robe of the Magi"
ItemPanel.items["item_relic"] = "Sacred Relic"
ItemPanel.items["item_sobi_mask"] = "Sage's Mask"
ItemPanel.items["item_ward_sentry"] = "Sentry Ward"
ItemPanel.items["item_shadow_amulet"] = "Shadow Amulet"
ItemPanel.items["item_slippers"] = "Slippers of Agility"
ItemPanel.items["item_smoke_of_deceit"] = "Smoke of Deceit"
ItemPanel.items["item_staff_of_wizardry"] = "Staff of Wizardry"
ItemPanel.items["item_stout_shield"] = "Stout Shield"
ItemPanel.items["item_talisman_of_evasion"] = "Talisman of Evasion"
ItemPanel.items["item_tango"] = "Tango"
ItemPanel.items["item_tango_single"] = "Tango (Shared)"
ItemPanel.items["item_tome_of_knowledge"] = "Tome of Knowledge"
ItemPanel.items["item_tpscroll"] = "Town Portal Scroll"
ItemPanel.items["item_ultimate_orb"] = "Ultimate Orb"
ItemPanel.items["item_vitality_booster"] = "Vitality Booster"
ItemPanel.items["item_void_stone"] = "Void Stone"
ItemPanel.items["item_wind_lace"] = "Wind Lace"
ItemPanel.items["item_abyssal_blade"] = "Abyssal Blade"
ItemPanel.items["item_aether_lens"] = "Aether Lens"
ItemPanel.items["item_ultimate_scepter"] = "Aghanim's Scepter"
ItemPanel.items["item_arcane_boots"] = "Arcane Boots"
ItemPanel.items["item_armlet"] = "Armlet of Mordiggian"
ItemPanel.items["item_assault"] = "Assault Cuirass"
ItemPanel.items["item_bfury"] = "Battle Fury"
ItemPanel.items["item_black_king_bar"] = "Black King Bar"
ItemPanel.items["item_blade_mail"] = "Blade Mail"
ItemPanel.items["item_bloodstone"] = "Bloodstone"
ItemPanel.items["item_bloodthorn"] = "Bloodthorn"
ItemPanel.items["item_travel_boots_#"] = "Boots of Travel2"
ItemPanel.items["item_bracer"] = "Bracer"
ItemPanel.items["item_buckler"] = "Buckler"
ItemPanel.items["item_butterfly"] = "Butterfly"
ItemPanel.items["item_crimson_guard"] = "Crimson Guard"
ItemPanel.items["item_lesser_crit"] = "Crystalys"
ItemPanel.items["item_greater_crit"] = "Daedalus"
ItemPanel.items["item_dagon_#"] = "Dagon2"
ItemPanel.items["item_desolator"] = "Desolator"
ItemPanel.items["item_diffusal_blade_#"] = "Diffusal Blade2"
ItemPanel.items["item_dragon_lance"] = "Dragon Lance"
ItemPanel.items["item_ancient_janggo"] = "Drum of Endurance"
ItemPanel.items["item_echo_sabre"] = "Echo Sabre"
ItemPanel.items["item_ethereal_blade"] = "Ethereal Blade"
ItemPanel.items["item_cyclone"] = "Eul's Scepter of Divinity"
ItemPanel.items["item_skadi"] = "Eye of Skadi"
ItemPanel.items["item_force_staff"] = "Force Staff"
ItemPanel.items["item_glimmer_cape"] = "Glimmer Cape"
ItemPanel.items["item_guardian_greaves"] = "Guardian Greaves"
ItemPanel.items["item_hand_of_midas"] = "Hand of Midas"
ItemPanel.items["item_headdress"] = "Headdress"
ItemPanel.items["item_heart"] = "Heart of Tarrasque"
ItemPanel.items["item_heavens_halberd"] = "Heaven's Halberd"
ItemPanel.items["item_helm_of_the_dominator"] = "Helm of the Dominator"
ItemPanel.items["item_hood_of_defiance"] = "Hood of Defiance"
ItemPanel.items["item_hurricane_pike"] = "Hurricane Pike"
ItemPanel.items["item_iron_talon"] = "Iron Talon"
ItemPanel.items["item_sphere"] = "Linken's Sphere"
ItemPanel.items["item_lotus_orb"] = "Lotus Orb"
ItemPanel.items["item_maelstrom"] = "Maelstrom"
ItemPanel.items["item_magic_wand"] = "Magic Wand"
ItemPanel.items["item_manta"] = "Manta Style"
ItemPanel.items["item_mask_of_madness"] = "Mask of Madness"
ItemPanel.items["item_medallion_of_courage"] = "Medallion of Courage"
ItemPanel.items["item_mekansm"] = "Mekansm"
ItemPanel.items["item_mjollnir"] = "Mjollnir"
ItemPanel.items["item_monkey_king_bar"] = "Monkey King Bar"
ItemPanel.items["item_moon_shard"] = "Moon Shard"
ItemPanel.items["item_necronomicon_#"] = "Necronomicon2"
ItemPanel.items["item_null_talisman"] = "Null Talisman"
ItemPanel.items["item_oblivion_staff"] = "Oblivion Staff"
ItemPanel.items["item_ward_dispenser"] = "Observer and Sentry Wards"
ItemPanel.items["item_octarine_core"] = "Octarine Core"
ItemPanel.items["item_orchid"] = "Orchid Malevolence"
ItemPanel.items["item_pers"] = "Perseverance"
ItemPanel.items["item_phase_boots"] = "Phase Boots"
ItemPanel.items["item_pipe"] = "Pipe of Insight"
ItemPanel.items["item_poor_mans_shield"] = "Poor Man's Shield"
ItemPanel.items["item_power_treads"] = "Power Treads"
ItemPanel.items["item_radiance"] = "Radiance"
ItemPanel.items["item_rapier"] = "Divine Rapier"
ItemPanel.items["item_refresher"] = "Refresher Orb"
ItemPanel.items["item_ring_of_aquila"] = "Ring of Aquila"
ItemPanel.items["item_ring_of_basilius"] = "Ring of Basilius"
ItemPanel.items["item_rod_of_atos"] = "Rod of Atos"
ItemPanel.items["item_sange"] = "Sange"
ItemPanel.items["item_sange_and_yasha"] = "Sange and Yasha"
ItemPanel.items["item_satanic"] = "Satanic"
ItemPanel.items["item_sheepstick"] = "Scythe of Vyse"
ItemPanel.items["item_invis_sword"] = "Shadow Blade"
ItemPanel.items["item_shivas_guard"] = "Shiva's Guard"
ItemPanel.items["item_silver_edge"] = "Silver Edge"
ItemPanel.items["item_basher"] = "Skull Basher"
ItemPanel.items["item_solar_crest"] = "Solar Crest"
ItemPanel.items["item_soul_booster"] = "Soul Booster"
ItemPanel.items["item_soul_ring"] = "Soul Ring"
ItemPanel.items["item_tranquil_boots"] = "Tranquil Boots"
ItemPanel.items["item_urn_of_shadows"] = "Urn of Shadows"
ItemPanel.items["item_vanguard"] = "Vanguard"
ItemPanel.items["item_veil_of_discord"] = "Veil of Discord"
ItemPanel.items["item_vladmir"] = "Vladmir's Offering"
ItemPanel.items["item_wraith_band"] = "Wraith Band"
ItemPanel.items["item_yasha"] = "Yasha"

function ItemPanel.OnUpdate()
	if Menu.IsKeyDownOnce(ItemPanel.Key) and Menu.IsEnabled(ItemPanel.Enable) then 	
		if ItemPanel.IsOpen then ItemPanel.IsOpen = false
		else ItemPanel.IsOpen = true end
	end
end

function ItemPanel.OnDraw()
	Renderer.SetDrawColor(255, 255, 255, 255)
    if not Menu.IsEnabled(ItemPanel.Enable) then return true end
    if not ItemPanel.IsOpen then return true end
	
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end
	local myTeam = Entity.GetTeamNum( myHero )
	local ypos = 150
	local defx, xpos = math.floor(Menu.GetValue(ItemPanel.Size) * 128 / 72)

	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		
		if not NPC.IsIllusion(hero) then
			local sameTeam = Entity.GetTeamNum(hero) == myTeam
			if not sameTeam then
				ypos = ypos + Menu.GetValue(ItemPanel.Size)
				xpos = defx
				for k, v in pairs(ItemPanel.items) do
					if NPC.HasItem(hero, k, true) then
						local tempName = k
						tempName = tempName:gsub("item_", "")
						local imageHandle = ItemPanel.ItemIcons[tempName]
						if imageHandle == nil then
							imageHandle = Renderer.LoadImage(ItemPanel.IconPath .. tempName .. ".png")
							ItemPanel.ItemIcons[tempName] = imageHandle
						end
						xpos = xpos + Menu.GetValue(ItemPanel.Size) + 8
						Renderer.DrawImage(imageHandle, xpos, ypos, Menu.GetValue(ItemPanel.Size) + 8, Menu.GetValue(ItemPanel.Size))
					end
				end
				
				local tempHeroName = NPC.GetUnitName(hero):gsub("npc_dota_hero_", "")
				local imageHandle = ItemPanel.HeroIcons[tempHeroName]
				if imageHandle == nil then
					imageHandle = Renderer.LoadImage(ItemPanel.HeroPath .. tempHeroName .. ".png")
					ItemPanel.HeroIcons[tempHeroName] = imageHandle
				end
				Renderer.DrawImage(imageHandle, 10, ypos, defx, Menu.GetValue(ItemPanel.Size) )
			end
			
		end
	end
end

return ItemPanel