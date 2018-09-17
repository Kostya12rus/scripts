local TechiesHUD = {}

TechiesHUD.Identity = "TechiesHUD"
TechiesHUD.Locale = {
	["name"] = {
		["english"] = "TechiesHUD"
	},
	["desc"] = {
		["english"] = "TechiesHUD v1.5",
		["russian"] = "TechiesHUD v1.5"
	},
	["optionDetonate"] = {
		["english"] = "Auto detonate remote mines",
		["russian"] = "Авто взрыв бочек"
	},
	["optionUseShareHeroInfo"] = {
		["english"] = "Script can use allied mines or hero",
		["russian"] = "Скрипт может использовать союзные мины или героя"
	},
	["optionUseShareHeroInfo1"] = {
		["english"] = "For this, allied techies need to share control",
		["russian"] = "Для этого союзному techies нужно поделится контролем"
	},
	["optionUseShareHeroInfo2"] = {
		["english"] = "Scoreboard->Show Shared Unit Control Options->Unit and(or) Hero",
		["russian"] = "Таблица счета->Настройки общего управления->Сущ-ва и(или) Герой"
	},
	["optionUseShareHero"] = {
		["english"] = "Use Allied hero and mines",
		["russian"] = "Использовать союзного героя и мины"
	},
	["optionActiveAeon"] = {
		["english"] = "If hero has aeon, activate it",
		["russian"] = "Если герой имеет aeon активировать его"
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
	["forceTimeWait"] = {
		["english"] = "Auto force stuff delay",
		["russian"] = "Задержка перед приминением force stuff"
	},
	["antiInitFail"] = {
		["english"] = "If hero can dodge detonate, set a delay",
		["russian"] = "Если герой может уклониться от детонации, установить задержку"
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
		["english"] = "The method of drawing a radius, after change need reload scripts",
		["russian"] = "Метод рисования радиуса, после изменения нужно перезагрузить скрипты"
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
	["panelInfoSize"] = {
		["english"] = "Panel height offset",
		["russian"] = "Высота панели"
	},
	["panelInfoDist"] = {
		["english"] = "Panel width offset",
		["russian"] = "Ширина панели"
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
	["optionShowEnemyRemotes"] = {
		["english"] = "Drawing circle on predicted place enemy remote mines",
		["russian"] = "Рисование круга на прогнозируемом месте вражеских remote mines"
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

TechiesHUD.IconCache = {}

TechiesHUD.BlastPosition = nil
TechiesHUD.BlastPositionCircle = nil
TechiesHUD.LandMinesList = {}
TechiesHUD.StasisMinesList = {}
TechiesHUD.RemoteMinesList = {}
TechiesHUD.UndefEntity = {}
TechiesHUD.ParticleList = {}
TechiesHUD.LandMinesTimings = {}
TechiesHUD.RemoteMinesDamage = {}
TechiesHUD.RemoteMinesCreateTimings = {}

TechiesHUD.ScreenScale1 = Renderer.GetScreenSize() / 1600
if TechiesHUD.ScreenScale1 < 0.7 then
	TechiesHUD.ScreenScale1 = 0.7
end
TechiesHUD.ScreenScale = TechiesHUD.ScreenScale1

local optionTotal
local optionUpdate

local optionActiveAeon

local optionUseShareHero

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
local optionForceTimeWait
local optionAntiInitFail
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
local optionPanelInfoSize
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
local hero_time = {}
local hero_time_anti_dodge = {}
local hero_rotate_time = {}
local forc_time = 0
local forced_time = 0
local force_direction = {}
local remote_pos_draw = {}
local mines_num = {}
local check_detonate = 0
local spot_for_plant = {}
local plant_time = 0
local hero_cam_time = nil
local wisp_overcharge = 1
local kunkka_ghostship = 1
local flame_guard = 0
local state_mines = {}
local need_enemy = {}
local radius_off = {}
local enemy_enabled = {}
local enemy_mines_pos = {}

function TechiesHUD.OnGameStart()
	hero_time = {}
	hero_time_anti_dodge = {}
	hero_rotate_time = {}
	forc_time = 0
	forced_time = 0
	force_direction = {}
	remote_pos_draw = {}
	mines_num = {}
	check_detonate = 0
	spot_for_plant = {}
	plant_time = 0
	hero_cam_time = nil

	state_mines = {}
	need_enemy = {}
	enemy_enabled = {}
	radius_off = {}
	wisp_overcharge = 1
	kunkka_ghostship = 1
	flame_guard = 0

	TechiesHUD.LandMinesList = {}
	TechiesHUD.StasisMinesList = {}
	TechiesHUD.RemoteMinesList = {}
	TechiesHUD.UndefEntity = {}
	TechiesHUD.LandMinesTimings = {}
	TechiesHUD.RemoteMinesDamage = {}
	TechiesHUD.RemoteMinesCreateTimings = {}
	enemy_mines_pos = {}
end


function TechiesHUD.OnParticleCreate(particle)
	if not optionShowEnemyRemotes then
		return
	end
	if particle.name == "techies_remote_mine_plant" then
		table.insert(enemy_mines_pos, {index = particle.index, time = GameRules.GetGameTime(), pos = Vector(0, 0, 0), ent2 = particle.entity})
	end
	if particle.name == "techies_remote_mines_detonate" then
		for i, part in pairs(enemy_mines_pos) do
			if particle.entityForModifiers == part.ent2 then
				table.remove(enemy_mines_pos, i)
			end
		end
	end

end

function TechiesHUD.OnParticleUpdateEntity(particle)
	if not optionShowEnemyRemotes then
		return
	end
	for _, mines in ipairs(enemy_mines_pos) do
		if particle.index == mines.index then
			mines.pos = particle.position
		end
	end
end

function TechiesHUD.OnParticleDestroy(particle)
	if not optionShowEnemyRemotes then
		return
	end
	for i, mines in ipairs(enemy_mines_pos) do
		if particle.index == mines.index then
			table.remove(enemy_mines_pos, i)
		end
	end
end

function TechiesHUD.OnEntityCreate(ent)
	table.insert(TechiesHUD.UndefEntity, ent)
end

function TechiesHUD.OnEntityDestroy(ent)
	if not optionTotal then return end
	if TechiesHUD.ParticleList[ent] then
		Particle.Destroy(TechiesHUD.ParticleList[ent].particle)
		if TechiesHUD.ParticleList[ent].particle2 then
			Particle.Destroy(TechiesHUD.ParticleList[ent].particle2)
		end
		TechiesHUD.ParticleList[ent] = nil
	end

	TechiesHUD.LandMinesList[ent] = nil
	TechiesHUD.StasisMinesList[ent] = nil
	TechiesHUD.RemoteMinesList[ent] = nil
	TechiesHUD.LandMinesTimings[ent] = nil
	TechiesHUD.RemoteMinesDamage[ent] = nil
	TechiesHUD.RemoteMinesCreateTimings[ent] = nil
end

local Monitor = {
	["21"] = { ["first"] = 33.8,	["next"] = 54, 		["step"] = 2.51 },
	["10"] = { ["first"] = 25.903,	["next"] = 55.903, 	["step"] = 3.7  },
	["9"] =  { ["first"] = 28.326,	["next"] = 55.32,	["step"] = 3.314},
	["3"] =  { ["first"] = 21.09,	["next"] = 57.34, 	["step"] = 4.4  },
	["1"] =  { ["first"] = 31.875,	["next"] = 54.375, 	["step"] = 2.8  }}

function TechiesHUD.GetSize()
	local w, h = Renderer.GetScreenSize()
	local r =  w / h
	local m = "3"
	if math.floor(r * 10) / 10 == 1.6 then
		m = "10"
	elseif math.floor(r * 10) / 10 == 1.7 then
		m = "9"
	elseif math.floor(r * 10) / 10 == 2.1 then
		m = "1"
	elseif math.floor(r * 10) / 10 == 2.3 then
		m = "21"
	end
	local p = ( w / 100 )
	return math.floor((Monitor[m]["step"] + optionPanelInfoDist / 10) * p)
end

function TechiesHUD.GetHeroPos(indexHero)
	local w, h = Renderer.GetScreenSize()
	local r =  w / h
	local m = "3"
	if math.floor(r * 10) / 10 == 1.6 then
		m = "10"
	elseif math.floor(r * 10) / 10 == 1.7 then
		m = "9"
	elseif math.floor(r * 10) / 10 == 2.1 then
		m = "1"
	elseif math.floor(r * 10) / 10 == 2.3 then
		m = "21"
	end
	local p = ( w / 100 )
	local dw = Monitor[m]["first"] + indexHero * (Monitor[m]["step"] + optionPanelInfoDist / 10) + optionPanelInfoXL
	if indexHero > 4 then
		dw = Monitor[m]["next"] + (indexHero - 5) * (Monitor[m]["step"] + optionPanelInfoDist / 10) + optionPanelInfoXR
	end
	local pos = math.floor(p * dw)
	return pos, math.floor(h * 0.06 + optionPanelInfoY)
end

function TechiesHUD.GetHeroPosCenterX(indexHero)
	local x, y = TechiesHUD.GetHeroPos(indexHero)
	x = x + math.floor(TechiesHUD.GetSize() / 2)
	return x, y
end

function TechiesHUD.GetDamageAndShieldAfterDetonate(Unit, remote_damage, Hp, Mp, Shield, visage_stack, templar_stack)
	local additional_res = 1
	local base_resist = NPC.GetMagicalArmorDamageMultiplier(Unit)

	if not Shield then
		Shield = 0
		if NPC.HasModifier(Unit, "modifier_item_hood_of_defiance_barrier") then
			Shield = Shield + 325
		end
		if NPC.HasModifier(Unit, "modifier_item_pipe_barrier") then
			Shield = Shield + 400
		end
		if NPC.HasItem(Unit, "item_infused_raindrop", 1) and Ability.GetCooldownTimeLeft(NPC.GetItem(Unit, "item_infused_raindrop", 1)) == 0 then
			Shield = Shield + 120
		end
		if NPC.HasModifier(Unit, "modifier_ember_spirit_flame_guard") then
			Shield = Shield + flame_guard
		end
	end

	if NPC.HasAbility(Unit, "spectre_dispersion") then -- damage_reflection_pct
		additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "spectre_dispersion"), "damage_reflection_pct") / 100)
	end

	if NPC.HasAbility(Unit, "antimage_spell_shield") and Entity.IsDormant(Unit) then -- spell_shield_resistance
		additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "antimage_spell_shield"), "spell_shield_resistance") / 100)
	end

	if NPC.HasItem(Unit, "item_cloak", 1) and Entity.IsDormant(Unit) then -- spell_shield_resistance
		additional_res = additional_res * 0.85
	end

	if NPC.HasItem(Unit, "item_hood_of_defiance", 1) and Entity.IsDormant(Unit) then -- spell_shield_resistance
		additional_res = additional_res * 0.75
	end

	if NPC.HasItem(Unit, "item_pipe", 1) and Entity.IsDormant(Unit) then -- spell_shield_resistance
		additional_res = additional_res * 0.70 * 0.9 -- aura
	end

	if NPC.HasModifier(Unit, "modifier_wisp_overcharge") then
		additional_res = additional_res * wisp_overcharge
	end

	if NPC.HasModifier(Unit, "modifier_kunkka_ghost_ship_damage_absorb") then
		additional_res = additional_res * kunkka_ghostship
	end

	if NPC.HasModifier(Unit, "modifier_ursa_enrage") then
		additional_res = additional_res * 0.2
	end

	if NPC.HasModifier(Unit, "modifier_pangolier_shield_crash_buff") then
		additional_res = additional_res * (1 - Modifier.GetStackCount(NPC.GetModifier(Unit, "modifier_pangolier_shield_crash_buff")) / 100)
	end

	if NPC.HasModifier(Unit, "modifier_visage_gravekeepers_cloak") then -- damage_reduction
		if not visage_stack then
			visage_stack = Modifier.GetStackCount(NPC.GetModifier(Unit, "modifier_visage_gravekeepers_cloak"))
		end
		if visage_stack > 0 then
			local resist = (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "visage_gravekeepers_cloak"), "damage_reduction") / 100 * visage_stack)
			visage_stack = visage_stack - 1
			additional_res = additional_res * resist
		end
	end

	if NPC.HasModifier(Unit, "modifier_templar_assassin_refraction_absorb") then
		if not templar_stack then
			templar_stack = Modifier.GetStackCount(NPC.GetModifier(Unit, "modifier_templar_assassin_refraction_absorb"))
		end
		if templar_stack > 0 then
			templar_stack = templar_stack - 1
			additional_res = 0
		end
	end

	if NPC.HasModifier(Unit, "modifier_medusa_mana_shield") then -- absorption_tooltip
		local resist = 1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "medusa_mana_shield"), "absorption_tooltip") / 100
		local damage_per_mana = Ability.GetLevelSpecialValueForFloat(NPC.GetAbility(Unit, "medusa_mana_shield"), "damage_per_mana")
		local mana_damage = remote_damage * (1 - resist) / damage_per_mana
		if Mp >= mana_damage then
			Mp = Mp - mana_damage
		else
			resist = (remote_damage * resist + (mana_damage - Mp) * damage_per_mana) / remote_damage
			Mp = 0
		end
		additional_res = additional_res * resist
	end

	if NPC.HasAbility(Unit, "huskar_berserkers_blood") then -- maximum_resistance
		local resist = (1 - (Hp - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100)
		if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
			resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100
		end
		base_resist = base_resist / (1 - (1 - (Entity.GetHealth(Unit) - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100))
		additional_res = additional_res * (1 - resist)
	end

	local calc_remote_damage = (remote_damage - Shield) * base_resist * additional_res
	if calc_remote_damage < 0 then
		calc_remote_damage = 0
	end
	if NPC.HasItem(Unit, "item_aeon_disk", 1) and Ability.GetCooldownTimeLeft(NPC.GetItem(Unit, "item_aeon_disk", 1)) == 0 and (Hp - calc_remote_damage) / Entity.GetMaxHealth(Unit) < 0.7 then -- spell_shield_resistance
		if optionActiveAeon then
			Hp = 0
			calc_remote_damage = 999999
		else
			additional_res = 0
		end
	end
	Hp = Hp - (remote_damage - Shield) * base_resist * additional_res
	if Shield - remote_damage > 0 then
		Shield = Shield - remote_damage

		if Shield < 120 and NPC.HasItem(Unit, "item_infused_raindrop", 1) and Ability.GetCooldownTimeLeft(NPC.GetItem(Unit, "item_infused_raindrop", 1)) == 0 then
			Shield = 0
		end
	else
		Shield = 0
	end
	return calc_remote_damage, Hp, Mp, Shield, visage_stack, templar_stack
end

function TechiesHUD.GetNumRemoteForKill(Unit, remote_damage, Hp, Mp)
	if NPC.GetMagicalArmorDamageMultiplier(Unit) == 0 then
		return 1/0
	end

	if not Hp == Entity.GetMaxHealth(Unit) then
		Hp = Hp + NPC.GetHealthRegen(Unit) * 0.3
	end

	if not Mp == NPC.GetMaxMana(Unit) then
		Mp = Mp + NPC.GetManaRegen(Unit) * 0.3
	end

	local magic_shield = 0
	if NPC.HasModifier(Unit, "modifier_item_hood_of_defiance_barrier") then
		magic_shield = magic_shield + 325
	end
	if NPC.HasModifier(Unit, "modifier_item_pipe_barrier") then
		magic_shield = magic_shield + 400
	end
	if NPC.HasItem(Unit, "item_infused_raindrop", 1) and Ability.GetCooldownTimeLeft(NPC.GetItem(Unit, "item_infused_raindrop", 1)) == 0 then
		magic_shield = magic_shield + 120
	end
	if NPC.HasModifier(Unit, "modifier_ember_spirit_flame_guard") then
		magic_shield = magic_shield + flame_guard
	end
	local additional_res
	local base_resist
	local num_calc = 0
	local visage_stack
	if Hp == Entity.GetMaxHealth(Unit) then
		visage_stack = 4
	end
	while Hp > 0 do
		num_calc = num_calc + 1
		additional_res = 1
		base_resist = NPC.GetMagicalArmorDamageMultiplier(Unit)

		if NPC.HasAbility(Unit, "spectre_dispersion") then -- damage_reflection_pct
			additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "spectre_dispersion"), "damage_reflection_pct") / 100)
		end

		if NPC.HasAbility(Unit, "antimage_spell_shield") and Entity.IsDormant(Unit) then -- spell_shield_resistance
			additional_res = additional_res * (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "antimage_spell_shield"), "spell_shield_resistance") / 100)
		end

		if NPC.HasItem(Unit, "item_cloak", 1) and Entity.IsDormant(Unit) then -- spell_shield_resistance
			additional_res = additional_res * 0.85
		end

		if NPC.HasItem(Unit, "item_hood_of_defiance", 1) and Entity.IsDormant(Unit) then -- spell_shield_resistance
			additional_res = additional_res * 0.75
		end

		if NPC.HasItem(Unit, "item_pipe", 1) and Entity.IsDormant(Unit) then -- spell_shield_resistance
			additional_res = additional_res * 0.70 * 0.9 -- aura
		end

		if NPC.HasModifier(Unit, "modifier_wisp_overcharge") then
			additional_res = additional_res * wisp_overcharge
		end

		if NPC.HasModifier(Unit, "modifier_kunkka_ghost_ship_damage_absorb") then
			additional_res = additional_res * kunkka_ghostship
		end

		if NPC.HasModifier(Unit, "modifier_ursa_enrage") then
			additional_res = additional_res * 0.2
		end

		if NPC.HasModifier(Unit, "modifier_pangolier_shield_crash_buff") then
			additional_res = additional_res * (1 - Modifier.GetStackCount(NPC.GetModifier(Unit, "modifier_pangolier_shield_crash_buff")) / 100)
		end

		if NPC.HasModifier(Unit, "modifier_visage_gravekeepers_cloak") then -- damage_reduction
			if not visage_stack then
				visage_stack = Modifier.GetStackCount(NPC.GetModifier(Unit, "modifier_visage_gravekeepers_cloak"))
			end
			if visage_stack > 0 then
				local resist = (1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "visage_gravekeepers_cloak"), "damage_reduction") / 100 * visage_stack)
				visage_stack = visage_stack - 1
				additional_res = additional_res * resist
			end
		end

		if NPC.HasModifier(Unit, "modifier_medusa_mana_shield") then -- absorption_tooltip
			local resist = 1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "medusa_mana_shield"), "absorption_tooltip") / 100
			local damage_per_mana = Ability.GetLevelSpecialValueForFloat(NPC.GetAbility(Unit, "medusa_mana_shield"), "damage_per_mana")
			local mana_damage = remote_damage * (1 - resist) / damage_per_mana
			if Mp >= mana_damage then
				Mp = Mp - mana_damage
			else
				resist = (remote_damage * resist + (mana_damage - Mp) * damage_per_mana) / remote_damage
				Mp = 0
			end
			additional_res = additional_res * resist
		end

		if NPC.HasAbility(Unit, "huskar_berserkers_blood") then -- maximum_resistance
			local resist = (1 - (Hp - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100)
			if resist > Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100 then
				resist = Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100
			end
			base_resist = base_resist / (1 - (1 - (Entity.GetHealth(Unit) - Entity.GetMaxHealth(Unit) * 0.1) / (Entity.GetMaxHealth(Unit) * 0.9)) * (Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "huskar_berserkers_blood"), "maximum_resistance") / 100))
			additional_res = additional_res * (1 - resist)
		end
		local calc_remote_damage = (remote_damage - magic_shield) * base_resist * additional_res
		if calc_remote_damage < 0 then
			calc_remote_damage = 0
		end
		Hp = Hp - calc_remote_damage
		if magic_shield - remote_damage > 0 then
			magic_shield = magic_shield - remote_damage
			if magic_shield < 120 and NPC.HasItem(Unit, "item_infused_raindrop", 1) and Ability.GetCooldownTimeLeft(NPC.GetItem(Unit, "item_infused_raindrop", 1)) == 0 then
				magic_shield = 0
			end
		else
			magic_shield = 0
		end
	end

	if NPC.HasModifier(Unit, "modifier_templar_assassin_refraction_absorb") then
		num_calc = num_calc + Modifier.GetStackCount(NPC.GetModifier(Unit, "modifier_templar_assassin_refraction_absorb"))
	end

	local last = 0
	if additional_res and base_resist then
		last = Hp / (remote_damage * additional_res * base_resist)
	end
	return num_calc + last
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

