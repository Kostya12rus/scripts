local GUIMenu = {}
GUIMenu.Identity = "gui_menu"
GUIMenu.MiscIdentity = "gui_menu_misc"

GUIMenu.HeroWispIdentity = "gui_menu_hero_specific_wisp"
GUIMenu.HeroAxeIdentity = "gui_menu_hero_specific_axe"
GUIMenu.HeroAMIdentity = "gui_menu_hero_specific_am"

GUIMenu.ItemIdentity = "gui_menu_item"
GUIMenu.AwarenessCatIdentity = "gui_menu_catawareness"
GUIMenu.UtilityCatIdentity = "gui_menu_catutility"
GUIMenu.AwarenessIdentity = "gui_menu_awareness"
GUIMenu.UtilityIdentity = "gui_menu_utility"
GUIMenu.UtilityCameraIdentity = "gui_menu_utility_camera"
GUIMenu.UtilityAutoStackIdentity = "gui_menu_utility_autostack"
GUIMenu.JungleIdentity = "gui_menu_jungle_maphack"
GUIMenu.VisibleToEnemyIdentity = "gui_menu_visible_to_enemy"

GUIMenu.Options = {
	ability_cooldown_font_size = Menu.GetOption({"Misc"}, 'Ability Cooldown Font Size'),
	sv_cheats_bypass = Menu.GetOption({"Misc"}, "sv_cheats Bypass"),
	ability_cooldown_esp = Menu.GetOption({"Awareness"}, "Ability Cooldown ESP"),
	illusion_esp = Menu.GetOption({"Awareness"}, "Illusion ESP"),
	mana_bars_mana_esp = Menu.GetOption({"Awareness"}, "Mana Bars / Mana ESP"),
	show_hidden_spells = Menu.GetOption({"Awareness"}, "Show Hidden Spells"),
	show_neutral_spawn_boxes = Menu.GetOption({"Awareness"}, "Show Neutral Spawn Boxes"),
	xp_monitor = Menu.GetOption({"Awareness"}, "XP Monitor"),
	
	auto_dagon = Menu.GetOption({"Item Specific"}, "Auto Dagon"),
	auto_phase_boots = Menu.GetOption({"Item Specific"}, "Auto Phase Boots"),
	medallion_crest_during_attack = Menu.GetOption({"Item Specific"}, "Medallion / Crest During Attack"),
	orchid_during_attack = Menu.GetOption({"Item Specific"}, "Orchid During Attack"),
	treads_switcher = Menu.GetOption({"Item Specific"}, "Treads Switcher"),
	urn_of_shadows_during_attack = Menu.GetOption({"Item Specific"}, "Urn of Shadows During Attack"),
	
	visible_effect_frequency = Menu.GetOption({"Awareness", "Visible to Enemy ESP"}, 'Visible Effect Frequency'),
	visible_effect_type = Menu.GetOption({"Awareness", "Visible to Enemy ESP"}, 'Visible Effect Type'),
	visible_effect_on_allies = Menu.GetOption({"Awareness", "Visible to Enemy ESP"}, 'Visible Effect on Allies'),
	visible_to_enemy_esp = Menu.GetOption({"Awareness", "Visible to Enemy ESP"}, "Visible to Enemy ESP"),
	
	auto_culling_blade_main = Menu.GetOption({"Hero Specific", "Axe"}, "Auto Culling Blade"),
	auto_culling_blade_uses_blink_dagger = Menu.GetOption({"Hero Specific", "Axe"}, "Auto Culling Blade uses Blink Dagger"),
	spirits_aimbot = Menu.GetOption({"Hero Specific", "IO / Wisp"}, "Spirits Aimbot"),
	auto_mana_void = Menu.GetOption({"Hero Specific", "Anti-Mage"}, "Auto Mana Void"),
	
	jungle_maphack_in_game = Menu.GetOption({"Awareness", "Jungle MapHack"}, "Jungle MapHack (in-game)"),
	jungle_maphack_minimap = Menu.GetOption({"Awareness", "Jungle MapHack"}, "Jungle MapHack (minimap)"),
	
	aegis_snatcher = Menu.GetOption({"Utility"}, "Aegis Snatcher"),
	auto_accept_matches = Menu.GetOption({"Utility"}, "Auto Accept Matches"),
	auto_disable = Menu.GetOption({"Utility"}, "Auto Disable"),
	auto_queue = Menu.GetOption({"Utility"}, "Auto Queue"),
	rune_snatcher = Menu.GetOption({"Utility"}, "Rune Snatcher"),
	
	
	camera_hack = Menu.GetOption({"Utility", "Camera"}, "Camera Hack"),
	max_camera_distance = Menu.GetOption({"Utility", "Camera"}, "Max Camera Distance"),
	
	auto_stacker = Menu.GetOption({"Utility", "Auto Stacker"}, "Auto Stacker"),
	show_stack_status = Menu.GetOption({"Utility", "Auto Stacker"}, "Show Stack Status")
}

