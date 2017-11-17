GUI = {}
GUI.Enabled = Menu.AddOption({ "GUI" }, "Enable", "")
GUI.InGameMenu = Menu.AddOption({ "GUI" }, "In-game menu", "")
GUI.Key = Menu.AddKeyOption({ "GUI" }, "Key", Enum.ButtonCode.KEY_BACKQUOTE)
GUI.Locale =  Menu.AddOption({ "GUI"}, "Localization", "Select your primary language", 1, 3 )
Menu.SetValueName(GUI.Locale, 1, "English")
Menu.SetValueName(GUI.Locale, 2, "Russian")
Menu.SetValueName(GUI.Locale, 3, "Chinese")
GUI.SelectedTheme =  Menu.AddOption({ "GUI"}, "Theme", "Select GUI theme", 1, 3 )
Menu.SetValueName(GUI.SelectedTheme, 1, "Default")
Menu.SetValueName(GUI.SelectedTheme, 2, "Dark")
Menu.SetValueName(GUI.SelectedTheme, 3, "Mono")
GUI.Languages = {
	[1] = "english",
	[2] = "russian",
	[3] = "chinese"
}
GUI.SelectedMenu = ":about"
GUI.TempSelectedMenu = ""
GUI.SelectedCategory = 0
GUI.SelectedLanguage = nil
GUI.SelectedMenuPage = 0
GUI.CurrentKey = ""
GUI.Items = {}
GUI.Font = {}
GUI.Font.Menu = Renderer.LoadFont("Arial", 17, Enum.FontWeight.BOLD)
GUI.Font.Content = Renderer.LoadFont("Arial", 18, Enum.FontWeight.BOLD)
GUI.Font.ContentBold = Renderer.LoadFont("Arial", 17, Enum.FontWeight.BOLD)
GUI.Font.ContentSmallBold = Renderer.LoadFont("Arial", 15, Enum.FontWeight.BOLD)
GUI.Font.UltraSmallBold = Renderer.LoadFont("Arial", 11, Enum.FontWeight.BOLD)
GUI.Font.Header = Renderer.LoadFont("Arial", 19, Enum.FontWeight.BOLD)
GUI.Font.Search = Renderer.LoadFont("Arial", 30, Enum.FontWeight.MEDIUM)
GUI.Font.Footer = Renderer.LoadFont("Arial", 17, Enum.FontWeight.MEDIUM)
GUI.GameState = -2
GUI.Config = "GUI"
GUI.Version = 171116
GUI.TextVersion = 'v 17.11.16'

GUI.GameStates = {}
GUI.GameStates.OnGameMenu = -1
GUI.GameStates.OnLobbyPreload = 0
GUI.GameStates.OnLobbyLoad = 1
GUI.GameStates.OnLobbyChoose = 2
GUI.GameStates.OnLobbyChoosed = 3
GUI.GameStates.OnGamePreStart = 4
GUI.GameStates.OnGameStart = 5
GUI.GameStates.OnGameEnd = 6
GUI.GameStates.OnGameStateChanged = 7

GUI.TimeOutPause = {}
GUI.TimeOut = {}
GUI.Pause = {}

GUI.MenuType = {}
GUI.MenuType.CheckBox = 0
GUI.MenuType.TextBox = 1
GUI.MenuType.ImageBox = 2
GUI.MenuType.Label = 3
GUI.MenuType.Key = 4
GUI.MenuType.Button = 5
GUI.MenuType.Slider = 6
GUI.MenuType.OrderBox = 7
GUI.MenuType.SelectBox = 8

GUI.DEBUG = {}
GUI.DEBUG.Enabled = false
GUI.DEBUG.Variables = {}

GUI.Actions = {}
GUI.Actions.MoveHeader = false

GUI.Theme = {}
GUI.Theme.Background = nil
GUI.Theme.MenuInActive = nil
GUI.Theme.MenuOnMouse = nil
GUI.Theme.MenuActive = nil
GUI.Theme.CheckBoxInActive = nil
GUI.Theme.CheckBoxOnMouse = nil
GUI.Theme.CheckBoxActive = nil
GUI.Theme.TextBoxInActive = nil
GUI.Theme.TextBoxActive = nil
GUI.Theme.NextInActive = nil
GUI.Theme.NextActive = nil
GUI.Theme.PrevInActive = nil
GUI.Theme.PrevActive = nil
GUI.Theme.MenuCatActive = nil
GUI.Theme.MenuNextActive = nil
GUI.Theme.MenuPrevActive = nil
GUI.Theme.KeyBox = nil
GUI.Theme.Button = {}
GUI.Theme.Button.InActive = {}
GUI.Theme.Button.InActive.Left = nil
GUI.Theme.Button.InActive.Center = nil
GUI.Theme.Button.InActive.Right = nil
GUI.Theme.Button.Active = {}
GUI.Theme.Button.Active.Left = nil
GUI.Theme.Button.Active.Center = nil
GUI.Theme.Button.Active.Right = nil
GUI.Theme.Slider = nil
GUI.Theme.SliderBase = nil
GUI.Theme.SliderFill = nil
GUI.Theme.CheckInActive = nil
GUI.Theme.CheckActive = nil
GUI.Theme.Category = nil
GUI.Theme.Back = nil
GUI.Theme.RadioActive = nil
GUI.Theme.RadioInActive = nil
GUI.Theme.Close = nil
GUI.Theme.Menu = nil

GUI.Settings = {}
GUI.Settings.PosX = -1
GUI.Settings.PosY = -1
GUI.Storage = {}

GUI.Data = {}
GUI.ImageCashe = {}
GUI.CallBackKey = {}
GUI.Subscriptions = {}
GUI.HeroesIconPath = "resource/flash3/images/heroes/"

GUI.Category = {}
GUI.Category.General = 0
GUI.Category.Heroes = 1
GUI.Category.Items = 2
GUI.CategoryName = {
	["english"] = {
		[0] = "General",
		[1] = "Heroes",
		[2] = "Items"
	},
	["russian"] = {
		[0] = "Общие",
		[1] = "Герои",
		[2] = "Предметы"
	},
	["chinese"] = {
		[0] = "常见",
		[1] = "英雄",
		[2] = "对象"
	}
}
GUI.ActiveCategories = { [0] = false, [1] = false, [2] = false }

GUI.TextValues = {
	["english"] = {
		["changelog"] = "",
		["version_s"] = "This script requires GUI version ",
		["version_e"] = " or higher",
		["page"] = "Page ",
		["of"] = " of ",
		["back"] = "Back",
		["by"] = " by "
	},
	["russian"] = {
		["changelog"] = "",
		["version_s"] = "Данный скрипт требует GUI версии ",
		["version_e"] = " или выше",
		["page"] = "Страница ",
		["of"] = " из ",
		["back"] = "Назад",
		["by"] = " от "
	},
	["chinese"] = {
		["changelog"] = "",
		["version_s"] = "這個腳本需要一個 GUI ",
		["version_e"] = "或更高版本",
		["page"] = "頁 ",
		["of"] = " 從 ",
		["back"] = "前",
		["by"] = " 从 "
	}
}

GUI.ThemeColors = {}
GUI.ThemeColors["Default"] = {
	Accent = "fff",
	Version = "fff",
	HeaderInActive = "fff",
	HeaderActive = "fff",
	Navigation = "7f8fa4",
	Author = "7f8fa4",
	MenuDelimeter = "313d4f"
}
GUI.ThemeColors["Dark"] = {
	Accent = "fff",
	Version = "fff",
	HeaderInActive = "fff",
	HeaderActive = "fff",
	Navigation = "7f8fa4",
	Author = "7f8fa4",
	MenuDelimeter = "313d4f"
}
GUI.ThemeColors["Mono"] = {
	Accent = "fff",
	Version = "fff",
	HeaderInActive = "fff",
	HeaderActive = "fff",
	Navigation = "879999",
	Author = "879999",
	MenuDelimeter = "1f2024"
}
GUI.Colors = {}

GUI.NotifyType = {}
GUI.NotifyType.Text = 0
GUI.NotifyType.ImageText = 1
GUI.NotifyType.ImageTextImage = 2
GUI.Notices = {}

function GUI.Write(text, identity, log)
	identity = identity or GUI.Config
    log = log or true
	if log then Log.Write("[" .. os.date("%X") .. "]\t" .. identity .. "\t->\t" .. text) end
end

function GUI.OnDraw()
	if not Menu.IsEnabled(GUI.Enabled) then return end
	if GUI.SelectedLanguage == nil then 
		GUI.SelectedLanguage = GUI.Languages[Menu.GetValue(GUI.Locale)]
		ApplyTheme()
		
		GUI.Write(GUI.TextVersion)
		GUI.Write(GUI.GetThemeName())
		GUI.Write(GUI.SelectedLanguage)
		GUI.Write("¯\\_(ツ)_/¯")
	end
	
	if Menu.IsKeyDownOnce(GUI.Key) then
		if GUI.IsEnabled("gui:show") then 
			GUI.Set("gui:show", 0)
		else 
			GUI.Set("gui:show", 1)
		end
	end	
	
	for k, v in pairs(GUI.TimeOutPause) do
		if os.clock() >= v then
			GUI.TimeOut[k]()
			GUI.TimeOut = removeValue(GUI.TimeOut, v)
			GUI.TimeOutPause = removeValue(GUI.TimeOutPause, v)
		end
	end
	
	CheckKeys()
	CheckState()
	
	local leftclick = false
	local rightclick = false

	if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then leftclick = true end
	if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_RIGHT) then rightclick = true end


	if GUI.IsEnabled("gui:show") then 
		GUI.Colors = GUI.ThemeColors[GUI.GetThemeName()]
		GUI.Draw(leftclick, rightclick)
	end
	local w, h = Renderer.GetScreenSize()
	DrawNotices(w, h, leftclick)
	
	
	if Engine.IsInGame() and Menu.IsEnabled(GUI.InGameMenu) then 
		local tmi_loc_x = math.floor(w * 0.10)
		local tmi_loc_y = math.floor(h * 0.01)
		local size = math.floor(h * 0.032)
		if Input.IsCursorInRect(tmi_loc_x, tmi_loc_y + 1, size, size) then
			Renderer.SetDrawColor(255, 255, 255, 255)
			if leftclick then
				if GUI.IsEnabled("gui:show") then 
					GUI.Set("gui:show", 0)
				else 
					GUI.Set("gui:show", 1)
				end
			end
		else
			Renderer.SetDrawColor(255, 255, 255, 180)
		end
		Renderer.DrawImage(GUI.Theme.Menu, tmi_loc_x, tmi_loc_y + 1, size, size)
	end
	
	if GUI.DEBUG.Enabled then
		Renderer.SetDrawColor(hex2rgb("#273142"))
		Renderer.DrawFilledRect(w - 300, 0, 300, 25)
		Renderer.SetDrawColor(hex2rgb("#fff"))
		Renderer.DrawText(GUI.Font.ContentSmallBold, w - 290, 5, "DEBUG")
		Renderer.SetDrawColor(0,0,0, 180)
		Renderer.DrawFilledRect(w - 300, 25, 300, h - 25)
		local offset_y = 40
		
		for k,v in pairs(GUI.DEBUG.Variables) do
			Renderer.SetDrawColor(hex2rgb("#fff"))
			Renderer.DrawText(GUI.Font.Header, w - 290, offset_y, k)
			Renderer.SetDrawColor(hex2rgb("#00ff2a"))
			Renderer.DrawText(GUI.Font.Header, w - 100, offset_y, v())
			offset_y = offset_y + 25
		end
		
		Renderer.SetDrawColor(hex2rgb("#fff"))
	end
