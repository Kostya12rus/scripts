local SiltbreakerHelp = {}

SiltbreakerHelp.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.BOLD)

local lycan_claw = 0
local lycan_claw_pos = 0
local lycan_claw_rot = 0
local omni_heal = 0
local axe_time = {}
local axe_posit = {}
local axe_rotate ={}
local animation_stat = {}
local size_x, size_y = Renderer.GetScreenSize()

function SiltbreakerHelp.OnGameStart()
	lycan_claw = 0
	lycan_claw_pos = 0
	lycan_claw_rot = 0
	omni_heal = 0
	axe_time = {}
	axe_posit = {}
	axe_rotate ={}
	animation_stat = {}
	size_x, size_y = Renderer.GetScreenSize()
end

function DrawCircle(UnitPos, radius)
	local x1, y1 = Renderer.WorldToScreen(UnitPos)
	if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
		local x4, y4, x3, y3, visible3
		local dergee = 30	
		for angle = 0, 360 / dergee do
			x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
			y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
			x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
			Renderer.DrawLine(x1,y1,x3,y3)
			x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
		end
	end
end

function DrawSquare(UnitPos, rotate, lenght, hight, lenght_sec, hight_sec)
	local x4, y4, x3, y3, x5, y5, x, y, x1, y1
	x4 = hight * math.cos((rotate + 90) / 57.3) - 0 * math.sin((rotate + 90) / 57.3)
	y4 = 0 * math.cos((rotate + 90) / 57.3) + hight * math.sin((rotate + 90) / 57.3)
	x3, y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
	x1, y1 = Renderer.WorldToScreen(UnitPos)
	Renderer.DrawLine(x1, y1, x3, y3)
	for i = 1, lenght_sec do
		x5 = lenght / lenght_sec * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
		y5 = 0 * math.cos(rotate / 57.3) + lenght / lenght_sec * math.sin(rotate / 57.3)
		x, y = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0) + Vector(x5, y5, 0):__mul(Vector(i, i, 0)))
		Renderer.DrawLine(x, y, x3, y3)
	end
	x4 = hight * math.cos((rotate + 90) / 57.3) - 0 * math.sin((rotate + 90) / 57.3)
	y4 = 0 * math.cos((rotate + 90) / 57.3) + hight * math.sin((rotate + 90) / 57.3)
	x = lenght * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
	y = 0 * math.cos(rotate / 57.3) + lenght  * math.sin(rotate / 57.3)
	x3, y3 = Renderer.WorldToScreen(UnitPos + Vector(x4, y4, 0) + Vector(x, y, 0))
	x1, y1 = Renderer.WorldToScreen(UnitPos+ Vector(x, y, 0))
	Renderer.DrawLine(x1, y1, x3, y3)
	
	x4 = hight * math.cos((rotate - 90) / 57.3) - 0 * math.sin((rotate - 90) / 57.3)
	y4 = 0 * math.cos((rotate - 90)/ 57.3) + hight * math.sin((rotate - 90) / 57.3)
	x3, y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
	x1, y1 = Renderer.WorldToScreen(UnitPos)
	Renderer.DrawLine(x1, y1, x3, y3)
	for i = 1, lenght_sec do
		x5 = lenght / lenght_sec * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
		y5 = 0 * math.cos(rotate / 57.3) + lenght / lenght_sec * math.sin(rotate / 57.3)
		x, y = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0) + Vector(x5, y5, 0):__mul(Vector(i, i, 0)))
		Renderer.DrawLine(x, y, x3, y3)
	end
	x4 = hight * math.cos((rotate - 90) / 57.3) - 0 * math.sin((rotate - 90) / 57.3)
	y4 = 0 * math.cos((rotate - 90) / 57.3) + hight * math.sin((rotate - 90) / 57.3)
	x = lenght * math.cos(rotate / 57.3) - 0 * math.sin(rotate / 57.3)
	y = 0 * math.cos(rotate / 57.3) + lenght  * math.sin(rotate / 57.3)
	x3, y3 = Renderer.WorldToScreen(UnitPos + Vector(x4, y4, 0) + Vector(x, y, 0))
	x1, y1 = Renderer.WorldToScreen(UnitPos+ Vector(x, y, 0))
	Renderer.DrawLine(x1, y1, x3, y3)
end

