-- Author: Dj-jom2x

local slardar ={}

slardar.optionEnable = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Enabled", "")
slardar.optionKey = Menu.AddKeyOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "ComboKey", Enum.ButtonCode.KEY_F)
slardar.autoTrack = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Use Auto Track", "")
slardar.usebkb = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Use Black King Bar", "")
slardar.useshiva = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Use Shiva", "")
slardar.usemail = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Use Blade Mail", "")
slardar.usearmlet = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Use Armlet", "")
slardar.usecrimson  = Menu.AddOption({"Dj-jom2x Script's","Hero Specific",  "Slardar"}, "Use Crimson", "")
ToggleOff = false

function slardar.OnUpdate()
  
  if not Menu.IsEnabled(slardar.optionEnable) then return true end
  slardar.StartCombo()
  
end

function slardar.StartCombo()
  
  local MyChamp = Heroes.GetLocal()
  if NPC.GetUnitName(MyChamp) ~= "npc_dota_hero_slardar" then return end
  local Enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(MyChamp), Enum.TeamType.TEAM_ENEMY) 
  if not Enemy then return end

  -- own abilities 
  
  local Sprint = NPC.GetAbilityByIndex(MyChamp,0)
  local Stun  = NPC.GetAbilityByIndex(MyChamp,1)
  local Track  = NPC.GetAbilityByIndex(MyChamp,3)
  
  -- own mana
  
  local MyMana = NPC.GetMana(MyChamp)
  
  -- 3rd parties abilities
  
  local blink = NPC.GetItem(MyChamp, "item_blink", true)
  local shiva = NPC.GetItem(MyChamp, "item_shivas_guard", true)
  local crson = NPC.GetItem(MyChamp, "item_crimson_guard", true)
  local armlet = NPC.GetItem(MyChamp, "item_armlet", true)
  local bm = NPC.GetItem(MyChamp, "item_blade_mail", true)
  local bkb = NPC.GetItem(MyChamp, "item_black_king_bar", true)
  
  -- modifiers
  local track_mod = "modifier_slardar_amplify_damage" 

  -- Logics
  
  if Menu.IsEnabled(slardar.autoTrack) and slardar.DoChecking(Enemy,track_mod,false) and not ToggleOff then
    
    slardar.DoSomething(Track,MyMana,MyChamp,Enemy,Ability.GetCastRange(Track),2)

  end
 
  if Menu.IsKeyDown(slardar.optionKey) then
    
      if not NPC.HasState(Enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
        
        ToggleOff = true
        
        slardar.DoSomething(Sprint,MyMana,MyChamp,Enemy,1800,1)
        
        Player.PrepareUnitOrders(Players.GetLocal(), 4, Enemy, Vector(0,0,0), Enemy, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
    
        
        if not blink then
          
          slardar.DoSomething(Stun,MyMana,MyChamp,Enemy,320,1)
           
        else
          if not NPC.IsEntityInRange(Enemy,MyChamp,200) then -- dont blink if so close lol :3
            slardar.DoSomething(blink,MyMana,MyChamp,Enemy,1200,3)
          end
          slardar.DoSomething(Stun,MyMana,MyChamp,Enemy,300,1)
           
        end
        
          if NPC.HasState(Enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
            
            if slardar.DoChecking(Enemy,track_mod,false) then
          
              slardar.DoSomething(Track,MyMana,MyChamp,Enemy,Ability.GetCastRange(Track),2)

            end
      
            slardar.CastSomething(bkb,MyMana,slardar.usebkb,false)
            
            slardar.CastSomething(armlet,MyMana,slardar.usearmlet,true)
            
            slardar.CastSomething(crson,MyMana,slardar.usecrimson,false)
            
            slardar.CastSomething(bm,MyMana,slardar.usemail,false)
            
            slardar.CastSomething(shiva,MyMana,slardar.useshiva,false)
        
          end
        
      end
  else
      ToggleOff = false
  end  
  
  

end

 
function slardar.DoChecking(Enemy,modifier,skiplinken)
     
    if skiplinken then 
      return NPC.HasModifier(Enemy,modifier)
    elseif not NPC.HasModifier(Enemy,modifier) and not NPC.IsLinkensProtected(Enemy) then
      return true
    else
      return false
    end  
    
end


function slardar.DoSomething(skill,MyMana,MyChamp,Enemy,CastRange,Action)
   
  -- Action 1: CastNoTarget
  -- Action 2: CastTarget
  -- Action 3: CastPosition

  if Ability.IsCastable(skill, MyMana) and
    Enemy ~=nil and 
    NPC.IsEntityInRange(Enemy,MyChamp,CastRange)  then
      if Action == 1 then 
        Ability.CastNoTarget(skill)
      elseif Action == 2 then
        Ability.CastTarget(skill,Enemy)
      elseif Action == 3 then
        Ability.CastPosition(skill,NPC.GetAbsOrigin(Enemy))
      end
  end
  
end

function slardar.CastSomething(item,MyMana,MenuName,isToogle)
  
    if item and Ability.IsCastable(item,MyMana) and Menu.IsEnabled(MenuName) then 
      
        if isToogle then
          
          if not Ability.GetToggleState(item) then
            Ability.Toggle(item)
          end         
          
        else
            Ability.CastNoTarget(item)
        end   
     
    end
  
end

return slardar
