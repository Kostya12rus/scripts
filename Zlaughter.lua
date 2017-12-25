local laughter = {}
laughter.optionEnable = Menu.AddOption({"Kostya12rus","Laughter"}, "Activate", "")

function laughter.OnUpdate()
  if not Menu.IsEnabled(laughter.optionEnable) then return end
  local myHero = Heroes.GetLocal()
  if not myHero then return end  
  
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