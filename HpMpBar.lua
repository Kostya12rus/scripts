local HpMpBar = {}
HpMpBar.Identity = "HpMpBar"
HpMpBar.LastBayBack = {}
HpMpBar.UltimateTime = {}
HpMpBar.TpTime = {}
HpMpBar.TpCooldown = {}
HpMpBar.Font = Renderer.LoadFont("Arial", Config.ReadInt("HpMpBar", "Font", 10), Enum.FontWeight.BOLD)
HpMpBar.FontSmall = Renderer.LoadFont("Arial", Config.ReadInt("HpMpBar", "Font", 12), Enum.FontWeight.BOLD)
HpMpBar.Font1 = Renderer.LoadFont("Arial", Config.ReadInt("HpMpBar", "Font1", 14), Enum.FontWeight.BOLD)

local ult_icon_h = Renderer.LoadImage("resource/flash3/images/event_1stkill.png")
local obs_icon_h = Renderer.LoadImage("resource/flash3/images/items/ward_observer.png")
local sen_icon_h = Renderer.LoadImage("resource/flash3/images/items/ward_sentry.png")
local gem_icon_h = Renderer.LoadImage("resource/flash3/images/items/gem.png")
local smk_icon_h = Renderer.LoadImage("resource/flash3/images/items/smoke_of_deceit.png")
local aeg_icon_h = Renderer.LoadImage("resource/flash3/images/items/aegis.png")
local dst_icon_h = Renderer.LoadImage("resource/flash3/images/items/dust.png")
local aen_icon_h = Renderer.LoadImage("resource/flash3/images/items/aeon_disk.png")
HpMpBar.Locale = {
	["name"] = {
		["english"] = "HpMpBar"
	},
	["desc"] = {
		["english"] = "HpMpBar v0.2.3",
		["russian"] = "HpMpBar v0.2.3"
	},
	["bary"] = {
		["english"] = "Height in percent",
		["russian"] = "Высота в процентах"
	},
	["showhp"] = {
		["english"] = "Show hp",
		["russian"] = "Показывать хп"
	},
	["showmp"] = {
		["english"] = "Show mp",
		["russian"] = "Показывать мп"
	},
	["dyny"] = {
		["english"] = "Dynamic height",
		["russian"] = "Динамическая высота"
	},
	["showdangitems"] = {
		["english"] = "Show dangerous items",
		["russian"] = "Показывать опастные предметы"
	},
	["baybackpanel"] = {
		["english"] = "Show bayback status",
		["russian"] = "Показывать наличие байбека"
	},
	["ultpanel"] = {
		["english"] = "Show ult status",
		["russian"] = "Показывать наличие ультимейта"
	},
	["altinfo"] = {
		["english"] = "Alt info",
		["russian"] = "Alt информация"
	},
	["altinfohpmp"] = {
		["english"] = "Show max hp/mp",
		["russian"] = "Показывать дополнительно макс. hp/mp"
	},
	["style1custom"] = {
		["english"] = "Big style options",
		["russian"] = "Настройки большого стиля"
	},
	["decorate"] = {
		["english"] = "Timer circle(can fps drop)",
		["russian"] = "Круг отсчета(возможно падение фпс)"
	},
	["fontoff"] = {
		["english"] = "Font size offset",
		["russian"] = "Размер шрифта смещение"
	},
	["calib"] = {
		["english"] = "Calibration",
		["russian"] = "Калибровка"
	},
	["left"] = {
		["english"] = "Radiant x offset",
		["russian"] = "Светлые х смещение"
	},
	["right"] = {
		["english"] = "Dire x offset",
		["russian"] = "Темные х смещение"
	},
	["horiz"] = {
		["english"] = "All y offset",
		["russian"] = "Все у смещение"
	},
	["dist"] = {
		["english"] = "Distance",
		["russian"] = "Растояние"
	}
}

function HpMpBar.OnGameStart()
	HpMpBar.LastBayBack = {}
	HpMpBar.UltimateTime = {}
	HpMpBar.TpTime = {}
	HpMpBar.TpCooldown = {}
end

function HpMpBar.OnGameEnd()
	HpMpBar.LastBayBack = {}
	HpMpBar.UltimateTime = {}
	HpMpBar.TpTime = {}
	HpMpBar.TpCooldown = {}
end

