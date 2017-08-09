-- AutoIo by unknown
-- 

local AutoIo = {}


AutoIo.AutoDefensiveItems = Menu.AddOption({"Hero Specific", "Io"}, "Auto Use Defensive Items", "")
AutoIo.AutoOffensiveItems = Menu.AddOption({"Hero Specific", "Io"}, "Auto Use Offensive Items", "")
AutoIo.BlackKingBarDuringCombo = Menu.AddOption({"Hero Specific", "Io"}, "Auto Use Black King Bar During Combo", "")
AutoIo.AutoTetherKey = Menu.AddKeyOption({"Hero Specific", "Io"}, "Auto Tether Mode (Toggle)", Enum.ButtonCode.KEY_T)
AutoIo.AttackKey = Menu.AddKeyOption({"Hero Specific", "Io"}, "Attack Enemy", Enum.ButtonCode.KEY_SPACE)
--AutoIo.AlternativeAttackKey = Menu.AddKeyOption({"Hero Specific", "Io"}, "Alternative Attack Enemy", Enum.ButtonCode.KEY_F)
--AutoIo.Blink = Menu.AddOption({ "Hero Specific", "Io" }, "Use Blink with Attack Enemy", "")
AutoIo.Font = Renderer.LoadFont("Tahoma", 24, Enum.FontWeight.EXTRABOLD)

AutoIo.DrawAttackRangeTime = 0
AutoIo.MoveOrderTime = 0
AutoIo.AttackOrderTime = 0
AutoIo.TimeToFace = 0
AutoIo.inAutoTetherMode = false
AutoIo.OverchargeToggleTime = 0
AutoIo.OverchargeToggledOnAutomatically = false

AutoIo.ProjectileTime = 0
AutoIo.ItemUseTime = 0
AutoIo.HeroAbilityUseTime = 0
AutoIo.UnitAbilityUseTime = 0
AutoIo.Delay = .05
AutoIo.StunTime = 0
AutoIo.StunDuration = 0
AutoIo.FarmManaThreshold = 0.35
AutoIo.CircleDrawTime = 0
AutoIo.OrbWalkTime = 0
AutoIo.CheckDeadTime = 0 
AutoIo.MoveNPCOrderTime = 0
AutoIo.AttackNPCOrderTime = 0
AutoIo.ReadyToInvisTime = nil
AutoIo.NeutralToBuffWithOgre = nil
AutoIo.HeroToBuffWithPriest = nil
AutoIo.HeroToBuffWithOgre = nil
AutoIo.HeroToBuffWithLizard = nil

function AutoIo.OnGameStart()
  AutoIo.DrawAttackRangeTime = 0
  AutoIo.MoveOrderTime = 0
  AutoIo.AttackOrderTime = 0
  AutoIo.TimeToFace = 0
  AutoIo.inAutoTetherMode = false
  AutoIo.OverchargeToggleTime = 0
  AutoIo.OverchargeToggledOnAutomatically = false

  AutoIo.ProjectileTime = 0
  AutoIo.ItemUseTime = 0
  AutoIo.HeroAbilityUseTime = 0
  AutoIo.UnitAbilityUseTime = 0
  AutoIo.Delay = .05
  AutoIo.StunTime = 0
  AutoIo.StunDuration = 0
  AutoIo.FarmManaThreshold = 0.35
  AutoIo.CircleDrawTime = 0
  AutoIo.OrbWalkTime = 0
  AutoIo.CheckDeadTime = 0 
  AutoIo.MoveNPCOrderTime = 0
  AutoIo.AttackNPCOrderTime = 0
  AutoIo.ReadyToInvisTime = nil
  AutoIo.NeutralToBuffWithOgre = nil
  AutoIo.HeroToBuffWithPriest = nil
  AutoIo.HeroToBuffWithOgre = nil
  AutoIo.HeroToBuffWithLizard = nil
end

-- auto use soul ring before casting spells or items if more than 70% hp
function AutoIo.OnPrepareUnitOrders(orders)
  if not orders or not orders.ability then return true end
  if not Entity.IsAbility(orders.ability) then return true end
  if Ability.GetManaCost(orders.ability) < 100 then return true end
  local myHero = Heroes.GetLocal()
  if not myHero or NPC.IsStunned(myHero) then return true end
  if NPC.GetUnitName(Heroes.GetLocal()) ~= "npc_dota_hero_wisp" then return true end
  if Entity.GetHealth(myHero) >= Entity.GetMaxHealth(myHero) * .70  then
    local soul_ring = NPC.GetItem(myHero, "item_soul_ring", true)
    if not soul_ring or not Ability.IsCastable(soul_ring, 0) then return true end
    Ability.CastNoTarget(soul_ring)
  end
  return true
end

function AutoIo.OnUpdate()
  if not GameRules.GetGameState() == 5 then return end
  if not Heroes.GetLocal() or NPC.GetUnitName(Heroes.GetLocal()) ~= "npc_dota_hero_wisp" then return end
  local myHero = Heroes.GetLocal()
  local myHeroPos = Entity.GetAbsOrigin(myHero)
  local myMana = NPC.GetMana(myHero)
  local myStr = Hero.GetStrengthTotal(myHero)
  local myAgi = Hero.GetAgilityTotal(myHero)
  local myInt = Hero.GetIntellectTotal(myHero)
  local myXP = Hero.GetCurrentXP(myHero)
  local myHP = Entity.GetHealth(myHero)
  local myMaxHP = Entity.GetMaxHealth(myHero)
  local mySpellAmp = 1 + (myInt * 0.07142857142) / 100
  local myAttackRange = NPC.GetAttackRange(myHero)
  local myAttackRangeBonus = NPC.HasModifier(myHero, "modifier_item_dragon_lance")
  local myAttackPoint = 0.15 / (1 + (Hero.GetAgilityTotal(myHero)/100))
  local myAttackBackswing = 0.4 / (1 + (Hero.GetAgilityTotal(myHero)/100))
  local myTimeBetweenAttacks = (1 / NPC.GetAttacksPerSecond(myHero))
  local myMissleSpeed = 1200
  local tether = NPC.GetAbility(myHero, "wisp_tether")
  local tether_break = NPC.GetAbility(myHero, "wisp_tether_break")
  local spirits = NPC.GetAbility(myHero, "wisp_spirits")
  local overcharge = NPC.GetAbility(myHero, "wisp_overcharge")
  local spirits_in = NPC.GetAbility(myHero, "wisp_spirits_in")
  local spirits_out = NPC.GetAbility(myHero, "wisp_spirits_out")
  local relocate = NPC.GetAbility(myHero, "wisp_relocate")
  local enemyHero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  local enemyHeroPos = Entity.GetAbsOrigin(enemyHero)
  local enemy = Input.GetNearestUnitToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  local enemyPos = Entity.GetAbsOrigin(enemy)
  local mousePos = Input.GetWorldCursorPos()
  local spirits_min_range = 100
  local spirits_max_range = 875
  local tether_to_range = Ability.GetCastRange(tether) + NPC.GetCastRangeBonus(myHero)
  local tether_snap_range = 900

  if Menu.IsKeyDownOnce(AutoIo.AutoTetherKey) then
    AutoIo.inAutoTetherMode = not AutoIo.inAutoTetherMode
  end

  -- AutoIo.AutoUseSpells(myHero, myMana)
  AutoIo.AutoTether(myHero, myMana, tether, tether_break, tether_to_range, tether_snap_range, overcharge)
  AutoIo.AutoUseItems(myHero, myMana)
  AutoIo.UseItems(myHero, myMana, enemyHero)
  AutoIo.AttackEnemy(myHero, myMana, myAttackPoint, myAttackBackswing, myAttackRange, myAttackRangeBonus, myTimeBetweenAttacks, enemy, enemyHero)
  --AutoIo.SpiritsAimbot(spirits, spirits_in, spirits_out, spirits_min_range, spirits_max_range)
  AutoIo.ArcaneBoots(myHero, myMana)
  AutoIo.DrawAttackRange(myAttackRange, myAttackRangeBonus)

end

