local ItemObs = {}
ItemObs.Identity = "item_obs"
ItemObs.Locale = {
	["name"] = {
		["english"] = "Item Observer",
		["russian"] = "Контроль предметов",
		["chinese"] = "物品观察者"
	},
	["desc"] = {
		["english"] = "Shows what items enemy hero had in last time he was seen, notify about items.",
		["russian"] = "Показывает какие предметы имел вражеский герой в последний раз когда был виден, уведомляет о предметах.",
		["chinese"] = "当敌方英雄购买指定物品的时候，他会推送通知栏."
	},
	["size"] = {
		["english"] = "Size",
		["russian"] = "Размер",
		["chinese"] = "大小"
	},
	["show"] = {
		["english"] = "Show item panel",
		["russian"] = "Показывать панель предметов",
		["chinese"] = "显示物品栏面板"
	},
	["cd"] = {
		["english"] = "Show item cooldown",
		["russian"] = "Показывать время перезарядки предмета",
		["chinese"] = "显示物品冷却时间"
	},
	["charges"] = {
		["english"] = "Show item charges",
		["russian"] = "Показывать заряды предметов",
		["chinese"] = "显示物品个数"
	},
	["notify"] = {
		["english"] = "Notify when enemy buy an item",
		["russian"] = "Уведомлять когда противники покупают предмет",
		["chinese"] = "推送物品通知栏"
	},
	["items"] = {
		["english"] = "Items to notify",
		["russian"] = "Уведомлять о предметах",
		["chinese"] = "通知"
	},
	["bought"] = {
		["english"] = "has item",
		["russian"] = "получил предмет",
		["chinese"] = "有物品"
	},
	["time"] = {
		["english"] = "Time to notify",
		["russian"] = "Время уведомления",
		["chinese"] = "通知栏持续时间"
	},
	["above"] = {
		["english"] = "Show items above the hero",
		["russian"] = "Показывать предметы над героем",
		["chinese"] = "显示英雄之上的物品"
	},
	["aboveoffset"] = {
		["english"] = "Offset",
		["russian"] = "Смещением предметов",
		["chinese"] = "对象的位移"
	},
	["opacity"] = {
		["english"] = "Opacity",
		["russian"] = "Непрозрачность",
		["chinese"] = "不透明度"
	},
	["removeopacity"] = {
		["english"] = "Make opaque on mouseover",
		["russian"] = "Сделать непрозрачным при наведении курсора мыши",
		["chinese"] = "使鼠标悬停不透明"
	},
	["itemalert"] = {
		["english"] = "Ping item when click",
		["russian"] = "Пинговать предмет по клику",
		["chinese"] = "Ping项目点击"
	},
	["width"] = {
		["english"] = 240,
		["russian"] = 300,
		["chinese"] = 220
	},
	["author"] = {
		["english"] = 'paroxysm',
		["russian"] = 'paroxysm',
		["chinese"] = 'paroxysm, wwpanbingyi'
	}
} 

ItemObs.IsOpen = false
ItemObs.IconPath = "resource/flash3/images/items/"
ItemObs.ItemIcons = {}
ItemObs.HeroPath = "resource/flash3/images/heroes/"
ItemObs.HeroIcons = {}
ItemObs.OnAir = false