GUIMenu.Identifiers = {
	ability_cooldown_font_size = GUIMenu.MiscIdentity,
	sv_cheats_bypass = GUIMenu.MiscIdentity,
	
	ability_cooldown_esp = GUIMenu.AwarenessIdentity,
	illusion_esp = GUIMenu.AwarenessIdentity,
	mana_bars_mana_esp = GUIMenu.AwarenessIdentity,
	show_hidden_spells = GUIMenu.AwarenessIdentity,
	show_neutral_spawn_boxes = GUIMenu.AwarenessIdentity,
	xp_monitor = GUIMenu.AwarenessIdentity,
	
	auto_dagon = GUIMenu.ItemIdentity,
	auto_phase_boots = GUIMenu.ItemIdentity,
	medallion_crest_during_attack = GUIMenu.ItemIdentity,
	orchid_during_attack = GUIMenu.ItemIdentity,
	treads_switcher = GUIMenu.ItemIdentity,
	urn_of_shadows_during_attack = GUIMenu.ItemIdentity,
	
	visible_effect_frequency = GUIMenu.VisibleToEnemyIdentity,
	visible_effect_type = GUIMenu.VisibleToEnemyIdentity,
	visible_effect_on_allies = GUIMenu.VisibleToEnemyIdentity,
	visible_to_enemy_esp = GUIMenu.VisibleToEnemyIdentity,
	
	spirits_aimbot = GUIMenu.HeroWispIdentity,
	auto_culling_blade_main = GUIMenu.HeroAxeIdentity,
	auto_culling_blade_uses_blink_dagger = GUIMenu.HeroAxeIdentity,
	auto_mana_void = GUIMenu.HeroAMIdentity,
	
	jungle_maphack_in_game = GUIMenu.JungleIdentity,
	jungle_maphack_minimap = GUIMenu.JungleIdentity,
	
	aegis_snatcher = GUIMenu.UtilityIdentity,
	auto_accept_matches = GUIMenu.UtilityIdentity,
	auto_disable = GUIMenu.UtilityIdentity,
	auto_queue = GUIMenu.UtilityIdentity,
	rune_snatcher = GUIMenu.UtilityIdentity,
	
	camera_hack = GUIMenu.UtilityCameraIdentity,
	max_camera_distance = GUIMenu.UtilityCameraIdentity,
	
	auto_stacker = GUIMenu.UtilityAutoStackIdentity,
	show_stack_status = GUIMenu.UtilityAutoStackIdentity
}

GUIMenu.RequiredVersion = 170930
GUIMenu.Authors = 'kawaii, stephanie'