function TechiesHUD.DrawCircle(UnitPos, radius, degree)
	local x, y, visible = Renderer.WorldToScreen(UnitPos + Vector(0, radius, 0))
	local x4, y4, x3, y3, visible3
	if visible == 1 then
		for angle = 0, 360 / degree do
			local tmp_x = 0 * math.cos(angle * degree / 57.3) - radius * math.sin(angle * degree / 57.3)
			local tmp_y = radius * math.cos(angle * degree / 57.3) + 0 * math.sin(angle * degree / 57.3)
			local x1, y1  = Renderer.WorldToScreen(UnitPos + Vector(tmp_x, tmp_y, 0))
			Renderer.DrawLine(x, y, x1, y1)
			x, y = x1, y1
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

local key_for_set_spot
function TechiesHUD.UpdateGUISettings()
	optionTotal = GUI.IsEnabled(TechiesHUD.Identity)
	if not optionTotal then return end
	optionUseShareHero = GUI.IsEnabled(TechiesHUD.Identity .. "optionUseShareHero")
	optionShowEnemyRemotes = GUI.IsEnabled(TechiesHUD.Identity .. "optionShowEnemyRemotes")
	optionDetonate = GUI.IsEnabled(TechiesHUD.Identity .. "optionDetonate")
	optionActiveAeon = GUI.IsEnabled(TechiesHUD.Identity .. "optionActiveAeon")
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
	optionAntiInitFail = GUI.IsEnabled(TechiesHUD.Identity .. "optionAntiInitFail")
	optionForceTimeWait = GUI.Get(TechiesHUD.Identity .. "optionForceTimeWait") / 1000
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
				for i, particle in pairs(TechiesHUD.ParticleList) do
					Particle.Destroy(TechiesHUD.ParticleList[particle.Unit].particle)
					if TechiesHUD.ParticleList[particle.Unit].particle2 then
						Particle.Destroy(TechiesHUD.ParticleList[particle.Unit].particle2)
					end
					TechiesHUD.ParticleList[particle.Unit] = nil
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
	optionPanelInfoDist = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoDist")
	optionPanelInfoGemAndSentry = GUI.IsEnabled(TechiesHUD.Identity .. "optionPanelInfoGemAndSentry")
	optionResCircle = GUI.Get(TechiesHUD.Identity .. "optionResCircle")

	if GUI.Get(TechiesHUD.Identity .. "optionFont1") ~= optionFont1 then
		optionFont1 = GUI.Get(TechiesHUD.Identity .. "optionFont1")
		TechiesHUD.font = Renderer.LoadFont("Tahoma", tonumber(optionFont1), Enum.FontWeight.EXTRABOLD)
	end
	if GUI.Get(TechiesHUD.Identity .. "optionFont2") ~= optionFont2 or optionPanelInfoSize ~= GUI.Get(TechiesHUD.Identity .. "optionPanelInfoSize") / 100 then
		optionPanelInfoSize = GUI.Get(TechiesHUD.Identity .. "optionPanelInfoSize") / 100
		TechiesHUD.ScreenScale = TechiesHUD.ScreenScale1 + optionPanelInfoSize
		optionFont2 = GUI.Get(TechiesHUD.Identity .. "optionFont2")
		TechiesHUD.HUDfont = Renderer.LoadFont("Tahoma", math.floor(tonumber(optionFont2) * (TechiesHUD.ScreenScale)), Enum.FontWeight.EXTRABOLD)
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

	local code = load("return Enum.ButtonCode.KEY_" .. GUI.Get(TechiesHUD.Identity .. "optionAutoPlantKey"))
	key_for_set_spot = code()
