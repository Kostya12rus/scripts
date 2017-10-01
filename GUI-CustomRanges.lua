local GUICR = {}
GUICR.IdentityCat = "gui_customranges_cat"
GUICR.IdentityMain = "gui_customranges_main"
GUICR.IdentityCustom = "gui_customranges_range_"
GUICR.Ranges = {}
GUICR.Additional = {}

GUICR.Locale = {
	["catname"] = {
		["english"] = "Custom ranges",
		["russian"] = "Диапазоны",
		["chinese"] = "自定義範圍"
	},
	["name"] = {
		["english"] = "Main",
		["russian"] = "Главный",
		["chinese"] = "主要"
	},
	["desc"] = {
		["english"] = "Different awareness settings",
		["russian"] = "Различные настройки уведомлений",
		["chinese"] = "各種通知設置"
	},
	["action"] = {
		["english"] = "Click on button to add new custom range",
		["russian"] = "Нажмите на кнопку чтобы добавить новый диапазон",
		["chinese"] = "點擊按鈕添加新的自定義範圍"
	},
	["new"] = {
		["english"] = "Add new range",
		["russian"] = "Добавить",
		["chinese"] = "添加新的範圍"
	},
	["width"] = {
		["english"] = 125,
		["russian"] = 87,
		["chinese"] = 110
	},
	["showrange"] = {
		["english"] = "Show range from hero to cursor",
		["russian"] = "Показывать расстояние от героя до курсора",
		["chinese"] = "顯示從英雄到光標的範圍"
	},
	["range"] = {
		["english"] = "Range ",
		["russian"] = "Круг ",
		["chinese"] = "範圍 "
	},
	["settings_range"] = {
		["english"] = "Settings for custom range # ",
		["russian"] = "Настройки диапазона # ",
		["chinese"] = "自定義範圍設置＃ "
	},
	["red"] = {
		["english"] = "Red",
		["russian"] = "Красный",
		["chinese"] = "紅"
	},
	["green"] = {
		["english"] = "Green",
		["russian"] = "Зелёный",
		["chinese"] = "綠色"
	},
	["blue"] = {
		["english"] = "Blue",
		["russian"] = "Синий",
		["chinese"] = "藍色"
	}
}

function GUICR.OnDraw()
	
	if GUI == nil then return end
	if not GUI.Exist(GUICR.IdentityCat) then
		Cat_Object = {}
		Cat_Object["perfect_name"] = GUICR.Locale["catname"]
		Cat_Object["perfect_desc"] = ''
		Cat_Object["perfect_author"] = 'paroxysm'
		Cat_Object["iscat"] = true
		Cat_Object["category"] = GUI.Category.General
		GUI.Initialize(GUICR.IdentityCat, Cat_Object)
		
		local GUI_TestSub = {}
		GUI_TestSub["perfect_name"] = GUICR.Locale["name"]
		GUI_TestSub["perfect_desc"] = GUICR.Locale["action"]
		GUI_TestSub["perfect_author"] = 'paroxysm'
		GUI_TestSub["cat"] = GUICR.IdentityCat
		GUI_TestSub["switch"] = false
		GUI.Initialize(GUICR.IdentityMain, GUI_TestSub)

		GUI.AddMenuItem(GUICR.IdentityMain, GUICR.IdentityMain .. "_add", GUICR.Locale["new"], GUI.MenuType.Button, GUICR.AddNewRange, GUICR.Locale['width'])
		GUI.AddMenuItem(GUICR.IdentityMain, GUICR.IdentityMain .. "_showrange", GUICR.Locale["showrange"], GUI.MenuType.CheckBox, 0)
	end
	
	if GUI.IsEnabled(GUICR.IdentityMain .. "_showrange") and Engine.IsInGame() then
		Renderer.SetDrawColor(0, 0, 0, 220)
		local x, y = Input.GetCursorPos()
		Renderer.DrawFilledRect(x - 20, y - 20, 40, 18)
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(GUI.Font.UltraSmallBold, x, y - 11, math.floor(Entity.GetOrigin(Heroes.GetLocal()):Distance(Input.GetWorldCursorPos()):Length2D()), false)
	end

end

function GUICR.AddNewRange()
	local x = Length(GUICR.Additional)
	local GUI_TestSub = {}
	GUI_TestSub["number"] = x
	GUI_TestSub["perfect_name"] = GUICR.Locale['range'][GUI.SelectedLanguage] .. (x + 1)
 	GUI_TestSub["perfect_desc"] = GUICR.Locale['settings_range'][GUI.SelectedLanguage] .. (x + 1)
	GUI_TestSub["perfect_author"] = 'paroxysm'
	GUI_TestSub["cat"] = GUICR.IdentityCat
	GUI_TestSub["switch"] = false
	GUI.Initialize(GUICR.IdentityCustom .. x .. "_main", GUI_TestSub)
	GUI.AddMenuItem(GUICR.IdentityCustom .. x .. "_main", GUICR.IdentityCustom .. x, GUICR.Locale['range'][GUI.SelectedLanguage] .. ' #' .. (x + 1), GUI.MenuType.Slider, 100, 5000, 250, GUICR.RangeUpdate)
	GUI.AddMenuItem(GUICR.IdentityCustom .. x .. "_main", GUICR.IdentityCustom .. x .. "_color_red", GUICR.Locale['red'], GUI.MenuType.Slider, 0, 255, 0, GUICR.ColorUpdate)
	GUI.AddMenuItem(GUICR.IdentityCustom .. x .. "_main", GUICR.IdentityCustom .. x .. "_color_green", GUICR.Locale['green'], GUI.MenuType.Slider, 0, 255, 255, GUICR.ColorUpdate)
	GUI.AddMenuItem(GUICR.IdentityCustom .. x .. "_main", GUICR.IdentityCustom .. x .. "_color_blue", GUICR.Locale['blue'], GUI.MenuType.Slider, 0, 255, 0, GUICR.ColorUpdate)
	GUICR.CreateNewRange(GUICR.IdentityCustom .. x, GUI.Get(GUICR.IdentityCustom .. x), Heroes.GetLocal())
	table.insert(GUICR.Additional, GUI_TestSub)
end

function GUICR.ColorUpdate(identity, value)
	if Engine.IsInGame() then
		local id = explode(identity, "_color_")
		Particle.SetControlPoint(GUICR.Ranges[id[1]], 1, Vector( GUI.Get(id[1] .. "_color_red"), GUI.Get(id[1] .. "_color_green"), GUI.Get(id[1] .. "_color_blue")))
	end
end

function GUICR.RangeUpdate(identity, value)
	if Engine.IsInGame() then
		Particle.Destroy(GUICR.Ranges[identity])
		GUICR.CreateNewRange(identity, value, Heroes.GetLocal())
	end
end

function GUICR.CreateNewRange(identity, range, object)
	if object then
		local Range = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf", Enum.ParticleAttachment.PATTACH_ABSORIGIN_FOLLOW, object)
		Particle.SetControlPoint(Range, 1, Vector(GUI.Get(identity .. "_color_red"), GUI.Get(identity .. "_color_green"), GUI.Get(identity .. "_color_blue")))
		Particle.SetControlPoint(Range, 2, Vector(range + 100, 255, 0))
		GUICR.Ranges[identity] = Range
	end
end

return GUICR