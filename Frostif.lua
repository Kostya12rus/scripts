local Frostif = {}
Frostif.optionEnable = Menu.AddOption({"Kostya12rus", "frostif"}, "frostif", "")
Frostif.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
Frostif.fontNps = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
Frostif.key = Menu.AddKeyOption({"Kostya12rus","frostif"},"Key for ...",Enum.ButtonCode.BUTTON_CODE_NONE)

function Frostif.OnParticleCreate(particle)
	if not Heroes.GetLocal() or not Menu.IsEnabled(Frostif.optionEnable) then return end
	-- Log.Write("OnParticleCreate: index = "..tostring(particle.index)..", entity = "..NPC.GetUnitName(particle.entity)..", particleNameIndex = "..tostring(particle.particleNameIndex)
	-- ..", attachType = "..tostring(particle.attachType)..", entityForModifiers = "..tostring(particle.entityForModifiers)..", fullName = "..tostring(particle.fullName)..", name = "..tostring(particle.name))
	-- end
	partikle[particle.index] = {}
	table.insert(partikle[particle.index],particle.name)
	table.insert(partikle[particle.index],GameRules.GetGameTime())
end
function Frostif.OnParticleUpdateEntity(particle)
	if not Heroes.GetLocal() or not Menu.IsEnabled(Frostif.optionEnable) then return end
	--Log.Write("OnParticleUpdateEntity: index = "..tostring(particle.index)..", controlPoint = "..tostring(particle.controlPoint)..", entity = "..tostring(particle.entity)
	--..", attachType = "..tostring(particle.attachType)..", attachment = "..tostring(particle.attachment)..", position = "..tostring(particle.position)..", includeWearables = "..tostring(particle.includeWearables))
	partikle[particle.index][10] = particle.position
end
function Frostif.OnParticleUpdate(particle)
	if not Heroes.GetLocal() or not Menu.IsEnabled(Frostif.optionEnable) then return end
	if partikle[particle.index] then
		table.insert(partikle[particle.index],particle.position)
	end
end

function Frostif.OnParticleDestroy(particle)
	if not Heroes.GetLocal() or not Menu.IsEnabled(Frostif.optionEnable) then return end
	partikle[particle.index] = nil
end

function Frostif.OnUnitAnimation(animation)
	if not Heroes.GetLocal() or not Menu.IsEnabled(Frostif.optionEnable) then return end
	animationtable[Entity.GetIndex(animation.unit)] = {}
	table.insert(animationtable[Entity.GetIndex(animation.unit)],animation.sequenceName)
	table.insert(animationtable[Entity.GetIndex(animation.unit)],animation.unit)
	table.insert(animationtable[Entity.GetIndex(animation.unit)],GameRules.GetGameTime()+5)
end

function Frostif.OnLinearProjectileCreate(projectile)
	if not Heroes.GetLocal() or not Menu.IsEnabled(Frostif.optionEnable) then return end
	local xorig = projectile.origin:GetX()
	local xmypos = Entity.GetAbsOrigin(Heroes.GetLocal()):GetX()
	
	if projectile.name == "trap_breathe_fire" and xorig == xmypos then
		projectiless[projectile.handle] = {}
		table.insert(projectiless[projectile.handle],projectile.origin)
		table.insert(projectiless[projectile.handle],projectile.velocity)
		table.insert(projectiless[projectile.handle],GameRules.GetGameTime())
		table.insert(projectiless[projectile.handle],false)
	end
end