GUIMenu.Locale = {
	-- Awareness Locale
	["awareness_name"] = {
		["english"] = "Awareness",
		["russian"] = "Осведомленность",
		["chinese"] = "意識"
	},
	["awareness_desc"] = {
		["english"] = "Different awareness settings",
		["russian"] = "Различные настройки уведомлений",
		["chinese"] = "各種通知設置"
	},
	["ability_cooldown_esp"] = {
		["english"] = "Ability Cooldown ESP",
		["russian"] = "Отображать перезарядку способностей",
		["chinese"] = "顯示冷卻能力"
	},
	["ability_cooldown_esp"] = {
		["english"] = "Ability Cooldown ESP",
		["russian"] = "Отображать перезарядку способностей",
		["chinese"] = "顯示冷卻能力"
	},
	["illusion_esp"] = {
		["english"] = "Illusion ESP",
		["russian"] = "Отображать иллюзии",
		["chinese"] = "顯示錯覺"
	},
	["mana_bars_mana_esp"] = {
		["english"] = "Mana Bars / Mana ESP",
		["russian"] = "Отображать ManaBar",
		["chinese"] = "顯示ManaBar"
	},
	["show_hidden_spells"] = {
		["english"] = "Show Hidden Spells",
		["russian"] = "Отображать скрытые способности",
		["chinese"] = "顯示隱藏能力"
	},
	["show_neutral_spawn_boxes"] = {
		["english"] = "Show Neutral Spawn Boxes",
		["russian"] = "Отображать места появления нейтральных крипов",
		["chinese"] = "來訪的野怪的顯示位置"
	},
	["xp_monitor"] = {
		["english"] = "XP Monitor",
		["russian"] = "Отображать количество героев которые получают опыт за убийство крипа",
		["chinese"] = "顯示獲得經驗殺死蠕變的字符數"
	},
	
	-- Jungle MapHack Locale
	["jungle_maphack_name"] = {
		["english"] = "Jungle MapHack",
		["russian"] = "Лесной МапХак",
		["chinese"] = "叢林MapHack"
	},
	["jungle_maphack_desc"] = {
		["english"] = "Show indicator when someone farm forest camp",
		["russian"] = "Показывает индикатор когда лесной лагерь кто-то фармит",
		["chinese"] = "指示燈顯示森林營農場人時"
	},
	["jungle_maphack_in_game"] = {
		["english"] = "Jungle MapHack (in-game)",
		["russian"] = "Лесной мапхак (отображать в игре)",
		["chinese"] = "森林MapHack（遊戲中顯示）"
	},
	["jungle_maphack_minimap"] = {
		["english"] = "Jungle MapHack (minimap)",
		["russian"] = "Лесной мапхак (отображать на карте)",
		["chinese"] = "叢林MapHack（小地圖）"
	},

	-- Visible To Enemy Locale
	["visible_to_enemy_name"] = {
		["english"] = "Visible to Enemy ESP",
		["russian"] = "Видимость для врагов",
		["chinese"] = "敵方ESP可見"
	},
	["visible_to_enemy_desc"] = {
		["english"] = "Creates an effect around you if suddenly your enemies notice you",
		["russian"] = "Создаёт вокруг вас эффект если вдруг враги вас заметили",
		["chinese"] = "它創建你的周圍影響，如果突然你發現敵人"
	},
	["visible_effect_frequency"] = {
		["english"] = "Visible Effect Frequency",
		["russian"] = "Частота видимого эффекта",
		["chinese"] = "可見效應頻率"
	},
	["visible_effect_type"] = {
		["english"] = "Visible Effect Type",
		["russian"] = "Эффект",
		["chinese"] = "效果"
	},
	["visible_effect_on_allies"] = {
		["english"] = "Visible Effect on Allies",
		["russian"] = "Отображать видят ли враги союзников",
		["chinese"] = "顯示看有無盟國敵人"
	},
	["visible_to_enemy_esp"] = {
		["english"] = "Visible to Enemy ESP",
		["russian"] = "Отображать видят ли нас враги",
		["chinese"] = "無論是展示我們的敵人見"
	},

	-- Misc Locale
	["misc_name"] = {
		["english"] = "Misc",
		["russian"] = "Разное",
		["chinese"] = "雜項"
	},
	["misc_desc"] = {
		["english"] = "Different settings",
		["russian"] = "Разные настройки",
		["chinese"] = "不同的設置"
	},
	["ability_cooldown_font_size"] = {
		["english"] = "Ability Cooldown Font Size",
		["russian"] = "Размер шрифта перезарядки способностей",
		["chinese"] = "能力冷卻字體大小"
	},
	["sv_cheats_bypass"] = {
		["english"] = "sv_cheats Bypass",
		["russian"] = "Обход sv_cheats",
		["chinese"] = "sv_cheats 旁路"
	},
	
	-- Item Specific Locale
	["item_name"] = {
		["english"] = "Item Specific",
		["russian"] = "Предметы",
		["chinese"] = "具體項目"
	},
	["item_desc"] = {
		["english"] = "Default Item Specific",
		["russian"] = "Стандартное применение предметов",
		["chinese"] = "默認項目具體"
	},
	["auto_dagon"] = {
		["english"] = "Auto Dagon",
		["russian"] = "Автоприменение Dagon",
		["chinese"] = "汽車 Dagon"
	},
	["medallion_crest_during_attack"] = {
		["english"] = "Medallion / Crest During Attack",
		["russian"] = "Вешать Medallion / Crest в момент атаки",
		["chinese"] = "Medallion / Crest 攻擊期間"
	},
	["orchid_during_attack"] = {
		["english"] = "Orchid During Attack",
		["russian"] = "Вешать Orchid / Bloodthorn в момент атаки",
		["chinese"] = "Orchid 攻擊期間"
	},
	["treads_switcher"] = {
		["english"] = "Treads Switcher",
		["russian"] = "Переключатель ботинок (сила, ловкость, интеллект)",
		["chinese"] = "開關鞋"
	},
	["urn_of_shadows_during_attack"] = {
		["english"] = "Urn of Shadows During Attack",
		["russian"] = "Вешать Urn of Shadows в момент атаки",
		["chinese"] = "Urn of Shadows 攻擊期間"
	},
	
	-- Hero Specific : Axe
	["hero_axe_name"] = {
		["english"] = "Axe",
		["russian"] = "Axe",
		["chinese"] = "Axe"
	},
	["hero_axe_desc"] = {
		["english"] = "Hake Axe",
		["russian"] = "Стандартный Axe",
		["chinese"] = "Hake Axe"
	},
	["auto_culling_blade_main"] = {
		["english"] = "Auto Culling Blade",
		["russian"] = "Автоприменение Culling Blade",
		["chinese"] = "汽車 Culling Blade"
	}
	,
	["auto_culling_blade_uses_blink_dagger"] = {
		["english"] = "Auto Culling Blade uses Blink Dagger",
		["russian"] = "Автоприменение Culling Blade использует даггер",
		["chinese"] = "汽車 Culling Blade 使用 Blink Dagger"
	},
	
	-- Hero Specific : Anti-Mage
	["hero_am_name"] = {
		["english"] = "Anti-Mage",
		["russian"] = "Анти-Маг",
		["chinese"] = "Anti-Mage"
	},
	["hero_am_desc"] = {
		["english"] = "Hake Anti-Mage",
		["russian"] = "Стандартный Анти-Маг",
		["chinese"] = "Hake Anti-Mage"
	},	
	["auto_mana_void"] = {
		["english"] = "Auto Mana Void",
		["russian"] = "Автоприменение Mana Void",
		["chinese"] = "汽車 Mana Void"
	},
	["auto_phase_boots"] = {
		["english"] = "Auto Phase Boots",
		["russian"] = "Автоприменение Phase Boots",
		["chinese"] = "汽車 Phase Boots"
	},
	
	-- Hero Specific : IO / Wisp
	["hero_wisp_name"] = {
		["english"] = "IO / Wisp",
		["russian"] = "IO",
		["chinese"] = "IO"
	},
	["hero_wisp_desc"] = {
		["english"] = "Hake IO",
		["russian"] = "Стандартный IO",
		["chinese"] = "Hake IO"
	},
	["spirits_aimbot"] = {
		["english"] = "Spirits Aimbot",
		["russian"] = "Аимбот",
		["chinese"] = "精靈 Aimbot"
	},
	
	-- Utility
	["utility_name"] = {
		["english"] = "Utility",
		["russian"] = "Дополнительно",
		["chinese"] = "效用"
	},
	["utility_desc"] = {
		["english"] = "Different utility settings",
		["russian"] = "Различные настройки дополнений",
		["chinese"] = "不同的實用設置"
	},
	["aegis_snatcher"] = {
		["english"] = "Aegis Snatcher",
		["russian"] = "Воровать aegis",
		["chinese"] = "Aegis Snatcher"
	},
	["auto_accept_matches"] = {
		["english"] = "Auto Accept Matches",
		["russian"] = "Автоматически принимать игру",
		["chinese"] = "自動接受匹配"
	},
	["auto_disable"] = {
		["english"] = "Auto Disable",
		["russian"] = "Автоотключение",
		["chinese"] = "自動禁用"
	},
	["auto_queue"] = {
		["english"] = "Auto Queue",
		["russian"] = "Авто поиск",
		["chinese"] = "自動隊列"
	},
	
	-- Camera
	["camera_name"] = {
		["english"] = "Camera",
		["russian"] = "Камера",
		["chinese"] = "相機"
	},
	["camera_desc"] = {
		["english"] = "Camera hack",
		["russian"] = "Камерахак",
		["chinese"] = "相機黑客"
	},
	["camera_hack"] = {
		["english"] = "Camera hack",
		["russian"] = "Камерахак",
		["chinese"] = "相機黑客"
	},
	["max_camera_distance"] = {
		["english"] = "Max Camera Distance",
		["russian"] = "Дальность камеры",
		["chinese"] = "最大相機距離"
	},
	["rune_snatcher"] = {
		["english"] = "Rune Snatcher",
		["russian"] = "Подбирать руны",
		["chinese"] = "符文蛇"
	},
		
	-- Auto Stack
	["auto_stacker_name"] = {
		["english"] = "Auto Stacker",
		["russian"] = "Автостакер",
		["chinese"] = "自動堆高車"
	},
	["auto_stacker_desc"] = {
		["english"] = "Will automatically start stacking the nearest camp(s) to your mouse with the units you have selected.\r\nUse the Select Stack Units key to turn your selected units into camp stackers.",
		["russian"] = "Автоматически стакает ближайший к курсору лагерь крипов.",
		["chinese"] = "將使用您選擇的單位自動開始將最近的陣營堆疊到鼠標。\r\n使用“選擇堆疊單位”鍵將所選單位轉入營地堆垛機。"
	},
	["auto_stacker"] = {
		["english"] = "Auto Stacker",
		["russian"] = "Автостакер",
		["chinese"] = "自動堆高車"
	},
	["show_stack_status"] = {
		["english"] = "Show Stack Status",
		["russian"] = "Отображать статус стака",
		["chinese"] = "顯示堆疊狀態"
	}
}

