 local Enigma = {}  

Enigma.optionEnable = Menu.AddOption({ "Hero Specific","Enigma" }, "Enabled", "")
Enigma.optionKey = Menu.AddKeyOption({ "Hero Specific","Enigma" }, "Combo Key", Enum.ButtonCode.KEY_SPACE)
Enigma.bkbEnable = Menu.AddOption ({"Hero Specific", "Enigma"}, "Use BKB", "")


lastcasttime = 0
function Enigma.OnUpdate()
    if not Menu.IsEnabled(Enigma.optionEnable) then return true end
   if not Menu.IsKeyDown(Enigma.optionKey) then return end
   if NPC.GetUnitName(myHero) ~= "npc_dota_hero_enigma" then return end
    Enigma.ITABcombo()
end

function Enigma.ITABcombo()
   

    local myHero = Heroes.GetLocal()
	local myMana = NPC.GetMana(myHero)

    
    
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if not hero then return end
	local heroPos = NPC.GetAbsOrigin(hero)
	
	local Bhole = NPC.GetAbilityByIndex(myHero, 3)
    local mPulse = NPC.GetAbilityByIndex(myHero, 2)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
    local blink = NPC.GetItem(myHero, "item_blink", true)
    local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
    local SGuard = NPC.GetItem(myHero, "item_shivas_guard", true)
	
	
	local mousePos = Input.GetWorldCursorPos()
	
	 if Ability.IsCastable(Bhole, myMana) then
	if bkb and Menu.IsEnabled(Enigma.bkbEnable) and Ability.IsCastable(bkb,myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),500,0) then Ability.CastNoTarget(bkb) return end
	
	if not NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 0 , 250) then 
	if blink and Ability.IsCastable(blink, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then Ability.CastPosition(blink,heroPos) return end
	end
	
	if Ability.IsCastable(mPulse, myMana) and hero ~=nil and NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 700 , 0) then Ability.CastPosition(mPulse, heroPos) return end
    Ability.CastPosition(Bhole, heroPos)
	lastcasttime = os.clock()
	if SGuard and Ability.IsCastable(SGuard, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),500,0) then Ability.CastNoTarget(SGuard) return end
	end
	
   if (os.clock() - lastcasttime) < 3.9 then return end
    	
	if refresher and Ability.IsCastable(refresher,myMana) then Ability.CastNoTarget(refresher) return end
	
	end



	return Enigma
	
