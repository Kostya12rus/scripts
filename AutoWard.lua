local AutoWard = {}
AutoWard.optionEnable = Menu.AddOption({"Kostya12rus","AutoWard"}, "AutoWard", "")
AutoWard.Key = Menu.AddKeyOption({"Kostya12rus","AutoWard"}, "Key", Enum.ButtonCode.BUTTON_CODE_NONE)
function AutoWard.OnUpdate()
	if not Menu.IsEnabled(AutoWard.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local ward = NPC.GetItem(myHero, "item_ward_dispenser", true)
	
	if Menu.IsKeyDown(AutoWard.Key) then
		if not uranpc then
			uranpc = Entity.GetHeroesInRadius(myHero,200,Enum.TeamType.TEAM_FRIEND)
		end
		if uranpc then
			if ward and Ability.IsReady(ward) then
				Ability.CastTarget(ward,uranpc[1])
			end
		end
	end
end
function AutoWard.init()
	uranpc = nil
end

function AutoWard.OnGameStart()
	AutoWard.init()
end

function AutoWard.OnGameEnd()
	AutoWard.init()
end
AutoWard.init()

return AutoWard