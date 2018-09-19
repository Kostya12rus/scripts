local LineSelect = {}

LineSelect.Identity	= "autolineselect"
LineSelect.Locale	= {
	["name"] = {
		["english"] = "AutoLineSelect",
		["russian"] = "АвтоВыборЛинии",
		["chinese"] = "自动线选择"
	},
	["desc"] = {
		["english"] = "You'll be the first who choose this line. v0.2",
		["russian"] = "Вы будете первым кто выберет заданую линию. v0.2",
		["chinese"] = "你会是第一个谁选择这条线。 v0.2"
	},
	["select"] = {
		["english"] = "Select Line",
		["russian"] = "Выберите линию",
		["chinese"] = "选择行"
	},
	["select_hero"] = {
		["english"] = "Select Hero",
		["russian"] = "Выберите героя",
		["chinese"] = "选择英雄"
	},
	["line_select"] = {
		["english"] = {
			[0] = "none",
			[1] = "hard",
			[2] = "mid",
			[3] = "easy",
			[4] = "jungle",
			[5] = "enemy jungle"
		},
		["russian"] = {
			[0] = "никакая",
			[1] = "сложная",
			[2] = "центральная",
			[3] = "легкая",
			[4] = "лес",
			[5] = "вражеский лес"
		},
		["chinese"] = {
			[0] = "没有",
			[1] = "硬",
			[2] = "中线",
			[3] = "易",
			[4] = "林",
			[5] = "敌人的丛林"
		}
	}
}

function LineSelect.OnDraw()
	if GUI == nil or GUIDB == nil then return end

	if not GUI.Exist(LineSelect.Identity) then
		local templist = GUIDB.Heroes

		GUI.Initialize(LineSelect.Identity, GUI.Category.General, LineSelect.Locale["name"], LineSelect.Locale["desc"], "Zerling14")
		GUI.AddMenuItem(LineSelect.Identity, LineSelect.Identity .. "pickedHero", LineSelect.Locale["select_hero"], GUI.MenuType.ImageBox, 1, templist, GUIDB.HeroPath)
		GUI.AddMenuItem(LineSelect.Identity, LineSelect.Identity .. "line_select_option", LineSelect.Locale["select"], GUI.MenuType.SelectBox, LineSelect.Locale["line_select"], { 0 }, 1, nil)
	end

	if GameRules.GetGameState() == 1 and GUI.IsEnabled(LineSelect.Identity) then
		if Player.GetPlayerID(Players.GetLocal()) >= 5 then
			local line = GUI.Get(LineSelect.Identity .. "line_select_option", 1)[1]
			if line == 5 then
				line = 4
			elseif line == 4 then
				line = 5
			elseif line == 3 then
				line = 1
			elseif line == 1 then
				line = 3
			end
			Engine.ExecuteCommand("dota_select_starting_position " .. line)
		else
			Engine.ExecuteCommand("dota_select_starting_position " .. GUI.Get(LineSelect.Identity .. "line_select_option", 1)[1])
		end

		if GUI.Get(LineSelect.Identity .. "pickedHero", 1) == nil then return end

		for k,v in pairs(GUI.Get(LineSelect.Identity .. "pickedHero", 1)) do
			Engine.ExecuteCommand("possible_hero " .. string.sub(v, 15))
		end
	end
end

return LineSelect