local DisPos = {}

DisPos.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
DisPos.Enable = Menu.AddOption({ "Hero Specific", "Disruptor" }, "Enable track pos{{DisPos}}", "Enable v0.1")
DisPos.optionKey = Menu.AddKeyOption({ "Hero Specific", "Disruptor", }, "Visible toggle key", Enum.ButtonCode.KEY_T)
DisPos.Mode = Menu.AddOption({ "Hero Specific", "Disruptor" }, "Show trace", "mode")

local pos = {}
local enabled = false
local switch_time = 0
local time = 4

function DisPos.OnGameStart()
	pos = {}
	enabled = false
	switch_time = 0
end

function DisPos.DrawCircle(UnitPos, radius)
	local x1, y1 = Renderer.WorldToScreen(UnitPos)
	local x4, y4, x3, y3, visible3
	local dergee = Config.ReadInt("TechiesHUD", "Circle res", 20)
	for angle = 0, 360 / dergee do
		x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
		y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
		x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
		Renderer.DrawLine(x1,y1,x3,y3)
		x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
	end
end

function DisPos.DrawTrace(Index)
	local last_pos
	for i = 0, time, 0.1 do
		if pos[Index][math.floor(GameRules.GetGameTime() * 10) / 10 - time + i] then
			last_pos = pos[Index][math.floor(GameRules.GetGameTime() * 10) / 10 - time + i]
			break
		end
	end
	if not last_pos then
		return
	end
	local x, y = Renderer.WorldToScreen(last_pos)
	for i = 0.1, time, 0.1 do
		if pos[Index][math.floor(GameRules.GetGameTime() * 10) / 10 - time + i] ~= nil then
			local x1, y1 = Renderer.WorldToScreen(pos[Index][math.floor(GameRules.GetGameTime() * 10) / 10 - time + i])
			Renderer.DrawLine(x, y, x1, y1)
			x, y = x1, y1
		end
	end	
end

function DisPos.OnDraw()

	if not Menu.IsEnabled(DisPos.Enable) then
		return
	end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end
	
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_disruptor" then
		return
	end
	if GameRules.GetGameTime() - switch_time < 0.5 then
		local x, y = Input.GetCursorPos()
		Renderer.SetDrawColor(255, 255, 255, 255)
		if enabled then
			Renderer.DrawText(DisPos.font, x - 20, y - 20, "on", 0)
		else 
			Renderer.DrawText(DisPos.font, x - 20, y - 20, "off", 0)
		end
	end
	for i = 1, NPCs.Count() do
		local Unit = NPCs.Get(i)
		local UnitPos = Entity.GetAbsOrigin(Unit)
		if  Entity.IsHero(Unit)
		and Entity.GetTeamNum(Unit) ~= Entity.GetTeamNum(myHero)
		and not NPC.IsIllusion(Unit)
		then
			if pos[Entity.GetIndex(Unit)] == nil then
				pos[Entity.GetIndex(Unit)] = {}
			end
			if GameRules.GetGameTime() - Hero.GetRespawnTime(Unit) < 0 then
				pos[Entity.GetIndex(Unit)][math.floor(GameRules.GetGameTime() * 10) / 10] = pos[Entity.GetIndex(Unit)][math.floor((GameRules.GetGameTime() - 0.1) * 10) / 10]
			else
				if not Entity.IsDormant(Unit) then
					pos[Entity.GetIndex(Unit)][math.floor(GameRules.GetGameTime() * 10) / 10] = UnitPos
				end
			end
			if enabled then
				if Menu.IsEnabled(DisPos.Mode) then
					DisPos.DrawTrace(Entity.GetIndex(Unit))
				end
				local last_pos = pos[Entity.GetIndex(Unit)][math.floor(GameRules.GetGameTime() * 10) / 10 - time]
				if last_pos ~= nil then
					local x, y, visible = Renderer.WorldToScreen(last_pos)
					if visible then
						Renderer.SetDrawColor(255, 255, 255, 255)
						DisPos.DrawCircle(last_pos, 48)
						Renderer.DrawTextCentered(DisPos.font, x, y, string.sub(NPC.GetUnitName(Unit), 15), 0)
					end
				end
			end
		end
	end
end

function DisPos.OnUpdate()
	if not Menu.IsEnabled(DisPos.Enable) then
		return
	end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end

	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_disruptor" then
		return
	end

	if Menu.IsKeyDownOnce(DisPos.optionKey) then
		enabled = not enabled
		switch_time = GameRules.GetGameTime()
	end
end
return DisPos