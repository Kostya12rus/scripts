GUI					= {}
GUI.Enabled			= Menu.AddOption({ "GUI" },	"Enable", "")
GUI.InGameMenu		= Menu.AddOption({ "GUI" },	"In-game menu", "")
GUI.Locale			= Menu.AddOption({ "GUI"},	"Localization", "Select your primary language", 1, 3)
GUI.SelectedTheme	= Menu.AddOption({ "GUI"},	"Theme", "Select GUI theme", 1, 3)
GUI.LockPanel		= Menu.AddOption({ "GUI" },	"Lock panel position", "")
GUI.Key				= Menu.AddKeyOption({ "GUI" }, "Key", Enum.ButtonCode.KEY_BACKQUOTE)

GUIDB.DNFG	= "Do not forget reload scripts after changes"
GUI.PreCacheItems	= Menu.AddOption({ "GUI", "GUIDB" },	"PreCache items", GUIDB.DNFG)
GUI.PreCacheHeroes	= Menu.AddOption({ "GUI", "GUIDB" },	"PreCache heroes", GUIDB.DNFG)
GUI.PreCacheAb		= Menu.AddOption({ "GUI", "GUIDB" },	"PreCache abilities", GUIDB.DNFG)


Menu.SetValueName(GUI.Locale,			1,	"English")
Menu.SetValueName(GUI.Locale,			2,	"Russian")
Menu.SetValueName(GUI.Locale,			3,	"Chinese")
Menu.SetValueName(GUI.SelectedTheme,	1,	"Default")
Menu.SetValueName(GUI.SelectedTheme,	2,	"Dark")
Menu.SetValueName(GUI.SelectedTheme,	3,	"Mono")
GUI.Languages	= {
	[1]	= "english",
	[2]	= "russian",
	[3]	= "chinese"
}
GUI.SelectedMenu					= ":about"
GUI.TempSelectedMenu				= ""
GUI.SelectedCategory				= 0
GUI.SelectedLanguage				= nil
GUI.SelectedMenuPage				= 0
GUI.CurrentKey						= ""
GUI.DownKeyType						= -1
GUI.Keys							= {}
GUI.Items							= {}
GUI.Font							= {}
GUI.Font.Menu						= Renderer.LoadFont("Arial", 17, Enum.FontWeight.BOLD)
GUI.Font.Content					= Renderer.LoadFont("Arial", 18, Enum.FontWeight.BOLD)
GUI.Font.ContentBold				= Renderer.LoadFont("Arial", 17, Enum.FontWeight.BOLD)
GUI.Font.ContentSmallBold			= Renderer.LoadFont("Arial", 15, Enum.FontWeight.BOLD)
GUI.Font.UltraSmallBold				= Renderer.LoadFont("Arial", 11, Enum.FontWeight.BOLD)
GUI.Font.Header						= Renderer.LoadFont("Arial", 19, Enum.FontWeight.BOLD)
GUI.Font.Search						= Renderer.LoadFont("Arial", 30, Enum.FontWeight.MEDIUM)
GUI.Font.Footer						= Renderer.LoadFont("Arial", 17, Enum.FontWeight.MEDIUM)
GUI.GameState						= -2
GUI.Config							= "GUI"
GUI.Version							= 180707
GUI.TextVersion						= 'v 18.07.07'

GUI.GameStates						= {}
GUI.GameStates.OnGameMenu			= -1
GUI.GameStates.OnLobbyPreload		= 0
GUI.GameStates.OnLobbyLoad			= 1
GUI.GameStates.OnLobbyChoose		= 2
GUI.GameStates.OnLobbyChoosed		= 3
GUI.GameStates.OnGamePreStart		= 4
GUI.GameStates.OnGameStart			= 5
GUI.GameStates.OnGameEnd			= 6
GUI.GameStates.OnGameStateChanged	= 7

GUI.TimeOutPause					= {}
GUI.TimeOut							= {}
GUI.Pause							= {}

GUI.MenuType						= {}
GUI.MenuType.CheckBox				= 0
GUI.MenuType.TextBox				= 1
GUI.MenuType.ImageBox				= 2
GUI.MenuType.Label					= 3
GUI.MenuType.Key					= 4
GUI.MenuType.Button					= 5
GUI.MenuType.Slider					= 6
GUI.MenuType.OrderBox				= 7
GUI.MenuType.SelectBox				= 8

GUI.DEBUG							= {}
GUI.DEBUG.Enabled					= false
GUI.DEBUG.Variables					= {}

GUI.Actions							= {}
GUI.Actions.MoveHeader				= false

GUI.Theme							= {}
GUI.Theme.MenuItem					= nil
GUI.Theme.CheckBoxInActive			= nil
GUI.Theme.CheckBoxOnMouse			= nil
GUI.Theme.CheckBoxActive			= nil
GUI.Theme.Slider					= nil
GUI.Theme.CheckInActive				= nil
GUI.Theme.CheckActive				= nil
GUI.Theme.Category					= nil
GUI.Theme.Back						= nil
GUI.Theme.RadioActive				= nil
GUI.Theme.RadioInActive				= nil
GUI.Theme.Close						= nil

GUI.Settings						= {}
GUI.Settings.PosX					= -1
GUI.Settings.PosY					= -1
GUI.offsetPosX						= 0
GUI.offsetPosY						= 0
GUI.Storage							= {}

GUI.Data							= {}
GUI.CallBackKey						= {}
GUI.Subscriptions					= {}
GUI.IsInputCaptured					= false
GUI.ShowDesc						= false

GUI.Category						= {}
GUI.Category.General				= 0
GUI.Category.Heroes					= 1
GUI.Category.Items					= 2
GUI.CategoryName	= {
	[0]	= "G",
	[1]	= "H",
	[2]	= "I"
}
GUI.ActiveCategories				= {	[0] = false, [1] = false, [2] = false }
GUI.TextValues	= {
	["english"]	= {
		["changelog"]	= "",
		["version_s"]	= "This script requires GUI version ",
		["version_e"]	= " or higher",
		["page"]		= "Page ",
		["of"]			= " of ",
		["back"]		= "Back",
		["by"]			= " by "
	},
	["russian"] = {
		["changelog"]	= "",
		["version_s"]	= "Данный скрипт требует GUI версии ",
		["version_e"]	= " или выше",
		["page"]		= "Страница ",
		["of"]			= " из ",
		["back"]		= "Назад",
		["by"]			= " от "
	},
	["chinese"] = {
		["changelog"]	= "",
		["version_s"]	= "這個腳本需要一個 GUI ",
		["version_e"]	= "或更高版本",
		["page"]		= "頁 ",
		["of"]			= " 從 ",
		["back"]		= "前",
		["by"]			= " 从 "
	}
}

