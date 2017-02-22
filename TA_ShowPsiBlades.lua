local SPB = {}

SPB.opt = Menu.AddOption({"Hero Specific", "Templar Assassin"}, "Show Psi Blades", "Shows the box where Psi Blades will slice through")

function SPB.OnDraw() 
    if not Menu.IsEnabled(SPB.opt) then return end

    local myHero = Heroes.GetLocal()

    if not myHero or not Entity.IsAlive(myHero) then return end

    local psiBlades = NPC.GetAbility(myHero, "templar_assassin_psi_blades")

    if not psiBlades then return end

    local myTeam = Entity.GetTeamNum(myHero)
    local unit = Input.GetNearestUnitToCursor(myTeam, Enum.TeamType.TEAM_ENEMY)

    if not unit or not Entity.IsAlive(unit) then return end
    if not (NPC.IsCreep(unit) or NPC.IsLaneCreep(unit) or NPC.IsHero(unit)) then return end

    local spillRange = Ability.GetLevelSpecialValueFor(psiBlades, "attack_spill_range")
    local spillWidth = Ability.GetLevelSpecialValueFor(psiBlades, "attack_spill_width") / 2

    local myPos = Entity.GetAbsOrigin(myHero)
    local pos = Entity.GetAbsOrigin(unit)

    local dir = pos - myPos

    dir:SetZ(0)
    dir:Normalize()

    local ang = dir:ToAngle()

    -- The rectangle in world coordinates.
    local bl = pos + Vector(0, -spillWidth):Rotated(ang)
    local br = pos + Vector(0, spillWidth):Rotated(ang)
    local tl = pos + Vector(spillRange, -spillWidth):Rotated(ang)
    local tr = pos + Vector(spillRange, spillWidth):Rotated(ang)

    -- The rectangle in screen coordinates.
    local blx, bly, visible = Renderer.WorldToScreen(bl)
    local brx, bry = Renderer.WorldToScreen(br)
    local tlx, tly = Renderer.WorldToScreen(tl)
    local trx, try = Renderer.WorldToScreen(tr)

    if not visible then return end

    Renderer.SetDrawColor(240, 230, 140, 255)
    Renderer.DrawLine(blx, bly, brx, bry)
    Renderer.DrawLine(brx, bry, trx, try)
    Renderer.DrawLine(tlx, tly, trx, try)
    Renderer.DrawLine(tlx, tly, blx, bly)
end

return SPB
