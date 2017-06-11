local TechiesHUD = {}

TechiesHUD.optionTotal = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD" }, "TechiesHUD", "Activating the script")

TechiesHUD.optionDetonate = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Auto mines", "Auto detonate remote mines")

TechiesHUD.optionLegitDetonate = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Auto mines mode", "Standart(needful) or legit(all)")

Menu.SetValueName(TechiesHUD.optionLegitDetonate, 1, "legit")
Menu.SetValueName(TechiesHUD.optionLegitDetonate, 0, "standart")

TechiesHUD.optionFDFailSwitch = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Focused Detonate FailSwitch", "Focused Detonate Will not detonate mines if they do not cause damage. For forced detonate, use Alt + Focused Detonate")
TechiesHUD.optionFDFailSwitchMode = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Focused Detonate mode", "Standart(needful) or legit(all)")

Menu.SetValueName(TechiesHUD.optionFDFailSwitchMode, 1, "legit")
Menu.SetValueName(TechiesHUD.optionFDFailSwitchMode, 0, "standart")

TechiesHUD.optionDelay = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Delay detonate ms", "Waiting some time before detonate in ms", 0, 3000, 50)

TechiesHUD.optionDetonateWk = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Wraith King kill with ult", "Kill Wraith King with ultimate")
TechiesHUD.optionDetonateAegis = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Kill aegis", "Kill hero with aegis")

TechiesHUD.optionStack = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Stack mines", "Automatically puts mines as close as possible to each other")
TechiesHUD.optionStackRange = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Range Stack mines", "The radius at which nearby mines will be placed on the nearest mine", 0, 500, 10)

TechiesHUD.optionForce = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Auto force stuff", "Automatically use force stuff")
TechiesHUD.optionForceDelay = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Action" }, "Auto force delay", "Waiting some time before force stuff in ms. Recomend 500", 0, 6000, 50)
TechiesHUD.optionForceDrawLine = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Force Stuff line", "Draw enemy position after force stuff")

TechiesHUD.optionLR = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Land mines range", "Draw the radius of land mines")
TechiesHUD.optionSR = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Stasis mines range", "Draw the radius of stasis mines")
TechiesHUD.optionRR = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Remote mines range", "Remote the radius of land mines")

TechiesHUD.optionCircleResolution = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Circle resolution", "The larger the number, the less detailed the radius. Standart 20", 1, 180)

TechiesHUD.optionPanelInfo = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Panel", "Panel showing the number of mines for killing")

TechiesHUD.optionPanelInfoXLInvert = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "x left offset invert", "x offset invert", 0, 1, 1)
TechiesHUD.optionPanelInfoXL = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "x left", "horizontal offset", 0, 400, 1)

TechiesHUD.optionPanelInfoXRInvert = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "x right offset invert", "x offset invert", 0, 1, 1)
TechiesHUD.optionPanelInfoXR = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "x right", "horizontal offset", 0, 400, 1)

TechiesHUD.optionPanelInfoYInvert = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "y offset invert", "y offset invert", 0, 1, 1)
TechiesHUD.optionPanelInfoY = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "y offset", "vertical offset", 0, 400, 1)

TechiesHUD.optionPanelInfoColumn = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "Draw column", "Draws the number of mines for the current xn and for the whole number of columns")

TechiesHUD.optionPanelInfoYColumnInvert = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "y column offset invert", "y offset when draw column", 0, 1, 1)
TechiesHUD.optionPanelInfoYColumn = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "y column offset", "y offset when draw column", 0, 400, 1)

TechiesHUD.optionPanelInfoDistLeftInvert = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "Distance left invert", "Distance left invert", 0, 1, 1)
TechiesHUD.optionPanelInfoDistLeft = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "Distance left", "Distance left invert", 0, 1000, 1)

TechiesHUD.optionPanelInfoDistRightInvert = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "Distance right invert", "Distance right invert", 0, 1, 1)
TechiesHUD.optionPanelInfoDistRight = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display", "Panel calibration" }, "Distance right", "Distance between blocks dire", 0, 1000, 1)

TechiesHUD.optionBlastInfo = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Blast info", "Displays the damage needed to kill")

