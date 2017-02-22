--Author: Neil Tyson
local Huskar = {}

Huskar.optionEnable = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Enabled", "Script by Neil Tyson")
Huskar.optionLifebreak = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Lifebreak", "")
Huskar.optionInnerVitality = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Inner Vitality", "")
Huskar.optionThreshold = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson" }, "Auto Inner Vitality Treshhold", "", 10, 100, 5)
Huskar.optionArmlet = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Armlet", "")
Huskar.optionBurningSpear = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Toggle Burning Spear", "")
Huskar.optionBlademail = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Blademail", "")
Huskar.optionBlackKingBar = Menu.AddOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Auto Black King Bar", "")
Huskar.optionKey = Menu.AddKeyOption({ "Hero Specific", "Huskar. Script By Neil Tyson"}, "Key", Enum.ButtonCode.KEY_F)
Huskar.optionVersion = Menu.AddOption({ "Hero Specific","Huskar. Script By Neil Tyson" }, "Version", "Author: Neil deGrasse Tyson", 3, 3, 3)

Huskar.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

-- delay times.
-- add more variables here if you want delays for specific parts of the code.
Huskar.nextTimes = 
{ 
	global = 0, -- delay for the entire combo.
	spear = 0 -- delay for burning spears only.
}

Huskar.lastKnownHero = nil

function Huskar.ReinitializeTimes()
	for k, v in pairs(Huskar.nextTimes) do
		Huskar.nextTimes[k] = 0
	end
end

-- More options to be added later when suggested

function Huskar.OnUpdate()
	local myHero = Heroes.GetLocal()
	local innervitality = NPC.GetAbilityByIndex(myHero, 0)
	
	if not Menu.IsEnabled(Huskar.optionEnable) then return end
		if Menu.IsKeyDown(Huskar.optionKey) then
			Huskar.Combo(myHero)
		end
		if Menu.IsEnabled(Huskar.optionInnerVitality) then
			Huskar.innervitality(myHero, Menu.GetValue(Huskar.optionThreshold))
		end
end

function Huskar.innervitality(myHero, optionThreshold)
	local min = 99999
	local myMana = NPC.GetMana(myHero)
	local innervitality = NPC.GetAbilityByIndex(myHero, 0)
   	local percentage = math.floor(Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero) * 100)

    if Entity.GetHealth(myHero) > 0 and Entity.GetHealth(myHero) < min and percentage <= optionThreshold then
       	min = Entity.GetHealth(myHero)
    end
    if(min < 99999) and Menu.IsEnabled(Huskar.optionInnerVitality) and Ability.IsCastable(innervitality, myMana) then
     Ability.CastTarget(innervitality, myHero)
     return
   end
end

function Huskar.Combo(myHero)
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_huskar" then return end

	-- reinitialize values so the script doesn't break upon joining a new game (the next time will be much higher than the current time)
	if Huskar.lastKnownHero ~= myHero then
		Huskar.ReinitializeTimes()
		Huskar.lastKnownHero = myHero
	end

	local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)

	if not hero then return end

	local heroPos = Entity.GetAbsOrigin(hero)

	local curtime = GameRules.GetGameTime()

	-- do not execute if delay has not passed.
	if curtime < Huskar.nextTimes.global then return end

	--Abilities
	--local innervitality = NPC.GetAbilityByIndex(myHero, 0)
	local burningspear = NPC.GetAbilityByIndex(myHero, 1)
	local berserkerblood = NPC.GetAbilityByIndex(myHero, 2)
	local lifebreak = NPC.GetAbilityByIndex(myHero, 3)

	--Items
	local armlet = NPC.GetItem(myHero, "item_armlet", true)
	local blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)


	local myMana = NPC.GetMana(myHero)
	local mousePos = Input.GetWorldCursorPos()

	--Inner Vitality removed for auto heal with threshold
	--if Ability.IsCastable(innervitality, myMana) and Menu.IsEnabled(Huskar.optionInnerVitality) and Menu.IsKeyDown(Huskar.optionKey)
		--then 
		--Ability.CastTarget(innervitality, myHero)
		--return 
	--end

	--Blademail
	if blademail and Ability.IsCastable(blademail, myMana) and Menu.IsEnabled(Huskar.optionBlademail) and Menu.IsKeyDown(Huskar.optionKey)
		then 
		Ability.CastNoTarget(blademail)
	end

	--Searing Arrows
	if burningspear and Menu.IsEnabled(Huskar.optionBurningSpear) and Ability.IsCastable(burningspear, myMana) and curtime > Huskar.nextTimes.spear
		then
		Ability.CastTarget(burningspear, hero)

		local attackTime = NPC.GetAttackTime(myHero)
		--Huskar.MakeDelay("global", attackTime)
		Huskar.MakeDelay("spear", attackTime)
		return
	end

	--Life Break
	if lifebreak and Ability.IsCastable(lifebreak, myMana) and Menu.IsEnabled(Huskar.optionLifebreak) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(lifebreak)) and Menu.IsKeyDown(Huskar.optionKey)
		then 
		Ability.CastTarget(lifebreak, hero)
		Huskar.MakeDelay("global", Ability.GetCastPoint(lifebreak))
		return 
	end

	--Black King Bar
	if bkb and Ability.IsCastable(bkb, myMana) and Menu.IsEnabled(Huskar.optionBlackKingBar) and Menu.IsKeyDown(Huskar.optionKey) 
		then 
		Ability.CastNoTarget(bkb)
		Huskar.MakeDelay("global", 0.1)
		return 
	end

	--Armlet
	if armlet and not Ability.GetToggleState(armlet) and Menu.IsEnabled(Huskar.optionArmlet)
        then
        Ability.Toggle(armlet, true) 
        Huskar.MakeDelay("global", 0.1)
       return 
    end
end

function Huskar.MakeDelay(key, sec)
	Huskar.nextTimes[key] = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + sec
end
--Log.Write("HUSKAR SUCCESSFULLY RELOADED FINAL????") Ignore this. It was for debugging Purposes.
return Huskar
