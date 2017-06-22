local TechiesHUD = {}

TechiesHUD.Identity = "TechiesHUD"
TechiesHUD.Locale = {
	["name"] = {
		["english"] = "TechiesHUD"
	},
	["desc"] = {
		["english"] = "TechiesHUD v1.0.1",
		["russian"] = "TechiesHUD v1.0.1"
	},
	["optionDetonate"] = {
		["english"] = "Auto detonate remote mines",
		["russian"] = "Авто взрыв бочек"
	},
	["drawRadiusLR"] = {
		["english"] = "Draw radius Land Mines",
		["russian"] = "Рисовать радиус Land Mines"
	},
	["detonateWK"] = {
		["english"] = "Detonate if WK have ult",
		["russian"] = "Взрывать если WK имеет ульт"
	},
	["detonateAegis"] = {
		["english"] = "Detonate if hero have aegis",
		["russian"] = "Взрывать если герой имеет аегис"
	},
	["detonateFast"] = {
		["english"] = "Detonate if hero can't escape",
		["russian"] = "Взрывать если герой не сможет убежать"
	},
	["drawRadiusSR"] = {
		["english"] = "Draw radius Stasis Trap",
		["russian"] = "Рисовать радиус Stasis Trap"
	},
	["drawRadiusRR"] = {
		["english"] = "Draw radius Remote Mines",
		["russian"] = "Рисовать радиус Remote Mines"
	},
	["autoPlant"] = {
		["english"] = "Auto plant mines",
		["russian"] = "Авто плент"
	},
	["stackMines"] = {
		["english"] = "Stack mines",
		["russian"] = "Стакать мины"
	},
	["stackRange"] = {
		["english"] = "Range stack mines",
		["russian"] = "Радиус стака мин"
	},
	["blastInfo"] = {
		["english"] = "Blast off info",
		["russian"] = "Сколько урона до смерти Blast Off"
	},
	["delayDetonate"] = {
		["english"] = "Detonate delay",
		["russian"] = "Задержка автоматического подрыва"
	},
	["forceStaff"] = {
		["english"] = "Auto force stuff",
		["russian"] = "Автоматическое приминение force stuff"
	},
	["forceStaffLine"] = {
		["english"] = "Draw force stuff line",
		["russian"] = "Рисовать линию force stuff"
	},
	["panelInfo"] = {
		["english"] = "Info panel",
		["russian"] = "Информационная панель"
	},
	["autoPlantNumMines"] = {
		["english"] = "Number of mines for planting",
		["russian"] = "Количество мин для плента"
	},
	["autoPlantStackRange"] = {
		["english"] = "Radius to the nearest mine",
		["russian"] = "Радиус поиска ближайшей мины"
	},
	["autoPlantKey"] = {
		["english"] = "Set position for auto plant",
		["russian"] = "Указать позицию для авто плента"
	},
	["detonateCam"] = {
		["english"] = "Show auto detonate position",
		["russian"] = "Показывать место автоматической детонации"
	},
	["FDFailSwitch"] = {
		["english"] = "Focused Detonate FailSwitch",
		["russian"] = "Focused Detonate FailSwitch"
	},
	["FDFailSwitchTogleMode"] = {
		["english"] = "FD FailSwitch mode",
		["russian"] = "Режим FD FailSwitch"
	},
	["detonateTogleMode"] = {
		["english"] = "Auto detonate mode",
		["russian"] = "Режим авто детонации"
	},
	["updateSettings"] = {
		["english"] = "Update settings",
		["russian"] = "Обновить настройки"
	},
	["panelInfoXL"] = {
		["english"] = "panel x offset for radiant",
		["russian"] = "Смещение панели по х для radiant"
	},
	["panelInfoXR"] = {
		["english"] = "panel x offset for dire",
		["russian"] = "Смещение панели по х для dire"
	},
	["panelInfoY"] = {
		["english"] = "panel y offset",
		["russian"] = "Смещение панели по y"
	},
	["panelInfoColumn"] = {
		["english"] = "Draw panel colomn",
		["russian"] = "Рисовать панель вертикально"
	},
	["panelInfoYColumn"] = {
		["english"] = "panel y offset for colomn drawing",
		["russian"] = "Смещение панели по y при рисовании вертикально"
	},
	["panelInfoDist"] = {
		["english"] = "Distance between panels",
		["russian"] = "Расстояние между панелями"
	},
	["panelInfoGemAndSentry"] = {
		["english"] = "Show Gem and Sentry",
		["russian"] = "Показывать у героя Gem и Sentry"
	},
	["detonateSection"] = {
		["english"] = "Auto detonate remote mines if they can kill the enemy",
		["russian"] = "Авто взрывание remote mines если они могут убить врага"
	},
	["autoStackSection1"] = {
		["english"] = "Automatically plant mines in the places indicated by you",
		["russian"] = "Автоматически ставит remote mines в отмеченые места"
	},
	["autoStackSection2"] = {
		["english"] = "Use the key \"Set position\" and a shift to create several positions",
		["russian"] = "Используйте клавишу \"Указать позицию\" и Shift что бы указать позиции"
	},
	["autoStackSection3"] = {
		["english"] = "Use the simple key \"Set position\" that would clear all positions",
		["russian"] = "Просто нажмите клавишу \"Указать позицию\" что бы очистить все позиции"
	},
	["stackMinesSection"] = {
		["english"] = "Puts mines as close as possible to each other",
		["russian"] = "Помещает мины как можно ближе друг к другу"
	},
	["FDFailSwitchSection1"] = {
		["english"] = "Focused Detonate Fail Switch Will not detonate remote mines if they do not cause damage",
		["russian"] = "Focused Detonate Fail Switch не даст взорвать remote mines если они не нанесут урона героям"
	},
	["FDFailSwitchSection2"] = {
		["english"] = "For forced detonate, use Alt + Focused Detonate",
		["russian"] = "Для обычного использования используйте клавиши Alt + Focused Detonate"
	},
	["drawingOptionSection"] = {
		["english"] = "Everything related to drawing",
		["russian"] = "Все что связано с рисованием"
	},
	["panelOptionsSection"] = {
		["english"] = "Panel calibration",
		["russian"] = "Калибровка панели"
	},
	["resCircle"] = {
		["english"] = "Circle resolution",
		["russian"] = "Качество круга"
	},
	["font1"] = {
		["english"] = "Size font for timings and blast off damage info",
		["russian"] = "Размер шрифта для таймингов и информации о уроне blast off"
	},
	["font2"] = {
		["english"] = "Size font for top panel",
		["russian"] = "Размер шрифта для верхней панели"
	},
	["empty"] = {
		["english"] = "Empty",
		["russian"] = "Пусто"
	},
	["detonateMode"] = {
		["english"] = {
			[0] = "Detonate how much need",
			[1] = "Detonate all"
		},
		["russian"] = {
			[0] = "Взорвать сколько нужно",
			[1] = "Взорвать все"
		}
	}
}

