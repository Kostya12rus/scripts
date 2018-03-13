local BirgaMemof = {}
BirgaMemof.Enable = Menu.AddOption({"Kostya12rus","Биржа Мемов Мультихак"}, "Активировация", "")
BirgaMemof.AutoPick = Menu.AddOption({"Kostya12rus","Биржа Мемов Мультихак"}, "Авто пикер", "", 0, 3, 1)
BirgaMemof.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

Menu.SetValueName(BirgaMemof.AutoPick, 0, 'Выключен')
Menu.SetValueName(BirgaMemof.AutoPick, 1, 'Папич')
Menu.SetValueName(BirgaMemof.AutoPick, 2, 'Пингвин')
Menu.SetValueName(BirgaMemof.AutoPick, 3, 'Абдуль')

function BirgaMemof.init()
	attacparticle = {}
	imageHandlepar = Renderer.LoadImage("resource/flash3/images/broadcast/statpop_exclaim.png")
	Distanse = 900
	Distanse2 = Distanse/1.4085
	tablepos = {Vector(Distanse,0,0),Vector(Distanse2,Distanse2,0),Vector(0,Distanse,0),Vector(-Distanse2,Distanse2,0),Vector(-Distanse,0,0),Vector(-Distanse2,-Distanse2,0),Vector(0,-Distanse,0),Vector(Distanse2,-Distanse2,0)}
	
	iiipam = nil
	iiipampos = 1
	iiipamtarget = nil
	iiipamattacking = false
	iiipamnotattack = 0
	iiipamtrigergotospot = 0
	
	ash = nil
	ashpos = 5
	ashtarget = nil
	ashattacking = false
	ashnotattack = 0
	ashtrigergotospot = 0
	
	timing = 0
	
	zpos = nil
end
BirgaMemof.init()
function BirgaMemof.OnGameStart()
	BirgaMemof.init()
