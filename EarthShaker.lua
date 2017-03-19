local Shaker = {}  

Shaker.optionEnable = Menu.AddOption({ "Hero Specific","Shaker" }, "Enabled", "")
Shaker.optionKey = Menu.AddKeyOption({ "Hero Specific","Shaker" }, "Combo Key", Enum.ButtonCode.KEY_SPACE)
Shaker.bkbEnable = Menu.AddOption ({"Hero Specific", "Shaker"}, "Use BKB", "")
Shaker.refreshEnable = Menu.AddOption ({"Hero Specific", "Shaker"}, "Use Refresher", "")

time = 0
lastcasttime = 0

function Shaker.OnUpdate()
    if not Menu.IsEnabled(Shaker.optionEnable) then return true end
   if not Menu.IsKeyDown(Shaker.optionKey) then return end
    Shaker.ITABcombo()
end

function Shaker.ITABcombo()
   

    local myHero = Heroes.GetLocal()
	local myMana = NPC.GetMana(myHero)

    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_earthshaker" then return end
    
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if not hero then return end
	local heroPos = NPC.GetAbsOrigin(hero)
	
	local Slam = NPC.GetAbilityByIndex(myHero, 3)
    local Totem = NPC.GetAbilityByIndex(myHero, 1)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
    local blink = NPC.GetItem(myHero, "item_blink", true)
    local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
    local SGuard = NPC.GetItem(myHero, "item_shivas_guard", true)
	local Discord = NPC.GetItem(myHero, "item_veil_of_discord", true)
	
	
	local mousePos = Input.GetWorldCursorPos()
	
	 if Ability.IsCastable(Slam, myMana) and blink and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then
	
	if bkb and Menu.IsEnabled(Shaker.bkbEnable) and Ability.IsCastable(bkb,myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),500,0) then Ability.CastNoTarget(bkb) return end
	if Discord and Ability.IsCastable(Discord, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1000,0) then Ability.CastPosition(Discord,heroPos) return end
	
	if not NPC.IsPositionInRange(myHero,NPC.GetAbsOrigin(hero), 0 , 275) then 
	if blink and Ability.IsCastable(blink, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) then Ability.CastPosition(blink,heroPos) return end
	    end
	
	if Slam and Ability.IsCastable(Slam, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),275,0) then Ability.CastNoTarget(Slam) end
    if Totem and Ability.IsCastable(Totem, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),275,0) then Ability.CastNoTarget(Totem) end
	
	--Ability.CastNoTarget(Slam)
	--Ability.CastNoTarget(Totem)
		
	lastcasttime = os.clock()
	
	if SGuard and Ability.IsCastable(SGuard, myMana) and hero ~= nil and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),500,0) then Ability.CastNoTarget(SGuard) return end
	
	end
	
	if (os.clock() - lastcasttime) < 3.9 then return end
	
	if not NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),1200,0) and blink then return end
    	  	
	if refresher and Menu.IsEnabled(Shaker.refreshEnable) and Ability.IsCastable(refresher,myMana) and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),275,0) then Ability.CastNoTarget(refresher) return end
	
	end

	return Shaker