function GUIMenu.OnDraw()
	if GUI == nil then return end
	if not GUI.Exist(GUIMenu.AwarenessCatIdentity) then		
		UpdateData()

		local Cat_Object = {}
		Cat_Object["perfect_name"] = GUIMenu.Locale["awareness_name"]
		Cat_Object["perfect_desc"] = ''
		Cat_Object["perfect_author"] = GUIMenu.Authors
		Cat_Object["iscat"] = true
		Cat_Object["category"] = GUI.Category.General
		GUI.Initialize(GUIMenu.AwarenessCatIdentity, Cat_Object)
		
		local GUI_Awareness_Object = {}
		GUI_Awareness_Object["perfect_name"] = GUIMenu.Locale["awareness_name"]
		GUI_Awareness_Object["perfect_desc"] = GUIMenu.Locale["awareness_desc"]
		GUI_Awareness_Object["perfect_author"] = GUIMenu.Authors
		GUI_Awareness_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Awareness_Object["cat"] = GUIMenu.AwarenessCatIdentity
		GUI_Awareness_Object["switch"] = false
		GUI.Initialize(GUIMenu.AwarenessIdentity, GUI_Awareness_Object)
		GUI.AddMenuItem(GUIMenu.AwarenessIdentity, GUIMenu.AwarenessIdentity .. "ability_cooldown_esp", GUIMenu.Locale["ability_cooldown_esp"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.AwarenessIdentity, GUIMenu.AwarenessIdentity .. "illusion_esp", GUIMenu.Locale["illusion_esp"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.AwarenessIdentity, GUIMenu.AwarenessIdentity .. "mana_bars_mana_esp", GUIMenu.Locale["mana_bars_mana_esp"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.AwarenessIdentity, GUIMenu.AwarenessIdentity .. "show_hidden_spells", GUIMenu.Locale["show_hidden_spells"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.AwarenessIdentity, GUIMenu.AwarenessIdentity .. "show_neutral_spawn_boxes", GUIMenu.Locale["show_neutral_spawn_boxes"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.AwarenessIdentity, GUIMenu.AwarenessIdentity .. "xp_monitor", GUIMenu.Locale["xp_monitor"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)

		-- Misc
		local GUI_Object = {}
		GUI_Object["perfect_name"] = GUIMenu.Locale["misc_name"]
		GUI_Object["perfect_desc"] = GUIMenu.Locale["misc_desc"]
		GUI_Object["perfect_author"] = GUIMenu.Authors
		GUI_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Object["category"] = GUI.Category.General
		GUI_Object["switch"] = false
		GUI.Initialize(GUIMenu.MiscIdentity, GUI_Object)
		GUI.AddMenuItem(GUIMenu.MiscIdentity, GUIMenu.MiscIdentity .. "ability_cooldown_font_size", GUIMenu.Locale["ability_cooldown_font_size"], GUI.MenuType.Slider, 1, 64, 16, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.MiscIdentity, GUIMenu.MiscIdentity .. "sv_cheats_bypass", GUIMenu.Locale["sv_cheats_bypass"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)

		-- Visible to Enemy ESP
		local GUI_VTE_Object = {}
		GUI_VTE_Object["perfect_name"] = GUIMenu.Locale["visible_to_enemy_name"]
		GUI_VTE_Object["perfect_desc"] = GUIMenu.Locale["visible_to_enemy_desc"]
		GUI_VTE_Object["perfect_author"] = GUIMenu.Authors
		GUI_VTE_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_VTE_Object["switch"] = false
		GUI_VTE_Object["cat"] = GUIMenu.AwarenessCatIdentity
		GUI.Initialize(GUIMenu.VisibleToEnemyIdentity, GUI_VTE_Object)
		GUI.AddMenuItem(GUIMenu.VisibleToEnemyIdentity, GUIMenu.VisibleToEnemyIdentity .. "visible_effect_frequency", GUIMenu.Locale["visible_effect_frequency"], GUI.MenuType.Slider, 1, 10, 1, GUIMenu.ValueUpdate)
		local arr  = {
			["english"] = {
				[0] = "Shiva Guard Impact",
				[1] = "Shiva Aura",
				[2] = "Shiva Guard Active",
				[3] = "Dust of appearance",
				[4] = "Teleport End Streak"
			},
			["russian"] = {
				[0] = "Shiva Guard Impact",
				[1] = "Shiva Aura",
				[2] = "Shiva Guard Active",
				[3] = "Dust of appearance",
				[4] = "Teleport End Streak"
			},
			["chinese"] = {
				[0] = "Shiva Guard Impact",
				[1] = "Shiva Aura",
				[2] = "Shiva Guard Active",
				[3] = "Dust of appearance",
				[4] = "Teleport End Streak"
			}
		}
		GUI.AddMenuItem(GUIMenu.VisibleToEnemyIdentity, GUIMenu.VisibleToEnemyIdentity .. "visible_effect_type", GUIMenu.Locale["visible_effect_type"], GUI.MenuType.SelectBox, arr, { 0 }, 1, SelectBoxUpdate)
		GUI.AddMenuItem(GUIMenu.VisibleToEnemyIdentity, GUIMenu.VisibleToEnemyIdentity .. "visible_effect_on_allies", GUIMenu.Locale["visible_effect_on_allies"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.VisibleToEnemyIdentity, GUIMenu.VisibleToEnemyIdentity .. "visible_to_enemy_esp", GUIMenu.Locale["visible_to_enemy_esp"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)

		-- Jungle MapHack
		local GUI_JungleMapHack = {}
		GUI_JungleMapHack["perfect_name"] = GUIMenu.Locale["jungle_maphack_name"]
		GUI_JungleMapHack["perfect_desc"] = GUIMenu.Locale["jungle_maphack_desc"]
		GUI_JungleMapHack["perfect_author"] = GUIMenu.Authors
		GUI_JungleMapHack["perfect_version"] = GUIMenu.RequiredVersion
		GUI_JungleMapHack["switch"] = false
		GUI_JungleMapHack["cat"] = GUIMenu.AwarenessCatIdentity
		GUI.Initialize(GUIMenu.JungleIdentity, GUI_JungleMapHack)

		GUI.AddMenuItem(GUIMenu.JungleIdentity, GUIMenu.JungleIdentity .. "jungle_maphack_in_game", GUIMenu.Locale["jungle_maphack_in_game"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.JungleIdentity, GUIMenu.JungleIdentity .. "jungle_maphack_minimap", GUIMenu.Locale["jungle_maphack_minimap"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		
		-- Item Specific
		local GUI_Item_Object = {}
		GUI_Item_Object["perfect_name"] = GUIMenu.Locale["item_name"]
		GUI_Item_Object["perfect_desc"] = GUIMenu.Locale["item_desc"]
		GUI_Item_Object["perfect_author"] = GUIMenu.Authors
		GUI_Item_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Item_Object["category"] = GUI.Category.Items
		GUI_Item_Object["switch"] = false
		GUI.Initialize(GUIMenu.ItemIdentity, GUI_Item_Object)
		GUI.AddMenuItem(GUIMenu.ItemIdentity, GUIMenu.ItemIdentity .. "auto_dagon", GUIMenu.Locale["auto_dagon"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.ItemIdentity, GUIMenu.ItemIdentity .. "auto_phase_boots", GUIMenu.Locale["auto_phase_boots"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.ItemIdentity, GUIMenu.ItemIdentity .. "medallion_crest_during_attack", GUIMenu.Locale["medallion_crest_during_attack"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.ItemIdentity, GUIMenu.ItemIdentity .. "orchid_during_attack", GUIMenu.Locale["orchid_during_attack"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.ItemIdentity, GUIMenu.ItemIdentity .. "treads_switcher", GUIMenu.Locale["treads_switcher"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.ItemIdentity, GUIMenu.ItemIdentity .. "urn_of_shadows_during_attack", GUIMenu.Locale["urn_of_shadows_during_attack"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		
		-- Hero Specific Anti-Mage
		local GUI_AM_Object = {}
		GUI_AM_Object["perfect_name"] = GUIMenu.Locale["hero_am_name"]
		GUI_AM_Object["perfect_desc"] = GUIMenu.Locale["hero_am_desc"]
		GUI_AM_Object["perfect_author"] = GUIMenu.Authors
		GUI_AM_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_AM_Object["hero"] = GUI.HeroesList['npc_dota_hero_antimage']
		GUI_AM_Object["category"] = GUI.Category.Heroes
		GUI_AM_Object["switch"] = false
		GUI.Initialize(GUIMenu.HeroAMIdentity, GUI_AM_Object)
		GUI.AddMenuItem(GUIMenu.HeroAMIdentity, GUIMenu.HeroAMIdentity .. "auto_mana_void", GUIMenu.Locale["auto_mana_void"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		
		-- Hero Specific Axe
		local GUI_Axe_Object = {}
		GUI_Axe_Object["perfect_name"] = GUIMenu.Locale["hero_axe_name"]
		GUI_Axe_Object["perfect_desc"] = GUIMenu.Locale["hero_axe_desc"]
		GUI_Axe_Object["perfect_author"] = GUIMenu.Authors
		GUI_Axe_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Axe_Object["hero"] = GUI.HeroesList['npc_dota_hero_axe']
		GUI_Axe_Object["category"] = GUI.Category.Heroes
		GUI_Axe_Object["switch"] = false
		GUI.Initialize(GUIMenu.HeroAxeIdentity, GUI_Axe_Object)
		GUI.AddMenuItem(GUIMenu.HeroAxeIdentity, GUIMenu.HeroAxeIdentity .. "auto_culling_blade_main", GUIMenu.Locale["auto_culling_blade_main"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.HeroAxeIdentity, GUIMenu.HeroAxeIdentity .. "auto_culling_blade_uses_blink_dagger", GUIMenu.Locale["auto_culling_blade_uses_blink_dagger"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		
		-- Hero Specific Wisp
		local GUI_Wisp_Object = {}
		GUI_Wisp_Object["perfect_name"] = GUIMenu.Locale["hero_wisp_name"]
		GUI_Wisp_Object["perfect_desc"] = GUIMenu.Locale["hero_wisp_desc"]
		GUI_Wisp_Object["perfect_author"] = GUIMenu.Authors
		GUI_Wisp_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Wisp_Object["hero"] = GUI.HeroesList['npc_dota_hero_wisp']
		GUI_Wisp_Object["category"] = GUI.Category.Heroes
		GUI_Wisp_Object["switch"] = false
		GUI.Initialize(GUIMenu.HeroWispIdentity, GUI_Wisp_Object)
		GUI.AddMenuItem(GUIMenu.HeroWispIdentity, GUIMenu.HeroWispIdentity .. "spirits_aimbot", GUIMenu.Locale["spirits_aimbot"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
			
		local Utiliy_Cat_Object = {}
		Utiliy_Cat_Object["perfect_name"] = GUIMenu.Locale["utility_name"]
		Utiliy_Cat_Object["perfect_desc"] = ''
		Utiliy_Cat_Object["perfect_author"] = GUIMenu.Authors
		Utiliy_Cat_Object["iscat"] = true
		Utiliy_Cat_Object["category"] = GUI.Category.General
		GUI.Initialize(GUIMenu.UtilityCatIdentity, Utiliy_Cat_Object)
		
		local GUI_Utility_Object = {}
		GUI_Utility_Object["perfect_name"] = GUIMenu.Locale["utility_name"]
		GUI_Utility_Object["perfect_desc"] = GUIMenu.Locale["utility_desc"]
		GUI_Utility_Object["perfect_author"] = GUIMenu.Authors
		GUI_Utility_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Utility_Object["cat"] = GUIMenu.UtilityCatIdentity
		GUI_Utility_Object["switch"] = false
		GUI.Initialize(GUIMenu.UtilityIdentity, GUI_Utility_Object)
		GUI.AddMenuItem(GUIMenu.UtilityIdentity, GUIMenu.UtilityIdentity .. "aegis_snatcher", GUIMenu.Locale["aegis_snatcher"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.UtilityIdentity, GUIMenu.UtilityIdentity .. "auto_accept_matches", GUIMenu.Locale["auto_accept_matches"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.UtilityIdentity, GUIMenu.UtilityIdentity .. "auto_disable", GUIMenu.Locale["auto_disable"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.UtilityIdentity, GUIMenu.UtilityIdentity .. "auto_queue", GUIMenu.Locale["auto_queue"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.UtilityIdentity, GUIMenu.UtilityIdentity .. "rune_snatcher", GUIMenu.Locale["rune_snatcher"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		-- GUI.AddMenuItem(GUIMenu.UtilityIdentity, GUIMenu.UtilityIdentity .. "treads_switcher", GUIMenu.Locale["treads_switcher"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)

		local GUI_Utility_Camera_Object = {}
		GUI_Utility_Camera_Object["perfect_name"] = GUIMenu.Locale["camera_name"]
		GUI_Utility_Camera_Object["perfect_desc"] = GUIMenu.Locale["camera_desc"]
		GUI_Utility_Camera_Object["perfect_author"] = GUIMenu.Authors
		GUI_Utility_Camera_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Utility_Camera_Object["cat"] = GUIMenu.UtilityCatIdentity
		GUI_Utility_Camera_Object["switch"] = false
		GUI.Initialize(GUIMenu.UtilityCameraIdentity, GUI_Utility_Camera_Object)
		GUI.AddMenuItem(GUIMenu.UtilityCameraIdentity, GUIMenu.UtilityCameraIdentity .. "camera_hack", GUIMenu.Locale["camera_hack"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.UtilityCameraIdentity, GUIMenu.UtilityCameraIdentity .. "max_camera_distance", GUIMenu.Locale["max_camera_distance"], GUI.MenuType.Slider, 0, 5000, 1500, GUIMenu.ValueUpdate)
		
		local GUI_Utility_AutoStacker_Object = {}
		GUI_Utility_AutoStacker_Object["perfect_name"] = GUIMenu.Locale["auto_stacker_name"]
		GUI_Utility_AutoStacker_Object["perfect_desc"] = GUIMenu.Locale["auto_stacker_desc"]
		GUI_Utility_AutoStacker_Object["perfect_author"] = GUIMenu.Authors
		GUI_Utility_AutoStacker_Object["perfect_version"] = GUIMenu.RequiredVersion
		GUI_Utility_AutoStacker_Object["cat"] = GUIMenu.UtilityCatIdentity
		GUI_Utility_AutoStacker_Object["switch"] = false
		GUI.Initialize(GUIMenu.UtilityAutoStackIdentity, GUI_Utility_AutoStacker_Object)
		GUI.AddMenuItem(GUIMenu.UtilityAutoStackIdentity, GUIMenu.UtilityAutoStackIdentity .. "auto_stacker", GUIMenu.Locale["auto_stacker"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
		GUI.AddMenuItem(GUIMenu.UtilityAutoStackIdentity, GUIMenu.UtilityAutoStackIdentity .. "show_stack_status", GUIMenu.Locale["show_stack_status"], GUI.MenuType.CheckBox, 0, GUIMenu.ValueUpdate)
	end
end

function UpdateData()
	for k, v in pairs(GUIMenu.Options) do
		if k == "visible_effect_type" then
			GUI.Set(GUIMenu.Identifiers[k] .. k, { Menu.GetValue(v) } )
		else
			GUI.Set(GUIMenu.Identifiers[k] .. k, Menu.GetValue(v))
		end
	end
end

function SelectBoxUpdate(identity, value)
	Menu.SetValue(Menu.GetOption({"Awareness", "Visible to Enemy ESP"}, 'Visible Effect Type'), value[1])
end

function GUIMenu.ValueUpdate(identity, value)
	for k, v in pairs(GUIMenu.Identifiers) do
		if strpos(identity, k) ~= false then
			Menu.SetValue(GUIMenu.Options[k], value)
		end
	end		
end

return GUIMenu