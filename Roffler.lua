local rofl = {}
rofl.optionEnable = Menu.AddOption({"Utility","RoflActivate"}, "Rofl", "")
rofl.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
function rofl.OnDraw()
    local myHero = Heroes.GetLocal()
	local GameTime = GameRules.GetGameTime()
	local PreGameTime = GameRules.GetGameStartTime()
	local RealTime = GameTime-PreGameTime
	local Minute = math.floor(RealTime/60)
	local Second = math.floor(RealTime-(Minute*60))
	local rtime = {0, 15, 30, 45}
	if not myHero or not Menu.IsEnabled(rofl.optionEnable) then return end
	
	if GameRules.GetGameState() == 5 or GameRules.GetGameState() == 4 then
		Renderer.DrawText(rofl.font, 500, 50,"Включен", 1)
		for i = 0, #rtime, 1 do
			if Second == rtime[i] then
				Engine.ExecuteCommand("say /laugh")
			end
		end
	else 
		return
	end
end
return rofl