local ParticleTest = { }

function ParticleTest.Init()
   ParticleTest.nextTime = 0
   ParticleTest.currentParticle = 0
end

function ParticleTest.OnGameEnd()
   -- since the game ended, the game's garbage cleanup should have automatically deleted the particle.
   -- we do not need to delete it manually at this point.
   ParticleTest.Init()
end

function ParticleTest.OnUpdate()
   local myHero = Heroes.GetLocal()
   if not myHero then return end

   local curtime = GameRules.GetGameTime()

   -- create particle every second.
   if (curtime > ParticleTest.nextTime) then
       -- destroy particle if existed before.
       if ParticleTest.currentParticle ~= 0 then
           Particle.Destroy(ParticleTest.currentParticle)
       end

       -- create particle.
       ParticleTest.currentParticle = Particle.Create("particles/units/heroes/hero_spirit_breaker/spirit_breaker_charge_target_mark.vpcf", Enum.ParticleAttachment.PATTACH_OVERHEAD_FOLLOW, myHero)
       ParticleTest.nextTime = curtime + 1.0
   end
end

-- initialize script.
ParticleTest.Init()

return ParticleTest