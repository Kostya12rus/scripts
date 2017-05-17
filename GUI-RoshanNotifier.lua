local Roshan = {}
Roshan.Identity = "roshannotifier"
Roshan.Font = Renderer.LoadFont("Arial", 15, Enum.FontWeight.BOLD)
Roshan.NotifierText = ""
Roshan.AegisTime = 0
Roshan.NextTime = 0
Roshan.Locale = {
	["name"] = {
		["english"] = "Roshan Notifier",
		["russian"] = "Рошан"
	},
	["desc"] = {
		["english"] = "Sends a message to the chat when Roshan dead. Display Roshan death timer.",
		["russian"] = "Отправляет сообщение в чат в момент когда рошан умер. Показывает таймер на рошана."
	},
	["aegis"] = {
		["english"] = "Notifier : Aegis",
		["russian"] = "Время аегиса"
	},
	["chat"] = {
		["english"] = "Chat Notifier",
		["russian"] = "Отправлять сообщение в чат"
	},
	["chat_message"] = {
		["english"] = "Message",
		["russian"] = "Сообщение"
	}
}

function Roshan.OnChatEvent(chatEvent)
	if GUI == nil then return end
	if not Engine.IsInGame then return end
	if chatEvent.type ~= 9 then return end
	if chatEvent.value ~= 150 then return end
	if GUI.IsEnabled(Roshan.Identity .. "chat") then
		Engine.ExecuteCommand(GUI.Get(Roshan.Identity .. "chatmsg"))
	end
	local time = ( GameRules.GetGameTime() - GameRules.GetGameStartTime() )
	Roshan.AegisTime = time + 300
	Roshan.NotifierText = math.floor(time / 60) .. ":" .. math.floor(time % 60)
end

function Roshan.OnDraw()
	if GUI == nil then return end
	
	if not GUI.Exist(Roshan.Identity) then
		GUI.Initialize(Roshan.Identity, GUI.Category.General, Roshan.Locale["name"], Roshan.Locale["desc"], "paroxysm")
		GUI.AddMenuItem(Roshan.Identity, Roshan.Identity .. "notifyaegis", Roshan.Locale["aegis"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Roshan.Identity, Roshan.Identity .. "chat", Roshan.Locale["chat"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Roshan.Identity, Roshan.Identity .. "chatmsg", Roshan.Locale["chat_message"], GUI.MenuType.TextBox, "chatwheel_say 57")
	end

	if Heroes.GetLocal() == nil then 
		Roshan.NotifierText = ""
		Roshan.AegisTime = 0
	return end
	if not GUI.IsEnabled(Roshan.Identity) then return end
	if Roshan.NotifierText == "" then return end

	local w, h = Renderer.GetScreenSize()
	local c = math.floor(w / 2)
	local size = 60
	local drawText = Roshan.NotifierText

	if	GUI.IsEnabled(Roshan.Identity .. "notifyaegis")
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
	Renderer.DrawTextCentered(Roshan.Font, c, math.floor(h * 0.04) + 11, drawText, 1)
	Renderer.SetDrawColor(255, 0, 0, 150)
	Renderer.DrawFilledRect(c - ((size / 2) - 2), math.floor(h * 0.04) + 22, size - 4, 2)
end

return Roshan