GUI.ThemeColors = {}
GUI.ThemeColors["Default"] = {
	Background				= "0f1f2e",
	OutLine					= "273b4f",
	Accent					= "fff",
	Version					= "fff",
	HeaderInActive			= "fff",
	HeaderActive			= "fff",
	Navigation				= "7f8fa4",
	SliderFill				= "273b4f",
	SliderBase				= "0096f1",
	Author					= "7f8fa4",
	MenuDelimeter			= "313d4f",
	MenuBackgroundInActive	= "0c1420",
	MenuBackgroundActive	= "26292f",
	MenuBackgroundOnMouse	= "161f2e",
	PaginationOutLine		= "273b4f",
	PaginationBackGround	= "0c1420",
	PaginationColor			= "fff",
	TextBoxOutLine			= "0093f0",
	TextBoxBackGround		= "16283a",
	TextBoxColorActive		= "fff",
	TextBoxColorInActive	= "9b9b9b",
	ButtonOutLine			= "0093f0",
	ButtonBackGround		= "16283a",
	ButtonColorActive		= "fff",
	ButtonColorInActive		= "9b9b9b",
	KeyBoxOutLine			= "0093f0",
	KeyBoxBackGround		= "16283a",
	KeyBoxBackGroundActive	= "00a0f9",
	KeyBoxColorActive		= "fff",
	KeyBoxColorInActive		= "9b9b9b"
}
GUI.ThemeColors["Dark"] = {
	Background				= "0c1117",
	OutLine					= "273b4f",
	Accent					= "fff",
	Version					= "fff",
	HeaderInActive			= "fff",
	HeaderActive			= "fff",
	Navigation				= "7f8fa4",
	SliderFill				= "273b4f",
	SliderBase				= "0096f1",
	Author					= "7f8fa4",
	MenuDelimeter			= "313d4f",
	MenuBackgroundInActive	= "0c1117",
	MenuBackgroundActive	= "121920",
	MenuBackgroundOnMouse	= "0f141c",
	PaginationOutLine		= "273b4f",
	PaginationBackGround	= "0c1117",
	PaginationColor			= "fff",
	TextBoxOutLine			= "0093f0",
	TextBoxBackGround		= "16283a",
	TextBoxColorActive		= "fff",
	TextBoxColorInActive	= "9b9b9b",
	ButtonOutLine			= "0093f0",
	ButtonBackGround		= "16283a",
	ButtonColorActive		= "fff",
	ButtonColorInActive		= "9b9b9b",
	KeyBoxOutLine			= "0093f0",
	KeyBoxBackGround		= "16283a",
	KeyBoxBackGroundActive	= "00a0f9",
	KeyBoxColorActive		= "fff",
	KeyBoxColorInActive		= "9b9b9b"
}
GUI.ThemeColors["Mono"] = {
	Background				= "0f1113",
	OutLine					= "191a1f",
	Accent					= "fff",
	Version					= "fff",
	HeaderInActive			= "fff",
	HeaderActive			= "fff",
	Navigation				= "879999",
	SliderFill				= "464d4b",
	SliderBase				= "879999",
	Author					= "879999",
	MenuDelimeter			= "1f2024",
	MenuBackgroundInActive	= "000000",
	MenuBackgroundActive	= "0f1113",
	MenuBackgroundOnMouse	= "0f1113",
	PaginationOutLine		= "191a1f",
	PaginationBackGround	= "0f1113",
	PaginationColor			= "fff",
	TextBoxOutLine			= "3f4545",
	TextBoxBackGround		= "27282d",
	TextBoxColorActive		= "fff",
	TextBoxColorInActive	= "9b9b9b",
	ButtonOutLine			= "3f4545",
	ButtonBackGround		= "27282d",
	ButtonColorActive		= "fff",
	ButtonColorInActive		= "9b9b9b",
	KeyBoxOutLine			= "3f4545",
	KeyBoxBackGround		= "27282d",
	KeyBoxBackGroundActive	= "545e5b",
	KeyBoxColorActive		= "fff",
	KeyBoxColorInActive		= "9b9b9b"
}
GUI.Colors						= {}
GUI.NotifyType					= {}
GUI.NotifyType.Text				= 0
GUI.NotifyType.ImageText		= 1
GUI.NotifyType.ImageTextImage	= 2
GUI.Notices						= {}

function GUI.Write(text, identity, log)
	if text == nil then return end
	identity = identity or GUI.Config
    log = log or true
	if log then Log.Write("[" .. os.date("%X") .. "]\t" .. identity .. "\t->\t" .. text) end
end

function GUI.OnDraw()
	if not Menu.IsEnabled(GUI.Enabled) then return end
	if GUI.SelectedLanguage == nil and GUIDB ~= nil then 
		GUI.SelectedLanguage = GUI.Languages[Menu.GetValue(GUI.Locale)]
		ApplyTheme()
		GUI.Write(GUI.TextVersion)
		GUI.Write(GUI.GetThemeName())
		GUI.Write(GUI.SelectedLanguage)
		GUIDB.Cache()
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
	
	GUI.CheckKeys()
	GUI.CheckState()
	
	local leftclick = GUI.CurrentKey == "left" and GUI.DownKeyType == 1
	
	if GUI.IsEnabled("gui:show") then
		GUI.IsInputCaptured = false
		GUI.Colors = GUI.ThemeColors[GUI.GetThemeName()]
		GUI.Draw(leftclick, GUI.CurrentKey == "right" and GUI.DownKeyType == 1)
	end
	
	local w, h = Renderer.GetScreenSize()
	DrawNotices(w, h, leftclick)
	
	if Engine.IsInGame() and Menu.IsEnabled(GUI.InGameMenu) then 
		local tmi_loc_x = math.floor(w * 0.10)
		local tmi_loc_y = math.floor(h * 0.012)
		local size = math.floor(h * 0.032)
		if Input.IsCursorInRect(tmi_loc_x, tmi_loc_y + 1, size, size) then
			Renderer.SetDrawColor(255, 255, 255, 180)
			if leftclick then
				if GUI.IsEnabled("gui:show") then 
					GUI.Set("gui:show", 0)
				else 
					GUI.Set("gui:show", 1)
				end
			end
		else
			Renderer.SetDrawColor(180, 194, 220, 255)
		end
		
		Renderer.DrawText(GUI.Font.Search, tmi_loc_x, tmi_loc_y, "G")
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
		for k, v in pairs(GUI.Items) do
			GUI.DeInitialize(k)
		end
	end
	
	if option == GUI.SelectedTheme then
		ApplyTheme()
	end