local optionTotal
local optionUpdate

local optionDetonate
local optionLR
local optionSR
local optionRR
local optionAutoPlant
local optionResCircle
local optionBlastInfo
local optionDelay
local optionForceDrawLine
local optionPanelInfo
local optionDetonateFast

local optionForce
local optionAutoPlantNumMines
local optionDetonateWk
local optionDetonateAegis
local optionLegitDetonate
local optionDetonateCam

local optionFDFailSwitch
local optionFDFailSwitchMode

local optionPanelInfoXL
local optionPanelInfoXR
local optionPanelInfoY
local optionPanelInfoColumn
local optionPanelInfoYColumn
local optionPanelInfoDist
local optionPanelInfoGemAndSentry

local optionFont1
local optionFont2

local size_x, size_y = Renderer.GetScreenSize()
local mines_time = {}
local mines_damage = {}
local hero_time = {}
local hero_rotate_time = {}
local forc_time = 0
local forced_time = 0
local force_direction = {}
local cast_pos = {}
local remote_pos_draw = {}
local mines_num = {}
local check_detonate = 0
local spot_for_plant = {}
local plant_time = 0
local hero_cam_time = nil
local remote_create_time = {}

function TechiesHUD.OnGameStart()
	mines_time = {}
	mines_damage = {}
	hero_time = {}
	hero_rotate_time = {}
	forc_time = 0
	forced_time = 0
	force_direction = {}
	cast_pos = {}
	remote_pos_draw = {}
	mines_num = {}
	check_detonate = 0
	spot_for_plant = {}
	plant_time = 0
	hero_cam_time = nil
	remote_create_time = {}
end

function TechiesHUD.OnEntityDestroy(ent)
	if not optionTotal then return end
	if NPC.GetUnitName(ent) == "npc_dota_techies_remote_mine" then
		mines_damage[Entity.GetIndex(ent)] = nil
		remote_create_time[Entity.GetIndex(ent)] = nil
	end
end

function DrawCircle(UnitPos, radius)
	local x1, y1 = Renderer.WorldToScreen(UnitPos)
	if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
		local x4, y4, x3, y3, visible3
		local dergee = optionResCircle
		for angle = 0, 360 / dergee do
			x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
			y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
			x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
			Renderer.DrawLine(x1,y1,x3,y3)
			x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
		end
	end
end

function CheckMove(Unit, Unit2, pred_time)
	local UnitPos = Entity.GetAbsOrigin(Unit)
	local UnitPos2 = Entity.GetAbsOrigin(Unit2)
	local MoveSpeed = NPC.GetMoveSpeed(Unit)
	local TurnRate = 0.0942 / NPC.GetTurnRate(Unit)
	local firstRotate = Entity.GetAbsRotation(Unit):GetYaw() - 90
	local x4, y4
	local dergee = 30
	local check = 1
	for angle = 0, 360 / dergee / 2 do
		local radius = (MoveSpeed * pred_time) - (TurnRate * ((angle * dergee) / 180) * MoveSpeed)
		x4 = 0 * math.cos((firstRotate + (angle * dergee)) / 57.3) - radius * math.sin((firstRotate + (angle * dergee)) / 57.3)
		y4 = radius * math.cos((firstRotate + (angle * dergee)) / 57.3) + 0 * math.sin((firstRotate + (angle * dergee)) / 57.3)
		if (UnitPos - UnitPos2 + Vector(x4, y4, 0)):Length() > 425 then
			check = 0
		end
	end
	firstRotate = 0 - firstRotate
	for angle = 0, 360 / dergee / 2 do
		local radius = (MoveSpeed * pred_time) - (TurnRate * ((angle * dergee) / 180) * MoveSpeed)
		x4 = 0 * math.cos((firstRotate + (angle * dergee)) / -57.3) - radius * math.sin((firstRotate + (angle * dergee)) / -57.3)
		y4 = radius * math.cos((firstRotate + (angle * dergee)) / -57.3) + 0 * math.sin((firstRotate + (angle * dergee)) / -57.3)
		if (UnitPos - UnitPos2 + Vector(x4, y4, 0)):Length() > 425 then
			check = 0
		end
	end
	return check
end

