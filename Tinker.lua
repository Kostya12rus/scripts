-- Author: Dj-jom2x
-- Hero: npc_dota_hero_tinker
  

local tinker = {}
-- Tinker Switch
tinker.optionEnabled = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker"}, "Enabled", "")
-- Hot Keys
tinker.comboKey = Menu.AddKeyOption({"Dj-jom2x Script's","Hero Specific", "Tinker"}, "Kill Key", Enum.ButtonCode.KEY_F)
tinker.pushKey = Menu.AddKeyOption({"Dj-jom2x Script's","Hero Specific", "Tinker"}, "Push Key", Enum.ButtonCode.KEY_D)
-- Kill Combo Menu
tinker.dokillblink = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Blink", "")
tinker.dolaser = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Laser", "")
tinker.dorockets = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Rockets", "")
tinker.dorearm = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Rearm", "")
tinker.dodagon = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Dagon", "")
tinker.doveil = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Veil", "")
tinker.doshiva = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Shiva", "")
tinker.doethereal = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Ethereal", "")
tinker.dovyse = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Scythe of Vyse", "")
tinker.dosilence = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Kill Combo"}, "Use Bloodthorn/Orchid", "")
-- Push Menu
tinker.dopushblink = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Push Combo"}, "Use Blink", "")
tinker.dopushrearm = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Push Combo"}, "Use Rearm", "")
tinker.dopushrockets = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Push Combo"}, "Use Rockets", "")
tinker.dopushghost = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Push Combo"}, "Use Ethereal / Ghost", "")
-- Misc Menu
tinker.dobottle = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Sustain Mana/Health"}, "Use Bottle", "")
tinker.dosoulring = Menu.AddOption({"Dj-jom2x Script's","Hero Specific","Tinker","Sustain Mana/Health"}, "Use Soul Ring", "")
time = 0

dotime = 0.0

function tinker.OnUpdate()
  
  if not Menu.IsEnabled(tinker.optionEnabled) then return true end
  tinker.StartLogic()
  
  
end



