local ItemPanel = {}
ItemPanel.Identity = "item_panel"
ItemPanel.Locale = {
	["name"] = {
		["english"] = "Item Panel",
		["russian"] = "Панель предметов"
	},
	["desc"] = {
		["english"] = "Shows what items enemy hero had in last time he was seen.",
		["russian"] = "Показывает какие предметы имел вражеский герой в последний раз когда был виден."
	},
	["size"] = {
		["english"] = "Size",
		["russian"] = "Размер"
	},
	["cd"] = {
		["english"] = "Show item cooldown",
		["russian"] = "Показывать время перезарядки предмета"
	}
}

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
ItemPanel.items["item_travel_boots"] = "Boots of Travel"
ItemPanel.items["item_travel_boots_1"] = "Boots of Travel1"
ItemPanel.items["item_travel_boots_2"] = "Boots of Travel2"
ItemPanel.items["item_bracer"] = "Bracer"
ItemPanel.items["item_buckler"] = "Buckler"
ItemPanel.items["item_butterfly"] = "Butterfly"
ItemPanel.items["item_crimson_guard"] = "Crimson Guard"
ItemPanel.items["item_lesser_crit"] = "Crystalys"
ItemPanel.items["item_greater_crit"] = "Daedalus"
ItemPanel.items["item_dagon_#"] = "Dagon2"
ItemPanel.items["item_desolator"] = "Desolator"
ItemPanel.items["item_diffusal_blade"] = "Diffusal Blade"
ItemPanel.items["item_diffusal_blade_1"] = "Diffusal Blade1"
ItemPanel.items["item_diffusal_blade_2"] = "Diffusal Blade2"
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
ItemPanel.items["item_necronomicon"] = "Necronomicon"
ItemPanel.items["item_necronomicon_1"] = "Necronomicon1"
ItemPanel.items["item_necronomicon_2"] = "Necronomicon2"
ItemPanel.items["item_necronomicon_3"] = "Necronomicon3"
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
ItemPanel.items["item_dagon"] = "Dagon"
ItemPanel.items["item_dagon_1"] = "Dagon"
ItemPanel.items["item_dagon_2"] = "Dagon2"
ItemPanel.items["item_dagon_3"] = "Dagon3"
ItemPanel.items["item_dagon_4"] = "Dagon4"
ItemPanel.items["item_dagon_5"] = "Dagon5" 

ItemPanel.OnAir = false
local offsetPosX = 0
local offsetPosY = 0

function ItemPanel.OnDraw()
	if GUI == nil then return end
	local locx = GUI.Get(ItemPanel.Identity .. "locx")
	local locy = GUI.Get(ItemPanel.Identity .. "locy")
	
	if not GUI.Exist(ItemPanel.Identity) then
		GUI.Initialize(ItemPanel.Identity, GUI.Category.General, ItemPanel.Locale["name"], ItemPanel.Locale["desc"], "paroxysm")
		GUI.AddMenuItem(ItemPanel.Identity, ItemPanel.Identity .. "size", ItemPanel.Locale["size"], GUI.MenuType.Slider, 16, 64, 24)
		GUI.AddMenuItem(ItemPanel.Identity, ItemPanel.Identity .. "cd", ItemPanel.Locale["cd"], GUI.MenuType.CheckBox, 0)

		if (locx == "" or locx == nil) then GUI.Set(ItemPanel.Identity .. "locx", 10) locx = 10 end
		if (locy == "" or locy == nil) then GUI.Set(ItemPanel.Identity .. "locy", 150) locy = 150 end
	end

	if ItemPanel.OnAir then 
		local mx, my = Input.GetCursorPos()
		GUI.Set(ItemPanel.Identity .. "locx", mx - offsetPosX)
		GUI.Set(ItemPanel.Identity .. "locy", my - offsetPosY)
		if tonumber(GUI.Get(ItemPanel.Identity .. "locx")) < 1 then GUI.Set(ItemPanel.Identity .. "locx", 1) end
		if tonumber(GUI.Get(ItemPanel.Identity .. "locy")) < 1 then GUI.Set(ItemPanel.Identity .. "locy", 1) end
	end
	
	Renderer.SetDrawColor(255, 255, 255, 255)
    if not GUI.IsEnabled(ItemPanel.Identity) then return true end
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end
	
	local ypos = locy
	local size = GUI.Get(ItemPanel.Identity .. "size")
	local defx, xpos = math.floor(size * 128 / 72)
	local total_heroes = 0
	local max_items = 0
	local iscd = GUI.IsEnabled(ItemPanel.Identity .. "cd")

	for k, hero in pairs(Heroes.GetAll()) do		
		if not NPC.IsIllusion(hero) and Entity.IsHero(hero) and not Entity.IsSameTeam(myHero, hero) then
			ypos = ypos + size + 5
			xpos = defx + locx + 5
			local item_array = {}
			for k, v in pairs(ItemPanel.items) do
				if NPC.HasItem(hero, k, true) then
					local tempName = k
					local item = NPC.GetItem(hero, k, true)
					tempName = tempName:gsub("item_", "")
					local imageHandle = ItemPanel.ItemIcons[tempName]
					if imageHandle == nil then
						imageHandle = Renderer.LoadImage(ItemPanel.IconPath .. tempName .. ".png")
						ItemPanel.ItemIcons[tempName] = imageHandle
					end
					Renderer.DrawImage(imageHandle, xpos, ypos, size + 8, size)
					local cd = math.ceil(Ability.GetCooldown(item))
					if Item.GetCurrentCharges(item) > 0 or (cd > 0 and iscd) then
						Renderer.SetDrawColor(0, 0, 0, 200)
						Renderer.DrawFilledRect(xpos, ypos, size + 8, size)
						Renderer.SetDrawColor(255, 255, 255, 255)
						local d = Item.GetCurrentCharges(item)
						if cd > 0 and iscd then d = cd end
						Renderer.DrawTextCentered(GUI.Font.ContentBold, xpos + math.ceil((size + 8) / 2), ypos + math.ceil(size / 2), d, true)
					end
					xpos = xpos + size + 10
				end
			end
			if max_items < xpos then max_items = xpos end
			total_heroes = total_heroes + 1
			local tempHeroName = NPC.GetUnitName(hero):gsub("npc_dota_hero_", "")
			local imageHandle = ItemPanel.HeroIcons[tempHeroName]
			if imageHandle == nil then
				imageHandle = Renderer.LoadImage(ItemPanel.HeroPath .. tempHeroName .. ".png")
				ItemPanel.HeroIcons[tempHeroName] = imageHandle
			end
			Renderer.DrawImage(imageHandle, locx, ypos, defx, size )
		end
	end
	
	if total_heroes == 0 then return end
	
	if Input.IsCursorInRect(locx, (locy + size + 5) - 29, max_items - 12, 25) then
		Renderer.SetDrawColor(217, 19, 61, 230)
		if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then 
			local mx, my = Input.GetCursorPos()
			offsetPosX = mx - locx
			offsetPosY = my - locy
			if ItemPanel.OnAir then ItemPanel.OnAir = false else ItemPanel.OnAir = true end
		end
	else
		Renderer.SetDrawColor(217, 19, 61, 150)
	end
	
	Renderer.DrawFilledRect(locx, (locy + size + 5) - 29, max_items - locx - 2, 25)
	Renderer.SetDrawColor(hex2rgb("#fff"))
	Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, locx + math.ceil((max_items - locx - 2) / 2), ((locy + size + 5) - 29) + 12, "TAP HERE TO MOVE", true)
end

return ItemPanel