function SiltbreakerHelp.OnDraw()
	-- Log.Write(NPC.GetUnitName(Input.GetNearestUnitToCursor(0, 0)))
	-- for i, v in pairs(NPC.GetModifiers(Input.GetNearestUnitToCursor(0, 0))) do
		-- Log.Write(Modifier.GetName(v))
	-- end
	for i = 0, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if Entity.IsAlive(Unit) then
			-- local x, y, visible = Renderer.WorldToScreen(UnitPos)
			-- if visible and NPC.GetUnitName(Unit) ~= nil then
				-- Renderer.SetDrawColor(255, 255, 255, 255)
				-- Renderer.DrawText(SiltbreakerHelp.font, x, y, NPC.GetUnitName(Unit), 0)
			-- end
			if NPC.GetUnitName(Unit) == "npc_dota_rescue_cage" then
				Renderer.SetDrawColor(0, 255, 0, 255)
				DrawCircle(UnitPos, 250)
			end
			if NPC.GetUnitName(Unit) == "npc_dota_radiant_soldier" then
				Renderer.SetDrawColor(100, 100, 0, 255)
				DrawCircle(UnitPos, 250)
			end
			if NPC.GetUnitName(Unit) == "npc_dota_crate" then
				Renderer.SetDrawColor(255, 255, 15, 255)
				DrawCircle(UnitPos, 50)
			end
			if NPC.GetUnitName(Unit) == "npc_treasure_chest" then
				Renderer.SetDrawColor(255, 100, 15, 255)
				DrawCircle(UnitPos, 50)
			end
			if NPC.GetUnitName(Unit) == "npc_dota_creature_kidnap_spider" then
				Renderer.SetDrawColor(100, 255, 0, 255)
				DrawCircle(UnitPos, 200)
			end
			if NPC.GetUnitName(Unit) == "npc_dota_creature_lycan_boss" then
				if NPC.GetAbilityByIndex(Unit, 3) ~= nil and Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(Unit, 3)) then
					if GameRules.GetGameTime() - lycan_claw > 0.1 then
						lycan_claw = GameRules.GetGameTime()
						lycan_claw_pos = Entity.GetAbsOrigin(Unit)
						lycan_claw_rot = Entity.GetAbsRotation(Unit):GetYaw()
					end
					if GameRules.GetGameTime() - lycan_claw < 0.1 then
						Renderer.SetDrawColor(255, 255, 255, 255)
						DrawSquare(lycan_claw_pos, lycan_claw_rot, 440, 200, 2, 0)
					end
				end
				if NPC.GetAbilityByIndex(Unit, 2) ~= nil and Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(Unit, 2)) then
					if GameRules.GetGameTime() - lycan_claw > 0.1 then
						lycan_claw = GameRules.GetGameTime()
						lycan_claw_pos = Entity.GetAbsOrigin(Unit)
						lycan_claw_rot = Entity.GetAbsRotation(Unit):GetYaw()
					end
					if GameRules.GetGameTime() - lycan_claw < 0.1 then
						Renderer.SetDrawColor(255, 255, 255, 255)
						DrawSquare(lycan_claw_pos, lycan_claw_rot, 1000, 200, 2, 0)
					end
				end
			end
			if NPC.GetUnitName(Unit) == "npc_dota_creature_temple_guardian" then
				if omni_heal == 1 then
					omni_heal = 0
					Renderer.SetDrawColor(255, 255, 0, 255)
					DrawCircle(UnitPos, 300)
				end
				if Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(Unit, 0)) then
					omni_heal = 1
				end
				if Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(Unit, 1)) then
					if axe_time[Entity.GetIndex(Unit)] == nil or GameRules.GetGameTime() - axe_time[Entity.GetIndex(Unit)] > 0.1 then
						axe_time[Entity.GetIndex(Unit)] = GameRules.GetGameTime()
						axe_posit[Entity.GetIndex(Unit)] = Entity.GetAbsOrigin(Unit)
						axe_rotate[Entity.GetIndex(Unit)] = Entity.GetAbsRotation(Unit):GetYaw()
					end
				end
				if axe_time[Entity.GetIndex(Unit)] ~= nil and GameRules.GetGameTime() - axe_time[Entity.GetIndex(Unit)] < 0.1 then
					Renderer.SetDrawColor(255, 255, 255, 255)
					DrawSquare(axe_posit[Entity.GetIndex(Unit)], axe_rotate[Entity.GetIndex(Unit)], 1200, 200, 2, 0)
				end
			end
			if NPC.GetUnitName(Unit) == "npc_dota_creature_bat_spitter" then
				if NPC.GetAbilityByIndex(Unit, 0) ~= nil and Ability.GetCooldownTimeLeft(NPC.GetAbilityByIndex(Unit, 0)) ~= 0 then
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(SiltbreakerHelp.font, x, y, math.floor(Ability.GetCooldownTimeLeft(NPC.GetAbilityByIndex(Unit, 0)) * 10) / 10, 0)
					end
				end
			end
			if NPC.GetUnitName(Unit) == "npc_dota_creature_dire_hound_boss" then
				if NPC.GetAbilityByIndex(Unit, 0) ~= nil and Ability.GetCooldownTimeLeft(NPC.GetAbilityByIndex(Unit, 0)) ~= 0 then
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(SiltbreakerHelp.font, x, y, math.floor(Ability.GetCooldownTimeLeft(NPC.GetAbilityByIndex(Unit, 0)) * 10) / 10, 0)
					end
				end
			end
			if NPC.GetUnitName(Unit) == "npc_dota_creature_hellbear" then
				if NPC.GetAbilityByIndex(Unit, 0) ~= nil and Ability.GetCooldownTimeLeft(NPC.GetAbilityByIndex(Unit, 0)) ~= 0 then
					local x, y, visible = Renderer.WorldToScreen(UnitPos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawText(SiltbreakerHelp.font, x, y, math.floor(Ability.GetCooldownTimeLeft(NPC.GetAbilityByIndex(Unit, 0)) * 10) / 10, 0)
					end
				end
				if NPC.GetAbilityByIndex(Unit, 0) ~= nil and Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(Unit, 0)) then
					Renderer.SetDrawColor(255, 100, 0, 255)
					DrawCircle(UnitPos, 275)
				end
			end
			
			if NPC.GetUnitName(Unit) == "npc_dota_creature_ogre_tank_boss" then
				Renderer.SetDrawColor(100, 100, 0, 255)
				DrawCircle(UnitPos, 583)
			end
			
			if NPC.GetModifier(Unit, "modifier_ability_journal_note") ~= nil then
				Renderer.SetDrawColor(50, 50, 255, 255)
				DrawCircle(UnitPos, 50)
			end
			
			if NPC.GetUnitName(Unit) == "npc_dota_thinker" and NPC.GetUnitName(Entity.GetOwner(Unit)) ~= "" then --thinker
				--Log.Write(NPC.GetUnitName(Entity.GetOwner(Unit)))
				if NPC.GetUnitName(Entity.GetOwner(Unit)) == "npc_dota_creature_temple_guardian" then
					if animation_stat[Entity.GetIndex(Entity.GetOwner(Unit))] == 6 then
						Renderer.SetDrawColor(255, 100, 0, 100)
						DrawCircle(UnitPos, 250)
					elseif animation_stat[Entity.GetIndex(Entity.GetOwner(Unit))] == 7 then
						Renderer.SetDrawColor(255, 255, 255, 100)
						DrawCircle(UnitPos, 300)
					end
				end
				if NPC.GetUnitName(Entity.GetOwner(Unit)) == "npc_dota_creature_bat_spitter" then
					Renderer.SetDrawColor(255, 255, 0, 100)
					DrawCircle(UnitPos, 340)
				end
				if NPC.GetUnitName(Entity.GetOwner(Unit)) == "npc_dota_creature_ogre_tank_boss" then
					local range = 270
					if animation_stat[Entity.GetIndex(Entity.GetOwner(Unit))] == 1 then
						Renderer.SetDrawColor(255, 100, 0, 100)
						range = 270
					elseif animation_stat[Entity.GetIndex(Entity.GetOwner(Unit))] == 2 then
						Renderer.SetDrawColor(255, 0, 0, 100)
						range = 400
					end
					DrawCircle(UnitPos, range)
				end
				if NPC.GetUnitName(Entity.GetOwner(Unit)) == "npc_dota_creature_ogre_tank" then
					local range = 200
					if animation_stat[Entity.GetIndex(Entity.GetOwner(Unit))] == 1 then
						Renderer.SetDrawColor(255, 100, 0, 100)
						range = 200
					elseif animation_stat[Entity.GetIndex(Entity.GetOwner(Unit))] == 2 then
						Renderer.SetDrawColor(255, 0, 0, 100)
						range = 290
					end
					DrawCircle(UnitPos, range)
				end
				if NPC.GetUnitName(Entity.GetOwner(Unit)) == "npc_dota_creature_ogre_seer" then
					Renderer.SetDrawColor(0, 255, 255, 100)
					DrawCircle(UnitPos, 275)
				end
				if NPC.GetUnitName(Entity.GetOwner(Unit)) == "npc_dota_creature_ogre_magi" then
					Renderer.SetDrawColor(0, 255, 255, 100)
					DrawCircle(UnitPos, 275)
				end
			end
		end
	end