end

function GUI.OnMenuOptionChange(option, oldValue, newValue)
	if option == GUI.Locale then
		GUI.SelectedLanguage = GUI.Languages[newValue]
	end
	
	if option == GUI.SelectedTheme then
		ApplyTheme()
	end
end

function CheckKeys()
	local current_key = ""
	local down_type = 0
	GUI.CurrentKey = ""
	local skip_array = {55,57,58,59,60,61}
	
	local alphabet = '    0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/*-+ .     ~'

	for i = 5, 62 do
		if not hasValue(skip_array, i) then
			if Input.IsKeyDown(i) then
				current_key = string.sub(alphabet, i, i)
			end
			if Input.IsKeyDownOnce(i) then
				current_key = string.sub(alphabet, i, i)
				down_type = 1
				GUI.CurrentKey = current_key
			end
		end
	end
	
	if Input.IsKeyDown(70) or Input.IsKeyDownOnce(70) then
		GUI.CurrentKey = " "
		current_key = " "
	end

	if Input.IsKeyDownOnce(71) then
		GUI.CurrentKey = "backspace"
	end
	
	if current_key ~= "" then
		for k, v in pairs(GUI.CallBackKey) do
			if current_key == GUI.Data[v["itemcode"]] and v["type"] == down_type then
				GUI.Items[v['menucode']]["items"][v["order"]]["callback"]()
			end
		end
	end
end

function GUI.Exist(code)
	if GUI.Items[code] == nil then return false else return true end
end

function GUI.MenuExist(code, item)
	if GUI.Items[code] == nil then return false end
	local t = GUI.Items[code]["items"]
	
	for k,v in pairs(t) do
		if t[k]["code"] == item then return true end
	end
	
	return false
end

function GUI.Initialize(code, category, name, desc, author, ...)
	if GUI.SelectedLanguage == nil then return end
	local GUI_Object = {}
	GUI.Write(code)
	if type(category) == "table" then
		GUI_Object = category
		
		if type(GUI_Object["perfect_name"]) == "table" then
			GUI_Object["perfect_name"] = category["perfect_name"][GUI.SelectedLanguage]
		end
		
		if type(GUI_Object["perfect_desc"]) == "table" then
			GUI_Object["perfect_desc"] = category["perfect_desc"][GUI.SelectedLanguage]
		end
		
		if type(GUI_Object["perfect_author"]) == "table" then
			GUI_Object["perfect_author"] = category["perfect_author"][GUI.SelectedLanguage]
		end
	else
		if type(name) == "table" then
			if name[GUI.SelectedLanguage] == nil then
				GUI_Object["perfect_name"] = name["english"]
			else
				GUI_Object["perfect_name"] = name[GUI.SelectedLanguage]
			end
		else
			GUI_Object["perfect_name"] = name
		end
		
		if type(desc) == "table" then
			if desc[GUI.SelectedLanguage] == nil then
				GUI_Object["perfect_desc"] = desc["english"]
			else
				GUI_Object["perfect_desc"] = desc[GUI.SelectedLanguage]
			end
		else
			GUI_Object["perfect_desc"] = desc
		end
	
		if select(1, ...) ~= nil then
			GUI_Object["hero"] = GUI.HeroesList[select(1, ...)]
		end
		GUI_Object["perfect_author"] = author
		GUI_Object["perfect_version"] = 0
		GUI_Object["category"] = category		
	end
		
	if GUI_Object["category"] ~= nil then GUI.ActiveCategories[GUI_Object["category"]] = true end
	GUI_Object["page"] = 0
	GUI_Object["prevpage"] = {}
	GUI_Object["items"] = {}
	
	if GUI_Object["hero"] ~= nil then

		local identity = "gui_" .. slug(GUI_Object["hero"])
		if GUI.Items[identity] == nil then
			local GUI_HObject = {}
			GUI_HObject["perfect_name"] = GUI_Object["hero"]
			GUI_HObject["perfect_desc"] = ''
			GUI_HObject["perfect_author"] = ''
			GUI_HObject["iscat"] = true
			GUI_HObject["switch"] = true
			GUI_HObject["category"] = GUI.Category.Heroes
			GUI.Items[identity] = GUI_HObject
		end
		
		GUI_Object = removeKey(GUI_Object, "category")
		GUI_Object["cat"] = identity
	end
	
	if GUI_Object["switch"] == nil then GUI_Object["switch"] = true end
	GUI.Items[code] = GUI_Object
	GUI.Data[code] = 0
end

function GUI.AddMenuItem(menucode, itemcode, name, control, ...)
	if GUI.Items[menucode] == nil then return end
	local order = Length(GUI.Items[menucode]["items"]) + 1
    GUI.Items[menucode]["items"][order] = {}
	if type(name) == "table" then
		if name[GUI.SelectedLanguage] == nil then
			GUI.Items[menucode]["items"][order]["name"] = name["english"]
		else
			GUI.Items[menucode]["items"][order]["name"] = name[GUI.SelectedLanguage]
		end
	else
		GUI.Items[menucode]["items"][order]["name"] = name
	end
    
    GUI.Items[menucode]["items"][order]["type"] = control
    GUI.Items[menucode]["items"][order]["code"] = itemcode
	
	if GUI.MenuType.TextBox == control then
		local temp_data = GUI.Get(itemcode)
		if select(1, ...) == nil then
			GUI.Set(itemcode, "")
		else
			if GUI.Get(itemcode) == nil or temp_data == "" then
				GUI.Set(itemcode, select(1, ...))
			end
		end
		if temp_data ~= nil and temp_data ~= "" then GUI.Set(itemcode, temp_data) end
	elseif GUI.MenuType.CheckBox == control then
		local temp_data = GUI.Get(itemcode)
		if select(1, ...) == nil then
			GUI.Set(itemcode, 0)
		else
			if GUI.Get(itemcode) == nil or temp_data == "" then
				GUI.Set(itemcode, select(1, ...))
			end
		end
		if select(2, ...) ~= nil then
			GUI.Items[menucode]["items"][order]["callback"] = select(2, ...)
		end
		if temp_data ~= nil and temp_data ~= "" then GUI.Set(itemcode, temp_data) end
	elseif GUI.MenuType.Button == control then
		if select(1, ...) ~= nil then
			GUI.Items[menucode]["items"][order]["callback"] = select(1, ...)
		end
		if select(2, ...) == nil then
			GUI.Items[menucode]["items"][order]["width"] = 200
		else
			local size = select(2, ...)
			if type(size) == "table" then
				if size[GUI.SelectedLanguage] == nil then
					GUI.Items[menucode]["items"][order]["width"] = size["english"]
				else
					GUI.Items[menucode]["items"][order]["width"] = size[GUI.SelectedLanguage]
				end
			else
				GUI.Items[menucode]["items"][order]["width"] = size
			end
		end
	elseif GUI.MenuType.Slider == control then
		if select(1, ...) == nil then
			GUI.Items[menucode]["items"][order]["min"] = 1
		else
			GUI.Items[menucode]["items"][order]["min"] = select(1, ...)
		end
		if select(2, ...) == nil then
			GUI.Items[menucode]["items"][order]["max"] = 100
		else
			GUI.Items[menucode]["items"][order]["max"] = select(2, ...)
		end
		local temp_data = GUI.Get(itemcode)
		if select(3, ...) == nil then
			GUI.Set(itemcode, 0)
		else
			if GUI.Get(itemcode) == nil or temp_data == "" then
				GUI.Set(itemcode, select(3, ...))			
			end
		end
		if select(4, ...) ~= nil then
			GUI.Items[menucode]["items"][order]["callback"] = select(4, ...)
		end
		if temp_data ~= nil and temp_data ~= "" then GUI.Set(itemcode, temp_data) end

		
	elseif GUI.MenuType.Key == control then
		local temp_data = GUI.Get(itemcode)
		if select(1, ...) == nil then
			GUI.Set(itemcode, "F")
		else
			if GUI.Get(itemcode) == nil or temp_data == "" then
				GUI.Set(itemcode, select(1, ...))			
			end
		end
		if select(2, ...) ~= nil then
			GUI.CallBackKey[itemcode] = {}
			GUI.CallBackKey[itemcode]["order"] = order
			GUI.CallBackKey[itemcode]["menucode"] = menucode
			GUI.CallBackKey[itemcode]["itemcode"] = itemcode
			GUI.Items[menucode]["items"][order]["callback"] = select(2, ...)
		end
		if select(3, ...) == nil then
			GUI.CallBackKey[itemcode]["type"] = 0
		else
			GUI.CallBackKey[itemcode]["type"] = select(3, ...)
		end
		if temp_data ~= nil and temp_data ~= "" then GUI.Set(itemcode, temp_data) end
		
	elseif GUI.MenuType.SelectBox == control then
		if select(1, ...) == nil then
			GUI.Items[menucode]["items"][order]["list"] = nil
		else
			GUI.Items[menucode]["items"][order]["list"] = select(1, ...)
		end
		if select(2, ...) == nil then
			GUI.Data[itemcode] = {}
		else
			if GUI.Get(itemcode, 1) == nil then
				GUI.Data[itemcode] = select(2, ...)
			end
		end
		if select(3, ...) == nil then
			GUI.Items[menucode]["items"][order]["count"] = 1
		else
			GUI.Items[menucode]["items"][order]["count"] = select(3, ...)
		end
		if select(4, ...) == nil then
			GUI.Items[menucode]["items"][order]["callback"] = nil
		else
			GUI.Items[menucode]["items"][order]["callback"] = select(4, ...)
		end
		local temp_data = GUI.Get(itemcode, 1)
		if temp_data ~= nil then GUI.Data[itemcode] = temp_data end
	elseif GUI.MenuType.ImageBox == control then
		GUI.Data[itemcode] = {}
		local temp_data = GUI.Get(itemcode, 1)
		if temp_data ~= nil then GUI.Data[itemcode] = temp_data end
		GUI.Items[menucode]["items"][order]["count"] = select(1, ...)
		GUI.Items[menucode]["items"][order]["cache"] = {}
		if select(2, ...) == nil then
			GUI.Items[menucode]["items"][order]["heroes"] = GUI.HeroesList
		else
			GUI.Items[menucode]["items"][order]["heroes"] = select(2, ...)
		end
		if select(3, ...) == nil then
			GUI.Items[menucode]["items"][order]["iconpath"] = GUI.HeroesIconPath
		else
			GUI.Items[menucode]["items"][order]["iconpath"] = select(3, ...)
		end
		if select(4, ...) == nil then
			GUI.Items[menucode]["items"][order]["replace"] = "npc_dota_hero_"
		else
			GUI.Items[menucode]["items"][order]["replace"] = select(4, ...)
		end	
		if select(5, ...) == nil then
			GUI.Items[menucode]["items"][order]["size_x"] = math.floor(32 * 128 / 72)
		else
			GUI.Items[menucode]["items"][order]["size_x"] = select(5, ...)
		end	
		if select(6, ...) == nil then
			GUI.Items[menucode]["items"][order]["size_y"] = 32
		else
			GUI.Items[menucode]["items"][order]["size_y"] = select(6, ...)
		end	
		if select(7, ...) ~= nil then
			GUI.Items[menucode]["items"][order]["callback"] = select(7, ...)
		end
		if select(8, ...) ~= nil then
			GUI.Items[menucode]["items"][order]["inrow"] = select(8, ...)
		else
			GUI.Items[menucode]["items"][order]["inrow"] = 12
		end
		
	elseif GUI.MenuType.OrderBox == control then
		GUI.Data[itemcode] = {}
		local temp_data = GUI.Get(itemcode, 1)
		if temp_data ~= nil then GUI.Data[itemcode] = temp_data end
		GUI.Items[menucode]["items"][order]["cache"] = {}
		if select(1, ...) == nil then
			GUI.Items[menucode]["items"][order]["heroes"] = GUI.HeroesList
		else
			GUI.Items[menucode]["items"][order]["heroes"] = select(1, ...)
		end
		if select(2, ...) == nil then
			GUI.Items[menucode]["items"][order]["iconpath"] = GUI.HeroesIconPath
		else
			GUI.Items[menucode]["items"][order]["iconpath"] = select(2, ...)
		end
		if select(3, ...) == nil then
			GUI.Items[menucode]["items"][order]["replace"] = "npc_dota_hero_"
		else
			GUI.Items[menucode]["items"][order]["replace"] = select(3, ...)
		end	
		if select(4, ...) == nil then
			GUI.Items[menucode]["items"][order]["size_x"] = math.floor(32 * 128 / 72)
		else
			GUI.Items[menucode]["items"][order]["size_x"] = select(4, ...)
		end	
		if select(5, ...) == nil then
			GUI.Items[menucode]["items"][order]["size_y"] = 32
		else
			GUI.Items[menucode]["items"][order]["size_y"] = select(5, ...)
		end	
		if select(6, ...) ~= nil then
			GUI.Items[menucode]["items"][order]["callback"] = select(6, ...)
		end
	end
	
