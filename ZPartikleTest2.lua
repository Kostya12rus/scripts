local PatrikleTEst = {}
PatrikleTEst.Enable = Menu.AddOption({"Kostya12rus","Запись Партиклей"}, "Активация", "")
PatrikleTEst.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)
local timetick = 0 
local attacpart = {}
function PatrikleTEst.OnUpdate()
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	if timetick <= GameRules.GetGameTime() then
		for i=1,Heroes.Count() do
			local heroies = Heroes.Get(i)
			if Entity.IsAlive(heroies) and Entity.IsHero(heroies) and not NPC.IsIllusion(heroies) then
				for key,dsadas in pairs(NPC.GetModifiers(heroies)) do
					if Modifier.GetDieTime(dsadas) - GameRules.GetGameTime() >= 0 then
						Log.Write(NPC.GetUnitName(heroies) .."|"..Modifier.GetName(dsadas).."|"..math.floor(Modifier.GetDieTime(dsadas) - GameRules.GetGameTime()), 1)
					end
				end
			end
		end
		timetick = GameRules.GetGameTime() + 0.5
	end
	local myHero = Heroes.GetLocal()
	if Entity.IsAlive(myHero) then
		snip_ult = NPC.GetModifier(myHero, "modifier_sniper_assassinate")
		if snip_ult and (Modifier.GetDieTime(snip_ult) - GameRules.GetGameTime()) <= 2.1 then
			Renderer.DrawText(PatrikleTEst.Font, 200, 300,tostring(snip_ult).."|".. (Modifier.GetDieTime(snip_ult) - GameRules.GetGameTime()), 1)
		end
	end
end

function PatrikleTEst.OnUnitAnimation(animation)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnUnitAnimation: unit = "..NPC.GetUnitName(animation.unit)..", sequenceVariant = "..tostring(animation.sequenceVariant)..", playbackRate = "..tostring(animation.playbackRate)
	..", castpoint = "..tostring(animation.castpoint)..", type = "..tostring(animation.type)..", activity = "..tostring(animation.activity)..", sequence = "..tostring(animation.sequence)
	..", sequenceName = "..tostring(animation.sequenceName))
	
	if tostring(animation.sequenceName) == "light_strike_array_rhand_anim" or tostring(animation.sequenceName) == "light_strike_array_lhand_anim" then
		if animation.unit ~= Heroes.GetLocal() and  Entity.IsSameTeam(animation.unit,Heroes.GetLocal()) == false then
			local orchid = NPC.GetItem(Heroes.GetLocal(), "item_orchid", true)
			if orchid and Ability.IsReady(orchid) then
				--Ability.CastTarget(orchid, animation.unit)	
			end
		end
	end
end

function PatrikleTEst.OnUnitAnimationEnd(animation)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnUnitAnimationEnd: unit = "..NPC.GetUnitName(animation.unit)..", snap = "..tostring(animation.snap))
end

function PatrikleTEst.OnProjectile(projectile)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnProjectile: source = "..NPC.GetUnitName(projectile.source)..", target = "..NPC.GetUnitName(projectile.target)..", moveSpeed = "..tostring(projectile.moveSpeed)
	..", sourceAttachment = "..tostring(projectile.sourceAttachment)..", particleSystemHandle = "..tostring(projectile.particleSystemHandle)..", dodgeable = "..tostring(projectile.dodgeable)
	..", isAttack = "..tostring(projectile.isAttack)..", isEvaded = "..tostring(projectile.isEvaded)..", expireTime = "..tostring(projectile.expireTime)..", maxImpactTime = "..tostring(projectile.maxImpactTime)
	..", colorGemColor = "..tostring(projectile.colorGemColor)..", fullName = "..tostring(projectile.fullName)..", name = "..tostring(projectile.name))
	
	if projectile.name == "sniper_assassinate" then
		if NPC.GetUnitName(projectile.target) == NPC.GetUnitName(Heroes.GetLocal()) then
			local EUL = NPC.GetItem(Heroes.GetLocal(), "item_cyclone", true)
			if EUL or Ability.IsReady(EUL) then
				--Ability.CastTarget(EUL,Heroes.GetLocal())	
			end
		end
	end
end

