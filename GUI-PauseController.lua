local GPC = {}
GPC.Identity = 'gui_pause_controller'
GPC.Locale = {
	["name"] = {
		["english"] = "Pause Control",
		["russian"] = "Управление паузой",
		["chinese"] = "暫停控制"
	},
	["desc"] = {
		["english"] = "Auto unpause",
		["russian"] = "Отменяет паузу",
		["chinese"] = "自動取消暫停",
	},
	["auto_pause"] = {
		["english"] = "Auto pause when ally is disconnected",
		["russian"] = "Ставить паузу когда союзник выходит",
		["chinese"] = "超時開始"
	},
	["auto_unpause"] = {
		["english"] = "Force unpause if pause is set by enemies",
		["russian"] = "Отжимать паузу когда противник выходит",
		["chinese"] = "延遲"
	},
	["on"] = {
		["english"] = "On",
		["russian"] = "Вкл",
		["chinese"] = "打開"
	},
	["off"] = {
		["english"] = "Off",
		["russian"] = "Выкл",
		["chinese"] = "關機"
	}
}

GPC.CurrentTime		= 0
GPC.NextTime		= 0
GPC.PauseTimeStart	= 0

function GPC.OnDraw()
	if GUI == nil then return end
	
	if not GUI.Exist(GPC.Identity) then		
		local GUI_Object	= {}
		GUI_Object["perfect_name"]		= GPC.Locale['name']
		GUI_Object["perfect_desc"]		= GPC.Locale['desc']
		GUI_Object["perfect_author"]	= 'paroxysm'
		GUI_Object["category"]			= GUI.Category.General	
		GUI.Initialize(GPC.Identity, GUI_Object)
		
		-- GUI.AddMenuItem(GPC.Identity, GPC.Identity .. "auto_pause",		GPC.Locale['auto_pause'],	GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(GPC.Identity, GPC.Identity .. "auto_unpause",	GPC.Locale['auto_unpause'],	GUI.MenuType.CheckBox, 0)
	end
	
	if GUI.IsEnabled(GPC.Identity) and GUI.SelectedLanguage ~= nil then
		if GameRules.IsPaused() then
			if GPC.PauseTimeStart == 0 then GPC.PauseTimeStart = os.clock() end
		
			local w, h	= Renderer.GetScreenSize()
			local x		= math.floor(w / 2)
			local y		= math.floor(h * 0.334)
			
			Renderer.SetDrawColor(0, 0, 0, 180)
			if Input.IsCursorInRect(x - 70, y - 15, 140, 30) then
				Renderer.SetDrawColor(0, 0, 0, 220)
				if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then 
					if GUI.IsEnabled(GPC.Identity .. "gpcise") then
						GUI.Set(GPC.Identity .. "gpcise", 0)
					else
						GUI.Set(GPC.Identity .. "gpcise", 1)
					end
				end
			end
			Renderer.DrawFilledRect(x - 70, y - 15, 140, 30)
			
			local text	= GPC.Locale["off"][GUI.SelectedLanguage]
			if GUI.IsEnabled(GPC.Identity .. "gpcise") then
				Renderer.SetDrawColor(255, 255, 255, 255)
			else
				text	= GPC.Locale["on"][GUI.SelectedLanguage]
				Renderer.SetDrawColor(255, 255, 255, 100)
			end
			
			local calculate = math.floor(30 - (os.clock() - GPC.PauseTimeStart))
			if calculate < 0 then 
				calculate	= 0
				GPC.UnPause()
			end
			
			Renderer.DrawTextCentered(GUI.Font.Header, x, y, "GPC : " .. text .. " (" .. calculate .. ")", false)	
		else
			GPC.PauseTimeStart = 0
		end
	end
	
	if Engine.IsInGame() then
		GPC.CurrentTime	= GameRules.GetGameTime()
	end
end

-- function GPC.OnUpdate()
	-- if	GUI.IsEnabled(GPC.Identity) 
		-- and GUI.IsEnabled(GPC.Identity .. "auto_pause")
		-- and GPC.CurrentTime > GPC.NextTime
	-- then
		-- for k, v in pairs(Players.GetAll()) do
			-- if Entity.IsSameTeam(v, Players.GetLocal())
				-- and	not Player.GetPlayerData(v).fullyJoined 
				-- and not GameRules.IsPaused() 
			-- then
				-- Engine.ExecuteCommand("dota_pause")
				-- GPC.NextTime = GPC.CurrentTime + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 3
			-- end
		-- end
	-- end
-- end

function GPC.OnGameStart()
	GPC.CurrentTime		= 0
	GPC.NextTime		= 0
	GPC.PauseTimeStart	= 0
end

function GPC.UnPause()
	if	GUI.IsEnabled(GPC.Identity .. "gpcise")
		and GUI.IsEnabled(GPC.Identity .. "auto_unpause") 
		and GameRules.IsPaused() 
		and GPC.CurrentTime > GPC.NextTime 
	then
		local safe_to_unp	= true
		for k, v in pairs(Players.GetAll()) do
			if	Entity.IsSameTeam(v, Players.GetLocal())
				and not Player.GetPlayerData(v).fullyJoined
			then	
				safe_to_unp = false
			end
		end

		if safe_to_unp then 
			Engine.ExecuteCommand("dota_pause")
			GPC.NextTime	= GPC.CurrentTime + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1
		end
	end
end

return GPC