end

function SiltbreakerHelp.OnUnitAnimation(animation)
	-- if NPC.GetUnitName(animation.unit) == "npc_dota_creature_lycan_boss" then
		-- Log.Write(animation.sequenceName)
	-- end
	if animation.sequenceName == "PVE_attack1" then --1
		animation_stat[Entity.GetIndex(animation.unit)] = 1
	elseif animation.sequenceName == "PVE_attack2_jump" then --2
		animation_stat[Entity.GetIndex(animation.unit)] = 2
	elseif animation.sequenceName == "n_creep_furbolg_disrupter_clap" then --3
		animation_stat[Entity.GetIndex(animation.unit)] = 3
	elseif animation.sequenceName == "horizontal_swing" then --4
		animation_stat[Entity.GetIndex(animation.unit)] = 4
	elseif animation.sequenceName == "cast_purification_anim" then --5
		animation_stat[Entity.GetIndex(animation.unit)] = 5
	elseif animation.sequenceName == "hammer_smash" then --6
		animation_stat[Entity.GetIndex(animation.unit)] = 6
	elseif animation.sequenceName == "cast_guardianAngel_anim" then --7
		animation_stat[Entity.GetIndex(animation.unit)] = 7
	else 
		animation_stat[Entity.GetIndex(animation.unit)] = 0
	end
	
end

return SiltbreakerHelp