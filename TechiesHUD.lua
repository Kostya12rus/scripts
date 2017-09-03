local TechiesHUD = {}

TechiesHUD.Identity = "TechiesHUD"
TechiesHUD.Locale = {
	["name"] = {
		["english"] = "TechiesHUD"
	},
	["desc"] = {
		["english"] = "TechiesHUD v1.2",
		["russian"] = "TechiesHUD v1.2"
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
	["drawCircleMethod"] = {
		["english"] = "The method of drawing a circle",
		["russian"] = "Метод рисования круга"
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
	["minePlacer"] = {
		["english"] = "Optimization for the mines plant",
		["russian"] = "Оптимизация для установки мин"
	},
	["minePlacerLM"] = {
		["english"] = "Find the closest place when installing the Land Mine",
		["russian"] = "Найти ближайшее место при установке Land Mine"
	},
	["minePlacerST"] = {
		["english"] = "Find the closest place when installing the Stasis Trap",
		["russian"] = "Найти ближайшее место при установке Stasis Trap"
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
	["altInfo"] = {
		["english"] = "Show additional info if alt key pressed",
		["russian"] = "Показывать дополнительную информацию, если нажата клавиша alt"
	},
	["altInfoDrawing"] = {
		["english"] = "Alt info",
		["russian"] = "Alt информация"
	},
	["altInfoRemoteNumberInManaPool"] = {
		["english"] = "Show under the cursor a stock of remote mines in the manapool",
		["russian"] = "Показывать под курсором запас remote mines в манапуле"
	},
	["altInfoEnemyNumRemote"] = {
		["english"] = "Show under the enemy hero the number of remote mines needed to kill",
		["russian"] = "Показывать под вражеским героем количество remote mines необходимых для убийства"
	},
	["altInfoTimeMines"] = {
		["english"] = "Show under remote mines, list mines with time left, level and detonate button",
		["russian"] = "Показывать под remote mines, лист мин с оставшимся временем и кнопкой взрыва"
	},
	["altInfoTimeMinesPanelSize"] = {
		["english"] = "Panel size",
		["russian"] = "Размер панели"
	},
	["altInfoNumLevelRemote"] = {
		["english"] = "Show under remote mines, how many there are mines of a certain level",
		["russian"] = "Показывать под remote mines, сколько там мин определенного уровня"
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
		["english"] = "",
		["russian"] = ""
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
	},
	["drawCircleMode"] = {
		["english"] = {
			[0] = "Lines",
			[1] = "Particles"
		},
		["russian"] = {
			[0] = "Линии",
			[1] = "Частицы"
		}
	}
}

if not TechiesHUDParticleList then
	TechiesHUDParticleList = {}
end

local optionTotal
local optionUpdate

local optionDetonate
local optionDrawCircleMethod
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
local optionFont3

local optionAltInfoDrawing
local optionAltInfoRemoteNumberInManaPool
local optionAltInfoNumLevelRemote
local optionAltInfoEnemyNumRemote
local optionAltInfoTimeMines
local optionAltInfoTimeMinesPanelSize

local optionMinePlacerLM
local optionMinePlacerST

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
	if TechiesHUDParticleList[ent] then
		Particle.Destroy(TechiesHUDParticleList[ent].particle)
		if TechiesHUDParticleList[ent].particle2 then
			Particle.Destroy(TechiesHUDParticleList[ent].particle2)
		end
		TechiesHUDParticleList[ent] = nil
	end
	if not optionTotal then return end
	if not Entity.IsNPC(ent) then return end
	if NPC.GetUnitName(ent) == "npc_dota_techies_remote_mine" then
		mines_damage[Entity.GetIndex(ent)] = nil
		remote_create_time[Entity.GetIndex(ent)] = nil
	end
end
function TechiesHUD.Code(x, y)
	local xmin, ymin = 0, 0
	local xmax, ymax = Renderer.GetScreenSize()
	local result = ((x < xmin) and 1 or 0) << 3 |
		((x > xmax) and 1 or 0) << 2 |
		((y < ymin) and 1 or 0) << 1 |
		((y > ymax) and 1 or 0)
	return result
end


function TechiesHUD.ClipLine(x1, y1, x2, y2)
	local c1, c2 = TechiesHUD.Code(x1, y1), TechiesHUD.Code(x2, y2)
	local dx, dy
	local xmin, ymin = 0, 0
	local xmax, ymax = Renderer.GetScreenSize()
	while (c1 | c2) ~= 0 do
		if (c1 & c2) ~= 0 then
			return x1, y1, x2, y2
		end
		dx = x2 - x1
		dy = y2 - y1
		if c1 ~= 0 then
			if x1 < xmin then
				y1 = y1 + dy * (xmin - x1) / dx
				x1 = xmin
			elseif x1 > xmax then
				y1 = y1 + dy * (xmax - x1) / dx
				x1 = xmax
			elseif y1 < ymin then
				x1 = x1 + dx * (ymin - y1) / dy
				y1 = ymin
			elseif y1 > ymax then
				x1 = x1 + dx * (ymax - y1) / dy
				y1 = ymax
			end
			c1 = TechiesHUD.Code(x1, y1)
		else
			if x2 < xmin then
				y2 = y2 + dy * (xmin - x2) / dx
				x2 = xmin
			elseif x2 > xmax then
				y2 = y2 + dy * (xmax - x2) / dx
				x2 = xmax
			elseif y2 < ymin then
				x2 = x2 + dx * (ymin - y2) / dy
				y2 = ymin
			elseif y2 > ymax then
				x2 = x2 + dx * (ymax - y2) / dy
				y2 = ymax
			end
			c2 = TechiesHUD.Code(x2, y2)
		end
	end
	return x1, y1, x2, y2
end

function TechiesHUD.DrawCircle(UnitPos, radius)
	local x1, y1, visible1 = Renderer.WorldToScreen(UnitPos)
	if visible1 == 1 then
		local x4, y4, x3, y3, visible3
		local dergee = optionResCircle
		for angle = 0, 360 / dergee do
			x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
			y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
			local tmp_vec = UnitPos + Vector(x4,y4,0)
			if PositInfo ~= nil and PositInfo.GetHeightInPoint(tmp_vec:GetX(), tmp_vec:GetY()) ~= nil then
				tmp_vec:SetZ(PositInfo.GetHeightInPoint(tmp_vec:GetX(), tmp_vec:GetY()))
			end
			x3, y3, visible3 = Renderer.WorldToScreen(tmp_vec)
			if visible1 == 1 and visible3 == 1 then
				local tx1, ty1, tx3, ty3 = TechiesHUD.ClipLine(x1, y1, x3, y3)
				Renderer.DrawLine(math.floor(tx1), math.floor(ty1), math.floor(tx3), math.floor(ty3))
			end
			x1, y1, visible1 = Renderer.WorldToScreen(tmp_vec)
		end
	end
end

function TechiesHUD.CheckMove(Unit, Unit2, pred_time)
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

	if GUI.Get(TechiesHUD.Identity .. "optionDrawCircleMethod", 1) and 1 or 0 == 1 then
		for k, v in pairs(GUI.Get(TechiesHUD.Identity .. "optionDrawCircleMethod", 1)) do
			if v ~= 1 then
				for i, particle in pairs(TechiesHUDParticleList) do
					Particle.Destroy(TechiesHUDParticleList[particle.Unit].particle)
					if TechiesHUDParticleList[particle.Unit].particle2 then
						Particle.Destroy(TechiesHUDParticleList[particle.Unit].particle2)
					end
					TechiesHUDParticleList[particle.Unit] = nil
				end
			end
			optionDrawCircleMethod = v == 1
		end
	else
		optionDrawCircleMethod = false
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
	if GUI.Get(TechiesHUD.Identity .. "optionAltInfoTimeMinesPanelSize") ~= optionFont3 then
		optionFont3 = GUI.Get(TechiesHUD.Identity .. "optionAltInfoTimeMinesPanelSize")
		TechiesHUD.Panelfont = Renderer.LoadFont("Tahoma", math.floor(18 * tonumber(optionFont3) / 100), Enum.FontWeight.EXTRABOLD)
		TechiesHUD.Panelfont1 = Renderer.LoadFont("Tahoma", math.floor(18 * tonumber(optionFont3) / 100), Enum.FontWeight.NORMAL)
	end
	optionAltInfoDrawing = GUI.IsEnabled(TechiesHUD.Identity .. "optionAltInfoDrawing")
	optionAltInfoRemoteNumberInManaPool = GUI.IsEnabled(TechiesHUD.Identity .. "optionAltInfoRemoteNumberInManaPool")
	optionAltInfoNumLevelRemote = GUI.IsEnabled(TechiesHUD.Identity .. "optionAltInfoNumLevelRemote")
	optionAltInfoTimeMines = GUI.IsEnabled(TechiesHUD.Identity .. "optionAltInfoTimeMines")
	optionAltInfoTimeMinesPanelSize = GUI.Get(TechiesHUD.Identity .. "optionAltInfoTimeMinesPanelSize") / 100
	optionAltInfoEnemyNumRemote = GUI.IsEnabled(TechiesHUD.Identity .. "optionAltInfoEnemyNumRemote")

	optionMinePlacerLM = GUI.IsEnabled(TechiesHUD.Identity .. "optionMinePlacerLM")
	optionMinePlacerST = GUI.IsEnabled(TechiesHUD.Identity .. "optionMinePlacerST")
end

local ClickSave = true
local CursorOnButton = false
local state_mines = {}
local need_enemy = {}
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
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAutoPlantKey", TechiesHUD.Locale["autoPlantKey"], GUI.MenuType.Key, "T", TechiesHUD.SetSpot)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "stackMinesSection", TechiesHUD.Locale["stackMinesSection"], GUI.MenuType.Label) -- Stack mines
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionStack", TechiesHUD.Locale["stackMines"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionStackRange", TechiesHUD.Locale["stackRange"], GUI.MenuType.Slider, 0, 200, 100)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "FDFailSwitchSection1", TechiesHUD.Locale["FDFailSwitchSection1"], GUI.MenuType.Label) -- FD FailSwitch
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "FDFailSwitchSection2", TechiesHUD.Locale["FDFailSwitchSection2"], GUI.MenuType.Label) -- FD FailSwitch
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionFDFailSwitch", TechiesHUD.Locale["FDFailSwitch"], GUI.MenuType.CheckBox, 1)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionEmpty", TechiesHUD.Locale["empty"], GUI.MenuType.Label) -- Alt info

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionFDFailSwitchMod", TechiesHUD.Locale["FDFailSwitchTogleMode"], GUI.MenuType.SelectBox, TechiesHUD.Locale["detonateMode"], { 0 }, 1, nil)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfo", TechiesHUD.Locale["altInfo"], GUI.MenuType.Label) -- Alt info
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfoDrawing", TechiesHUD.Locale["altInfoDrawing"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfoRemoteNumberInManaPool", TechiesHUD.Locale["altInfoRemoteNumberInManaPool"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfoNumLevelRemote", TechiesHUD.Locale["altInfoNumLevelRemote"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfoEnemyNumRemote", TechiesHUD.Locale["altInfoEnemyNumRemote"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfoTimeMines", TechiesHUD.Locale["altInfoTimeMines"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAltInfoTimeMinesPanelSize", TechiesHUD.Locale["altInfoTimeMinesPanelSize"], GUI.MenuType.Slider, 50, 200, 100)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionEmpty", TechiesHUD.Locale["empty"], GUI.MenuType.Label) -- Alt info

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "drawingOptionSection", TechiesHUD.Locale["drawingOptionSection"], GUI.MenuType.Label) -- Drawing
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfo", TechiesHUD.Locale["panelInfo"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDrawCircleMethod", TechiesHUD.Locale["drawCircleMethod"], GUI.MenuType.SelectBox, TechiesHUD.Locale["drawCircleMode"], { 0 }, 1, nil)
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

		--minePlacerLM
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionMinePlacer", TechiesHUD.Locale["minePlacer"], GUI.MenuType.Label) -- Alt info
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionMinePlacerLM", TechiesHUD.Locale["minePlacerLM"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionMinePlacerST", TechiesHUD.Locale["minePlacerST"], GUI.MenuType.CheckBox, 1)
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
		if Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero) >= 0.5 then
			Renderer.SetDrawColor(255, 255, 255, 255)
		else
			Renderer.SetDrawColor(255, 0, 0, 255)
		end
		TechiesHUD.DrawCircle(cast_pos, 400)
		local x, y = Renderer.WorldToScreen(cast_pos)
		Renderer.DrawTextCentered(TechiesHUD.font, x, y, math.floor(Entity.GetHealth(myHero) - Entity.GetMaxHealth(myHero) * 0.5), 0)
	end

	if optionAutoPlant then
		for i, spot in pairs(spot_for_plant) do
			local x, y, visible = Renderer.WorldToScreen(spot.position)
			if visible == 1 then
				Renderer.SetDrawColor(255, 255, 255, 255)
				TechiesHUD.DrawCircle(spot.position, 200)
			end
		end
	end

	if remote ~= nil and Ability.GetLevel(remote) ~= 0 and Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and optionAltInfoDrawing and optionAltInfoRemoteNumberInManaPool then
			local x, y = Renderer.WorldToScreen(Input.GetWorldCursorPos())
			Renderer.SetDrawColor(255, 255, 255, 255)
			local mp = Ability.GetCooldownTimeLeft(remote) * NPC.GetManaRegen(myHero) + NPC.GetMana(myHero)
			local num_remote = 0
			if (Ability.GetCooldownLength(remote) + Ability.GetCastPoint(remote)) * NPC.GetManaRegen(myHero) < Ability.GetManaCost(remote) then
				while mp >= Ability.GetManaCost(remote) do
					num_remote = num_remote + 1
					mp = mp - Ability.GetManaCost(remote) + (Ability.GetCooldownLength(remote) + Ability.GetCastPoint(remote)) * NPC.GetManaRegen(myHero)
				end
				Renderer.DrawText(TechiesHUD.font, x, y - 20, num_remote +  math.ceil(mp / Ability.GetManaCost(remote) * 100) / 100, 0)
			else
				Renderer.DrawText(TechiesHUD.font, x, y - 20, "inf", 0)
			end
	end

	remote_pos_draw = {}
	mines_num = {}
	CursorOnButton = false
	for i = 1, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)

		if NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil then -- land mines range
			Renderer.SetDrawColor(255, 20, 0, 255)
			if optionLR then
				if optionDrawCircleMethod then
					if not TechiesHUDParticleList[Unit] then
						local particle = {particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf"), Unit = Unit}
						Particle.SetControlPoint(particle.particle, 1, Vector(255, 80, 80))
						Particle.SetControlPoint(particle.particle, 3, Vector(9, 0, 0))
						Particle.SetControlPoint(particle.particle, 2, Vector(425, 255, 0))
						Particle.SetControlPoint(particle.particle	, 0, Entity.GetAbsOrigin(Unit))
						TechiesHUDParticleList[Unit] = particle
					end
				else
					TechiesHUD.DrawCircle(UnitPos, 400)
				end
			end
			if GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_land_mine")) < 1.75 then
				local x, y, visible = Renderer.WorldToScreen(UnitPos)
				if visible then
					Renderer.DrawText(TechiesHUD.font, x, y, math.floor((1.75 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_land_mine")))) * 100) / 100, 0)
				end
			else
				local check_loop = 0
				if next(Entity.GetUnitsInRadius(Unit, 400, Enum.TeamType.TEAM_ENEMY)) then
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
		elseif NPC.GetUnitName(Unit) == "npc_dota_techies_land_mine" and not Entity.IsAlive(Unit) and TechiesHUDParticleList[Unit] then
			Particle.Destroy(TechiesHUDParticleList[Unit].particle)
			if TechiesHUDParticleList[Unit].particle2 then
				Particle.Destroy(TechiesHUDParticleList[Unit].particle2)
			end
			TechiesHUDParticleList[Unit] = nil
		end -- land mines range

		if NPC.GetUnitName(Unit) == "npc_dota_techies_stasis_trap" and Entity.IsAlive(Unit) then -- stasis range
			Renderer.SetDrawColor(0, 255, 255, 255)
			if optionSR then
				if optionDrawCircleMethod then
					if not TechiesHUDParticleList[Unit] then
						local particle = {particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf"), Unit = Unit, particle2 = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")}
						Particle.SetControlPoint(particle.particle, 1, Vector(80, 100, 255))
						Particle.SetControlPoint(particle.particle, 3, Vector(20, 0, 0))
						Particle.SetControlPoint(particle.particle, 2, Vector(430, 255, 0))
						Particle.SetControlPoint(particle.particle	, 0, Entity.GetAbsOrigin(Unit))
						Particle.SetControlPoint(particle.particle2, 1, Vector(0, 255, 255))
						Particle.SetControlPoint(particle.particle2, 3, Vector(20, 0, 0))
						Particle.SetControlPoint(particle.particle2, 2, Vector(630, 255, 0))
						Particle.SetControlPoint(particle.particle2	, 0, Entity.GetAbsOrigin(Unit))
						TechiesHUDParticleList[Unit] = particle
					end
				else
					TechiesHUD.DrawCircle(UnitPos, 600)
					Renderer.SetDrawColor(0, 0, 255, 255)
					TechiesHUD.DrawCircle(UnitPos, 400)
				end
			end
			if NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil
			and GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_stasis_trap")) < 2 then
				local x, y, visible = Renderer.WorldToScreen(UnitPos)
				if visible then
					Renderer.DrawText(TechiesHUD.font, x, y, math.floor((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_stasis_trap")))) * 100)/100, 0)
				end
			end
		elseif NPC.GetUnitName(Unit) == "npc_dota_techies_stasis_trap" and not Entity.IsAlive(Unit) and TechiesHUDParticleList[Unit] then
			Particle.Destroy(TechiesHUDParticleList[Unit].particle)
			if TechiesHUDParticleList[Unit].particle2 then
				Particle.Destroy(TechiesHUDParticleList[Unit].particle2)
			end
			TechiesHUDParticleList[Unit] = nil
		end -- stasis range

		if NPC.GetUnitName(Unit) == "npc_dota_techies_remote_mine" and Entity.IsAlive(Unit)then -- remote range
			if optionRR then
				if remote_pos_draw[UnitPos:GetX()] == nil then
					remote_pos_draw[UnitPos:GetX()] = {}
					remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] = 0
				end
				if remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] ~= 1 then
					remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] = 1
					if optionDrawCircleMethod then
						if not TechiesHUDParticleList[Unit] then
							local particle = {particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf"), Unit = Unit}
							Particle.SetControlPoint(particle.particle, 1, Vector(80, 255, 50))
							Particle.SetControlPoint(particle.particle, 3, Vector(20, 0, 0))
							Particle.SetControlPoint(particle.particle, 2, Vector(455, 255, 0))
							Particle.SetControlPoint(particle.particle	, 0, Entity.GetAbsOrigin(Unit))
							TechiesHUDParticleList[Unit] = particle
						end
					else
						Renderer.SetDrawColor(0, 255, 0, 255)
						TechiesHUD.DrawCircle(UnitPos, 425)
					end
				end
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
						local num_mines_1_lvl = 0
						local num_mines_2_lvl = 0
						local num_mines_3_lvl = 0
						local oldest_mine = {die_time = math.huge}
						local stack_mines = {}

						for j = 1, NPCs.Count() do
							local Unit2 = NPCs.Get(j)
							local remote_modif = NPC.GetModifier(Unit2, "modifier_techies_remote_mine")
							if NPC.IsPositionInRange(Unit2, UnitPos, 200, Enum.TeamType.TEAM_FRIEND)
							and remote_modif
							then
								if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and optionAltInfoDrawing then
									local obj_mine = {Unit = Unit2}
									if optionAltInfoNumLevelRemote then
										if mines_damage[Entity.GetIndex(Unit2)] == nil then
											mines_damage[Entity.GetIndex(Unit2)] = remote_damage
										end
										local mines_level = (mines_damage[Entity.GetIndex(Unit2)] - 150) / 150
										obj_mine.level = mines_level
										if mines_level == 1 then
											num_mines_1_lvl = num_mines_1_lvl + 1
										elseif mines_level == 2 then
											num_mines_2_lvl = num_mines_2_lvl + 1
										elseif mines_level == 3 then
											num_mines_3_lvl = num_mines_3_lvl + 1
										end
									end
									if optionAltInfoTimeMines then
										local modif_die_time = Modifier.GetDieTime(remote_modif)
										obj_mine.die_time = modif_die_time
										if oldest_mine.die_time > modif_die_time then
											oldest_mine = {die_time = modif_die_time, mine = Unit2}
										end
									end
									table.insert(stack_mines, obj_mine)
								else
									num_mines = num_mines + 1
								end
								mines_num[j] = 0
								if state_mines[Entity.GetIndex(Unit)] == nil then
									state_mines[Entity.GetIndex(Unit)] = true
								end
								if need_enemy[Entity.GetIndex(Unit)] == nil then
									need_enemy[Entity.GetIndex(Unit)] = 1
								end
								need_enemy[Entity.GetIndex(Unit2)] = need_enemy[Entity.GetIndex(Unit)]
								state_mines[Entity.GetIndex(Unit2)] = state_mines[Entity.GetIndex(Unit)]
								if TechiesHUDParticleList[Unit2] then
									if not state_mines[Entity.GetIndex(Unit)] then
										Particle.SetControlPoint(TechiesHUDParticleList[Unit2].particle, 1, Vector(20, 120, 25))
									else
										Particle.SetControlPoint(TechiesHUDParticleList[Unit2].particle, 1, Vector(80, 255, 50))
									end
								end
							end
						end
						Renderer.SetDrawColor(255, 255, 255, 255)
						if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and optionAltInfoDrawing then
							if optionAltInfoNumLevelRemote then
								Renderer.DrawText(TechiesHUD.font, x, y - math.floor(tonumber(optionFont1) * 1), "1:" .. num_mines_1_lvl .. " 2:" .. num_mines_2_lvl .. " 3:" .. num_mines_3_lvl, 0)
							end
							if optionAltInfoTimeMines then
								table.sort(stack_mines, function (a, b) return a.die_time < b.die_time end)
								--need_enemy[Entity.GetIndex(Unit)]
								local h = 0
								if #stack_mines <= 3 then
									h = 1
								end
								Renderer.SetDrawColor(30, 30, 30, 150)
								Renderer.DrawFilledRect(x, y, math.floor(80 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) * #stack_mines + h)
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x, y, math.floor(80 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) * #stack_mines + h)
								if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
									CursorOnButton = true
									Renderer.SetDrawColor(100, 100, 100, 250)
									if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
										if ClickSave then
											state_mines[Entity.GetIndex(Unit)] = not state_mines[Entity.GetIndex(Unit)]
											if not state_mines[Entity.GetIndex(Unit)] then
												Particle.SetControlPoint(TechiesHUDParticleList[Unit].particle, 1, Vector(20, 120, 25))
											else
												Particle.SetControlPoint(TechiesHUDParticleList[Unit].particle, 1, Vector(80, 255, 50))
											end
											ClickSave = false
										end
									else
										ClickSave = true
									end
								else
									Renderer.SetDrawColor(30, 30, 30, 150)
								end
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize) * 4)
								Renderer.SetDrawColor(255, 255, 255, 255)
								local text
								if state_mines[Entity.GetIndex(Unit)] then
									text = "on"
								else
									text = "off"
								end
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(8 * optionAltInfoTimeMinesPanelSize), text, 0)
								-- num min -
								if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
									CursorOnButton = true
									Renderer.SetDrawColor(100, 100, 100, 250)
									if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
										if ClickSave then
											if need_enemy[Entity.GetIndex(Unit)] > 1 then
												need_enemy[Entity.GetIndex(Unit)] = need_enemy[Entity.GetIndex(Unit)] - 1
											end
											ClickSave = false
										end
									else
										ClickSave = true
									end
								else
									Renderer.SetDrawColor(30, 30, 30, 150)
								end
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize), math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize), math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3)
								Renderer.SetDrawColor(255, 255, 255, 255)
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) + math.floor(8 * optionAltInfoTimeMinesPanelSize), "-", 0)

								-- num min text
								Renderer.SetDrawColor(30, 30, 30, 150)
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 2, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 2, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize) * 2)
								Renderer.SetDrawColor(255, 255, 255, 255)
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 2 + math.floor(8 * optionAltInfoTimeMinesPanelSize), need_enemy[Entity.GetIndex(Unit)], 0)

								-- num min +
								if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
									CursorOnButton = true
									Renderer.SetDrawColor(100, 100, 100, 250)
									if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
										if ClickSave then
											need_enemy[Entity.GetIndex(Unit)] = need_enemy[Entity.GetIndex(Unit)] + 1
											ClickSave = false
										end
									else
										ClickSave = true
									end
								else
									Renderer.SetDrawColor(30, 30, 30, 150)
								end
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(255, 255, 255, 255)
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3 + math.floor(8 * optionAltInfoTimeMinesPanelSize), "+", 0)

								for i, oldest_mine in pairs(stack_mines) do
									local h = 0
									if #stack_mines <= 3 then
										h = 1
									end
									Renderer.SetDrawColor(255, 255, 255, 255)
									Renderer.DrawText(TechiesHUD.Panelfont, x + math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (i - 1), math.floor((oldest_mine.die_time - GameRules.GetGameTime()) / 60) .. ":" .. string.format("%02d", math.floor((oldest_mine.die_time - GameRules.GetGameTime()) % 60)), 0)
									Renderer.DrawText(TechiesHUD.Panelfont, x + math.floor(5 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (i - 1), math.floor(oldest_mine.level))
									if Input.IsCursorInRect(x + math.floor(60 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (i - 1), x + math.floor(80 * optionAltInfoTimeMinesPanelSize) - (x + math.floor(60 * optionAltInfoTimeMinesPanelSize)), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * #stack_mines - (y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (#stack_mines - 1)) + 1) then
										CursorOnButton = true
										Renderer.SetDrawColor(100, 100, 100, 250)
										Renderer.DrawFilledRect(x + math.floor(60 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (i - 1), x + math.floor(80 * optionAltInfoTimeMinesPanelSize) - (x + math.floor(60 * optionAltInfoTimeMinesPanelSize)), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * #stack_mines - (y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (#stack_mines - 1)) + h)
										if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
											if ClickSave then
												Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(oldest_mine.Unit, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, oldest_mine.Unit, 0, 0)
												ClickSave = false
											end
										else
											ClickSave = true
										end
									end
									Renderer.SetDrawColor(200, 200, 200, 150)
									Renderer.DrawOutlineRect(x + math.floor(60 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * (i - 1), x + math.floor(80 * optionAltInfoTimeMinesPanelSize) - (x + math.floor(60 * optionAltInfoTimeMinesPanelSize)), math.floor(16 * optionAltInfoTimeMinesPanelSize) * (#stack_mines - (i - 1)) + h)
								end
							end
						else
							Renderer.DrawText(TechiesHUD.font, x, y, num_mines, 0)
						end
					end
				end
			end
		elseif NPC.GetUnitName(Unit) == "npc_dota_techies_remote_mine" and not Entity.IsAlive(Unit) and TechiesHUDParticleList[Unit] then
			Particle.Destroy(TechiesHUDParticleList[Unit].particle)
			if TechiesHUDParticleList[Unit].particle2 then
				Particle.Destroy(TechiesHUDParticleList[Unit].particle2)
			end
			TechiesHUDParticleList[Unit] = nil
			state_mines[Entity.GetIndex(Unit)] = nil
			need_enemy[Entity.GetIndex(Unit)] = nil
		end -- remote range

		if  Entity.IsHero(Unit)
		and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
		and not NPC.IsIllusion(Unit)
		then
			if Entity.IsAlive(Unit)
			and not Entity.IsDormant(Unit) then
				if optionBlastInfo and Ability.GetLevel(blast) ~= 0 then -- blast damage display
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible == 1 then
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
						-- if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and optionAltInfoDrawing then
							-- Renderer.SetDrawColor(255, 255, 255, 255)
							-- local x1, y1, visible1 = Renderer.WorldToScreen(UnitPos + Vector(NPC.GetMoveSpeed(Unit) * 2, 0, 0):Rotated(Entity.GetAbsRotation(Unit)))
							-- Renderer.DrawLine(x, y, x1, y1)
						-- end
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
				local Hp
				local Hp_all
				if NPC.HasAbility(Unit, "spectre_dispersion") then -- damage_reflection_pct
					local spectre_dispersion = 1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "spectre_dispersion"), "damage_reflection_pct") / 100
					Hp = Entity.GetHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit) * spectre_dispersion)
					Hp_all = Entity.GetMaxHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit) * spectre_dispersion)
				elseif NPC.HasAbility(Unit, "huskar_berserkers_blood") then -- maximum_resistance
					local huskar_hp = Entity.GetHealth(Unit)
					local huskar_max_hp = Entity.GetMaxHealth(Unit)
					local resist = (1 - (huskar_hp - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100)
					if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
						resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100
					end
					local base_resist = NPC.GetMagicalArmorDamageMultiplier(Unit) / (1 - resist)
					local num_calc = 0
					local last_remote_damage = 1
					while huskar_hp > 0 and num_calc < 20 do
						local resist = (1 - (huskar_hp - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100)
						if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
							resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100
						end
						huskar_hp = huskar_hp - ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * (1 - resist))
						num_calc = num_calc + 1
						last_remote_damage = ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * (1 - resist))
					end
					Hp = num_calc + huskar_hp / last_remote_damage
					num_calc = 0
					last_remote_damage = 1
					while huskar_max_hp > 0 and num_calc < 20 do
						local resist = (1 - (huskar_max_hp - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100)
						if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
							resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100
						end
						huskar_max_hp = huskar_max_hp - ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * (1 - resist))
						num_calc = num_calc + 1
						last_remote_damage = ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * (1 - resist))
					end
					Hp_all = num_calc + huskar_max_hp / last_remote_damage
				else
					Hp = Entity.GetHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit))
					Hp_all = Entity.GetMaxHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit))
				end
				if NPC.HasModifier(Unit, "modifier_item_hood_of_defiance_barrier") then
					Hp = Hp + 325 / (remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
					Hp_all = Hp_all + 325 / (remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
				end
				if NPC.HasModifier(Unit, "modifier_item_pipe_barrier") then
					Hp = Hp + 400 / (remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
					Hp_all = Hp_all + 400 / (remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
				end
				local x, y, visible = Renderer.WorldToScreen(UnitPos)
				if visible and Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and optionAltInfoDrawing and optionAltInfoEnemyNumRemote and not Entity.IsDormant(Unit) then
					Renderer.SetDrawColor(255, 255, 255, 255)
					Renderer.DrawText(TechiesHUD.font, x, y - 20, math.ceil(Hp * 10) / 10, 0)
				end
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

function TechiesHUD.SetSpot()
	local optionAutoPlantStackRange = GUI.Get(TechiesHUD.Identity .. "optionAutoPlantStackRange")
	if Input.IsKeyDown(Enum.ButtonCode.KEY_LSHIFT) then
		local spot = {}
		local closest_remote = nil
		local cursor_pos = Input.GetWorldCursorPos()
		if optionAutoPlantStackRange ~= 0 then
			for i = 1, NPCs.Count() do
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
			for j = 1, NPCs.Count() do
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
	if optionDetonate then -- auto detonate
		--------------------------- camera
		if hero_cam_time ~= nil and GameRules.GetGameTime() - hero_cam_time > 1 then
			Engine.ExecuteCommand("dota_camera_set_lookatpos " .. hero_cam_first_pos:GetX() .. " " .. hero_cam_first_pos:GetY())
			hero_cam_time = nil
		end
		--------------------------- calc damage
		local hp = {}
		local fasthp = {}
		local magic_shield = {}
		local magic_shield_f = {}
		for i = 1, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			local heroes_in_radius = NPC.GetHeroesInRadius(Unit, 425 - 24, Enum.TeamType.TEAM_ENEMY)
			if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
			and need_enemy[Entity.GetIndex(Unit)]
			and state_mines[Entity.GetIndex(Unit)]
			and #heroes_in_radius >= need_enemy[Entity.GetIndex(Unit)]
			then
				if mines_damage[Entity.GetIndex(Unit)] == nil then
					mines_damage[Entity.GetIndex(Unit)] = remote_damage
				end
				for j, v in pairs(heroes_in_radius) do
					if hp[Entity.GetIndex(v)] == nil then
						hp[Entity.GetIndex(v)] = (Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3)
						magic_shield[Entity.GetIndex(v)] = 0
						if NPC.HasModifier(v, "modifier_item_hood_of_defiance_barrier") then
							magic_shield[Entity.GetIndex(v)] = 325
						end
						if NPC.HasModifier(v, "modifier_item_pipe_barrier") then
							magic_shield[Entity.GetIndex(v)] = 400
						end
					end
					if fasthp[Entity.GetIndex(v)] == nil then
						fasthp[Entity.GetIndex(v)] = (Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3)
						magic_shield_f[Entity.GetIndex(v)] = 0
						if NPC.HasModifier(v, "modifier_item_hood_of_defiance_barrier") then
							magic_shield_f[Entity.GetIndex(v)] = 325
						end
						if NPC.HasModifier(v, "modifier_item_pipe_barrier") then
							magic_shield_f[Entity.GetIndex(v)] = 400
						end
					end
					if hp[Entity.GetIndex(v)] > 0 or optionLegitDetonate then
						local additional_res = 1
						local base_resist = NPC.GetMagicalArmorDamageMultiplier(v)

						if NPC.HasAbility(v, "spectre_dispersion") then -- damage_reflection_pct
							additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "spectre_dispersion"), "damage_reflection_pct") / 100)
						end

						if NPC.HasAbility(v, "huskar_berserkers_blood") then -- maximum_resistance
							local resist = (1 - (hp[Entity.GetIndex(v)] - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100)
							if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
								resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100
							end
							base_resist = base_resist / (1 - (1 - (Entity.GetHealth(v) - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100))
							additional_res = additional_res * (1 - resist)
						end
						hp[Entity.GetIndex(v)] = hp[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] - magic_shield[Entity.GetIndex(v)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * additional_res
						if magic_shield[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) > 0 then
							magic_shield[Entity.GetIndex(v)] = magic_shield[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
						else
							magic_shield[Entity.GetIndex(v)] = 0
						end
					end

					if fasthp[Entity.GetIndex(v)] > 0 and TechiesHUD.CheckMove(v, Unit, 0.3 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.04 * (Entity.GetHealth(v) / remote_damage)) == 1 and optionDetonateFast then
						local additional_res = 1
						local base_resist = NPC.GetMagicalArmorDamageMultiplier(v)

						if NPC.HasAbility(v, "spectre_dispersion") then -- damage_reflection_pct
							additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "spectre_dispersion"), "damage_reflection_pct") / 100)
						end

						if NPC.HasAbility(v, "huskar_berserkers_blood") then -- maximum_resistance
							local resist = (1 - (fasthp[Entity.GetIndex(v)] - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100)
							if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
								resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100
							end
							base_resist = base_resist / (1 - (1 - (Entity.GetHealth(v) - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100))
							additional_res = additional_res * (1 - resist)
						end
						fasthp[Entity.GetIndex(v)] = fasthp[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] - magic_shield_f[Entity.GetIndex(v)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * additional_res
						magic_shield_f[Entity.GetIndex(v)] = 0
					end
				end
			end
		end
		--------------------------- detonate logic
		if GameRules.GetGameTime() - check_detonate > 0.5 then
			local need_damage = {}
			local magic_shield = {}
			local hero_pos = nil
			for i = 1, NPCs.Count() do
				local Unit = NPCs.Get(i)
				local UnitPos = Entity.GetAbsOrigin(Unit)
				local heroes_in_radius = NPC.GetHeroesInRadius(Unit, 425 - 24, Enum.TeamType.TEAM_ENEMY)
				if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
				and state_mines[Entity.GetIndex(Unit)]
				--and #heroes_in_radius >= Menu.GetValue(TechiesHUD.optionDetonateNumEnemy)
				then
					local num_enemy = 0
					for j, v in pairs(heroes_in_radius) do
						if NPC.IsKillable(v) and not NPC.HasModifier(v, "modifier_oracle_false_promise") then
							-- for k, b in pairs(NPC.GetModifiers(v)) do
								-- Log.Write(Modifier.GetName(b))
							-- end
							local fast_hp_check = false
							if hero_time[Entity.GetIndex(v)] == nil then
								hero_time[Entity.GetIndex(v)] = 0
							end
							if hero_time[Entity.GetIndex(v)] == 1 then
								num_enemy = 999
							end
							if fasthp[Entity.GetIndex(v)] ~= nil and fasthp[Entity.GetIndex(v)] < 0 then
								if TechiesHUD.CheckMove(v, Unit, 0.3 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.03 * (Entity.GetHealth(v) / remote_damage)) == 1 and optionDetonateFast then
									num_enemy = num_enemy + 1
									fast_hp_check = true
								end
							end
							if (hp[Entity.GetIndex(v)] ~= nil and hp[Entity.GetIndex(v)] < 0) then
								if hero_time[Entity.GetIndex(v)] == 0 then
									hero_time[Entity.GetIndex(v)] = GameRules.GetGameTime()
								end
								if hero_time[Entity.GetIndex(v)] ~= 0 and (GameRules.GetGameTime() - hero_time[Entity.GetIndex(v)] > optionDelay / 1000) and not fast_hp_check then
									num_enemy = num_enemy + 1
								end
							else
								if hero_time[Entity.GetIndex(v)] ~= 1 then
									hero_time[Entity.GetIndex(v)] = 0
								end
							end
						end
					end
					local check_enemy = 0
					for j, v in pairs(heroes_in_radius) do
						if (need_damage[Entity.GetIndex(v)] == nil or need_damage[Entity.GetIndex(v)] < Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3) then
							check_enemy = 1
						end
					end
					if need_enemy[Entity.GetIndex(Unit)] and num_enemy >= need_enemy[Entity.GetIndex(Unit)] and check_enemy > 0 then
						check_detonate = GameRules.GetGameTime()
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(Unit, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Unit, 0, 0)
						for j, v in pairs(heroes_in_radius) do
							if need_damage[Entity.GetIndex(v)] == nil then
								need_damage[Entity.GetIndex(v)] = 0
								magic_shield[Entity.GetIndex(v)] = 0
								if NPC.HasModifier(v, "modifier_item_hood_of_defiance_barrier") then
									magic_shield[Entity.GetIndex(v)] = 325
								end
								if NPC.HasModifier(v, "modifier_item_pipe_barrier") then
									magic_shield[Entity.GetIndex(v)] = 400
								end
							end
							if hero_pos == nil then
								hero_pos = Entity.GetAbsOrigin(v)
							end
							local additional_res = 1
							local base_resist = NPC.GetMagicalArmorDamageMultiplier(v)

							if NPC.HasAbility(v, "spectre_dispersion") then -- damage_reflection_pct
								additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "spectre_dispersion"), "damage_reflection_pct") / 100)
							end

							if NPC.HasAbility(v, "huskar_berserkers_blood") then -- maximum_resistance
								local resist = (1 - (((Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3) - need_damage[Entity.GetIndex(v)]) - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100)
								if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
									resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100
								end
								base_resist = base_resist / (1 - (1 - (Entity.GetHealth(v) - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100))
								additional_res = additional_res * (1 - resist)
							end
							need_damage[Entity.GetIndex(v)] = need_damage[Entity.GetIndex(v)] + (mines_damage[Entity.GetIndex(Unit)] - magic_shield[Entity.GetIndex(v)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * additional_res
							if magic_shield[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) > 0 then
								magic_shield[Entity.GetIndex(v)] = magic_shield[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
							else
								magic_shield[Entity.GetIndex(v)] = 0
							end
						end
					end
				end
			end
			if hero_pos ~= nil then
				local x, y = Renderer.WorldToScreen(hero_pos)
				if x < 0 or x > size_x or y < 0 or y > size_y then
					Engine.ExecuteCommand("dota_camera_set_lookatpos " .. hero_pos:GetX() .. " " .. hero_pos:GetY())
					hero_cam_first_pos = Entity.GetAbsOrigin(myHero)
					hero_cam_time = GameRules.GetGameTime()
				end
				hero_pos = nil
			end
		end
	end -- auto detonate

	for i = 1, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if Ability.GetLevel(remote) ~= 0 then -- remote auto detonate
			if  Entity.IsHero(Unit)
			and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
			and not NPC.IsIllusion(Unit)
			and not Entity.IsDormant(Unit)
			and (NPC.IsKillable(Unit) or (NPC.HasItem(Unit, "item_aegis", 1) and TechiesHUD.optionDetonateAegis))
			and Entity.IsAlive(Unit)
			then
				--Log.Write(NPC.GetMagicalArmorDamageMultiplier(Unit) .. " " .. (Entity.GetHealth(Unit) - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9))
				if hero_time[Entity.GetIndex(Unit)] == nil then
					hero_time[Entity.GetIndex(Unit)] = 0
				end
				local remote_sum_damage = 0
				local force_remote_sum_damage = 0
				for j = 1, NPCs.Count() do -- calc sum damage
					local Unit2 = NPCs.Get(j)
					if NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil and state_mines[Entity.GetIndex(Unit2)] then
						if mines_damage[Entity.GetIndex(Unit2)] == nil then
							mines_damage[Entity.GetIndex(Unit2)] = remote_damage
						end
						if NPC.IsPositionInRange(Unit2, UnitPos, 425, 0) then -- - NPC.GetMoveSpeed(Unit) * 0.1
							remote_sum_damage = remote_sum_damage + mines_damage[Entity.GetIndex(Unit2)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						end

						local rotate = Entity.GetAbsRotation(Unit):GetYaw()
						local x4 = 600 * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
						local y4 = 0 * math.cos(rotate / 57.3) + 600 * math.sin(rotate / 57.3)
						if NPC.IsPositionInRange(Unit2, UnitPos + Vector(x4,y4,0), 425, 0) then
							force_remote_sum_damage = force_remote_sum_damage + mines_damage[Entity.GetIndex(Unit2)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						end
					end
				end -- calc sum damage
				if remote_sum_damage == 0 and hero_time[Entity.GetIndex(Unit)] ~= 1 then
					hero_time[Entity.GetIndex(Unit)] = 0
				end
				if optionDetonate then
					if optionForce then -- auto force stuff
						if force ~= nil then
							if hero_time[Entity.GetIndex(Unit)] == 1 and forced_time ~= 0 and GameRules.GetGameTime() - forced_time > 1 then
								hero_time[Entity.GetIndex(Unit)] = 0
								forced_time = 0
							end
							if NPC.IsPositionInRange(myHero, UnitPos, 1000, 0)
							and force_remote_sum_damage * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit) and GameRules.GetGameTime() - forc_time > 0.5 then
								if force_direction[i] == nil or force_direction[i] == 0 then
									force_direction[i] = GameRules.GetGameTime()
								elseif Ability.GetCooldownTimeLeft(force) == 0 and GameRules.GetGameTime() - force_direction[i] > Config.ReadInt("TechiesHUD", "Force Stuff delay", 500) / 1000 then
									Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, Unit, Vector(0, 0, 0), force, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, 0, 0)
									forc_time = GameRules.GetGameTime()
									hero_time[Entity.GetIndex(Unit)] = 1
									forced_time = GameRules.GetGameTime()
									force_direction[i] = 0
								end
							else
								force_direction[i] = 0
							end
						end
					end -- auto force stuff
				end
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
	if CursorOnButton then
		return false
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
		local magic_shield = {}
		for i = 1, NPCs.Count() do
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
				for j, v in pairs(Entity.GetHeroesInRadius(Unit, 425 - 24, Enum.TeamType.TEAM_ENEMY)) do
					if Entity.IsAlive(v)
					and not Entity.IsDormant(v)
					and not NPC.HasModifier(Unit, "modifier_manta")
					and (NPC.IsKillable(v) or NPC.GetUnitName(v) == "npc_dota_hero_skeleton_king" or NPC.HasItem(v, "item_aegis", 1) or NPC.HasModifier(v, "modifier_dazzle_shallow_grave") or NPC.HasModifier(v, "modifier_templar_assassin_refraction_absorb"))
					and NPC.GetMagicalArmorDamageMultiplier(v) ~= 0
					then
						if hp[Entity.GetIndex(v)] == nil then
							hp[Entity.GetIndex(v)] = Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3
							magic_shield[Entity.GetIndex(v)] = 0
							if NPC.HasModifier(v, "modifier_item_hood_of_defiance_barrier") then
								magic_shield[Entity.GetIndex(v)] = 325
							end
							if NPC.HasModifier(v, "modifier_item_pipe_barrier") then
								magic_shield[Entity.GetIndex(v)] = 400
							end
						end
						if mines_damage[Entity.GetIndex(Unit)] ~= nil and hp[Entity.GetIndex(v)] > 0 or optionFDFailSwitchMode then
							local additional_res = 1
							local base_resist = NPC.GetMagicalArmorDamageMultiplier(v)

							if NPC.HasAbility(v, "spectre_dispersion") then -- damage_reflection_pct
								additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "spectre_dispersion"), "damage_reflection_pct") / 100)
							end

							if NPC.HasAbility(v, "huskar_berserkers_blood") then -- maximum_resistance
								local resist = (1 - ((hp[Entity.GetIndex(v)] + NPC.GetHealthRegen(v) * 0.3) - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100)
								if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
									resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100
								end
								base_resist = base_resist / (1 - (1 - (Entity.GetHealth(v) - Entity.GetMaxHealth(v) * 0.1) / (Entity.GetMaxHealth(v) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(v, "huskar_berserkers_blood"), "maximum_resistance") / 100))
								additional_res = additional_res * (1 - resist)
							end

							hp[Entity.GetIndex(v)] = hp[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] - magic_shield[Entity.GetIndex(v)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * base_resist * additional_res
							if magic_shield[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) > 0 then
								magic_shield[Entity.GetIndex(v)] = magic_shield[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0))
							else
								magic_shield[Entity.GetIndex(v)] = 0
							end
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

		for i = 1, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if ((Ability.GetName(orders.ability) == "techies_land_mines" and (NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil))
			or (Ability.GetName(orders.ability) == "techies_stasis_trap" and (NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil))
			or (Ability.GetName(orders.ability) == "techies_remote_mines" and (NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil)))
			and Entity.IsAlive(Unit)
			and NPC.IsPositionInRange(Unit, orders.position, GUI.Get(TechiesHUD.Identity .. "optionStackRange"), 0)
			then
				Player.PrepareUnitOrders(orders.player, orders.order, orders.target, UnitPos, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
				return false
			end
		end
	end

	if optionMinePlacerLM then
		if Ability.GetName(orders.ability) == "techies_land_mines" then
			local closest_mine
			local closest_mine1
			for i, Unit in pairs(NPCs.GetAll()) do
				local UnitPos = Entity.GetAbsOrigin(Unit)
				if NPC.GetModifier(Unit, "modifier_techies_land_mine")
				and Entity.IsAlive(Unit)
				and NPC.IsPositionInRange(Unit, orders.position, 400, 0)
				then
					if not closest_mine then
						closest_mine = Unit
					elseif not closest_mine1 then
						closest_mine1 = Unit
					end
					if (Entity.GetAbsOrigin(Unit) - orders.position):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine) - orders.position):Length2DSqr()  then
						closest_mine1 = closest_mine
						closest_mine = Unit
					end
				end
			end
			local additional_h
			if closest_mine and closest_mine1 then
				additional_h = (Entity.GetAbsOrigin(closest_mine) - Entity.GetAbsOrigin(closest_mine1)):Length2D() / 400
			end
			local tmp_vec
			if closest_mine and closest_mine1 then
				local mine_pos = Entity.GetAbsOrigin(closest_mine)
				local mine_pos1 = Entity.GetAbsOrigin(closest_mine1)
				local a = (mine_pos - mine_pos1):Length2DSqr() / (2 * (mine_pos - mine_pos1):Length2D())
				local d = (mine_pos - mine_pos1):Length2D()
				local h = (400^2 - a^2)^0.5
				local P2 = mine_pos + Vector(a, a, a) * (mine_pos1 - mine_pos) * Vector(1/d, 1/d, 1/d)
				local P31 = Vector(P2:GetX() + h * (mine_pos1:GetY() - mine_pos:GetY()) / d, P2:GetY() - h * (mine_pos1:GetX() - mine_pos:GetX()) / d, P2:GetZ())
				local P32 = Vector(P2:GetX() - h * (mine_pos1:GetY() - mine_pos:GetY()) / d, P2:GetY() + h * (mine_pos1:GetX() - mine_pos:GetX()) / d, P2:GetZ())

				local closest_mine
				local closest_mine1
				local tmp_vec1 = P2 + ((P31 - P2):Normalized()):Scaled(h + 12 * additional_h)
				local tmp_vec2 = P2 + ((P32 - P2):Normalized()):Scaled(h + 12 * additional_h)
				for i, Unit in pairs(NPCs.GetAll()) do
					local UnitPos = Entity.GetAbsOrigin(Unit)
					if NPC.GetModifier(Unit, "modifier_techies_land_mine")
					and Entity.IsAlive(Unit)
					and NPC.IsPositionInRange(Unit, tmp_vec1, 400, 0)
					then
						if not closest_mine then
						closest_mine = Unit
						end
						if (Entity.GetAbsOrigin(Unit) - tmp_vec1):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine) - tmp_vec1):Length2DSqr()  then
							closest_mine = Unit
						end
					end
				end
				for i, Unit in pairs(NPCs.GetAll()) do
					local UnitPos = Entity.GetAbsOrigin(Unit)
					if NPC.GetModifier(Unit, "modifier_techies_land_mine")
					and Entity.IsAlive(Unit)
					and NPC.IsPositionInRange(Unit, tmp_vec2, 400, 0)
					then
						if not closest_mine1 then
							closest_mine1 = Unit
						end
						if (Entity.GetAbsOrigin(Unit) - tmp_vec2):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine1) - tmp_vec2):Length2DSqr()  then
							closest_mine1 = Unit
						end
					end
				end
				if (P31 - orders.position):Length2DSqr() <= (P32 - orders.position):Length2DSqr() and not closest_mine then
					tmp_vec = P2 + ((P31 - P2):Normalized()):Scaled(h + 12 * additional_h)
				elseif not closest_mine1 then
					tmp_vec = P2 + ((P32 - P2):Normalized()):Scaled(h + 12 * additional_h)
				end
			elseif closest_mine then
				local mine_pos = Entity.GetAbsOrigin(closest_mine)
				local mine_pos1 = Entity.GetAbsOrigin(closest_mine)
				local order_pos = orders.position
				mine_pos1:SetZ(order_pos:GetZ())
				mine_pos:SetZ(0)
				order_pos:SetZ(0)
				tmp_vec = mine_pos1 + ((order_pos - mine_pos):Normalized()):Scaled(412)
			else
				return true
			end
			if tmp_vec then
				Player.PrepareUnitOrders(orders.player, orders.order, orders.target, tmp_vec, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			end
			return false
		end
	end
	if optionMinePlacerST then
		if Ability.GetName(orders.ability) == "techies_stasis_trap" then
			local closest_mine
			local closest_mine1
			for i, Unit in pairs(NPCs.GetAll()) do
				local UnitPos = Entity.GetAbsOrigin(Unit)
				if NPC.GetModifier(Unit, "modifier_techies_stasis_trap")
				and Entity.IsAlive(Unit)
				and NPC.IsPositionInRange(Unit, orders.position, 600, 0)
				then
					if not closest_mine then
						closest_mine = Unit
					elseif not closest_mine1 then
						closest_mine1 = Unit
					end
					if (Entity.GetAbsOrigin(Unit) - orders.position):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine) - orders.position):Length2DSqr()  then
						closest_mine1 = closest_mine
						closest_mine = Unit
					end
				end
			end
			local additional_h
			if closest_mine and closest_mine1 then
				additional_h = (Entity.GetAbsOrigin(closest_mine) - Entity.GetAbsOrigin(closest_mine1)):Length2D() / 600
			end
			local tmp_vec
			if closest_mine and closest_mine1 then
				local mine_pos = Entity.GetAbsOrigin(closest_mine)
				local mine_pos1 = Entity.GetAbsOrigin(closest_mine1)
				local a = (mine_pos - mine_pos1):Length2DSqr() / (2 * (mine_pos - mine_pos1):Length2D())
				local d = (mine_pos - mine_pos1):Length2D()
				local h = (600^2 - a^2)^0.5
				local P2 = mine_pos + Vector(a, a, a) * (mine_pos1 - mine_pos) * Vector(1/d, 1/d, 1/d)
				local P31 = Vector(P2:GetX() + h * (mine_pos1:GetY() - mine_pos:GetY()) / d, P2:GetY() - h * (mine_pos1:GetX() - mine_pos:GetX()) / d, P2:GetZ())
				local P32 = Vector(P2:GetX() - h * (mine_pos1:GetY() - mine_pos:GetY()) / d, P2:GetY() + h * (mine_pos1:GetX() - mine_pos:GetX()) / d, P2:GetZ())

				local closest_mine
				local closest_mine1
				local tmp_vec1 = P2 + ((P31 - P2):Normalized()):Scaled(h + 16 * additional_h)
				local tmp_vec2 = P2 + ((P32 - P2):Normalized()):Scaled(h + 16 * additional_h)
				for i, Unit in pairs(NPCs.GetAll()) do
					local UnitPos = Entity.GetAbsOrigin(Unit)
					if NPC.GetModifier(Unit, "modifier_techies_stasis_trap")
					and Entity.IsAlive(Unit)
					and NPC.IsPositionInRange(Unit, tmp_vec1, 600, 0)
					then
						if not closest_mine then
						closest_mine = Unit
						end
						if (Entity.GetAbsOrigin(Unit) - tmp_vec1):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine) - tmp_vec1):Length2DSqr()  then
							closest_mine = Unit
						end
					end
				end
				for i, Unit in pairs(NPCs.GetAll()) do
					local UnitPos = Entity.GetAbsOrigin(Unit)
					if NPC.GetModifier(Unit, "modifier_techies_stasis_trap")
					and Entity.IsAlive(Unit)
					and NPC.IsPositionInRange(Unit, tmp_vec2, 600, 0)
					then
						if not closest_mine1 then
							closest_mine1 = Unit
						end
						if (Entity.GetAbsOrigin(Unit) - tmp_vec2):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine1) - tmp_vec2):Length2DSqr()  then
							closest_mine1 = Unit
						end
					end
				end
				if (P31 - orders.position):Length2DSqr() <= (P32 - orders.position):Length2DSqr() and not closest_mine then
					tmp_vec = P2 + ((P31 - P2):Normalized()):Scaled(h + 16 * additional_h)
				elseif not closest_mine1 then
					tmp_vec = P2 + ((P32 - P2):Normalized()):Scaled(h + 16 * additional_h)
				end
			elseif closest_mine then
				local mine_pos = Entity.GetAbsOrigin(closest_mine)
				local mine_pos1 = Entity.GetAbsOrigin(closest_mine)
				local order_pos = orders.position
				mine_pos1:SetZ(order_pos:GetZ())
				mine_pos:SetZ(0)
				order_pos:SetZ(0)
				tmp_vec = mine_pos1 + ((order_pos - mine_pos):Normalized()):Scaled(612)
			else
				return true
			end
			if tmp_vec then
				Player.PrepareUnitOrders(orders.player, orders.order, orders.target, tmp_vec, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			end
			return false
		end
	end
    return true
end

return TechiesHUD