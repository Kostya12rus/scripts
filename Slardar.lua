local slardar ={}

slardar.optionEnable = Menu.AddOption({"Hero Specific", "Slardar"}, "Enabled", "")
slardar.optionKey = Menu.AddKeyOption({"Hero Specific", "Slardar"}, "ComboKey", Enum.ButtonCode.KEY_F)
slardar.bkbEnable = Menu.AddOption({"Hero Specific", "Slardar"}, "Use BKB", "")

function slardar.OnUpdate()
if not Menu.IsEnabled(slardar.optionEnable) then return true end
if not Menu.IsKeyDown(slardar.optionKey) then return end
slardar.ITABcombo()
end

function slardar.ITABcombo()


local myHero = Heroes.GetLocal()

if NPC.GetUnitName(myHero) ~= "npc_dota_hero_slardar" then return end
local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) --!
if not hero then return end

local heroPos = NPC.GetAbsOrigin(hero)
local stan = NPC.GetAbilityByIndex(myHero,1)
local ult = NPC.GetAbilityByIndex(myHero,3)

local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local lotus = NPC.GetItem(myHero,"item_lotus_orb", true)
local armlet = NPC.GetItem(myHero,"item_armlet", true)
local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
local crest = NPC.GetItem(myHero, "item_solar_crest", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)

 local myMana = NPC.GetMana(myHero)
 local blink = NPC.GetItem(myHero, "item_blink", true) 
 local mousePos = Input.GetWorldCursorPos()
  --lotus
 if lotus and Ability.IsCastable(lotus,myMana) then Ability.CastTarget(lotus,myHero) return end
 
 if bkb and Ability.IsCastable(bkb,myMana) and Menu.IsEnabled(slardar.bkbEnable) then Ability.CastNoTarget(bkb) return end

 --blink 
 if blink and Ability.IsCastable(blink, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then Ability.CastPosition(blink,heroPos) return end
 --stan
 if Ability.IsCastable(stan, myMana) and hero ~=nil and NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 350 , 0)  then Ability.CastNoTarget(stan) return end
 --ult
 if Ability.IsCastable(ult,myMana) then Ability.CastTarget(ult, hero) return end
 --shiva
 if shiva and Ability.IsCastable(shiva,myMana) then Ability.CastNoTarget(shiva) return end
 --medallion
 if medallion and Ability.IsCastable(medallion,myMana) then Ability.CastTarget(medallion,hero) return end
 if crest and Ability.IsCastable(crest,myMana) then Ability.CastTarget(crest,hero) return end


 end
 return slardar