function AutoIo.AutoTether(myHero, myMana, tether, tether_break, tether_to_range, tether_snap_range, overcharge)
  local lowestHpAlly = nil
  if AutoIo.inAutoTetherMode and Entity.GetHealth(myHero) > 0 and not Entity.IsDormant(myHero) then
    if NPC.HasModifier(myHero, "modifier_wisp_tether") then
      AutoIo.Tethered = true
      for _, npc in ipairs(NPC.GetHeroesInRadius(myHero, tether_to_range, Enum.TeamType.TEAM_FRIEND)) do 
        if NPC.HasModifier(npc, "modifier_wisp_tether_haste") then
          AutoIo.TetheredAlly = npc     
        end
      end
    else
      AutoIo.Tethered = false
      AutoIo.TetheredAlly = nil
    end

    if AutoIo.Tethered and Entity.GetHealth(AutoIo.TetheredAlly) < Entity.GetMaxHealth(AutoIo.TetheredAlly) and Entity.GetHealth(myHero) == Entity.GetMaxHealth(myHero) and Ability.IsReady(overcharge) and Ability.GetToggleState(overcharge) == false and GameRules.GetGameTime() - AutoIo.OverchargeToggleTime > .1 then
      Ability.Toggle(overcharge)
      AutoIo.OverchargeToggleTime = GameRules.GetGameTime()
      AutoIo.OverchargeToggledOnAutomatically = true
    end

    if AutoIo.OverchargeToggledOnAutomatically and Ability.IsReady(overcharge) and Ability.GetToggleState(overcharge) == true and GameRules.GetGameTime() - AutoIo.OverchargeToggleTime > .1 then
      Ability.Toggle(overcharge)
      AutoIo.OverchargeToggleTime = GameRules.GetGameTime()
      AutoIo.OverchargeToggledOnAutomatically = false
    end

    for _, npc in ipairs(NPC.GetHeroesInRadius(myHero, tether_to_range, Enum.TeamType.TEAM_FRIEND)) do 
      if Entity.GetHealth(npc) > 0 and Entity.GetHealth(npc) < Entity.GetMaxHealth(npc) then
        if lowestHpAlly == nil then
          lowestHpAlly = npc
        end
        if lowestHpAlly and Entity.GetHealth(npc) < Entity.GetHealth(lowestHpAlly) then
          lowestHpAlly = npc
        end
      end
    end
    if lowestHpAlly and Ability.IsReady(tether) and Ability.IsCastable(tether, myMana) then
      Ability.CastTarget(tether, lowestHpAlly)
    end
  end  
end

function AutoIo.OnProjectile(projectile)
  if not projectile or not projectile.source or not projectile.target then return end
  if not projectile.isAttack then return end
  if not Heroes.GetLocal() or NPC.GetUnitName(Heroes.GetLocal()) ~= "npc_dota_hero_wisp" then return end
  local myHero = Heroes.GetLocal()
  local enemyHero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  local enemyHeroPos = Entity.GetAbsOrigin(enemyHero)
  local enemy = Input.GetNearestUnitToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  local enemyPos = Entity.GetAbsOrigin(enemy)
  local mousePos = Input.GetWorldCursorPos()

  if projectile.source == myHero then
    AutoIo.MissleTime = GameRules.GetGameTime()
  end
end

function AutoIo.OnDraw()
  local myHero = Heroes.GetLocal()
  if not myHero or not NPC.GetUnitName(myHero) == "npc_dota_hero_wisp" then return end
  local tether = NPC.GetAbility(myHero, "wisp_tether")
  local tether_break = NPC.GetAbility(myHero, "wisp_tether_break")
  local tether_to_range = Ability.GetCastRange(tether) + NPC.GetCastRangeBonus(myHero)
  local tether_snap_range = 900


  -- Auto Tether Mode awareness
  if AutoIo.inAutoTetherMode and Entity.GetHealth(myHero) > 0 then
    local myHeroPos = NPC.GetAbsOrigin(myHero)
    local x1, y1, visible1 = Renderer.WorldToScreen(myHeroPos)
    if myHero and myHeroPos and visible1 then
      Renderer.SetDrawColor(255, 255, 255, 255)
      Renderer.DrawText(AutoIo.Font, x1-45, y1+15, "Auto", 1)
    end
  end

  -- Tether awareness
  if NPC.HasModifier(myHero, "modifier_wisp_tether") then
    AutoIo.Tethered = true
    for _, npc in ipairs(NPC.GetHeroesInRadius(myHero, tether_to_range, Enum.TeamType.TEAM_FRIEND)) do 
      if NPC.HasModifier(npc, "modifier_wisp_tether_haste") then
        AutoIo.TetheredAlly = npc     
      end
    end
  else
    AutoIo.Tethered = false
    AutoIo.TetheredAlly = nil
  end

  -- Spirits awareness
  if NPC.HasModifier(myHero, "modifier_wisp_spirits") then
    local myHeroPos = NPC.GetAbsOrigin(myHero)
    local x1, y1, visible1 = Renderer.WorldToScreen(myHeroPos)
    if myHero and myHeroPos and visible1 then
      Renderer.SetDrawColor(255, 0, 0, 255)
      Renderer.DrawText(AutoIo.Font, x1+15, y1+15, tostring(AutoIo.Round(Modifier.GetDieTime(NPC.GetModifier(myHero, "modifier_wisp_spirits")) - (GameRules.GetGameTime()-.1), 1)), 1)
    end
  end

  if AutoIo.Tethered and Entity.IsAlive(myHero) then
    local distance_between = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(AutoIo.TetheredAlly)):Length()
    local myHeroPos = NPC.GetAbsOrigin(myHero)
    local allyPos = NPC.GetAbsOrigin(AutoIo.TetheredAlly)
    local x1, y1, visible1 = Renderer.WorldToScreen(myHeroPos)
    local x2, y2, visible2 = Renderer.WorldToScreen(allyPos)
    if myHero and myHeroPos and visible1 then
      Renderer.SetDrawColor(0, 255, 0, 255)
      Renderer.DrawText(AutoIo.Font, x1+15, y1+15, "\n" .. tostring(AutoIo.Round(Modifier.GetDieTime(NPC.GetModifier(myHero, "modifier_wisp_tether")) - GameRules.GetGameTime(), 1)) .. "\n" .. tostring(math.ceil(distance_between)) .. "/900", 1)
    end
    if AutoIo.TetheredAlly and allyPos and visible2 and Entity.IsAlive(AutoIo.TetheredAlly) then
      Renderer.SetDrawColor(0, 255, 0, 255)
      Renderer.DrawText(AutoIo.Font, x2+15, y2+15, tostring(AutoIo.Round(Modifier.GetDieTime(NPC.GetModifier(AutoIo.TetheredAlly, "modifier_wisp_tether_haste")) - GameRules.GetGameTime(), 1)) .. "\n" .. tostring(math.ceil(distance_between)) .. "/900", 1)
    end
  end

  -- Relocate return awareness
  if NPC.HasModifier(myHero, "modifier_wisp_relocate_return") then
    local myHeroPos = NPC.GetAbsOrigin(myHero)
    local x1, y1, visible1 = Renderer.WorldToScreen(myHeroPos)
    if myHero and myHeroPos and visible1 then
      Renderer.SetDrawColor(255, 0, 255, 255)
      Renderer.DrawText(AutoIo.Font, x1+15, y1+15, "\n" .. "\n" .. "\n" .. tostring(AutoIo.Round(Modifier.GetDieTime(NPC.GetModifier(myHero, "modifier_wisp_relocate_return")) - (GameRules.GetGameTime()-13.1), 1)), 1)
    end
  end


end

function AutoIo.ArcaneBoots(myHero, myMana)
  local arcane = NPC.GetItem(myHero, "item_arcane_boots", true)
  if arcane then
    local myManaMissing = NPC.GetMaxMana(myHero) - NPC.GetMana(myHero)
    if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.IsChannellingAbility(myHero) then
      if arcane and myManaMissing >= 250 and Ability.IsReady(arcane) then 
        Ability.CastNoTarget(arcane)
        return 
      end
    end
    for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
      if teamMates then
        if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.IsChannellingAbility(myHero) then
          if arcane and NPC.GetMana(teamMates) <= NPC.GetMaxMana(teamMates) * .4 and Ability.IsReady(arcane) then 
            Ability.CastNoTarget(arcane)
            return 
          end 
        end
      end
    end
  end