function Frostif.OnDraw()
    local myHero = Heroes.GetLocal()
	if not myHero or not Menu.IsEnabled(Frostif.optionEnable) then return end
	local myPos = Entity.GetAbsOrigin(myHero)
	
	if animationtable then
		for index,key in pairs(animationtable) do
			if NPC.GetUnitName(key[2]) == "npc_dota_creature_ogre_tank_boss" then
				if key[1] == "PVE_attack2_jump" then
					Frostif.DrawCircle(Entity.GetAbsOrigin(key[2]), 400)
				elseif key[1] == "PVE_attack1" then
					Frostif.DrawCircle(Frostif.PositionAngle(key[2],0,590), 240)
				end
			elseif NPC.GetUnitName(key[2]) == "npc_dota_creature_ogre_tank" then
				if key[1] == "PVE_attack2_jump" then
					Frostif.DrawCircle(Entity.GetAbsOrigin(key[2]), 240)
				elseif key[1] == "PVE_attack1" then
					Frostif.DrawCircle(Frostif.PositionAngle(key[2],0,500), 200)
				end
			end
			if key[3] <= GameRules.GetGameTime() then
				animationtable[index] = nil
			end
		end
	end
	
	for index,artic in pairs(partikle) do
		--[[
		artic[1] название
		artic[2] время
		artic[3] место старта
		artic[4] место конца\ радиус
		]]--		
		if artic[2] then
			if artic[2] + 5 <= GameRules.GetGameTime() then
				partikle[index] = nil
			end
		end
		Renderer.SetDrawColor(255, 0, 0,255)
		if artic[1] == "drow_base_attack" then
			x1,y1,vis1 = Renderer.WorldToScreen(artic[3])
			x2,y2,vis2 = Renderer.WorldToScreen(artic[4])
			if vis1 or vis2 then
				Renderer.DrawLine(x1,y1,x2,y2)
			end
			Frostif.DrawCircle(artic[4], 50)
		elseif artic[1] == "pudge_meathook" then
			x1,y1,vis1 = Renderer.WorldToScreen(artic[3])
			x2,y2,vis2 = Renderer.WorldToScreen(artic[10])
			Renderer.SetDrawColor(255,255,255,255)
			if vis1 or vis2 then
				Renderer.DrawLine(x1,y1,x2,y2)
				Renderer.DrawImage(imagePudge,x2,y2,32,32)
			end
			if artic[2]+0.1 <= GameRules.GetGameTime() then
				hook = NPC.GetAbility(myHero,"custom_pudge_meat_hook")
				if hook and Ability.IsCastable(hook,NPC.GetMana(myHero)) and Entity.IsAlive(myHero) and artic[10]:Distance(myPos):Length2D() < 1000 then
					if Menu.IsKeyDown(Frostif.key) then
						Ability.CastPosition(hook,artic[10])	
					end
				end
			end
		end
	end
	
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if Entity.IsAlive(unitNA) then
			local UnitPos = Entity.GetAbsOrigin(unitNA)
			local vector = myPos - UnitPos
			local distance = vector:Length2D()
			local x1, y1 , worldVis= Renderer.WorldToScreen(UnitPos)
			if worldVis then
				--Renderer.DrawText(Frostif.fontNps, x1-100, y1, NPC.GetUnitName(unitNA), 1)
				if NPC.GetUnitName(unitNA) == "techies_game_remote_mine" then
					Renderer.SetDrawColor(255,0,0,255)
					Frostif.DrawCircle(UnitPos, 4*math.floor(100-Entity.GetHealth(unitNA)))
					Renderer.SetDrawColor(0, 0, 255,255)
					Frostif.DrawCircle(UnitPos, 400)
				elseif NPC.GetUnitName(unitNA) == "zuus_race_land_mine" then --
					Renderer.SetDrawColor(255, 0, 0,255)
					Frostif.DrawCircle(UnitPos, 50)
				elseif NPC.GetUnitName(unitNA) == "zuus_race_stasis_trap" then
					Renderer.SetDrawColor(0, 0, 255,255)
					Frostif.DrawCircle(UnitPos, 50)
				elseif NPC.GetUnitName(unitNA) == "propulsion_mine" then
					Renderer.SetDrawColor(0, 0, 255,255)
					for i = 0,300,100 do
						Frostif.DrawCircle(UnitPos, i)
					end
				elseif NPC.GetUnitName(unitNA) == "suicidal_pudge" then
					Renderer.SetDrawColor(255, 0, 0,255)
					Frostif.DrawCircle(UnitPos, 250)
				elseif NPC.GetUnitName(unitNA) == "custom_invoker" then
					if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
						q = NPC.GetAbility(myHero,"invoker_quas_lua") 
						w = NPC.GetAbility(myHero,"invoker_wex_lua") 
						e = NPC.GetAbility(myHero,"invoker_exort_lua")
						r = NPC.GetAbility(Heroes.GetLocal(),"invoker_invoke_lua") 
						if q and w and e and Ability.IsCastable(r,NPC.GetMana(myHero)) then
							for index,ability in ipairs(Abilities.GetAll()) do
								if not Ability.IsHidden(ability) and NPC.HasAbility(unitNA,Ability.GetName(ability)) then
									if NPC.HasModifier(myHero,"modifier_invoked_spell_to_cast") and invokertik <= GameRules.GetGameTime() then
										if Ability.GetName(ability) == "invoker_leader_cold_snap" then
											Frostif.invokerCast(q,q,q)
										elseif Ability.GetName(ability) == "invoker_leader_ghost_walk" then
											Frostif.invokerCast(q,q,w)
										elseif Ability.GetName(ability) == "invoker_leader_ice_wall" then
											Frostif.invokerCast(q,q,e)
										elseif Ability.GetName(ability) == "invoker_leader_emp" then
											Frostif.invokerCast(w,w,w)
										elseif Ability.GetName(ability) == "invoker_leader_tornado" then
											Frostif.invokerCast(w,w,q)
										elseif Ability.GetName(ability) == "invoker_leader_alacrity" then
											Frostif.invokerCast(w,w,e)
										elseif Ability.GetName(ability) == "invoker_leader_sunstrike" then
											Frostif.invokerCast(e,e,e)
										elseif Ability.GetName(ability) == "invoker_leader_forge_spirit" then
											Frostif.invokerCast(e,e,q)
										elseif Ability.GetName(ability) == "invoker_leader_chaos_meteor" then
											Frostif.invokerCast(e,e,w)
										elseif Ability.GetName(ability) == "invoker_leader_deafening_blast" then
											Frostif.invokerCast(q,w,e)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if not NPC.HasModifier(myHero,"modifier_stunned_lua") then
		if NPC.GetUnitName(myHero) == "npc_dota_hero_spirit_breaker" then
			charge = NPC.GetAbility(myHero,"race_charge_lua") 
			if charge then
				Ability.CastNoTarget(charge)
				return
			end
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_weaver" then
			if Menu.IsKeyDown(Frostif.key) then
				if not NPC.HasModifier(myHero,"modifier_rupture_damage") then
					if not NPC.IsRunning(myHero) then
						NPC.MoveTo(myHero,Input.GetWorldCursorPos())
						return
					end
				else
					if weavirtick <= GameRules.GetGameTime() then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_STOP, myHero, Vector(0,0,0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
						weavirtick = GameRules.GetGameTime() + 0.05
						return
					end
				end
			end
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_templar_assassin" then
			gase = NPC.GetAbility(Heroes.GetLocal(),"refraction_lua") 
			if templartick <= GameRules.GetGameTime() then
				if Frostif.TemplarCast() then
					if not NPC.HasModifier(myHero,"modifier_refraction_lua") then
						Ability.Toggle(gase)
					end	
				else
					if NPC.HasModifier(myHero,"modifier_refraction_lua") then
						Ability.Toggle(gase)
					end
				end
				templartick = GameRules.GetGameTime() + 0.1
			end
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_drow_ranger" then
			drowshot = NPC.GetAbility(Heroes.GetLocal(),"drow_shoot_arrow_lua")
			local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
			if enemy == nil then return end
			enemypos = Entity.GetAbsOrigin(enemy)
			if enemypos:Distance(myPos):Length2D() < 500 then
				if drowshot and Ability.IsCastable(drowshot,NPC.GetMana(myHero)) then
					if not NPC.IsRunning(enemy) then
						Ability.CastPosition(drowshot,Entity.GetAbsOrigin(enemy))
					end
				end
			end
		end
	end
	
	Renderer.SetDrawColor(255,255,255,255)
	yposs = 120 
	for index,modifer in pairs(NPC.GetModifiers(myHero)) do
		Renderer.DrawText(Frostif.fontNps, 800, yposs, Modifier.GetName(modifer).."|"..math.floor(Modifier.GetDieTime(modifer) - GameRules.GetGameTime()+1), 1)
		yposs = yposs + 12
	end
	ypos = 120
	for index,ability in ipairs(Abilities.GetAll()) do
		if not Ability.IsHidden(ability) and NPC.HasAbility(myHero,Ability.GetName(ability)) then
			Renderer.DrawText(Frostif.fontNps, 500, ypos, Ability.GetName(ability), 1)
			ypos = ypos + 12
		end
	end
	 --[[ -- pudge wars custom_pudge_meat_hook -- teches mine summo place_propulsion_mine_lua detonate_propulsion_mine_lua -- furion maining  furion_teleport_lua -- enchanters dmg impetus_lua -- puck ogre war custom_puck_phase_shift -- sniper zoombbe  sniper_ground_shot_lua -- morg war custom_nether_swap -- wiwer speed shakuchi_lua -- drow aroow drow_shoot_arrow_lua -- Chain Frost Tag conjure_image_lua]]--
end

function Frostif.TemplarCast()
	local mindist = false
	
	if projectiless then
		for index,key in pairs(projectiless) do
			local t = GameRules.GetGameTime() - key[3]
			local curPos = key[1] + key[2]:Scaled(t)
			local dist = curPos:Distance(Entity.GetAbsOrigin(Heroes.GetLocal())):Length2D()
			if dist <= 200 then
				local mindist = true
			end		
			if key[3]+10 <= GameRules.GetGameTime() then
				projectiless[index] = nil
			end
		end
		return mindist
	end
end

function Frostif.invokerCast(one,two,tre)
	r = NPC.GetAbility(Heroes.GetLocal(),"invoker_invoke_lua") 
	Ability.CastNoTarget(one)
	Ability.CastNoTarget(two)
	Ability.CastNoTarget(tre)
	Ability.CastNoTarget(r)
	invokertik = GameRules.GetGameTime() + 0.2
	return
end
local size_x, size_y = Renderer.GetScreenSize()
function Frostif.DrawCircle(UnitPos, radius)
    local x1, y1 = Renderer.WorldToScreen(UnitPos)
    if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
        local x4, y4, x3, y3, visible3
        local dergee = 10
        for angle = 0, 360 / dergee do
            x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
            y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
            x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
            Renderer.DrawLine(x1,y1,x3,y3)
            x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
        end
    end
end

function Frostif.PositionAngle(nps,rotation,range)
  local angle = Entity.GetRotation(nps)
  local angleOffset = Angle(0, 45+rotation, 0)
  angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
  local x,y,z = angle:GetVectors()
  local direction = x + y + z
  direction:SetZ(0)
  direction:Normalize()
  direction:Scale(range)
  local origin = NPC.GetAbsOrigin(nps)
  NeedPos = origin + direction
  return NeedPos
end

function Frostif.init()
	imagePudge = Renderer.LoadImage("resource/flash3/images/miniheroes/pudge.png")
	timetick = 0
	weavirtick = 0
	invokertik = 0
	templartick = 0
	partikle = {}
	animationtable = {}
	projectiless = {}
end
function Frostif.OnGameStart()
	Frostif.init()
end
function Frostif.OnGameEnd()
	Frostif.init()
end
Frostif.init()
return Frostif