function PatrikleTEst.OnLinearProjectileCreate(projectile)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnLinearProjectileCreate: source = "..tostring(projectile.source)..", origin = "..tostring(projectile.origin)..", velocity = "..tostring(projectile.velocity)
	..", particleIndex = "..tostring(projectile.particleIndex)..", handle = "..tostring(projectile.handle)..", acceleration = "..tostring(projectile.acceleration)..", latency = "..tostring(projectile.latency)
	..", maxSpeed = "..tostring(projectile.maxSpeed)..", fullName = "..tostring(projectile.fullName)..", name = "..tostring(projectile.name))
end

function PatrikleTEst.OnLinearProjectileDestroy(projectile)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnLinearProjectileDestroy: handle = "..tostring(projectile.handle))
end

function PatrikleTEst.OnParticleCreate(particle)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	if Entity.IsNPC(particle.entity) then
	Log.Write("OnParticleCreate: index = "..tostring(particle.index)..", entity = "..NPC.GetUnitName(particle.entity)..", particleNameIndex = "..tostring(particle.particleNameIndex)
	..", attachType = "..tostring(particle.attachType)..", entityForModifiers = "..tostring(particle.entityForModifiers)..", fullName = "..tostring(particle.fullName)..", name = "..tostring(particle.name))
	else
	Log.Write("OnParticleCreate: index = "..tostring(particle.index)..", entity = "..tostring(particle.entity)..", particleNameIndex = "..tostring(particle.particleNameIndex)
	..", attachType = "..tostring(particle.attachType)..", entityForModifiers = "..tostring(particle.entityForModifiers)..", fullName = "..tostring(particle.fullName)..", name = "..tostring(particle.name))
	end
end

function PatrikleTEst.OnParticleUpdate(particle)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnParticleUpdate: index = "..tostring(particle.index)..", position = "..tostring(particle.position)..", controlPoint = "..tostring(particle.controlPoint))
end

function PatrikleTEst.OnParticleUpdateEntity(particle)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnParticleUpdateEntity: index = "..tostring(particle.index)..", controlPoint = "..tostring(particle.controlPoint)..", entity = "..tostring(particle.entity)
	..", attachType = "..tostring(particle.attachType)..", attachment = "..tostring(particle.attachment)..", position = "..tostring(particle.position)..", includeWearables = "..tostring(particle.includeWearables))
end

function PatrikleTEst.OnParticleDestroy(particle)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnParticleDestroy: index = "..tostring(particle.index)..", destroyImmediately = "..tostring(particle.destroyImmediately))
end

function PatrikleTEst.OnSayText(textEvent)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	Log.Write("OnSayText: entity = "..tostring(textEvent.entity)..", chat = "..tostring(textEvent.chat)..", messageName = "..tostring(textEvent.messageName)
	..", params[1] = "..tostring(textEvent.params[1])..", params[2] = "..tostring(textEvent.params[2]))
end

function PatrikleTEst.OnEntityCreate(ent)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	-- if Entity.IsNPC(ent) then
		-- Log.Write("OnEntityCreate: "..NPC.GetUnitName(ent))
	-- else
		-- Log.Write("OnEntityCreate: "..tostring(ent))
	-- end
end

function PatrikleTEst.OnEntityDestroy(ent)
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	-- if Entity.IsNPC(ent) then
		-- Log.Write("OnEntityDestroy: "..NPC.GetUnitName(ent))
	-- else
		-- Log.Write("OnEntityDestroy: "..tostring(ent))
	-- end
end


function PatrikleTEst.OnPrepareUnitOrders(orders)
	Log.Write("OnPrepareUnitOrders: "..tostring(orders.player)..", "..tostring(orders.order)..", "..tostring(orders.target)
	..", "..tostring(orders.position)..", "..tostring(orders.ability)..", "..tostring(orders.orderIssuer)..", "..tostring(orders.npc)..", "..tostring(orders.queue)
	..", "..tostring(orders.showEffects))
	return false
end


function PatrikleTEst.OnDraw()
	if not Menu.IsEnabled(PatrikleTEst.Enable) then return end
	if not Heroes.GetLocal() then return end
	localx = 500
	localy = 220
	local mouse = Input.GetWorldCursorPos()
	local mouseX = math.floor(mouse:GetX())
	local mouseY = math.floor(mouse:GetY())
	local mouseZ = math.floor(mouse:GetZ())
	--Renderer.DrawText(PatrikleTEst.Font, localx, localy,Entity.GetOrigin(Heroes.GetLocal()):__tostring() , 1)
	
	for i,key in pairs(attacpart) do
		Renderer.DrawText(PatrikleTEst.Font, localx, localy,tostring(i) .."|"..tostring(key), 1)
		localy = localy + 10
	end
end

return PatrikleTEst