end

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
	if not zpos then
		for _,npc in pairs(NPCs.GetAll()) do
			if NPC.GetUnitName(npc) == "npc_dota_kobold_radiantboss" then
				CenterMap = Entity.GetAbsOrigin(npc)
				zpos = CenterMap:GetZ()
				tablepos = {Vector(Distanse,0,zpos),Vector(Distanse2,Distanse2,zpos),Vector(0,Distanse,zpos),Vector(-Distanse2,Distanse2,zpos),Vector(-Distanse,0,zpos),Vector(-Distanse2,-Distanse2,zpos),Vector(0,-Distanse,zpos),Vector(Distanse2,-Distanse2,zpos)}
			end
		end
		if not CenterMap then
			CenterMap = Vector(0,0,0)
		end
	end
	if NPC.GetUnitName(myHero) == "npc_dota_hero_meepo" then -- STRANGER
		if not iiipam or not ash then
			for _,npc in pairs(NPCs.GetAll()) do
				if npc and Entity.IsAlive(npc) and (Entity.OwnedBy(npc,Heroes.GetLocal()) or npc == Heroes.GetLocal()) then
					if NPC.GetUnitName(npc) == "npc_dota_lone_druid_bear1" and not iiipam then
						iiipam = npc
					elseif NPC.GetUnitName(npc) == "npc_dota_lone_druid_bear2" and not iiipam then
						iiipam = npc
					elseif NPC.GetUnitName(npc) == "npc_dota_lone_druid_bear3" and not iiipam then
						iiipam = npc
					elseif NPC.GetUnitName(npc) == "npc_dota_lone_druid_bear4" and not iiipam then
						iiipam = npc
					end
					if NPC.GetUnitName(npc) == "npc_ash" and not ash then
						ash = npc
					end
				end
			end
		end
		if ash    then if not Entity.IsAlive(ash)    then ash = nil    end end
		if iiipam then if not Entity.IsAlive(iiipam) then iiipam = nil end end
		if iiipam then
			if iiipamnotattack <= GameRules.GetGameTime() then
				local suiside = BirgaMemof.TechisSuicide(iiipam)
				if suiside then
					local blink = NPC.GetItem(iiipam, "item_blink", true)
					if blink and Ability.IsReady(blink) then
						Ability.CastPosition(blink,suiside)
					end
					NPC.MoveTo(iiipam,suiside)
					iiipamnotattack = GameRules.GetGameTime() + 0.5
				end
			end
			if not suiside and iiipamnotattack + 1.5 <= GameRules.GetGameTime() then
				if not iiipamtarget then
					if BirgaMemof.FindTarget(iiipam) then
						iiipamtarget = BirgaMemof.FindTarget(iiipam)
						iiipamattacking = false
					end
				else
					if not BirgaMemof.ReturnTryEnemy(iiipam,iiipamtarget) then
						iiipamtarget = nil
					end
				end
				if not iiipamattacking and iiipamtarget then
					Player.AttackTarget(Players.GetLocal(),iiipam,iiipamtarget)
					iiipamattacking = true
				end
				if not iiipamtarget and not NPC.IsAttacking(iiipam) then
					if iiipampos <= #tablepos then
						if NPC.IsPositionInRange(iiipam,tablepos[iiipampos],100) then
							iiipampos = iiipampos + 1
							if iiipampos > #tablepos then
								iiipampos = 1
							end
						else
							if iiipamtrigergotospot <= GameRules.GetGameTime() then
								NPC.MoveTo(iiipam,tablepos[iiipampos])
								iiipamtrigergotospot = GameRules.GetGameTime() + 0.1
							end
						end
					end
				end
			end
		end
		if ash then
			local Ash_skills                  = NPC.GetAbility(ash,"Ash_skills")
			local Ability_slot                = NPC.GetAbility(ash,"Ability_slot")--пустой слот в начале
			local pocik_xylimalo              = NPC.GetAbility(ash,"pocik_xylimalo_ash")--Опасный поцык
			local kuromi4                     = NPC.GetAbility(ash,"kuromi4_ash")--Супер стан всех
			local daniil_silence              = NPC.GetAbility(ash,"daniil_silence_ash")--Сало, кто это сказал?
			local dice_steelstorm             = NPC.GetAbility(ash,"dice_steelstorm_ash")--Спинер
			local face                        = NPC.GetAbility(ash,"ash_face")--фэйс тряска
			local black_hole                  = NPC.GetAbility(ash,"black_hole_ash")--черная дыра
			local invoker_deafening_blast     = NPC.GetAbility(ash,"invoker_deafening_blast_ash")--бласт
			local holdout_bezhenci            = NPC.GetAbility(ash,"holdout_bezhenci_ash")--супер снайперы npc_dota_bezhenec
			local kontra                      = NPC.GetAbility(ash,"ash_kontra")--нс контра
			if Ability_slot and not Ability.IsHidden(Ability_slot) then
				Ability.CastNoTarget(Ash_skills)
			end
			if black_hole and Ability.IsReady(black_hole) and not Ability.IsHidden(black_hole) then
				if #Entity.GetHeroesInRadius(ash,Ability.GetLevelSpecialValueFor(black_hole,"far_radius"),Enum.TeamType.TEAM_ENEMY) >= 2 then
					Ability.CastPosition(black_hole,Entity.GetAbsOrigin(ash)) 
				end
			end
			if lycan_shapeshift and Ability.IsReady(lycan_shapeshift) and not Ability.IsHidden(lycan_shapeshift) then
				Ability.CastNoTarget(lycan_shapeshift)
			end
			if ursa_overpower and Ability.IsReady(ursa_overpower) and not Ability.IsHidden(ursa_overpower) then
				Ability.CastNoTarget(ursa_overpower)
			end
			if kli4ko4 and Ability.IsReady(kli4ko4) and not Ability.IsHidden(kli4ko4) then
				Ability.CastNoTarget(kli4ko4)
			end
			if president and Ability.IsReady(president) and not Ability.IsHidden(president) then
				Ability.CastNoTarget(president)
			end
			if face and Ability.IsReady(face) and not Ability.IsHidden(face) then
				if #Entity.GetHeroesInRadius(ash,1600,Enum.TeamType.TEAM_ENEMY) >= 2 then
					Ability.CastNoTarget(face)
				end
			end
			if invoker_deafening_blast and Ability.IsReady(invoker_deafening_blast) and not Ability.IsHidden(invoker_deafening_blast) then
				for _,hero in ipairs(Entity.GetHeroesInRadius(ash,1000,Enum.TeamType.TEAM_ENEMY)) do
					if hero and not NPC.HasState(hero,Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						local damag = Ability.GetLevelSpecialValueFor(invoker_deafening_blast,"damage")*NPC.GetMagicalArmorDamageMultiplier(hero)
						if Entity.GetHealth(hero) <= damag then
							Ability.CastPosition(invoker_deafening_blast,Entity.GetAbsOrigin(hero))
						end
					end
				end
			end
			if gats_ultimate and Ability.IsReady(gats_ultimate) and not Ability.IsHidden(gats_ultimate) then
				Ability.CastNoTarget(gats_ultimate)
			end
			if Ash_skills and Ability.IsReady(Ash_skills) and not NPC.IsChannellingAbility(ash) then
				for i = 0,24 do
					ability = NPC.GetAbilityByIndex(ash,i)
					if ability and Entity.IsAbility(ability) and not Ability.IsHidden(ability) and not Ability.IsAttributes(ability) and Ash_skills ~= ability then
						if Ability.GetCooldown(ability) > 4 or bash == ability then
							Ability.CastNoTarget(Ash_skills)
						end
					end
				end
			end
			if not NPC.IsChannellingAbility(ash) then
				if ashpos <= #tablepos then
					if NPC.IsPositionInRange(ash,tablepos[ashpos],100) then
						ashpos = ashpos + 1
						if ashpos > #tablepos then
							ashpos = 1
						end
					else
						if ashtrigergotospot <= GameRules.GetGameTime() then
							NPC.MoveTo(ash,tablepos[ashpos])
							ashtrigergotospot = GameRules.GetGameTime() + 0.1
						end
					end
				end
			end
		end
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_axe" then
		local abdul_rage                  = NPC.GetAbility(myHero,"abdul_rage")
		local reality_rift_datadriven     = NPC.GetAbility(myHero,"reality_rift_datadriven")
		local abdul_krug                  = NPC.GetAbility(myHero,"abdul_krug")
		local culling_blade               = NPC.GetAbility(myHero,"culling_blade_datadriven")
		
		if culling_blade and Ability.IsReady(culling_blade) and Entity.IsAlive(myHero) and timing <= GameRules.GetGameTime() then
			if Ability.IsReady(reality_rift_datadriven) then
				local target = BirgaMemof.NeedNPCFor_culling_blade(culling_blade,Ability.GetCastRange(reality_rift_datadriven))
				if target then
					Ability.CastTarget(reality_rift_datadriven,target)
					timing = GameRules.GetGameTime() + 0.4 + NetChannel.GetAvgLatency(Enum.Flow.MAX_FLOWS)
					target = nil
				end
			else
				local target = BirgaMemof.NeedNPCFor_culling_blade(culling_blade,Ability.GetCastRange(culling_blade))
				if target then
					Ability.CastTarget(culling_blade,target)
					timing = GameRules.GetGameTime() + 0.3 + NetChannel.GetAvgLatency(Enum.Flow.MAX_FLOWS)
					target = nil
				end
			end
		end
	end
end

function BirgaMemof.NeedNPCFor_culling_blade(ult,distance)
	for _,npc in pairs(Heroes.GetAll()) do
		if npc and Entity.IsAlive(npc) and not NPC.IsIllusion(npc) and not Entity.IsSameTeam(Heroes.GetLocal(),npc) and Entity.GetAbsOrigin(npc):Distance(Entity.GetAbsOrigin(Heroes.GetLocal())):Length2D() <= distance+25 then
			if Entity.GetHealth(npc) <= Ability.GetLevelSpecialValueFor(ult,"damage") then
				return npc
			end
		end
	end
	return nil
end

function BirgaMemof.TechisSuicide(mynpc)
	for _,npc in pairs(Heroes.GetAll()) do
		if npc and Entity.IsAlive(npc) and not NPC.IsIllusion(npc) and NPC.GetUnitName(npc) == "npc_dota_hero_techies" and Entity.GetAbsOrigin(npc):GetZ() > 550 then
			if Entity.GetAbsOrigin(npc):Distance(Entity.GetAbsOrigin(mynpc)):Length2D() < 2000 then
				local pos1 = Entity.GetAbsOrigin(npc)
				local pos2 = Entity.GetAbsOrigin(npc)
				local pos3 = Entity.GetAbsOrigin(mynpc)
				pos1:SetZ(0)
				pos3:SetZ(0)
				return pos2 + ((pos3 - pos1):Normalized()):Scaled(1500 + 24)
			end
		end
	end
	return nil
end

function BirgaMemof.ReturnTryEnemy(npchero,target)
	for _,npc in pairs(Heroes.InRadius(Entity.GetAbsOrigin(npchero),900,Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_ENEMY)) do
		if npc and Entity.IsAlive(npc) and not NPC.IsIllusion(npc) and npc == target then
			return true
		end
	end
	return false
end

function BirgaMemof.FindTarget(npchero)
	local target = nil
	local distance = 999999
	local hptarget = 999999
	for _,npc in pairs(Heroes.InRadius(CenterMap,1500,Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_ENEMY)) do
		if npc and Entity.IsAlive(npc) and not NPC.IsIllusion(npc) and NPC.IsPositionInRange(npchero,Entity.GetAbsOrigin(npc),900) then
			if Entity.GetHealth(npc) < hptarget and Entity.GetAbsOrigin(npchero):Distance(Entity.GetAbsOrigin(npc)):Length2D() < distance then
				target = npc
				distance = Entity.GetAbsOrigin(npchero):Distance(Entity.GetAbsOrigin(npc)):Length2D()
				hptarget = Entity.GetHealth(npc)
			end
		end
	end
	return target
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
	if GameRules.GetGameMode() ~= 15 then return end
	if GameRules.GetGameState() == 2 then
		if Menu.GetValue(BirgaMemof.AutoPick) == 0 then 
			return 
		elseif Menu.GetValue(BirgaMemof.AutoPick) == 1 then 
			Engine.ExecuteCommand("dota_select_hero npc_dota_hero_skeleton_king")
		elseif Menu.GetValue(BirgaMemof.AutoPick) == 2 then 
			Engine.ExecuteCommand("dota_select_hero npc_dota_hero_meepo")
		elseif Menu.GetValue(BirgaMemof.AutoPick) == 3 then 
			Engine.ExecuteCommand("dota_select_hero npc_dota_hero_axe")
		end
	end
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