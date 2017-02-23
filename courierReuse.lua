local courierReuse = {}

courierReuse.OptionEnabled = Menu.AddOption({"Utility", "Courier"}, "Enabled","on/off")
courierReuse.optionKey = Menu.AddKeyOption({ "Utility","Courier"}, "Key to reuse", Enum.ButtonCode.KEY_T)
courierReuse.optionNoFeed = Menu.AddOption({"Utility", "Courier"}, "Anti Feed","on/off")

courierReuse.items = {}
courierReuse.items["item_aegis"] = "Aegis of the Immortal"
courierReuse.items["item_courier"] = "Animal Courier"
courierReuse.items["item_boots_of_elves"] = "Band of Elvenskin"
courierReuse.items["item_belt_of_strength"] = "Belt of Strength"
courierReuse.items["item_blade_of_alacrity"] = "Blade of Alacrity"
courierReuse.items["item_blades_of_attack"] = "Blades of Attack"
courierReuse.items["item_blight_stone"] = "Blight Stone"
courierReuse.items["item_blink"] = "Blink Dagger"
courierReuse.items["item_boots"] = "Boots of Speed"
courierReuse.items["item_bottle"] = "Bottle"
courierReuse.items["item_broadsword"] = "Broadsword"
courierReuse.items["item_chainmail"] = "Chainmail"
courierReuse.items["item_cheese"] = "Cheese"
courierReuse.items["item_circlet"] = "Circlet"
courierReuse.items["item_clarity"] = "Clarity"
courierReuse.items["item_claymore"] = "Claymore"
courierReuse.items["item_cloak"] = "Cloak"
courierReuse.items["item_demon_edge"] = "Demon Edge"
courierReuse.items["item_dust"] = "Dust of Appearance"
courierReuse.items["item_eagle"] = "Eaglesong"
courierReuse.items["item_enchanted_mango"] = "Enchanted Mango"
courierReuse.items["item_energy_booster"] = "Energy Booster"
courierReuse.items["item_faerie_fire"] = "Faerie Fire"
courierReuse.items["item_flying_courier"] = "Flying Courier"
courierReuse.items["item_gauntlets"] = "Gauntlets of Strength"
courierReuse.items["item_gem"] = "Gem of True Sight"
courierReuse.items["item_ghost"] = "Ghost Scepter"
courierReuse.items["item_gloves"] = "Gloves of Haste"
courierReuse.items["item_flask"] = "Healing Salve"
courierReuse.items["item_helm_of_iron_will"] = "Helm of Iron Will"
courierReuse.items["item_hyperstone"] = "Hyperstone"
courierReuse.items["item_infused_raindrop"] = "Infused Raindrop"
courierReuse.items["item_branches"] = "Iron Branch"
courierReuse.items["item_javelin"] = "Javelin"
courierReuse.items["item_magic_stick"] = "Magic Stick"
courierReuse.items["item_mantle"] = "Mantle of Intelligence"
courierReuse.items["item_mithril_hammer"] = "Mithril Hammer"
courierReuse.items["item_lifesteal"] = "Morbid Mask"
courierReuse.items["item_mystic_staff"] = "Mystic Staff"
courierReuse.items["item_ward_observer"] = "Observer Ward"
courierReuse.items["item_ogre_axe"] = "Ogre Club"
courierReuse.items["item_orb_of_venom"] = "Orb of Venom"
courierReuse.items["item_platemail"] = "Platemail"
courierReuse.items["item_point_booster"] = "Point Booster"
courierReuse.items["item_quarterstaff"] = "Quarterstaff"
courierReuse.items["item_quelling_blade"] = "Quelling Blade"
courierReuse.items["item_reaver"] = "Reaver"
courierReuse.items["item_ring_of_health"] = "Ring of Health"
courierReuse.items["item_ring_of_protection"] = "Ring of Protection"
courierReuse.items["item_ring_of_regen"] = "Ring of Regen"
courierReuse.items["item_robe"] = "Robe of the Magi"
courierReuse.items["item_relic"] = "Sacred Relic"
courierReuse.items["item_sobi_mask"] = "Sage's Mask"
courierReuse.items["item_ward_sentry"] = "Sentry Ward"
courierReuse.items["item_shadow_amulet"] = "Shadow Amulet"
courierReuse.items["item_slippers"] = "Slippers of Agility"
courierReuse.items["item_smoke_of_deceit"] = "Smoke of Deceit"
courierReuse.items["item_staff_of_wizardry"] = "Staff of Wizardry"
courierReuse.items["item_stout_shield"] = "Stout Shield"
courierReuse.items["item_talisman_of_evasion"] = "Talisman of Evasion"
courierReuse.items["item_tango"] = "Tango"
courierReuse.items["item_tango_single"] = "Tango (Shared)"
courierReuse.items["item_tome_of_knowledge"] = "Tome of Knowledge"
courierReuse.items["item_tpscroll"] = "Town Portal Scroll"
courierReuse.items["item_ultimate_orb"] = "Ultimate Orb"
courierReuse.items["item_vitality_booster"] = "Vitality Booster"
courierReuse.items["item_void_stone"] = "Void Stone"
courierReuse.items["item_wind_lace"] = "Wind Lace"
courierReuse.items["item_abyssal_blade"] = "Abyssal Blade"
courierReuse.items["item_aether_lens"] = "Aether Lens"
courierReuse.items["item_ultimate_scepter"] = "Aghanim's Scepter"
courierReuse.items["item_arcane_boots"] = "Arcane Boots"
courierReuse.items["item_armlet"] = "Armlet of Mordiggian"
courierReuse.items["item_assault"] = "Assault Cuirass"
courierReuse.items["item_bfury"] = "Battle Fury"
courierReuse.items["item_black_king_bar"] = "Black King Bar"
courierReuse.items["item_blade_mail"] = "Blade Mail"
courierReuse.items["item_bloodstone"] = "Bloodstone"
courierReuse.items["item_bloodthorn"] = "Bloodthorn"
courierReuse.items["item_travel_boots_#"] = "Boots of Travel2"
courierReuse.items["item_bracer"] = "Bracer"
courierReuse.items["item_buckler"] = "Buckler"
courierReuse.items["item_butterfly"] = "Butterfly"
courierReuse.items["item_crimson_guard"] = "Crimson Guard"
courierReuse.items["item_lesser_crit"] = "Crystalys"
courierReuse.items["item_greater_crit"] = "Daedalus"
courierReuse.items["item_dagon_#"] = "Dagon2"
courierReuse.items["item_desolator"] = "Desolator"
courierReuse.items["item_diffusal_blade_#"] = "Diffusal Blade2"
courierReuse.items["item_dragon_lance"] = "Dragon Lance"
courierReuse.items["item_ancient_janggo"] = "Drum of Endurance"
courierReuse.items["item_echo_sabre"] = "Echo Sabre"
courierReuse.items["item_ethereal_blade"] = "Ethereal Blade"
courierReuse.items["item_cyclone"] = "Eul's Scepter of Divinity"
courierReuse.items["item_skadi"] = "Eye of Skadi"
courierReuse.items["item_force_staff"] = "Force Staff"
courierReuse.items["item_glimmer_cape"] = "Glimmer Cape"
courierReuse.items["item_guardian_greaves"] = "Guardian Greaves"
courierReuse.items["item_hand_of_midas"] = "Hand of Midas"
courierReuse.items["item_headdress"] = "Headdress"
courierReuse.items["item_heart"] = "Heart of Tarrasque"
courierReuse.items["item_heavens_halberd"] = "Heaven's Halberd"
courierReuse.items["item_helm_of_the_dominator"] = "Helm of the Dominator"
courierReuse.items["item_hood_of_defiance"] = "Hood of Defiance"
courierReuse.items["item_hurricane_pike"] = "Hurricane Pike"
courierReuse.items["item_iron_talon"] = "Iron Talon"
courierReuse.items["item_sphere"] = "Linken's Sphere"
courierReuse.items["item_lotus_orb"] = "Lotus Orb"
courierReuse.items["item_maelstrom"] = "Maelstrom"
courierReuse.items["item_magic_wand"] = "Magic Wand"
courierReuse.items["item_manta"] = "Manta Style"
courierReuse.items["item_mask_of_madness"] = "Mask of Madness"
courierReuse.items["item_medallion_of_courage"] = "Medallion of Courage"
courierReuse.items["item_mekansm"] = "Mekansm"
courierReuse.items["item_mjollnir"] = "Mjollnir"
courierReuse.items["item_monkey_king_bar"] = "Monkey King Bar"
courierReuse.items["item_moon_shard"] = "Moon Shard"
courierReuse.items["item_necronomicon_#"] = "Necronomicon2"
courierReuse.items["item_null_talisman"] = "Null Talisman"
courierReuse.items["item_oblivion_staff"] = "Oblivion Staff"
courierReuse.items["item_ward_dispenser"] = "Observer and Sentry Wards"
courierReuse.items["item_octarine_core"] = "Octarine Core"
courierReuse.items["item_orchid"] = "Orchid Malevolence"
courierReuse.items["item_pers"] = "Perseverance"
courierReuse.items["item_phase_boots"] = "Phase Boots"
courierReuse.items["item_pipe"] = "Pipe of Insight"
courierReuse.items["item_poor_mans_shield"] = "Poor Man's Shield"
courierReuse.items["item_power_treads"] = "Power Treads"
courierReuse.items["item_radiance"] = "Radiance"
courierReuse.items["item_rapier"] = "Divine Rapier"
courierReuse.items["item_refresher"] = "Refresher Orb"
courierReuse.items["item_ring_of_aquila"] = "Ring of Aquila"
courierReuse.items["item_ring_of_basilius"] = "Ring of Basilius"
courierReuse.items["item_rod_of_atos"] = "Rod of Atos"
courierReuse.items["item_sange"] = "Sange"
courierReuse.items["item_sange_and_yasha"] = "Sange and Yasha"
courierReuse.items["item_satanic"] = "Satanic"
courierReuse.items["item_sheepstick"] = "Scythe of Vyse"
courierReuse.items["item_invis_sword"] = "Shadow Blade"
courierReuse.items["item_shivas_guard"] = "Shiva's Guard"
courierReuse.items["item_silver_edge"] = "Silver Edge"
courierReuse.items["item_basher"] = "Skull Basher"
courierReuse.items["item_solar_crest"] = "Solar Crest"
courierReuse.items["item_soul_booster"] = "Soul Booster"
courierReuse.items["item_soul_ring"] = "Soul Ring"
courierReuse.items["item_tranquil_boots"] = "Tranquil Boots"
courierReuse.items["item_urn_of_shadows"] = "Urn of Shadows"
courierReuse.items["item_vanguard"] = "Vanguard"
courierReuse.items["item_veil_of_discord"] = "Veil of Discord"
courierReuse.items["item_vladmir"] = "Vladmir's Offering"
courierReuse.items["item_wraith_band"] = "Wraith Band"
courierReuse.items["item_yasha"] = "Yasha"


