local PatrikleTEst = {}
--PatrikleTEst.Enable = Menu.AddOption({"Kostya12rus","Запись Партиклей"}, "Активировация", "")
--PatrikleTEst.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

    -- OnUnitAnimationkey            = 0
    -- OnUnitAnimationEndkey         = 0
    -- OnProjectilekey               = 0
    -- OnLinearProjectileCreatekey   = 0
    -- OnLinearProjectileDestroykey  = 0
    -- OnParticleCreatekey           = 0
    -- OnParticleUpdatekey           = 0
    -- OnParticleUpdateEntitykey     = 0
    -- OnParticleDestroykey          = 0
    -- OnEntityCreatekey             = 0
    -- OnEntityDestroykey            = 0
    -- OnPrepareUnitOrderskey        = 0
-- function PatrikleTEst.OnUpdate()
	-- if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
-- end

-- function PatrikleTEst.OnUnitAnimation(animation)
	-- Config.WriteString('OnUnitAnimation',OnUnitAnimationkey,"OnUnitAnimation: "..NPC.GetUnitName(animation.unit).." "..tostring(animation.sequenceVariant).." "..tostring(animation.playbackRate)
	-- .." "..tostring(animation.castpoint).." "..tostring(animation.type).." "..tostring(animation.activity).." "..tostring(animation.sequence)
	-- .." "..tostring(animation.sequenceName))
	-- OnUnitAnimationkey=OnUnitAnimationkey+1
-- end

-- function PatrikleTEst.OnUnitAnimationEnd(animation)
	-- Config.WriteString('OnUnitAnimationEnd',OnUnitAnimationEndkey,"OnUnitAnimationEnd: "..NPC.GetUnitName(animation.unit).." "..tostring(animation.snap))
	-- OnUnitAnimationEndkey=OnUnitAnimationEndkey+1
-- end

-- function PatrikleTEst.OnProjectile(projectile)
	-- Config.WriteString('OnProjectile',OnProjectilekey,"OnProjectile: "..NPC.GetUnitName(projectile.source).." "..NPC.GetUnitName(projectile.target).." "..tostring(projectile.moveSpeed)
	-- .." "..tostring(projectile.sourceAttachment).." "..tostring(projectile.particleSystemHandle).." "..tostring(projectile.dodgeable)
	-- .." "..tostring(projectile.isAttack).." "..tostring(projectile.isEvaded).." "..tostring(projectile.expireTime).." "..tostring(projectile.maxImpactTime)
	-- .." "..tostring(projectile.colorGemColor).." "..tostring(projectile.fullName).." "..tostring(projectile.name))
	
	-- if projectile.name == "sniper_assassinate" then
		-- if NPC.GetUnitName(projectile.source) == Heroes.GetLocal() then
			-- local EUL = NPC.GetItem(myHero, "item_cyclone", true)
			-- if EUL or Ability.IsReady(EUL) then
				-- Ability.CastTarget(EUL,Heroes.GetLocal())	
			-- end
		-- end
	-- end
	-- OnProjectilekey=OnProjectilekey+1
-- end

-- function PatrikleTEst.OnLinearProjectileCreate(projectile)
	-- Config.WriteString('OnLinearProjectileCreate',OnLinearProjectileCreatekey,"OnLinearProjectileCreate: "..tostring(projectile.source).." "..tostring(projectile.origin).." "..tostring(projectile.velocity)
	-- .." "..tostring(projectile.particleIndex).." "..tostring(projectile.handle).." "..tostring(projectile.acceleration).." "..tostring(projectile.latency)
	-- .." "..tostring(projectile.maxSpeed).." "..tostring(projectile.fullName).." "..tostring(projectile.name))
	-- OnLinearProjectileCreatekey=OnLinearProjectileCreatekey+1
-- end

-- function PatrikleTEst.OnLinearProjectileDestroy(projectile)
	-- Config.WriteString('OnLinearProjectileDestroy',OnLinearProjectileDestroykey,"OnLinearProjectileDestroy: "..tostring(projectile.handle))
	-- OnLinearProjectileDestroykey=OnLinearProjectileDestroykey+1
-- end