ItemObs.items = {}
ItemObs.items["item_aegis"] = "Aegis of the Immortal"
ItemObs.items["item_courier"] = "Animal Courier"
ItemObs.items["item_boots_of_elves"] = "Band of Elvenskin"
ItemObs.items["item_belt_of_strength"] = "Belt of Strength"
ItemObs.items["item_blade_of_alacrity"] = "Blade of Alacrity"
ItemObs.items["item_blades_of_attack"] = "Blades of Attack"
ItemObs.items["item_blight_stone"] = "Blight Stone"
ItemObs.items["item_blink"] = "Blink Dagger"
ItemObs.items["item_boots"] = "Boots of Speed"
ItemObs.items["item_bottle"] = "Bottle"
ItemObs.items["item_broadsword"] = "Broadsword"
ItemObs.items["item_chainmail"] = "Chainmail"
ItemObs.items["item_cheese"] = "Cheese"
ItemObs.items["item_circlet"] = "Circlet"
ItemObs.items["item_clarity"] = "Clarity"
ItemObs.items["item_claymore"] = "Claymore"
ItemObs.items["item_cloak"] = "Cloak"
ItemObs.items["item_demon_edge"] = "Demon Edge"
ItemObs.items["item_dust"] = "Dust of Appearance"
ItemObs.items["item_eagle"] = "Eaglesong"
ItemObs.items["item_enchanted_mango"] = "Enchanted Mango"
ItemObs.items["item_energy_booster"] = "Energy Booster"
ItemObs.items["item_faerie_fire"] = "Faerie Fire"
ItemObs.items["item_flying_courier"] = "Flying Courier"
ItemObs.items["item_gauntlets"] = "Gauntlets of Strength"
ItemObs.items["item_gem"] = "Gem of True Sight"
ItemObs.items["item_ghost"] = "Ghost Scepter"
ItemObs.items["item_gloves"] = "Gloves of Haste"
ItemObs.items["item_flask"] = "Healing Salve"
ItemObs.items["item_helm_of_iron_will"] = "Helm of Iron Will"
ItemObs.items["item_hyperstone"] = "Hyperstone"
ItemObs.items["item_infused_raindrop"] = "Infused Raindrop"
ItemObs.items["item_branches"] = "Iron Branch"
ItemObs.items["item_javelin"] = "Javelin"
ItemObs.items["item_magic_stick"] = "Magic Stick"
ItemObs.items["item_mantle"] = "Mantle of Intelligence"
ItemObs.items["item_mithril_hammer"] = "Mithril Hammer"
ItemObs.items["item_lifesteal"] = "Morbid Mask"
ItemObs.items["item_mystic_staff"] = "Mystic Staff"
ItemObs.items["item_ward_observer"] = "Observer Ward"
ItemObs.items["item_ogre_axe"] = "Ogre Club"
ItemObs.items["item_orb_of_venom"] = "Orb of Venom"
ItemObs.items["item_platemail"] = "Platemail"
ItemObs.items["item_point_booster"] = "Point Booster"
ItemObs.items["item_quarterstaff"] = "Quarterstaff"
ItemObs.items["item_quelling_blade"] = "Quelling Blade"
ItemObs.items["item_reaver"] = "Reaver"
ItemObs.items["item_ring_of_health"] = "Ring of Health"
ItemObs.items["item_ring_of_protection"] = "Ring of Protection"
ItemObs.items["item_ring_of_regen"] = "Ring of Regen"
ItemObs.items["item_robe"] = "Robe of the Magi"
ItemObs.items["item_relic"] = "Sacred Relic"
ItemObs.items["item_sobi_mask"] = "Sage's Mask"
ItemObs.items["item_ward_sentry"] = "Sentry Ward"
ItemObs.items["item_shadow_amulet"] = "Shadow Amulet"
ItemObs.items["item_slippers"] = "Slippers of Agility"
ItemObs.items["item_smoke_of_deceit"] = "Smoke of Deceit"
ItemObs.items["item_staff_of_wizardry"] = "Staff of Wizardry"
ItemObs.items["item_stout_shield"] = "Stout Shield"
ItemObs.items["item_talisman_of_evasion"] = "Talisman of Evasion"
ItemObs.items["item_tango"] = "Tango"
ItemObs.items["item_tango_single"] = "Tango (Shared)"
ItemObs.items["item_tome_of_knowledge"] = "Tome of Knowledge"
ItemObs.items["item_tpscroll"] = "Town Portal Scroll"
ItemObs.items["item_ultimate_orb"] = "Ultimate Orb"
ItemObs.items["item_vitality_booster"] = "Vitality Booster"
ItemObs.items["item_void_stone"] = "Void Stone"
ItemObs.items["item_wind_lace"] = "Wind Lace"
ItemObs.items["item_abyssal_blade"] = "Abyssal Blade"
ItemObs.items["item_aether_lens"] = "Aether Lens"
ItemObs.items["item_ultimate_scepter"] = "Aghanim's Scepter"
ItemObs.items["item_arcane_boots"] = "Arcane Boots"
ItemObs.items["item_armlet"] = "Armlet of Mordiggian"
ItemObs.items["item_assault"] = "Assault Cuirass"
ItemObs.items["item_bfury"] = "Battle Fury"
ItemObs.items["item_black_king_bar"] = "Black King Bar"
ItemObs.items["item_blade_mail"] = "Blade Mail"
ItemObs.items["item_bloodstone"] = "Bloodstone"
ItemObs.items["item_bloodthorn"] = "Bloodthorn"
ItemObs.items["item_travel_boots"] = "Boots of Travel"
ItemObs.items["item_travel_boots_2"] = "Boots of Travel2"
ItemObs.items["item_bracer"] = "Bracer"
ItemObs.items["item_buckler"] = "Buckler"
ItemObs.items["item_butterfly"] = "Butterfly"
ItemObs.items["item_crimson_guard"] = "Crimson Guard"
ItemObs.items["item_lesser_crit"] = "Crystalys"
ItemObs.items["item_greater_crit"] = "Daedalus"
ItemObs.items["item_desolator"] = "Desolator"
ItemObs.items["item_diffusal_blade"] = "Diffusal Blade"
ItemObs.items["item_diffusal_blade_2"] = "Diffusal Blade2"
ItemObs.items["item_dragon_lance"] = "Dragon Lance"
ItemObs.items["item_ancient_janggo"] = "Drum of Endurance"
ItemObs.items["item_echo_sabre"] = "Echo Sabre"
ItemObs.items["item_ethereal_blade"] = "Ethereal Blade"
ItemObs.items["item_cyclone"] = "Eul's Scepter of Divinity"
ItemObs.items["item_skadi"] = "Eye of Skadi"
ItemObs.items["item_force_staff"] = "Force Staff"
ItemObs.items["item_glimmer_cape"] = "Glimmer Cape"
ItemObs.items["item_guardian_greaves"] = "Guardian Greaves"
ItemObs.items["item_hand_of_midas"] = "Hand of Midas"
ItemObs.items["item_headdress"] = "Headdress"
ItemObs.items["item_heart"] = "Heart of Tarrasque"
ItemObs.items["item_heavens_halberd"] = "Heaven's Halberd"
ItemObs.items["item_helm_of_the_dominator"] = "Helm of the Dominator"
ItemObs.items["item_hood_of_defiance"] = "Hood of Defiance"
ItemObs.items["item_hurricane_pike"] = "Hurricane Pike"
ItemObs.items["item_iron_talon"] = "Iron Talon"
ItemObs.items["item_sphere"] = "Linken's Sphere"
ItemObs.items["item_lotus_orb"] = "Lotus Orb"
ItemObs.items["item_maelstrom"] = "Maelstrom"
ItemObs.items["item_magic_wand"] = "Magic Wand"
ItemObs.items["item_manta"] = "Manta Style"
ItemObs.items["item_mask_of_madness"] = "Mask of Madness"
ItemObs.items["item_medallion_of_courage"] = "Medallion of Courage"
ItemObs.items["item_mekansm"] = "Mekansm"
ItemObs.items["item_mjollnir"] = "Mjollnir"
ItemObs.items["item_monkey_king_bar"] = "Monkey King Bar"
ItemObs.items["item_moon_shard"] = "Moon Shard"
ItemObs.items["item_necronomicon"] = "Necronomicon"
ItemObs.items["item_necronomicon_2"] = "Necronomicon2"
ItemObs.items["item_necronomicon_3"] = "Necronomicon3"
ItemObs.items["item_null_talisman"] = "Null Talisman"
ItemObs.items["item_oblivion_staff"] = "Oblivion Staff"
ItemObs.items["item_ward_dispenser"] = "Observer and Sentry Wards"
ItemObs.items["item_octarine_core"] = "Octarine Core"
ItemObs.items["item_orchid"] = "Orchid Malevolence"
ItemObs.items["item_pers"] = "Perseverance"
ItemObs.items["item_phase_boots"] = "Phase Boots"
ItemObs.items["item_pipe"] = "Pipe of Insight"
ItemObs.items["item_poor_mans_shield"] = "Poor Man's Shield"
ItemObs.items["item_power_treads"] = "Power Treads"
ItemObs.items["item_radiance"] = "Radiance"
ItemObs.items["item_rapier"] = "Divine Rapier"
ItemObs.items["item_refresher"] = "Refresher Orb"
ItemObs.items["item_ring_of_aquila"] = "Ring of Aquila"
ItemObs.items["item_ring_of_basilius"] = "Ring of Basilius"
ItemObs.items["item_rod_of_atos"] = "Rod of Atos"
ItemObs.items["item_sange"] = "Sange"
ItemObs.items["item_sange_and_yasha"] = "Sange and Yasha"
ItemObs.items["item_satanic"] = "Satanic"
ItemObs.items["item_sheepstick"] = "Scythe of Vyse"
ItemObs.items["item_invis_sword"] = "Shadow Blade"
ItemObs.items["item_shivas_guard"] = "Shiva's Guard"
ItemObs.items["item_silver_edge"] = "Silver Edge"
ItemObs.items["item_basher"] = "Skull Basher"
ItemObs.items["item_solar_crest"] = "Solar Crest"
ItemObs.items["item_soul_booster"] = "Soul Booster"
ItemObs.items["item_soul_ring"] = "Soul Ring"
ItemObs.items["item_tranquil_boots"] = "Tranquil Boots"
ItemObs.items["item_urn_of_shadows"] = "Urn of Shadows"
ItemObs.items["item_vanguard"] = "Vanguard"
ItemObs.items["item_veil_of_discord"] = "Veil of Discord"
ItemObs.items["item_vladmir"] = "Vladmir's Offering"
ItemObs.items["item_wraith_band"] = "Wraith Band"
ItemObs.items["item_yasha"] = "Yasha"
ItemObs.items["item_dagon"] = "Dagon"
ItemObs.items["item_dagon_2"] = "Dagon2"
ItemObs.items["item_dagon_3"] = "Dagon3"
ItemObs.items["item_dagon_4"] = "Dagon4"
ItemObs.items["item_dagon_5"] = "Dagon5" 

