local MultiCheat = {}
MultiCheat.optionEnable = Menu.AddOption({"Kostya12rus","MultiCheat"}, "1 Activate", "")
MultiCheat.Rofl = Menu.AddOption({"Kostya12rus","MultiCheat"}, "2 Rofle", "")
MultiCheat.FurAndShamBlock = Menu.AddOption({"Kostya12rus","MultiCheat","3 FurAndShamBlock"}, "Activate", "")
MultiCheat.BlockKey = Menu.AddKeyOption({"Kostya12rus","MultiCheat","3 FurAndShamBlock"},"BlockKey",Enum.ButtonCode.KEY_D)
MultiCheat.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
MultiCheat.FontSkill = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
MultiCheat.imgmesad = Renderer.LoadImage("resource/flash3/images/spellicons/invoker_sun_strike.png")

NeedTime = 0
AnimTable = {}
HeroTable = {}
castpoint = {}
function MultiCheat.OnGameStart()
  NeedTime = 0
end

function MultiCheat.OnUnitAnimation(animation)
    if #AnimTable >= 10 then
        for j=1,9 do
            AnimTable[j] = AnimTable[j + 1] 
            HeroTable[j] = HeroTable[j + 1] 
            castpoint[j] = castpoint[j + 1] 
        end
        table.remove(AnimTable)
        table.remove(HeroTable)
        table.remove(castpoint)
    end
    table.insert(AnimTable, animation.sequenceName)
    table.insert(HeroTable, NPC.GetUnitName(animation.unit))
    table.insert(castpoint, animation.playbackRate)
end
function MultiCheat.OnDraw()
	MultiCheat.test()
    -- if AnimTable ~= nil then
        -- xpos = 100
        -- for i = 1, #AnimTable do
            -- anim = AnimTable[i]
            -- hero = HeroTable[i]
            -- castpointasda = castpoint[i]
            -- Renderer.DrawText(MultiCheat.Font, 500, xpos, hero, 1)
            -- Renderer.DrawText(MultiCheat.Font, 1000, xpos, anim, 1)
            -- Renderer.DrawText(MultiCheat.Font, 1500, xpos, castpointasda, 1)
            -- xpos = xpos + 20
        -- end
    -- end
    
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
        -- DrawX = DrawX + 50
        -- Renderer.DrawText(MultiCheat.Font, DrawX, DrawY, name_skill, 1)
        -- DrawY = DrawY + 20
      -- end
  -- end
end

function MultiCheat.OnUpdate()
  if not Menu.IsEnabled(MultiCheat.optionEnable) then return end
  local myHero = Heroes.GetLocal()
  if not myHero then return end 
  
  if Menu.IsEnabled(MultiCheat.Rofl) and Entity.IsAlive(myHero) then MultiCheat.RoflTime() end -- rofl evry 15 second
  
  if NPC.GetUnitName(myHero) == "npc_dota_hero_furion" then MultiCheat.Furion()
  elseif NPC.GetUnitName(myHero) == "npc_dota_hero_shadow_shaman" then MultiCheat.Shadowshaman()
  else return end
end

function MultiCheat.test()
	-- local size_x, size_y = Renderer.GetScreenSize() --team 2
	-- local nedx = math.floor(size_x/3+11)
	-- local Nedy = 45
	-- local gorizont = 60
	-- local vertical = gorizont
	-- Renderer.DrawFilledRect(nedx, Nedy, gorizont, vertical)
	-- local nedx = nedx + 63
	-- Renderer.DrawFilledRect(nedx, Nedy, gorizont, vertical)
	-- local nedx = nedx + 63
	-- Renderer.DrawFilledRect(nedx, Nedy, gorizont, vertical)
	-- local nedx = nedx + 63
	-- Renderer.DrawFilledRect(nedx, Nedy, gorizont, vertical)
	-- local nedx = nedx + 63
	-- Renderer.DrawFilledRect(nedx, Nedy, gorizont, vertical)
	
	
	-- local size_x2, size_y2 = Renderer.GetScreenSize()
	-- local nedx2 = math.floor(size_x/1.85)
	-- local Nedy2 = 45
	-- Renderer.DrawFilledRect(nedx2, Nedy2, gorizont, vertical)
	-- local nedx2 = nedx2 + 63
	-- Renderer.DrawFilledRect(nedx2, Nedy2, gorizont, vertical)
	-- local nedx2 = nedx2 + 63
	-- Renderer.DrawFilledRect(nedx2, Nedy2, gorizont, vertical)
	-- local nedx2 = nedx2 + 63
	-- Renderer.DrawFilledRect(nedx2, Nedy2, gorizont, vertical)
	-- local nedx2 = nedx2 + 63
	-- Renderer.DrawFilledRect(nedx2, Nedy2, gorizont, vertical)
	-- nesadx=1000
	-- safafy=100
	-- for i = 1, NPCs.Count() do
		-- local entity = NPCs.Get(i) 
		-- if entity and Entity.IsHero(entity) then
			-- local name = NPC.GetUnitName(entity)
			-- local playid = (Hero.GetPlayerID(entity)-4)
			-- Renderer.DrawText(MultiCheat.Font, (nesadx + 50), safafy, name, 1)
			-- Renderer.DrawText(MultiCheat.Font, nesadx, safafy, playid, 1)
			-- safafy = safafy + 20
		-- end 
	-- end