TechiesHUD.optionFont = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Font1", "Num mines, need blast damage, timers and etc", 10, 100, 1)

TechiesHUD.optionFontTopBar = Menu.AddOption({ "Hero Specific", "Techies", "TechiesHUD", "Display" }, "Font2 top bar", "Top bar", 10, 100, 1)

TechiesHUD.font = Renderer.LoadFont("Tahoma", Config.ReadInt("TechiesHUD", "font", 10), Enum.FontWeight.EXTRABOLD)

TechiesHUD.HUDfont = Renderer.LoadFont("Tahoma",  Config.ReadInt("TechiesHUD", "Bar_font", 15), Enum.FontWeight.BOLD)

local size_x, size_y = Renderer.GetScreenSize()
local mines_time = {}
local mines_damage = {}
local hero_time = {}
local hero_rotate_time = {}
local check_detonate = {}
local forc_time = 0
local forced_time = 0
local force_direction = {}
local cast_pos = {}
local remote_pos_draw = {}
local mines_num = {}
local check_detonate = 0

function TechiesHUD.OnGameStart()
	size_x, size_y = Renderer.GetScreenSize()
	mines_time = {}
	mines_damage = {}
	hero_time = {}
	hero_rotate_time = {}
	check_detonate = {}
	forc_time = 0
	forced_time = 0
	force_direction = {}
	cast_pos = {}
	remote_pos_draw = {}
	mines_num = {}
	check_detonate = 0
end

function TechiesHUD.OnEntityDestroy(ent)
	if NPC.GetUnitName(ent) == "npc_dota_techies_remote_mine" then
		mines_damage[Entity.GetIndex(ent)] = nil
	end
end

function TechiesHUD.OnMenuOptionChange(option, oldValue, newValue)
	if option == TechiesHUD.optionFont then
		TechiesHUD.font = Renderer.LoadFont("Tahoma", newValue, Enum.FontWeight.EXTRABOLD)
		Config.WriteInt("TechiesHUD", "font", newValue)
	end
	if option == TechiesHUD.optionFontTopBar then
		TechiesHUD.HUDfont = Renderer.LoadFont("Tahoma", newValue, Enum.FontWeight.EXTRABOLD)
		Config.WriteInt("TechiesHUD", "Bar_font", newValue)
	end
	if option == TechiesHUD.optionCircleResolution then
		Config.WriteInt("TechiesHUD", "Circle res", newValue)
	end
	if option == TechiesHUD.optionForceDelay then
		Config.WriteInt("TechiesHUD", "Force Stuff delay", newValue)
	end
end

function DrawCircle(UnitPos, radius)
	local x1, y1 = Renderer.WorldToScreen(UnitPos)
	if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
		local x4, y4, x3, y3, visible3
		local dergee = Config.ReadInt("TechiesHUD", "Circle res", 20)
		for angle = 0, 360 / dergee do
			x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
			y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
			x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
			Renderer.DrawLine(x1,y1,x3,y3)
			x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
		end
	end
end

