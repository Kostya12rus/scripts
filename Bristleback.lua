-- Author: Dj-jom2x

local brstle = {}

brstle.optionEnable = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Enabled", "")
brstle.optionBasic = Menu.AddKeyOption({"Dj-jom2x Script's", "BristleBack"}, "Toggle Auto Quil/Spray Only", Enum.ButtonCode.KEY_G)
brstle.optionQuil = Menu.AddKeyOption({"Dj-jom2x Script's", "BristleBack"}, "Toggle Auto Spray Only", Enum.ButtonCode.KEY_H)
brstle.optionKey = Menu.AddKeyOption({"Dj-jom2x Script's", "BristleBack"}, "Tooggle All Combo", Enum.ButtonCode.KEY_F)
brstle.autospray = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Auto Spray", "auto spray without holding any button when enemy get close to you")
brstle.autonasal = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Auto Nasal Goo", "auto goo without holding any button when enemy get close to you")
brstle.useshiva = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Shiva", "use shiva if enemy is closer")
brstle.usecrimson = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Crimson", "")
brstle.usepipe = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Pipe", "")
brstle.usehood = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Hood", "")
brstle.usemail = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use BladeMail", "")
brstle.usebkb = Menu.AddOption({"Dj-jom2x Script's", "BristleBack"}, "Use Black King Bar", "")
oneToggle = false;
SprayToggle = false;
 
function brstle.OnUpdate()
 if not Menu.IsEnabled(brstle.optionEnable) then return true end
 brstle.StartCombo()
end


function brstle.StartCombo()
  
  local getMyChamp = Heroes.GetLocal()
  if NPC.GetUnitName(getMyChamp) ~= "npc_dota_hero_bristleback" then return end
  local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(getMyChamp), Enum.TeamType.TEAM_ENEMY) 
  if not hero then return end
  
  -- own abilities
  
  local nasalgoo = NPC.GetAbilityByIndex(getMyChamp,0)
  local spray = NPC.GetAbilityByIndex(getMyChamp,1)
  local champMana = NPC.GetMana(getMyChamp)
  
  -- 3rd party abilities
  
  local shiva = NPC.GetItem(getMyChamp, "item_shivas_guard", true)
  local crson = NPC.GetItem(getMyChamp, "item_crimson_guard", true)
  local pipe = NPC.GetItem(getMyChamp, "item_pipe", true)
  local hood = NPC.GetItem(getMyChamp, "item_hood_of_defiance", true)
  local bm = NPC.GetItem(getMyChamp, "item_blade_mail", true)
  local agha = NPC.GetItem(getMyChamp, "item_ultimate_scepter", true)
  local bkb = NPC.GetItem(getMyChamp, "item_black_king_bar", true)
  

  
  if Menu.IsEnabled(brstle.autospray) then
    
     brstle.DoSomething(spray,champMana,getMyChamp,hero,false)
  
  end

  if Menu.IsEnabled(brstle.autonasal) then
    
    if agha then
        brstle.DoSomething(nasalgoo,champMana,getMyChamp,hero,false)
    else
        brstle.DoSomething(nasalgoo,champMana,getMyChamp,hero,true)
    end
  
  end
  
  if Menu.IsKeyDownOnce(brstle.optionBasic) then
       oneToggle = not oneToggle; 
  end
  
  if Menu.IsKeyDownOnce(brstle.optionQuil) then
       SprayToggle = not SprayToggle; 
  end
  
  if Menu.IsKeyDown(brstle.optionKey) then
      
       
      brstle.CastSomething(shiva,champMana,brstle.useshiva)
      
      brstle.CastSomething(crson,champMana,brstle.usecrimson)
      
      brstle.CastSomething(hood,champMana,brstle.usehood)
      
      brstle.CastSomething(bm,champMana,brstle.usemail)
      
      brstle.CastSomething(bkb,champMana,brstle.usebkb)
      
      brstle.CastSomething(pipe,champMana,brstle.usepipe)
      
      if not oneToggle then
      
       brstle.DoBasic(agha,nasalgoo,spray,champMana,getMyChamp,hero,agha,false)
      
      end
      
      
  end
  
  -- both nasal and spray spam
  if  oneToggle then 
    
      -- Log.Write("Toggle: "..tostring(oneToggle))
     

     brstle.DoBasic(nasalgoo,spray,champMana,getMyChamp,hero,agha,false)
   
      
  end
  
  -- spray only if you are runnning and you dont want to turn back
  if  SprayToggle then 
  

     brstle.DoBasic(nasalgoo,spray,champMana,getMyChamp,hero,agha,true)
   
      
  end

end




function brstle.DoBasic(nasalgoo,spray,champMana,getMyChamp,hero,agha,oneonly)
  
     if not Menu.IsEnabled(brstle.autonasal) then
        
        if not oneonly then
          
          if agha then
            brstle.DoSomething(nasalgoo,champMana,getMyChamp,hero,false)
          else
            brstle.DoSomething(nasalgoo,champMana,getMyChamp,hero,true)
          end
          
        end  
        
      end
      
      if not Menu.IsEnabled(brstle.autospray) then
       
          brstle.DoSomething(spray,champMana,getMyChamp,hero,false)
          
      end
      
      
end

function brstle.CastSomething(item,champMana,getMenuName)
  
    if item and Ability.IsCastable(item,champMana) and Menu.IsEnabled(getMenuName) then 
      
        Ability.CastNoTarget(item)
     
    end
  
end


function brstle.DoSomething(skill,champMana,getMyChamp,hero,isTarget)
  
    if Ability.IsCastable(skill, champMana) and
    hero ~=nil and 
    NPC.IsPositionInRange(getMyChamp,NPC.GetAbsOrigin(hero), Ability.GetCastRange(skill) , 0)  then
      if isTarget then
        Ability.CastTarget(skill, hero)
      else
        Ability.CastNoTarget(skill)
      end
    return end
  
end

return brstle  
