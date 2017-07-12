local rofl = {}
rofl.optionEnable = Menu.AddOption({"Utility","RoflActivate"}, "Rofl", "")
rofl.optionKey = Menu.AddKeyOption({"Utility","RoflActivate"}, "Thanks",Enum.ButtonCode.KEY_L)
function rofl.OnDraw()
    local myHero = Heroes.GetLocal()
	local GameTime = GameRules.GetGameTime()
	local PreGameTime = GameRules.GetGameStartTime()
	local RealTime = GameTime-PreGameTime
	local Minute = math.floor(RealTime/60)
	local Second = math.floor(RealTime-(Minute*60))
	local radius = 16
	local start = false
	local stop = true
	local timespam = 0
	local starttime = 0
	if not myHero or not Menu.IsEnabled(rofl.optionEnable) then return end
	if GameRules.GetGameState() == 4 then return end
	if Minute >= 0 and Second >= 0 and GameRules.GetGameState() == 5 then
		if GameRules.GetGameState() == 5 and stop then 
			stop = false 
			start = true
			starttime = RealTime
			Engine.ExecuteCommand("say /laugh")
		end
		if start and not stop then
			timespam = RealTime - starttime
			if (timespam == radius) then
				Engine.ExecuteCommand("say /laugh")
				starttime = RealTime
			end
			if Menu.IsKeyDown(rofl.optionKey) then 
				Engine.ExecuteCommand("say /thanks")
			end
		end
		
	end
end
return rofl