end

function GUI.IsAvReadKey()
	return string.len(GUI.CurrentKey) == 1 or GUI.CurrentKey == "backspace"
end

function GUI.CheckKeys()
	local current_key = ""
	GUI.DownKeyType = 0
	GUI.CurrentKey = ""
	local skip_array = {55,57,58,59,60,61}
	
	local alphabet = '    0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/*-+ .     ~'

	for i = 5, 62 do
		if not hasValue(skip_array, i) then
			if Input.IsKeyDown(i) then
				current_key = string.sub(alphabet, i, i)
				
				if GUI.Keys[i] == 0 or GUI.Keys[i] == nil then
					GUI.Keys[i] = os.clock()
				end
			elseif	GUI.Keys[i] ~= nil and GUI.Keys[i] ~= 0 and (os.clock() - GUI.Keys[i]) > 0.005 then
				GUI.Keys[i] = 0
				current_key = string.sub(alphabet, i, i)
				GUI.DownKeyType = 1
				GUI.CurrentKey = current_key
			end
		end
	end
	
	local special_chars = {}
	special_chars[70] = " "
	special_chars[71] = "backspace"
	special_chars[112] = "left"
	special_chars[113] = "right"

	for k, v in pairs(special_chars) do
		if Input.IsKeyDown(k) then
			current_key = v
			if GUI.Keys[k] == 0 or GUI.Keys[k] == nil then
				GUI.Keys[k] = os.clock()
			end
		elseif	GUI.Keys[k] ~= nil and GUI.Keys[k] ~= 0 and (os.clock() - GUI.Keys[k]) > 0.005 then
			GUI.Keys[k] = 0
			current_key = v
			GUI.DownKeyType = 1
			GUI.CurrentKey = current_key
		end
	end
	
	if current_key ~= "" then
		for k, v in pairs(GUI.CallBackKey) do
			if current_key == GUI.Data[v["itemcode"]] and v["type"] == GUI.DownKeyType then
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
			if category["perfect_name"][GUI.SelectedLanguage] == nil then
				GUI_Object["perfect_name"] = category["perfect_name"]["english"]
			else
				GUI_Object["perfect_name"] = category["perfect_name"][GUI.SelectedLanguage]
			end
		end
		
		if type(GUI_Object["perfect_desc"]) == "table" then
			if category["perfect_desc"][GUI.SelectedLanguage] == nil then
				GUI_Object["perfect_desc"] = category["perfect_desc"]["english"]
			else
				GUI_Object["perfect_desc"] = category["perfect_desc"][GUI.SelectedLanguage]
			end
		end
		
		if type(GUI_Object["perfect_author"]) == "table" then
			if category["perfect_author"][GUI.SelectedLanguage] == nil then
				GUI_Object["perfect_author"] = category["perfect_author"]["english"]
			else
				GUI_Object["perfect_author"] = category["perfect_author"][GUI.SelectedLanguage]
			end
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
			GUI_Object["hero"] = GUIDB.Heroes[select(1, ...)]
		end
		GUI_Object["perfect_author"] = author
		GUI_Object["perfect_version"] = 0
		GUI_Object["category"] = category		
	end
		
	if GUI_Object["category"] ~= nil then GUI.ActiveCategories[GUI_Object["category"]] = true end
	GUI_Object["page"] = 0
	GUI_Object["prevpage"] = {}
	GUI_Object["items"] = {}
	
	if(utf8.len(GUI_Object["perfect_name"]) > 23) then
		GUI_Object["perfect_name"] = utf8sub(GUI_Object["perfect_name"], 0, 19) .. ' ...'
	end	
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

function GUI.DeInitialize(code)
	GUI.Items = removeKey(GUI.Items, code)
	GUI.Data = removeKey(GUI.Data, code)
end

function chsize(char)
	if not char then
		return 0
	elseif char > 240 then
		return 4
	elseif char > 225 then
		return 3
	elseif char > 192 then
		return 2
	else
		return 1
	end
end
 
function utf8sub(str, startChar, numChars)
	local startIndex = 1
	while startChar > 1 do
		local char = string.byte(str, startIndex)
		startIndex = startIndex + chsize(char)
		startChar = startChar - 1
	end

	local currentIndex = startIndex

	while numChars > 0 and currentIndex <= #str do
		local char = string.byte(str, currentIndex)
		currentIndex = currentIndex + chsize(char)
		numChars = numChars -1
	end
	return str:sub(startIndex, currentIndex - 1)
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
			GUI.Items[menucode]["items"][order]["heroes"] = GUIDB.Heroes
		else
			GUI.Items[menucode]["items"][order]["heroes"] = select(2, ...)
		end
		if select(3, ...) == nil then
			GUI.Items[menucode]["items"][order]["iconpath"] = GUIDB.HeroPath
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
			GUI.Items[menucode]["items"][order]["inrow"] = 11
		end
		
	elseif GUI.MenuType.OrderBox == control then
		GUI.Data[itemcode] = {}
		local temp_data = GUI.Get(itemcode, 1)
		if temp_data ~= nil then GUI.Data[itemcode] = temp_data end
		GUI.Items[menucode]["items"][order]["cache"] = {}
		if select(1, ...) == nil then
			GUI.Items[menucode]["items"][order]["heroes"] = GUIDB.Heroes
		else
			GUI.Items[menucode]["items"][order]["heroes"] = select(1, ...)
		end
		if select(2, ...) == nil then
			GUI.Items[menucode]["items"][order]["iconpath"] = GUIDB.HeroPath
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

function GUI.CheckState()
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

