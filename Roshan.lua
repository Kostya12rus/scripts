local Roshan = {}

Roshan.Chat = Menu.AddOption({ "Utility", "Roshan Notifier" }, "Chat", "")
Roshan.Notifier = Menu.AddOption({ "Utility", "Roshan Notifier" }, "Notifier", "")
Roshan.Aegis = Menu.AddOption({ "Utility", "Roshan Notifier" }, "Notifier : Aegis", "")
Roshan.Font = Renderer.LoadFont("Arial", 15, Enum.FontWeight.BOLD)
Roshan.NotifierText = ""
Roshan.AegisTime = 0
Roshan.NextTime = 0

function Roshan.OnChatEvent(chatEvent)
	if not Engine.IsInGame then return end
	if chatEvent.type ~= 9 then return end
	if chatEvent.value ~= 200 then return end

	if Menu.IsEnabled(Roshan.Chat) then
		Engine.ExecuteCommand("chatwheel_say 57")
	end
	
	local time = ( GameRules.GetGameTime() - GameRules.GetGameStartTime() )
	Roshan.AegisTime = time + 300
	Roshan.NotifierText = math.floor(time / 60) .. ":" .. math.floor(time % 60)
end

function Roshan.OnDraw()
	if Heroes.GetLocal() == nil then 
		Roshan.NotifierText = ""
		Roshan.AegisTime = 0
	return end
	
	if not Menu.IsEnabled(Roshan.Notifier) then return end
	if Roshan.NotifierText == "" then return end
	local w, h = Renderer.GetScreenSize()
	local c = math.floor(w / 2)
	local size = 60
	local drawText = Roshan.NotifierText
	
	if	Menu.IsEnabled(Roshan.Aegis)
		and Roshan.AegisTime ~= 0
	then 
		local time = ( GameRules.GetGameTime() - GameRules.GetGameStartTime() )
		local dif = Roshan.AegisTime - time
		if dif <= 0 then Roshan.AegisTime = 0 return end
		size = 80
		local sec = math.floor(dif % 60)
		if sec < 10 then sec = "0" .. sec end
		drawText = drawText .. " [" .. math.floor(dif / 60) .. ":" .. sec .. "]" 
	end
	
	Renderer.SetDrawColor(29, 32, 39, 100)
	Renderer.DrawFilledRect(c - (size / 2), math.floor(h * 0.04), size, 24)
	
	Renderer.SetDrawColor(0, 0, 0, 200)
	Renderer.DrawFilledRect(c - ((size / 2) - 2), math.floor(h * 0.04) + 2, size - 4, 20)
	

	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawTextCentered(Roshan.Font, c, math.floor(h * 0.04) + 12, drawText, 1)
end

return Roshan