function TechiesHUD.OnDraw()
	if not Menu.IsEnabled(TechiesHUD.optionTotal) then return end

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
	
	remote_pos_draw = {}
	mines_num = {}
	for i = 0, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)

		if Menu.IsEnabled(TechiesHUD.optionLR) and NPC.GetModifier(Unit, "modifier_techies_land_mine") ~= nil then -- land mines range
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
							Renderer.DrawText(TechiesHUD.font, x, y, math.floor((1.60 - (GameRules.GetGameTime() - mines_time[Entity.GetIndex(Unit)])) * 100) / 100, 0)
						end
					end
				end
				if check_loop == 0 then
					mines_time[Entity.GetIndex(Unit)] = 0
				end
			end
		end -- land mines range

		if Menu.IsEnabled(TechiesHUD.optionSR) and NPC.GetUnitName(Unit) == "npc_dota_techies_stasis_trap" and Entity.IsAlive(Unit)then -- stasis range

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

			if Menu.IsEnabled(TechiesHUD.optionRR) then
				if remote_pos_draw[UnitPos:GetX()] == nil then
					remote_pos_draw[UnitPos:GetX()] = {}
					remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] = 0
				end
				if remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] ~= 1 then
					remote_pos_draw[UnitPos:GetX()][UnitPos:GetY()] = 1
					Renderer.SetDrawColor(0, 255, 0, 255)
					DrawCircle(UnitPos, 425)
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
								if NPC.IsPositionInRange(Unit2, UnitPos, 425, Enum.TeamType.TEAM_FRIEND)
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
				if Menu.IsEnabled(TechiesHUD.optionBlastInfo) and Ability.GetLevel(blast) ~= 0 then -- blast damage display
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
				if Menu.IsEnabled(TechiesHUD.optionDetonate) and hero_time[i] ~= nil and GameRules.GetGameTime() - hero_time[i] < Menu.GetValue(TechiesHUD.optionDelay) / 1000 + 0.3 then -- remote delay draw
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(TechiesHUD.font, x, y - 15, math.floor(((Menu.GetValue(TechiesHUD.optionDelay) / 1000) + 0.3 - (GameRules.GetGameTime() - hero_time[i])) * 100) / 100, 0)
					end
				end -- remote delay draw

				if Menu.IsEnabled(TechiesHUD.optionForce) and force ~= nil then -- force stuff line
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible and Menu.GetValue(TechiesHUD.optionForceDrawLine) == 1 then
						Renderer.SetDrawColor(255, 255, 255, 255)
						local rotate = Entity.GetAbsRotation(Unit):GetYaw()
						local x4 = 600 * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
						local y4 = 0 * math.cos(rotate / 57.3) + 600 * math.sin(rotate / 57.3)
						local x3,y3,visible3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
						Renderer.DrawLine(x, y, x3, y3)
					end
				end -- force stuff line
			end

			if Menu.IsEnabled(TechiesHUD.optionPanelInfo) and Ability.GetLevel(remote) ~= 0 then -- remote num display
				local Hp = Entity.GetHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit))
				local Hp_all = Entity.GetMaxHealth(Unit) / ((remote_damage + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit))

				Renderer.SetDrawColor(0, 255, 0, 255)
				if Menu.GetValue(TechiesHUD.optionPanelInfoColumn) == 1 then
					if Entity.GetTeamNum(myHero) == 2 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + Menu.GetValue(TechiesHUD.optionPanelInfoDistRight) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoDistRightInvert)) * (Hero.GetPlayerID(Unit) - 4) + Menu.GetValue(TechiesHUD.optionPanelInfoXR) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoXRInvert), 32 + Menu.GetValue(TechiesHUD.optionPanelInfoY) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYInvert), (math.ceil(Hp * 10) / 10), 0)
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + Menu.GetValue(TechiesHUD.optionPanelInfoDistRight) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoDistRightInvert)) * (Hero.GetPlayerID(Unit) - 4) + Menu.GetValue(TechiesHUD.optionPanelInfoXR) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoXRInvert), 52 + Menu.GetValue(TechiesHUD.optionPanelInfoY) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYInvert) + Menu.GetValue(TechiesHUD.optionPanelInfoYColumn) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYColumnInvert), (math.ceil(Hp_all * 10) / 10), 0)
					end
					if Entity.GetTeamNum(myHero) == 3 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + Menu.GetValue(TechiesHUD.optionPanelInfoDistLeft) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoDistLeftInvert)) * Hero.GetPlayerID(Unit) + Menu.GetValue(TechiesHUD.optionPanelInfoXL) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoXLInvert), 32 + Menu.GetValue(TechiesHUD.optionPanelInfoY) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYInvert), (math.ceil(Hp * 10) / 10), 0)
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + Menu.GetValue(TechiesHUD.optionPanelInfoDistLeft) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoDistLeftInvert)) * Hero.GetPlayerID(Unit) + Menu.GetValue(TechiesHUD.optionPanelInfoXL) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoXLInvert), 52 + Menu.GetValue(TechiesHUD.optionPanelInfoY) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYInvert) + Menu.GetValue(TechiesHUD.optionPanelInfoYColumn) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYColumnInvert), (math.ceil(Hp_all * 10) / 10), 0)
					end
				else
					if Entity.GetTeamNum(myHero) == 2 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 + 30 + (53 + Menu.GetValue(TechiesHUD.optionPanelInfoDistRight) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoDistRightInvert)) * (Hero.GetPlayerID(Unit) - 4) + Menu.GetValue(TechiesHUD.optionPanelInfoXR) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoXRInvert), 32 + Menu.GetValue(TechiesHUD.optionPanelInfoY) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYInvert), (math.ceil(Hp * 10) / 10).. "|" .. (math.ceil(Hp_all * 10) / 10), 0)
					end
					if Entity.GetTeamNum(myHero) == 3 then
						Renderer.DrawText(TechiesHUD.HUDfont, size_x / 2 - 400 + (53 + Menu.GetValue(TechiesHUD.optionPanelInfoDistLeft) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoDistLeftInvert)) * Hero.GetPlayerID(Unit) + Menu.GetValue(TechiesHUD.optionPanelInfoXL) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoXLInvert), 32 + Menu.GetValue(TechiesHUD.optionPanelInfoY) * (-1) ^ Menu.GetValue(TechiesHUD.optionPanelInfoYInvert), (math.ceil(Hp * 10) / 10) .. "|" .. (math.ceil(Hp_all * 10) / 10), 0)
					end
				end
			end -- remote num display
		end
	end