function GUI.Draw(leftclick, rightclick)
	local work_h = 900
	local work_y = 560
	local workbox_x = 230
	local limit_y = 510
	
	local menusize_x = 230
	local menusize_y = 40
	
	local w, h = Renderer.GetScreenSize()
	local startx = math.floor(w / 2) - 450
	local starty = math.floor(h / 2) - 330

	if GUI.Actions.MoveHeader then
		local mx, my = Input.GetCursorPos()
		
		GUI.Set("gui:posx", mx - GUI.offsetPosX)
		GUI.Set("gui:posy", my - GUI.offsetPosY)
		if tonumber(GUI.Get("gui:posx")) < 1 then GUI.Set("gui:posx", 1) end
		if tonumber(GUI.Get("gui:posy")) < 1 then GUI.Set("gui:posy", 1) end
		if (tonumber(GUI.Get("gui:posx")) + work_h + 2) > w then GUI.Set("gui:posx", w - work_h - 2) end
		if (tonumber(GUI.Get("gui:posy")) + work_y + 2) > h then GUI.Set("gui:posy", h - work_y - 2) end
	end
	
	if GUI.IsEnabled("gui:posx") then
		startx = tonumber(GUI.Get("gui:posx"))
		starty = tonumber(GUI.Get("gui:posy"))
	end
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.OutLine))
	Renderer.DrawOutlineRect(startx, starty, work_h + 2, work_y + 2)

	Renderer.SetDrawColor(hex2rgb(GUI.Colors.Background))
	Renderer.DrawFilledRect(startx + 1, starty + 1, work_h, work_y)
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.OutLine))
	Renderer.DrawFilledRect(startx + menusize_x + 1, starty + 2, 1, work_y)

	Renderer.SetDrawColor(hex2rgb("#fff"))
	local nextlocx = startx
	
	for k,v in pairs(GUI.CategoryName) do
		if GUI.ActiveCategories[k] then
			local color = GUI.Colors.HeaderInActive
			Renderer.SetDrawColor(255,255,255,60)

			if	(GUI.SelectedCategory == k) 
			then 
				Renderer.SetDrawColor(255,255,255,255)
			elseif	Input.IsCursorInRect(nextlocx, starty, 40, 40)
			then
				GUI.IsInputCaptured = true
				if leftclick then 
					GUI.SelectedCategory = k
					GUI.SelectedMenu = ":about"
					GUI.SelectedMenuPage = 0
				end
				Renderer.SetDrawColor(255,255,255,150)
			end
			Renderer.DrawTextCentered(GUI.Font.Header, nextlocx + 21, starty + 20, v, false)
			
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.OutLine))
			Renderer.DrawFilledRect(nextlocx + 41, starty, 1, 40)

			Renderer.SetDrawColor(hex2rgb("#fff"))
			nextlocx = nextlocx + 41
		end
	end
	Renderer.SetDrawColor(hex2rgb("#fff"))
	Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, startx + 192, starty + 20, GUI.TextVersion, false)
	local nextposition = starty + menusize_y
		
	if GUI.TempSelectedMenu ~= "" then
		GUI.SelectedMenu = GUI.TempSelectedMenu
		GUI.ShowDesc = false
		GUI.TempSelectedMenu = ""
	end
		
	local temp_table = GUI.Items
	local showonpage = 12
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
		
		DrawMenuItem(back_to, startx + 1, nextposition, menusize_x, menusize_y, GUI.TextValues[GUI.SelectedLanguage]["back"], leftclick, "gui_back")
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
				DrawMenuItem(v, startx + 1, nextposition, menusize_x, menusize_y, v["perfect_name"], leftclick, k)
				nextposition = nextposition + menusize_y
			end
			i = i + 1
		end
	end
	
	local totalpage = math.ceil(temp_val / showonpage)
	if totalpage > 1 then
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.Navigation))
		Renderer.DrawTextCentered(GUI.Font.Footer, startx + 115, starty + 540, GUI.TextValues[GUI.SelectedLanguage]["page"] .. (c + 1) .. GUI.TextValues[GUI.SelectedLanguage]["of"] .. totalpage, false)
		Renderer.SetDrawColor(hex2rgb("#fff"))

		if (c + 1) ~= 1 then		
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationOutLine))
			Renderer.DrawOutlineRect(startx, starty + 522, 40, 40)
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationBackGround))
			Renderer.DrawFilledRect(startx + 1, starty + 523, 38, 38)
			
			Renderer.SetDrawColor(255, 255, 255, 80)
			if Input.IsCursorInRect(startx + 1, starty + 523, 38, 38) then
				GUI.IsInputCaptured = true
				if leftclick then GUI.SelectedMenuPage = GUI.SelectedMenuPage - 1 end 
				Renderer.SetDrawColor(255, 255, 255, 255)
			end
			Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, startx + 20, starty + 542, "<", false)
		end
		
		if (c + 1) ~= totalpage then
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationOutLine))
			Renderer.DrawOutlineRect(startx + 192, starty + 522, 40, 40)
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationBackGround))
			Renderer.DrawFilledRect(startx + 193, starty + 523, 38, 38)
			
			Renderer.SetDrawColor(255, 255, 255, 80)
			if Input.IsCursorInRect(startx + 193, starty + 523, 38, 38) then
				GUI.IsInputCaptured = true
				if leftclick then GUI.SelectedMenuPage = GUI.SelectedMenuPage + 1 end 
				Renderer.SetDrawColor(255, 255, 255, 255)
			end
			Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, startx + 213, starty + 542, ">", false)
		end
	end

	Renderer.SetDrawColor(hex2rgb(GUI.Colors.OutLine))

	if GUI.SelectedMenu ~= nil and GUI.SelectedMenu ~= ":about" and GUI.Items[GUI.SelectedMenu]["iscat"] == nil then
		Renderer.DrawFilledRect(startx + 1, starty + 40, work_h, 1)
		Renderer.SetDrawColor(255, 255, 255, 255)
		DrawMenuBox(GUI.SelectedMenu, startx, starty, workbox_x, limit_y, leftclick, rightclick)
	else
		Renderer.DrawFilledRect(startx + 1, starty + 40, menusize_x + 1, 1)
	end
	
	if leftclick and not Menu.IsEnabled(GUI.LockPanel) then 
		if GUI.Actions.MoveHeader then
			GUI.Actions.MoveHeader = false
		elseif Input.IsCursorInRect(startx, starty, work_h, work_y) and not GUI.IsInputCaptured then
			GUI.Actions.MoveHeader = true
			local temp_x, temp_y = Input.GetCursorPos()
			GUI.offsetPosX = temp_x - startx
			GUI.offsetPosY = temp_y - starty
		end
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