function courierReuse.OnUpdate()
	if not Menu.IsEnabled(courierReuse.OptionEnabled) then return end
	
		local myHero = Heroes.GetLocal()
		if myHero == nil then return end
		local myTeam =  Entity.GetTeamNum(myHero)
		local bReuse = false
		for i = 1, NPCs.Count() do
			local index_npc = NPCs.Get(i)
			if index_npc ~= nil then
				local sameTeam = Entity.GetTeamNum(myHero) == myTeam	
				if sameTeam and Entity.GetHealth(index_npc) > 0 then
					local name = NPC.GetUnitName(index_npc)
					if name == "npc_dota_courier" then
						local reuse = NPC.GetAbilityByIndex(index_npc, 4)
						local reuse_2 = NPC.GetAbilityByIndex(index_npc, 3)
						local go_home = NPC.GetAbilityByIndex(index_npc, 0)
						if Menu.IsKeyDown(courierReuse.optionKey) then
							for k, v in pairs(courierReuse.items) do
								if NPC.HasItem(index_npc, k, false) then
									local item = NPC.GetItem(index_npc, k, true)
									Log.Write(Item.GetPlayerOwnerID(item) .. "   " .. Hero.GetPlayerID(myHero))
									if Item.GetPlayerOwnerID(item) == Hero.GetPlayerID(myHero) then
										bReuse = true
									else 
										bReuse = false
									end
								end
							end
							if bReuse == true then
								Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, myHero, Vector(0,0,0), reuse, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, index_npc)
							else
								Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, myHero, Vector(0,0,0), reuse_2, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, index_npc)
							end
						end
						if Menu.IsEnabled(courierReuse.optionNoFeed) then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, myHero, Vector(0,0,0), go_home, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, index_npc)
						end
					end
				end
			end
		end
end

return courierReuse