end

function TechiesHUD.OnUpdate()
	if not Menu.IsEnabled(TechiesHUD.optionTotal) then return end
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

	for i = 0, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if Ability.GetLevel(remote) ~= 0 then -- remote auto detonate
			if  Entity.IsHero(Unit)
			and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
			and not NPC.IsIllusion(Unit)
			and not Entity.IsDormant(Unit)
			and (NPC.IsKillable(Unit) or (NPC.GetUnitName(Unit) == "npc_dota_hero_skeleton_king" and Menu.GetValue(TechiesHUD.optionDetonateWk) == 1) or (NPC.HasItem(Unit, "item_aegis", 1) and Menu.GetValue(TechiesHUD.optionDetonateAegis) == 1))
			and Entity.IsAlive(Unit)
			then
				if hero_time[i] == nil then
					hero_time[i] = 0
				end
				local remote_sum_damage = 0
				local force_remote_sum_damage = 0
				for j = 0, NPCs.Count() do -- calc sum damage
					local Unit2 = NPCs.Get(j)
					if NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil then
						if mines_damage[Entity.GetIndex(Unit2)] == nil then
							mines_damage[Entity.GetIndex(Unit2)] = remote_damage
						end
						if NPC.IsPositionInRange(Unit2, UnitPos, 425, 0) then -- - NPC.GetMoveSpeed(Unit) * 0.1
							remote_sum_damage = remote_sum_damage + mines_damage[Entity.GetIndex(Unit2)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						end

						local rotate = Entity.GetAbsRotation(Unit):GetYaw()
						local remote_sum_damage = 0
						local tmp_remote_sum_damage = 0
						local rotate = Entity.GetAbsRotation(Unit):GetYaw()
						local x4 = 600 * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
						local y4 = 0 * math.cos(rotate / 57.3) + 600 * math.sin(rotate / 57.3)
						if NPC.IsPositionInRange(Unit2, UnitPos + Vector(x4,y4,0), 425, 0) then
							force_remote_sum_damage = force_remote_sum_damage + mines_damage[Entity.GetIndex(Unit2)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)
						end
					end
				end -- calc sum damage

				if Menu.IsEnabled(TechiesHUD.optionDetonate) then -- auto detonate
					if Menu.IsEnabled(TechiesHUD.optionForce) then -- auto force stuff
						if force ~= nil then
							if hero_time[i] == 1 and forced_time ~= 0 and GameRules.GetGameTime() - forced_time > 1 then
								hero_time[i] = 0
								forced_time = 0
							end
							if NPC.IsPositionInRange(myHero, UnitPos, 1000, 0)
							and force_remote_sum_damage * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit) and GameRules.GetGameTime() - forc_time > 0.5 then
								if force_direction[i] == nil or force_direction[i] == 0 then
									force_direction[i] = GameRules.GetGameTime()
								elseif Ability.GetCooldownTimeLeft(force) == 0 and GameRules.GetGameTime() - force_direction[i] > Config.ReadInt("TechiesHUD", "Force Stuff delay", 500) / 1000 then
									Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, Unit, Vector(0, 0, 0), force, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, 0, 0)
									forc_time = GameRules.GetGameTime()
									hero_time[i] =  1
									forced_time = GameRules.GetGameTime()
									force_direction[i] = 0
								end
							else
								force_direction[i] = 0
							end
						end
					end -- auto force stuff

					if remote_sum_damage * NPC.GetMagicalArmorDamageMultiplier(Unit) > Entity.GetHealth(Unit) then
						if hero_time[i] == 0 then
							hero_time[i] = GameRules.GetGameTime()
						end
						local remote_need_damage = Entity.GetHealth(Unit) + NPC.GetHealthRegen(Unit) * 0.3
						if GameRules.GetGameTime() - check_detonate > 0.5 and (hero_time[i] ~= 0) and (GameRules.GetGameTime() - hero_time[i] > Menu.GetValue(TechiesHUD.optionDelay) / 1000) then
							for j = 0, NPCs.Count() do
								local Unit2 = NPCs.Get(j)
								if NPC.GetModifier(Unit2, "modifier_techies_remote_mine") ~= nil
								and NPC.IsPositionInRange(Unit2, UnitPos, 425, 0)
								then
									if remote_need_damage > 0 or Menu.GetValue(TechiesHUD.optionLegitDetonate) == 1 then
										Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(Unit2, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Unit2, 0, 0)
										check_detonate = GameRules.GetGameTime()
										remote_need_damage = remote_need_damage - (mines_damage[Entity.GetIndex(Unit2)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(Unit)
									end
								end
							end
						end
					else
						if hero_time[i] ~= 1 then
							hero_time[i] = 0
						end
					end
				end -- auto detonate
			end
		end
	end
end

function TechiesHUD.OnPrepareUnitOrders(orders)
    if not Menu.IsEnabled(TechiesHUD.optionTotal) then return true end
	if not Menu.IsEnabled(TechiesHUD.optionStack) then return true end

	if orders.order ~= Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION and orders.order ~= Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TOGGLE_AUTO then return true end
    if not orders.ability then return true end

	if Ability.GetName(orders.ability) == "techies_suicide" then
		cast_pos = orders.position
		return true
	end

	if Menu.GetValue(TechiesHUD.optionFDFailSwitch) == 1 and Ability.GetName(orders.ability) == "techies_focused_detonate" then
		if Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
			Player.PrepareUnitOrders(orders.player, Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, orders.target, Input.GetWorldCursorPos(), orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			return false
		end
		local hp = {}
		for i = 0, NPCs.Count() do
			local Unit = NPCs.Get(i)
			local UnitPos = Entity.GetAbsOrigin(Unit)
			if NPC.GetModifier(Unit, "modifier_techies_remote_mine") ~= nil
			and NPC.IsPositionInRange(Unit, orders.position, 700, 0)
			then
				local num_enemy = 0
				for j, v in pairs(NPC.GetHeroesInRadius(Unit, 425, Enum.TeamType.TEAM_ENEMY)) do
					if hp[Entity.GetIndex(v)] == nil then
						hp[Entity.GetIndex(v)] = Entity.GetHealth(v) + NPC.GetHealthRegen(v) * 0.3
					end
					if hp[Entity.GetIndex(v)] > 0 or Menu.GetValue(TechiesHUD.optionFDFailSwitchMode) == 1 then
						hp[Entity.GetIndex(v)] = hp[Entity.GetIndex(v)] - (mines_damage[Entity.GetIndex(Unit)] + 150 * (NPC.HasItem(myHero, "item_ultimate_scepter", 1) and 1 or 0)) * NPC.GetMagicalArmorDamageMultiplier(v)
						num_enemy = num_enemy + 1
					end
				end
				if num_enemy ~= 0 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, 0, Vector(0, 0, 0), NPC.GetAbilityByIndex(Unit, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Unit, 0, 0)
				end
			end
		end
		return false
	end

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
		and NPC.IsPositionInRange(Unit, orders.position, Menu.GetValue(TechiesHUD.optionStackRange), 0))
		then
			Player.PrepareUnitOrders(orders.player, orders.order, orders.target, UnitPos, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
			return false
		end
	end

    return true
end

return TechiesHUD