function DrawMenuBox(k, startx, starty, workbox_x, limit_y, leftclick, rightclick)
	local v = GUI.Items[k]["perfect_name"]

	if k == GUI.SelectedMenu then
	
		local t = GUI.Items[k]["perfect_author"] .. ' // ' .. GUI.Items[k]["perfect_desc"]
		if GUI.Items[k]["perfect_desc"] == "" then t = GUI.Items[k]["perfect_author"] end
		if (utf8.len(t) > 70) then
			t = utf8sub(t, 0, 58) .. ' ...'
			
			local tx = startx + workbox_x + 551
			local ty = starty
			local tsize = 41
			
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationOutLine))
			Renderer.DrawOutlineRect(tx, ty, tsize, tsize)
			Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationBackGround))
			Renderer.DrawFilledRect(tx + 1, ty + 1, tsize - 2, tsize - 2)
			
			Renderer.SetDrawColor(255, 255, 255, 80)
			if Input.IsCursorInRect(tx + 1, ty + 1, tsize - 2, tsize - 2) then
				GUI.IsInputCaptured = true
				Renderer.SetDrawColor(255, 255, 255, 255)
				if leftclick then
					if GUI.ShowDesc then
						GUI.ShowDesc = false
					else
						GUI.ShowDesc = true
					end
				end
			end
			if GUI.ShowDesc then
				Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, tx + math.floor(tsize / 2), ty + math.floor(tsize / 2), "<", false)
			else
				Renderer.DrawTextCentered(GUI.Font.Header, tx + math.floor(tsize / 2), ty + math.floor(tsize / 2) - 4, "...", false)
			end
		end
		
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawText(GUI.Font.Menu, startx + workbox_x + 20, starty + 12, t, false)

		local _, count = string.gsub(GUI.Items[k]["perfect_desc"], "\r\n", "")
		count = count + 1
		local xt = 30 * count
		if xt == 0 then xt = 30 end
		local drawed = 1
		local donotshow = false
		local realshow = 1
		
		if not GUI.ShowDesc then 

			if GUI.Items[k]["perfect_version"] ~= nil and GUI.Items[k]["perfect_version"] ~= 0 then
				if GUI.Items[k]["perfect_version"] > GUI.Version then
					Renderer.SetDrawColor(hex2rgb('e0bc2d'))
					Renderer.DrawTextCentered(GUI.Font.Search, startx + workbox_x + math.floor((900 - workbox_x) / 2), starty + 280, GUI.TextValues[GUI.SelectedLanguage]["version_s"] .. GUI.Items[k]["perfect_version"] .. GUI.TextValues[GUI.SelectedLanguage]["version_e"], false)
					if true then return end
				end
			end
			
			for i = 1, Length(GUI.Items[k]["items"]) do
				if donotshow then break end
				local value = GUI.Items[k]["items"][i]
				
				if value["type"] == GUI.MenuType.CheckBox and GUI.Items[k]["page"] < drawed then
					if xt + 34 < limit_y then
						local inpos = Input.IsCursorInRect(startx + workbox_x + 20, starty + 20 + xt, 26, 26)
						DrawCheckBox(inpos, leftclick, startx + workbox_x + 20, starty + xt + 20, 26, value)
						xt = xt + 34
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.TextBox and GUI.Items[k]["page"] < drawed then
					if xt + 60 < limit_y then
						DrawTextBox(leftclick, startx + workbox_x + 20, starty + xt + 20, 630, 32, value)
						xt = xt + 60
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.Slider and GUI.Items[k]["page"] < drawed then
					if xt + 72 < limit_y then
						DrawSlider(leftclick, startx + workbox_x + 20, starty + xt + 20, value)
						xt = xt + 72
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.ImageBox and GUI.Items[k]["page"] < drawed then
					if xt + (32 * math.ceil(Length(value["heroes"]) / value["inrow"])) + 50 < limit_y then
						local tsy = DrawImageBox(leftclick, startx + workbox_x + 20, starty + xt + 20, value)
						xt = xt + tsy + 10
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.OrderBox and GUI.Items[k]["page"] < drawed then
					if xt + (32 * math.ceil(Length(value["heroes"]) / 12)) + 50 < limit_y then
						local tsy = DrawOrderBox(false, leftclick, rightclick, startx + workbox_x + 20, starty + xt + 20, value)
						xt = xt + tsy + 10
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.SelectBox and GUI.Items[k]["page"] < drawed then
					if xt + math.ceil(Length(value["list"][GUI.SelectedLanguage]) * 25) + 50 < limit_y then
						DrawSelectBox(leftclick, startx + workbox_x + 20, starty + xt + 20, value)
						xt = xt + math.ceil(Length(value["list"][GUI.SelectedLanguage]) * 25) + 50
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.Label and GUI.Items[k]["page"] < drawed then
					local _, calculate = string.gsub(value["name"], "\r\n", "")
					calculate = calculate + 1
					if xt + (calculate * 30) < limit_y then
						DrawText(startx + workbox_x + 20, starty + xt + 20, value["name"])
						xt = xt + (calculate * 30)
						realshow = realshow + 1
					else donotshow = true end
				end
				
				if value["type"] == GUI.MenuType.Key and GUI.Items[k]["page"] < drawed then
					if xt + 40 < limit_y then
						DrawKeyBox(leftclick, startx + workbox_x + 20, starty + xt + 20, value)
						xt = xt + 40
						realshow = realshow + 1
					else donotshow = true end
				end
				 
				if value["type"] == GUI.MenuType.Button and GUI.Items[k]["page"] < drawed then
					if xt + 56 < limit_y then
						DrawButton(startx + workbox_x + 20, starty + xt + 30, value["name"], value["width"],  leftclick, value["callback"])
						xt = xt + 56
						realshow = realshow + 1
					else donotshow = true end
				end
				
				
				if not donotshow then drawed = drawed + 1 end
			end
			
					
			if donotshow or GUI.Items[k]["page"] ~= 0 then
				Renderer.SetDrawColor(hex2rgb("#fff"))
				DrawPagination(k, leftclick, startx + workbox_x + 591, starty, 41, 41, realshow - 1, Length(GUI.Items[k]["items"]), drawed - 1)
			end
		else
			DrawText(startx + workbox_x + 20, starty + 60, GUI.Items[k]["perfect_desc"], GUI.Font.ContentSmallBold)
		end

		Renderer.SetDrawColor(hex2rgb("#fff"))
	end
end

function DrawMenuItem(value, x, y, size_x, size_y, name, click, key)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.MenuBackgroundInActive))
	
	if key == GUI.SelectedMenu then
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.MenuBackgroundActive))
	else
		if Input.IsCursorInRect(x + 40, y, size_x - 40, size_y) then
			GUI.IsInputCaptured = true
			if click then 
				if key == "gui_back" then
					GUI.TempSelectedMenu = value
				else
					GUI.TempSelectedMenu = key
				end
			end
			
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.MenuBackgroundOnMouse))
		end
	end

	Renderer.DrawFilledRect(x, y, size_x, size_y)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.Accent))
	Renderer.DrawText(GUI.Font.Menu, x + 46, y + 12, name, false)
	Renderer.SetDrawColor(hex2rgb("#fff"))

	local menu_icon = GUI.Theme.CheckInActive
	if key == "gui_back" then 
		menu_icon = GUI.Theme.Back
	else
		if key ~= nil and value["iscat"] == nil and Input.IsCursorInRect(x, y, 40, 40) and click then	
			GUI.IsInputCaptured = true
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
	
	Renderer.DrawImage(menu_icon, x + 12, y + 12, 16, 16)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.MenuDelimeter))
	Renderer.DrawFilledRect(x + 40, y, 1, size_y)
	Renderer.DrawFilledRect(x, y + 39, size_x, 1)
	Renderer.SetDrawColor(hex2rgb("#fff"))
