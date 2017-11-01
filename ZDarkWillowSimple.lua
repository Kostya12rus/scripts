local DarkWillowSimple = {}
DarkWillowSimple.optionEnable = Menu.AddOption({"Kostya12rus","Dark Willow combo"},"Активация скрипта", "")
DarkWillowSimple.gettarget = Menu.AddKeyOption({"Kostya12rus","Dark Willow combo"},"Кнопка захвата противника",Enum.ButtonCode.KEY_NONE)
DarkWillowSimple.combostart = Menu.AddKeyOption({"Kostya12rus","Dark Willow combo"},"Кнопка комбо",Enum.ButtonCode.KEY_NONE)
DarkWillowSimple.Font = Renderer.LoadFont("Tahoma", 30, Enum.FontWeight.EXTRABOLD)

function DarkWillowSimple.OnDraw()
  local myHero = Heroes.GetLocal()
  if not DarkWillowSimple.iplayer(myHero) then return end
  if Menu.IsKeyDown(DarkWillowSimple.gettarget) then
      DarkWillowSimple.enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  end
  if DarkWillowSimple.enemy == nil then return end
  xtarget,ytarget,vis = Renderer.WorldToScreen(Entity.GetAbsOrigin(DarkWillowSimple.enemy))
  if vis then
    Renderer.SetDrawColor(255,0,0,255)
    Renderer.DrawTextCentered(DarkWillowSimple.Font, xtarget, ytarget, "ЦЕЛЬ", 1)
  end  
  local Bramble_Maze = NPC.GetAbilityByIndex(myHero, 0)
  local Shadow_Realm = NPC.GetAbilityByIndex(myHero, 1)
  local Cursed_Crow = NPC.GetAbilityByIndex(myHero, 2)
  local Bedlam = NPC.GetAbilityByIndex(myHero, 3)
  local Terrorize = NPC.GetAbilityByIndex(myHero, 4)
  local EUL = NPC.GetItem(myHero, "item_cyclone", true)
  local BLT = NPC.GetItem(myHero, "item_bloodthorn", true)
  local VOF = NPC.GetItem(myHero, "item_veil_of_discord", true)
  local NeMana = 0
  if Ability.IsReady(Bramble_Maze) and Ability.IsReady(Shadow_Realm) and Ability.IsReady(Cursed_Crow) and Ability.IsReady(Bedlam)then
    NeMana = NeMana + Ability.GetManaCost(Bramble_Maze) + Ability.GetManaCost(Shadow_Realm) + Ability.GetManaCost(Cursed_Crow) + Ability.GetManaCost(Bedlam)
    if Ability.IsReady(EUL) then 
      NeMana = NeMana + Ability.GetManaCost(EUL)
    end
    if Ability.IsReady(BLT) then 
      NeMana = NeMana + Ability.GetManaCost(BLT)
    end
    if Ability.IsReady(VOF) then 
      NeMana = NeMana + Ability.GetManaCost(VOF)
    end 
    NeedMana = NeMana
  end
  if Menu.IsKeyDown(DarkWillowSimple.combostart) and NeedMana ~= 0 then
    if NPC.GetMana(myHero) >= NeedMana and EUL then
      if Ability.IsReady(VOF) then 
        Ability.CastPosition(VOF,Entity.GetAbsOrigin(DarkWillowSimple.enemy))
        return
      end 
      if Ability.IsReady(Cursed_Crow) then 
        Ability.CastTarget(Cursed_Crow,DarkWillowSimple.enemy)
        return
      end 
      if Ability.IsReady(Shadow_Realm) then 
        Ability.CastNoTarget(Shadow_Realm)
        return
      end 
      if Ability.IsReady(EUL) then 
        Ability.CastTarget(EUL,DarkWillowSimple.enemy)
        return
      end
      for key,modif in pairs(NPC.GetModifiers(DarkWillowSimple.enemy)) do
        if Modifier.GetName(modif) == "modifier_eul_cyclone" and (Modifier.GetDieTime(modif) - GameRules.GetGameTime()) < 1.5 then
          if Ability.IsReady(Bramble_Maze) then 
            local position = Entity.GetAbsOrigin(DarkWillowSimple.enemy):__add(Vector(200,0,0))
            Ability.CastPosition(Bramble_Maze,position)
            Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, Heroes.GetLocal(), Entity.GetAbsOrigin(DarkWillowSimple.enemy), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
            bloodtorntriger = true
            return
          end
        end
      end
      if Ability.IsReady(BLT) and bloodtorntriger then 
        Ability.CastTarget(BLT,DarkWillowSimple.enemy)
        Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, Heroes.GetLocal(), Entity.GetAbsOrigin(DarkWillowSimple.enemy), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)  
        return
      end
      for key,modif in pairs(NPC.GetModifiers(myHero)) do
        if Modifier.GetName(modif) == "modifier_dark_willow_shadow_realm_buff" and Modifier.GetDieTime(modif) - GameRules.GetGameTime() <= 1.5 then
          if Ability.IsReady(Bedlam) then 
            if NPC.IsPositionInRange(myHero, Entity.GetAbsOrigin(DarkWillowSimple.enemy), 100, 0) and Ability.IsReady(Bedlam) then
              Ability.CastNoTarget(Bedlam)
              Player.AttackTarget(Players.GetLocal(),myHero,DarkWillowSimple.enemy)
              return
            end
          end
        end
      end
    end
  end
end

function DarkWillowSimple.iplayer(myHero)
  if not Menu.IsEnabled(DarkWillowSimple.optionEnable) then return false end
  if not myHero then return false end   
  if NPC.GetUnitName(myHero) ~= "npc_dota_hero_dark_willow" then return false end
  return true 
end

function DarkWillowSimple.OnGameStart()
  bloodtorntriger = false
end

function DarkWillowSimple.OnGameEnd()
  bloodtorntriger = false
end
return DarkWillowSimple