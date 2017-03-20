local AutoDodger = {}

AutoDodger.option = Menu.AddOption({"Utility", "Auto Dodger"}, "Auto Dodger", "Automatically dodges linear projectiles.")
AutoDodger.showPathOption = Menu.AddOption({"Utility", "Auto Dodger"}, "Draw Projectile Path", "Draw the path active projectiles.")

-- logic for specific particle effects will go here.
AutoDodger.particleLogic = 
{
    require("AutoDodger/PudgeLogic")
}

AutoDodger.activeProjectiles = {}
AutoDodger.knownRanges = {}
AutoDodger.impactRadius = 400
AutoDodger.canReset = true

AutoDodger.nextDodgeTime = 0.0
AutoDodger.movePos = Vector()
AutoDodger.active = false

function AutoDodger.Reset()
    if not AutoDodger.canReset then return end

    AutoDodger.activeProjectiles = {}
    AutoDodger.nextDodgeTime = 0.0
    AutoDodger.canReset = false
end

function AutoDodger.GetRange(index)
    local knownRange = AutoDodger.knownRanges[index]

    if knownRange == nil then return 2000 end

    return knownRange
end

function AutoDodger.OnLinearProjectileCreate(projectile)
    if not Menu.IsEnabled(AutoDodger.option) then return end
    if not projectile.source then return end

    if Entity.IsSameTeam(Heroes.GetLocal(), projectile.source) then return end

    AutoDodger.canReset = true

    AutoDodger.activeProjectiles[projectile.handle] = { source = projectile.source,
        origin = projectile.origin,
        velocity = projectile.velocity,
        index = projectile.particleIndex,
        time = GameRules.GetGameTime()
    }
end

function AutoDodger.OnLinearProjectileDestroy(projectile)
    if not Menu.IsEnabled(AutoDodger.option) then return end

    local projectileData = AutoDodger.activeProjectiles[projectile.handle]

    if not projectileData then return end

    local curtime = GameRules.GetGameTime()

    local t = curtime - projectileData.time
    local curPos = projectileData.origin + (projectileData.velocity:Scaled(t))

    local range = (curPos - projectileData.origin):Length2D()
    local knownRange = AutoDodger.knownRanges[projectileData.index]

    if knownRange == nil or knownRange < range then
        AutoDodger.knownRanges[projectileData.index] = range
    end 

    AutoDodger.activeProjectiles[projectile.handle] = nil
end

function AutoDodger.OnParticleCreate(particle)
    if not Menu.IsEnabled(AutoDodger.option) then return end

    for i, v in ipairs(AutoDodger.particleLogic) do
        v:OnParticleCreate(particle, AutoDodger.activeProjectiles)
    end
end

function AutoDodger.OnParticleUpdate(particle)
    if not Menu.IsEnabled(AutoDodger.option) then return end

    for i, v in ipairs(AutoDodger.particleLogic) do
        v:OnParticleUpdate(particle, AutoDodger.activeProjectiles, AutoDodger.knownRanges)
    end
end

function AutoDodger.OnParticleUpdateEntity(particle)
    if not Menu.IsEnabled(AutoDodger.option) then return end

    for i, v in ipairs(AutoDodger.particleLogic) do
        v:OnParticleUpdateEntity(particle, AutoDodger.activeProjectiles)
    end
end

function AutoDodger.OnParticleDestroy(particle)
    if not Menu.IsEnabled(AutoDodger.option) then return end

    for i, v in ipairs(AutoDodger.particleLogic) do
        v:OnParticleDestroy(particle, AutoDodger.activeProjectiles)
    end
end

function AutoDodger.OnUpdate()
    if not Menu.IsEnabled(AutoDodger.option) then return end

    local curtime = GameRules.GetGameTime()

    if curtime < AutoDodger.nextDodgeTime then return end

    local myHero = Heroes.GetLocal()

    if not Entity.IsAlive(myHero) then return end

    local myPos = Entity.GetAbsOrigin(myHero)

    local movePositions = {}

    -- simulate projectiles.
    for k, v in pairs(AutoDodger.activeProjectiles) do
        local t = curtime - v.time

        local projectileDir = v.velocity:Normalized()
        
        local curPos = v.origin + v.velocity:Scaled(t)

        local dir = (curPos - myPos)
        local impactPos = curPos + projectileDir:Scaled(dir:Length2D())
        local endPos = v.origin + projectileDir:Scaled(AutoDodger.GetRange(v.index))

        -- do not dodge if ahead of the impact point, and do not dodge if ahead of the max range of the projectile.
        if (impactPos - curPos):Dot(projectileDir) > 0 and (endPos - impactPos):Dot(projectileDir) > 0 and NPC.IsPositionInRange(myHero, impactPos, AutoDodger.impactRadius) then 
            local impactDir = (myPos - impactPos):Normalized()

            table.insert(movePositions, impactPos + impactDir:Scaled(AutoDodger.impactRadius + NPC.GetHullRadius(myHero) + 10))
        end
    end

    if #movePositions == 0 then
        AutoDodger.active = false
        return
    end

    AutoDodger.movePos = Vector()

    for k, v in pairs(movePositions) do
        AutoDodger.movePos = AutoDodger.movePos + v
    end

    AutoDodger.movePos = Vector(AutoDodger.movePos:GetX() / #movePositions, AutoDodger.movePos:GetY() / #movePositions, myPos:GetZ())
    Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, nil, AutoDodger.movePos, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, false, true)

    AutoDodger.nextDodgeTime = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.03
    AutoDodger.active = true
end

function AutoDodger.OnDraw()
    if not Engine.IsInGame() or not Menu.IsEnabled(AutoDodger.option) then
        AutoDodger.Reset()
        return
    end

    if not Menu.IsEnabled(AutoDodger.showPathOption) then return end

    local curtime = GameRules.GetGameTime()

    if AutoDodger.active then
        local x, y, vis = Renderer.WorldToScreen(AutoDodger.movePos)

        if vis then
            Renderer.SetDrawColor(0, 255, 0)
            --Renderer.DrawFilledRect(x, y, 25, 25)
        end
    end

    -- simulate and draw projectiles.
    for k, v in pairs(AutoDodger.activeProjectiles) do
        local t = curtime - v.time
        local curPos = v.origin + v.velocity:Scaled(t)
        local maxPos = v.origin + v.velocity:Normalized():Scaled(AutoDodger.GetRange(v.index))

        local x1, y1, v1 = Renderer.WorldToScreen(v.origin)
        local x2, y2, v2 = Renderer.WorldToScreen(curPos)

        local maxX, maxY, v3 = Renderer.WorldToScreen(maxPos)

        if v1 and v2 then  
            Renderer.SetDrawColor(255, 0, 0)
            Renderer.DrawLine(x1, y1, x2, y2)

            Renderer.SetDrawColor(0, 255, 0)
            Renderer.DrawLine(x2, y2, maxX, maxY)
        end
    end
end

return AutoDodger