end

function DrawButton(x, y, text, width, leftclick, callback)
	width			= utf8.len(text) * 10
	if width < 80 then width = 80 end
	local inpos		= Input.IsCursorInRect(x, y, width + 10, 36)

	Renderer.SetDrawColor(hex2rgb(GUI.Colors.ButtonOutLine))
	Renderer.DrawOutlineRect(x, y, width, 36)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.ButtonBackGround))
	Renderer.DrawOutlineRect(x + 1, y + 1, width - 2, 34)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.ButtonColorInActive))

	if inpos then
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.ButtonColorActive))
		
		if leftclick then
			callback()
		end
	end

	Renderer.DrawTextCentered(GUI.Font.ContentBold, x + math.floor(width / 2), y + 18, text, false)
end

function DrawKeyBox(click, x, y, value)
	local key = value["code"]
	local width = utf8.len(value["name"]) * 10
					
	local drawtext = "?"
	if GUI.Get(key) ~= nil then drawtext = GUI.Get(key) end
	local key_size = 20 + (utf8.len(drawtext) * 10)
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.Accent))
	Renderer.DrawTextCenteredY(GUI.Font.Content, x, y + 15, value["name"], false)
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.KeyBoxOutLine))
	Renderer.DrawOutlineRect(x + width, y, key_size, 30)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.KeyBoxBackGround))

	local inpos = Input.IsCursorInRect(x + width + 1, y + 1, key_size, 28)
	if	inpos
	then 
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.KeyBoxBackGroundActive))
		if GUI.IsAvReadKey() then
			if GUI.Get(key) == nil then GUI.Set(key, "") end
		
			if GUI.CurrentKey ~= "backspace" then
				GUI.Set(key, GUI.CurrentKey)
			end
			
			GUI.CurrentKey = ""
		end
	end
	
	Renderer.DrawFilledRect(x + width + 1, y + 1, key_size - 2, 28)
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.KeyBoxColorActive))
	
	if not inpos then
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.KeyBoxColorInActive))
		Renderer.DrawTextCentered(GUI.Font.ContentBold, x + width + math.floor(key_size / 2), y + 15, drawtext, false)
	else
		Renderer.DrawTextCentered(GUI.Font.ContentBold, x + width + math.floor(key_size / 2), y + 15, drawtext, false)
	end
	
	Renderer.SetDrawColor(255, 255, 255, 255)
end

function DrawText(x, y, text, font)
	if text == nil then return end
	font = font or GUI.Font.Menu
	Renderer.SetDrawColor(hex2rgb("#fff"))
	local ty	= 0
	local tstr	= ""
	
	for q,w,e in text:gmatch("(%s*)(%S+)(%s*)") do
		if utf8.len(tstr .. " " .. w) < 96 then
			if tstr == "" then 
				tstr = w
			else
				tstr = tstr .. " " .. w
			end
		else
			Renderer.DrawText(font, x, y + ty, tstr, false)
			ty = ty + 20
			tstr = ""
		end
	end
	
	Renderer.DrawText(font, x, y + ty, tstr, false)
	return ty
end

function DrawPagination(key, click, x, y, size_x, size_y, showed, count, totalshowed)
	if GUI.Items[key]["page"] > 0 then 
		local inpos = Input.IsCursorInRect(x, y, size_x, size_y)
		
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationOutLine))
		Renderer.DrawOutlineRect(x, y, size_x, size_y)
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationBackGround))
		Renderer.DrawFilledRect(x + 1, y + 1, size_x - 2, size_y - 2)
		
		Renderer.SetDrawColor(255, 255, 255, 80)
		if inpos then
			GUI.IsInputCaptured = true
			Renderer.SetDrawColor(255, 255, 255, 170)
			if click then
				GUI.Items[key]["page"] = GUI.Items[key]["page"] - GUI.Items[key]["prevpage"][GUI.Items[key]["page"]]
			end
		end

		Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, x + math.floor(size_x / 2), y + math.floor(size_y / 2), "<", false)
	end
	
	if totalshowed ~= count then 
		local inpos = Input.IsCursorInRect(x + size_x - 1, y, size_x, size_y)
		
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationOutLine))
		Renderer.DrawOutlineRect(x + size_x - 1, y, size_x, size_y)
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.PaginationBackGround))
		Renderer.DrawFilledRect(x + size_x, y + 1, size_x - 2, size_y - 2)
		
		Renderer.SetDrawColor(255, 255, 255, 80)
		if inpos then
			GUI.IsInputCaptured = true
			Renderer.SetDrawColor(255, 255, 255, 170)
			if click then
				GUI.Items[key]["page"] = GUI.Items[key]["page"] + showed
				GUI.Items[key]["prevpage"][GUI.Items[key]["page"]] = showed
			end
		end

		Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, x + size_x - 1 + math.floor(size_x / 2), y + math.floor(size_y / 2), ">", false)
	end
end