function tinker.StartLogic()
  
  local MyChamp = Heroes.GetLocal()
  if NPC.GetUnitName(MyChamp) ~= "npc_dota_hero_tinker" then return end
  local Enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(MyChamp), Enum.TeamType.TEAM_ENEMY) 
  if not Enemy then return end

  -- own abilities 
  
  local Laser = NPC.GetAbilityByIndex(MyChamp,0)
  local Rockets  = NPC.GetAbilityByIndex(MyChamp,1)
  local March  = NPC.GetAbilityByIndex(MyChamp,2)
  local Rearm  = NPC.GetAbilityByIndex(MyChamp,3)
  
  if (os.clock() - time) < 0.8 then return end
  
  -- own mana
  
  local MyMana = NPC.GetMana(MyChamp)
  
  -- 3rd parties abilities
  local Blink = NPC.GetItem(MyChamp, "item_blink", true)
  local Shiva = NPC.GetItem(MyChamp, "item_shivas_guard", true)  
  local Veil = NPC.GetItem(MyChamp, "item_veil_of_discord", true)  
  local Ethereal = NPC.GetItem(MyChamp, "item_ethereal_blade", true) 
  local Ghost = NPC.GetItem(MyChamp, "item_ghost", true) 
  local Bloodthorn = NPC.GetItem(MyChamp, "item_bloodthorn", true) 
  local Orchid = NPC.GetItem(MyChamp, "item_orchid", true) 
  local Vyse = NPC.GetItem(MyChamp, "item_sheepstick", true) 
  
  -- Survive
  local Bottle = NPC.GetItem(MyChamp, "item_bottle", true) 
  local SoulRing = NPC.GetItem(MyChamp, "item_soul_ring", true) 

  if Menu.IsKeyDown(tinker.comboKey) then
  
    if Ability.IsChannelling(Rearm) then return end
 
    -- lets blink
    tinker.DoSomething(Blink,MyMana,MyChamp,Enemy,1200,3,Menu.IsEnabled(tinker.dokillblink),false,500)
    
    -- lets follow
    Player.PrepareUnitOrders(Players.GetLocal(), 4, Enemy, Vector(0,0,0), Enemy, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, MyChamp)
    
    -- get current dagon
    
    local Dagon = tinker.FindDagon(MyChamp) 
   
    -- surviving
    -- modifier_bottle_regeneration

    tinker.DoSomething(SoulRing,MyMana,MyChamp,Enemy,nil,1,Menu.IsEnabled(tinker.dosoulring),true)
    
    if not NPC.HasModifier(MyChamp,"modifier_bottle_regeneration") then
      
        tinker.DoSomething(Bottle,MyMana,MyChamp,Enemy,nil,1,Menu.IsEnabled(tinker.dobottle),true)
    
    end
    

    -- combos
    tinker.DoSomething(Laser,MyMana,MyChamp,Enemy,Ability.GetCastRange(Laser),2,Menu.IsEnabled(tinker.dolaser),false)
    
 
    -- spells amplify     
    
    if Veil  then 
       
      if  NPC.HasModifier(Enemy,"modifier_item_veil_of_discord_debuff") then
        
          tinker.DoSomething(Rockets,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rockets),1,Menu.IsEnabled(tinker.dorockets),false) 
          
          tinker.DoSomething(Dagon,MyMana,MyChamp,Enemy,800,2,Menu.IsEnabled(tinker.dodagon),false)
          
        else
          
          tinker.DoSomething(Veil,MyMana,MyChamp,Enemy,Ability.GetCastRange(Veil),3,Menu.IsEnabled(tinker.doveil),false)
      
      end  
      
    end
    
    if Ethereal  then
       
   
        
      if  NPC.HasModifier(Enemy,"modifier_item_ethereal_blade_ethereal") then
        
         
          tinker.DoSomething(Rockets,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rockets),1,Menu.IsEnabled(tinker.dorockets),false) 
          
          tinker.DoSomething(Dagon,MyMana,MyChamp,Enemy,800,2,Menu.IsEnabled(tinker.dodagon),false)
          
      else
          
          tinker.DoSomething(Ethereal,MyMana,MyChamp,Enemy,Ability.GetCastRange(Ethereal),2,Menu.IsEnabled(tinker.doethereal),false)
          
      end  
      
       
    end
    
    if not Ethereal and not Veil then
      
        tinker.DoSomething(Laser,MyMana,MyChamp,Enemy,Ability.GetCastRange(Laser),2,Menu.IsEnabled(tinker.dolaser),false)
        
        tinker.DoSomething(Rockets,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rockets),1,Menu.IsEnabled(tinker.dorockets),false)
        
        tinker.DoSomething(Dagon,MyMana,MyChamp,Enemy,800,2,Menu.IsEnabled(tinker.dodagon),false)
      
    end  
 
    
      -- declare laser again here to to make sure always laser 1st
      
    
    
      
     -- tinker.DoSomething(Rockets,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rockets),1,Menu.IsEnabled(tinker.dorockets),false)
     
      -- cast shiva
      -- modifier_item_shivas_guard_blast 
      
      if Shiva and NPC.HasModifier(Enemy,"modifier_item_shivas_guard_aura") and not NPC.HasModifier(Enemy,"modifier_item_shivas_guard_blast") then
        
         tinker.DoSomething(Shiva,MyMana,MyChamp,Enemy,900,1,Menu.IsEnabled(tinker.doshiva),false)
        
      end
      
      -- silence / disable enemy
      -- modifier_bloodthorn_debuff
      -- modifier_sheepstick_debuff
      -- modifier_orchid_malevolence_debuff
      
      if Bloodthorn and not tinker.isSilenced(Enemy) then
         tinker.DoSomething(Bloodthorn,MyMana,MyChamp,Enemy,Ability.GetCastRange(Bloodthorn),2,Menu.IsEnabled(tinker.dosilence),false)
      elseif Orchid and not tinker.isSilenced(Enemy) then
         tinker.DoSomething(Orchid,MyMana,MyChamp,Enemy,Ability.GetCastRange(Orchid),2,Menu.IsEnabled(tinker.dosilence),false)
      end 
      if Vyse and not NPC.HasModifier(Enemy,"modifier_sheepstick_debuff") then
         tinker.DoSomething(Vyse,MyMana,MyChamp,Enemy,Ability.GetCastRange(Vyse),2,Menu.IsEnabled(tinker.dovyse),false)
      end
      
      -- cast rearm
      -- modifier_tinker_rearm
      
      if not Ability.IsCastable(Laser, MyMana) and 
         not Ability.IsCastable(Rockets, MyMana) and 
         not NPC.HasModifier(Enemy,"modifier_tinker_rearm") then
        
         tinker.DoSomething(Rearm,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rearm),1,Menu.IsEnabled(tinker.dorearm),true)
        
      end
    
      time = os.clock()
  end
  

  
  
  if Menu.IsKeyDown(tinker.pushKey) then
   
      if Ability.IsChannelling(Rearm) then return end
      
      local PointerPos = Input.GetWorldCursorPos()
      
      
      if Blink and Ability.IsReady(Blink) and Menu.IsEnabled(tinker.dopushblink) then
       
         Ability.CastPosition(Blink, PointerPos)
       
      end
      
      
      -- surviving
      -- modifier_bottle_regeneration

      tinker.DoSomething(SoulRing,MyMana,MyChamp,Enemy,nil,1,Menu.IsEnabled(tinker.dosoulring),true)
    
      if not NPC.HasModifier(MyChamp,"modifier_bottle_regeneration") then
      
        tinker.DoSomething(Bottle,MyMana,MyChamp,Enemy,nil,1,Menu.IsEnabled(tinker.dobottle),true)
    
      end
    
       
      tinker.DoSomething(March,MyMana,MyChamp,MyChamp,Ability.GetCastRange(March),3,true,true)
      
      tinker.DoSomething(Rockets,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rockets),1,Menu.IsEnabled(tinker.dopushrockets),false)
      
      
      -- you cant touch me bitch
      -- tinker.dopushghost
      -- modifier_item_ethereal_blade_ethereal
      -- modifier_ghost_state
      
      if Ethereal and not NPC.HasModifier(Enemy,"modifier_item_ethereal_blade_ethereal") then
        
         tinker.DoSomething(Ethereal,MyMana,MyChamp,MyChamp,Ability.GetCastRange(Ethereal),2,Menu.IsEnabled(tinker.dopushghost),true)
      
      end
       
      if Ghost and not NPC.HasModifier(Enemy,"modifier_ghost_state") then
         
         tinker.DoSomething(Ghost,MyMana,MyChamp,Enemy,nil,1,Menu.IsEnabled(tinker.dopushghost),true)
           
      end
      
      
      if not Ability.IsCastable(March, MyMana) and 
      
         not NPC.HasModifier(Enemy,"modifier_tinker_rearm") then
         tinker.DoSomething(Rearm,MyMana,MyChamp,Enemy,Ability.GetCastRange(Rearm),1,Menu.IsEnabled(tinker.dopushrearm),true)
        
      end
      
      time = os.clock()
    
  end
  