end

function GUI.AddNotification(Notification)
    Notification.time = os.clock() + Notification.time
    table.insert(GUI.Notices, Notification)
end

function CheckState()
	if GameRules.GetGameState() ~= GUI.GameState then
		for k, v in pairs(GUI.Subscriptions) do
			if k == GameRules.GetGameState() or k == GUI.GameStates.OnGameStateChanged then
				for tk, tv in pairs(v) do
					tv(GUI.GameState, GameRules.GetGameState())
				end
			end
		end
		GUI.GameState = GameRules.GetGameState()
	end
end

function GUI.Subscribe(identity, action, callback)
	if GUI.Subscriptions[action] == nil then
		GUI.Subscriptions[action] = {}
	end
	GUI.Subscriptions[action][identity] = callback
end

function GUI.RemoveMenuItem(code, item)
	local t = GUI.Items[code]["items"]
	for k,v in pairs(t) do
		if t[k]["code"] == item then 
			table.remove(t, k)
		return end
	end
end

local offsetPosX = 0
local offsetPosY = 0

function GUI.Draw(leftclick, rightclick)
	local work_h = 974
	local work_y = 614
	local workbox_x = 241
	local workbox_y = 44
	local limit_y = 490
	
	local menusize_x = 235
	local menusize_y = 37
	local menufont_offset = 8
	
	local w, h = Renderer.GetScreenSize()
	local startx = math.floor(w / 2) - 487
	local starty = math.floor(h / 2) - 307

	if GUI.Actions.MoveHeader then
		local mx, my = Input.GetCursorPos()
		
		GUI.Set("gui:posx", mx - offsetPosX)
		GUI.Set("gui:posy", my - offsetPosY)
		if tonumber(GUI.Get("gui:posx")) < 1 then GUI.Set("gui:posx", 1) end
		if tonumber(GUI.Get("gui:posy")) < 1 then GUI.Set("gui:posy", 1) end
		if (tonumber(GUI.Get("gui:posx")) + work_h) > w then GUI.Set("gui:posx", w - work_h) end
		if (tonumber(GUI.Get("gui:posy")) + work_y) > h then GUI.Set("gui:posy", h - work_y) end
	end
	
	if GUI.IsEnabled("gui:posx") then
		startx = tonumber(GUI.Get("gui:posx"))
		starty = tonumber(GUI.Get("gui:posy"))
	end
	
	Renderer.SetDrawColor(hex2rgb("#fff"))
	Renderer.DrawImage(GUI.Theme.Background, startx, starty, work_h, work_y)

	Renderer.SetDrawColor(hex2rgb(GUI.Colors.Version))
	Renderer.DrawText(GUI.Font.ContentSmallBold, startx + work_h - 80, starty + 17, GUI.TextVersion, false)
	Renderer.SetDrawColor(hex2rgb("#fff"))

	-- Draw Menu Items
	local nextposition = starty + workbox_y
	local nextlocx = startx
	
	for k,v in pairs(GUI.CategoryName[GUI.SelectedLanguage]) do
		if GUI.ActiveCategories[k] then
			local color = GUI.Colors.HeaderInActive
		
			if	(GUI.SelectedCategory == k) 
			then 
				Renderer.DrawImage(GUI.Theme.MenuCatActive, nextlocx + 6, starty + 5, 100, 38)
				color = GUI.Colors.HeaderActive
			elseif	Input.IsCursorInRect(nextlocx + 6, starty + 6, 100, 38)
			then
				if leftclick then 
					GUI.SelectedCategory = k
					GUI.SelectedMenu = ":about"
					GUI.SelectedMenuPage = 0
				end
				Renderer.SetDrawColor(255,255,255,120)
				Renderer.DrawImage(GUI.Theme.MenuCatActive, nextlocx + 6, starty + 5, 100, 38)
				Renderer.SetDrawColor(255,255,255,255)
				color = GUI.Colors.HeaderActive
			end
			
			Renderer.SetDrawColor(hex2rgb(color))
			Renderer.DrawTextCenteredX(GUI.Font.Header, nextlocx + 56, starty + 15, v, false)
			Renderer.SetDrawColor(hex2rgb("#fff"))
			nextlocx = nextlocx + 100
		end
	end
	
	nextlocx = nextlocx + 6
	
	if leftclick then 
		if GUI.Actions.MoveHeader then
			GUI.Actions.MoveHeader = false
		elseif Input.IsCursorInRect(nextlocx, starty, work_h - (nextlocx - startx), workbox_y) then
			GUI.Actions.MoveHeader = true
			local temp_x, temp_y = Input.GetCursorPos()
			offsetPosX = temp_x - startx
			offsetPosY = temp_y - starty
		end
	end
	
	if GUI.TempSelectedMenu ~= "" then
		GUI.SelectedMenu = GUI.TempSelectedMenu
		GUI.TempSelectedMenu = ""
	end
		
	local temp_table = GUI.Items
	local showonpage = 13
	local c = GUI.SelectedMenuPage
	local i = 0

	if GUI.Items[GUI.SelectedMenu] ~= nil and (GUI.Items[GUI.SelectedMenu]["iscat"] or GUI.Items[GUI.SelectedMenu]["cat"] ~= nil ) then
		local back_to = ":about"
		if GUI.Items[GUI.SelectedMenu]["cat"] ~= nil then
			if GUI.Items[GUI.SelectedMenu]["iscat"] then back_to = GUI.Items[GUI.SelectedMenu]["cat"]
			else
				if GUI.Items[GUI.Items[GUI.SelectedMenu]["cat"]]["cat"] ~= nil then
					back_to = GUI.Items[GUI.Items[GUI.SelectedMenu]["cat"]]["cat"]
				end
			end
		end
		
		DrawMenuItem(back_to, startx + 6, nextposition, menusize_x, menusize_y, GUI.TextValues[GUI.SelectedLanguage]["back"], leftclick, "gui_back")
		nextposition = nextposition + menusize_y
	end

	local temp_val = 0
	for k, v in spairs(temp_table, function(t,a,b) return string.lower(t[a]["perfect_name"]) < string.lower(t[b]["perfect_name"]) end) do 
		if 
			(
				(v["cat"] ~= nil and (GUI.SelectedMenu == v["cat"] or (k == GUI.SelectedMenu and v["iscat"] == nil) ) )
				or ( GUI.Items[GUI.SelectedMenu] ~= nil and GUI.Items[GUI.SelectedMenu]["cat"] ~= nil and GUI.Items[GUI.SelectedMenu]["cat"] == v["cat"] and GUI.Items[GUI.SelectedMenu]["iscat"] == nil  )
				or ( (GUI.SelectedMenu == "" or GUI.SelectedMenu == ":about" or (GUI.Items[GUI.SelectedMenu]["cat"] == nil and GUI.Items[GUI.SelectedMenu]["iscat"] == nil )) and v["category"] ~= nil and GUI.SelectedCategory == v["category"] )
			)
		then
			temp_val = temp_val + 1
			
			if i >= (c * showonpage) and i < ((c + 1) * showonpage) then 
				DrawMenuItem(v, startx + 6, nextposition, menusize_x, menusize_y, v["perfect_name"], leftclick, k)
				nextposition = nextposition + menusize_y
			end
			i = i + 1
		end
	end
	
	local totalpage = math.ceil(temp_val / showonpage)
	if totalpage > 1 then
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.Navigation))
		Renderer.DrawTextCenteredX(GUI.Font.Footer, startx + 120, starty + 536, GUI.TextValues[GUI.SelectedLanguage]["page"] .. (c + 1) .. GUI.TextValues[GUI.SelectedLanguage]["of"] .. totalpage, false)
		Renderer.SetDrawColor(hex2rgb("#fff"))

		if (c + 1) ~= 1 then
			Renderer.SetDrawColor(255, 255, 255, 100)
			if Input.IsCursorInRect(startx + 10, starty + 527, 36, 36) then
				if leftclick then GUI.SelectedMenuPage = GUI.SelectedMenuPage - 1 end 
				Renderer.SetDrawColor(255, 255, 255, 255)
			end
			Renderer.DrawImage(GUI.Theme.MenuPrevActive, startx + 10, starty + 527, 36, 36)
		end
		
		if (c + 1) ~= totalpage then
			Renderer.SetDrawColor(255, 255, 255, 100)
			if Input.IsCursorInRect(startx + 200, starty + 527, 36, 36) then
				if leftclick then GUI.SelectedMenuPage = GUI.SelectedMenuPage + 1 end 
				Renderer.SetDrawColor(255, 255, 255, 255)
			end
			Renderer.DrawImage(GUI.Theme.MenuNextActive, startx + 200, starty + 527, 36, 36)
		end
	end

	Renderer.SetDrawColor(hex2rgb("#fff"))
	
	if GUI.SelectedMenu ~= nil and GUI.SelectedMenu ~= ":about" and GUI.Items[GUI.SelectedMenu]["iscat"] == nil then
		DrawMenuBox(GUI.SelectedMenu, startx, starty, workbox_x, workbox_y, limit_y, leftclick, rightclick)
	end
	