end

function MultiCheat.Furion()
  local myHero = Heroes.GetLocal()
  local myheroPos = Entity.GetAbsOrigin(myHero)
  local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  if enemy == nil then return end
  local enemyPos = Entity.GetAbsOrigin(enemy)
  local MyAndEnemyDistanse = myheroPos:Distance(enemyPos):Length2D()
  local trees = Trees.InRadius(enemyPos, 375, true)
  local sprout = NPC.GetAbilityByIndex(myHero, 0)
  local distanse_sprout = Ability.GetCastRange(sprout)
  local callforce = NPC.GetAbilityByIndex(myHero, 2)
  local lvlcallforce = Ability.GetLevel(callforce)
  local RodOfAtos = NPC.GetItem(myHero, "item_rod_of_atos", true)
  local nnneeedmanna = 0
  if Ability.IsReady(callforce) then
    nnneeedmanna = nnneeedmanna + Ability.GetManaCost(callforce)
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then
      nnneeedmanna = nnneeedmanna + Ability.GetManaCost(RodOfAtos)
      if Ability.IsReady(sprout) then
        nnneeedmanna = nnneeedmanna + Ability.GetManaCost(sprout)
      end
    elseif Ability.IsReady(sprout) then
      nnneeedmanna = nnneeedmanna + Ability.GetManaCost(sprout)
    end
  end
  if Menu.IsKeyDown(MultiCheat.BlockKey) and MyAndEnemyDistanse <= distanse_sprout and Ability.IsReady(callforce) and lvlcallforce == 4 and NPC.GetMana(myHero) >= nnneeedmanna then
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then Ability.CastTarget(RodOfAtos, enemy) end
    if Ability.IsReady(sprout) and #trees < 5 then
        Ability.CastTarget(sprout, enemy)
    end
    if #trees >= 5 or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then
      if Ability.GetCooldown(RodOfAtos) <= 15 then
        Ability.CastPosition(callforce, enemyPos)
      elseif not RodOfAtos then
        Ability.CastPosition(callforce, enemyPos)
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
  local MyAndEnemyDistanse = myheroPos:Distance(enemyPos):Length2D()
  local voodoo = NPC.GetAbilityByIndex(myHero, 1)
  local distanse_voodoo = Ability.GetCastRange(voodoo)
  local Serpent_Ward = NPC.GetAbilityByIndex(myHero, 3)
  local RodOfAtos = NPC.GetItem(myHero, "item_rod_of_atos", true)
  local nnneeedmanna = 0
  if Ability.IsReady(Serpent_Ward) then
    nnneeedmanna = nnneeedmanna + Ability.GetManaCost(Serpent_Ward)
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then
      nnneeedmanna = nnneeedmanna + Ability.GetManaCost(RodOfAtos)
      if Ability.IsReady(voodoo) then
        nnneeedmanna = nnneeedmanna + Ability.GetManaCost(voodoo)
      end
    elseif Ability.IsReady(voodoo) then
      nnneeedmanna = nnneeedmanna + Ability.GetManaCost(voodoo)
    end
  end
  if Menu.IsKeyDown(MultiCheat.BlockKey) and MyAndEnemyDistanse <= distanse_voodoo and Ability.IsReady(Serpent_Ward) and NPC.GetMana(myHero) >= nnneeedmanna then
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then Ability.CastTarget(RodOfAtos, enemy) end
    if Ability.IsReady(voodoo) then
      Ability.CastTarget(voodoo, enemy)
    end
    if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
      Ability.CastPosition(Serpent_Ward, enemyPos)
    end
  end
end

function MultiCheat.RoflTime()
  ostime = GameRules.GetGameTime()
  if NeedTime  <= ostime then
    Engine.ExecuteCommand("say /laugh")
    NeedTime = ostime + 15
  end
end
return MultiCheat