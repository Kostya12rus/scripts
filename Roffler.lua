local rofl = {}
rofl.optionEnable = Menu.AddOption({"Kostya12rus","Rofl"}, "RoflActivate", "")
rofl.EnableImg = Menu.AddOption({"Kostya12rus","Rofl"}, "DrawImg", "")
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
		if Menu.IsEnabled(rofl.EnableImg) then
			local w, h = Renderer.GetScreenSize()
			local x1 = 2560/500
			local y1 = 1080/0
			local x2 = w/x1
			local y2 = h/y1
			Renderer.DrawText(rofl.font, x2, y2,"Включен", 1)
		end
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