function TechiesHUD.UpdateGUISettings()
	optionTotal = GUI.IsEnabled(TechiesHUD.Identity)
	if not optionTotal then return end
	optionDetonate = GUI.IsEnabled(TechiesHUD.Identity .. "optionDetonate")
	optionUpdate = GUI.IsEnabled(TechiesHUD.Identity .. "optionUpdate")
	optionLR = GUI.IsEnabled(TechiesHUD.Identity .. "optionLR")
	optionSR = GUI.IsEnabled(TechiesHUD.Identity .. "optionSR")
	optionRR = GUI.IsEnabled(TechiesHUD.Identity .. "optionRR")
	optionAutoPlant = GUI.IsEnabled(TechiesHUD.Identity .. "optionAutoPlant")
	optionBlastInfo = GUI.IsEnabled(TechiesHUD.Identity .. "optionBlastInfo")
	optionDelay = GUI.Get(TechiesHUD.Identity .. "optionDelay")
	optionForceDrawLine = GUI.IsEnabled(TechiesHUD.Identity .. "optionForceDrawLine")
	optionPanelInfo = GUI.IsEnabled(TechiesHUD.Identity .. "optionPanelInfo")
	optionDetonateFast = GUI.IsEnabled(TechiesHUD.Identity .. "optionDetonateFast")

	optionForce = GUI.IsEnabled(TechiesHUD.Identity .. "optionForce")
	optionAutoPlantNumMines = GUI.Get(TechiesHUD.Identity .. "optionAutoPlantNumMines")
	optionDetonateWk = GUI.IsEnabled(TechiesHUD.Identity .. "optionDetonateWk")
	optionDetonateAegis = GUI.IsEnabled(TechiesHUD.Identity .. "optionDetonateAegis")
	if GUI.Get(TechiesHUD.Identity .. "optionLegitDetonate", 1) and 1 or 0 == 1 then
		for k, v in pairs(GUI.Get(TechiesHUD.Identity .. "optionLegitDetonate", 1)) do
			optionLegitDetonate = v == 1
		end
	else
		optionLegitDetonate = false
	end
	optionDetonateCam = GUI.IsEnabled(TechiesHUD.Identity .. "optionDetonateCam")

	optionFDFailSwitch = GUI.IsEnabled(TechiesHUD.Identity .. "optionFDFailSwitch")
	if GUI.Get(TechiesHUD.Identity .. "optionFDFailSwitchMod", 1) and 1 or 0 == 1 then
		for k, v in pairs(GUI.Get(TechiesHUD.Identity .. "optionFDFailSwitchMod", 1)) do
			optionFDFailSwitchMode = v == 1
		end
	else
		optionFDFailSwitchMode = false
	end
	optionPanelInfoXL = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoXL")
	optionPanelInfoXR = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoXR")
	optionPanelInfoY = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoY")
	optionPanelInfoColumn = GUI.IsEnabled(TechiesHUD.Identity .. "optionPanelInfoColumn")
	optionPanelInfoYColumn = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoYColumn")
	optionPanelInfoDist = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoDist")
	optionPanelInfoGemAndSentry = GUI.IsEnabled(TechiesHUD.Identity .. "optionPanelInfoGemAndSentry")
	optionResCircle = GUI.Get(TechiesHUD.Identity .. "optionResCircle")

	if GUI.Get(TechiesHUD.Identity .. "optionFont1") ~= optionFont1 then
		optionFont1 = GUI.Get(TechiesHUD.Identity .. "optionFont1")
		TechiesHUD.font = Renderer.LoadFont("Tahoma", tonumber(optionFont1), Enum.FontWeight.EXTRABOLD)
	end
	if GUI.Get(TechiesHUD.Identity .. "optionFont2") ~= optionFont2 then
		optionFont2 = GUI.Get(TechiesHUD.Identity .. "optionFont2")
		TechiesHUD.HUDfont = Renderer.LoadFont("Tahoma", tonumber(optionFont2), Enum.FontWeight.EXTRABOLD)
	end
end

