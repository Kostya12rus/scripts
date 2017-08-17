-- Author: paroxysm
-- Version: 3
-- Updated: 05.02.2017
local Tinker = {}

Tinker.optionEnable = Menu.AddOption({ "Hero Specific","Tinker" }, "Enabled", "")
Tinker.optionKey = Menu.AddKeyOption({ "Hero Specific","Tinker" }, "Key", Enum.ButtonCode.KEY_F)

Tinker.myorderkey = Menu.AddKeyOption({ "Hero Specific","Tinker", "Custom" }, "Custom order key", Enum.ButtonCode.KEY_D)

Tinker.orders = {}

for i = 1, 13 do 
	local temp = ""
	if i < 10 then temp = "0" end
	Tinker.orders[i] =  Menu.AddOption({ "Hero Specific","Tinker", "Custom" }, 
		"Spell cast " .. temp .. i .. " :", "List:\r\n1 - Blink Dagger\r\n2 - Soul Ring\r\n3 - Hex\r\n4 - Veil\r\n5 - Ethereal\r\n6 - Orchid" .. 
		"\r\n7 - Blood\r\n8 - Rod\r\n9 - Bottle\r\n10 - Dagon\r\n11 - Shiva\r\n12 - Laser\r\n13 - Rockets\r\n14 - March\r\n15 - Rearm"
		, 1, 16)
end

local MenuItems = {}
MenuItems[1] =  "Off"
MenuItems[2] =  "Blink"
MenuItems[3] =  "Soul Ring"
MenuItems[4] =  "Hex"
MenuItems[5] =  "Veil"
MenuItems[6] =  "Ethereal"
MenuItems[7] =  "Orchid"
MenuItems[8] =  "Blood"
MenuItems[9] =  "Rod"
MenuItems[10] =  "Bottle"
MenuItems[11] =  "Dagon"
MenuItems[12] =  "Shiva"
MenuItems[13] =  "Laser"
MenuItems[14] =  "Rockets"
MenuItems[15] =  "March"
MenuItems[16] =  "Rearm"

for k, v in pairs(MenuItems) do
	for i = 1, 13 do 
		Menu.SetValueName(Tinker.orders[i], k, v)
	end
end
	
Tinker.stopcast = Menu.AddOption({ "Hero Specific","Tinker" }, "Stop cast then mana", "")
Tinker.threshold = Menu.AddOption({ "Hero Specific","Tinker" }, "Stop cast threshold", "", 75, 500, 25)

Tinker.calculator = Menu.AddOption({ "Hero Specific","Tinker" }, "DMG Calculator", "")

Tinker.blink = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Blink", "")
Tinker.soul = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Soul Ring", "")
Tinker.veil = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Veil of Discord", "")
Tinker.hex = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Hex", "")
Tinker.ethereal = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Ethereal Blade", "")
Tinker.orchid = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Orchid", "")
Tinker.blood = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Bloodthorn", "")
Tinker.dagon = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Dagon", "")
Tinker.shiva = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Shiva's Guard", "")
Tinker.laser = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill Laser", "")
Tinker.rocket = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill Rockets", "")
Tinker.rearm = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill Rearm", "")
Tinker.bottle = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill bottle", "")

	
Tinker.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)


time = 0
lastcasttime = 0
ordernow = 0
delay = 0

function Tinker.OnUpdate()
	if not Menu.IsEnabled(Tinker.optionEnable) then return end
	if Menu.IsKeyDown(Tinker.optionKey)  or Menu.IsKeyDown(Tinker.myorderkey) then
		Tinker.ComboWombo()
	end
end

function Tinker.OnDraw()
    if not Menu.IsEnabled(Tinker.calculator) then return true end
	
    local myHero = Heroes.GetLocal()
    if not myHero then return end
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tinker" then return end
	local totaldmg = 0
	local xfactor = 1;

	local ethereal = NPC.GetItem(myHero, "item_ethereal_blade", true)
	if ethereal and Menu.IsEnabled(Tinker.ethereal) then xfactor = xfactor + 0.4 totaldmg = totaldmg + 75 + (Hero.GetIntellectTotal(myHero) * 2) end

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	if veil and Menu.IsEnabled(Tinker.veil) then xfactor = xfactor + 0.25 end
	
    local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
	if shiva and Menu.IsEnabled(Tinker.shiva) then totaldmg = totaldmg + ( Ability.GetLevelSpecialValueFor(shiva, "blast_damage") * xfactor ) end
   

	for i = 0, 5 do
		local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
		if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
        if dagon and Menu.IsEnabled(Tinker.dagon) then
			totaldmg = totaldmg + ( Ability.GetLevelSpecialValueFor(dagon, "damage") * xfactor)
		end
    end	
	
	local laser = NPC.GetAbilityByIndex(myHero, 0)
    local rocket = NPC.GetAbilityByIndex(myHero, 1)
   
	if Ability.GetLevel(laser) > 0 then totaldmg = totaldmg + Ability.GetLevelSpecialValueFor(laser, "laser_damage") end
	if Ability.GetLevel(rocket) > 0 then totaldmg = totaldmg + (Ability.GetDamage(rocket) * xfactor) end
   

	Renderer.SetDrawColor(0, 0, 0, 255)
	Renderer.DrawFilledRect(0, 180, 160, 40)
	
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(Tinker.font, 10, 190, "total dmg~: " .. math.floor(totaldmg), 1)
end

