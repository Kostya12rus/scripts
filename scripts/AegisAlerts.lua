local AegisAlerts = {}

AegisAlerts.option = Menu.AddOption({ "Awareness" }, "Aegis Alerts", "It shows when the enemy has Aegis of the Immortal. Script by Rednelss")
AegisAlerts.font = Renderer.LoadFont("Tahoma", 18, Enum.FontWeight.EXTRABOLD)

function AegisAlerts.OnDraw()
	if not Menu.IsEnabled(AegisAlerts.option) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local myTeam = Entity.GetTeamNum(myHero)
	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		local sameTeam = Entity.GetTeamNum(hero) == myTeam
		if not sameTeam and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) and not NPC.IsRoshan(hero) and NPC.HasAegis(hero) and Entity.GetHealth(hero) > 0 then
			local pos = Entity.GetAbsOrigin(hero)
			local x, y, visible = Renderer.WorldToScreen(pos)
			if visible then
				Renderer.SetDrawColor(255, 0, 0, 255)
				Renderer.DrawTextCentered(AegisAlerts.font, x, y, "Aegis!!!", 1)
			end
		end
	end
end

return AegisAlerts
