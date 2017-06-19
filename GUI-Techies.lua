local TechiesEX = {}
TechiesEX.Identity = "tech_auto_steal"
TechiesEX.Locale = {
	["name"] = {
		["english"] = "Techies Extended"
	},
	["desc"] = {
		["english"] = "Techies Helper"
	},
	["info_box"] = {
		["english"] = "Show hints under heroes avatars"
	},
	["hero_box"] = {
		["english"] = "Show hints under heroes models"
	},
	["plant_hint"] = {
		["english"] = "Show hints about plant"
	}
}
TechiesEX.RemoteMines = { [0] = 0, [1] = 300, [2] = 450, [3] = 600 }
TechiesEX.CurrentDamage = 0
TechiesEX.Hero = nil
TechiesEX.Enabled = false
TechiesEX.MP = 0
TechiesEX.Mines = { }
TechiesEX.Monitor = {
	["10"] = { ["first"] = 26.7, ["next"] = "56.2", ["step"] = 3.7  },
	["9"] = { ["first"] = 29.4, ["next"] = "55.8", ["step"] = 3.2  },
	["3"] = { ["first"] = 22, ["next"] = "57.5", ["step"] = 4.3  }
}

function TechiesEX.OnDraw()
	Renderer.SetDrawColor(255, 0, 0, 255)

	if GUI == nil then return end
	if not GUI.Exist(TechiesEX.Identity) then
		GUI.Initialize(TechiesEX.Identity, GUI.Category.Heroes, TechiesEX.Locale["name"], TechiesEX.Locale["desc"], "paroxysm", "npc_dota_hero_techies")
		GUI.AddMenuItem(TechiesEX.Identity, TechiesEX.Identity .. "info_box", TechiesEX.Locale["info_box"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(TechiesEX.Identity, TechiesEX.Identity .. "hero_box", TechiesEX.Locale["hero_box"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(TechiesEX.Identity, TechiesEX.Identity .. "plant_hint", TechiesEX.Locale["plant_hint"], GUI.MenuType.CheckBox, 0)

	end
	
	TechiesEX.Initialize()
	if TechiesEX.Enabled then
		TechiesEX.MinesCatcher()
		TechiesEX.MinesChecker()
		
		-- Draw
		TechiesEX.DrawEnemyInfo()
		if GUI.IsEnabled(TechiesEX.Identity .. "plant_hint") then TechiesEX.DrawData() end
	end
end

function TechiesEX.Initialize()
	TechiesEX.Enabled = false
	if not GUI.IsEnabled(TechiesEX.Identity) then return end
	TechiesEX.Hero = Heroes.GetLocal()
	if TechiesEX.Hero == nil then return end
	if NPC.GetUnitName(TechiesEX.Hero) ~= "npc_dota_hero_techies" then return end
	TechiesEX.CurrentDamage = TechiesEX.RemoteMines[Ability.GetLevel(NPC.GetAbilityByIndex(TechiesEX.Hero, 5))]
	if NPC.GetItem(TechiesEX.Hero, "item_ultimate_scepter", true) then TechiesEX.CurrentDamage = TechiesEX.CurrentDamage + 150 end
	if TechiesEX.CurrentDamage == 0 then return end
	TechiesEX.Enabled = true
end

function TechiesEX.MinesCatcher()
	for k, v in pairs(NPCs.GetAll()) do
		if NPC.GetUnitName(v) == "npc_dota_techies_remote_mine" then
			if not hasValue(TechiesEX.Mines, v) and Entity.IsAlive(v) then
				table.insert(TechiesEX.Mines, v)
			end
		end
	end
end

function TechiesEX.MinesChecker()	
	for k, v in pairs(TechiesEX.Mines) do
		if not Entity.IsAlive(v) then
			TechiesEX.Mines = removeValue(TechiesEX.Mines, v)
		end
	end
end

function TechiesEX.DrawEnemyInfo()
	if GUI.IsEnabled(TechiesEX.Identity .. "info_box") then
		local w, h = Renderer.GetScreenSize()
		local r =  w / h
		local m = "3"
		if r == 16 / 10 then
			m = "10"	
		elseif r == 16 / 9 then
			m = "9"
		end
		local p = ( w / 100 )

		
		for k, v in pairs(Heroes.GetAll()) do
			if not Entity.IsSameTeam(TechiesEX.Hero, v) then
				local dw = TechiesEX.Monitor[m]["first"] + ((5 - Hero.GetPlayerID(v) - 1) * TechiesEX.Monitor[m]["step"] )
				if Hero.GetPlayerID(v) > 4 then dw = TechiesEX.Monitor[m]["next"] + ( (Hero.GetPlayerID(v) - 5) * TechiesEX.Monitor[m]["step"] ) end

				Renderer.SetDrawColor(255, 30, 0, 255)
				local current = math.ceil(Entity.GetHealth(v) / (TechiesEX.CurrentDamage * NPC.GetMagicalArmorDamageMultiplier(v)))
				local max = math.ceil(Entity.GetMaxHealth(v) / (TechiesEX.CurrentDamage * NPC.GetMagicalArmorDamageMultiplier(v)))
				local pos = math.floor( p * dw )

				if NPC.IsVisible(v) then
					Renderer.SetDrawColor(255, 255, 255, 255)
				else
					Renderer.SetDrawColor(255, 0, 0, 100)
				end
				
				Renderer.DrawFilledRect(pos - 1, math.floor(h * 0.05) - 10, 46, 22)
				Renderer.SetDrawColor(0, 0, 0, 255)
				Renderer.DrawFilledRect(pos, math.floor(h * 0.05) - 9, 44, 20)
				
				
				if current == 0 then current = max end
				Renderer.SetDrawColor(hex2rgb("#5eec2c"))
				Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, pos + 10, math.floor(h * 0.05), current, false)
				Renderer.SetDrawColor(255,255,255,200)
				Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, pos + 21, math.floor(h * 0.05), " / ", false)
			
				Renderer.SetDrawColor(hex2rgb("#ec2c2c"))
				Renderer.DrawTextCentered(GUI.Font.ContentSmallBold, pos + 33, math.floor(h * 0.05), max, false)
			end
		end
	end
	if GUI.IsEnabled(TechiesEX.Identity .. "hero_box") then
		Renderer.SetDrawColor(hex2rgb("#ec2c2c"))
		for k, v in pairs(Heroes.GetAll()) do
			if not Entity.IsSameTeam(TechiesEX.Hero, v) and Entity.IsAlive(v) and not Entity.IsDormant(v) then
				local pos = NPC.GetAbsOrigin(v)
				local x, y, visible = Renderer.WorldToScreen(pos)

				if visible then
					Renderer.DrawTextCentered(GUI.Font.Header, x, y + 35,math.ceil(Entity.GetHealth(v) / (TechiesEX.CurrentDamage * NPC.GetMagicalArmorDamageMultiplier(v))) .. " / " .. math.ceil(Entity.GetMaxHealth(v) / (TechiesEX.CurrentDamage * NPC.GetMagicalArmorDamageMultiplier(v))), 1)
				end
			end
		end
	end
	
	
end

function TechiesEX.DrawData()
	Renderer.SetDrawColor(0, 255, 0, 255)

	local posrm = {}
	for _, v in pairs(TechiesEX.Mines) do 
		local notin = false
		for _, j in pairs(posrm) do
			if NPC.IsPositionInRange(v, j, 250, 0) then
				notin = true
			end
		end
		
		if not notin then
			table.insert(posrm, Entity.GetOrigin(v))
		end
	end
	
	for _, v in pairs(posrm) do
		local count = 0
		for i, j in pairs(NPCs.InRadius(v, 250, Entity.GetTeamNum(TechiesEX.Hero), Enum.TeamType.TEAM_FRIEND)) do
			if NPC.GetUnitName(j) == "npc_dota_techies_remote_mine" then
				count = count + 1
			end
		end
		if count > 0 then
			local pos = NPC.GetAbsOrigin(v)
			local x, y, visible = Renderer.WorldToScreen(v)
			
			Renderer.SetDrawColor(29, 32, 39, 200)
			Renderer.DrawFilledRect(x - 100, y - 170, 200, 100)
			
			Renderer.SetDrawColor(0, 255, 0, 200)
			Renderer.DrawOutlineRect(x - 100, y - 170, 200, 100)
			
			Renderer.SetDrawColor(255, 255, 255, 255)
			Renderer.DrawTextCenteredY(GUI.Font.ContentSmallBold, x - 90, y - 155, "Count: ", 1)
			local color = 120 - (count * 10)
			if color < 1 then color = 0 end
			
			Renderer.SetDrawColor(255, color, 0, 255)
			Renderer.DrawTextCenteredY(GUI.Font.ContentBold, x + (90 - (string.len(count) * 7)), y - 155, count, 1)

			Renderer.SetDrawColor(0, 255, 0, 25)
			Renderer.DrawFilledRect(x - 95, y - 140, 190, 1)

			Renderer.SetDrawColor(255, 255, 255, 255)
			Renderer.DrawTextCenteredY(GUI.Font.ContentSmallBold, x - 90, y - 125, "Damage: ", 1)
			Renderer.SetDrawColor(255, color, 0, 255)
			Renderer.DrawTextCenteredY(GUI.Font.ContentBold, x + (90 - (string.len((TechiesEX.CurrentDamage * count)) * 7)), y - 125, (TechiesEX.CurrentDamage * count), 1)
		end
	end
	Renderer.SetDrawColor(255, 255, 255, 255)
	
end

return TechiesEX