function Tinker.ComboWombo()
	
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tinker" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	
    if (os.clock() - time) < delay then return end
    if (os.clock() - lastcasttime) > 3 then ordernow = 0 end
	
    local heroPos = Entity.GetAbsOrigin(hero)
    local laser = NPC.GetAbilityByIndex(myHero, 0)
    local rocket = NPC.GetAbilityByIndex(myHero, 1)
    local march = NPC.GetAbilityByIndex(myHero, 2)
    local rearm = NPC.GetAbilityByIndex(myHero, 3)

	if Ability.IsInAbilityPhase(rearm) then return end
	if Ability.IsChannelling(rearm) then return end

	
    local blink = NPC.GetItem(myHero, "item_blink", true)
    local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
    local soul = NPC.GetItem(myHero, "item_soul_ring", true)
    local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
    local hex = NPC.GetItem(myHero, "item_sheepstick", true)
    local blood = NPC.GetItem(myHero, "item_bloodthorn", true)
    local rod = NPC.GetItem(myHero, "item_rod_of_atos", true)
    local orchid = NPC.GetItem(myHero, "item_orchid", true)
    local ethereal = NPC.GetItem(myHero, "item_ethereal_blade", true)
    local bottle = NPC.GetItem(myHero, "item_bottle", true)

	
    local myMana = NPC.GetMana(myHero)
    if Menu.IsEnabled(Tinker.stopcast) and myMana <= Menu.GetValue(Tinker.threshold) then return end
    local mousePos = Input.GetWorldCursorPos()
	local customCastNow = 1
	-- For order
	if Menu.IsKeyDown(Tinker.myorderkey) then 
		ordernow = ordernow + 1
		if ordernow == 14 then ordernow = 1 end	
		customCastNow = Menu.GetValue(Tinker.orders[ordernow])
	end
	lastcasttime = os.clock()
	
	
    -- 2. Blink to hero
    if blink and Ability.IsCastable(blink, myMana) and Menu.IsEnabled(Tinker.blink) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 2) then Ability.CastPosition(blink, mousePos) MakeDelay(0.1) return end
 
    -- 3. Soul Ring
    if soul and Ability.IsCastable(soul, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(rocket))and Menu.IsEnabled(Tinker.soul) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 3) then Ability.CastNoTarget(soul) MakeDelay(0.1) return end
 
    -- 4. Hex
    if hex and hero and Ability.IsCastable(hex, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(laser)+110) and Menu.IsEnabled(Tinker.hex) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 4) then Ability.CastTarget(hex, hero) MakeDelay(0.1) return end
 
    -- 5. Veil of discord
    if veil and Ability.IsCastable(veil, myMana) and Menu.IsEnabled(Tinker.veil) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 5) then Ability.CastPosition(veil, heroPos) MakeDelay(0.1) return end

    -- 6. Ethereal
    if ethereal and hero and Ability.IsCastable(ethereal, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(laser))and Menu.IsEnabled(Tinker.ethereal) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 6) then Ability.CastTarget(ethereal, hero) MakeDelay(0.1) return end

    -- 7. Orchid
    if orchid and hero and Ability.IsCastable(orchid, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Menu.IsEnabled(Tinker.orchid) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 7) then Ability.CastTarget(orchid, hero) MakeDelay(0.1) return end

    -- 8. Blood
    if blood and hero and Ability.IsCastable(blood, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Menu.IsEnabled(Tinker.blood) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 8) then Ability.CastTarget(blood, hero) MakeDelay(0.1) return end

    -- 9. Rod
    if rod and hero and Ability.IsCastable(rod, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Menu.IsKeyDown(Tinker.myorderkey) and customCastNow == 9 then Ability.CastTarget(rod, hero) MakeDelay(0.3) return end

    -- 10. Bottle
  
	 if bottle and Ability.IsCastable(bottle, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(rocket))and Menu.IsEnabled(Tinker.bottle) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 10) then Ability.CastNoTarget(bottle) MakeDelay(0.2) return end

    -- 11. Dagon

    for i = 0, 5 do
        local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
		if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
        if dagon and hero and Ability.IsCastable(dagon, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(laser)) and Menu.IsEnabled(Tinker.dagon) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 11) then Ability.CastTarget(dagon, hero) MakeDelay(0.2) return end
    end
	
    -- 12. Shiva
    if shiva and Ability.IsCastable(shiva, myMana) and Menu.IsEnabled(Tinker.shiva) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 12) then Ability.CastNoTarget(shiva) MakeDelay(0.2) return end

	-- 14. Rockets
    if Ability.IsCastable(rocket, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(rocket)) and Menu.IsEnabled(Tinker.rocket) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 14) then Ability.CastNoTarget(rocket) MakeDelay(0.2) return end
    
    -- 13. Laser
    if Ability.IsCastable(laser, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(laser)) and Menu.IsEnabled(Tinker.laser) and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 13) then Ability.CastTarget(laser, hero) MakeDelay(0.2)  return end
 
   
	-- 15. March
	if Ability.IsCastable(march, myMana) and Menu.IsKeyDown(Tinker.myorderkey) and customCastNow == 15 then Ability.CastPosition(march, NPC.GetAbsOrigin(myHero)) MakeDelay(0.6) return end

    -- 16. Rearm
    if Ability.IsCastable(rearm, myMana) and Ability.IsReady(rearm) and Menu.IsEnabled(Tinker.rearm) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(rocket))and (not Menu.IsKeyDown(Tinker.myorderkey) or customCastNow == 16) then 
		Ability.CastNoTarget(rearm) MakeDelay(0.9)
	return end

end

function MakeDelay(sec)
	delay = sec-0.1
	time = os.clock()
end

return Tinker