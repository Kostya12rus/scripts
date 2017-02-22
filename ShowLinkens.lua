local ShowLinkens =  {}

ShowLinkens.option = Menu.AddOption({ "Awareness" }, "Show Linkens", "Shows when an enemy is protected by Linkens Sphere")
ShowLinkens.font = Renderer.LoadFont("Tahoma", 18, Enum.FontWeight.EXTRABOLD)

function ShowLinkens.OnDraw()
    if not Menu.IsEnabled(ShowLinkens.option) then return end

    local myHero = Heroes.GetLocal()

    if not myHero then return end

    for i = 1, Heroes.Count() do
        local hero = Heroes.Get(i)

        if not Entity.IsSameTeam(myHero, hero) and not NPC.IsDormant(hero) and NPC.IsLinkensProtected(hero) and Entity.GetHealth(hero) > 0 then
            local pos = NPC.GetAbsOrigin(hero)
            local x, y, visible = Renderer.WorldToScreen(pos)

            if visible then
                Renderer.SetDrawColor(255, 0, 255, 255)
                Renderer.DrawTextCentered(ShowLinkens.font, x, y, "Linkens", 1)
            end
        end
    end
end

return ShowLinkens