local Monitor = {
	["21"] = { ["first"] = 33.8,	["next"] = 54, 		["step"] = 2.51 },
	["10"] = { ["first"] = 26.9,	["next"] = 55.7, 	["step"] = 3.533},
	["9"] =  { ["first"] = 28.326,	["next"] = 55.32,	["step"] = 3.314},
	["3"] =  { ["first"] = 21.3,	["next"] = 57.14,	["step"] = 4.4	},
	["1"] =  { ["first"] = 31.875,	["next"] = 54.375,	["step"] = 2.8	}}

function HpMpBar.GetSize()
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
	return math.floor(Monitor[m]["step"] * p)
end

function HpMpBar.GetHeroPos(Unit)
	local indexHero = Hero.GetPlayerID(Unit)
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
	local dw = Monitor[m]["first"] + GUI.Get(HpMpBar.Identity .. "left") / 10 + ((indexHero) * (Monitor[m]["step"] + (GUI.Get(HpMpBar.Identity .. "dist") / 10)) )
	if indexHero > 4 then
		dw = Monitor[m]["next"] + GUI.Get(HpMpBar.Identity .. "right") / 10 + ( (indexHero - 5) * (Monitor[m]["step"] + (GUI.Get(HpMpBar.Identity .. "dist") / 10)) )
	end
	local pos = math.floor( p * dw )
	local addit_h = 0
	local myHero = Heroes.GetLocal()
	if Players.GetByPlayerID(indexHero) and Player.GetTeamData(Players.GetByPlayerID(indexHero)) and Player.GetTeamData(Players.GetByPlayerID(indexHero)).respawnTime ~= -1 then
		addit_h = addit_h + 2.45
	else
		if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and myHero and Entity.IsSameTeam(myHero, Unit) then
			addit_h = addit_h + 1.6
		end
		if not myHero then
			addit_h = addit_h + 1.6
		end
	end
	return pos, math.floor(h * (0.04 + (GUI.Get(HpMpBar.Identity .. "horiz") + (GUI.IsEnabled(HpMpBar.Identity .. "dyny") and addit_h or 0)) / 100))
end

function HpMpBar.GetHeroPosCenterX(Unit)
	local x, y = HpMpBar.GetHeroPos(Unit)
	x = x + math.floor(HpMpBar.GetSize() / 2)
	return x, y
end

function HpMpBar.ItemState(Unit, Item)
	for i = 0, 12 do
		local tmp_item = NPC.GetItemByIndex(Unit, i)
		if tmp_item and Ability.GetName(tmp_item) == Item then
			if i >= 0 and i < 6 then
				return 0
			elseif i < 9 then
				return 1
			else
				return 2
			end
		end
	end
end

