local laughter = {}
laughter.optionEnable = Menu.AddOption({"Kostya12rus","Laughter"}, "Activate", "")

NeedTime = 0
function laughter.OnUpdate()
    if not Menu.IsEnabled(laughter.optionEnable) then return end
    if not Heroes.GetLocal() then return end  
	if NeedTime <= GameRules.GetGameTime() then
		Engine.ExecuteCommand("say /laugh")
		NeedTime = GameRules.GetGameTime() + 15
	end
end
function laughter.OnGameStart()
	NeedTime = 0
end
function laughter.OnGameEnd()
	NeedTime = 0
end
return laughter