end


 function tinker.isSilenced(Enemy)
   if NPC.HasModifier(Enemy,"modifier_bloodthorn_debuff") or
      NPC.HasModifier(Enemy,"modifier_orchid_malevolence_debuff") then
     return true
   end
     return false
 end

function tinker.FindDagon(MyChamp)
  for i = 2, 5 do 
    if NPC.GetItem(MyChamp, "item_dagon_" .. i, true) then
      return NPC.GetItem(MyChamp, "item_dagon_" .. i, true);
    end  
  end
  return NPC.GetItem(MyChamp, "item_dagon", true)
end 

function tinker.DoSomething(item,MyMana,MyChamp,Enemy,CastRange,Action,isMenu,SkipRange,ModX)
   
  -- Action 1: CastNoTarget
  -- Action 2: CastTarget
  -- Action 3: CastPosition

  if item and Ability.IsCastable(item, MyMana) and
     Enemy ~= nil and isMenu then
     if SkipRange then
        tinker.DoBasic(Action,item,Enemy,ModX)
     else
        if NPC.IsEntityInRange(Enemy,MyChamp,CastRange) then
        tinker.DoBasic(Action,item,Enemy,ModX)
        end
     end
  end

  
end

 
function tinker.DoBasic(Action,item,Enemy,ModX)

     if Action == 1 then 
        Ability.CastNoTarget(item)
     elseif Action == 2 then
        Ability.CastTarget(item,Enemy)
     elseif Action == 3 then
        vec = NPC.GetAbsOrigin(Enemy);
        if ModX ~= nil then
           vec:SetX(vec:GetX() - ModX )
        end
        Ability.CastPosition(item,vec)
     end
  
end



return tinker