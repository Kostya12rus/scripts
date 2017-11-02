local BirgaMemof = {}
BirgaMemof.Enable = Menu.AddOption({"Kostya12rus","Биржа Мемов Мультихак"}, "Активировация", "")
BirgaMemof.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

local attacparticle = {}
imageHandlepar = Renderer.LoadImage("resource/flash3/images/broadcast/statpop_exclaim.png")

function BirgaMemof.OnUpdate()
	if not Menu.IsEnabled(BirgaMemof.Enable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local superboots = NPC.GetItem(myHero, "item_imba_phase_boots_2", true)
	local superagnim = NPC.GetItem(myHero, "item_ultimate_mem", true)
	if Entity.IsAlive(myHero) then	
		if superboots and Ability.IsReady(superboots) and NPC.IsRunning(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
			Ability.CastNoTarget(superboots)
			return
		end
		if superagnim then
			Ability.CastNoTarget(superagnim)
			return
		end
		local EUL = NPC.GetItem(myHero, "item_cyclone", true)
		snip_ult = NPC.GetModifier(myHero, "modifier_sniper_assassinate")
		if snip_ult and (Modifier.GetDieTime(snip_ult) - GameRules.GetGameTime()) <= 2.1 then
			if EUL and Ability.IsReady(EUL) then
				Ability.CastTarget(EUL,myHero)
				return
			end
		end
	end
end

function BirgaMemof.OnProjectile(projectile)
	if not Menu.IsEnabled(BirgaMemof.Enable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
	local myHero = Heroes.GetLocal()
	if projectile.target == myHero then
		local EUL = NPC.GetItem(myHero, "item_cyclone", true)
		local lotus = NPC.GetItem(myHero, "item_lotus_orb", true)
		local linka = NPC.GetItem(myHero, "item_sphere", true)
		local baldezh = NPC.GetItem(myHero, "item_baldezh", true)
		local cosmobaldezh = NPC.GetItem(myHero, "item_cosmobaldezh", true)
		local superbaldezh = NPC.GetItem(myHero, "item_superbaldezh", true)

		if projectile.name == "sniper_assassinate" then
			if EUL or Ability.IsReady(EUL) then
				Ability.CastTarget(EUL,myHero)
				return
			end
		else
			if baldezh and Ability.IsReady(baldezh) then
				Ability.CastNoTarget(baldezh)
				return
			elseif cosmobaldezh and Ability.IsReady(cosmobaldezh) then
				Ability.CastNoTarget(cosmobaldezh)
				return
			elseif superbaldezh and Ability.IsReady(superbaldezh) then
				Ability.CastNoTarget(superbaldezh)
				return
			elseif linka and Ability.IsReady(linka) then
				Ability.CastTarget(linka,myHero)
				return
			elseif lotus and Ability.IsReady(lotus) then
				Ability.CastTarget(lotus,myHero)
				return
			elseif EUL and Ability.IsReady(EUL) then
				--Ability.CastTarget(EUL,myHero)
				--
			end
		end
	end
end

function BirgaMemof.OnUnitAnimation(animation)
	if not Menu.IsEnabled(BirgaMemof.Enable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
	if tostring(animation.sequenceName) == "light_strike_array_rhand_anim" or tostring(animation.sequenceName) == "light_strike_array_lhand_anim" then
		if animation.unit ~= Heroes.GetLocal() and not Entity.IsSameTeam(animation.unit,Heroes.GetLocal())then
			local orchid = NPC.GetItem(Heroes.GetLocal(), "item_orchid", true)
			if orchid and Ability.IsReady(orchid) then
				Ability.CastTarget(orchid, animation.unit)
				return
			end
		end
	end
end

function BirgaMemof.OnParticleCreate(particle)
	if particle.name == "damage_flash" and Entity.IsDormant(particle.entity) then
		attacparticle[particle.index] = {}
		table.insert(attacparticle[particle.index],particle.entity)
		table.insert(attacparticle[particle.index],GameRules.GetGameTime())
	end
end

function BirgaMemof.OnParticleUpdateEntity(particle)
	if attacparticle[particle.index] then
		table.insert(attacparticle[particle.index],particle.position)
	end
end

function BirgaMemof.OnDraw()
	if not Menu.IsEnabled(BirgaMemof.Enable) then return end
	localx = 500
	localy = 200
	local mouse = Input.GetWorldCursorPos()
	local mouseX = math.floor(mouse:GetX())
	local mouseY = math.floor(mouse:GetY())
	local mouseZ = math.floor(mouse:GetZ())
	Renderer.SetDrawColor(255,0,0,255)
	--Renderer.DrawText(BirgaMemof.Font, localx, localy, mouseX .. "|" .. mouseY .. "|" .. mouseZ  .. "|" .. GameRules.GetGameMode(), 1)
	for i,j in pairs(attacparticle) do
		--ent =   j[1]
		--timea = j[2]
		--vect =  j[3]
		local xposs,yposs,vis = Renderer.WorldToScreen(j[3])
		
		Renderer.SetDrawColor(255,255,255,255)
		if vis then
			Renderer.DrawImage(imageHandlepar,xposs,yposs,32,32)
		end
		if j[2] + 5 <= GameRules.GetGameTime() then
			attacparticle[i] = nil
		end
	end
end

return BirgaMemof