end

function DrawNotices(w, h, leftclick)
	local start_y = math.floor(h * 0.85)
	local min_height = 40

	for k = #GUI.Notices, 1, -1 do
		local v = GUI.Notices[k]
		local width = (v.width ~= nil and v.width or 270)
		local draw_x = width - 15
		local t_draw_x = draw_x

		if v.text == nil then
			v.text = {}
			v.text.text = ''
		end
		local _, count = string.gsub(v.text.text, "\r\n", "")
		count = count + 1

		local xt = 15 * count
		
		start_y = start_y - min_height - 25 - xt
		if start_y < 0 then return end
		Renderer.SetDrawColor(255, 255, 255, 50)
		Renderer.DrawFilledRect(w - width, start_y, width - 20, min_height + xt)
		Renderer.SetDrawColor(0, 0, 0, 225)
		Renderer.DrawFilledRect(w - width + 2, start_y + 2, width - 24, min_height - 4 + xt)
		Renderer.SetDrawColor(hex2rgb('fff'))

		Renderer.DrawText(GUI.Font.UltraSmallBold, w - width, start_y - 15, (v.identity ~= nil and (GUI.Items[v.identity] == nil and v.identity or GUI.Items[v.identity]["perfect_name"]) or ''), false)
		Renderer.DrawImage(GUI.Theme.Close, w - 35, start_y - 15, 10, 10)

		if v.img_1 ~= nil then
			Renderer.DrawImage(v.img_1.img, w - t_draw_x, start_y + 8, v.img_1.w, v.img_1.h)
			t_draw_x = t_draw_x - v.img_1.w - 10
		end
		
		if v.img_2 ~= nil then
			Renderer.DrawImage(v.img_2.img, w - v.img_2.w - 35, start_y + 8, v.img_2.w, v.img_2.h)
		end
		
		if v.title ~= nil and v.title.text ~= '' then
			Renderer.SetDrawColor(hex2rgb(v.title.color))
			Renderer.DrawText(GUI.Font.Content, w - t_draw_x, start_y + 8, v.title.text, false)
		end
		
		if v.text ~= nil and v.text.text ~= '' then
			Renderer.SetDrawColor(hex2rgb(v.text.color))
			Renderer.DrawText(GUI.Font.ContentSmallBold, w - t_draw_x, start_y + 30, v.text.text, false)
		end
		
		if os.clock() > v.time or (Input.IsCursorInRect(w - 35, start_y - 15, 10, 10) and leftclick) then
            table.remove(GUI.Notices, k)
        end
	end
end

function DrawMenuBox(k, startx, starty, workbox_x, workbox_y, limit_y, leftclick, rightclick)
	local v = GUI.Items[k]["perfect_name"]

	if k == GUI.SelectedMenu then
	
		-- Draw Blocks
		DrawText(startx + workbox_x + 20, starty + workbox_y + 14, GUI.Items[k]["perfect_desc"])
		local _, count = string.gsub(GUI.Items[k]["perfect_desc"], "\r\n", "")
		count = count + 1
		local xt = 30 * count
		if xt == 0 then xt = 30 end
		local drawed = 1
		local donotshow = false
		local realshow = 1
		
		if GUI.Items[k]["perfect_version"] ~= nil and GUI.Items[k]["perfect_version"] ~= 0 then
			if GUI.Items[k]["perfect_version"] > GUI.Version then
				Renderer.SetDrawColor(hex2rgb('de3333'))
				Renderer.DrawFilledRect(startx + workbox_x, starty + workbox_y + xt + 10, 725, 40)
				Renderer.SetDrawColor(hex2rgb('fff'))
				Renderer.DrawText(GUI.Font.Header, startx + workbox_x + 20, starty + workbox_y + xt + 20, GUI.TextValues[GUI.SelectedLanguage]["version_s"] .. GUI.Items[k]["perfect_version"] .. GUI.TextValues[GUI.SelectedLanguage]["version_e"], false)
				xt = xt + 40
			end
		end
		
		for i = 1, Length(GUI.Items[k]["items"]) do
			if donotshow then break end
			local value = GUI.Items[k]["items"][i]
			
			-- CHECKBOX
			if value["type"] == GUI.MenuType.CheckBox and GUI.Items[k]["page"] < drawed then
				if xt + 40 < limit_y then
					local inpos = Input.IsCursorInRect(startx + workbox_x + 20, starty + workbox_y + 20 + xt, 28, 28)
					DrawCheckBox(inpos, leftclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, 28, value)
					xt = xt + 40
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- TEXTBOX
			if value["type"] == GUI.MenuType.TextBox and GUI.Items[k]["page"] < drawed then
				if xt + 70 < limit_y then
					local inpos = Input.IsCursorInRect(startx + workbox_x + 20, starty + workbox_y + 20 + xt, 690, 70)
					DrawTextBox(inpos, leftclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, 690, 36, value)
					xt = xt + 70
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- SLIDER
			if value["type"] == GUI.MenuType.Slider and GUI.Items[k]["page"] < drawed then
				if xt + 100 < limit_y then
					DrawSlider(leftclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, value)
					xt = xt + 104
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- IMAGEBOX
			if value["type"] == GUI.MenuType.ImageBox and GUI.Items[k]["page"] < drawed then
				if xt + (32 * math.ceil(Length(value["heroes"]) / value["inrow"])) + 50 < limit_y then
					DrawImageBox(leftclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, value)
					xt = xt + (value["size_y"] * math.ceil(Length(value["heroes"]) / value["inrow"])) + 50
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- ORDERBOX
			if value["type"] == GUI.MenuType.OrderBox and GUI.Items[k]["page"] < drawed then
				if xt + (32 * math.ceil(Length(value["heroes"]) / 12)) + 50 < limit_y then
					DrawOrderBox(false, leftclick, rightclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, value)
					xt = xt + (32 * math.ceil(Length(value["heroes"]) / 12)) + 50
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- SELECTBOX
			if value["type"] == GUI.MenuType.SelectBox and GUI.Items[k]["page"] < drawed then
				if xt + math.ceil(Length(value["list"][GUI.SelectedLanguage]) * 25) + 60 < limit_y then
					DrawSelectBox(leftclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, value)
					xt = xt + math.ceil(Length(value["list"][GUI.SelectedLanguage]) * 25) + 60
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- LABEL
			if value["type"] == GUI.MenuType.Label and GUI.Items[k]["page"] < drawed then
				local _, calculate = string.gsub(value["name"], "\r\n", "")
				calculate = calculate + 1
				if xt + (calculate * 30) < limit_y then
					DrawText(startx + workbox_x + 20, starty + workbox_y + xt + 20, value["name"])
					xt = xt + (calculate * 30)
					realshow = realshow + 1
				else donotshow = true end
			end
			
			-- KEYBOX
			if value["type"] == GUI.MenuType.Key and GUI.Items[k]["page"] < drawed then
				if xt + 70 < limit_y then
					DrawKeyBox(leftclick, startx + workbox_x + 20, starty + workbox_y + xt + 20, 36, 36, value)
					xt = xt + 70
					realshow = realshow + 1
				else donotshow = true end
			end
			 
			-- BUTTON
			if value["type"] == GUI.MenuType.Button and GUI.Items[k]["page"] < drawed then
				if xt + 55 < limit_y then
					DrawButton(startx + workbox_x + 20, starty + workbox_y + xt + 30, value["name"], value["width"],  leftclick, value["callback"])
					xt = xt + 55
					realshow = realshow + 1
				else donotshow = true end
			end
			
			
			if not donotshow then drawed = drawed + 1 end
		end

		
		if donotshow or GUI.Items[k]["page"] ~= 0 then
			Renderer.SetDrawColor(hex2rgb("#fff"))
			DrawPagination(k, leftclick, startx + workbox_x + 620, starty + workbox_y + 470, 36, 36, realshow - 1, Length(GUI.Items[k]["items"]), drawed - 1)
		end
		
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.Author))
		Renderer.DrawText(GUI.Font.Menu, startx + 20, starty + 576, v .. GUI.TextValues[GUI.SelectedLanguage]["by"] .. GUI.Items[k]["perfect_author"], false)
		Renderer.SetDrawColor(hex2rgb("#fff"))

	end