end

function AutoIo.DrawAttackRange(myAttackRange, myAttackRangeBonus)
  if GameRules.GetGameTime() - AutoIo.DrawAttackRangeTime > 5 then
    if myAttackRangeBonus then
      Engine.ExecuteCommand("dota_range_display " .. tostring(myAttackRange) + 140)
    else
      Engine.ExecuteCommand("dota_range_display " .. tostring(myAttackRange))
    end
    AutoIo.DrawAttackRangeTime = GameRules.GetGameTime()
  end
end

function AutoIo.AttackEnemy(myHero, myMana, myAttackPoint, myAttackBackswing, myAttackRange, myAttackRangeBonus, myTimeBetweenAttacks, enemy, enemyHero)
  if Menu.IsKeyDown(AutoIo.AttackKey) and Entity.GetHealth(myHero) > 0 and not Entity.IsDormant(myHero) then

    if myAttackRangeBonus then
      myAttackRange = myAttackRange + 140
    end

    if enemyHero and GameRules.GetGameTime() - AutoIo.AttackOrderTime > myTimeBetweenAttacks + AutoIo.TimeToFace + .1 and NPC.IsPositionInRange(myHero, Entity.GetAbsOrigin(enemyHero), myAttackRange, 0) and not NPC.HasState(enemyHero, Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) then
      -- Attack if enemy in range of cursor and enemy will be in your attack range and view range in predicted amount of time from your attack point
      Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemyHero, Vector(0, 0, 0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, nil, false, false)
      AutoIo.AttackOrderTime = GameRules.GetGameTime()
      AutoIo.TimeToFace = NPC.GetTimeToFace(myHero, enemyHero)
      return
    elseif GameRules.GetGameTime() - AutoIo.AttackOrderTime > myAttackPoint + AutoIo.TimeToFace + .1 then
      -- Move if no enemy in range of cursor and projectile already fired
      Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, nil, Input.GetWorldCursorPos(), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, false, false)
      return
    end
  end

end

--function AutoIo.SpiritsAimbot(spirits, spirits_in, spirits_out, spirits_min_range, spirits_max_range)

--  -- At enemy heroes
--  -- Get nearest enemy hero in 875+150 radius (explosion radius is 300)
--  -- move spirits to that radius between you and them
--  -- if io has spirits buff, then spirits are at range 100, start tracking range
--  -- while tracking range, spirits in does nothing if range is 100, and spirits in/out travel at 250 ms between 100 and 875 range. it takes 3.1 seconds to go to max distance or min distance from max


--  -- At enemy non-heroes

--end

function AutoIo.UseItems(myHero, myMana, enemy)
  if Menu.IsKeyDown(AutoIo.AttackKey) and Entity.GetHealth(myHero) > 0 and not Entity.IsDormant(myHero) then
    if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end
    if GameRules.GetGameTime() - AutoIo.ItemUseTime < AutoIo.Delay then return end
    for _, item in ipairs(AutoIo.InteractiveItems) do
      if NPC.GetItem(myHero, item, true) and Ability.IsReady(NPC.GetItem(myHero, item, true)) and Ability.IsCastable(NPC.GetItem(myHero, item, true), myMana) and not Ability.IsInAbilityPhase(NPC.GetItem(myHero, item, true)) then --and not NPC.IsLinkensProtected(enemy)
        if Ability.GetCastRange(NPC.GetItem(myHero, item, true)) > 0 then
          if NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(NPC.GetItem(myHero, item, true)) + NPC.GetCastRangeBonus(myHero)) then
            Ability.CastTarget(NPC.GetItem(myHero, item, true), enemy)
            AutoIo.ItemUseTime = GameRules.GetGameTime()
          end
        elseif Ability.GetCastRange(NPC.GetItem(myHero, item, true)) == 0 then
          if NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
            if item == "item_black_king_bar" then
              if Menu.IsEnabled(AutoIo.BlackKingBarDuringCombo) then
                Ability.CastNoTarget(NPC.GetItem(myHero, item, true))
                AutoIo.ItemUseTime = GameRules.GetGameTime()
              end
            else
              Ability.CastNoTarget(NPC.GetItem(myHero, item, true))
              AutoIo.ItemUseTime = GameRules.GetGameTime()
            end
          end
        end
      end
    end
  end
end

--function AutoIo.AutoUseSpells(myHero, myMana)

--end

function AutoIo.GetFountainPosition(teamNum)
  for i = 1, NPCs.Count() do 
    local npc = NPCs.Get(i)

    if Entity.GetTeamNum(npc) == teamNum and NPC.IsStructure(npc) then
      local name = NPC.GetUnitName(npc)
      if name ~= nil and name == "dota_fountain" then
        return NPC.GetAbsOrigin(npc)
      end
    end
  end
end