-- function PatrikleTEst.OnParticleCreate(particle)
	-- if Entity.IsNPC(particle.entity) then
	-- Config.WriteString('OnParticleCreate',OnParticleCreatekey,"OnParticleCreate: "..tostring(particle.index).." "..NPC.GetUnitName(particle.entity).." "..tostring(particle.particleNameIndex)
	-- .." "..tostring(particle.attachType).." "..tostring(particle.entityForModifiers).." "..tostring(particle.fullName).." "..tostring(particle.name))
	-- else
	-- Config.WriteString('OnParticleCreate',OnParticleCreatekey,"OnParticleCreate: "..tostring(particle.index).." "..tostring(particle.entity).." "..tostring(particle.particleNameIndex)
	-- .." "..tostring(particle.attachType).." "..tostring(particle.entityForModifiers).." "..tostring(particle.fullName).." "..tostring(particle.name))
	-- end
	-- OnParticleCreatekey=OnParticleCreatekey+1
-- end

-- function PatrikleTEst.OnParticleUpdate(particle)
	-- Config.WriteString('OnParticleUpdate',OnParticleUpdatekey,"OnParticleUpdate: "..tostring(particle.index).." "..tostring(particle.position).." "..tostring(particle.controlPoint))
	-- OnParticleUpdatekey=OnParticleUpdatekey+1
-- end

-- function PatrikleTEst.OnParticleUpdateEntity(particle)
	-- Config.WriteString('OnParticleUpdateEntity',OnParticleUpdateEntitykey,"OnParticleUpdateEntity: "..tostring(particle.index).." "..tostring(particle.controlPoint).." "..tostring(particle.entity)
	-- .." "..tostring(particle.attachType).." "..tostring(particle.attachment).." "..tostring(particle.position).." "..tostring(particle.includeWearables))

	-- OnParticleUpdateEntitykey=OnParticleUpdateEntitykey+1
-- end

-- function PatrikleTEst.OnParticleDestroy(particle)
	-- Config.WriteString('OnParticleDestroy',OnParticleDestroykey,"OnParticleDestroy: "..tostring(particle.index).." "..tostring(particle.destroyImmediately))
	-- OnParticleDestroykey=OnParticleDestroykey+1
-- end

-- function PatrikleTEst.OnEntityCreate(ent)
	-- if Entity.IsNPC(ent) then
		-- Config.WriteString("OnEntityCreate",OnEntityCreatekey,"OnEntityCreate: "..NPC.GetUnitName(ent))
	-- else
		-- Config.WriteString("OnEntityCreate",OnEntityCreatekey,"OnEntityCreate: "..tostring(ent))
	-- end
	-- OnEntityCreatekey=OnEntityCreatekey+1
-- end

-- function PatrikleTEst.OnEntityDestroy(ent)
	-- if Entity.IsNPC(ent) then
		-- Config.WriteString("OnEntityDestroy",OnEntityDestroykey,"OnEntityDestroy: "..NPC.GetUnitName(ent))
	-- else
		-- Config.WriteString("OnEntityDestroy",OnEntityDestroykey,"OnEntityDestroy: "..tostring(ent))
	-- end
	-- OnEntityDestroykey=OnEntityDestroykey+1
-- end

-- -- function PatrikleTEst.OnPrepareUnitOrders(orders)
	-- -- Config.WriteString("OnPrepareUnitOrders",OnPrepareUnitOrderskey,"OnPrepareUnitOrders: "..tostring(orders.player).." "..tostring(orders.order).." "..tostring(orders.target)
	-- -- .." "..tostring(orders.position).." "..tostring(orders.ability).." "..tostring(orders.orderIssuer).." "..tostring(orders.npc).." "..tostring(orders.queue)
	-- -- .." "..tostring(orders.showEffects))
	-- -- OnPrepareUnitOrderskey=OnPrepareUnitOrderskey+1
-- -- end

-- function PatrikleTEst.OnDraw()
	-- localx = 500
	-- localy = 200
	-- local mouse = Input.GetWorldCursorPos()
	-- local mouseX = math.floor(mouse:GetX())
	-- local mouseY = math.floor(mouse:GetY())
	-- local mouseZ = math.floor(mouse:GetZ())
	-- Renderer.DrawText(PatrikleTEst.Font, localx, localy,mouseX .. " " .. mouseY .. " " .. mouseZ , 1)
-- end

return PatrikleTEst