end

function DrawMenuItem(value, x, y, size_x, size_y, name, click, key)
	local background_image = GUI.Theme.MenuInActive
	
	if key == GUI.SelectedMenu then
		background_image = GUI.Theme.MenuActive
	else
		if Input.IsCursorInRect(x + 36, y, size_x - 36, size_y) then
		
			if click then 
				if key == "gui_back" then
					GUI.TempSelectedMenu = value
				else
					GUI.TempSelectedMenu = key
				end
			end
			
			
			background_image = GUI.Theme.MenuOnMouse
		end
	end

	Renderer.DrawImage(background_image, x, y, size_x, size_y)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.Accent))
	Renderer.DrawText(GUI.Font.Menu, x + 46, y + 10, name, false)
	Renderer.SetDrawColor(hex2rgb("#fff"))

	------------------------------------------------------------------------------
	local menu_icon = GUI.Theme.CheckInActive
	if key == "gui_back" then 
		menu_icon = GUI.Theme.Back
	else
		if key ~= nil and value["iscat"] == nil and Input.IsCursorInRect(x, y, 36, 36) and click then	
			if  GUI.IsEnabled(key) then
				GUI.Set(key, 0)
			else
				GUI.Set(key, 1)
			end
			if value["onchange"] ~= nil then
				value["onchange"](key, GUI.Get(key))
			end
		end
		
		if GUI.IsEnabled(key) then menu_icon = GUI.Theme.CheckActive end
		if value["iscat"] ~= nil and value["iscat"] then menu_icon = GUI.Theme.Category end
		if not value["switch"] then menu_icon = GUI.Theme.MenuItem end
	end
	
	
	Renderer.DrawImage(menu_icon, x + 10, y + 10, 16, 16)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.MenuDelimeter))
	Renderer.DrawFilledRect(x + 36, y, 1, size_y)
	Renderer.SetDrawColor(hex2rgb("#fff"))
end

-- CONTROLS

function DrawButton(x,y, text, width, leftclick, callback)
	local inpos = Input.IsCursorInRect(x, y, width + 10, 36)
	Renderer.SetDrawColor(hex2rgb("#fff"))
	local left = GUI.Theme.Button.InActive.Left
	local center = GUI.Theme.Button.InActive.Center
	local right = GUI.Theme.Button.InActive.Right

	if inpos then
		left = GUI.Theme.Button.Active.Left
		center = GUI.Theme.Button.Active.Center
		right = GUI.Theme.Button.Active.Right
		if leftclick then
			callback()
		end
	end
	
	Renderer.DrawImage(left, x, y, 5, 36)
	for i = 0, width do
		Renderer.DrawImage(center, (x + 5) + i, y, 1, 36)
	end
	Renderer.DrawImage(right, x + width + 5, y, 5, 36)
	Renderer.DrawTextCenteredY(GUI.Font.ContentBold, x + 15, y + 17, text, false)
end

function DrawText(x,y,text)
	if text == nil then return end
	Renderer.SetDrawColor(hex2rgb("#fff"))
	Renderer.DrawText(GUI.Font.Menu, x, y, text, false)
end

function DrawPagination(key, click, x, y, size_x, size_y, showed, count, totalshowed)
	-- PREV
	if GUI.Items[key]["page"] > 0 then 
		local inpos = Input.IsCursorInRect(x, y, size_x, size_y)
		if inpos then
			if click then
				GUI.Items[key]["page"] = GUI.Items[key]["page"] - GUI.Items[key]["prevpage"][GUI.Items[key]["page"]]
				Renderer.DrawImage(GUI.Theme.PrevActive, x, y, size_x, size_y)
			else
				Renderer.DrawImage(GUI.Theme.PrevActive, x, y, size_x, size_y)
			end
		else
			Renderer.DrawImage(GUI.Theme.PrevInActive, x, y, size_x, size_y)
		end
	end
	
	-- NEXT
	if totalshowed ~= count then 
		local inpos = Input.IsCursorInRect(x + size_x + 10, y, size_x, size_y)
		if inpos then
			if click then
				GUI.Items[key]["page"] = GUI.Items[key]["page"] + showed
				GUI.Items[key]["prevpage"][GUI.Items[key]["page"]] = showed
				Renderer.DrawImage(GUI.Theme.NextActive, x + size_x + 10, y, size_x, size_y)
			else
				Renderer.DrawImage(GUI.Theme.NextActive, x + size_x + 10, y, size_x, size_y)
			end
		else
			Renderer.DrawImage(GUI.Theme.NextInActive, x + size_x + 10, y, size_x, size_y)
		end
	end
end

