local Axe ={}

Axe.optionEnable = Menu.AddOption({"Hero Specific", "Axe"}, "Enabled", "")
Axe.optionKey = Menu.AddKeyOption({"Hero Specific", "Axe"}, "ComboKey", Enum.ButtonCode.KEY_F)
Axe.bkbEnable = Menu.AddOption({"Hero Specific", "Axe"}, "Use BKB", "")
Axe.pipeEnable = Menu.AddOption({"Hero Specific", "Axe"}, "Use Pipe", "")
Axe.staffEnable = Menu.AddOption({"Hero Specific", "Axe"}, "Use Force Staff[BETA]", "")

function Axe.OnUpdate()
if not Menu.IsEnabled(Axe.optionEnable) then return true end
if not Menu.IsKeyDown(Axe.optionKey) then return end
local myHero = Heroes.GetLocal()

if NPC.GetUnitName(myHero) ~= "npc_dota_hero_axe" then return end
Axe.ITABcombo()
end

function Axe.ITABcombo()



local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) --!
if not hero then return end

local heroPos = NPC.GetAbsOrigin(hero)
local stan = NPC.GetAbilityByIndex(myHero,0)
local ult = NPC.GetAbilityByIndex(myHero,1)

local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local lotus = NPC.GetItem(myHero,"item_lotus_orb", true)
local bm = NPC.GetItem(myHero,"item_blade_mail", true)
local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
local crest = NPC.GetItem(myHero, "item_solar_crest", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
local crimson = NPC.GetItem(myHero, "item_crimson_guard", true)
local staff = NPC.GetItem(myHero, "item_force_staff")
local pipe = NPC.GetItem(myHero, "item_pipe")
 local myMana = NPC.GetMana(myHero)
 local blink = NPC.GetItem(myHero, "item_blink", true) 
 local mousePos = Input.GetWorldCursorPos()
  --lotus
 if lotus and Ability.IsCastable(lotus,myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),300,0) then Ability.CastTarget(lotus,myHero) return end
 
 if bkb and Ability.IsCastable(bkb,myMana) and Menu.IsEnabled(Axe.bkbEnable) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),300,0) and Menu.IsEnabled(Axe.bkbEnable) then Ability.CastNoTarget(bkb) return end
 if crimson and Ability.IsCastable(crimson, myMana)  then Ability.CastNoTarget(crimson) return end
 if pipe and Ability.IsCastable(pipe, myMana) and hero ~=nil and NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 0 , 300) and Menu.IsEnabled(Axe.pipeEnable) then Ability.CastNoTarget(pipe) return end
 --blink 
 if blink and Ability.IsCastable(blink, myMana) and hero ~= nil and not NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then Ability.CastPosition(blink,heroPos) 
 else
if blink and Ability.IsCastable(blink, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1800, 0) then Ability.CastPosition(blink,heroPos) return end
if staff and Ability.IsCastable(staff, myMana) and hero ~= nil and not NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),0,300) and Menu.IsEnabled(Axe.staffEnable) then Ability.CastTarget(staff,myHero) return end
end
 
  
  
 if Ability.IsCastable(stan, myMana) and hero ~=nil and NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 0 , 300)  then Ability.CastNoTarget(stan) return end
 if bm and hero ~=nil and NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 0 , 300) and Ability.IsCastable(bm, myMana) then Ability.CastNoTarget(bm) return end
 --ult
 if Ability.IsCastable(ult,myMana) then Ability.CastTarget(ult, hero) return end
 --shiva
 if shiva and Ability.IsCastable(shiva,myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),800,0) then Ability.CastNoTarget(shiva) return end
 --medallion
 if medallion and Ability.IsCastable(medallion,myMana) then Ability.CastTarget(medallion,hero) return end
 if crest and Ability.IsCastable(crest,myMana) then Ability.CastTarget(crest,hero) return end


 end
 return Axe