function AutoIo.AutoUseItems(myHero, myMana)
  if AutoIo.IsSuitableToUseItem(myHero) and NPC.IsVisible(myHero) then
    local stick = NPC.GetItem(myHero, "item_magic_stick", true)
    local wand = NPC.GetItem(myHero, "item_magic_wand", true)
    local mekansm = NPC.GetItem(myHero, "item_mekansm", true)
    local greaves = NPC.GetItem(myHero, "item_guardian_greaves", true)
    local faerie = NPC.GetItem(myHero, "item_faerie_fire", true)

    if Menu.IsEnabled(AutoIo.AutoDefensiveItems) then

      if faerie and Entity.GetHealth(myHero) <= Entity.GetMaxHealth(myHero) * .25 and Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then
        if Ability.IsReady(faerie) then
          Ability.CastNoTarget(faerie)
          return
        end
      end

      if (stick or wand) and Entity.GetHealth(myHero) <= Entity.GetMaxHealth(myHero) * .25 and Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then
        if stick and Item.GetCurrentCharges(stick) >= 1 and Ability.IsReady(stick) then
          Ability.CastNoTarget(stick)
          return
        end
        if wand and Item.GetCurrentCharges(wand) >= 1 and Ability.IsReady(wand) then
          Ability.CastNoTarget(wand)
          return
        end
      end

      if mekansm then
        if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
          if Entity.GetHealth(myHero) <= Entity.GetMaxHealth(myHero) * .25 and Ability.IsCastable(mekansm, myMana) and Ability.IsReady(mekansm) then 
            Ability.CastNoTarget(mekansm) 
            return
          end
        end
        for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
          if teamMates then
            if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(teamMates, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
              if Entity.GetHealth(teamMates) <= Entity.GetMaxHealth(teamMates) * .25 and Ability.IsCastable(mekansm, myMana) and Ability.IsReady(mekansm) then
                Ability.CastNoTarget(mekansm) 
                return 
              end
            end
          end
        end
      end

      if greaves then
        if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
          if greaves and Entity.GetHealth(myHero) <= Entity.GetMaxHealth(myHero) * .25 and Ability.IsReady(greaves) then 
            Ability.CastNoTarget(greaves) 
            return
          end
        end
        for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
          if teamMates then
            if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(teamMates, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
              if greaves and Entity.GetHealth(teamMates) <= Entity.GetMaxHealth(teamMates) * .25 and Ability.IsReady(greaves) then
                Ability.CastNoTarget(greaves) 
                return 
              end
            end
          end
        end
      end

      -- Auto cast Glimmer Cape to ally or yourself when channeling spell or need to be saved.
      local item_glimmer_cape = NPC.GetItem(myHero, "item_glimmer_cape", true)
      if item_glimmer_cape and Ability.IsCastable(item_glimmer_cape, NPC.GetMana(myHero)) then

        if AutoIo.CanCastSpellOn(myHero) and (AutoIo.NeedToBeSaved(myHero) or AutoIo.IsChannellingAbility(myHero)) then
          Ability.CastTarget(item_glimmer_cape, myHero)
        end

        local item_glimmer_cape_range = 1050
        local allyAround = NPC.GetHeroesInRadius(myHero, item_glimmer_cape_range, Enum.TeamType.TEAM_FRIEND)
        if not allyAround or #allyAround <= 0 then return end

        for i, ally in ipairs(allyAround) do
          if AutoIo.CanCastSpellOn(ally) and (AutoIo.NeedToBeSaved(ally) or AutoIo.IsChannellingAbility(ally)) then
            Ability.CastTarget(item_glimmer_cape, ally)
            return
          end
        end
      end

      -- Auto use quelling blade, iron talen, or battle fury to deward
      local item_quelling_blade = NPC.GetItem(myHero, "item_quelling_blade", true)
      local item_iron_talon = NPC.GetItem(myHero, "item_iron_talon", true)
      local item_bfury = NPC.GetItem(myHero, "item_bfury", true)

      local deward_item = nil
      if item_quelling_blade and Ability.IsCastable(item_quelling_blade, 0) then deward_item = item_quelling_blade end
      if item_iron_talon and Ability.IsCastable(item_iron_talon, 0) then deward_item = item_iron_talon end
      if item_bfury and Ability.IsCastable(item_bfury, 0) then deward_item = item_bfury end
      if deward_item then

        local deward_range = 450
        local wards = NPC.GetUnitsInRadius(myHero, deward_range, Enum.TeamType.TEAM_ENEMY)
        for i, npc in ipairs(wards) do
          if NPC.GetUnitName(npc) == "npc_dota_observer_wards" or NPC.GetUnitName(npc) == "npc_dota_sentry_wards" then
            Ability.CastTarget(deward_item, npc)
            return
          end
        end
      end

      -- Auto cast lotus orb to save ally
      -- For tinker, auto use lotus orb on self or allies once available
      local lotus_item = NPC.GetItem(myHero, "item_lotus_orb", true)
      if lotus_item and Ability.IsCastable(lotus_item, NPC.GetMana(myHero)) then

        -- cast on self first if needed
        if AutoIo.NeedToBeSaved(myHero) then Ability.CastTarget(lotus_item, myHero); return end

        local lotus_range = 900
        local lotus_allyAround = NPC.GetHeroesInRadius(myHero, lotus_range, Enum.TeamType.TEAM_FRIEND)
        if not lotus_allyAround or #lotus_allyAround <= 0 then return end

        -- save ally who get stunned, silenced, rooted, disarmed, low Hp, etc
        for i, ally in ipairs(lotus_allyAround) do
          if AutoIo.NeedToBeSaved(ally) and AutoIo.CanCastSpellOn(ally) then
            Ability.CastTarget(lotus_item, ally)
            return
          end
        end

        -- for tinker
        if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tinker" then return end

        if not NPC.HasModifier(myHero, "modifier_item_lotus_orb_active") and AutoIo.CanCastSpellOn(myHero) then
          Ability.CastTarget(lotus_item, myHero)
          return
        end

        -- cast lotus orb once available
        for i, ally in ipairs(lotus_allyAround) do
          if Entity.IsAlive(ally) and not NPC.IsIllusion(ally) and AutoIo.CanCastSpellOn(ally)
          and not NPC.HasModifier(ally, "modifier_item_lotus_orb_active") then

            Ability.CastTarget(lotus_item, ally)
            return
          end
        end
      end

-- Auto cast solar crest/medallion of courage to save ally
      local armor_item
      local item_solar_crest = NPC.GetItem(myHero, "item_solar_crest", true)
      local item_medallion_of_courage = NPC.GetItem(myHero, "item_medallion_of_courage", true)

      if item_solar_crest then armor_item = item_solar_crest end
      if item_medallion_of_courage then armor_item = item_medallion_of_courage end

      if armor_item and Ability.IsCastable(armor_item, NPC.GetMana(myHero)) then

        local armor_range = 1000
        local armor_allyAround = NPC.GetHeroesInRadius(myHero, armor_range, Enum.TeamType.TEAM_FRIEND)
        if not armor_allyAround or #armor_allyAround <= 0 then return end

        for i, ally in ipairs(armor_allyAround) do
          if AutoIo.NeedToBeSaved(ally) and AutoIo.CanCastSpellOn(ally) then
            Ability.CastTarget(armor_item, ally)
            return
          end
        end

      end
    end

    if Menu.IsEnabled(AutoIo.AutoOffensiveItems) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
      -- Auto use sheepstick on enemy hero once available
      -- Doesn't use on enemy who is lotus orb protected or AM with aghs.
      local item_sheepstick = NPC.GetItem(myHero, "item_sheepstick", true)
      if item_sheepstick and Ability.IsCastable(item_sheepstick, NPC.GetMana(myHero)) then 

        local item_sheepstick_range = 800
        local sheepstick_enemyAround = NPC.GetHeroesInRadius(myHero, item_sheepstick_range, Enum.TeamType.TEAM_ENEMY)

        local sheepstick_minDistance = 99999
        local sheepstick_target = nil
        for i, enemy in ipairs(sheepstick_enemyAround) do
          if not NPC.IsIllusion(enemy) and not AutoIo.IsDisabled(enemy)
          and AutoIo.CanCastSpellOn(enemy) and not AutoIo.IsLotusProtected(enemy) then
            local sheepstick_dis = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length()
            if sheepstick_dis < sheepstick_minDistance then
              sheepstick_minDistance = sheepstick_dis
              sheepstick_target = enemy
            end
          end
        end


        -- cast sheepstick on nearest enemy in range
        if sheepstick_target then Ability.CastTarget(item_sheepstick, sheepstick_target) end
      end

-- Auto use orchid or bloodthorn on enemy hero once available
-- Doesn't use on enemy who is lotus orb protected or AM with aghs.
      local item_orchid = NPC.GetItem(myHero, "item_orchid", true)
      local item_bloodthorn = NPC.GetItem(myHero, "item_bloodthorn", true)

      local silence_item = nil
      if item_orchid and Ability.IsCastable(item_orchid, NPC.GetMana(myHero)) then silence_item = item_orchid end
      if item_bloodthorn and Ability.IsCastable(item_bloodthorn, NPC.GetMana(myHero)) then silence_item = item_bloodthorn end
      if silence_item then

        local silence_item_range = 900
        local silence_enemyAround = NPC.GetHeroesInRadius(myHero, silence_item_range, Enum.TeamType.TEAM_ENEMY)

        local silence_minDistance = 99999
        local silence_target = nil
        for i, enemy in ipairs(silence_enemyAround) do
          if not NPC.IsIllusion(enemy) and not AutoIo.IsDisabled(enemy)
          and AutoIo.CanCastSpellOn(enemy) and not NPC.IsSilenced(enemy) and not AutoIo.IsLotusProtected(enemy) then
            local silence_dis = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length()
            if silence_dis < silence_minDistance then
              silence_minDistance = silence_dis
              silence_target = enemy
            end
          end
        end

        -- cast orchid/bloodthorn on nearest enemy in range
        if silence_target then Ability.CastTarget(silence_item, silence_target) end
      end

-- Auto use rod of atos on enemy hero once available
-- Doesn't use on enemy who is lotus orb protected or AM with aghs.
      local item_rod_of_atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
      if item_rod_of_atos and Ability.IsCastable(item_rod_of_atos, NPC.GetMana(myHero)) then

        local item_rod_of_atos_range = 1150
        local atos_enemyAround = NPC.GetHeroesInRadius(myHero, item_rod_of_atos_range, Enum.TeamType.TEAM_ENEMY)

        local atos_minDistance = 99999
        local atos_target = nil
        for i, enemy in ipairs(atos_enemyAround) do
          if not NPC.IsIllusion(enemy) and not AutoIo.IsDisabled(enemy)
          and AutoIo.CanCastSpellOn(enemy) and not AutoIo.IsLotusProtected(enemy)
          and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then

            local atos_dis = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length()
            if atos_dis < atos_minDistance then
              atos_minDistance = atos_dis
              atos_target = enemy
            end
          end
        end

        -- cast rod of atos on nearest enemy in range
        if atos_target then Ability.CastTarget(item_rod_of_atos, atos_target) end
      end

      -- Auto use abyssal blade on enemy hero once available
      -- Doesn't use on enemy who is lotus orb protected or AM with aghs.
      local item_abyssal_blade = NPC.GetItem(myHero, "item_abyssal_blade", true)
      if item_abyssal_blade and Ability.IsCastable(item_abyssal_blade, NPC.GetMana(myHero)) then

        local item_abyssal_blade_range = 140
        local abyssal_enemyAround = NPC.GetHeroesInRadius(myHero, item_abyssal_blade_range, Enum.TeamType.TEAM_ENEMY)

        local abyssal_minDistance = 99999
        local abyssal_target = nil
        for i, enemy in ipairs(abyssal_enemyAround) do
          if not NPC.IsIllusion(enemy) and not NPC.IsStunned(enemy) and not AutoIo.IsLotusProtected(enemy) then
            local abyssal_dis = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length()
            if abyssal_dis < abyssal_minDistance then
              abyssal_minDistance = abyssal_dis
              abyssal_target = enemy
            end
          end
        end


        -- cast rod of atos on nearest enemy in range
        if abyssal_target then Ability.CastTarget(item_abyssal_blade, abyssal_target) end
      end

      local level, dagon_item
      local item_dagon = NPC.GetItem(myHero, "item_dagon", true)
      local item_dagon_2 = NPC.GetItem(myHero, "item_dagon_2", true)
      local item_dagon_3 = NPC.GetItem(myHero, "item_dagon_3", true)
      local item_dagon_4 = NPC.GetItem(myHero, "item_dagon_4", true)
      local item_dagon_5 = NPC.GetItem(myHero, "item_dagon_5", true)

      if item_dagon and Ability.IsCastable(item_dagon, NPC.GetMana(myHero)) then dagon_item = item_dagon; level = 1 end
      if item_dagon_2 and Ability.IsCastable(item_dagon_2, NPC.GetMana(myHero)) then dagon_item = item_dagon_2; level = 2 end
      if item_dagon_3 and Ability.IsCastable(item_dagon_3, NPC.GetMana(myHero)) then dagon_item = item_dagon_3; level = 3 end
      if item_dagon_4 and Ability.IsCastable(item_dagon_4, NPC.GetMana(myHero)) then dagon_item = item_dagon_4; level = 4 end
      if item_dagon_5 and Ability.IsCastable(item_dagon_5, NPC.GetMana(myHero)) then dagon_item = item_dagon_5; level = 5 end

      if dagon_item then 

        local dagon_range = 600 + 50 * (level - 1)
        local magic_damage = 400 + 100 * (level - 1)

        local dagon_target
        local minHp = 99999
        local dagon_enemyAround = NPC.GetHeroesInRadius(myHero, dagon_range, Enum.TeamType.TEAM_ENEMY)
        for i, enemy in ipairs(dagon_enemyAround) do
          if not NPC.IsIllusion(enemy) and not AutoIo.IsDisabled(enemy)
          and AutoIo.CanCastSpellOn(enemy) and AutoIo.IsSafeToCast(myHero, enemy, magic_damage) then

            local enemyHp = Entity.GetHealth(enemy)
            if enemyHp < minHp then
              dagon_target = enemy
              minHp = enemyHp
            end
          end
        end

        -- cast dagon on enemy with lowest HP in range
        if dagon_target then Ability.CastTarget(dagon_item, dagon_target) end
      end

      local veil_item = NPC.GetItem(myHero, "item_veil_of_discord", true)
      if veil_item and Ability.IsCastable(item, NPC.GetMana(myHero)) then

        local veil_range = 1000
        local enemyHeroes = NPC.GetHeroesInRadius(myHero, veil_range, Enum.TeamType.TEAM_ENEMY)
        if not enemyHeroes or #enemyHeroes <= 0 then return end

        local radius = 600
        local pos = AutoIo.BestPosition(enemyHeroes, radius)
        if pos then Ability.CastPosition(veil_item, pos) end
      end
    end
  end
end

function AutoIo.Round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

AutoIo.AncientCreepNameList = {
  "npc_dota_neutral_black_drake",
  "npc_dota_neutral_black_dragon",
  "npc_dota_neutral_blue_dragonspawn_sorcerer",
  "npc_dota_neutral_blue_dragonspawn_overseer",
  "npc_dota_neutral_granite_golem",
  "npc_dota_neutral_elder_jungle_stalker",
  "npc_dota_neutral_prowler_acolyte",
  "npc_dota_neutral_prowler_shaman",
  "npc_dota_neutral_rock_golem",
  "npc_dota_neutral_small_thunder_lizard",
  "npc_dota_neutral_jungle_stalker",
  "npc_dota_neutral_big_thunder_lizard",
  "npc_dota_roshan"
}

-- return best position to cast certain spells
-- eg. axe's call, void's chrono, enigma's black hole
-- input  : unitsAround, radius
-- return : positon (a vector)
function AutoIo.BestPosition(unitsAround, radius)
  if not unitsAround or #unitsAround <= 0 then return nil end
  local enemyNum = #unitsAround

  if enemyNum == 1 then return Entity.GetAbsOrigin(unitsAround[1]) end

  -- find all mid points of every two enemy heroes,
  -- then find out the best position among these.
  -- O(n^3) complexity
  local maxNum = 1
  local bestPos = Entity.GetAbsOrigin(unitsAround[1])
  for i = 1, enemyNum-1 do
    for j = i+1, enemyNum do
      if unitsAround[i] and unitsAround[j] then
        local pos1 = Entity.GetAbsOrigin(unitsAround[i])
        local pos2 = Entity.GetAbsOrigin(unitsAround[j])
        local mid = pos1:__add(pos2):Scaled(0.5)
        local heroesNum = 0
        for k = 1, enemyNum do
          if NPC.IsPositionInRange(unitsAround[k], mid, radius, 0) then
            heroesNum = heroesNum + 1
          end
        end
        if heroesNum > maxNum then
          maxNum = heroesNum
          bestPos = mid
        end
      end
    end
  end
  return bestPos
end

-- return predicted position
function AutoIo.GetPredictedPosition(npc, delay)
  local pos = Entity.GetAbsOrigin(npc)
  if AutoIo.CantMove(npc) then return pos end
  if not NPC.IsRunning(npc) or not delay then return pos end
  local dir = Entity.GetRotation(npc):GetForward():Normalized()
  local speed = AutoIo.GetMoveSpeed(npc)
  return pos + dir:Scaled(speed * delay)
end

function AutoIo.GetMoveSpeed(npc)
  local base_speed = NPC.GetBaseSpeed(npc)
  local bonus_speed = NPC.GetMoveSpeed(npc) - NPC.GetBaseSpeed(npc)
  -- when affected by ice wall, assume move speed as 100 for convenience
  if NPC.HasModifier(npc, "modifier_invoker_ice_wall_slow_debuff") then return 100 end
  -- when get hexed,  move speed = 140/100 + bonus_speed
  if AutoIo.GetHexTimeLeft(npc) > 0 then return 140 + bonus_speed end
  return base_speed + bonus_speed
end

-- return true if is protected by lotus orb or AM's aghs
function AutoIo.IsLotusProtected(npc)
  if NPC.HasModifier(npc, "modifier_item_lotus_orb_active") then return true end
  local shield = NPC.GetAbility(npc, "antimage_spell_shield")
  if shield and Ability.IsReady(shield) and NPC.HasItem(npc, "item_ultimate_scepter", true) then
    return true
  end
  return false
end

-- return true if this npc is disabled, return false otherwise
function AutoIo.IsDisabled(npc)
  if not Entity.IsAlive(npc) then return true end
  if NPC.IsStunned(npc) then return true end
  if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_HEXED) then return true end
  return false
end

-- return true if can cast spell on this npc, return false otherwise
function AutoIo.CanCastSpellOn(npc)
  if Entity.IsDormant(npc) or not Entity.IsAlive(npc) then return false end
  if NPC.IsStructure(npc) then return false end --or not NPC.IsKillable(npc)
  if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return false end
  if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then return false end
  if NPC.HasModifier(npc, "modifier_abaddon_borrowed_time") then return false end
  return true
end

-- check if it is safe to cast spell or item on enemy
-- in case enemy has blademail or lotus.
-- Caster will take double damage if target has both lotus and blademail
function AutoIo.IsSafeToCast(myHero, enemy, magic_damage)
  if not myHero or not enemy or not magic_damage then return true end
  if magic_damage <= 0 then return true end
  local counter = 0
  if NPC.HasModifier(enemy, "modifier_item_lotus_orb_active") then counter = counter + 1 end
  if NPC.HasModifier(enemy, "modifier_item_blade_mail_reflect") then counter = counter + 1 end
  local reflect_damage = counter * magic_damage * NPC.GetMagicalArmorDamageMultiplier(myHero)
  return Entity.GetHealth(myHero) > reflect_damage
end

-- situations that ally need to be saved
function AutoIo.NeedToBeSaved(npc)
  if not npc or NPC.IsIllusion(npc) or not Entity.IsAlive(npc) then return false end
  if NPC.IsStunned(npc) or NPC.IsSilenced(npc) then return true end
  if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_ROOTED) then return true end
  --if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_DISARMED) then return true end
  if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_HEXED) then return true end
  --if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_PASSIVES_DISABLED) then return true end
  --if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_BLIND) then return true end
  if Entity.GetHealth(npc) <= 0.2 * Entity.GetMaxHealth(npc) then return true end
  return false