function DrawImageBox(click, x, y, value)
	Renderer.DrawText(GUI.Font.Menu, x + 10, y + 10, value["name"], false)
	local key = value["code"]
	local count = 1
	local tempx = x
	local safe_x = x
	local safe_y = y
	local datawork = GUI.Data[key]
	Renderer.SetDrawColor(255, 255, 255, 60)
	local sortedKeys = getKeysSortedByValue(value["heroes"], function(a, b) return a < b end)		
	
	for _, k in ipairs(sortedKeys) do
		local tempName = k:gsub(value["replace"], "")
		local imageHandle = GUI.ImageCashe[tempName]
		if imageHandle == nil then
			if value["iconpath"] ~= "" then
				imageHandle = Renderer.LoadImage(value["iconpath"] .. tempName .. ".png")
			else
				imageHandle = Renderer.LoadImage(value["heroes"][k] .. tempName .. ".png")
			end
			GUI.ImageCashe[tempName] = imageHandle
		end

		if value["search"] ~= nil and strpos(tempName, string.lower(value["search"])) ~= false then
			Renderer.SetDrawColor(0, 255, 0, 255)
			Renderer.DrawOutlineRect(tempx, y + 40, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		local inpos = Input.IsCursorInRect(tempx, y + 40, value["size_x"], value["size_y"])
		
		if inpos then
			if GUI.CurrentKey ~= "" then
				if value["search"] == nil then value["search"] = "" end
			
				if GUI.CurrentKey == "backspace" then
					if value["search"] ~= "" then
						value["search"] = string.sub(value["search"], 0, string.len(value["search"]) - 1)
					end
				else
					value["search"] = value["search"] .. GUI.CurrentKey
				end
				value["last_time"] = os.clock()
				GUI.CurrentKey = ""
			end
		
		
			Renderer.SetDrawColor(255, 0, 0, 255)
			Renderer.DrawOutlineRect(tempx, y + 40, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 60)

			if click then
				if not hasValue(datawork,k) then
					if Length(datawork) >= value["count"] then
						table.remove(datawork, 1)
					end
					datawork[Length(datawork) + 1] = k
				else
					datawork = removeValue(datawork, k)
				end
				
				if value["callback"] ~= nil then
					value["callback"](datawork)
				end
			end
		end
		
		if hasValue(datawork, k) then Renderer.SetDrawColor(255, 255, 255, 255) end
		
		Renderer.DrawImage(imageHandle, tempx, y + 40, value["size_x"], value["size_y"])
		if inpos or hasValue(datawork,k) then
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		if count % value["inrow"] == 0 then
			y = y + value["size_y"]
			tempx = x
		else
			tempx = tempx + value["size_x"] + 1
		end
		count = count + 1
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 3 > os.clock() then
		Renderer.SetDrawColor(80, 80, 80, 40)
		Renderer.DrawFilledRect(safe_x, safe_y + 40, value["inrow"] * (value["size_x"] + 1), (math.ceil(Length(sortedKeys) / value["inrow"]) * value["size_y"]))
	
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(GUI.Font.Search, safe_x + math.floor((value["inrow"] * (value["size_x"] + 1)) / 2), safe_y + 40 + math.floor((math.ceil(Length(sortedKeys) / value["inrow"]) * value["size_y"]) / 2), value["search"], false)
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 5 < os.clock() then
		value["search"] = nil
	end
	
	GUI.Set(key, datawork)
end

function DrawSelectBox(leftclick, x, y, value)
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(GUI.Font.Menu, x + 10, y + 10, value["name"], false)
	local key = value["code"]
	local count = 1
	local tempx = x
	local datawork = GUI.Data[key]
	y = y + 25
	for k, v in pairs(value["list"][GUI.SelectedLanguage]) do
		Renderer.SetDrawColor(255, 255, 255, 160)
		local inpos = Input.IsCursorInRect(tempx, y + 20, 690, 25)
		if inpos then
			if leftclick then
				if not hasValue(datawork,k) then
					if Length(datawork) == value["count"] then
						table.remove(datawork, 1)
					end
					datawork[Length(datawork) + 1] = k
				end
				
				if value["callback"] ~= nil then
					value["callback"](key, datawork)
				end
			end
			Renderer.SetDrawColor(255, 255, 255, 255)
		end
		
		if hasValue(datawork,k) then
			Renderer.DrawImage(GUI.Theme.RadioActive, tempx, y + 20, 16, 16)
		else
			Renderer.DrawImage(GUI.Theme.RadioInActive, tempx, y + 20, 16, 16)
		end
		Renderer.DrawText(GUI.Font.ContentSmallBold, tempx + 26, y + 20, v, false)
		y = y + 25
	end
	GUI.Set(key, datawork)
end

function DrawOrderBox(inpos, leftclick, rightclick, x, y, value)
	Renderer.DrawText(GUI.Font.Menu, x + 10, y + 10, value["name"], false)
	local key = value["code"]
	local count = 1
	local tempx = x
	local safe_x = x
	local safe_y = y
	local datawork = GUI.Data[key]
	Renderer.SetDrawColor(255, 255, 255, 60)
	local sortedKeys = getKeysSortedByValue(value["heroes"], function(a, b) return a < b end)
	
	for _, k in ipairs(sortedKeys) do
		local tempName = k:gsub(value["replace"], "")
		local imageHandle = GUI.ImageCashe[tempName]
		if imageHandle == nil then
			if value["iconpath"] ~= "" then
				imageHandle = Renderer.LoadImage(value["iconpath"] .. tempName .. ".png")
			else
				imageHandle = Renderer.LoadImage(value["heroes"][k] .. tempName .. ".png")
			end
			GUI.ImageCashe[tempName] = imageHandle
		end
		
		if value["search"] ~= nil and strpos(tempName, string.lower(value["search"])) ~= false then
			Renderer.SetDrawColor(0, 255, 0, 255)
			Renderer.DrawOutlineRect(tempx, y + 40, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		local inpos = Input.IsCursorInRect(tempx, y + 40, value["size_x"], value["size_y"])
		if inpos then
			if GUI.CurrentKey ~= "" then
				if value["search"] == nil then value["search"] = "" end
			
				if GUI.CurrentKey == "backspace" then
					if value["search"] ~= "" then
						value["search"] = string.sub(value["search"], 0, string.len(value["search"]) - 1)
					end
				else
					value["search"] = value["search"] .. GUI.CurrentKey
				end
				value["last_time"] = os.clock()
				GUI.CurrentKey = ""
			end
		
			if leftclick then
				if not hasValue(datawork, k) then
					datawork[Length(datawork) + 1] = k
				else
					for i, v in pairs(datawork) do
						if v == k then
							if i < Length(datawork) then 
								datawork = swapElements(datawork, i, i + 1)
							break end
						end
					end
				end
			end
			
			if rightclick then
				if hasValue(datawork, k) then
					for index, value in pairs(datawork) do
						if value == k then
							if (index - 1) > 0 then
								datawork = swapElements(datawork, index - 1, index)
							else
								table.remove(datawork, 1)
							end
						end
					end
				end
			end
		end
		Renderer.SetDrawColor(255, 255, 255, 255)
		
		if not inpos and not hasValue(datawork, k) then
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		Renderer.DrawImage(imageHandle, tempx, y + 40, value["size_x"], value["size_y"])
		if hasValue(datawork, k) then
			Renderer.SetDrawColor(0, 0, 0, 200)
			Renderer.DrawFilledRect(tempx, y + 40, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 255)
			
			local drawindex = "";
			for index, value in pairs(datawork) do
				if value == k then
					drawindex = index
				end
			end
			
			Renderer.DrawTextCentered(GUI.Font.Content, math.floor(tempx + (value["size_x"] / 2)), math.floor(y + 40 + (value["size_y"] / 2)), drawindex, false)
		end
		
		if count % 12 == 0 then
			y = y + value["size_y"]
			tempx = x
		else
			tempx = tempx + value["size_x"] + 1
		end
		count = count + 1
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 3 > os.clock() then
		Renderer.SetDrawColor(80, 80, 80, 40)
		Renderer.DrawFilledRect(safe_x, safe_y + 40, 12 * (value["size_x"] + 1), (math.ceil(Length(sortedKeys) / 12) * value["size_y"]))
	
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(GUI.Font.Search, safe_x + math.floor((12 * (value["size_x"] + 1)) / 2), safe_y + 40 + math.floor((math.ceil(Length(sortedKeys) / 12) * value["size_y"]) / 2), value["search"], false)
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 5 < os.clock() then
		value["search"] = nil
	end
	
	GUI.Set(key, datawork)
end

function DrawTextBox(inpos, click, x, y, size_x, size_y, value)
	local key = value["code"]
	Renderer.SetDrawColor(255, 255, 255, 255)
	if	inpos
	then 
		if GUI.CurrentKey ~= "" then
			if GUI.Get(key) == nil then GUI.Set(key, "") end
		
			if GUI.CurrentKey == "backspace" then
				if GUI.Get(key) ~= "" then
					GUI.Set(key, string.sub(GUI.Data[key], 0, string.len(GUI.Data[key]) - 1))
				end
			else
				GUI.Set(key, GUI.Get(key) .. GUI.CurrentKey)
			end
			
			GUI.CurrentKey = ""
		end
	end

	local drawtext = "Enter something ..."
	if GUI.Get(key) ~= nil then drawtext = GUI.Get(key) end
	
	Renderer.DrawText(GUI.Font.Content, x + 10, y + 10, value["name"], false)
	if not inpos then
		Renderer.DrawImage(GUI.Theme.TextBoxInActive, x, y + 35, size_x, size_y)
		Renderer.SetDrawColor(255, 255, 255, 120)
		Renderer.DrawText(GUI.Font.Content, x + 10, y + 43, drawtext, false)
		Renderer.SetDrawColor(255, 255, 255, 255)
	else
		Renderer.DrawImage(GUI.Theme.TextBoxActive, x, y + 35, size_x, size_y)
		Renderer.DrawText(GUI.Font.Content, x + 10, y + 43, drawtext, false)
	end
end

function DrawSlider(leftclick, x, y, value)
	Renderer.SetDrawColor(255, 255, 255, 255)
	local key = value["code"]
	local full = value["max"] - value["min"]
	local pos = tonumber(GUI.Get(key)) - value["min"]
	local percent = math.ceil((pos / full) * 100)
	local t =  2.45
	Renderer.DrawText(GUI.Font.Content, x + 10, y + 10, value["name"], false)
	
	Renderer.SetDrawColor(255, 255, 255, 25)
	Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, x, y + 74, value["min"], false)
	if Input.IsKeyDown(Enum.ButtonCode.MOUSE_LEFT) then
		if Input.IsCursorInRect(x - 5, y + 69, 10, 10) then
			GUI.Set(key, value["min"])
		end
		if Input.IsCursorInRect(x + 250, y + 69, 10, 10) then
			GUI.Set(key, value["max"])
		end
	end
	Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, x + 255, y + 74, value["max"], false)
	Renderer.SetDrawColor(255, 255, 255, 255)
	
	Renderer.DrawImage(GUI.Theme.SliderBase, x, y + 50, 255, 4)
	local fil = math.floor(percent * t)
	Renderer.DrawImage(GUI.Theme.SliderFill, x, y + 50, 5 + fil, 4)
	
	local inpos = Input.IsCursorInRect(x - 10, y + 32, 275, 40)
	if not inpos then
		Renderer.DrawImage(GUI.Theme.Slider, 5 + x  + (math.ceil(percent * t) - 8), y + 44, 16, 16)
	else
		local cx, cy = Input.GetCursorPos()

		if Input.IsKeyDown(Enum.ButtonCode.MOUSE_LEFT) then
			local f = math.ceil((cx - x) / t)
			if f > 100 then f = 100 end
			if f < 1 then f = 0 end
			local val = math.floor((full / 100) * f)
			local newval =  val + value["min"]
			GUI.Set(key, newval)
			if value["callback"] ~= nil then
				value["callback"](key, newval)
			end
			
			local percent = math.ceil((val / full) * 100)

			Renderer.DrawImage(GUI.Theme.Slider, 5 + x + (math.ceil(percent * t) - 8), y + 44, 16, 16)
		else
			Renderer.DrawImage(GUI.Theme.Slider, 5 + x + (math.ceil(percent * t) - 8), y + 44, 16, 16)
		end
	end
	
	inpos = Input.IsCursorInRect((x + (240 / 2)) - 30, y + 68, 60, 16)
	if inpos then
	
		if GUI.CurrentKey ~= "" and tonumber(GUI.CurrentKey) ~= nil then
			if value["newvalue"] == nil then value["newvalue"] = "" end
		
			if GUI.CurrentKey == "backspace" then
				if value["newvalue"] ~= "" then
					value["newvalue"] = string.sub(value["newvalue"], 0, string.len(value["newvalue"]) - 1)
				end
			else
				value["newvalue"] = value["newvalue"] .. GUI.CurrentKey
			end
			
			GUI.CurrentKey = ""
			value["last_time"] = os.clock()
		end
		
	end
	
	if value["newvalue"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 1 < os.clock() then
		local t = tonumber(value["newvalue"])
		if	t ~= nil 
			and t >= value["min"]
			and t <= value["max"]
		then
			GUI.Set(key, t)
			if value["callback"] ~= nil then
				value["callback"](key, t)
			end
		end
		value["newvalue"] = nil
	end
	
	if value["newvalue"] ~= nil then
		Renderer.DrawTextCenteredX(GUI.Font.ContentBold, x + (240 / 2), y + 68, value["newvalue"], false)
	else
		Renderer.DrawTextCenteredX(GUI.Font.ContentBold, x + (240 / 2), y + 68, GUI.Get(key), false)
	end
end

function DrawKeyBox(click, x, y, size_x, size_y, value)
	local key = value["code"]
	Renderer.SetDrawColor(255, 255, 255, 255)
					

	local drawtext = "?"
	if GUI.Get(key) ~= nil then drawtext = GUI.Get(key) end
	
	local offset_x = string.len(value["name"]) * 11
	if GUI.SelectedLanguage == "russian" then offset_x = math.floor(offset_x / 2) end
	
	local inpos = Input.IsCursorInRect(x, y, offset_x + size_x, size_y)
	if	inpos
	then 
		if GUI.CurrentKey ~= "" then
			if GUI.Get(key) == nil then GUI.Set(key, "") end
		
			if GUI.CurrentKey ~= "backspace" then
				GUI.Set(key, GUI.CurrentKey)
			end
			
			GUI.CurrentKey = ""
		end
	end
	
	Renderer.DrawText(GUI.Font.Content, x, y + 10, value["name"], false)
	if not inpos then
		Renderer.SetDrawColor(255, 255, 255, 120)
		Renderer.DrawImage(GUI.Theme.KeyBox, x + offset_x, y + 2, size_x, size_y)
		Renderer.DrawTextCentered(GUI.Font.ContentBold, x + offset_x + 18, y + 20, drawtext, false)
		Renderer.SetDrawColor(255, 255, 255, 255)
	else
		Renderer.DrawImage(GUI.Theme.KeyBox, x + offset_x, y + 2, size_x, size_y)
		Renderer.DrawTextCentered(GUI.Font.ContentBold, x + offset_x + 18, y + 20, drawtext, false)
	end
end

function DrawCheckBox(inpos, click, x, y, size, value)
	Renderer.SetDrawColor(255, 255, 255, 255)
	local key = value["code"]
	if	inpos
		and click 
	then 
		if not GUI.IsEnabled(key) then
			GUI.Set(key, 1)
			if value["callback"] ~= nil then
				value["callback"](key, 1)
			end
		else
			GUI.Set(key, 0)
			if value["callback"] ~= nil then
				value["callback"](key, 0)
			end
		end
	end
	
	if not GUI.IsEnabled(key) then
		if inpos then
			Renderer.DrawImage(GUI.Theme.CheckBoxOnMouse, x, y, size, size)
			Renderer.SetDrawColor(255, 255, 255, 240)
			Renderer.DrawText(GUI.Font.Content, x + 35, y + 5, value["name"], false)
			Renderer.SetDrawColor(255, 255, 255, 255)
		else
			Renderer.DrawImage(GUI.Theme.CheckBoxInActive, x , y, size, size)
			Renderer.SetDrawColor(255, 255, 255, 125)
			Renderer.DrawText(GUI.Font.Content, x + 35, y + 5, value["name"], false)
			Renderer.SetDrawColor(255, 255, 255, 255)
		end
	else
		Renderer.DrawImage(GUI.Theme.CheckBoxActive, x, y, size, size)
		Renderer.DrawText(GUI.Font.Content, x + 35, y + 5, value["name"], false)
	end
end

-----------------------------------------------------------------------------------------------------------

function ApplyTheme()
	local f = GUI.GetThemeName()
	GUI.Theme.Background = Renderer.LoadImage("~/" .. f .. "/background.png")
	GUI.Theme.MenuItem = Renderer.LoadImage("~/" .. f .. "/menu.png")
	GUI.Theme.MenuInActive = Renderer.LoadImage("~/" .. f .. "/menu-inactive.png")
	GUI.Theme.MenuOnMouse = Renderer.LoadImage("~/" .. f .. "/menu-onmouse.png")
	GUI.Theme.MenuActive = Renderer.LoadImage("~/" .. f .. "/menu-active.png")
	GUI.Theme.CheckBoxInActive = Renderer.LoadImage("~/" .. f .. "/checkbox-inactive.png")
	GUI.Theme.CheckBoxOnMouse = Renderer.LoadImage("~/" .. f .. "/checkbox-onmouse.png")
	GUI.Theme.CheckBoxActive = Renderer.LoadImage("~/" .. f .. "/checkbox-active.png")
	GUI.Theme.TextBoxInActive = Renderer.LoadImage("~/" .. f .. "/textbox-inactive.png")
	GUI.Theme.TextBoxActive = Renderer.LoadImage("~/" .. f .. "/textbox-active.png")
	GUI.Theme.NextInActive = Renderer.LoadImage("~/" .. f .. "/next-inactive.png")
	GUI.Theme.NextActive = Renderer.LoadImage("~/" .. f .. "/next-active.png")
	GUI.Theme.PrevInActive = Renderer.LoadImage("~/" .. f .. "/prev-inactive.png")
	GUI.Theme.PrevActive = Renderer.LoadImage("~/" .. f .. "/prev-active.png")
	GUI.Theme.MenuCatActive = Renderer.LoadImage("~/" .. f .. "/menucat-active.png")
	GUI.Theme.MenuNextActive = Renderer.LoadImage("~/" .. f .. "/menunext-active.png")
	GUI.Theme.MenuPrevActive = Renderer.LoadImage("~/" .. f .. "/menuprev-active.png")
	GUI.Theme.KeyBox = Renderer.LoadImage("~/" .. f .. "/keybox.png")
	GUI.Theme.Button.InActive.Left = Renderer.LoadImage("~/" .. f .. "/Button/left-inactive.png")
	GUI.Theme.Button.InActive.Center = Renderer.LoadImage("~/" .. f .. "/Button/center-inactive.png")
	GUI.Theme.Button.InActive.Right = Renderer.LoadImage("~/" .. f .. "/Button/right-inactive.png")
	GUI.Theme.Button.Active.Left = Renderer.LoadImage("~/" .. f .. "/Button/left-active.png")
	GUI.Theme.Button.Active.Center = Renderer.LoadImage("~/" .. f .. "/Button/center-active.png")
	GUI.Theme.Button.Active.Right = Renderer.LoadImage("~/" .. f .. "/Button/right-active.png")
	GUI.Theme.Slider = Renderer.LoadImage("~/" .. f .. "/slider.png")
	GUI.Theme.SliderFill = Renderer.LoadImage("~/" .. f .. "/slider-fill.png")
	GUI.Theme.SliderBase = Renderer.LoadImage("~/" .. f .. "/slider-base.png")
	GUI.Theme.CheckInActive = Renderer.LoadImage("~/" .. f .. "/check-inactive.png")
	GUI.Theme.CheckActive = Renderer.LoadImage("~/" .. f .. "/check-active.png")
	GUI.Theme.Category = Renderer.LoadImage("~/" .. f .. "/category.png")
	GUI.Theme.Back = Renderer.LoadImage("~/" .. f .. "/back.png")
	GUI.Theme.RadioActive = Renderer.LoadImage("~/" .. f .. "/radio-active.png")
	GUI.Theme.RadioInActive = Renderer.LoadImage("~/" .. f .. "/radio-inactive.png")
	GUI.Theme.Close = Renderer.LoadImage("~/" .. f .. "/close.png")
	GUI.Theme.Menu = Renderer.LoadImage("resource/flash3/images/badges/ti6_battle_pass_badge_4.png")
	
end

function GUI.GetThemeName()
	if Menu.GetValue(GUI.SelectedTheme) == 1 then return "Default" end
	if Menu.GetValue(GUI.SelectedTheme) == 2 then return "Dark" end
	if Menu.GetValue(GUI.SelectedTheme) == 3 then return "Mono" end

	return "Default"
end

GUI.HeroesList = {}
GUI.HeroesList["npc_dota_hero_abaddon"] = "Abaddon"
GUI.HeroesList["npc_dota_hero_alchemist"] = "Alchemist"
GUI.HeroesList["npc_dota_hero_antimage"] = "Anti-Mage"
GUI.HeroesList["npc_dota_hero_ancient_apparition"] = "Ancient Apparition"
GUI.HeroesList["npc_dota_hero_arc_warden"] = "Arc Warden"
GUI.HeroesList["npc_dota_hero_axe"] = "Axe"
GUI.HeroesList["npc_dota_hero_bane"] = "Bane"
GUI.HeroesList["npc_dota_hero_batrider"] = "Batrider"
GUI.HeroesList["npc_dota_hero_beastmaster"] = "Beastmaster"
GUI.HeroesList["npc_dota_hero_bloodseeker"] = "Bloodseeker"
GUI.HeroesList["npc_dota_hero_bounty_hunter"] = "Bounty Hunter"
GUI.HeroesList["npc_dota_hero_brewmaster"] = "Brewmaster"
GUI.HeroesList["npc_dota_hero_bristleback"] = "Bristleback"
GUI.HeroesList["npc_dota_hero_broodmother"] = "Broodmother"
GUI.HeroesList["npc_dota_hero_centaur"] = "Centaur Warrunner"
GUI.HeroesList["npc_dota_hero_chaos_knight"] = "Chaos Knight"
GUI.HeroesList["npc_dota_hero_chen"] = "Chen"
GUI.HeroesList["npc_dota_hero_clinkz"] = "Clinkz"
GUI.HeroesList["npc_dota_hero_rattletrap"] = "Clockwerk"
GUI.HeroesList["npc_dota_hero_crystal_maiden"] = "Crystal Maiden"
GUI.HeroesList["npc_dota_hero_dark_seer"] = "Dark Seer"
GUI.HeroesList["npc_dota_hero_dazzle"] = "Dazzle"
GUI.HeroesList["npc_dota_hero_death_prophet"] = "Death Prophet"
GUI.HeroesList["npc_dota_hero_disruptor"] = "Disruptor"
GUI.HeroesList["npc_dota_hero_doom_bringer"] = "Doom"
GUI.HeroesList["npc_dota_hero_dragon_knight"] = "Dragon Knight"
GUI.HeroesList["npc_dota_hero_drow_ranger"] = "Drow Ranger"
GUI.HeroesList["npc_dota_hero_earth_spirit"] = "Earth Spirit"
GUI.HeroesList["npc_dota_hero_earthshaker"] = "Earthshaker"
GUI.HeroesList["npc_dota_hero_elder_titan"] = "Elder Titan"
GUI.HeroesList["npc_dota_hero_ember_spirit"] = "Ember Spirit"
GUI.HeroesList["npc_dota_hero_enchantress"] = "Enchantress"
GUI.HeroesList["npc_dota_hero_enigma"] = "Enigma"
GUI.HeroesList["npc_dota_hero_faceless_void"] = "Faceless Void"
GUI.HeroesList["npc_dota_hero_gyrocopter"] = "Gyrocopter"
GUI.HeroesList["npc_dota_hero_huskar"] = "Huskar"
GUI.HeroesList["npc_dota_hero_invoker"] = "Invoker"
GUI.HeroesList["npc_dota_hero_wisp"] = "Io"
GUI.HeroesList["npc_dota_hero_jakiro"] = "Jakiro"
GUI.HeroesList["npc_dota_hero_juggernaut"] = "Juggernaut"
GUI.HeroesList["npc_dota_hero_keeper_of_the_light"] = "Keeper of the Light"
GUI.HeroesList["npc_dota_hero_kunkka"] = "Kunkka"
GUI.HeroesList["npc_dota_hero_legion_commander"] = "Legion Commander"
GUI.HeroesList["npc_dota_hero_leshrac"] = "Leshrac"
GUI.HeroesList["npc_dota_hero_lich"] = "Lich"
GUI.HeroesList["npc_dota_hero_life_stealer"] = "Lifestealer"
GUI.HeroesList["npc_dota_hero_lina"] = "Lina"
GUI.HeroesList["npc_dota_hero_lion"] = "Lion"
GUI.HeroesList["npc_dota_hero_lone_druid"] = "Lone Druid"
GUI.HeroesList["npc_dota_hero_luna"] = "Luna"
GUI.HeroesList["npc_dota_hero_lycan"] = "Lycan"
GUI.HeroesList["npc_dota_hero_magnataur"] = "Magnus"
GUI.HeroesList["npc_dota_hero_medusa"] = "Medusa"
GUI.HeroesList["npc_dota_hero_meepo"] = "Meepo"
GUI.HeroesList["npc_dota_hero_mirana"] = "Mirana"
GUI.HeroesList["npc_dota_hero_morphling"] = "Morphling"
GUI.HeroesList["npc_dota_hero_monkey_king"] = "Monkey King"
GUI.HeroesList["npc_dota_hero_naga_siren"] = "Naga Siren"
GUI.HeroesList["npc_dota_hero_furion"] = "Nature's Prophet"
GUI.HeroesList["npc_dota_hero_necrolyte"] = "Necrophos"
GUI.HeroesList["npc_dota_hero_night_stalker"] = "Night Stalker"
GUI.HeroesList["npc_dota_hero_nyx_assassin"] = "Nyx Assassin"
GUI.HeroesList["npc_dota_hero_ogre_magi"] = "Ogre Magi"
GUI.HeroesList["npc_dota_hero_omniknight"] = "Omniknight"
GUI.HeroesList["npc_dota_hero_oracle"] = "Oracle"
GUI.HeroesList["npc_dota_hero_obsidian_destroyer"] = "Outworld Devourer"
GUI.HeroesList["npc_dota_hero_phantom_assassin"] = "Phantom Assassin"
GUI.HeroesList["npc_dota_hero_phantom_lancer"] = "Phantom Lancer"
GUI.HeroesList["npc_dota_hero_phoenix"] = "Phoenix"
GUI.HeroesList["npc_dota_hero_puck"] = "Puck"
GUI.HeroesList["npc_dota_hero_pudge"] = "Pudge"
GUI.HeroesList["npc_dota_hero_pugna"] = "Pugna"
GUI.HeroesList["npc_dota_hero_queenofpain"] = "Queen of Pain"
GUI.HeroesList["npc_dota_hero_razor"] = "Razor"
GUI.HeroesList["npc_dota_hero_riki"] = "Riki"
GUI.HeroesList["npc_dota_hero_rubick"] = "Rubick"
GUI.HeroesList["npc_dota_hero_sand_king"] = "Sand King"
GUI.HeroesList["npc_dota_hero_shadow_demon"] = "Shadow Demon"
GUI.HeroesList["npc_dota_hero_nevermore"] = "Shadow Fiend"
GUI.HeroesList["npc_dota_hero_shadow_shaman"] = "Shadow Shaman"
GUI.HeroesList["npc_dota_hero_silencer"] = "Silencer"
GUI.HeroesList["npc_dota_hero_skywrath_mage"] = "Skywrath Mage"
GUI.HeroesList["npc_dota_hero_slardar"] = "Slardar"
GUI.HeroesList["npc_dota_hero_slark"] = "Slark"
GUI.HeroesList["npc_dota_hero_sniper"] = "Sniper"
GUI.HeroesList["npc_dota_hero_spectre"] = "Spectre"
GUI.HeroesList["npc_dota_hero_spirit_breaker"] = "Spirit Breaker"
GUI.HeroesList["npc_dota_hero_storm_spirit"] = "Storm Spirit"
GUI.HeroesList["npc_dota_hero_sven"] = "Sven"
GUI.HeroesList["npc_dota_hero_techies"] = "Techies"
GUI.HeroesList["npc_dota_hero_templar_assassin"] = "Templar Assassin"
GUI.HeroesList["npc_dota_hero_terrorblade"] = "Terrorblade"
GUI.HeroesList["npc_dota_hero_tidehunter"] = "Tidehunter"
GUI.HeroesList["npc_dota_hero_shredder"] = "Timbersaw"
GUI.HeroesList["npc_dota_hero_tinker"] = "Tinker"
GUI.HeroesList["npc_dota_hero_tiny"] = "Tiny"
GUI.HeroesList["npc_dota_hero_treant"] = "Treant Protector"
GUI.HeroesList["npc_dota_hero_troll_warlord"] = "Troll Warlord"
GUI.HeroesList["npc_dota_hero_tusk"] = "Tusk"
GUI.HeroesList["npc_dota_hero_abyssal_underlord"] = "Underlord"
GUI.HeroesList["npc_dota_hero_undying"] = "Undying"
GUI.HeroesList["npc_dota_hero_ursa"] = "Ursa"
GUI.HeroesList["npc_dota_hero_vengefulspirit"] = "Vengeful Spirit"
GUI.HeroesList["npc_dota_hero_venomancer"] = "Venomancer"
GUI.HeroesList["npc_dota_hero_viper"] = "Viper"
GUI.HeroesList["npc_dota_hero_visage"] = "Visage"
GUI.HeroesList["npc_dota_hero_warlock"] = "Warlock"
GUI.HeroesList["npc_dota_hero_weaver"] = "Weaver"
GUI.HeroesList["npc_dota_hero_windrunner"] = "Windranger"
GUI.HeroesList["npc_dota_hero_winter_wyvern"] = "Winter Wyvern"
GUI.HeroesList["npc_dota_hero_witch_doctor"] = "Witch Doctor"
GUI.HeroesList["npc_dota_hero_skeleton_king"] = "Wraith King"
GUI.HeroesList["npc_dota_hero_zuus"] = "Zeus"

-----------------------------------------------------------------------------------------------------------
function GUI.Set(key, value)
	if type(value) ~= "table" then
		Config.WriteString("GUI", key, "~" .. value .. "~")
	else
		local s = tableToString(value)
		Config.WriteString("GUI", key, s)
	end

	GUI.Data[key] = value
	GUI.Storage[key] = value
end

function GUI.Get(key, type)
	if GUI.Storage[key] ~= nil then return GUI.Storage[key] end

    type = type or 0
	if type == 0 then
		local t = Config.ReadString("GUI", key, nil)
		if	string.sub(t,1,1) == "~" 
			and string.sub(t, -1) == "~"
		then
			GUI.Storage[key] = string.sub(t,2,string.len(t) - 1)
			return string.sub(t,2,string.len(t) - 1)
		else
			GUI.Storage[key] = t
			return t
		end
	else
		GUI.Storage[key] = stringToTable(Config.ReadString("GUI", key, nil))
		return stringToTable(Config.ReadString("GUI", key, nil))
	end
end

function GUI.IsEnabled(key)
	if GUI.Get(key) == "0" or GUI.Get(key) == "" or GUI.Get(key) == nil or GUI.Get(key) == 0 then return false else return true end
end

function GUI.SetTimeout(identity, callback, time)
	GUI.Wait(identity, time)
	GUI.TimeOut[identity] = callback
end

function GUI.Wait(where, time)
	GUI.TimeOutPause[where] = os.clock() + time
end

function GUI.Sleep(where, time)
	GUI.Pause[where] = os.clock() + time
end

function GUI.SleepReady(where)
	if GUI.Pause[where] == nil then GUI.Pause[where] = 0 end
	if os.clock() > GUI.Pause[where] then return true else return false end
end

function GUI.DEBUG.Add(name, var)
	GUI.DEBUG.Variables[name] = var
end
-----------------------------------------------------------------------------------------------------------
function tableToString (table)
	return "return" .. tostr(table)
end

function trim (s)
   return s:match( "^%s*(.-)%s*$" )
end

function stringToTable (str)
	local f = load(str)
	return f()
end

function val_to_str ( v )
	if "string" == type( v ) then
		v = string.gsub( v, "\n", "\\n" )
		if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
			return "'" .. v .. "'"
		end
		return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
	elseif type(v) == "number" then
	return v
	else
		return "table" == type( v ) and tostr( v ) or
			tostr( v )
	end
end

function key_to_str ( k )
	if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
		return k
	else
		return "[" .. val_to_str( k ) .. "]"
	end
end

function tostr ( tbl )
	local result, done = {}, {}
	for k, v in ipairs( tbl ) do
		table.insert( result, val_to_str( v ) )
		done[ k ] = true
	end
	for k, v in pairs( tbl ) do
		if not done[ k ] then
			table.insert( result,
				key_to_str( k ) .. "=" .. val_to_str( v ) )
		end
	end
	return "{" .. table.concat( result, "," ) .. "}"
end
-----------------------------------------------------------------------------------------------------------
function spairs (t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function getKeysSortedByValue (tbl, sortFunction)
	local keys = {}
	for key in pairs(tbl) do
		table.insert(keys, key)
	end

	table.sort(keys, function(a, b)
		return sortFunction(tbl[a], tbl[b])
	end)

	return keys
end

function removeValue (t, value)
	local new = {}
	for k, v in pairs(t) do
		if v ~= value then
			table.insert(new, v)
		end
	end
	return new
end

function removeKey (t, key)
	local new = {}
	for k, v in pairs(t) do
		if k ~= key then
			new[k] = v
		end
	end
	return new
end

function hasIValue (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function swapElements (t, kf, kt)
	local tv = t[kf]
	t[kf] = t[kt]
	t[kt] = tv
	return t
end

function hasValue (tab, val)
    for index, value in pairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function slug (str)
	return string.lower(string.gsub(string.gsub(str,"[^ A-Za-z]",""),"[ ]+","-"))
end

function Length (t)
	count = 0
	for k,v in pairs(t) do
		 count = count + 1
	end
	
	return count
end

function hex2rgb (hex)
    hex = hex:gsub("#","")
    if(string.len(hex) == 3) then
        return tonumber("0x"..hex:sub(1,1)) * 17, tonumber("0x"..hex:sub(2,2)) * 17, tonumber("0x"..hex:sub(3,3)) * 17
    elseif(string.len(hex) == 6) then
        return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
    end
end

function strpos (haystack, needle, offset) 
	local pattern = string.format("(%s)", needle)
	local i       = string.find (haystack, pattern, (offset or 0))
  
	return (i ~= nil and i or false)
end

function explode (str, div)
	if (div=='') then return false end
	local pos,arr = 0,{}

	for st,sp in function() return string.find(str,div,pos,true) end do
		table.insert(arr,string.sub(str,pos,st-1)) 
		pos = sp + 1
	end
	table.insert(arr,string.sub(str,pos))
	return arr
end

return GUI