function TechiesHUD.OnDraw()
	if GUI == nil then return end

	if not GUI.Exist(TechiesHUD.Identity) then
		GUI.Initialize(TechiesHUD.Identity, GUI.Category.Heroes, TechiesHUD.Locale["name"], TechiesHUD.Locale["desc"], "Zerling14", "npc_dota_hero_techies")

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "detonateSection", TechiesHUD.Locale["detonateSection"], GUI.MenuType.Label) -- Detonate
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDetonate", TechiesHUD.Locale["optionDetonate"], GUI.MenuType.CheckBox, 1)
		--GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionUpdate", TechiesHUD.Locale["empty"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionForce", TechiesHUD.Locale["forceStaff"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDetonateWk", TechiesHUD.Locale["detonateWK"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDetonateAegis", TechiesHUD.Locale["detonateAegis"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDetonateFast", TechiesHUD.Locale["detonateFast"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionLegitDetonate", TechiesHUD.Locale["detonateTogleMode"], GUI.MenuType.SelectBox, TechiesHUD.Locale["detonateMode"], { 0 }, 1, nil)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDetonateCam", TechiesHUD.Locale["detonateCam"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDelay", TechiesHUD.Locale["delayDetonate"], GUI.MenuType.Slider, 0, 2000, 700)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "autoStackSection1", TechiesHUD.Locale["autoStackSection1"], GUI.MenuType.Label) -- Auto stack
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "autoStackSection2", TechiesHUD.Locale["autoStackSection2"], GUI.MenuType.Label) -- Auto stack
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "autoStackSection3", TechiesHUD.Locale["autoStackSection3"], GUI.MenuType.Label) -- Auto stack
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAutoPlant", TechiesHUD.Locale["autoPlant"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAutoPlantNumMines", TechiesHUD.Locale["autoPlantNumMines"], GUI.MenuType.Slider, 1, 20, 6)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAutoPlantStackRange", TechiesHUD.Locale["autoPlantStackRange"], GUI.MenuType.Slider, 0,200, 200)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAutoPlantKey", TechiesHUD.Locale["autoPlantKey"], GUI.MenuType.Key, "T", SetSpot)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "stackMinesSection", TechiesHUD.Locale["stackMinesSection"], GUI.MenuType.Label) -- Stack mines
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionStack", TechiesHUD.Locale["stackMines"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionStackRange", TechiesHUD.Locale["stackRange"], GUI.MenuType.Slider, 0, 200, 100)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "FDFailSwitchSection1", TechiesHUD.Locale["FDFailSwitchSection1"], GUI.MenuType.Label) -- FD FailSwitch
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "FDFailSwitchSection2", TechiesHUD.Locale["FDFailSwitchSection2"], GUI.MenuType.Label) -- FD FailSwitch
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionFDFailSwitch", TechiesHUD.Locale["FDFailSwitch"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionFDFailSwitchMod", TechiesHUD.Locale["FDFailSwitchTogleMode"], GUI.MenuType.SelectBox, TechiesHUD.Locale["detonateMode"], { 0 }, 1, nil)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "drawingOptionSection", TechiesHUD.Locale["drawingOptionSection"], GUI.MenuType.Label) -- Drawing
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfo", TechiesHUD.Locale["panelInfo"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionLR", TechiesHUD.Locale["drawRadiusLR"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionSR", TechiesHUD.Locale["drawRadiusSR"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionRR", TechiesHUD.Locale["drawRadiusRR"], GUI.MenuType.CheckBox, 1) -- GUI.IsEnabled(TechiesHUD.Identity .. "optionLR")
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionResCircle", TechiesHUD.Locale["resCircle"], GUI.MenuType.Slider, 1, 90, 20)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionForceDrawLine", TechiesHUD.Locale["forceStaffLine"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionBlastInfo", TechiesHUD.Locale["blastInfo"], GUI.MenuType.CheckBox, 1)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionFont1", TechiesHUD.Locale["font1"], GUI.MenuType.Slider, 10, 80, 20)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionFont2", TechiesHUD.Locale["font2"], GUI.MenuType.Slider, 10, 80, 25)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "panelOptionsSection", TechiesHUD.Locale["panelOptionsSection"], GUI.MenuType.Label) -- Panel options
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoXL", TechiesHUD.Locale["panelInfoXL"], GUI.MenuType.Slider, -200, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoXR", TechiesHUD.Locale["panelInfoXR"], GUI.MenuType.Slider, -200, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoY", TechiesHUD.Locale["panelInfoY"], GUI.MenuType.Slider, -200, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoColumn", TechiesHUD.Locale["panelInfoColumn"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoYColumn", TechiesHUD.Locale["panelInfoYColumn"], GUI.MenuType.Slider, -200, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoDist", TechiesHUD.Locale["panelInfoDist"], GUI.MenuType.Slider, -200, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoGemAndSentry", TechiesHUD.Locale["panelInfoGemAndSentry"], GUI.MenuType.CheckBox, 1)

		TechiesHUD.UpdateGUISettings()
	end

	if GUI.SleepReady("updateSettings") and GUI.IsEnabled("gui:show") then
		TechiesHUD.UpdateGUISettings()
		GUI.Sleep("updateSettings", 0.1)
	end

	if not optionTotal then return end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end

	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
		return
	end

	local land_m = NPC.GetAbilityByIndex(myHero, 0)
	local trap_m = NPC.GetAbilityByIndex(myHero, 1)
	local blast = NPC.GetAbilityByIndex(myHero, 2)
	local remote = NPC.GetAbilityByIndex(myHero, 5)

	local force = NPC.GetItem(myHero, "item_force_staff", 1)

	local land_m_damage = Ability.GetLevelSpecialValueFor(land_m, "damage")
	local blast_damage = Ability.GetLevelSpecialValueFor(blast, "damage") + Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 11)) * 400

	local magicalDamageMul = 1 + Hero.GetIntellectTotal(myHero)/ 14 / 100 + 0.06 *(NPC.HasItem(myHero, "item_aether_lens", 1) and 1 or 0)

	local remote_damage = Ability.GetLevelSpecialValueFor(remote, "damage")

	if Ability.IsInAbilityPhase(blast) then
		Renderer.SetDrawColor(255, 255, 255, 255)
		DrawCircle(cast_pos, 400)
	end

	if optionAutoPlant then
		for i, spot in pairs(spot_for_plant) do
			local x, y, visible = Renderer.WorldToScreen(spot.position)
			if visible then
				Renderer.SetDrawColor(255, 255, 255, 255)
				DrawCircle(spot.position, 200)
			end
		end
	end

	remote_pos_draw = {}
	mines_num = {}
	for i = 0, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)

		if optionLR and NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil then -- land mines range
			Renderer.SetDrawColor(255, 20, 0, 255)
			DrawCircle(UnitPos, 400)
			if GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_land_mine")) < 1.75 then
				local x, y, visible = Renderer.WorldToScreen(UnitPos)
				if visible then
					Renderer.DrawText(TechiesHUD.font, x, y, math.floor((1.75 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_land_mine")))) * 100) / 100, 0)
				end
			else
				local check_loop = 0
				if next(NPC.GetUnitsInRadius(Unit, 400, Enum.TeamType.TEAM_ENEMY)) then
					check_loop = 1
					if mines_time[Entity.GetIndex(Unit)] == nil or mines_time[Entity.GetIndex(Unit)] <= 0 then
						mines_time[Entity.GetIndex(Unit)] = GameRules.GetGameTime()
					end
					if 1.6 - (GameRules.GetGameTime() - mines_time[Entity.GetIndex(Unit)]) > 0 then
						local x, y, visible = Renderer.WorldToScreen(UnitPos)
						if visible then
							Renderer.SetDrawColor(255, 255, 255, 255)
							Renderer.DrawText(TechiesHUD.font, x, y, math.floor((1.6 - (GameRules.GetGameTime() - mines_time[Entity.GetIndex(Unit)])) * 100) / 100, 0)
						end
					end
				end
				if check_loop == 0 then
					mines_time[Entity.GetIndex(Unit)] = 0
				end
			end
		end -- land mines range

		if optionSR and NPC.GetUnitName(Unit) == "npc_dota_techies_stasis_trap" and Entity.IsAlive(Unit) then -- stasis range

			Renderer.SetDrawColor(0, 0, 255, 255)
			DrawCircle(UnitPos, 400)
			Renderer.SetDrawColor(0, 255, 255, 255)
			DrawCircle(UnitPos, 600)

			if NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil
			and GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_stasis_trap")) < 2 then
				local x, y, visible = Renderer.WorldToScreen(UnitPos)
				if visible then
					Renderer.DrawText(TechiesHUD.font, x, y, math.floor((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_stasis_trap")))) * 100)/100, 0)
				end
			end
		end -- stasis range

		if NPC.GetUnitName(Unit) == "npc_dota_techies_remote_mine" and Entity.IsAlive(Unit)then -- remote range
			if optionRR then
				if remote_pos_draw[UnitPos:GetX()] == nil then
					remote_pos_draw[UnitPos:GetX()] = {}
					remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] = 0
				end
				if remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] ~= 1 then
					remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] = 1
					Renderer.SetDrawColor(0, 255, 0, 255)
					DrawCircle(UnitPos, 425)
				end
				if remote_create_time[Entity.GetIndex(Unit)] == nil then
					remote_create_time[Entity.GetIndex(Unit)] = GameRules.GetGameTime()
				end
				if GameRules.GetGameTime() - remote_create_time[Entity.GetIndex(Unit)] < Ability.GetCastPoint(remote) and NPC.GetModifier(Unit, "modifier_techies_remote_mine") == nil then
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					Renderer.SetDrawColor(255, 255, 255, 255)
					Renderer.DrawText(TechiesHUD.font, x, y - 20, math.floor((Ability.GetCastPoint(remote) - (GameRules.GetGameTime() - remote_create_time[Entity.GetIndex(Unit)])) * 100) / 100, 0)
				end
				if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil and GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_remote_mine")) < 2 then
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					Renderer.SetDrawColor(255, 255, 255, math.floor(255 * ((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_remote_mine")))) / 2)))
					Renderer.DrawText(TechiesHUD.font, x, y - 20, math.floor((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_remote_mine")))) * 100) / 100, 0)
				end
				if mines_num[i] == nil then
					mines_num[i] = 1
				end
				if mines_num[i] == 1 then
					if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil then
						local x, y, visible = Renderer.WorldToScreen(UnitPos)
						if visible then
							local num_mines = 0
							for j = 0, NPCs.Count() do
								local Unit2 = NPCs.Get(j)
								if NPC.IsPositionInRange(Unit2, UnitPos, 200, Enum.TeamType.TEAM_FRIEND)
								and NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil
								then
									num_mines = num_mines + 1
									mines_num[j] = 0
								end
							end
							Renderer.SetDrawColor(255, 255, 255, 255)
							Renderer.DrawText(TechiesHUD.font, x, y, num_mines, 0)
						end
					end
				end
			end
		end -- remote range

		if  Entity.IsHero(Unit)
		and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
		and not NPC.IsIllusion(Unit)
		then
			if Entity.IsAlive(Unit)
			and not Entity.IsDormant(Unit) then
				if optionBlastInfo and Ability.GetLevel(blast) ~= 0 then -- blast damage display
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						local Hp = Entity.GetHealth(Unit)
						if Entity.GetMaxHealth(Unit) - Entity.GetHealth(Unit) ~= 0 then
							Hp = Hp + NPC.GetHealthRegen(Unit) * 2
						end
						Hp = Hp - blast_damage * NPC.GetMagicalArmorDamageMultiplier(Unit) * magicalDamageMul
						if Hp > 0 then
							Renderer.SetDrawColor(255, 0, 0, 255)
						else
							Renderer.SetDrawColor(0, 255, 0, 255)
						end
						Renderer.DrawText(TechiesHUD.font, x, y, math.ceil(Hp), 0)
					end
				end -- blast damage display

				if optionDetonate and hero_time[Entity.GetIndex(Unit)] ~= nil and GameRules.GetGameTime() - hero_time[Entity.GetIndex(Unit)] < optionDelay / 1000 + 0.3 then -- remote delay draw
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(TechiesHUD.font, x, y - 15, math.floor(((optionDelay / 1000) + 0.3 - (GameRules.GetGameTime() - hero_time[Entity.GetIndex(Unit)])) * 100) / 100, 0)
					end
				end -- remote delay draw

				if optionForceDrawLine and force ~= nil then -- force stuff line
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						local rotate = Entity.GetAbsRotation(Unit):GetYaw()
						local x4 = 600 * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
						local y4 = 0 * math.cos(rotate / 57.3) + 600 * math.sin(rotate / 57.3)
						local x3,y3,visible3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
						Renderer.DrawLine(x, y, x3, y3)
					end
				end -- force stuff line
			end

			if optionPanelInfo and Ability.GetLevel(remote) ~= 0 then -- remote num display
				local Hp = Entity.GetHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit))
				local Hp_all = Entity.GetMaxHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit))

				Renderer.SetDrawColor(0, 255, 0, 255)
				if optionPanelInfoColumn then
					if Entity.GetTeamNum(myHero) == 2 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + optionPanelInfoDist) * (Hero.GetPlayerID(Unit) - 4) + optionPanelInfoXR, 32 + optionPanelInfoY, (math.ceil(Hp * 10) / 10), 0)
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + optionPanelInfoDist) * (Hero.GetPlayerID(Unit) - 4) + optionPanelInfoXR, 52 + optionPanelInfoY + optionPanelInfoYColumn, (math.ceil(Hp_all * 10) / 10), 0)
						if optionPanelInfoGemAndSentry then
							if NPC.HasItem(Unit, "item_gem", 1) then
								Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + optionPanelInfoDist) * (Hero.GetPlayerID(Unit) - 4) + optionPanelInfoXR, 72 + optionPanelInfoY + optionPanelInfoYColumn, "G", 0)
							end
							if NPC.HasItem(Unit, "item_ward_sentry", 1) or NPC.HasItem(Unit, "item_ward_sentry", 0) or NPC.HasItem(Unit, "item_ward_dispenser", 1) or NPC.HasItem(Unit, "item_ward_dispenser", 0) then
								Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 50 + (53 + optionPanelInfoDist) * (Hero.GetPlayerID(Unit) - 4) + optionPanelInfoXR, 72 + optionPanelInfoY + optionPanelInfoYColumn, "S", 0)
							end
						end
					end
					if Entity.GetTeamNum(myHero) == 3 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + optionPanelInfoDist) * Hero.GetPlayerID(Unit) + optionPanelInfoXL, 32 + optionPanelInfoY, (math.ceil(Hp * 10) / 10), 0)
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + optionPanelInfoDist) * Hero.GetPlayerID(Unit) + optionPanelInfoXL, 52 + optionPanelInfoY + optionPanelInfoYColumn, (math.ceil(Hp_all * 10) / 10), 0)
						if optionPanelInfoGemAndSentry then
							if NPC.HasItem(Unit, "item_gem", 1) then
								Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + optionPanelInfoDist) * Hero.GetPlayerID(Unit) + optionPanelInfoXL, 72 + optionPanelInfoY + optionPanelInfoYColumn, "G", 0)
							end
							if NPC.HasItem(Unit, "item_ward_sentry", 1) or NPC.HasItem(Unit, "item_ward_sentry", 0) or NPC.HasItem(Unit, "item_ward_dispenser", 1) or NPC.HasItem(Unit, "item_ward_dispenser", 0) then
								Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 380 + (53 + optionPanelInfoDist) * Hero.GetPlayerID(Unit) + optionPanelInfoXL, 72 + optionPanelInfoY + optionPanelInfoYColumn, "S", 0)
							end
						end
					end
				else
					if Entity.GetTeamNum(myHero) == 2 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + optionPanelInfoDist) * (Hero.GetPlayerID(Unit) - 4) + optionPanelInfoXR, 32 + optionPanelInfoY, (math.ceil(Hp * 10) / 10).. "|" .. (math.ceil(Hp_all * 10) / 10), 0)
					end
					if Entity.GetTeamNum(myHero) == 3 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + optionPanelInfoDist) * Hero.GetPlayerID(Unit) + optionPanelInfoXL, 32 + optionPanelInfoY, (math.ceil(Hp * 10) / 10) .. "|" .. (math.ceil(Hp_all * 10) / 10), 0)
					end
				end
			end -- remote num display
		end
	end
