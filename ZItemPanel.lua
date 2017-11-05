local zItemPanel = {}
zItemPanel.Identity = "item_panel"
zItemPanel.Locale = {
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

zItemPanel.Size = Menu.AddOption({ "Kostya12rus","Item Panel" }, "Size", "", 16, 64, 8)

zItemPanel.IsOpen = false
zItemPanel.IconPath = "~/Kostya12rus/Items/"
zItemPanel.ItemIcons = {}
zItemPanel.HeroPath = "resource/flash3/images/heroes/"
zItemPanel.HeroIcons = {}

zItemPanel.items = {}
zItemPanel.items["item_aegis"] = "Aegis of the Immortal"
zItemPanel.items["item_courier"] = "Animal Courier"
zItemPanel.items["item_boots_of_elves"] = "Band of Elvenskin"
zItemPanel.items["item_belt_of_strength"] = "Belt of Strength"
zItemPanel.items["item_blade_of_alacrity"] = "Blade of Alacrity"
zItemPanel.items["item_blades_of_attack"] = "Blades of Attack"
zItemPanel.items["item_blight_stone"] = "Blight Stone"
zItemPanel.items["item_blink"] = "Blink Dagger"
zItemPanel.items["item_boots"] = "Boots of Speed"
zItemPanel.items["item_bottle"] = "Bottle"
zItemPanel.items["item_broadsword"] = "Broadsword"
zItemPanel.items["item_chainmail"] = "Chainmail"
zItemPanel.items["item_cheese"] = "Cheese"
zItemPanel.items["item_circlet"] = "Circlet"
zItemPanel.items["item_clarity"] = "Clarity"
zItemPanel.items["item_claymore"] = "Claymore"
zItemPanel.items["item_cloak"] = "Cloak"
zItemPanel.items["item_demon_edge"] = "Demon Edge"
zItemPanel.items["item_dust"] = "Dust of Appearance"
zItemPanel.items["item_eagle"] = "Eaglesong"
zItemPanel.items["item_enchanted_mango"] = "Enchanted Mango"
zItemPanel.items["item_energy_booster"] = "Energy Booster"
zItemPanel.items["item_faerie_fire"] = "Faerie Fire"
zItemPanel.items["item_flying_courier"] = "Flying Courier"
zItemPanel.items["item_gauntlets"] = "Gauntlets of Strength"
zItemPanel.items["item_gem"] = "Gem of True Sight"
zItemPanel.items["item_ghost"] = "Ghost Scepter"
zItemPanel.items["item_gloves"] = "Gloves of Haste"
zItemPanel.items["item_flask"] = "Healing Salve"
zItemPanel.items["item_helm_of_iron_will"] = "Helm of Iron Will"
zItemPanel.items["item_hyperstone"] = "Hyperstone"
zItemPanel.items["item_infused_raindrop"] = "Infused Raindrop"
zItemPanel.items["item_branches"] = "Iron Branch"
zItemPanel.items["item_javelin"] = "Javelin"
zItemPanel.items["item_magic_stick"] = "Magic Stick"
zItemPanel.items["item_mantle"] = "Mantle of Intelligence"
zItemPanel.items["item_mithril_hammer"] = "Mithril Hammer"
zItemPanel.items["item_lifesteal"] = "Morbid Mask"
zItemPanel.items["item_mystic_staff"] = "Mystic Staff"
zItemPanel.items["item_ward_observer"] = "Observer Ward"
zItemPanel.items["item_ogre_axe"] = "Ogre Club"
zItemPanel.items["item_orb_of_venom"] = "Orb of Venom"
zItemPanel.items["item_platemail"] = "Platemail"
zItemPanel.items["item_point_booster"] = "Point Booster"
zItemPanel.items["item_quarterstaff"] = "Quarterstaff"
zItemPanel.items["item_quelling_blade"] = "Quelling Blade"
zItemPanel.items["item_reaver"] = "Reaver"
zItemPanel.items["item_ring_of_health"] = "Ring of Health"
zItemPanel.items["item_ring_of_protection"] = "Ring of Protection"
zItemPanel.items["item_ring_of_regen"] = "Ring of Regen"
zItemPanel.items["item_robe"] = "Robe of the Magi"
zItemPanel.items["item_relic"] = "Sacred Relic"
zItemPanel.items["item_sobi_mask"] = "Sage's Mask"
zItemPanel.items["item_ward_sentry"] = "Sentry Ward"
zItemPanel.items["item_shadow_amulet"] = "Shadow Amulet"
zItemPanel.items["item_slippers"] = "Slippers of Agility"
zItemPanel.items["item_smoke_of_deceit"] = "Smoke of Deceit"
zItemPanel.items["item_staff_of_wizardry"] = "Staff of Wizardry"
zItemPanel.items["item_stout_shield"] = "Stout Shield"
zItemPanel.items["item_talisman_of_evasion"] = "Talisman of Evasion"
zItemPanel.items["item_tango"] = "Tango"
zItemPanel.items["item_tango_single"] = "Tango (Shared)"
zItemPanel.items["item_tome_of_knowledge"] = "Tome of Knowledge"
zItemPanel.items["item_tpscroll"] = "Town Portal Scroll"
zItemPanel.items["item_ultimate_orb"] = "Ultimate Orb"
zItemPanel.items["item_vitality_booster"] = "Vitality Booster"
zItemPanel.items["item_void_stone"] = "Void Stone"
zItemPanel.items["item_wind_lace"] = "Wind Lace"
zItemPanel.items["item_abyssal_blade"] = "Abyssal Blade"
zItemPanel.items["item_aether_lens"] = "Aether Lens"
zItemPanel.items["item_ultimate_scepter"] = "Aghanim's Scepter"
zItemPanel.items["item_arcane_boots"] = "Arcane Boots"
zItemPanel.items["item_armlet"] = "Armlet of Mordiggian"
zItemPanel.items["item_assault"] = "Assault Cuirass"
zItemPanel.items["item_bfury"] = "Battle Fury"
zItemPanel.items["item_black_king_bar"] = "Black King Bar"
zItemPanel.items["item_blade_mail"] = "Blade Mail"
zItemPanel.items["item_bloodstone"] = "Bloodstone"
zItemPanel.items["item_bloodthorn"] = "Bloodthorn"
zItemPanel.items["item_travel_boots"] = "Boots of Travel"
zItemPanel.items["item_travel_boots_1"] = "Boots of Travel1"
zItemPanel.items["item_travel_boots_2"] = "Boots of Travel2"
zItemPanel.items["item_bracer"] = "Bracer"
zItemPanel.items["item_buckler"] = "Buckler"
zItemPanel.items["item_butterfly"] = "Butterfly"
zItemPanel.items["item_crimson_guard"] = "Crimson Guard"
zItemPanel.items["item_lesser_crit"] = "Crystalys"
zItemPanel.items["item_greater_crit"] = "Daedalus"
zItemPanel.items["item_dagon_#"] = "Dagon2"
zItemPanel.items["item_desolator"] = "Desolator"
zItemPanel.items["item_diffusal_blade"] = "Diffusal Blade"
zItemPanel.items["item_diffusal_blade_1"] = "Diffusal Blade1"
zItemPanel.items["item_diffusal_blade_2"] = "Diffusal Blade2"
zItemPanel.items["item_dragon_lance"] = "Dragon Lance"
zItemPanel.items["item_ancient_janggo"] = "Drum of Endurance"
zItemPanel.items["item_echo_sabre"] = "Echo Sabre"
zItemPanel.items["item_ethereal_blade"] = "Ethereal Blade"
zItemPanel.items["item_cyclone"] = "Eul's Scepter of Divinity"
zItemPanel.items["item_skadi"] = "Eye of Skadi"
zItemPanel.items["item_force_staff"] = "Force Staff"
zItemPanel.items["item_glimmer_cape"] = "Glimmer Cape"
zItemPanel.items["item_guardian_greaves"] = "Guardian Greaves"
zItemPanel.items["item_hand_of_midas"] = "Hand of Midas"
zItemPanel.items["item_headdress"] = "Headdress"
zItemPanel.items["item_heart"] = "Heart of Tarrasque"
zItemPanel.items["item_heavens_halberd"] = "Heaven's Halberd"
zItemPanel.items["item_helm_of_the_dominator"] = "Helm of the Dominator"
zItemPanel.items["item_hood_of_defiance"] = "Hood of Defiance"
zItemPanel.items["item_hurricane_pike"] = "Hurricane Pike"
zItemPanel.items["item_iron_talon"] = "Iron Talon"
zItemPanel.items["item_sphere"] = "Linken's Sphere"
zItemPanel.items["item_lotus_orb"] = "Lotus Orb"
zItemPanel.items["item_maelstrom"] = "Maelstrom"
zItemPanel.items["item_magic_wand"] = "Magic Wand"
zItemPanel.items["item_manta"] = "Manta Style"
zItemPanel.items["item_mask_of_madness"] = "Mask of Madness"
zItemPanel.items["item_medallion_of_courage"] = "Medallion of Courage"
zItemPanel.items["item_mekansm"] = "Mekansm"
zItemPanel.items["item_mjollnir"] = "Mjollnir"
zItemPanel.items["item_monkey_king_bar"] = "Monkey King Bar"
zItemPanel.items["item_moon_shard"] = "Moon Shard"
zItemPanel.items["item_necronomicon"] = "Necronomicon"
zItemPanel.items["item_necronomicon_1"] = "Necronomicon1"
zItemPanel.items["item_necronomicon_2"] = "Necronomicon2"
zItemPanel.items["item_necronomicon_3"] = "Necronomicon3"
zItemPanel.items["item_null_talisman"] = "Null Talisman"
zItemPanel.items["item_oblivion_staff"] = "Oblivion Staff"
zItemPanel.items["item_ward_dispenser"] = "Observer and Sentry Wards"
zItemPanel.items["item_octarine_core"] = "Octarine Core"
zItemPanel.items["item_orchid"] = "Orchid Malevolence"
zItemPanel.items["item_pers"] = "Perseverance"
zItemPanel.items["item_phase_boots"] = "Phase Boots"
zItemPanel.items["item_pipe"] = "Pipe of Insight"
zItemPanel.items["item_poor_mans_shield"] = "Poor Man's Shield"
zItemPanel.items["item_power_treads"] = "Power Treads"
zItemPanel.items["item_radiance"] = "Radiance"
zItemPanel.items["item_rapier"] = "Divine Rapier"
zItemPanel.items["item_refresher"] = "Refresher Orb"
zItemPanel.items["item_ring_of_aquila"] = "Ring of Aquila"
zItemPanel.items["item_ring_of_basilius"] = "Ring of Basilius"
zItemPanel.items["item_rod_of_atos"] = "Rod of Atos"
zItemPanel.items["item_sange"] = "Sange"
zItemPanel.items["item_sange_and_yasha"] = "Sange and Yasha"
zItemPanel.items["item_satanic"] = "Satanic"
zItemPanel.items["item_sheepstick"] = "Scythe of Vyse"
zItemPanel.items["item_invis_sword"] = "Shadow Blade"
zItemPanel.items["item_shivas_guard"] = "Shiva's Guard"
zItemPanel.items["item_silver_edge"] = "Silver Edge"
zItemPanel.items["item_basher"] = "Skull Basher"
zItemPanel.items["item_solar_crest"] = "Solar Crest"
zItemPanel.items["item_soul_booster"] = "Soul Booster"
zItemPanel.items["item_soul_ring"] = "Soul Ring"
zItemPanel.items["item_tranquil_boots"] = "Tranquil Boots"
zItemPanel.items["item_urn_of_shadows"] = "Urn of Shadows"
zItemPanel.items["item_vanguard"] = "Vanguard"
zItemPanel.items["item_veil_of_discord"] = "Veil of Discord"
zItemPanel.items["item_vladmir"] = "Vladmir's Offering"
zItemPanel.items["item_wraith_band"] = "Wraith Band"
zItemPanel.items["item_yasha"] = "Yasha"
zItemPanel.items["item_dagon"] = "Dagon"
zItemPanel.items["item_dagon_1"] = "Dagon"
zItemPanel.items["item_dagon_2"] = "Dagon2"
zItemPanel.items["item_dagon_3"] = "Dagon3"
zItemPanel.items["item_dagon_4"] = "Dagon4"
zItemPanel.items["item_dagon_5"] = "Dagon5" 



zItemPanel.items["item_spinner"] = "Spiner" 
zItemPanel.items["item_memolator"] = "Memolator" 
zItemPanel.items["item_mega_spinner"] = "Mega Spinner" 
zItemPanel.items["item_hoverboard"] = "Hoverboard" 
zItemPanel.items["item_boots_of_invisibility"] = "Boots Of Invisibility" 
zItemPanel.items["item_imba_phase_boots_2"] = "Abibas" 
zItemPanel.items["item_memolator2"] = "Memolator2"  
zItemPanel.items["item_memolator3"] = "Memolator3"  
zItemPanel.items["item_baldezh"] = "Baldezh"
zItemPanel.items["item_cosmobaldezh"] = "Cosmobaldezh"
zItemPanel.items["item_superbaldezh"] = "Superbaldezh"
zItemPanel.items["item_uebator"] = "Uebator"
zItemPanel.items["item_mem_sange"] = "Mem Sange"
zItemPanel.items["item_mem_yasha"] = "Mem Yasha"
zItemPanel.items["item_mem_cheburek"] = "Mem Cheburek"
zItemPanel.items["item_mem_chebureksword"] = "Mem ChebureksWord"
zItemPanel.items["item_mem_sange_yasha"] = "Mem Sange Yasha"
zItemPanel.items["item_mem_sange_cheburek"] = "Mem Sange Cheburek"
zItemPanel.items["item_sobolev"] = "Sobolev"
zItemPanel.items["item_larin"] = "Larin"
zItemPanel.items["item_burgers"] = "Burgers"
zItemPanel.items["item_sharoeb"] = "Sharoeb"
zItemPanel.items["item_kolbasa"] = "Kolbasa"
zItemPanel.items["item_ultimate_mem"] = "Aganim Mem"
zItemPanel.items["item_tar2"] = "Tar2"
zItemPanel.items["item_butter2"] = "Bf2"
zItemPanel.items["item_divine_rapier_lapka"] = "Ultra Rapier"
zItemPanel.items["item_pt_mem"] = "Kostil"

zItemPanel.OnAir = false
local offsetPosX = 0
local offsetPosY = 0

function zItemPanel.OnDraw()
	if GUI == nil then return end
	local locx = GUI.Get(zItemPanel.Identity .. "locx")
	local locy = GUI.Get(zItemPanel.Identity .. "locy")
	
	if not GUI.Exist(zItemPanel.Identity) then
		GUI.Initialize(zItemPanel.Identity, GUI.Category.General, zItemPanel.Locale["name"], zItemPanel.Locale["desc"], "paroxysm")
		GUI.AddMenuItem(zItemPanel.Identity, zItemPanel.Identity .. "size", zItemPanel.Locale["size"], GUI.MenuType.Slider, 16, 64, 24)
		GUI.AddMenuItem(zItemPanel.Identity, zItemPanel.Identity .. "cd", zItemPanel.Locale["cd"], GUI.MenuType.CheckBox, 0)

		if (locx == "" or locx == nil) then GUI.Set(zItemPanel.Identity .. "locx", 10) locx = 10 end
		if (locy == "" or locy == nil) then GUI.Set(zItemPanel.Identity .. "locy", 150) locy = 150 end
	end

	
	Renderer.SetDrawColor(255, 255, 255, 255)
    if not GUI.IsEnabled(zItemPanel.Identity) then return true end
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end
	
	local ypos = locy
	local size = GUI.Get(zItemPanel.Identity .. "size")
	local defx, xpos = math.floor(size * 128 / 72)
	local total_heroes = 0
	local max_items = 0
	local iscd = GUI.IsEnabled(zItemPanel.Identity .. "cd")

	for k, hero in pairs(Heroes.GetAll()) do		
		if not NPC.IsIllusion(hero) and Entity.IsHero(hero) and not Entity.IsSameTeam(myHero, hero) then
			ypos = ypos + size + 5
			xpos = defx + locx + 5
			local item_array = {}
			for k, v in pairs(zItemPanel.items) do
				if NPC.HasItem(hero, k, true) then
					local tempName = k
					local item = NPC.GetItem(hero, k, true)
					tempName = tempName:gsub("item_", "")
					local imageHandle = zItemPanel.ItemIcons[tempName]
					if imageHandle == nil then
						imageHandle = Renderer.LoadImage(zItemPanel.IconPath .. tempName .. ".png")
						zItemPanel.ItemIcons[tempName] = imageHandle
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
			local imageHandle = zItemPanel.HeroIcons[tempHeroName]
			if imageHandle == nil then
				imageHandle = Renderer.LoadImage(zItemPanel.HeroPath .. tempHeroName .. ".png")
				zItemPanel.HeroIcons[tempHeroName] = imageHandle
			end
			Renderer.DrawImage(imageHandle, locx, ypos, defx, size )
		end
	end
	
	if total_heroes == 0 then return end
	
	if Input.IsCursorInRect(locx, (locy + size + 5) - 29, max_items - 12, 25) then
		Renderer.SetDrawColor(217, 19, 61, 230)
	else
		Renderer.SetDrawColor(217, 19, 61, 150)
	end
	
	Renderer.DrawFilledRect(locx, (locy + size + 5) - 29, max_items - locx - 2, 25)
	Renderer.SetDrawColor(hex2rgb("#fff"))
	Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, locx + math.ceil((max_items - locx - 2) / 2), ((locy + size + 5) - 29) + 12, "TAP HERE TO MOVE", true)
end

return zItemPanel