local offsetPosX = 0
local offsetPosY = 0

ItemObs.UsedItems = {}

function ItemObs.OnDraw()
	if GUI == nil then return end
	local locx = GUI.Get(ItemObs.Identity .. "locx")
	local locy = GUI.Get(ItemObs.Identity .. "locy")
	
	if not GUI.Exist(ItemObs.Identity) then
		local GUI_Object = {}
		GUI_Object["perfect_name"] = ItemObs.Locale["name"]
		GUI_Object["perfect_desc"] = ItemObs.Locale["desc"]
		GUI_Object["perfect_author"] = ItemObs.Locale["author"]
		GUI_Object["perfect_version"] = 170826
		GUI_Object["category"] = GUI.Category.General
		GUI.Initialize(ItemObs.Identity, GUI_Object)
		
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "notify", ItemObs.Locale["notify"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "items", ItemObs.Locale["items"], 
			GUI.MenuType.ImageBox, Length(ItemObs.items), ItemObs.items, ItemObs.IconPath, "item_", 32, 24, nil, 21)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "time", ItemObs.Locale["time"], GUI.MenuType.Slider, 3, 60, 10)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "show", ItemObs.Locale["show"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "size", ItemObs.Locale["size"], GUI.MenuType.Slider, 16, 64, 24)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "cd", ItemObs.Locale["cd"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "charges", ItemObs.Locale["charges"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "above", ItemObs.Locale["above"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "aboveoffset", ItemObs.Locale["aboveoffset"], GUI.MenuType.Slider, 25, 200, 55)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "opacity", ItemObs.Locale["opacity"], GUI.MenuType.Slider, 1, 100, 100)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "itemalert", ItemObs.Locale["itemalert"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(ItemObs.Identity, ItemObs.Identity .. "removeopacity", ItemObs.Locale["removeopacity"], GUI.MenuType.CheckBox, 1)

		if (locx == "" or locx == nil) then GUI.Set(ItemObs.Identity .. "locx", 10) locx = 10 end
		if (locy == "" or locy == nil) then GUI.Set(ItemObs.Identity .. "locy", 150) locy = 150 end
	end

	if ItemObs.OnAir then 
		local mx, my = Input.GetCursorPos()
		GUI.Set(ItemObs.Identity .. "locx", mx - offsetPosX)
		GUI.Set(ItemObs.Identity .. "locy", my - offsetPosY)
		if tonumber(GUI.Get(ItemObs.Identity .. "locx")) < 1 then GUI.Set(ItemObs.Identity .. "locx", 1) end
		if tonumber(GUI.Get(ItemObs.Identity .. "locy")) < 1 then GUI.Set(ItemObs.Identity .. "locy", 1) end
	end

	local opsett = GUI.Get(ItemObs.Identity .. "opacity")
	local isping = GUI.IsEnabled(ItemObs.Identity .. "itemalert")

	local opcolor = math.floor( ( 255 / 100 ) * opsett )
	local opcolor_less = math.floor( ( 200 / 100 ) * opsett )
	
    if not GUI.IsEnabled(ItemObs.Identity) then return true end
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end

	if GUI.SelectedLanguage == nil then return end
	
	local show = GUI.IsEnabled(ItemObs.Identity .. "show")
	local isremop = GUI.IsEnabled(ItemObs.Identity .. "removeopacity")
	local size = GUI.Get(ItemObs.Identity .. "size")
	local defx, xpos = math.floor(size * 128 / 72)
	local ypos = locy
	local aboveoffset = GUI.Get(ItemObs.Identity .. "aboveoffset")
	local iscd = GUI.IsEnabled(ItemObs.Identity .. "cd")
	local iscrg = GUI.IsEnabled(ItemObs.Identity .. "charges")
	local isnotify = GUI.IsEnabled(ItemObs.Identity .. "notify")
	local notify_items = GUI.Get(ItemObs.Identity .. "items", 1)
	local tts = GUI.Get(ItemObs.Identity .. "time")
	local title = ItemObs.Locale["bought"][GUI.SelectedLanguage]
	local width = ItemObs.Locale["width"][GUI.SelectedLanguage]
	local above = GUI.IsEnabled(ItemObs.Identity .. "above")


	for k, hero in pairs(Heroes.GetAll()) do
		if hero ~= nil and not NPC.IsIllusion(hero) and Entity.IsHero(hero) and not Entity.IsSameTeam(myHero, hero) then
			ypos = ypos + size
			xpos = defx + locx + 5
			
			local top = opcolor
			local top_less = opcolor_less
			Renderer.SetDrawColor(255, 255, 255, opcolor)

			local tempHeroName = NPC.GetUnitName(hero):gsub("npc_dota_hero_", "")
			local heroImageHandle = ItemObs.HeroIcons[tempHeroName]
			if heroImageHandle == nil then
				heroImageHandle = Renderer.LoadImage(ItemObs.HeroPath .. tempHeroName .. ".png")
				ItemObs.HeroIcons[tempHeroName] = heroImageHandle
			end
			
			local heroPos = Entity.GetAbsOrigin(hero)
			local heroZ = NPC.GetHealthBarOffset(hero)
			heroPos:SetZ(heroPos:GetZ() + heroZ)

			local heroX, heroY, heroV = Renderer.WorldToScreen(heroPos)
			heroX = heroX - math.floor((size + 8) * 3)
			local drawHeroY = heroY - size - aboveoffset
			local isAbove = false
			
			if isremop then
				if Input.IsCursorInRect(locx, ypos, ((size + 8) * 6) + 5 + defx, size ) then
					top = 255
					top_less = 200
					Renderer.SetDrawColor(255, 255, 255, 255)
				end
			end
			
			if above and heroV and not Entity.IsDormant(hero) and Entity.IsAlive(hero) then
				isAbove = true
				Renderer.SetDrawColor(0, 0, 0, opcolor_less)
				Renderer.DrawFilledRect(heroX - 2, drawHeroY - 2, math.floor((size + 8) * 6) + 4, size + 4)
				Renderer.SetDrawColor(255, 255, 255, top)
			end
			
			for i = 0, 5 do 
				local item = NPC.GetItemByIndex(hero, i)
				if item ~= nil and Entity.IsAbility(item) then
					local tempName = Ability.GetName(item)
					tempName = tempName:gsub("item_", "")
					
					local imageHandle = ItemObs.ItemIcons[tempName]
					if imageHandle == nil then
						imageHandle = Renderer.LoadImage(ItemObs.IconPath .. tempName .. ".png")
						ItemObs.ItemIcons[tempName] = imageHandle
					end
					if isnotify then
						ItemObs.Notify(item, notify_items, Ability.GetName(item), title, width, tts, imageHandle, heroImageHandle)
					end
					
					if show then
						Renderer.SetDrawColor(255, 255, 255, top)
						Renderer.DrawImage(imageHandle, xpos, ypos, size + 8, size)
					end
					
					if isAbove then
						Renderer.SetDrawColor(255, 255, 255, opcolor)
						Renderer.DrawImage(imageHandle, heroX, drawHeroY, size + 8, size)
					end
					
					if (show and Input.IsCursorInRect(xpos, ypos, size + 8, size)) or (isAbove and Input.IsCursorInRect(heroX, drawHeroY, size + 8, size)) then
						if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) and isping then 
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PING_ABILITY, 0, Vector(), item, 0, nil)
						end
					end
					
					local cd = math.ceil(Ability.GetCooldown(item))
					local crg = Item.GetCurrentCharges(item)
					if (crg > 0 and iscrg) or (cd > 0 and iscd) then
						if show then
							Renderer.SetDrawColor(0, 0, 0, top_less)
							Renderer.DrawFilledRect(xpos, ypos, size + 8, size)
						end
						
						if isAbove then
							Renderer.SetDrawColor(0, 0, 0, opcolor_less)
							Renderer.DrawFilledRect(heroX, drawHeroY, size + 8, size)
						end
						
						local d = crg
						if cd > 0 and iscd then d = cd end
						
						if show then
							Renderer.SetDrawColor(255, 255, 255, top)
							Renderer.DrawTextCentered(GUI.Font.ContentBold, xpos + math.ceil((size + 8) / 2), ypos + math.ceil(size / 2), d, true)
						end
						
						if isAbove then
							Renderer.SetDrawColor(255, 255, 255, opcolor)
							Renderer.DrawTextCentered(GUI.Font.ContentBold, heroX + math.ceil((size + 8) / 2), drawHeroY + math.ceil(size / 2), d, true)
						end
					end
					
				end
				
				xpos = xpos + size + 8
				heroX = heroX + size + 8
			end
			
			if show then
				if Input.IsCursorInRect(locx, ypos, defx, size) then
					if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then 
						local mx, my = Input.GetCursorPos()
						offsetPosX = mx - locx
						offsetPosY = my - locy
						if ItemObs.OnAir then ItemObs.OnAir = false else ItemObs.OnAir = true end
					end
				end
				Renderer.SetDrawColor(255, 255, 255, top)
				Renderer.DrawImage(heroImageHandle, locx, ypos, defx, size )
			end
		end
	end
end

function ItemObs.Notify(item, notify_items, name, ttl, wdt, tts, imageHandle, heroImageHandle)
	local item_index = Ability.GetIndex(item)
	
	if	not hasValue(ItemObs.UsedItems, item_index)
		and hasValue(notify_items, name) 
	then
		local Notification = {}
		Notification.identity = ItemObs.Identity
		
		local title = {}
		title.text = ttl
		title.color = 'fff'

		Notification.title = title
		Notification.text = nil
		Notification.time = tts
		Notification.width = wdt

		local img_1 = heroImageHandle
		local image_1 = {}
		image_1.img = img_1
		image_1.w = 57
		image_1.h = 32
		
		local img_2 = imageHandle
		local image_2 = {}
		image_2.img = img_2
		image_2.w = 44
		image_2.h = 32
		
		Notification.img_1 = image_1
		Notification.img_2 = image_2
		
		GUI.AddNotification(Notification)
		table.insert(ItemObs.UsedItems, item_index)
	end
end

return ItemObs
