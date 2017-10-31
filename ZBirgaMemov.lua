local BirgaMemof = {}
BirgaMemof.Enable = Menu.AddOption({"Kostya12rus","Биржа Мемов Мультихак"}, "Активировация", "")
BirgaMemof.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function BirgaMemof.OnUpdate()
	if not Menu.IsEnabled(BirgaMemof.Enable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local superboots = NPC.GetItem(myHero, "item_imba_phase_boots_2", true)
	local superagnim = NPC.GetItem(myHero, "item_ultimate_mem", true)
	if superboots and Ability.IsReady(superboots) and NPC.IsRunning(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
		Ability.CastNoTarget(superboots)
		return
	end
	if superagnim then
		Ability.CastNoTarget(superagnim)
		return
	end
	if Entity.IsAlive(myHero) then
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
		
			if baldezh and Ability.IsReady(baldezh) then                                   		
				Ability.CastNoTarget(baldezh)                                              		-- if projectile.name == "sniper_assassinate" then
				return                                                                     			-- if EUL or Ability.IsReady(EUL) then
			elseif cosmobaldezh and Ability.IsReady(cosmobaldezh) then                     				-- Ability.CastTarget(EUL,myHero)	
				Ability.CastNoTarget(cosmobaldezh)                                         			-- end
				return                                                                     		-- end
			elseif superbaldezh and Ability.IsReady(superbaldezh) then                     		-- if projectile.name == "alchemist_unstable_concoction_projectile"  then
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
				--return
			end
		-- end
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

function BirgaMemof.OnDraw()
	if not Menu.IsEnabled(BirgaMemof.Enable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
	localx = 500
	localy = 200
	local mouse = Input.GetWorldCursorPos()
	local mouseX = math.floor(mouse:GetX())
	local mouseY = math.floor(mouse:GetY())
	local mouseZ = math.floor(mouse:GetZ())
	Renderer.SetDrawColor(255,0,0,255)
	Renderer.DrawText(BirgaMemof.Font, localx, localy, mouseX .. "|" .. mouseY .. "|" .. mouseZ, 1)
end

return BirgaMemof