end

-- pop all defensive items
function AutoIo.PopDefensiveItems(myHero)
  if not myHero then return end

  -- blade mail
  if NPC.HasItem(myHero, "item_blade_mail", true) then
    local item = NPC.GetItem(myHero, "item_blade_mail", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastNoTarget(item)
    end
  end

  -- buckler
  if NPC.HasItem(myHero, "item_buckler", true) then
    local item = NPC.GetItem(myHero, "item_buckler", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastNoTarget(item)
    end
  end

  -- hood of defiance
  if NPC.HasItem(myHero, "item_hood_of_defiance", true) then
    local item = NPC.GetItem(myHero, "item_hood_of_defiance", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastNoTarget(item)
    end
  end

  -- pipe of insight
  if NPC.HasItem(myHero, "item_pipe", true) then
    local item = NPC.GetItem(myHero, "item_pipe", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastNoTarget(item)
    end
  end

  -- crimson guard
  if NPC.HasItem(myHero, "item_crimson_guard", true) then
    local item = NPC.GetItem(myHero, "item_crimson_guard", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastNoTarget(item)
    end
  end

  -- shiva's guard
  if NPC.HasItem(myHero, "item_shivas_guard", true) then
    local item = NPC.GetItem(myHero, "item_shivas_guard", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastNoTarget(item)
    end
  end

  -- lotus orb
  if NPC.HasItem(myHero, "item_lotus_orb", true) then
    local item = NPC.GetItem(myHero, "item_lotus_orb", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastTarget(item, myHero)
    end
  end

  -- mjollnir
  if NPC.HasItem(myHero, "item_mjollnir", true) then
    local item = NPC.GetItem(myHero, "item_mjollnir", true)
    if Ability.IsCastable(item, NPC.GetMana(myHero)) then
      Ability.CastTarget(item, myHero)
    end
  end
end

function AutoIo.IsAncientCreep(npc)
  if not npc then return false end

  for i, name in ipairs(AutoIo.AncientCreepNameList) do
    if name and NPC.GetUnitName(npc) == name then return true end
  end

  return false
end

function AutoIo.CantMove(npc)
  if not npc then return false end

  if NPC.IsRooted(npc) or AutoIo.GetStunTimeLeft(npc) >= 1 then return true end
  if NPC.HasModifier(npc, "modifier_axe_berserkers_call") then return true end
  if NPC.HasModifier(npc, "modifier_legion_commander_duel") then return true end

  return false
end

-- only able to get stun modifier. no specific modifier for root or hex.
function AutoIo.GetStunTimeLeft(npc)
  local mod = NPC.GetModifier(npc, "modifier_stunned")
  if not mod then return 0 end
  return math.max(Modifier.GetDieTime(mod) - GameRules.GetGameTime(), 0)
end

-- hex only has three types: sheepstick, lion's hex, shadow shaman's hex
function AutoIo.GetHexTimeLeft(npc)
  local mod
  local mod1 = NPC.GetModifier(npc, "modifier_sheepstick_debuff")
  local mod2 = NPC.GetModifier(npc, "modifier_lion_voodoo")
  local mod3 = NPC.GetModifier(npc, "modifier_shadow_shaman_voodoo")

  if mod1 then mod = mod1 end
  if mod2 then mod = mod2 end
  if mod3 then mod = mod3 end

  if not mod then return 0 end
  return math.max(Modifier.GetDieTime(mod) - GameRules.GetGameTime(), 0)
end

-- return false for conditions that are not suitable to cast spell (like TPing, being invisible)
-- return true otherwise
function AutoIo.IsSuitableToCastSpell(myHero)
  if NPC.IsSilenced(myHero) or NPC.IsStunned(myHero) or not Entity.IsAlive(myHero) then return false end
  --if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return false end
  if NPC.HasModifier(myHero, "modifier_teleporting") then return false end
  if NPC.IsChannellingAbility(myHero) then return false end
  return true
end

function AutoIo.IsSuitableToUseItem(myHero)
  if NPC.IsStunned(myHero) or not Entity.IsAlive(myHero) then return false end
  if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return false end
  if NPC.HasModifier(myHero, "modifier_teleporting") then return false end
  if NPC.IsChannellingAbility(myHero) then return false end
  return true
end

-- return true if: (1) channeling ability; (2) TPing
function AutoIo.IsChannellingAbility(npc, target)
  if NPC.HasModifier(npc, "modifier_teleporting") then return true end
  if NPC.IsChannellingAbility(npc) then return true end

  return false
end

function AutoIo.IsAffectedByDoT(npc)
  if not npc then return false end

  if NPC.HasModifier(npc, "modifier_item_radiance_debuff") then return true end
  if NPC.HasModifier(npc, "modifier_item_urn_damage") then return true end
  if NPC.HasModifier(npc, "modifier_alchemist_acid_spray") then return true end
  if NPC.HasModifier(npc, "modifier_cold_feet") then return true end
  if NPC.HasModifier(npc, "modifier_ice_blast") then return true end
  if NPC.HasModifier(npc, "modifier_axe_battle_hunger") then return true end
  if NPC.HasModifier(npc, "modifier_bane_fiends_grip") then return true end
  if NPC.HasModifier(npc, "modifier_batrider_firefly") then return true end
  if NPC.HasModifier(npc, "modifier_rattletrap_battery_assault") then return true end
  if NPC.HasModifier(npc, "modifier_crystal_maiden_frostbite") then return true end
  if NPC.HasModifier(npc, "modifier_crystal_maiden_freezing_field") then return true end
  if NPC.HasModifier(npc, "modifier_dazzle_poison_touch") then return true end
  if NPC.HasModifier(npc, "modifier_disruptor_static_storm") then return true end
  if NPC.HasModifier(npc, "modifier_disruptor_thunder_strike") then return true end
  if NPC.HasModifier(npc, "modifier_doom_bringer_doom") then return true end
  if NPC.HasModifier(npc, "modifier_doom_bringer_scorched_earth_effect") then return true end
  if NPC.HasModifier(npc, "modifier_dragon_knight_corrosive_breath_dot") then return true end
  if NPC.HasModifier(npc, "modifier_earth_spirit_magnetize") then return true end
  if NPC.HasModifier(npc, "modifier_ember_spirit_flame_guard") then return true end
  if NPC.HasModifier(npc, "modifier_enigma_malefice") then return true end
  if NPC.HasModifier(npc, "modifier_brewmaster_fire_permanent_immolation") then return true end
  if NPC.HasModifier(npc, "modifier_gyrocopter_rocket_barrage") then return true end
  if NPC.HasModifier(npc, "modifier_huskar_burning_spear_debuff") then return true end
  if NPC.HasModifier(npc, "modifier_invoker_ice_wall_slow_debuff") then return true end
  if NPC.HasModifier(npc, "modifier_invoker_chaos_meteor_burn") then return true end
  if NPC.HasModifier(npc, "modifier_jakiro_dual_breath_burn") then return true end
  if NPC.HasModifier(npc, "modifier_jakiro_macropyre") then return true end
  if NPC.HasModifier(npc, "modifier_juggernaut_blade_fury") then return true end
  if NPC.HasModifier(npc, "modifier_leshrac_diabolic_edict") then return true end
  if NPC.HasModifier(npc, "modifier_leshrac_pulse_nova") then return true end
  if NPC.HasModifier(npc, "modifier_ogre_magi_ignite") then return true end
  if NPC.HasModifier(npc, "modifier_phoenix_fire_spirit_burn") then return true end
  if NPC.HasModifier(npc, "modifier_phoenix_icarus_dive_burn") then return true end
  if NPC.HasModifier(npc, "modifier_phoenix_sun_debuff") then return true end
  if NPC.HasModifier(npc, "modifier_pudge_rot") then return true end
  if NPC.HasModifier(npc, "modifier_pugna_life_drain") then return true end
  if NPC.HasModifier(npc, "modifier_queenofpain_shadow_strike") then return true end
  if NPC.HasModifier(npc, "modifier_razor_eye_of_the_storm") then return true end
  if NPC.HasModifier(npc, "modifier_sandking_sand_storm") then return true end
  if NPC.HasModifier(npc, "modifier_silencer_curse_of_the_silent") then return true end
  if NPC.HasModifier(npc, "modifier_sniper_shrapnel_slow") then return true end
  if NPC.HasModifier(npc, "modifier_shredder_chakram_debuff") then return true end
  if NPC.HasModifier(npc, "modifier_treant_leech_seed") then return true end
  if NPC.HasModifier(npc, "modifier_abyssal_underlord_firestorm_burn") then return true end
  if NPC.HasModifier(npc, "modifier_venomancer_venomous_gale") then return true end
  if NPC.HasModifier(npc, "modifier_venomancer_poison_nova") then return true end
  if NPC.HasModifier(npc, "modifier_viper_viper_strike") then return true end
  if NPC.HasModifier(npc, "modifier_warlock_shadow_word") then return true end
  if NPC.HasModifier(npc, "modifier_warlock_golem_permanent_immolation_debuff") then return true end
  if NPC.HasModifier(npc, "modifier_maledict") then return true end

  return false
end

AutoIo.CreepNameList = {
"npc_dota_neutral_alpha_wolf",
"npc_dota_neutral_big_thunder_lizard",
"npc_dota_neutral_black_dragon",
"npc_dota_neutral_black_drake",
"npc_dota_neutral_blue_dragonspawn_overseer",
"npc_dota_neutral_blue_dragonspawn_sorcerer",
"npc_dota_neutral_centaur_khan",
"npc_dota_neutral_centaur_outrunner",
"npc_dota_neutral_dark_troll",
"npc_dota_neutral_dark_troll_warlord",
"npc_dota_neutral_elder_jungle_stalker",
"npc_dota_neutral_enraged_wildkin",
"npc_dota_neutral_fel_beast",
"npc_dota_neutral_forest_troll_berserker",
"npc_dota_neutral_forest_troll_high_priest",
"npc_dota_neutral_ghost",
"npc_dota_neutral_giant_wolf",
"npc_dota_neutral_gnoll_assassin",
"npc_dota_neutral_granite_golem",
"npc_dota_neutral_harpy_scout",
"npc_dota_neutral_harpy_storm",
"npc_dota_neutral_jungle_stalker",
"npc_dota_neutral_kobold",
"npc_dota_neutral_kobold_taskmaster",
"npc_dota_neutral_kobold_tunneler",
"npc_dota_neutral_mud_golem",
"npc_dota_neutral_ogre_magi",
"npc_dota_neutral_ogre_mauler",
"npc_dota_neutral_polar_furbolg_champion",
"npc_dota_neutral_polar_furbolg_ursa_warrior",
"npc_dota_neutral_rock_golem",
"npc_dota_neutral_satyr_hellcaller",
"npc_dota_neutral_satyr_soulstealer",
"npc_dota_neutral_satyr_trickster",
"npc_dota_neutral_small_thunder_lizard",
"npc_dota_neutral_wildkin",
"npc_dota_neutral_prowler_shaman",
"npc_dota_neutral_prowler_acolyte"
}

AutoIo.UsefulCreepNameList = {
"npc_dota_neutral_granite_golem",
"npc_dota_neutral_black_dragon",
"npc_dota_neutral_big_thunder_lizard",
"npc_dota_neutral_satyr_hellcaller",
"npc_dota_neutral_dark_troll_warlord",
"npc_dota_neutral_centaur_khan",
"npc_dota_neutral_enraged_wildkin",
"npc_dota_neutral_alpha_wolf",
"npc_dota_neutral_ogre_magi",
"npc_dota_neutral_polar_furbolg_ursa_warrior",
"npc_dota_neutral_prowler_acolyte",
"npc_dota_neutral_prowler_shaman",
"npc_dota_neutral_harpy_storm",
"npc_dota_neutral_mud_golem",
"npc_dota_neutral_ghost",
"npc_dota_neutral_forest_troll_high_priest",
"npc_dota_neutral_kobold_taskmaster"
}

AutoIo.InteractiveAbilities = {
"forest_troll_high_priest_heal",
"harpy_storm_chain_lightning",
"centaur_khan_war_stomp",
"satyr_trickster_purge",
"satyr_soulstealer_mana_burn",
"ogre_magi_frost_armor",
"mud_golem_hurl_boulder",
"satyr_hellcaller_shockwave",
"polar_furbolg_ursa_warrior_thunder_clap",
"enraged_wildkin_tornado",
"dark_troll_warlord_ensnare",
"dark_troll_warlord_raise_dead",
"black_dragon_fireball",
"big_thunder_lizard_slam",
"big_thunder_lizard_frenzy",
"spawnlord_master_stomp",
"spawnlord_master_freeze"
}

AutoIo.HeroAbilities = {
"wisp_tether",
"wisp_tether_break",
"wisp_spirits",
"wisp_overcharge",
"wisp_spirits_in",
"wisp_spirits_out",
"wisp_relocate",
"special_bonus_magic_resistance_10",
"special_bonus_armor_6",
"special_bonus_mp_regen_10",
"special_bonus_strength_10",
"special_bonus_hp_regen_20",
"special_bonus_gold_income_20",
"special_bonus_unique_wisp_2",
"special_bonus_unique_wisp"
}

AutoIo.Items = {
"item_abyssal_blade",
"item_aegis",
"item_aether_lens",
"item_ancient_janggo",
"item_arcane_boots",
"item_armlet",
"item_assault",
"item_banana",
"item_basher",
"item_belt_of_strength",
"item_bfury",
"item_black_king_bar",
"item_blade_mail",
"item_blade_of_alacrity",
"item_blades_of_attack",
"item_blight_stone",
"item_bloodstone",
"item_bloodthorn",
"item_boots",
"item_boots_of_elves",
"item_bottle",
"item_bracer",
"item_branches",
"item_broadsword",
"item_buckler",
"item_butterfly",
"item_chainmail",
"item_cheese",
"item_circlet",
"item_clarity",
"item_claymore",
"item_cloak",
"item_courier",
"item_crimson_guard",
"item_cyclone",
"item_dagon",
"item_dagon_2",
"item_dagon_3",
"item_dagon_4",
"item_dagon_5",
"item_demon_edge",
"item_desolator",
"item_diffusal_blade",
"item_diffusal_blade_2",
"item_dragon_lance",
"item_dust",
"item_eagle",
"item_echo_sabre",
"item_enchanted_mango",
"item_energy_booster",
"item_ethereal_blade",
"item_faerie_fire",
"item_flask",
"item_flying_courier",
"item_force_staff",
"item_gauntlets",
"item_gem",
"item_ghost",
"item_glimmer_cape",
"item_gloves",
"item_greater_crit",
"item_greevil_whistle",
"item_greevil_whistle_toggle",
"item_guardian_greaves",
"item_halloween_candy_corn",
"item_halloween_rapier",
"item_hand_of_midas",
"item_headdress",
"item_heart",
"item_heavens_halberd",
"item_helm_of_iron_will",
"item_helm_of_the_dominator",
"item_hood_of_defiance",
"item_hurricane_pike",
"item_hyperstone",
"item_infused_raindrop",
"item_invis_sword",
"item_iron_talon",
"item_javelin",
"item_lesser_crit",
"item_lifesteal",
"item_lotus_orb",
"item_maelstrom",
"item_magic_stick",
"item_magic_wand",
"item_manta",
"item_mantle",
"item_mask_of_madness",
"item_medallion_of_courage",
"item_mekansm",
"item_mithril_hammer",
"item_mjollnir",
"item_monkey_king_bar",
"item_moon_shard",
"item_mystery_arrow",
"item_mystery_hook",
"item_mystery_missile",
"item_mystery_toss",
"item_mystery_vacuum",
"item_mystic_staff",
"item_necronomicon",
"item_necronomicon_2",
"item_necronomicon_3",
"item_null_talisman",
"item_oblivion_staff",
"item_octarine_core",
"item_ogre_axe",
"item_orb_of_venom",
"item_orchid",
"item_pers",
"item_phase_boots",
"item_pipe",
"item_platemail",
"item_point_booster",
"item_poor_mans_shield",
"item_power_treads",
"item_present",
"item_quarterstaff",
"item_quelling_blade",
"item_radiance",
"item_rapier",
"item_reaver",
"item_recipe_abyssal_blade",
"item_recipe_aether_lens",
"item_recipe_ancient_janggo",
"item_recipe_arcane_boots",
"item_recipe_armlet",
"item_recipe_assault",
"item_recipe_basher",
"item_recipe_bfury",
"item_recipe_black_king_bar",
"item_recipe_blade_mail",
"item_recipe_bloodstone",
"item_recipe_bloodthorn",
"item_recipe_bracer",
"item_recipe_buckler",
"item_recipe_butterfly",
"item_recipe_crimson_guard",
"item_recipe_cyclone",
"item_recipe_dagon",
"item_recipe_dagon_2",
"item_recipe_dagon_3",
"item_recipe_dagon_4",
"item_recipe_dagon_5",
"item_recipe_desolator",
"item_recipe_diffusal_blade",
"item_recipe_diffusal_blade_2",
"item_recipe_dragon_lance",
"item_recipe_echo_sabre",
"item_recipe_ethereal_blade",
"item_recipe_force_staff",
"item_recipe_glimmer_cape",
"item_recipe_greater_crit",
"item_recipe_guardian_greaves",
"item_recipe_hand_of_midas",
"item_recipe_headdress",
"item_recipe_heart",
"item_recipe_heavens_halberd",
"item_recipe_helm_of_the_dominator",
"item_recipe_hood_of_defiance",
"item_recipe_hurricane_pike",
"item_recipe_invis_sword",
"item_recipe_iron_talon",
"item_recipe_lesser_crit",
"item_recipe_lotus_orb",
"item_recipe_maelstrom",
"item_recipe_magic_wand",
"item_recipe_manta",
"item_recipe_mask_of_madness",
"item_recipe_medallion_of_courage",
"item_recipe_mekansm",
"item_recipe_mjollnir",
"item_recipe_monkey_king_bar",
"item_recipe_moon_shard",
"item_recipe_necronomicon",
"item_recipe_necronomicon_2",
"item_recipe_necronomicon_3",
"item_recipe_null_talisman",
"item_recipe_oblivion_staff",
"item_recipe_octarine_core",
"item_recipe_orchid",
"item_recipe_pers",
"item_recipe_phase_boots",
"item_recipe_pipe",
"item_recipe_poor_mans_shield",
"item_recipe_power_treads",
"item_recipe_radiance",
"item_recipe_rapier",
"item_recipe_refresher",
"item_recipe_ring_of_aquila",
"item_recipe_ring_of_basilius",
"item_recipe_rod_of_atos",
"item_recipe_sange",
"item_recipe_sange_and_yasha",
"item_recipe_satanic",
"item_recipe_sheepstick",
"item_recipe_shivas_guard",
"item_recipe_silver_edge",
"item_recipe_skadi",
"item_recipe_solar_crest",
"item_recipe_soul_booster",
"item_recipe_soul_ring",
"item_recipe_sphere",
"item_recipe_tranquil_boots",
"item_recipe_travel_boots",
"item_recipe_travel_boots_2",
"item_recipe_ultimate_scepter",
"item_recipe_urn_of_shadows",
"item_recipe_vanguard",
"item_recipe_veil_of_discord",
"item_recipe_vladmir",
"item_recipe_ward_dispenser",
"item_recipe_wraith_band",
"item_recipe_yasha",
"item_refresher",
"item_relic",
"item_ring_of_aquila",
"item_ring_of_basilius",
"item_ring_of_health",
"item_ring_of_protection",
"item_ring_of_regen",
"item_river_painter",
"item_river_painter2",
"item_river_painter3",
"item_river_painter4",
"item_river_painter5",
"item_river_painter6",
"item_river_painter7",
"item_robe",
"item_rod_of_atos",
"item_sange",
"item_sange_and_yasha",
"item_satanic",
"item_shadow_amulet",
"item_sheepstick",
"item_shivas_guard",
"item_silver_edge",
"item_skadi",
"item_slippers",
"item_smoke_of_deceit",
"item_sobi_mask",
"item_solar_crest",
"item_soul_booster",
"item_soul_ring",
"item_sphere",
"item_staff_of_wizardry",
"item_stout_shield",
"item_talisman_of_evasion",
"item_tango",
"item_tango_single",
"item_tome_of_knowledge",
"item_tpscroll",
"item_tranquil_boots",
"item_travel_boots",
"item_travel_boots_2",
"item_ultimate_orb",
"item_ultimate_scepter",
"item_urn_of_shadows",
"item_vanguard",
"item_veil_of_discord",
"item_vitality_booster",
"item_vladmir",
"item_void_stone",
"item_ward_dispenser",
"item_ward_observer",
"item_ward_sentry",
"item_wind_lace",
"item_winter_cake",
"item_winter_coco",
"item_winter_cookie",
"item_winter_greevil_chewy",
"item_winter_greevil_garbage",
"item_winter_greevil_treat",
"item_winter_ham",
"item_winter_kringle",
"item_winter_mushroom",
"item_winter_skates",
"item_winter_stocking",
"item_wraith_band",
"item_yasha"
}

AutoIo.InteractiveItems = {
"item_sheepstick",
"item_orchid",
"item_bloodthorn",
"item_rod_of_atos",
"item_veil_of_discord",
"item_heavens_halberd",
"item_abyssal_blade",
"item_diffusal_blade",
"item_diffusal_blade_2",
"item_ethereal_blade",
"item_medallion_of_courage",
"item_shivas_guard",
"item_solar_crest",
"item_satanic",
"item_ancient_janggo",
"item_dagon",
"item_dagon_2",
"item_dagon_3",
"item_dagon_4",
"item_dagon_5",
"item_black_king_bar",
"item_pipe",
"item_blade_mail",
"item_buckler",
"item_hood_of_defiance",
"item_lotus_orb",
"item_manta",
"item_mask_of_madness",
"item_mjollnir",
"item_necronomicon",
"item_necronomicon_2",
"item_necronomicon_3",
"item_urn_of_shadows",
"item_hurricane_pike"
}

AutoIo.InteractiveAutoItems = {
"item_magic_stick",
"item_magic_wand",
"item_mekansm",
"item_guardian_greaves",
"item_arcane_boots"
}

return AutoIo
