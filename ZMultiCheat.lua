local MultiCheat = {}
MultiCheat.optionEnable = Menu.AddOption({"Kostya12rus","MultiCheat"}, "Activate", "")
MultiCheat.Rofl = Menu.AddOption({"Kostya12rus","MultiCheat"}, "Rofle", "")
MultiCheat.FurAndShamBlock = Menu.AddOption({"Kostya12rus","MultiCheat","FurAndShamBlock"}, "Activate", "")
MultiCheat.BlockKey = Menu.AddKeyOption({"Kostya12rus","MultiCheat","FurAndShamBlock"},"BlockKey",Enum.ButtonCode.KEY_D)
MultiCheat.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
MultiCheat.FontSkill = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)

NeedTime = 0
function MultiCheat.OnGameStart()
	NeedTime = 0
end

function MultiCheat.OnUpdate()
	if not Menu.IsEnabled(MultiCheat.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	
	if Menu.IsEnabled(MultiCheat.Rofl) then MultiCheat.RoflTime() end -- rofl evry 14 second
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_furion" then MultiCheat.Furion()
	elseif NPC.GetUnitName(myHero) == "npc_dota_hero_shadow_shaman" then MultiCheat.Shadowshaman()
	else return end
end

function MultiCheat.OnDraw()

	-- local myHero = Heroes.GetLocal()
	-- if not myHero then return end 
	-- local DrawX = 500
	-- local DrawY = 300
	-- local abilities = {}
    -- for i = 0, 24 do
        -- local ability = NPC.GetAbilityByIndex(myHero, i)
        -- if ability ~= nil and Entity.IsAbility(ability) then
            -- local DrawX = 500
			-- table.insert(abilities, ability)
			-- index_skill = Ability.GetIndex(ability)
			-- name_skill = Ability.GetName(ability)
			-- distanse_skill = Ability.GetCastRange(ability)
			-- Renderer.DrawText(MultiCheat.Font, DrawX, DrawY, i, 1)
			-- DrawX = DrawX + 100
			-- Renderer.DrawText(MultiCheat.Font, DrawX, DrawY, distanse_skill, 1)
			-- DrawX = DrawX + 50
			-- Renderer.DrawText(MultiCheat.Font, DrawX, DrawY, name_skill, 1)
			-- DrawY = DrawY + 20
        -- end
    -- end
end

function MultiCheat.Furion()
	local myHero = Heroes.GetLocal()
    local myheroPos = Entity.GetAbsOrigin(myHero)
	local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if enemy == nil then return end
    local enemyPos = Entity.GetAbsOrigin(enemy)
	local sprout = NPC.GetAbilityByIndex(myHero, 0)
	local distanse_sprout = Ability.GetCastRange(sprout)
	local callforce = NPC.GetAbilityByIndex(myHero, 2)
	local lvlcallforce = Ability.GetLevel(callforce)
	local RoA = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local mouse = Input.GetWorldCursorPos()
	if Menu.IsKeyDown(MultiCheat.BlockKey) then
		if myheroPos:Distance(enemyPos):Length2D() <= distanse_sprout then
			if lvlcallforce == 4 and Ability.IsReady(callforce) then
				if Ability.IsReady(sprout) and (NPC.GetMana(myHero) >= (Ability.GetManaCost(callforce) + Ability.GetManaCost(sprout))) then
					if RoA and Ability.IsCastable(RoA, NPC.GetMana(myHero)) then Ability.CastTarget(RoA, enemy) end
					Renderer.DrawText(MultiCheat.Font, 1000, 500, lvlcallforce, 1)
					Ability.CastTarget(sprout, enemy)
					local enemyPos = Entity.GetAbsOrigin(enemy)
					Ability.CastPosition(callforce, enemyPos)
				end
			end
		end
	end
end

function MultiCheat.Shadowshaman()
	local myHero = Heroes.GetLocal()
    local myheroPos = Entity.GetAbsOrigin(myHero)
	local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if enemy == nil then return end
    local enemyPos = Entity.GetAbsOrigin(enemy)
	local hex = NPC.GetAbilityByIndex(myHero, 1)
	local distanse_sprout = Ability.GetCastRange(hex)
	local ultemate = NPC.GetAbilityByIndex(myHero, 3)
	local RoA = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local mouse = Input.GetWorldCursorPos()
	if Menu.IsKeyDown(MultiCheat.BlockKey) then
		if myheroPos:Distance(enemyPos):Length2D() <= distanse_sprout then
			if Ability.IsReady(ultemate) then
				if Ability.IsReady(hex) and (NPC.GetMana(myHero) >= (Ability.GetManaCost(ultemate) + Ability.GetManaCost(hex))) then
					if RoA and Ability.IsCastable(RoA, NPC.GetMana(myHero)) then Ability.CastTarget(RoA, enemy) end
					Ability.CastTarget(hex, enemy)
					local enemyPos = Entity.GetAbsOrigin(enemy)
					Ability.CastPosition(ultemate, enemyPos)
				end
			end
		end
	end
end

function MultiCheat.RoflTime()
	ostime = GameRules.GetGameTime()
	if NeedTime	<= ostime then
		Engine.ExecuteCommand("say /laugh")
		NeedTime = ostime + 15
	end
end

return MultiCheat