local old_scale
local old_font_off
function HpMpBar.OnDraw()
	if GUI == nil then
		return
	end
	if not GUI.Exist(HpMpBar.Identity) then
		GUI.Initialize(HpMpBar.Identity, GUI.Category.General, HpMpBar.Locale["name"], HpMpBar.Locale["desc"], "Zerling14")
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "dyny", HpMpBar.Locale["dyny"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "showdangitems", HpMpBar.Locale["showdangitems"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "showhp", HpMpBar.Locale["showhp"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "showmp", HpMpBar.Locale["showmp"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "baybackpanel", HpMpBar.Locale["baybackpanel"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "ultpanel", HpMpBar.Locale["ultpanel"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "altinfo", HpMpBar.Locale["altinfo"], GUI.MenuType.Label)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "altinfohpmp", HpMpBar.Locale["altinfohpmp"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "calib", HpMpBar.Locale["calib"], GUI.MenuType.Label) -- Calibration
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "bary", HpMpBar.Locale["bary"], GUI.MenuType.Slider, 50, 250, 140)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "fontoff", HpMpBar.Locale["fontoff"], GUI.MenuType.Slider, -10, 10, 0)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "left", HpMpBar.Locale["left"], GUI.MenuType.Slider, -10, 10, 0)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "right", HpMpBar.Locale["right"], GUI.MenuType.Slider, -10, 10, 0)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "horiz", HpMpBar.Locale["horiz"], GUI.MenuType.Slider, -10, 10, 0)
		GUI.AddMenuItem(HpMpBar.Identity, HpMpBar.Identity .. "dist", HpMpBar.Locale["dist"], GUI.MenuType.Slider, -10, 10, 0)
	end
	if not GUI.IsEnabled(HpMpBar.Identity) then
		return
	end

	if not Engine.IsInGame() then
		return
	end

	local myHero = Heroes.GetLocal()

	local scale = tonumber(GUI.Get(HpMpBar.Identity .. "bary")) / 100

	local fontoff = GUI.Get(HpMpBar.Identity .. "fontoff")
	if old_scale ~= scale or fontoff ~= old_font_off then
		HpMpBar.Font = Renderer.LoadFont("Arial", math.floor((10 + fontoff) * scale) , Enum.FontWeight.BOLD)
		HpMpBar.FontSmall = Renderer.LoadFont("Arial", math.floor((12 + fontoff) * scale) , Enum.FontWeight.BOLD)
		HpMpBar.Font1 = Renderer.LoadFont("Arial", math.floor((14 + fontoff) * scale) , Enum.FontWeight.BOLD)
	end

	old_scale = scale
	old_font_off = fontoff
	for _, Unit in pairs(Heroes.GetAll()) do
		if not NPC.IsIllusion(Unit) then
			local x, y = HpMpBar.GetHeroPos(Unit)
			local x_center, y_center = HpMpBar.GetHeroPosCenterX(Unit)
			local Hp, HpMax = Entity.GetHealth(Unit), Entity.GetMaxHealth(Unit)
			local HpPercent = Hp / HpMax

			local Mp, MpMax = math.ceil(NPC.GetMana(Unit)), math.ceil(NPC.GetMaxMana(Unit))
			local MpPercent = Mp / MpMax

			local alpha = 255

			local bayback_cd = HpMpBar.LastBayBack[Hero.GetPlayerID(Unit)]
			local bayback_cd_p = 0
			if bayback_cd then
				bayback_cd_p = (bayback_cd + 480 - GameRules.GetGameTime()) / 480
			end

			local tp_cooldown
			if NPC.HasItem(Unit, "item_tpscroll", false) then
				local tmp_item = NPC.GetItem(Unit, "item_tpscroll", false)
				if tmp_item ~= nil then
					if Ability.GetCooldownLength(tmp_item) ~= 0 then
						HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] = Ability.GetCooldownLength(tmp_item)
					end
					if not HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] then
						HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] = 0
					end
					local time_last_use
					if not NPC.IsDormant(Unit) then
						HpMpBar.TpTime[Hero.GetPlayerID(Unit)] = GameRules.GetGameTime() - (HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] -  Ability.GetCooldown(tmp_item))
						tp_cooldown = Ability.GetCooldown(tmp_item)
					else
						if not HpMpBar.TpTime[Hero.GetPlayerID(Unit)] then
							HpMpBar.TpTime[Hero.GetPlayerID(Unit)] = 0
						end
						if GameRules.GetGameTime() - HpMpBar.TpTime[Hero.GetPlayerID(Unit)] > 0 then
							tp_cooldown = math.ceil( HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] - (GameRules.GetGameTime() - HpMpBar.TpTime[Hero.GetPlayerID(Unit)]))
						else
							tp_cooldown = 0
						end
					end
				end
			elseif HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] and HpMpBar.TpTime[Hero.GetPlayerID(Unit)] then
				if GameRules.GetGameTime() - HpMpBar.TpTime[Hero.GetPlayerID(Unit)] > 0 then
					tp_cooldown = math.ceil( HpMpBar.TpCooldown[Hero.GetPlayerID(Unit)] - (GameRules.GetGameTime() - HpMpBar.TpTime[Hero.GetPlayerID(Unit)]))
				else
					tp_cooldown = 0
				end
			end
			local ultimate_cd
			local ultimate_cd_time
			local have_mana_ultimate = false
			local i = 0
			local tmp_ability = NPC.GetAbilityByIndex(Unit, i)
			while tmp_ability ~= nil and Entity.IsAbility(tmp_ability) and not Ability.IsAttributes(tmp_ability) do
				if Ability.GetLevel(tmp_ability) ~= 0 and Ability.IsUltimate(tmp_ability) then
					have_mana_ultimate = Mp >= Ability.GetManaCost(tmp_ability)
					local time_last_use
					if not NPC.IsDormant(Unit) then
						time_last_use = GameRules.GetGameTime() - Ability.SecondsSinceLastUse(tmp_ability)
						HpMpBar.UltimateTime[Hero.GetPlayerID(Unit)] = time_last_use
					else
						if not HpMpBar.UltimateTime[Hero.GetPlayerID(Unit)] then
							HpMpBar.UltimateTime[Hero.GetPlayerID(Unit)] = 0
						end
						time_last_use = HpMpBar.UltimateTime[Hero.GetPlayerID(Unit)]
					end
					if GameRules.GetGameTime() - time_last_use > 0 then
						ultimate_cd_time = math.ceil( Ability.GetCooldownLength(tmp_ability) - (GameRules.GetGameTime() - time_last_use))
					else
						ultimate_cd_time = 0
					end
					if Ability.GetCooldownLength(tmp_ability) == 0 then
						ultimate_cd = 0
					else
						ultimate_cd = ultimate_cd_time / Ability.GetCooldownLength(tmp_ability)
					end
					break;
				end
				i = i + 1
				tmp_ability = NPC.GetAbilityByIndex(Unit, i)
			end
			local bary = math.floor(8 * scale)

			local center_x, center_y = x_center - math.ceil(HpMpBar.GetSize() / 4), y_center + math.floor(bary * 2.5)
			local center_x_r, center_y_r = x_center + math.ceil(HpMpBar.GetSize() / 4), y_center + math.floor(bary * 2.5)

			if HpPercent == HpPercent then
				Renderer.SetDrawColor(0, 100, 0, alpha)
				Renderer.DrawFilledRect(x + math.floor((HpMpBar.GetSize() - 4) * HpPercent), y, HpMpBar.GetSize() - 4 - math.floor((HpMpBar.GetSize() - 4) * HpPercent), bary)
				if myHero and Entity.IsSameTeam(myHero, Unit) and NPC.IsVisible(Unit) then
					Renderer.SetDrawColor(0, 200, 200, alpha)
				else
					Renderer.SetDrawColor(0, 200, 0, alpha)
				end
				Renderer.DrawFilledRect(x, y, math.floor((HpMpBar.GetSize() - 4) * HpPercent), bary)
				Renderer.SetDrawColor(255, 255, 255, alpha)
			end

			if bayback_cd_p <= 0 and not Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) and GUI.IsEnabled(HpMpBar.Identity .. "baybackpanel") then
				Renderer.SetDrawColor(255, 180, 0, alpha)
				Renderer.DrawFilledRect(x - 1, y + bary * 2 - 2, HpMpBar.GetSize() - 2, 4)
			end


			if MpPercent == MpPercent then
				Renderer.SetDrawColor(0, 0, 100, alpha)
				Renderer.DrawFilledRect(x + math.floor((HpMpBar.GetSize() - 4) * MpPercent), y + bary, HpMpBar.GetSize() - 4 - math.floor((HpMpBar.GetSize() - 4) * MpPercent), bary)
				Renderer.SetDrawColor(0, 0, 255, alpha)
				Renderer.DrawFilledRect(x, y + bary, math.floor((HpMpBar.GetSize() - 4) * MpPercent), bary)
				Renderer.SetDrawColor(255, 255, 255, alpha)
			end
			if GUI.IsEnabled(HpMpBar.Identity .. "altinfohpmp") and Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
				--Log.Write((#("720") * (math.floor(((math.floor((12 + fontoff) * scale)) / 2.5) + 0.5) + 1)) - 1)
				if GUI.IsEnabled(HpMpBar.Identity .. "showhp") then
					Renderer.DrawTextCentered(HpMpBar.FontSmall, x_center, y_center + math.floor(5 * scale) - 1, Hp .. "/" .. HpMax, 0)
				end
				if GUI.IsEnabled(HpMpBar.Identity .. "showmp") then
					Renderer.DrawTextCentered(HpMpBar.FontSmall, x_center, y_center + bary + math.floor(5 * scale) - 1, Mp .. "/" .. MpMax, 0)
				end
			else
				if GUI.IsEnabled(HpMpBar.Identity .. "showhp") then
					Renderer.DrawTextCentered(HpMpBar.FontSmall, x_center, y_center + math.floor(5 * scale) - 1, Hp, 0)
				end
				if GUI.IsEnabled(HpMpBar.Identity .. "showmp") then
					Renderer.DrawTextCentered(HpMpBar.FontSmall, x_center, y_center + bary + math.floor(5 * scale) - 1, Mp, 0)
				end
			end

			if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
				if bayback_cd_p > 0 then
					Renderer.DrawTextCentered(HpMpBar.Font, center_x, center_y, math.floor((bayback_cd + 480 - GameRules.GetGameTime()) / 60) .. ":" .. string.format("%02d", math.floor((bayback_cd + 480 - GameRules.GetGameTime()) % 60)), 1)
				elseif bayback_cd then
					Renderer.DrawTextCentered(HpMpBar.Font, center_x, center_y, math.floor((bayback_cd - GameRules.GetGameStartTime()) / 60) .. ":" .. string.format("%02d", math.floor((bayback_cd - GameRules.GetGameStartTime()) % 60)), 1)
				end

				if ultimate_cd and (ultimate_cd > 0 or not have_mana_ultimate) then
					if not have_mana_ultimate and ultimate_cd == 0 then
						Renderer.SetDrawColor(100, 100, 255, alpha)
						Renderer.DrawTextCentered(HpMpBar.Font, center_x_r, center_y_r, Mp - Ability.GetManaCost(tmp_ability), 1)
					else
						Renderer.SetDrawColor(255, 255, 255, alpha)
						Renderer.DrawTextCentered(HpMpBar.Font, center_x_r, center_y_r, math.floor(ultimate_cd_time / 60) .. ":" .. string.format("%02d", math.floor(ultimate_cd_time % 60)), 1)
					end
				end

				if tp_cooldown then
					local str = ""
					if tp_cooldown == 0 and HpMpBar.ItemState(Unit, "item_tpscroll") == 1 then
						str = str .. "bkpk"
					elseif tp_cooldown > 0 then
						str = str .. math.floor(tp_cooldown / 60) .. ":" .. string.format("%02d", math.floor(tp_cooldown % 60))
					end
					if NPC.HasItem(Unit, "item_tpscroll", true) then
						str = str .. "tp"
					end
					Renderer.SetDrawColor(0, 255, 255, alpha)
					Renderer.DrawTextCentered(HpMpBar.Font, center_x_r, center_y_r + 20, str, 1)
				end
			else
				if ultimate_cd and ultimate_cd <= 0 then
					if not have_mana_ultimate then
						Renderer.SetDrawColor(100, 100, 255, alpha)
					else
						Renderer.SetDrawColor(255, 255, 255, alpha)
					end
					if GUI.IsEnabled(HpMpBar.Identity .. "ultpanel") then
						Renderer.DrawImage(ult_icon_h, x_center - 10, y + math.floor(bary * 2.2), 16, 16)
					end
				end
				if GUI.IsEnabled(HpMpBar.Identity .. "showdangitems") then
					Renderer.SetDrawColor(255, 255, 255, alpha)
					if NPC.HasItem(Unit, "item_gem", 1) then
						Renderer.DrawImage(gem_icon_h, x + math.floor((HpMpBar.GetSize() - 4) / 3) * 2, y + math.floor(bary * 2.2), math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
					if NPC.HasItem(Unit, "item_ward_observer", 1) or NPC.HasItem(Unit, "item_ward_observer", 0) or NPC.HasItem(Unit, "item_ward_dispenser", 1) or NPC.HasItem(Unit, "item_ward_dispenser", 0) then
						Renderer.DrawImage(obs_icon_h, x, y + math.floor(bary * 2.2), math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
					if NPC.HasItem(Unit, "item_ward_sentry", 1) or NPC.HasItem(Unit, "item_ward_sentry", 0) or NPC.HasItem(Unit, "item_ward_dispenser", 1) or NPC.HasItem(Unit, "item_ward_dispenser", 0) then
						Renderer.DrawImage(sen_icon_h, x, y + math.floor(bary * 2.2) + 20, math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
					if NPC.HasItem(Unit, "item_smoke_of_deceit", 1) or NPC.HasItem(Unit, "item_smoke_of_deceit", 0) then
						Renderer.DrawImage(smk_icon_h, x + math.floor((HpMpBar.GetSize() - 4) / 3) * 2, y + math.floor(bary * 2.2) + 20, math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
					if NPC.HasItem(Unit, "item_aegis", 1) then
						Renderer.DrawImage(aeg_icon_h, x + math.floor((HpMpBar.GetSize() - 4) / 3), y + math.floor(bary * 2.2) + 20, math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
					if NPC.HasItem(Unit, "item_dust", 1) then
						Renderer.DrawImage(dst_icon_h, x, y + math.floor(bary * 2.2) + 40, math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
					if NPC.HasItem(Unit, "item_aeon_disk", 1) then
						Renderer.DrawImage(aen_icon_h, x + math.floor((HpMpBar.GetSize() - 4) / 3), y + math.floor(bary * 2.2) + 40, math.floor((HpMpBar.GetSize() - 4) / 3), 20)
					end
				end
			end
		end
	end
end

function HpMpBar.OnChatEvent(chatEvent)
	if chatEvent.type == 7 then
		local _, PlayerID = next(chatEvent.players)
		HpMpBar.LastBayBack[PlayerID] = GameRules.GetGameTime()
	end
end

function HpMpBar.OnParticleCreate(particle)
	if particle.name and particle.name == "teleport_end" and particle.entityForModifiers and Hero.GetPlayerID(particle.entityForModifiers) then
		HpMpBar.TpTime[Hero.GetPlayerID(particle.entityForModifiers)] = GameRules.GetGameTime()
	end
end

return HpMpBar