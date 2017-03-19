local PudgeExtended = {}
PudgeExtended.RotEnabled = Menu.AddOption({ "Hero Specific", "Pudge", "Extended", "Rot farm" }, "Enabled", "Try to deny creep with Rot")
PudgeExtended.RotHP = Menu.AddOption({ "Hero Specific", "Pudge", "Extended", "Rot farm" }, "HP Threshold", "Use only when HP more than", 0, 1000, 50)
PudgeExtended.DisableRot = false
PudgeExtended.HookKey = Menu.AddKeyOption({ "Hero Specific", "Pudge", "Extended" }, "Another Hook", Enum.ButtonCode.KEY_H)
PudgeExtended.Scary = Menu.AddKeyOption({ "Hero Specific", "Pudge", "Extended" }, "Fake Hook", Enum.ButtonCode.KEY_D)
PudgeExtended.Suicide = Menu.AddOption({ "Hero Specific", "Pudge", "Extended" }, "Suicide", "Trying to commit suicide")
PudgeExtended.Helper = Menu.AddOption({ "Hero Specific", "Pudge", "Extended" }, "Hook Helper", "Drawing a point where hero will be")


PudgeExtended.CastPosition = nil
PudgeExtended.OldPosition = nil
PudgeExtended.StartCast = false
PudgeExtended.Font = Renderer.LoadFont("Tahoma", 40, Enum.FontWeight.EXTRABOLD)

PudgeExtended.CurrentTime = 0
PudgeExtended.NextTime = {}
PudgeExtended.NextTime["scary"] = 0
PudgeExtended.NextTime["another"] = 0
PudgeExtended.NextTime["rot"] = 0

PudgeExtended.CanselAnimation = false
PudgeExtended.NeedInitialize = false

local Pudge = {}
Pudge.Hero = nil
Pudge.Rot = nil
Pudge.Hook = nil
Pudge.HP = 0


function PudgeExtended.Initialize()
	Pudge.Hero = Heroes.GetLocal()
	Pudge.Hook = NPC.GetAbilityByIndex(Pudge.Hero, 0)	
	Pudge.Rot = NPC.GetAbilityByIndex(Pudge.Hero, 1)	
	PudgeExtended.NeedInitialize = false
end

function PudgeExtended.OnDraw()
	if Heroes.GetLocal() == nil or not Engine.IsInGame() or Pudge.Hero == nil then
        PudgeExtended.NeedInitialize = true
    end
	
	if not Menu.IsEnabled(PudgeExtended.Helper) or Pudge.Hero == nil then return true end

	for i = 1, Heroes.Count() do
		local enemy = Heroes.Get(i)
		if not Entity.IsSameTeam(Pudge.Hero, enemy) and Entity.IsAlive(enemy) then
			local speed = NPC.GetMoveSpeed(enemy)
			local angle = Entity.GetRotation(enemy)
			local angleOffset = Angle(0, 45, 0)
			angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
			local x,y,z = angle:GetVectors()
			local direction = x + y + z
			direction:SetZ(0)
			direction:Normalize()
			direction:Scale(speed)
			local pos = Entity.GetAbsOrigin(enemy)
			local xp, yp, visible = Renderer.WorldToScreen(pos + direction)
			local xz, yz = Renderer.WorldToScreen(pos)
			if visible then
				Renderer.SetDrawColor(154, 33, 47)
                Renderer.DrawFilledRect(xp - 5, yp - 5, 10, 10)
				Renderer.DrawLine(xz, yz, xp, yp)
			end
		end
	end
	
end