end

function SetSpot()
	local optionAutoPlantStackRange = GUI.Get(TechiesHUD.Identity .. "optionAutoPlantStackRange")
	if Input.IsKeyDown(Enum.ButtonCode.KEY_LSHIFT) then
		local spot = {}
		local closest_remote = nil
		local cursor_pos = Input.GetWorldCursorPos()
		if optionAutoPlantStackRange ~= 0 then
			for i = 0, NPCs.Count() do
				local Unit = NPCs.Get(i)
				local UnitPos = Entity.GetAbsOrigin(Unit)
				if NPC.IsPositionInRange(Unit, cursor_pos, optionAutoPlantStackRange, Enum.TeamType.TEAM_FRIEND)
				and NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
				then
					if closest_remote == nil or (UnitPos - cursor_pos):Length() < (closest_remote - cursor_pos):Length() then
						closest_remote = UnitPos
					end
				end
			end
		end
		if closest_remote == nil then
			spot.position = cursor_pos
		else
			spot.position = closest_remote
		end
		spot.num_mines = 0
		table.insert(spot_for_plant, spot)
	else
		spot_for_plant = {}
	end
end

function TechiesHUD.OnUpdate()
	if not optionTotal then return end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
		return
	end
	local remote = NPC.GetAbilityByIndex(myHero, 5)
	local remote_damage = Ability.GetLevelSpecialValueFor(remote, "damage")
	local force = NPC.GetItem(myHero, "item_force_staff", 1)
	if optionAutoPlant then
		for i, spot in pairs(spot_for_plant) do
			spot.num_mines = 0
			for j = 0, NPCs.Count() do
				local Unit2 = NPCs.Get(j)
				if NPC.IsPositionInRange(Unit2, spot.position, 200, Enum.TeamType.TEAM_FRIEND)
				and NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil
				then
					spot.num_mines = spot.num_mines + 1
				end
			end
		end
		if remote ~= nil and Ability.GetLevel(remote) ~= 0 and Ability.GetCooldownTimeLeft(remote) == 0 and not Ability.IsInAbilityPhase(remote) and GameRules.GetGameTime() - plant_time > Ability.GetCastPoint(remote) + 0.1 then
			local step = 0
			for i, spot in pairs(spot_for_plant) do
				if spot.num_mines < tonumber(optionAutoPlantNumMines) and step == 0 then
					if (Entity.GetAbsOrigin(myHero) - spot.position):Length() < Ability.GetCastRange(remote) then
						Ability.CastPosition(remote, spot.position, 0)
						plant_time = GameRules.GetGameTime()
						step = 1
					else
						if not Input.IsKeyDown(Enum.ButtonCode.KEY_LSHIFT) then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, nil, spot.position, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, nil, 0, 1)
							plant_time = GameRules.GetGameTime() - 1.9
							step = 1
						end
					end
				end
			end
		end
	end

	if hero_cam_time ~= nil and GameRules.GetGameTime() - hero_cam_time > 1 then
		local myHero_pos = Entity.GetAbsOrigin(myHero)
		Engine.ExecuteCommand("dota_camera_set_lookatpos " .. myHero_pos:GetX() .. " " .. myHero_pos:GetY())
		hero_cam_time = nil
	end
	if Ability.GetLevel(remote) ~= 0 then -- remote auto detonate
		local remote_sum_damage = {}
		local fast_remote_sum_damage = {}
		local force_remote_sum_damage = {}
		for i = 0, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if NPC.GetModifier(Unit, "modifier_techies_remote_mine") and Entity.IsAlive(Unit) then
				if mines_damage[Entity.GetIndex(Unit)] == nil then
					mines_damage[Entity.GetIndex(Unit)] = remote_damage
				end
				for j, Unit2 in pairs(NPC.GetHeroesInRadius(Unit, 425 - 24 + 600 + (NPC.HasItem(myHero, "item_aether_lens", 1) and 1 or 0) * 220, Enum.TeamType.TEAM_ENEMY)) do
					--num_proc = num_proc + 1
					local UnitPos2 = Entity.GetAbsOrigin(Unit2)
					if NPC.IsPositionInRange(Unit, UnitPos2, 425, 0) then
						if remote_sum_damage[Entity.GetIndex(Unit2)] == nil then
							remote_sum_damage[Entity.GetIndex(Unit2)] = 0
						end
						remote_sum_damage[Entity.GetIndex(Unit2)] = remote_sum_damage[Entity.GetIndex(Unit2)] + mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						if optionDetonateFast and CheckMove(Unit2, Unit, 0.3 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.04 * (Entity.GetHealth(Unit2) / remote_damage)) == 1
						then
							if fast_remote_sum_damage[Entity.GetIndex(Unit2)] == nil then
								fast_remote_sum_damage[Entity.GetIndex(Unit2)] = 0
							end
							fast_remote_sum_damage[Entity.GetIndex(Unit2)] = fast_remote_sum_damage[Entity.GetIndex(Unit2)] + mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						end
					end

					local rotate = Entity.GetAbsRotation(Unit2):GetYaw()
					local x4 = 600 * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
					local y4 = 0 * math.cos(rotate / 57.3) + 600 * math.sin(rotate / 57.3)
					if NPC.IsPositionInRange(Unit, UnitPos2 + Vector(x4,y4,0), 425, 0) then
						if force_remote_sum_damage[Entity.GetIndex(Unit2)] == nil then
							force_remote_sum_damage[Entity.GetIndex(Unit2)] = 0
						end
						force_remote_sum_damage[Entity.GetIndex(Unit2)] = force_remote_sum_damage[Entity.GetIndex(Unit2)] + mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
					end
				end
			end
		end
		for i = 0, Heroes.Count() do
			local Unit = Heroes.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if Entity.IsHero(Unit)
			and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
			and not NPC.IsIllusion(Unit)
			and not Entity.IsDormant(Unit)
			and (NPC.IsKillable(Unit) or (NPC.GetUnitName(Unit) == "npc_dota_hero_skeleton_king" and optionDetonateWk) or (NPC.HasItem(Unit, "item_aegis", 1) and optionDetonateAegis))
			and Entity.IsAlive(Unit)
			then
				if hero_time[Entity.GetIndex(Unit)] == nil then
					hero_time[Entity.GetIndex(Unit)] = 0
				end
				if optionDetonate then -- auto detonate
					if optionForce then -- auto force stuff
						if force ~= nil then
							if hero_time[Entity.GetIndex(Unit)] == 1 and forced_time ~= 0 and GameRules.GetGameTime() - forced_time > 1 then
								hero_time[Entity.GetIndex(Unit)] = 0
								forced_time = 0
							end
							if NPC.IsPositionInRange(myHero, UnitPos, 1000, 0)
							and force_remote_sum_damage[Entity.GetIndex(Unit)] ~= nil and force_remote_sum_damage[Entity.GetIndex(Unit)] * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit) and GameRules.GetGameTime() - forc_time > 0.5 then
								if force_direction[i] == nil or force_direction[i] == 0 then
									force_direction[i] = GameRules.GetGameTime()
								elseif Ability.GetCooldownTimeLeft(force) == 0 and GameRules.GetGameTime() - force_direction[i] > Config.ReadInt("TechiesHUD", "Force Stuff delay", 500) / 1000 then
									Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, Unit, Vector(0, 0, 0), force, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, 0, 0)
									forc_time = GameRules.GetGameTime()
									hero_time[Entity.GetIndex(Unit)] =  1
									forced_time = GameRules.GetGameTime()
									force_direction[i] = 0
								end
							else
								force_direction[i] = 0
							end
						end
					end -- auto force stuff
					if ((remote_sum_damage[Entity.GetIndex(Unit)] ~= nil and remote_sum_damage[Entity.GetIndex(Unit)] * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit)) or (fast_remote_sum_damage[Entity.GetIndex(Unit)] ~= nil and fast_remote_sum_damage[Entity.GetIndex(Unit)] * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit))) then -- and not NPC.HasModifier(Unit, "modifier_item_forcestaff_active")
						if hero_time[Entity.GetIndex(Unit)] == 0 then
							hero_time[Entity.GetIndex(Unit)] = GameRules.GetGameTime()
						end
						local remote_need_damage = Entity.GetHealth(Unit) + NPC.GetHealthRegen(Unit) * 0.3
						if GameRules.GetGameTime() - check_detonate > 0.5 and hero_time[Entity.GetIndex(Unit)] ~= 0 and (GameRules.GetGameTime() - hero_time[Entity.GetIndex(Unit)] > optionDelay / 1000 or (fast_remote_sum_damage[Entity.GetIndex(Unit)] ~= nil and fast_remote_sum_damage[Entity.GetIndex(Unit)] * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit))) then
							local unit_pos = nil
							for j = 0, NPCs.Count() do
								local Unit2 = NPCs.Get(j)
								if NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil
								and Entity.IsAlive(Unit2)
								and NPC.IsPositionInRange(Unit2, UnitPos, 425, 0)
								then
									if remote_need_damage > 0 or optionLegitDetonate then
										if optionDetonateCam then
											unit_pos = Entity.GetAbsOrigin(Unit)
										end
										Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(Unit2, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Unit2, 0, 0)
										check_detonate = GameRules.GetGameTime()
										remote_need_damage = remote_need_damage - (mines_damage[Entity.GetIndex(Unit2)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit)
									end
								end
							end
							if unit_pos ~= nil then
								local x, y = Renderer.WorldToScreen(unit_pos)
								if x < 0 or x > size_x or y < 0 or y > size_y then
									Engine.ExecuteCommand("dota_camera_set_lookatpos " .. unit_pos:GetX() .. " " .. unit_pos:GetY())
									hero_cam_time = GameRules.GetGameTime()
								end
								unit_pos = nil
							end
						end
					else
						if hero_time[Entity.GetIndex(Unit)] ~= 1 then
							hero_time[Entity.GetIndex(Unit)] = 0
						end
					end
				end -- auto detonate
			end
		end
	end
end

function TechiesHUD.OnPrepareUnitOrders(orders)
    if not optionTotal then return true end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return true
	end
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
		return true
	end

	if orders.order ~= Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION and orders.order ~= Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TOGGLE_AUTO then return true end
    if not orders.ability then return true end

	if Ability.GetName(orders.ability) == "techies_suicide" then
		cast_pos = orders.position
		return true
	end

	if optionFDFailSwitch and Ability.GetName(orders.ability) == "techies_focused_detonate" then
		if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
			Player.PrepareUnitOrders(orders.player, Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, orders.target, Input.GetWorldCursorPos(), orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			return false
		end
		local remote_damage = Ability.GetLevelSpecialValueFor(NPC.GetAbilityByIndex(myHero, 5), "damage")
		local hp = {}
		local num_ready_mines = 0
		for i = 0, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
			and NPC.IsPositionInRange(Unit, orders.position, 700, 0)
			then
				num_ready_mines = num_ready_mines + 1
				if mines_damage[Entity.GetIndex(Unit)] == nil then
					mines_damage[Entity.GetIndex(Unit)] = remote_damage
				end
				local num_enemy = 0
				for j, v in pairs(NPC.GetHeroesInRadius(Unit, 425 - 24, Enum.TeamType.TEAM_ENEMY)) do
					if Entity.IsAlive(v)
					and not Entity.IsDormant(v)
					and (NPC.IsKillable(v) or NPC.GetUnitName(v) == "npc_dota_hero_skeleton_king" or NPC.HasItem(v, "item_aegis", 1) or NPC.GetModifier(v, "modifier_dazzle_shallow_grave") ~= nil)
					then
						if hp[Entity.GetIndex(v)] == nil then
							hp[Entity.GetIndex(v)] = Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3
						end
						if mines_damage[Entity.GetIndex(Unit)] ~= nil and hp[Entity.GetIndex(v)] > 0 or optionFDFailSwitchMode then
							hp[Entity.GetIndex(v)] = hp[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(v)
							num_enemy = num_enemy + 1
						end
					end
				end
				if num_enemy ~= 0 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(Unit, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Unit, 0, 0)
				end
			end
		end
		return false
	end
	if GUI.IsEnabled(TechiesHUD.Identity .. "optionStack") then
		if Ability.GetName(orders.ability) ~= "techies_remote_mines"
		and Ability.GetName(orders.ability) ~= "techies_land_mines"
		and Ability.GetName(orders.ability) ~= "techies_stasis_trap"
		then return true end

		for i = 0, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if ((NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
			or NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil
			or NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil)
			and Entity.IsAlive(Unit)
			and NPC.IsPositionInRange(Unit, orders.position, GUI.Get(TechiesHUD.Identity .. "optionStackRange"), 0))
			then
				Player.PrepareUnitOrders(orders.player, orders.order, orders.target, UnitPos, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
				return false
			end
		end
	end
    return true
end

return TechiesHUD