function DrawImageBox(click, x, y, value)
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(GUI.Font.Menu, x, y, value["name"], false)
	local key = value["code"]
	local count = 1
	local tempx = x
	local safe_x = x
	local safe_y = y
	local datawork = GUI.Data[key]
	Renderer.SetDrawColor(255, 255, 255, 60)
	local sortedKeys = getKeysSortedByValue(value["heroes"], function(a, b) return a < b end)		
	local realWidth = 0 
	
	for _, k in ipairs(sortedKeys) do
		local tempName = k:gsub(value["replace"], "")
		local imageHandle = GUIDB.Image(tempName)
		if imageHandle == nil then
			if value["iconpath"] ~= "" then
				imageHandle = Renderer.LoadImage(value["iconpath"] .. tempName .. ".png")
			else
				imageHandle = Renderer.LoadImage(value["heroes"][k] .. tempName .. ".png")
			end
			GUIDB.Images[tempName] = imageHandle
		end
		
		if value["search"] ~= nil and strpos(tempName, string.lower(value["search"])) ~= false then
			Renderer.SetDrawColor(0, 255, 0, 255)
			Renderer.DrawOutlineRect(tempx, y + 25, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		local inpos = Input.IsCursorInRect(tempx, y + 25, value["size_x"], value["size_y"])
		
		if inpos then
			GUI.IsInputCaptured = true
			if GUI.IsAvReadKey() then
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
			Renderer.DrawOutlineRect(tempx, y + 25, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 60)

			if click then
				if not hasValue(datawork,k) then
					if Length(datawork) >= value["count"] then
						table.remove(datawork, 1)
					end
					datawork[Length(datawork) + 1] = k
					GUI.Set(key, datawork)
				else
					datawork = removeValue(datawork, k)
					GUI.Set(key, datawork)
				end
				
				if value["callback"] ~= nil then
					value["callback"](datawork)
				end
			end
		end
		
		if hasValue(datawork, k) then Renderer.SetDrawColor(255, 255, 255, 255) end
		
		Renderer.DrawImage(imageHandle, tempx, y + 25, value["size_x"], value["size_y"])
		if inpos or hasValue(datawork,k) then
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		if (tempx + value["size_x"] + 1) > x + 620 then
			y = y + value["size_y"]
			realWidth = (tempx + value["size_x"] + 1) - safe_x
			tempx = x
		else
			tempx = tempx + value["size_x"] + 1
		end
		count = count + 1
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 3 > os.clock() then
		Renderer.SetDrawColor(80, 80, 80, 80)
		Renderer.DrawFilledRect(safe_x, safe_y + 25, realWidth, (y + value["size_y"]) - safe_y)
	
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(GUI.Font.Search, safe_x + math.floor(realWidth / 2), safe_y + 25 + math.floor(((y + value["size_y"]) - safe_y) / 2), value["search"], false)
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 5 < os.clock() then
		value["search"] = nil
	end
	
	return ((y + value["size_y"]) - safe_y) + 25
end

function DrawOrderBox(inpos, leftclick, rightclick, x, y, value)
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(GUI.Font.Menu, x, y, value["name"], false)
	local key = value["code"]
	local count = 1
	local tempx = x
	local safe_x = x
	local safe_y = y
	local datawork = GUI.Data[key]
	Renderer.SetDrawColor(255, 255, 255, 60)
	local sortedKeys = getKeysSortedByValue(value["heroes"], function(a, b) return a < b end)
	local realWidth = 0 
	
	for _, k in ipairs(sortedKeys) do
		local tempName = k:gsub(value["replace"], "")
		local imageHandle = GUIDB.Image(tempName)
		if imageHandle == nil then
			if value["iconpath"] ~= "" then
				imageHandle = Renderer.LoadImage(value["iconpath"] .. tempName .. ".png")
			else
				imageHandle = Renderer.LoadImage(value["heroes"][k] .. tempName .. ".png")
			end
			GUIDB.Images[tempName] = imageHandle
		end
		
		if value["search"] ~= nil and strpos(tempName, string.lower(value["search"])) ~= false then
			Renderer.SetDrawColor(0, 255, 0, 255)
			Renderer.DrawOutlineRect(tempx, y + 25, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 60)
		end
		
		local inpos = Input.IsCursorInRect(tempx, y + 25, value["size_x"], value["size_y"])
		if inpos then
			GUI.IsInputCaptured = true
			if GUI.IsAvReadKey() then
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
					GUI.Set(key, datawork)
				else
					for i, v in pairs(datawork) do
						if v == k then
							if i < Length(datawork) then 
								datawork = swapElements(datawork, i, i + 1)
								GUI.Set(key, datawork)
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
								GUI.Set(key, datawork)
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
		
		Renderer.DrawImage(imageHandle, tempx, y + 25, value["size_x"], value["size_y"])
		if hasValue(datawork, k) then
			Renderer.SetDrawColor(0, 0, 0, 200)
			Renderer.DrawFilledRect(tempx, y + 25, value["size_x"], value["size_y"])
			Renderer.SetDrawColor(255, 255, 255, 255)
			
			local drawindex = "";
			for index, value in pairs(datawork) do
				if value == k then
					drawindex = index
				end
			end
			
			Renderer.DrawTextCentered(GUI.Font.Content, math.floor(tempx + (value["size_x"] / 2)), math.floor(y + 25 + (value["size_y"] / 2)), drawindex, false)
		end
		
		if (tempx + value["size_x"] + 1) > x + 620 then
			y = y + value["size_y"]
			realWidth = (tempx + value["size_x"] + 1) - safe_x
			tempx = x
		else
			tempx = tempx + value["size_x"] + 1
		end
		
		count = count + 1
	end
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 3 > os.clock() then
		Renderer.SetDrawColor(80, 80, 80, 80)
		Renderer.DrawFilledRect(safe_x, safe_y + 25, realWidth, (y + value["size_y"]) - safe_y)
	
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(GUI.Font.Search, safe_x + math.floor(realWidth / 2), safe_y + 25 + math.floor(((y + value["size_y"]) - safe_y) / 2), value["search"], false)
	end
	
	
	if value["search"] ~= nil and value["last_time"] ~= nil and value["last_time"] + 5 < os.clock() then
		value["search"] = nil
	end
	
	return ((y + value["size_y"]) - safe_y) + 25
end

function DrawSelectBox(leftclick, x, y, value)
	local key		= value["code"]
	local count		= 1
	local tempx		= x
	local datawork	= GUI.Data[key]

	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(GUI.Font.Menu, x, y, value["name"], false)
	y				= y + 15

	for k, v in pairs(value["list"][GUI.SelectedLanguage]) do
		Renderer.SetDrawColor(255, 255, 255, 160)
		local inpos = Input.IsCursorInRect(tempx, y + 20, 690, 25)
		if inpos then
			GUI.IsInputCaptured = true
			if leftclick then
				if not hasValue(datawork,k) then
					if Length(datawork) == value["count"] then
						table.remove(datawork, 1)
					end
					datawork[Length(datawork) + 1] = k
					GUI.Set(key, datawork)
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
end

function DrawTextBox(click, x, y, size_x, size_y, value)
	local key = value["code"]
	Renderer.SetDrawColor(255, 255, 255, 255)

	local drawtext = ""
	if GUI.Get(key) ~= nil then drawtext = GUI.Get(key) end
	
	Renderer.DrawText(GUI.Font.Content, x, y, value["name"], false)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.TextBoxOutLine))
	Renderer.DrawOutlineRect(x, y + 23, size_x, size_y)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.TextBoxBackGround))
	Renderer.DrawFilledRect(x + 1, y + 24, size_x - 2, size_y - 2)
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.TextBoxColorInActive))
	
	if	Input.IsCursorInRect(x, y + 23, size_x - size_y, size_y) then 
		GUI.IsInputCaptured = true
		Renderer.SetDrawColor(hex2rgb(GUI.Colors.TextBoxColorActive))
		if GUI.IsAvReadKey() then
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
	Renderer.DrawText(GUI.Font.Menu, x + 10, y + 30, drawtext, false)
	
	Renderer.SetDrawColor(255, 255, 255, 100)
	if	Input.IsCursorInRect(x + size_x - size_y, y + 24, size_y, size_y - 2) then
		GUI.IsInputCaptured = true
		Renderer.SetDrawColor(255, 255, 255, 255)
		if click then
			GUI.Set(key, '')
		end
	end
	
	Renderer.DrawImage(GUI.Theme.Close, x + size_x - (size_y - 10), y + 23 + math.floor(size_y / 2) - 5, 10, 10)