end

local ClickSave = true
local CursorOnButton = false
function TechiesHUD.OnDraw()
	if GUI == nil then return end

	if not GUI.Exist(TechiesHUD.Identity) then
		GUI.Initialize(TechiesHUD.Identity, GUI.Category.Heroes, TechiesHUD.Locale["name"], TechiesHUD.Locale["desc"], "Zerling14", "npc_dota_hero_techies")

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionUseShareHeroInfo", TechiesHUD.Locale["optionUseShareHeroInfo"], GUI.MenuType.Label)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionUseShareHeroInfo1", TechiesHUD.Locale["optionUseShareHeroInfo1"], GUI.MenuType.Label)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionUseShareHeroInfo2", TechiesHUD.Locale["optionUseShareHeroInfo2"], GUI.MenuType.Label)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionUseShareHero", TechiesHUD.Locale["optionUseShareHero"], GUI.MenuType.CheckBox, 0)

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "detonateSection", TechiesHUD.Locale["detonateSection"], GUI.MenuType.Label) -- Detonate
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionDetonate", TechiesHUD.Locale["optionDetonate"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionActiveAeon", TechiesHUD.Locale["optionActiveAeon"], GUI.MenuType.CheckBox, 1)
		--GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionUpdate", TechiesHUD.Locale["empty"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionForce", TechiesHUD.Locale["forceStaff"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionForceTimeWait", TechiesHUD.Locale["forceTimeWait"], GUI.MenuType.Slider, 0, 2000, 1000)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAntiInitFail", TechiesHUD.Locale["antiInitFail"], GUI.MenuType.CheckBox, 1)
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

		local empty_func = function () return end

		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionAutoPlantKey", TechiesHUD.Locale["autoPlantKey"], GUI.MenuType.Key, "T", empty_func, 1)

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
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionShowEnemyRemotes", TechiesHUD.Locale["optionShowEnemyRemotes"], GUI.MenuType.CheckBox, 1)
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
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoXL", TechiesHUD.Locale["panelInfoXL"], GUI.MenuType.Slider, -50, 50, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoXR", TechiesHUD.Locale["panelInfoXR"], GUI.MenuType.Slider, -50, 50, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoY", TechiesHUD.Locale["panelInfoY"], GUI.MenuType.Slider, -200, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoSize", TechiesHUD.Locale["panelInfoSize"], GUI.MenuType.Slider, -70, 200, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoDist", TechiesHUD.Locale["panelInfoDist"], GUI.MenuType.Slider, -20, 20, 0)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionPanelInfoGemAndSentry", TechiesHUD.Locale["panelInfoGemAndSentry"], GUI.MenuType.CheckBox, 1)


		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionMinePlacer", TechiesHUD.Locale["minePlacer"], GUI.MenuType.Label) --minePlacerLM
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionMinePlacerLM", TechiesHUD.Locale["minePlacerLM"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(TechiesHUD.Identity, TechiesHUD.Identity .. "optionMinePlacerST", TechiesHUD.Locale["minePlacerST"], GUI.MenuType.CheckBox, 1)
		TechiesHUD.UpdateGUISettings()

		for i, Unit in pairs(NPCs.GetAll()) do
			table.insert(TechiesHUD.UndefEntity, Unit)
		end
	end

	if key_for_set_spot and Input.IsKeyDownOnce(key_for_set_spot) then
		TechiesHUD.SetSpot()
	end

	if GUI.SleepReady("updateSettings") and GUI.IsEnabled("gui:show") then
		TechiesHUD.UpdateGUISettings()
		GUI.Sleep("updateSettings", 0.1)
	end

	if not optionTotal then
		return
	end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end

	if optionShowEnemyRemotes then
		for i, pos in pairs(enemy_mines_pos) do
			if GameRules.GetGameTime() - pos.time > 600 then
				table.remove(enemy_mines_pos, i)
			end
			Renderer.SetDrawColor(0, 255, 0, 255)
			if GameRules.GetGameTime() - pos.time > 2 then
				TechiesHUD.DrawCircle(pos.pos, 425, optionResCircle)
			end
			if not pos.ent then
				for j, Unit in pairs(TechiesHUD.RemoteMinesList) do
					if NPC.GetModifier(Unit, "modifier_techies_remote_mine") and math.abs(Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_remote_mine")) - pos.time) < 2 then
						pos.ent = Unit
						if Entity.IsSameTeam(Heroes.GetLocal(), Unit) then
							table.remove(enemy_mines_pos, i)
						end
					end
				end
			end
			if pos.ent and not Entity.IsAlive(pos.ent) then
				table.remove(enemy_mines_pos, i)
			end
		end
	end

	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
		for i, Unit in pairs(Heroes.GetAll()) do
			if NPC.GetUnitName(Unit) and NPC.GetUnitName(Unit) == "npc_dota_hero_techies" and Entity.IsSameTeam(myHero, Unit) then
				myHero = Unit
			end
		end
		if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
			return
		end
	end

	local land_m = NPC.GetAbilityByIndex(myHero, 0)
	local trap_m = NPC.GetAbilityByIndex(myHero, 1)
	local blast = NPC.GetAbilityByIndex(myHero, 2)
	local remote = NPC.GetAbilityByIndex(myHero, 5)

	local force = NPC.GetItem(myHero, "item_force_staff", 1)

	local land_m_damage = Ability.GetLevelSpecialValueFor(land_m, "damage")
	local blast_damage = Ability.GetLevelSpecialValueFor(blast, "damage") + Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 8)) * 300

	local magicalDamageMul = 1 + Hero.GetIntellectTotal(myHero)/ 14 / 100 + 0.1 *(NPC.HasItem(myHero, "item_kaya", 1) and 1 or 0)

	local remote_damage = Ability.GetLevelSpecialValueFor(remote, "damage")

	if Ability.IsInAbilityPhase(blast) and TechiesHUD.BlastPosition then
		if optionDrawCircleMethod then
			if not TechiesHUD.BlastPositionCircle then
				TechiesHUD.BlastPositionCircle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")
				Particle.SetControlPoint(TechiesHUD.BlastPositionCircle, 3, Vector(9, 0, 0))
				Particle.SetControlPoint(TechiesHUD.BlastPositionCircle, 2, Vector(400, 255, 0))
				Particle.SetControlPoint(TechiesHUD.BlastPositionCircle, 0, TechiesHUD.BlastPosition)
				if Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero) >= 0.5 then
					Particle.SetControlPoint(TechiesHUD.BlastPositionCircle, 1, Vector(255, 255, 255))
				else
					Particle.SetControlPoint(TechiesHUD.BlastPositionCircle, 1, Vector(255, 0, 0))
				end
			end
		else
			if Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero) >= 0.5 then
				Renderer.SetDrawColor(255, 255, 255, 255)
			else
				Renderer.SetDrawColor(255, 0, 0, 255)
			end
			TechiesHUD.DrawCircle(TechiesHUD.BlastPosition, 400, optionResCircle)
		end
		local x, y = Renderer.WorldToScreen(TechiesHUD.BlastPosition)
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(TechiesHUD.font, x, y, math.floor(Entity.GetHealth(myHero) - Entity.GetMaxHealth(myHero) * 0.5), 0)
	elseif TechiesHUD.BlastPositionCircle then
		Particle.Destroy(TechiesHUD.BlastPositionCircle)
		TechiesHUD.BlastPositionCircle = nil
	end

	if optionAutoPlant then
		for i, spot in pairs(spot_for_plant) do
			local x, y, visible = Renderer.WorldToScreen(spot.position)
			if visible == 1 then
				Renderer.SetDrawColor(255, 255, 255, 255)
				TechiesHUD.DrawCircle(spot.position, 200, optionResCircle)
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

	CursorOnButton = false

	for i, Unit in pairs(TechiesHUD.LandMinesList) do
		if NPC.HasModifier(Unit, "modifier_techies_land_mine") then
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if not optionDrawCircleMethod then
				if optionLR and Entity.IsAlive(Unit) then
					Renderer.SetDrawColor(255, 20, 0, 255)
					TechiesHUD.DrawCircle(UnitPos, 400, optionResCircle)
				end
			else
				if TechiesHUD.ParticleList[Unit] then
					Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle, 0, Entity.GetAbsOrigin(Unit))
				end
			end
			if GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_land_mine")) < 1.75 then
				local x, y, visible = Renderer.WorldToScreen(UnitPos)
				if visible == 1 then
					Renderer.SetDrawColor(255, 255, 255, 255)
					Renderer.DrawText(TechiesHUD.font, x, y, math.floor((1.75 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_land_mine")))) * 100) / 100, 0)
				end
			else
				local IsActive = false
				for j, Unit2 in pairs(Entity.GetUnitsInRadius(Unit, 400, Enum.TeamType.TEAM_ENEMY)) do
					IsActive = true
					if not TechiesHUD.LandMinesTimings[Unit] then
						TechiesHUD.LandMinesTimings[Unit] = GameRules.GetGameTime() + 1.6
					end
					if TechiesHUD.LandMinesTimings[Unit] - GameRules.GetGameTime() > 0 then
						local x, y, visible = Renderer.WorldToScreen(UnitPos)
						if visible == 1 then
							Renderer.SetDrawColor(255, 255, 255, 255)
							Renderer.DrawText(TechiesHUD.font, x, y, math.floor((TechiesHUD.LandMinesTimings[Unit] - GameRules.GetGameTime()) * 100) / 100, 0)
						end
					end
					break;
				end
				if not IsActive then
					TechiesHUD.LandMinesTimings[Unit] = nil
				end
			end
		elseif not Entity.IsAlive(Unit) and TechiesHUD.ParticleList[Unit] then
			Particle.Destroy(TechiesHUD.ParticleList[Unit].particle)
			TechiesHUD.ParticleList[Unit] = nil
		end
	end

	for i, Unit in pairs(TechiesHUD.StasisMinesList) do
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if not optionDrawCircleMethod then
			if optionSR and Entity.IsAlive(Unit) then
				Renderer.SetDrawColor(0, 255, 255, 255)
				TechiesHUD.DrawCircle(UnitPos, 600, optionResCircle)
				Renderer.SetDrawColor(0, 0, 255, 255)
				TechiesHUD.DrawCircle(UnitPos, 405, optionResCircle)
			end
		else
			if TechiesHUD.ParticleList[Unit] then
				Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle, 0, Entity.GetAbsOrigin(Unit))
				Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 0, Entity.GetAbsOrigin(Unit))
			end
		end
		if NPC.HasModifier(Unit, "modifier_techies_stasis_trap") and GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_stasis_trap")) < 2 then
			local x, y, visible = Renderer.WorldToScreen(UnitPos)
			if visible == 1 then
				Renderer.SetDrawColor(255, 255, 255, 255)
				Renderer.DrawText(TechiesHUD.font, x, y, math.floor((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(NPC.GetModifier(Unit, "modifier_techies_stasis_trap")))) * 100) / 100, 0)
			end
		end
		if not Entity.IsAlive(Unit) and TechiesHUD.ParticleList[Unit] then
			Particle.Destroy(TechiesHUD.ParticleList[Unit].particle)
			Particle.Destroy(TechiesHUD.ParticleList[Unit].particle2)
			TechiesHUD.ParticleList[Unit] = nil
		end
	end

	remote_pos_draw = {}
	mines_num = {}
	for i, Unit in pairs(TechiesHUD.RemoteMinesList) do
		local RemoteMinesModif = NPC.GetModifier(Unit, "modifier_techies_remote_mine")
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if Entity.IsAlive(Unit) then
			if not optionDrawCircleMethod then
				if optionRR then
					local scaled_x = math.floor(UnitPos:GetX())
					local scaled_y = math.floor(UnitPos:GetY())
					if remote_pos_draw[scaled_x] == nil then
							remote_pos_draw[scaled_x] = {}
							remote_pos_draw[scaled_x][scaled_y] = 0
					end
					if remote_pos_draw[scaled_x][scaled_y] ~= 1 then
						remote_pos_draw[scaled_x][scaled_y] = 1
						if (radius_off[Unit] and radius_off[Unit] < 455) or not radius_off[Unit] then
							Renderer.SetDrawColor(150, 255, 150, 150)
							TechiesHUD.DrawCircle(UnitPos, 425, optionResCircle)
						end
						if radius_off[Unit] then
							Renderer.SetDrawColor(0, 255, 0, 255)
							TechiesHUD.DrawCircle(UnitPos, radius_off[Unit] - 30, optionResCircle)
						end
					end
				end
			else
				if TechiesHUD.ParticleList[Unit] then
					Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle, 0, Entity.GetAbsOrigin(Unit))
					Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 0, Entity.GetAbsOrigin(Unit))
				end
			end
			if mines_num[Unit] == nil and RemoteMinesModif then
				mines_num[Unit] = 1
			end
			if mines_num[Unit] == 1 then
				if RemoteMinesModif then
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible == 1 then
						local num_mines = 0
						local num_mines_1_lvl = 0
						local num_mines_2_lvl = 0
						local num_mines_3_lvl = 0
						local oldest_mine = {die_time = math.huge}
						local stack_mines = {}
						for j, Unit2 in pairs(TechiesHUD.RemoteMinesList) do
							local remote_modif = NPC.GetModifier(Unit2, "modifier_techies_remote_mine")
							if NPC.IsPositionInRange(Unit2, UnitPos, 425 - (radius_off[Unit2] and 455 - radius_off[Unit2] or 0), Enum.TeamType.TEAM_FRIEND)
							and remote_modif
							then
								if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and optionAltInfoDrawing then
									local obj_mine = {Unit = Unit2}
									if optionAltInfoNumLevelRemote then
										local mines_level = (TechiesHUD.RemoteMinesDamage[Unit2] - 150) / 150
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
								mines_num[Unit2] = 0
								if state_mines[Unit] == nil then
									state_mines[Unit] = true
								end
								if radius_off[Unit] == nil then
									local radius_off_tmp
									for k, Unit3 in pairs(TechiesHUD.RemoteMinesList) do
										local remote_modif = NPC.GetModifier(Unit3, "modifier_techies_remote_mine")
										if NPC.IsPositionInRange(Unit3, UnitPos, 425, Enum.TeamType.TEAM_FRIEND)
										and remote_modif
										and Unit ~= Unit3
										then
											if radius_off[Unit3] then
												radius_off_tmp = radius_off[Unit3]
											end
										end
									end
									if radius_off_tmp then
										radius_off[Unit] = radius_off_tmp
									else
										radius_off[Unit] = 455
									end
								end

								if enemy_enabled[Unit] == nil then
									local enemy_enabled_tmp
									for k, Unit3 in pairs(TechiesHUD.RemoteMinesList) do
										local remote_modif = NPC.GetModifier(Unit3, "modifier_techies_remote_mine")
										if NPC.IsPositionInRange(Unit3, UnitPos, 425 - (radius_off[Unit3] and 455 - radius_off[Unit3] or 0), Enum.TeamType.TEAM_FRIEND)
										and remote_modif
										and Unit ~= Unit3
										then
											if enemy_enabled[Unit3] then
												enemy_enabled_tmp = enemy_enabled[Unit3]
											end
										end
									end
									if enemy_enabled_tmp then
										enemy_enabled[Unit] = enemy_enabled_tmp
									else
										enemy_enabled[Unit] = {}
									end
								end

								if need_enemy[Unit] == nil then
									local need_enemy_tmp
									for k, Unit3 in pairs(TechiesHUD.RemoteMinesList) do
										local remote_modif = NPC.GetModifier(Unit3, "modifier_techies_remote_mine")
										if NPC.IsPositionInRange(Unit3, UnitPos, 425 - (radius_off[Unit3] and 455 - radius_off[Unit3] or 0), Enum.TeamType.TEAM_FRIEND)
										and remote_modif
										and Unit ~= Unit3
										then
											if need_enemy[Unit3] then
												need_enemy_tmp = need_enemy[Unit3]
											end
										end
									end
									if need_enemy_tmp then
										need_enemy[Unit] = need_enemy_tmp
									else
										need_enemy[Unit] = 1
									end
								end
								need_enemy[Unit2] = need_enemy[Unit]
								state_mines[Unit2] = state_mines[Unit]
								enemy_enabled[Unit2] = enemy_enabled[Unit]
								if radius_off[Unit2] ~= radius_off[Unit] and TechiesHUD.ParticleList[Unit2] then
									radius_off[Unit2] = radius_off[Unit]
									Particle.Destroy(TechiesHUD.ParticleList[Unit2].particle2)
									TechiesHUD.ParticleList[Unit2].particle2 = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")
									Particle.SetControlPoint(TechiesHUD.ParticleList[Unit2].particle2, 1, Vector(80, 255, 50))
									Particle.SetControlPoint(TechiesHUD.ParticleList[Unit2].particle2, 3, Vector(20, 0, 0))
									Particle.SetControlPoint(TechiesHUD.ParticleList[Unit2].particle2, 2, Vector(radius_off[Unit], 255, 0))
									Particle.SetControlPoint(TechiesHUD.ParticleList[Unit2].particle2, 0, Entity.GetAbsOrigin(Unit))
								end
								radius_off[Unit2] = radius_off[Unit]
								if TechiesHUD.ParticleList[Unit2] then
									if not state_mines[Unit] then
										Particle.SetControlPoint(TechiesHUD.ParticleList[Unit2].particle2, 1, Vector(20, 120, 25))
									else
										Particle.SetControlPoint(TechiesHUD.ParticleList[Unit2].particle2, 1, Vector(80, 255, 50))
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
								--need_enemy[Unit]
								for _, v in pairs(stack_mines) do
									if _ > 7 then
										stack_mines[_] = nil
									end
								end

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
											state_mines[Unit] = not state_mines[Unit]
											if not state_mines[Unit] then
												Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle, 1, Vector(20, 120, 25))
											else
												Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle, 1, Vector(80, 255, 50))
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
								if state_mines[Unit] then
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
											if need_enemy[Unit] > 1 then
												need_enemy[Unit] = need_enemy[Unit] - 1
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
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 2 + math.floor(8 * optionAltInfoTimeMinesPanelSize), need_enemy[Unit], 0)

								-- num min +
								if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
									CursorOnButton = true
									Renderer.SetDrawColor(100, 100, 100, 250)
									if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
										if ClickSave then
											need_enemy[Unit] = need_enemy[Unit] + 1
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

								------------------------------------
								-- radius off -
								if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 4 + 1, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
									CursorOnButton = true
									Renderer.SetDrawColor(100, 100, 100, 250)
									if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
										if ClickSave then
											if radius_off[Unit] > 0 then
												radius_off[Unit] = radius_off[Unit] - 10
											end
											if optionDrawCircleMethod then
											Particle.Destroy(TechiesHUD.ParticleList[Unit].particle2)
											TechiesHUD.ParticleList[Unit].particle2 = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")
											Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 1, Vector(80, 255, 50))
											Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 3, Vector(20, 0, 0))
											Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 2, Vector(radius_off[Unit], 255, 0))
											Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 0, Entity.GetAbsOrigin(Unit))
											end
											ClickSave = false
										end
									else
										ClickSave = true
									end
								else
									Renderer.SetDrawColor(30, 30, 30, 150)
								end
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 4, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 4, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize) * 3)
								Renderer.SetDrawColor(255, 255, 255, 255)
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 4 + math.floor(8 * optionAltInfoTimeMinesPanelSize), "-", 0)

								-- num radius off text
								Renderer.SetDrawColor(30, 30, 30, 150)
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 5, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 5, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize) * 2)
								Renderer.SetDrawColor(255, 255, 255, 255)
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 5 + math.floor(8 * optionAltInfoTimeMinesPanelSize), radius_off[Unit], 0)

								-- radius off +
								if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 6, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
									CursorOnButton = true
									Renderer.SetDrawColor(100, 100, 100, 250)
									if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
										if ClickSave then
											if radius_off[Unit] < 455 then
												radius_off[Unit] = radius_off[Unit] + 10
												if optionDrawCircleMethod then
													Particle.Destroy(TechiesHUD.ParticleList[Unit].particle2)
													TechiesHUD.ParticleList[Unit].particle2 = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")
													Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 1, Vector(80, 255, 50))
													Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 3, Vector(20, 0, 0))
													Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 2, Vector(radius_off[Unit], 255, 0))
													Particle.SetControlPoint(TechiesHUD.ParticleList[Unit].particle2, 0, Entity.GetAbsOrigin(Unit))
												end
											end

											ClickSave = false
										end
									else
										ClickSave = true
									end
								else
									Renderer.SetDrawColor(30, 30, 30, 150)
								end
								Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 6, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(200, 200, 200, 150)
								Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 6, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize))
								Renderer.SetDrawColor(255, 255, 255, 255)
								Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize), y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * 6 + math.floor(8 * optionAltInfoTimeMinesPanelSize), "+", 0)
								------------------------------------
								-- heroes enabled
								local num_hero = 0
								local check_meepo = false
								for i, hero in pairs(Heroes.GetAll()) do
									if not Entity.IsSameTeam(myHero, hero) and not NPC.IsIllusion(hero) and (NPC.GetUnitName(hero) ~= "npc_dota_hero_meepo" or (NPC.GetUnitName(hero) == "npc_dota_hero_meepo" and not check_meepo)) then
										local hero_name = NPC.GetUnitName(hero)
										if hero_name == "npc_dota_hero_meepo" then
											check_meepo = true
										end
										if not TechiesHUD.IconCache[NPC.GetUnitName(hero)] then
											TechiesHUD.IconCache[NPC.GetUnitName(hero)] = Renderer.LoadImage("resource/flash3/images/heroes/" .. string.sub(NPC.GetUnitName(hero), 15) .. ".png")
										end
										if enemy_enabled[Unit][hero_name] == nil then
											enemy_enabled[Unit][hero_name] = true
										end

										if Input.IsCursorInRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize) * 2, y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * num_hero + 1, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize) + 1) then
											CursorOnButton = true
											Renderer.SetDrawColor(100, 100, 100, 250)
											if Input.IsKeyDown(Enum.ButtonCode.MOUSE_RIGHT) then
												if ClickSave then
													if enemy_enabled[Unit][hero_name] == nil then
														enemy_enabled[Unit][hero_name] = false
													else
														enemy_enabled[Unit][hero_name] = not enemy_enabled[Unit][hero_name]
													end
													ClickSave = false
												end
											else
												ClickSave = true
											end
										else
											Renderer.SetDrawColor(30, 30, 30, 150)
										end
										if enemy_enabled[Unit][hero_name] or enemy_enabled[Unit][hero_name] == nil then
											Renderer.SetDrawColor(255, 255, 255, 255)
										else
											Renderer.SetDrawColor(100, 100, 100, 255)
										end
										--Renderer.DrawFilledRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize) * 2, y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * num_hero, math.floor(20 * optionAltInfoTimeMinesPanelSize), math.floor(16 * optionAltInfoTimeMinesPanelSize))
										--Renderer.SetDrawColor(200, 200, 200, 150)
										--Renderer.DrawOutlineRect(x - math.floor(20 * optionAltInfoTimeMinesPanelSize) * 2, y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * num_hero, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize))
										--Renderer.SetDrawColor(255, 255, 255, 255)
										Renderer.DrawImage(TechiesHUD.IconCache[NPC.GetUnitName(hero)], x - math.floor(20 * optionAltInfoTimeMinesPanelSize) * 2, y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * num_hero, math.floor(20 * optionAltInfoTimeMinesPanelSize) + 1, math.floor(16 * optionAltInfoTimeMinesPanelSize))
										--Renderer.DrawTextCentered(TechiesHUD.Panelfont1, x - math.floor(10 * optionAltInfoTimeMinesPanelSize) * 3, y + math.floor(16 * optionAltInfoTimeMinesPanelSize) * num_hero + math.floor(8 * optionAltInfoTimeMinesPanelSize), "T", 0)

										num_hero = num_hero + 1
									end
								end

								-- barrel list
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
		end
		if GameRules.GetGameTime() - TechiesHUD.RemoteMinesCreateTimings[Unit] < Ability.GetCastPoint(remote) and not RemoteMinesModif then
			local x, y, visible = Renderer.WorldToScreen(UnitPos)
			if visible == 1 then
				Renderer.SetDrawColor(255, 255, 255, 255)
				Renderer.DrawText(TechiesHUD.font, x, y - 20, math.floor((Ability.GetCastPoint(remote) - (GameRules.GetGameTime() - TechiesHUD.RemoteMinesCreateTimings[Unit])) * 100) / 100, 0)
			end
		end
		if RemoteMinesModif and GameRules.GetGameTime() - Modifier.GetCreationTime(RemoteMinesModif) < 2 then
			local x, y, visible = Renderer.WorldToScreen(UnitPos)
			if visible == 1 then
				Renderer.SetDrawColor(255, 255, 255, math.floor(255 * ((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(RemoteMinesModif))) / 2)))
				Renderer.DrawText(TechiesHUD.font, x, y - 20, math.floor((2 - (GameRules.GetGameTime() - Modifier.GetCreationTime(RemoteMinesModif))) * 100) / 100, 0)
			end
		end
		if not Entity.IsAlive(Unit) and TechiesHUD.ParticleList[Unit] then
			Particle.Destroy(TechiesHUD.ParticleList[Unit].particle)
			Particle.Destroy(TechiesHUD.ParticleList[Unit].particle2)
			TechiesHUD.ParticleList[Unit] = nil
		end
	end

	for i, Unit in pairs(Heroes.GetAll()) do
		if not NPC.IsIllusion(Unit) and not Entity.IsSameTeam(myHero, Unit) then
			if optionPanelInfo and remote ~= nil and Ability.GetLevel(remote) ~= 0 then
				if NPC.HasAbility(Unit, "wisp_overcharge") then -- bonus_damage_pct
					wisp_overcharge = 1 + Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "wisp_overcharge"), "bonus_damage_pct") / 100
				end
				if NPC.HasAbility(Unit, "kunkka_ghostship") then -- ghostship_absorb
					kunkka_ghostship = 1 - Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "kunkka_ghostship"), "ghostship_absorb") / 100
				end
				if NPC.HasAbility(Unit, "ember_spirit_flame_guard") then -- absorb_amount
					flame_guard = Ability.GetLevelSpecialValueFor(NPC.GetAbility(Unit, "ember_spirit_flame_guard"), "absorb_amount")
				end

				local Hp, Hp_all = TechiesHUD.GetNumRemoteForKill(Unit, remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0), Entity.GetHealth(Unit), NPC.GetMana(Unit)), TechiesHUD.GetNumRemoteForKill(Unit, remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0), Entity.GetMaxHealth(Unit), NPC.GetMaxMana(Unit))

				local x, y = TechiesHUD.GetHeroPos(Hero.GetPlayerID(Unit))
				local bary = math.ceil(28 * TechiesHUD.ScreenScale)
				Renderer.SetDrawColor(0, 0, 0, 170)
				Renderer.DrawFilledRect(x, y, TechiesHUD.GetSize() - 4, bary - 2)
				Renderer.SetDrawColor(255, 127, 39, 255)
				Renderer.DrawOutlineRect(x - 1, y - 1, TechiesHUD.GetSize() - 2, bary)
				Renderer.SetDrawColor(255, 255, 255, 255)
				local x, y = TechiesHUD.GetHeroPos(Hero.GetPlayerID(Unit))
				Renderer.DrawTextCenteredY(TechiesHUD.HUDfont, x + 2, y + math.floor(6 * TechiesHUD.ScreenScale), math.ceil(Hp * 10) / 10, 0)
				Renderer.DrawTextCenteredY(TechiesHUD.HUDfont, x + 2, y + math.floor((6 + 14) * TechiesHUD.ScreenScale), math.ceil(Hp_all * 10) / 10, 0)
				if NPC.HasItem(Unit, "item_gem", 1) then
					Renderer.DrawTextCenteredY(TechiesHUD.HUDfont, x + TechiesHUD.GetSize() - math.floor(15 * TechiesHUD.ScreenScale), y + math.floor(6 * TechiesHUD.ScreenScale), "G", 0)
				end
				if NPC.HasItem(Unit, "item_ward_sentry", 1) or NPC.HasItem(Unit, "item_ward_sentry", 0) or NPC.HasItem(Unit, "item_ward_dispenser", 1) or NPC.HasItem(Unit, "item_ward_dispenser", 0) then
					Renderer.DrawTextCenteredY(TechiesHUD.HUDfont, x + TechiesHUD.GetSize() - math.floor(15 * TechiesHUD.ScreenScale), y + math.floor((6 + 14) * TechiesHUD.ScreenScale), "S", 0)
				end
			end
			if not Entity.IsDormant(Unit) and Entity.IsAlive(Unit) then
				local UnitPos = Entity.GetAbsOrigin(Unit)
				if optionBlastInfo and blast ~= nil and Ability.GetLevel(blast) ~= 0 then
					local Hp = Entity.GetHealth(Unit)
					x, y = Renderer.WorldToScreen(Entity.GetAbsOrigin(Unit))
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

				if optionDetonate and hero_time[Entity.GetIndex(Unit)] ~= nil and hero_time[Entity.GetIndex(Unit)] ~= 0 and hero_time[Entity.GetIndex(Unit)] ~= 1 and GameRules.GetGameTime() - hero_time[Entity.GetIndex(Unit)] < optionDelay / 1000 + 0.3 then -- remote delay draw
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible == 1 then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(TechiesHUD.font, x, y - 15, math.floor((0.3 - (GameRules.GetGameTime() - hero_time[Entity.GetIndex(Unit)])) * 100) / 100, 0)
					end
				end
				if optionDetonate and force_direction[Unit] ~= nil and force_direction[Unit] ~= 0 and GameRules.GetGameTime() - force_direction[Unit] < optionForceTimeWait then -- remote delay draw
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible == 1 then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(TechiesHUD.font, x, y - 30, math.floor((optionForceTimeWait - (GameRules.GetGameTime() - force_direction[Unit])) * 100) / 100, 0)
					end
				end


				if optionForceDrawLine and force ~= nil then -- force stuff line
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible == 1 then
						Renderer.SetDrawColor(255, 255, 255, 255)
						local tmp_x = 0 - 600 * math.sin((Entity.GetAbsRotation(Unit):GetYaw() - 90) / 57.3)
						local tmp_y = 600 * math.cos((Entity.GetAbsRotation(Unit):GetYaw() - 90) / 57.3)
						local x3,y3,visible3 = Renderer.WorldToScreen(UnitPos + Vector(tmp_x, tmp_y, 0))
						Renderer.DrawLine(x, y, x3, y3)
					end
				end
			end
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

