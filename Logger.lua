local Logger = {}
Logger.TrigerActiv = Menu.AddOption({"Kostya12rus"}, "Logger", "")

function Logger.OnParticleCreate(particle)
    if Menu.IsEnabled(Logger.TrigerActiv) then
        local isHasKey = Config.ReadInt("OnParticleCreate", particle.name, 0)
        Config.WriteInt("OnParticleCreate", particle.name, isHasKey+1)
    end
end

function Logger.OnUnitAnimation(animation)
    if Menu.IsEnabled(Logger.TrigerActiv) then
        local isHasKey = Config.ReadInt("OnUnitAnimation", animation.sequenceName, 0)
        Config.WriteInt("OnUnitAnimation", animation.sequenceName, isHasKey+1)
    end
end

function Logger.OnProjectile(projectile)
    if Menu.IsEnabled(Logger.TrigerActiv) then
        local isHasKey = Config.ReadInt("OnProjectile", projectile.name, 0)
        Config.WriteInt("OnProjectile", projectile.name, isHasKey+1)
    end
end

function Logger.OnModifierGained(npc, modifier)
    if Menu.IsEnabled(Logger.TrigerActiv) and Modifier.GetName(modifier) then
        local isHasKey = Config.ReadInt("OnModifierGained", Modifier.GetName(modifier), 0)
        Config.WriteInt("OnModifierGained", Modifier.GetName(modifier), isHasKey+1)
    end
end
function Logger.OnSoundStart(sound)
    if Menu.IsEnabled(Logger.TrigerActiv) and Modifier.GetName(sound.name) then
        local isHasKey = Config.ReadInt("OnSoundStart", sound.name, 0)
        Config.WriteInt("OnSoundStart", sound.name, isHasKey+1)
    end
end

return Logger