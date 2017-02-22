local SAH = {}

SAH.opt = Menu.AddOption({"Hero Specific", "Templar Assassin"}, "Show Attack Hints", "Draws a line where attacking a creep will deal damage to an enemy hero with Psi Blades")

function SAH.OnDraw()
    if not Menu.IsEnabled(SAH.opt) then return end

    local myHero = Heroes.GetLocal()

    if not myHero or not Entity.IsAlive(myHero) then return end

    local psiBlades = NPC.GetAbility(myHero, "templar_assassin_psi_blades")

    if not psiBlades then return end

    local spillRange = Ability.GetLevelSpecialValueFor(psiBlades, "attack_spill_range")

    local myTeam = Entity.GetTeamNum(myHero)
    local myPos = Entity.GetAbsOrigin(myHero)
    local myAttackRange = NPC.GetAttackRange(myHero)
    local myFarthestPossibleAttackRange = myAttackRange + spillRange
    local enemies = Heroes.InRadius(myPos, myFarthestPossibleAttackRange, myTeam, Enum.TeamType.TEAM_ENEMY)

    Renderer.SetDrawColor(255, 255, 255, 255)

    for k, enemy in ipairs(enemies) do
        local enemyPos = Entity.GetAbsOrigin(enemy)
        local units = NPCs.InRadius(enemyPos, spillRange, myTeam, Enum.TeamType.TEAM_ENEMY) 

        for j, unit in ipairs(units) do
            if NPC.IsLaneCreep(unit) then
                local unitPos = Entity.GetAbsOrigin(unit)
                
                local dir = unitPos - enemyPos

                dir:SetZ(0)
                dir:Normalize()
                dir:Scale(myAttackRange)

                local x1, y1, v = Renderer.WorldToScreen(unitPos)
                local x2, y2 = Renderer.WorldToScreen(unitPos + dir)

                if v then
                    Renderer.DrawLine(x1, y1, x2, y2)
                end
            end
        end
    end
end

return SAH