end

function DrawSlider(leftclick, x, y, value)
	Renderer.SetDrawColor(255, 255, 255, 255)
	local key = value["code"]
	local full = value["max"] - value["min"]
	local pos = tonumber(GUI.Get(key)) - value["min"]
	local percent = math.ceil((pos / full) * 100)
	local t =  2.95
	Renderer.DrawText(GUI.Font.Content, x, y, value["name"], false)
	Renderer.SetDrawColor(255, 255, 255, 25)
	
	if Input.IsCursorInRect(x, y + 44, math.floor(string.len(value["min"]) * 8), 12) then
		GUI.IsInputCaptured = true
		if Input.IsKeyDown(Enum.ButtonCode.MOUSE_LEFT) then 
			GUI.Set(key, value["min"])
		end
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawTextCenteredY(GUI.Font.ContentSmallBold, x, y + 50, value["min"], false)
	
	Renderer.SetDrawColor(255, 255, 255, 25)
	if Input.IsCursorInRect((x + 300) - math.floor(string.len(value["min"]) * 8), y + 44, math.floor(string.len(value["max"]) * 8), 12) then
		GUI.IsInputCaptured = true
		if Input.IsKeyDown(Enum.ButtonCode.MOUSE_LEFT) then 
			GUI.Set(key, value["max"])
		end
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawTextCenteredY(GUI.Font.ContentSmallBold, (x + 300) - math.floor(string.len(value["min"]) * 8), y + 50, value["max"], false)
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.SliderFill))
	Renderer.DrawFilledRect(x, y + 30, 300, 4)
	
	Renderer.SetDrawColor(hex2rgb(GUI.Colors.SliderBase))
	local fil = math.floor(percent * t)
	Renderer.DrawFilledRect(x, y + 30, 5 + fil, 4)
	
	Renderer.SetDrawColor(255, 255, 255, 255)
	local inpos = Input.IsCursorInRect(x - 10, y + 15, 320, 34)
	if not inpos then
		Renderer.DrawImage(GUI.Theme.Slider, 5 + x  + (math.ceil(percent * t) - 8), y + 24, 16, 16)
	else
		GUI.IsInputCaptured = true
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

			Renderer.DrawImage(GUI.Theme.Slider, 5 + x + (math.ceil(percent * t) - 8), y + 24, 16, 16)
		else
			Renderer.DrawImage(GUI.Theme.Slider, 5 + x + (math.ceil(percent * t) - 8), y + 24, 16, 16)
		end
	end
	
	inpos = Input.IsCursorInRect((x + (300 / 2)) - 30, y + 50, 60, 16)
	if inpos then
		GUI.IsInputCaptured = true
		if GUI.IsAvReadKey() and tonumber(GUI.CurrentKey) ~= nil then
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
		Renderer.DrawTextCenteredX(GUI.Font.ContentBold, x + (300 / 2), y + 45, value["newvalue"], false)
	else
		Renderer.DrawTextCenteredX(GUI.Font.ContentBold, x + (300 / 2), y + 45, GUI.Get(key), false)
	end
end

function DrawCheckBox(inpos, click, x, y, size, value)
	Renderer.SetDrawColor(255, 255, 255, 255)

	local key = value["code"]
	
	local di = GUI.Theme.CheckBoxInActive
	local ot = 125
	
	if inpos then
		GUI.IsInputCaptured = true
		if click then
			if not GUI.IsEnabled(key) then
				GUI.Set(key, 1)
			else
				GUI.Set(key, 0)
			end
			if value["callback"] ~= nil then
				value["callback"](key, GUI.Get(key))
			end
		end
	
		di = GUI.Theme.CheckBoxOnMouse
		ot = 220
	end
	
	if GUI.IsEnabled(key) then
		di = GUI.Theme.CheckBoxActive
		ot = 255
	end
	
	Renderer.DrawImage(di, x, y, size, size)
	Renderer.SetDrawColor(255, 255, 255, ot)
	Renderer.DrawText(GUI.Font.Content, x + 32, y + 4, value["name"], false)
	Renderer.SetDrawColor(255, 255, 255, 255)
end

function ApplyTheme()
	local f = GUI.GetThemeName()
	GUI.Theme.MenuItem = Renderer.LoadImage("~/" .. f .. "/menu.png")
	GUI.Theme.CheckBoxInActive = Renderer.LoadImage("~/" .. f .. "/checkbox-inactive.png")
	GUI.Theme.CheckBoxOnMouse = Renderer.LoadImage("~/" .. f .. "/checkbox-onmouse.png")
	GUI.Theme.CheckBoxActive = Renderer.LoadImage("~/" .. f .. "/checkbox-active.png")
	GUI.Theme.Slider = Renderer.LoadImage("~/" .. f .. "/slider.png")
	GUI.Theme.CheckInActive = Renderer.LoadImage("~/" .. f .. "/check-inactive.png")
	GUI.Theme.CheckActive = Renderer.LoadImage("~/" .. f .. "/check-active.png")
	GUI.Theme.Category = Renderer.LoadImage("~/" .. f .. "/category.png")
	GUI.Theme.Back = Renderer.LoadImage("~/" .. f .. "/back.png")
	GUI.Theme.RadioActive = Renderer.LoadImage("~/" .. f .. "/radio-active.png")
	GUI.Theme.RadioInActive = Renderer.LoadImage("~/" .. f .. "/radio-inactive.png")
	GUI.Theme.Close = Renderer.LoadImage("~/" .. f .. "/close.png")
end

function GUI.GetThemeName()
	if Menu.GetValue(GUI.SelectedTheme) == 1 then return "Default" end
	if Menu.GetValue(GUI.SelectedTheme) == 2 then return "Dark" end
	if Menu.GetValue(GUI.SelectedTheme) == 3 then return "Mono" end

	return "Default"
end

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
