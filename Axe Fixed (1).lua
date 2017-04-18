local Axe ={}

Axe.optionEnable = Menu.AddOption({"Hero Specific", "Axe3"}, "Enabled", "")
Axe.optionKey = Menu.AddKeyOption({"Hero Specific", "Axe3"}, "ComboKey", Enum.ButtonCode.KEY_F)
Axe.bkbEnable = Menu.AddOption({"Hero Specific", "Axe3"}, "Use BKB", "")
Axe.mjollnirEnable = Menu.AddOption({"Hero Specific", "Axe3"}, "Use Mjollnir", "")
Axe.pipeEnable = Menu.AddOption({"Hero Specific", "Axe3"}, "Use Pipe", "")
Axe.staffEnable = Menu.AddOption({"Hero Specific", "Axe3"}, "Use Force Staff[BETA]", "")
Axe.battlehungerEnable = Menu.AddOption({"Hero Specific", "Axe3"}, "Use Battlehunger", "")
Axe.Hero = nil

function Axe.OnUpdate()
if not Menu.IsEnabled(Axe.optionEnable) then return true end
if not Menu.IsKeyDown(Axe.optionKey) then return end
Axe.ITABcombo()
end

function Axe.ITABcombo()


local myHero = Heroes.GetLocal()

if NPC.GetUnitName(myHero) ~= "npc_dota_hero_axe" then return end
local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) --!
if not hero then return end

local heroPos = NPC.GetAbsOrigin(hero)
local stan = NPC.GetAbilityByIndex(myHero,0)
local bh = NPC.GetAbilityByIndex(myHero,1)

local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
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
 --blink
 if staff and Ability.IsCastable(staff, myMana) and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1650,0)  and not NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1000,0) and Menu.IsEnabled(Axe.staffEnable) then Ability.CastTarget(staff,myHero) return end
 if lotus and Ability.IsCastable(lotus,myMana) and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then Ability.CastTarget(lotus,myHero) return end
 if mjollnir and Ability.IsCastable(mjollnir,myMana) and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then Ability.CastTarget(mjollnir,myHero) return end
 if blink and Ability.IsCastable(blink, myMana) and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1100,0) then Ability.CastPosition(blink,heroPos) return end 
 if Ability.IsCastable(stan, myMana) and hero ~=nil and NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 0 , 300)  then Ability.CastNoTarget(stan) return end
 if bm and Ability.IsCastable(bm, myMana) and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),350,0) then Ability.CastNoTarget(bm) return end
 if bkb and Ability.IsCastable(bkb,myMana) and Menu.IsEnabled(Axe.bkbEnable) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),300,0) and Menu.IsEnabled(Axe.bkbEnable) then Ability.CastNoTarget(bkb) return end
 if crimson and Ability.IsCastable(crimson, myMana) then Ability.CastNoTarget(crimson) return end
 if pipe and Ability.IsCastable(pipe, myMana) and Menu.IsEnabled(Axe.pipeEnable) then Ability.CastNoTarget(pipe) return end
 --bh
 if Menu.IsEnabled (Axe.battlehungerEnable) and Ability.IsCastable(bh,myMana) then Ability.CastTarget(bh, hero) return end
 --shiva
 if shiva and Ability.IsCastable(shiva,myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),800,0) then Ability.CastNoTarget(shiva) return end
 --medallion
 if medallion and Ability.IsCastable(medallion,myMana) then Ability.CastTarget(medallion,hero) return end
 if crest and Ability.IsCastable(crest,myMana) then Ability.CastTarget(crest,hero) return end
end

return Axe