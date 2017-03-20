local PudgeLogic = {}

PudgeLogic.index = -1
PudgeLogic.particleName = "pudge_meathook"
PudgeLogic.timesUpdateEntity = 0

function PudgeLogic:OnParticleCreate(particle, activeProjectiles)
    if particle.name ~= self.particleName then return end

    Log.Write("Created " .. particle.index)

    activeProjectiles[particle.index] = { source = particle.entity,
        origin = Vector(0, 0, 0),
        velocity = Vector(0, 0, 0),
        index = particle.particleNameIndex,
        time = GameRules.GetGameTime()
    }

    self.index = particle.index
    self.timesUpdateEntity = 0
end

function PudgeLogic:OnParticleUpdateEntity(particle, activeProjectiles)
    if particle.index ~= self.index then return end

    -- delete particle as it's on our own team.
    if not particle.entity or Entity.IsSameTeam(particle.entity, Heroes.GetLocal()) or self.timesUpdateEntity >= 2 then
        activeProjectiles[particle.index] = nil
        self.index = -1
        return 
    end

    local projectileData = activeProjectiles[particle.index]
    if projectileData == nil then return end

    if self.timesUpdateEntity == 0 then
        projectileData.origin = NPC.GetAttachmentByIndex(particle.entity, particle.attachment)
    end

    self.timesUpdateEntity = self.timesUpdateEntity + 1
end

function PudgeLogic:OnParticleUpdate(particle, activeProjectiles, knownRanges)
    if particle.index ~= self.index then return end

    local projectileData = activeProjectiles[particle.index]
    if projectileData == nil then return end

    if particle.controlPoint == 1 then
        local dir = (particle.position - projectileData.origin)
        knownRanges[projectileData.index] = dir:Length2D()
        projectileData.velocity = dir:Normalized()
    elseif particle.controlPoint == 2 then
        projectileData.velocity:Scale(particle.position:GetX())
    end
end

function PudgeLogic:OnParticleDestroy(particle, activeProjectiles)
    activeProjectiles[particle.index] = nil
end

return PudgeLogic