function TechiesHUD.HasEscapeItemsOrAbility(Unit)
	local tmp_ability = NPC.GetItem(Unit, "item_cyclone")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetItem(Unit, "item_blink")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetItem(Unit, "item_black_king_bar")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetAbility(Unit, "antimage_blink")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetAbility(Unit, "queenofpain_blink")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetAbility(Unit, "riki_blink_strike")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetAbility(Unit, "puck_phase_shift")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	tmp_ability = NPC.GetAbility(Unit, "obsidian_destroyer_astral_imprisonment")
	if tmp_ability and Ability.IsReady(tmp_ability) then
		return true
	end
	return false
end

function TechiesHUD.OnUpdate()
	if not optionTotal then return end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end

	local myHero_override = false
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
		for i, Unit in pairs(Heroes.GetAll()) do
			if NPC.GetUnitName(Unit) and NPC.GetUnitName(Unit) == "npc_dota_hero_techies" and Entity.IsSameTeam(myHero, Unit) then
				myHero = Unit
				myHero_override = true
			end
		end
		if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
			return
		end
	end
	local remote = NPC.GetAbilityByIndex(myHero, 5)
	local remote_damage = Ability.GetLevelSpecialValueFor(remote, "damage")
	local force = NPC.GetItem(myHero, "item_force_staff", 1)

	for i, Unit in pairs(TechiesHUD.UndefEntity) do
		if Entity.IsNPC(Unit) then
			if NPC.GetUnitName(Unit) == "npc_dota_techies_land_mine" then
				if optionDrawCircleMethod then
					local particle = {particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf"), Unit = Unit}
					Particle.SetControlPoint(particle.particle, 1, Vector(255, 80, 80))
					Particle.SetControlPoint(particle.particle, 3, Vector(9, 0, 0))
					Particle.SetControlPoint(particle.particle, 2, Vector(425, 255, 0))
					Particle.SetControlPoint(particle.particle, 0, Entity.GetAbsOrigin(Unit))
					TechiesHUD.ParticleList[Unit] = particle
				end
				TechiesHUD.LandMinesList[Unit] = Unit
			elseif NPC.GetUnitName(Unit) == "npc_dota_techies_stasis_trap" then
				if optionDrawCircleMethod then
					local particle = {particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf"), Unit = Unit, particle2 = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")}
					Particle.SetControlPoint(particle.particle, 1, Vector(80, 100, 255))
					Particle.SetControlPoint(particle.particle, 3, Vector(20, 0, 0))
					Particle.SetControlPoint(particle.particle, 2, Vector(430, 255, 0))
					Particle.SetControlPoint(particle.particle, 0, Entity.GetAbsOrigin(Unit))
					Particle.SetControlPoint(particle.particle2, 1, Vector(0, 255, 255))
					Particle.SetControlPoint(particle.particle2, 3, Vector(20, 0, 0))
					Particle.SetControlPoint(particle.particle2, 2, Vector(630, 255, 0))
					Particle.SetControlPoint(particle.particle2, 0, Entity.GetAbsOrigin(Unit))
					TechiesHUD.ParticleList[Unit] = particle
				end
				TechiesHUD.StasisMinesList[Unit] = Unit
			elseif NPC.GetUnitName(Unit) == "npc_dota_techies_remote_mine" then
				if optionDrawCircleMethod then
					local particle = {particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf"), Unit = Unit, particle2 = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")}
					Particle.SetControlPoint(particle.particle, 1, Vector(20, 120, 25))
					Particle.SetControlPoint(particle.particle, 3, Vector(20, 0, 0))
					Particle.SetControlPoint(particle.particle, 2, Vector(455, 255, 0))
					Particle.SetControlPoint(particle.particle, 0, Entity.GetAbsOrigin(Unit))
					Particle.SetControlPoint(particle.particle2, 1, Vector(80, 255, 50))
					Particle.SetControlPoint(particle.particle2, 3, Vector(20, 0, 0))
					Particle.SetControlPoint(particle.particle2, 2, Vector(455, 255, 0))
					Particle.SetControlPoint(particle.particle2, 0, Entity.GetAbsOrigin(Unit))
					TechiesHUD.ParticleList[Unit] = particle
				end
				TechiesHUD.RemoteMinesList[Unit] = Unit
				TechiesHUD.RemoteMinesDamage[Unit] = remote_damage
				TechiesHUD.RemoteMinesCreateTimings[Unit] = GameRules.GetGameTime()
			end
		end
		table.remove(TechiesHUD.UndefEntity, i)
	end

	if not optionUseShareHero and myHero_override then
		return
	end

	if optionAutoPlant then
		for i, spot in pairs(spot_for_plant) do
			spot.num_mines = 0
			for j, Unit2 in pairs(TechiesHUD.RemoteMinesList) do
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
		local visage_stack = {}
		local templar_stack = {}
		local visage_stack_f = {}
		local templar_stack_f = {}

		local hp = {}
		local mp = {}
		local fasthp = {}
		local fastmp = {}
		local magic_shield = {}
		local magic_shield_f = {}
		for i, Unit in pairs(TechiesHUD.RemoteMinesList) do
			local UnitPos = Entity.GetAbsOrigin(Unit)
			local heroes_in_radius = NPC.GetHeroesInRadius(Unit, 401 - (radius_off[Unit] and 455 - radius_off[Unit] or 0), Enum.TeamType.TEAM_ENEMY)
			if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
			and not NPC.HasModifier(Unit, "modifier_faceless_void_chronosphere_freeze")
			and need_enemy[Unit]
			and state_mines[Unit]
			and #heroes_in_radius >= need_enemy[Unit]
			then
				for j, v in pairs(heroes_in_radius) do
					if hp[Entity.GetIndex(v)] == nil then
						hp[Entity.GetIndex(v)] = (Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3)
						mp[Entity.GetIndex(v)] = (NPC.GetMana(v) + NPC.GetManaRegen(v) * 0.3)
					end
					if fasthp[Entity.GetIndex(v)] == nil then
						fasthp[Entity.GetIndex(v)] = (Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3)
						fastmp[Entity.GetIndex(v)] = (NPC.GetMana(v) + NPC.GetManaRegen(v) * 0.3)
					end
					if hp[Entity.GetIndex(v)] > 0 or optionLegitDetonate then
						local calc_damage, calc_hp, calc_mp, calc_shield, calc_visage_stack, calc_templar_stack =
						TechiesHUD.GetDamageAndShieldAfterDetonate(v, TechiesHUD.RemoteMinesDamage[Unit] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0),
						hp[Entity.GetIndex(v)], mp[Entity.GetIndex(v)], magic_shield[Entity.GetIndex(v)], visage_stack[Entity.GetIndex(v)], templar_stack[Entity.GetIndex(v)])

						hp[Entity.GetIndex(v)] = calc_hp
						mp[Entity.GetIndex(v)] = calc_mp
						magic_shield[Entity.GetIndex(v)] = calc_shield
						visage_stack[Entity.GetIndex(v)] = calc_visage_stack
						templar_stack[Entity.GetIndex(v)] = calc_templar_stack
					end

					if fasthp[Entity.GetIndex(v)] > 0 and TechiesHUD.CheckMove(v, Unit, 0.3 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.04 * (Entity.GetHealth(v) / remote_damage)) == 1 and optionDetonateFast then
						local calc_damage, calc_hp, calc_mp, calc_shield, calc_visage_stack, calc_templar_stack =
						TechiesHUD.GetDamageAndShieldAfterDetonate(v, TechiesHUD.RemoteMinesDamage[Unit] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0),
						fasthp[Entity.GetIndex(v)], fastmp[Entity.GetIndex(v)], magic_shield_f[Entity.GetIndex(v)], visage_stack_f[Entity.GetIndex(v)], templar_stack_f[Entity.GetIndex(v)])

						fasthp[Entity.GetIndex(v)] = calc_hp
						fastmp[Entity.GetIndex(v)] = calc_mp
						magic_shield_f[Entity.GetIndex(v)] = calc_shield
						visage_stack_f[Entity.GetIndex(v)] = calc_visage_stack
						templar_stack_f[Entity.GetIndex(v)] = calc_templar_stack
					end
				end
			end
		end
		--------------------------- detonate logic
		if GameRules.GetGameTime() - check_detonate > 0.5 then
			local visage_stack = {}
			local templar_stack = {}
			local visage_stack_f = {}
			local templar_stack_f = {}
			local hp1 = {}
			local mp = {}

			local need_damage = {}
			local magic_shield = {}
			local hero_pos = nil
			for i, Unit in pairs(TechiesHUD.RemoteMinesList) do
				local UnitPos = Entity.GetAbsOrigin(Unit)
				local heroes_in_radius = NPC.GetHeroesInRadius(Unit, 401 - (radius_off[Unit] and 455 - radius_off[Unit] or 0), Enum.TeamType.TEAM_ENEMY)
				if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
				and state_mines[Unit]
				--and #heroes_in_radius >= Menu.GetValue(TechiesHUD.optionDetonateNumEnemy)
				then
					local num_enemy = 0
					for j, v in pairs(heroes_in_radius) do
						if (enemy_enabled[Unit][NPC.GetUnitName(v)] or enemy_enabled[Unit][NPC.GetUnitName(v)] == nil) and (NPC.IsKillable(v) or (NPC.HasItem(v, "item_aegis", 1) and optionDetonateAegis) or (NPC.GetUnitName(v) == "npc_dota_hero_skeleton_king" and optionDetonateWk) or NPC.HasModifier(v, "modifier_templar_assassin_refraction_absorb"))
						and not NPC.HasModifier(v, "modifier_item_aeon_disk_buff") and not NPC.HasModifier(v, "modifier_dazzle_shallow_grave")
						and not NPC.HasModifier(v, "modifier_oracle_false_promise") and not NPC.HasModifier(v, "modifier_skeleton_king_reincarnation_scepter_active") then
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
									local calc_time
									if optionAntiInitFail then
										calc_time = GameRules.GetGameTime() + ((TechiesHUD.HasEscapeItemsOrAbility(v) and 1 or 0) * 0.5)
									else
										calc_time = GameRules.GetGameTime()
									end
									if (GameRules.GetGameTime() - hero_time[Entity.GetIndex(v)] >= 0.2) then
										hero_time[Entity.GetIndex(v)] = 0
									end
									if hero_time[Entity.GetIndex(v)] == 0 or (hero_time[Entity.GetIndex(v)] ~= 0 and hero_time[Entity.GetIndex(v)] ~= 1 and calc_time < hero_time[Entity.GetIndex(v)]) then
										hero_time[Entity.GetIndex(v)] = calc_time
										--Log.Write(calc_time - GameRules.GetGameTime())
									end
									if hero_time[Entity.GetIndex(v)] ~= 0 and (GameRules.GetGameTime() - hero_time[Entity.GetIndex(v)] >= 0) then
										num_enemy = num_enemy + 1
										fast_hp_check = true
									end
								end
							end
							if (hp[Entity.GetIndex(v)] ~= nil and hp[Entity.GetIndex(v)] < 0) then
								if hero_time[Entity.GetIndex(v)] == 0 then
									hero_time[Entity.GetIndex(v)] = GameRules.GetGameTime() + optionDelay / 1000
								end
								if hero_time[Entity.GetIndex(v)] ~= 0 and (GameRules.GetGameTime() - hero_time[Entity.GetIndex(v)] >= 0) and not fast_hp_check then
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
						if (need_damage[Entity.GetIndex(v)] == nil or need_damage[Entity.GetIndex(v)] < Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3) or optionLegitDetonate then
							check_enemy = 1
						end
					end
					if need_enemy[Unit] and num_enemy >= need_enemy[Unit] and check_enemy > 0 then
						check_detonate = GameRules.GetGameTime()
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(Unit, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Unit, 0, 0)
						for j, v in pairs(heroes_in_radius) do
							if need_damage[Entity.GetIndex(v)] == nil then
								hp1[Entity.GetIndex(v)] = (Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3)
								mp[Entity.GetIndex(v)] = (NPC.GetMana(v) + NPC.GetManaRegen(v) * 0.3)
								need_damage[Entity.GetIndex(v)] = 0
							end
							if hero_pos == nil then
								hero_pos = Entity.GetAbsOrigin(v)
							end
							local calc_damage, calc_hp, calc_mp, calc_shield, calc_visage_stack, calc_templar_stack =
							TechiesHUD.GetDamageAndShieldAfterDetonate(v, TechiesHUD.RemoteMinesDamage[Unit] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0),
							hp1[Entity.GetIndex(v)], mp[Entity.GetIndex(v)], magic_shield[Entity.GetIndex(v)], visage_stack[Entity.GetIndex(v)], templar_stack[Entity.GetIndex(v)])

							hp1[Entity.GetIndex(v)] = calc_hp
							mp[Entity.GetIndex(v)] = calc_mp
							magic_shield[Entity.GetIndex(v)] = calc_shield
							visage_stack[Entity.GetIndex(v)] = calc_visage_stack
							templar_stack[Entity.GetIndex(v)] = calc_templar_stack
							need_damage[Entity.GetIndex(v)] = need_damage[Entity.GetIndex(v)] + calc_damage
						end
					end
				end
			end
			if hero_pos ~= nil then
				local x, y = Renderer.WorldToScreen(hero_pos)
				if optionDetonateCam and (x < 0 or x > size_x or y < 0 or y > size_y) then
					Engine.ExecuteCommand("dota_camera_set_lookatpos " .. hero_pos:GetX() .. " " .. hero_pos:GetY())
					hero_cam_first_pos = Entity.GetAbsOrigin(myHero)
					hero_cam_time = GameRules.GetGameTime()
				end
				hero_pos = nil
			end
		end
	end -- auto detonate

	for i, Unit in pairs(Heroes.GetAll()) do
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if Ability.GetLevel(remote) ~= 0 then -- remote auto detonate
			if  Entity.IsHero(Unit)
			and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
			and not NPC.IsIllusion(Unit)
			and not Entity.IsDormant(Unit)
			and (NPC.IsKillable(Unit) or (NPC.HasItem(Unit, "item_aegis", 1) and optionDetonateAegis) or (NPC.GetUnitName(Unit) == "npc_dota_hero_skeleton_king" and optionDetonateWk)
			or NPC.HasModifier(Unit, "modifier_templar_assassin_refraction_absorb"))
			and not NPC.HasModifier(Unit, "modifier_dazzle_shallow_grave") and not NPC.HasModifier(Unit, "modifier_oracle_false_promise")
			and not NPC.HasModifier(Unit, "modifier_item_aeon_disk_buff") and not NPC.HasModifier(Unit, "modifier_skeleton_king_reincarnation_scepter_active")
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
					if NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil and state_mines[Unit2] and (enemy_enabled[Unit2][NPC.GetUnitName(Unit)] or enemy_enabled[Unit2][NPC.GetUnitName(Unit)] == nil) then
						if NPC.IsPositionInRange(Unit2, UnitPos, 425 - (radius_off[Unit2] and 455 - radius_off[Unit2] or 0), 0) then -- - NPC.GetMoveSpeed(Unit) * 0.1
							remote_sum_damage = remote_sum_damage + TechiesHUD.RemoteMinesDamage[Unit2] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						end

						local tmp_x = 0 - 600 * math.sin((Entity.GetAbsRotation(Unit):GetYaw() - 90) / 57.3)
						local tmp_y = 600 * math.cos((Entity.GetAbsRotation(Unit):GetYaw() - 90) / 57.3)
						if NPC.IsPositionInRange(Unit2, UnitPos + Vector(tmp_x, tmp_y, 0), 425 - (radius_off[Unit2] and 455 - radius_off[Unit2] or 0), 0) then
							force_remote_sum_damage = force_remote_sum_damage + TechiesHUD.RemoteMinesDamage[Unit2] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
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
								if force_direction[Unit] == nil or force_direction[Unit] == 0 then
									force_direction[Unit] = GameRules.GetGameTime()
								elseif Ability.GetCooldownTimeLeft(force) == 0 and GameRules.GetGameTime() - force_direction[Unit] > optionForceTimeWait then
									Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, Unit, Vector(0, 0, 0), force, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, 0, 0)
									forc_time = GameRules.GetGameTime()
									hero_time[Entity.GetIndex(Unit)] = 1
									forced_time = GameRules.GetGameTime()
									force_direction[Unit] = 0
								end
							else
								force_direction[Unit] = 0
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
	if CursorOnButton then
		return false
	end
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
		if not optionUseShareHero then
			return true
		end
		for i, Unit in pairs(Heroes.GetAll()) do
			if NPC.GetUnitName(Unit) and NPC.GetUnitName(Unit) == "npc_dota_hero_techies" and Entity.IsSameTeam(myHero, Unit) then
				myHero = Unit
			end
		end
		if NPC.GetUnitName(myHero) ~= "npc_dota_hero_techies" then
			return true
		end
	end

	if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET and orders.target and Entity.IsSameTeam(myHero, orders.target)
	and (NPC.GetUnitName(orders.target) == "npc_dota_techies_land_mine"
	or NPC.GetUnitName(orders.target) == "npc_dota_techies_stasis_trap"
	or NPC.GetUnitName(orders.target) == "npc_dota_techies_remote_mine") then
		Player.PrepareUnitOrders(orders.player, Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, nil, Entity.GetAbsOrigin(orders.target), orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
		return false
	end

	if orders.order ~= Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION and orders.order ~= Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TOGGLE_AUTO then return true end
    if not orders.ability then return true end

	if Ability.GetName(orders.ability) == "techies_suicide" then
		TechiesHUD.BlastPosition = orders.position
		return true
	end

	if optionFDFailSwitch and Ability.GetName(orders.ability) == "techies_focused_detonate" then
		if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
			Player.PrepareUnitOrders(orders.player, Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, orders.target, Input.GetWorldCursorPos(), orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			return false
		end
		local visage_stack = {}
		local templar_stack = {}
		local visage_stack_f = {}
		local templar_stack_f = {}
		local hp = {}
		local mp = {}
		local magic_shield = {}
		for i, Unit in pairs(TechiesHUD.RemoteMinesList) do
			if NPC.HasModifier(Unit, "modifier_techies_remote_mine")
			and NPC.IsPositionInRange(Unit, orders.position, 700, 0)
			then
				local num_enemy = 0
				for j, v in pairs(Entity.GetHeroesInRadius(Unit, 425 - 24, Enum.TeamType.TEAM_ENEMY)) do
					if Entity.IsAlive(v)
					and not Entity.IsDormant(v)
					and not NPC.HasModifier(Unit, "modifier_manta")
					and (NPC.IsKillable(v) or (NPC.HasItem(v, "item_aegis", 1) and optionDetonateAegis)
					or NPC.GetUnitName(v) == "npc_dota_hero_skeleton_king" or NPC.HasModifier(v, "modifier_templar_assassin_refraction_absorb"))
					and not NPC.HasModifier(v, "modifier_dazzle_shallow_grave") and not NPC.HasModifier(v, "modifier_oracle_false_promise")
					and not NPC.HasModifier(v, "modifier_item_aeon_disk_buff") and not NPC.HasModifier(v, "modifier_skeleton_king_reincarnation_scepter_active")
					and NPC.GetMagicalArmorDamageMultiplier(v) ~= 0
					then
						--Log.Write("check")
						if hp[Entity.GetIndex(v)] == nil then
							hp[Entity.GetIndex(v)] = Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3
							mp[Entity.GetIndex(v)] = NPC.GetMana(v) + NPC.GetManaRegen(v) * 0.3
						end
						if hp[Entity.GetIndex(v)] > 0 or optionFDFailSwitchMode then
							local calc_damage, calc_hp, calc_mp, calc_shield, calc_visage_stack, calc_templar_stack =
							TechiesHUD.GetDamageAndShieldAfterDetonate(v, TechiesHUD.RemoteMinesDamage[Unit] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0),
							hp[Entity.GetIndex(v)], mp[Entity.GetIndex(v)], magic_shield[Entity.GetIndex(v)], visage_stack[Entity.GetIndex(v)], templar_stack[Entity.GetIndex(v)])

							hp[Entity.GetIndex(v)] = calc_hp
							mp[Entity.GetIndex(v)] = calc_mp
							magic_shield[Entity.GetIndex(v)] = calc_shield
							visage_stack[Entity.GetIndex(v)] = calc_visage_stack
							templar_stack[Entity.GetIndex(v)] = calc_templar_stack
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

	-- if Ability.GetName(orders.ability) ~= "techies_remote_mines" and Ability.GetName(orders.ability) ~= "techies_land_mines" and Ability.GetName(orders.ability) ~= "techies_stasis_trap" then
		-- return true
	-- end

	if (Ability.GetName(orders.ability) == "techies_land_mines" and GUI.IsEnabled(TechiesHUD.Identity .. "optionMinePlacerLM")) or (Ability.GetName(orders.ability) == "techies_stasis_trap" and GUI.IsEnabled(TechiesHUD.Identity .. "optionMinePlacerST")) then
		local modif_name
		local range
		local add_h
		if Ability.GetName(orders.ability) == "techies_land_mines" then
			modif_name = "modifier_techies_land_mine"
			range = 400
			add_h = 24
		else
			modif_name = "modifier_techies_stasis_trap"
			range = 600
			add_h = 24
		end

		local closest_mine
		local closest_mine1
		for i, Unit in pairs(NPCs.GetAll()) do
			if NPC.GetModifier(Unit, modif_name)
			and Entity.IsAlive(Unit)
			and NPC.IsPositionInRange(Unit, orders.position, range, 0)
			then
				if not closest_mine then
					closest_mine = Unit
				elseif not closest_mine1 and (Entity.GetAbsOrigin(Unit) - Entity.GetAbsOrigin(closest_mine)):Length2DSqr() > 4 then
					closest_mine1 = Unit
				end
				if (Entity.GetAbsOrigin(Unit) - orders.position):Length2DSqr() < (Entity.GetAbsOrigin(closest_mine) - orders.position):Length2DSqr()
				and (Entity.GetAbsOrigin(Unit) - Entity.GetAbsOrigin(closest_mine)):Length2DSqr() > 3 then
					closest_mine1 = closest_mine
					closest_mine = Unit
				end
			end
		end
		local tmp_vec
		if closest_mine and closest_mine1 and (Entity.GetAbsOrigin(closest_mine) - Entity.GetAbsOrigin(closest_mine1)):Length2DSqr() > 4 then
			local mine_pos = Entity.GetAbsOrigin(closest_mine)
			local mine_pos1 = Entity.GetAbsOrigin(closest_mine1)
			local a = (mine_pos - mine_pos1):Length2DSqr() / (2 * (mine_pos - mine_pos1):Length2D())
			local d = (mine_pos - mine_pos1):Length2D()
			local h = (range^2 - a^2)^0.5
			local P2 = mine_pos + (mine_pos1 - mine_pos):Scaled(a):Scaled(1/d)
			local P31 = Vector(P2:GetX() + h * (mine_pos1:GetY() - mine_pos:GetY()) / d, P2:GetY() - h * (mine_pos1:GetX() - mine_pos:GetX()) / d, P2:GetZ())
			local P32 = Vector(P2:GetX() - h * (mine_pos1:GetY() - mine_pos:GetY()) / d, P2:GetY() + h * (mine_pos1:GetX() - mine_pos:GetX()) / d, P2:GetZ())
			local h_pos = ((range + add_h)^2 - (d / 2)^2)^0.5
			local closest_mine
			local closest_mine1
			local tmp_vec1 = P2 + ((P31 - P2):Normalized()):Scaled(h_pos)
			local tmp_vec2 = P2 + ((P32 - P2):Normalized()):Scaled(h_pos)
			for i, Unit in pairs(NPCs.GetAll()) do
				if NPC.GetModifier(Unit, modif_name)
				and Entity.IsAlive(Unit)
				and NPC.IsPositionInRange(Unit, tmp_vec1, range, 0)
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
				if NPC.GetModifier(Unit, modif_name)
				and Entity.IsAlive(Unit)
				and NPC.IsPositionInRange(Unit, tmp_vec2, range, 0)
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
				tmp_vec = P2 + ((P31 - P2):Normalized()):Scaled(h_pos)
			elseif not closest_mine1 then
				tmp_vec = P2 + ((P32 - P2):Normalized()):Scaled(h_pos)
			end
		elseif closest_mine then
			local mine_pos = Entity.GetAbsOrigin(closest_mine)
			local mine_pos1 = Entity.GetAbsOrigin(closest_mine)
			local order_pos = orders.position
			mine_pos1:SetZ(order_pos:GetZ())
			mine_pos:SetZ(0)
			order_pos:SetZ(0)
			tmp_vec = mine_pos1 + ((order_pos - mine_pos):Normalized()):Scaled(range + add_h)
		end
		if tmp_vec then
			Player.PrepareUnitOrders(orders.player, orders.order, orders.target, tmp_vec, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			return false
		end
	end

	if GUI.IsEnabled(TechiesHUD.Identity .. "optionStack") then
		local closest_pos
		for i = 1, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if ((Ability.GetName(orders.ability) == "techies_land_mines" and (NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil))
			or (Ability.GetName(orders.ability) == "techies_stasis_trap" and (NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil))
			or (Ability.GetName(orders.ability) == "techies_remote_mines" and (NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil or NPC.GetModifier(Unit, "modifier_techies_stasis_trap") ~= nil)))
			and Entity.IsAlive(Unit)
			and NPC.IsPositionInRange(Unit, orders.position, GUI.Get(TechiesHUD.Identity .. "optionStackRange"), 0)
			then
				if not closest_pos then
					closest_pos = UnitPos
				end
				if (UnitPos - orders.position):Length2DSqr() < (closest_pos - orders.position):Length2DSqr() then
					closest_pos = UnitPos
				end

			end
		end
		if closest_pos then
			Player.PrepareUnitOrders(orders.player, orders.order, orders.target, closest_pos, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			return false
		end
	end
    return true
end

return TechiesHUD