function PudgeExtended.OnUpdate()
	if not Engine.IsInGame() then return end
	PudgeExtended.CurrentTime = GameRules.GetGameTime()

	if	PudgeExtended.NeedInitialize
		and (GameRules.GetGameState() == 4 
		or GameRules.GetGameState() == 5)
	then
        PudgeExtended.Initialize()
    end

	if Pudge.Hero == nil then return end
	if NPC.GetUnitName(Pudge.Hero) ~= "npc_dota_hero_pudge" then return end
	Pudge.HP = Entity.GetHealth(Pudge.Hero)
	
	-- <======================================================> --
	-- Fake Hook
	if	PudgeExtended.NextTime["scary"] > 0 
		and PudgeExtended.CurrentTime > PudgeExtended.NextTime["scary"]
	then 
		Player.HoldPosition(Players.GetLocal(), Pudge.Hero, false) 
		PudgeExtended.NextTime["scary"] = 0
	end

	if Menu.IsKeyDown(PudgeExtended.Scary) and PudgeExtended.NextTime["scary"] == 0 then
		Ability.CastPosition(Pudge.Hook, Input.GetWorldCursorPos())
		PudgeExtended.NextTime["scary"] = PudgeExtended.CurrentTime + 0.3
	end
	
	-- <======================================================> --
	-- Another Hook
	if Menu.IsKeyDown(PudgeExtended.HookKey) then
		local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(Pudge.Hero), Enum.TeamType.TEAM_BOTH)
		if enemy == nil or enemy == Pudge.Hero then return end 
		if PudgeExtended.StartCast then
			if PudgeExtended.CurrentTime <= PudgeExtended.NextTime["another"] then return end
			PudgeExtended.StartCast = false
			if NPC.IsPositionInRange(enemy, PudgeExtended.OldPosition, 1, 0) then
				PudgeExtended.CastPosition = PudgeExtended.OldPosition
			else
				local speed = NPC.GetMoveSpeed(enemy)
				local angle = Entity.GetRotation(enemy)
				local angleOffset = Angle(0, 45, 0)
				angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
				local x,y,z = angle:GetVectors()
				local direction = x + y + z
				direction:SetZ(0)
				direction:Normalize()
				direction:Scale(speed + 10)
				PudgeExtended.CastPosition = NPC.GetAbsOrigin(enemy) + direction
			end
			Ability.CastPosition(Pudge.Hook, PudgeExtended.CastPosition)
		else 
			PudgeExtended.StartCast = true
			PudgeExtended.OldPosition = NPC.GetAbsOrigin(enemy)
			PudgeExtended.NextTime["another"] = PudgeExtended.CurrentTime + 0.07
		end
	end
	
	-- <======================================================> --
	-- Rot farm
	if	not Ability.GetToggleState(Pudge.Rot)
		and Menu.IsEnabled(PudgeExtended.RotEnabled) 
		and Pudge.HP > Menu.GetValue(PudgeExtended.RotHP)
	then
		local rotdmg = math.floor(Ability.GetLevel(Pudge.Rot) * 30 / 7.5)
		for k, v in pairs(NPC.GetUnitsInRadius(Pudge.Hero, 250, Enum.TeamType.TEAM_ENEMY)) do
			if not NPC.IsIllusion(v) and NPC.IsKillable(v) then
			
				local hp = Entity.GetHealth(v)
				local pm = NPC.GetMagicalArmorDamageMultiplier(v)
				local fd = (rotdmg * pm)
				
				if hp < fd then
					Ability.Toggle(Pudge.Rot)
					PudgeExtended.DisableRot = true
					PudgeExtended.NextTime["rot"] = PudgeExtended.CurrentTime + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.1
				end
				
			end
		end
	else
		if PudgeExtended.DisableRot then
			if PudgeExtended.CurrentTime <= PudgeExtended.NextTime["rot"] then return end
			Ability.Toggle(Pudge.Rot)
			PudgeExtended.DisableRot = false
		end
	end
	
	-- <======================================================> --
	-- Blue whale
	if	Menu.IsEnabled(PudgeExtended.Suicide) 
		and Entity.IsAlive(Pudge.Hero)
	then
		local hpdie = math.floor(Ability.GetLevel(Pudge.Rot) * 30 / 7.5)
		local soul = NPC.GetItem(Pudge.Hero, "item_soul_ring", true)
		if	soul 
			and Ability.IsCastable(soul, NPC.GetMana(Pudge.Hero)) 
		then
			hpdie = hpdie + 150
		end		
		
		if Pudge.HP < hpdie then
			if hpdie > 100 then Ability.CastNoTarget(soul) end
			if not Ability.GetToggleState(Pudge.Rot) then Ability.Toggle(Pudge.Rot) end
		end
	end
	
end

return PudgeExtended
