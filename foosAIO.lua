-- foosAIO.lua
-- Version: 0.02a (alpha initial release)
-- Author: foo0oo
-- Release Date: 2017/5/03

local fooAllInOne = {}

fooAllInOne.optionEnable = Menu.AddOption({ "Utility","foos AllInOne" }, "Enabled", "Helpers helper")
fooAllInOne.optionComboKey = Menu.AddKeyOption({ "Utility","foos AllInOne" }, "Combo Key", Enum.ButtonCode.KEY_SPACE)

fooAllInOne.optionKillStealEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Kill Steal" }, "Enabled", "uses skill nukes to kill enemy (only nukes, no disable abilities)")

fooAllInOne.optionItemEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Enabled", "Helpers helper")
fooAllInOne.optionItemSoulring = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Soulring", "Use Soulring before using spells")
fooAllInOne.optionItemVeil = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Veil Of Discord", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemHex = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Scythe Of Vyse", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemBlood = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Bloodthorn ", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemeBlade = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Ethereal Blade", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemOrchid = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Orchid Malevolence", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemAtos = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Rod Of Atos", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemAbyssal = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Abyssal Blade", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemHalberd = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Heavens Halbert", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemShivas = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Shivas Guard", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemDagon = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Dagon", "cast order - highest number will be cast first", -1, 10, 1)
fooAllInOne.optionItemUrn = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Urn of shadows", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemManta = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Manta Style", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemMjollnir = Menu.AddOption({ "Utility","foos AllInOne", "Auto Item Usage" }, "Use Item Mjollnir", "cast order - highest number will be cast first", 0, 10, 1)

Menu.SetValueName(fooAllInOne.optionItemVeil, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemHex, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemBlood, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemeBlade, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemOrchid, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemAtos, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemAbyssal, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemHalberd, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemShivas, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemUrn, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemDagon, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemDagon, -1, 'only if killable')
Menu.SetValueName(fooAllInOne.optionItemManta, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemMjollnir, 0, 'OFF')

fooAllInOne.optionLinkensEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Enabled", "Helpers helper")
fooAllInOne.optionLinkensForce = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Force Staff", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensEul = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Eul", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensHalberd = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Halberd", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensHex = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Hex", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensBlood = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Bloodthorn", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensOrchid = Menu.AddOption({ "Utility","foos AllInOne", "Auto Break Linkens" }, "Use Orchid", "to break Linkens - highest number will be prioritized", 0, 6, 1)

Menu.SetValueName(fooAllInOne.optionLinkensForce, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensEul, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensHalberd, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensHex, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensBlood, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensOrchid, 0, 'OFF')

fooAllInOne.optionUtilityEnable = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Enabled", "Helpers helper")
fooAllInOne.optionUtilityMidas = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Midas", "use midas on creeps with max exp bounty")
fooAllInOne.optionUtilityStick = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Stick/Wand", "will auto use stick/wand when hp below hp threshold")
fooAllInOne.optionUtilityHealth = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Treshold Hero Health", "Threshold for auto use stick, wand, mek, greaves", 5, 75, 5)
fooAllInOne.optionUtilityMek = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Mekansm", "will use mek when you or teammate in range is below hp threshold")
fooAllInOne.optionUtilityGreaves = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Greaves", "same as mek")
fooAllInOne.optionUtilityTalon = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Talon", "will use talon on highest hp creep (only neutrals)")
fooAllInOne.optionUtilityArcane = Menu.AddOption({ "Utility","foos AllInOne", "Auto Use Utility Items" }, "Auto Use Arcane Boots", "will use arcanes if you are mana missing or teammate in range is below 40% mana")



fooAllInOne.optionHeroAxe = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Axe Combo", "basic axe script, will focus nearest hero to cursor")
fooAllInOne.optionHeroClock = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Clockwerk Combo", "full combo with hookshot prediction (will not check for collision with npcs)")
fooAllInOne.optionHeroSky = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Skywrath Combo", "full combo")
fooAllInOne.optionHeroTiny = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Tiny Combo", "full combo")
fooAllInOne.optionHeroWindrunner = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Windrunner Combo", "if branch in inventory, full combo with tree plant ;); else: if target shakled, then combo")
fooAllInOne.optionHeroTimber = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Timber Combo", "meh, cant target trees.. timberchain to cursor, if enemys are hit, full combo with chakram prediction")
fooAllInOne.optionHeroEmber = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Ember Combo", "hold combo key -> full combo with remnant, release key after ~ 1 sec -> fist+chains")
fooAllInOne.optionHeroUrsa = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Ursa Combo", "full combo, trigger enrage if 2 or more heroes in range")
fooAllInOne.optionHeroTA = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "TA Combo", "full combo")
fooAllInOne.optionHeroLegion = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Legion Commander Combo", "full combo")
fooAllInOne.optionHeroSlardar = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Slardar Combo", "full combo")
fooAllInOne.optionHeroClinkz = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Clinkz Combo", "full combo, auto ult on enemy creeps or neutrals when ready")
fooAllInOne.optionHeroQoP = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Queen of Pain Combo", "full combo; only uses ult if you have agahnims")
fooAllInOne.optionHeroSven = Menu.AddOption({ "Utility","foos AllInOne", "Hero Scripts" }, "Sven Combo", "full combo, MoM after everything is used")

lastCastTime = 0
lastCastTime2 = 0
gameTimeCheckVariable = 0
lastTick = 0
delay = 0
fooAllInOne.LinkensBreakerItemOrder = {}
fooAllInOne.ItemCastOrder = {}



function fooAllInOne.OnUpdate()
	if not Menu.IsEnabled(fooAllInOne.optionEnable) then return end
	if not GameRules.GetGameState() == 5 then return end
	local myHero = Heroes.GetLocal()
		if not myHero then return end
		if not Entity.IsAlive(myHero) then return end

	if next(fooAllInOne.ItemCastOrder) == nil then
		fooAllInOne.setOrderItem(false)
	end
 	if next(fooAllInOne.LinkensBreakerItemOrder) == nil then
		fooAllInOne.setOrderLinkens(false)
	end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))

	if enemy then
		
		if NPC.GetUnitName(myHero) == "npc_dota_hero_axe" then
			fooAllInOne.axeCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_rattletrap" then
			fooAllInOne.clockwerkCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_skywrath_mage" then
			fooAllInOne.skywrathCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_tiny" then
			fooAllInOne.tinyCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_windrunner" then
			fooAllInOne.WindRunnerCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_ember_spirit" then
			fooAllInOne.EmberCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_ursa" then
			fooAllInOne.UrsaCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_templar_assassin" then
			fooAllInOne.TACombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_legion_commander" then
			fooAllInOne.LegionCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_shredder" then
			fooAllInOne.TimberCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_slardar" then
			fooAllInOne.SlardarCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_clinkz" then
			fooAllInOne.ClinkzCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_queenofpain" then
			fooAllInOne.QoPCombo(myHero, enemy)
		elseif NPC.GetUnitName(myHero) == "npc_dota_hero_sven" then
			fooAllInOne.SvenCombo(myHero, enemy)
		else fooAllInOne.itemUsage(myHero, enemy)
		end
		
	end
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_clinkz" then
		fooAllInOne.ClinkzAutoUlt(myHero)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_shredder" then
		fooAllInOne.TimberSaveChakramReturn(myHero, enemy)
	end
	
	if Menu.IsEnabled(fooAllInOne.optionUtilityEnable) then
		fooAllInOne.utilityItemUsage(myHero)
	end

	if Menu.IsEnabled(fooAllInOne.optionKillStealEnable) then
		fooAllInOne.AutoNukeKillSteal(myHero)
	end

--	local modifiers = NPC.GetModifiers(myHero)
--	for _, modifier in ipairs(modifiers) do
--	local modifierName = Modifier.GetName(modifier)
--	Log.Write(modifierName)
--	end
--	Log.Write(NPC.GetAttackRange(myHero))

--	for i = 1, Abilities.Count() do
--	local abilities = Abilities.Get(i)
--	local abilityNames = Ability.GetName(abilities)
--	Log.Write(abilityNames)
--	end
	
end


function fooAllInOne.setOrderItem(printed)

	fooAllInOne.ItemCastOrder = {
        	{Menu.GetValue(fooAllInOne.optionItemVeil), "item_veil_of_discord"},
        	{Menu.GetValue(fooAllInOne.optionItemHex), "item_sheepstick"},
        	{Menu.GetValue(fooAllInOne.optionItemBlood), "item_bloodthorn"},
        	{Menu.GetValue(fooAllInOne.optionItemeBlade), "item_ethereal_blade"},
        	{Menu.GetValue(fooAllInOne.optionItemOrchid),"item_orchid"},
        	{Menu.GetValue(fooAllInOne.optionItemAtos),"item_rod_of_atos"},
		{Menu.GetValue(fooAllInOne.optionItemAbyssal),"item_abyssal_blade"},
		{Menu.GetValue(fooAllInOne.optionItemHalberd),"item_heavens_halberd"},
		{Menu.GetValue(fooAllInOne.optionItemShivas),"item_shivas_guard"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon"},
		{Menu.GetValue(fooAllInOne.optionItemUrn),"item_urn_of_shadows"},
		{Menu.GetValue(fooAllInOne.optionItemManta),"item_manta"},
		{Menu.GetValue(fooAllInOne.optionItemMjollnir),"item_mjollnir"}
    				}

    	table.sort(fooAllInOne.ItemCastOrder, function(a, b)
        	return a[1] > b[1]
    	end)
	Log.Write(".....Item Cast Order....")
	local printed = false
		if not printed then
			for k,v in ipairs(fooAllInOne.ItemCastOrder) do
			Log.Write(v[1]..':'..v[2])
			printed = true
			end
		end
end			

function fooAllInOne.setOrderLinkens(printed)
	
	fooAllInOne.LinkensBreakerItemOrder = {
        	{Menu.GetValue(fooAllInOne.optionLinkensForce), "item_force_staff"},
        	{Menu.GetValue(fooAllInOne.optionLinkensEul), "item_cyclone"},
        	{Menu.GetValue(fooAllInOne.optionLinkensHalberd), "item_heavens_halberd"},
        	{Menu.GetValue(fooAllInOne.optionLinkensHex), "item_sheepstick"},
        	{Menu.GetValue(fooAllInOne.optionLinkensBlood),"item_bloodthorn"},
        	{Menu.GetValue(fooAllInOne.optionLinkensOrchid),"item_orchid"}
    				}

    	table.sort(fooAllInOne.LinkensBreakerItemOrder, function(a, b)
        	return a[1] > b[1]
    	end)
	Log.Write(".....Linkens Breaker Priorization Order....")
	local printed = false
		if not printed then
			for k,v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
			Log.Write(v[1]..':'..v[2])
			printed = true
			end
		end			
	
end

function fooAllInOne.OnMenuOptionChange(option, old, new)

    	if option == fooAllInOne.optionItemVeil or
		option == fooAllInOne.optionItemHex or
		option == fooAllInOne.optionItemBlood or
		option == fooAllInOne.optionItemeBlade or 
		option == fooAllInOne.optionItemOrchid or 
		option == fooAllInOne.optionItemAtos or 
		option == fooAllInOne.optionItemAbyssal or 
		option == fooAllInOne.optionItemHalberd or 
		option == fooAllInOne.optionItemShivas or 
		option == fooAllInOne.optionItemDagon or 
		option == fooAllInOne.optionItemUrn or
		option == fooAllInOne.optionItemManta or
		option == fooAllInOne.optionItemMjollnir then
			fooAllInOne.setOrderItem(false)
	end
	
	if option == fooAllInOne.optionLinkensForce or
		option == fooAllInOne.optionLinkensEul or
		option == fooAllInOne.optionLinkensHalberd or
		option == fooAllInOne.optionLinkensHex or
		option == fooAllInOne.optionLinkensBlood or
		option == fooAllInOne.optionLinkensOrchid then
        		fooAllInOne.setOrderLinkens(false)
    	end

end

function fooAllInOne.targetChecker(genericEnemyEntity)

--	local enemys = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)

	if genericEnemyEntity and not NPC.IsDormant(genericEnemyEntity) and not NPC.IsIllusion(genericEnemyEntity) then

		if NPC.GetUnitName(genericEnemyEntity) == "npc_dota_hero_antimage" and NPC.HasItem(genericEnemyEntity, "item_ultimate_scepter", true) and NPC.HasModifier(genericEnemyEntity, "modifier_antimage_spell_shield") and Ability.IsReady(NPC.GetAbility(genericEnemyEntity, "antimage_spell_shield")) then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_item_lotus_orb_active") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_winter_wyvern_winters_curse") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_item_blade_mail_reflect") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_nyx_assassin_spiked_carapace") then
			return
		end
		if NPC.GetUnitName(genericEnemyEntity) == "npc_dota_hero_warlock" then
			return
		end

	return genericEnemyEntity
	end	
end


function fooAllInOne.makeDelay(sec)
	delay = sec + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)
	lastTick = os.clock()
end
	

function fooAllInOne.castLinearPrediction(myHero, enemy, adjustmentVariable)
	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)


	local cosGamma = (NPC.GetAbsOrigin(myHero) - enemyOrigin):Dot2D(enemyRotation:Scaled(100)) / ((NPC.GetAbsOrigin(myHero) - enemyOrigin):Length2D() * enemyRotation:Scaled(100):Length2D())
		if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(NPC.GetMoveSpeed(enemy) * adjustmentVariable * (1 - cosGamma)))
			end
		end
end

function fooAllInOne.castPrediction(myHero, enemy, adjustmentVariable)
	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)

	if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(NPC.GetMoveSpeed(enemy) * adjustmentVariable))
			end
		end
end


function fooAllInOne.itemUsage(myHero, enemy, activationMode)
	local activationCheck
		if activationMode == nil then
			activationCheck = false
		else activationCheck = activationMode
		end
	
	local myMana = NPC.GetMana(myHero)

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local hex = NPC.GetItem(myHero, "item_sheepstick", true)
	local blood = NPC.GetItem(myHero, "item_bloodthorn", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local orchid = NPC.GetItem(myHero, "item_orchid", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
	local atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local abyssal = NPC.GetItem(myHero, "item_abyssal_blade", true)
	local halberd = NPC.GetItem(myHero, "item_heavens_halberd", true)
	local shivas = NPC.GetItem(myHero, "item_shivas_guard", true)
	local urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)

	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end	

	for k,v in ipairs(fooAllInOne.ItemCastOrder) do
		local itemsCastOrder = v[1]
        	local castItem = v[2]

	if Menu.IsEnabled(fooAllInOne.optionItemEnable) and (Menu.IsKeyDown(fooAllInOne.optionComboKey) or (activationCheck and NPC.IsAttacking(myHero))) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
		
		if soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				return
			end
		else

			if itemsCastOrder == -1 then

				if dagon and castItem == "item_dagon" and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
					local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 16 / 100)))
					if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
						if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							Ability.CastTarget(dagon, enemy)
						end
					end
				end
			end
		
			if itemsCastOrder >= 1 then
	
				if abyssal and castItem == "item_abyssal_blade" and NPC.IsEntityInRange(myHero, enemy, 140) and Ability.IsCastable(abyssal, myMana) then 
					if not (NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.IsLinkensProtected(enemy)) then
						Ability.CastTarget(abyssal, enemy)
					end
				end

				if orchid and castItem == "item_orchid" and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(orchid, myMana) then 
					if not (NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.IsSilenced(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
						Ability.CastTarget(orchid, enemy)
					end
				end

				if blood and castItem == "item_bloodthorn" and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(blood, myMana) then 
					if not (NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.IsSilenced(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
						Ability.CastTarget(blood, enemy)
					end
				end

				if veil and castItem == "item_veil_of_discord" and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(veil, myMana) then 
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
					end
				end

				if hex and castItem == "item_sheepstick" and NPC.IsEntityInRange(myHero, enemy, 800 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(hex, myMana) then 
					if not (NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
						Ability.CastTarget(hex, enemy)
					end
				end

				if eBlade and castItem == "item_ethereal_blade" and NPC.IsEntityInRange(myHero, enemy, 800 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(eBlade, myMana) then 
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(eBlade, enemy)
					end
				end
	
				if atos and castItem == "item_rod_of_atos" and NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(atos, myMana) then 
					if not (NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.HasModifier(enemy, "modifier_rooted") or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED)) then
						Ability.CastTarget(atos, enemy)
					end
				end

				if halberd and castItem == "item_heavens_halberd" and NPC.IsEntityInRange(myHero, enemy, 600 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(halberd, myMana) then 
					if not (NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
						Ability.CastTarget(halberd, enemy)
					end
				end

				if shivas and castItem == "item_shivas_guard" and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(shivas, myMana) then 
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastNoTarget(shivas)
					end
				end

				if urn and castItem == "item_urn_of_shadows" and NPC.IsEntityInRange(myHero, enemy, 950 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(urn, myMana) and Item.GetCurrentCharges(urn) >= 3 and Entity.GetHealth(enemy) >= 300 then 
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(urn, enemy)
					end
				end

				if dagon and castItem == "item_dagon" and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then 
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(dagon, enemy)
					end
				end

				if manta and castItem == "item_manta" and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) then 
					Ability.CastNoTarget(manta)
--					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_DOTA_ORDER_ISSUER_SELECTED_UNITS, npc, queue, showEffects)
--					fooAllInOne.makeDelay(0.1)
				end

				if mjollnir and castItem == "item_mjollnir" and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) then 
					Ability.CastTarget(mjollnir, myHero)
				end
			
			end
		end	
		
	end	
	end
end

--function fooAllInOne.LinkensBreakable(myHero)
--
--	local myMana = NPC.GetMana(myHero)
--
--	for k, v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
--
--		if NPC.HasItem(myHero, v[2], true) then
--			if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) then
--				if v[1] > 0 then
--					return true
--				end
--			end
--		end	
--	end
--
--	return false
--end

function fooAllInOne.LinkensBreakerNew(myHero)
	if not Menu.IsEnabled(fooAllInOne.optionLinkensEnable) then return end

	local myMana = NPC.GetMana(myHero)

 	local prioItem
	local prioOrder = 0

	for k, v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
	
	
		if NPC.HasItem(myHero, v[2], true) then
			if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and v[1] > prioOrder then
					prioItem = v[2]
					prioOrder = v[1]
				
			end
		end	
	
	end
	return prioItem	
end
	

function fooAllInOne.utilityItemUsage(myHero)

	local stick = NPC.GetItem(myHero, "item_magic_stick", true)
	local wand = NPC.GetItem(myHero, "item_magic_wand", true)
	local mekansm = NPC.GetItem(myHero, "item_mekansm", true)
	local greaves = NPC.GetItem(myHero, "item_guardian_greaves", true)
	local arcane = NPC.GetItem(myHero, "item_arcane_boots", true)
	local midas = NPC.GetItem(myHero, "item_hand_of_midas", true)
	local talon = NPC.GetItem(myHero, "item_iron_talon", true)

	local myMana = NPC.GetMana(myHero)

	if (stick or wand) and Menu.IsEnabled(fooAllInOne.optionUtilityStick) then
		fooAllInOne.utilityItemStick(myHero, stick, wand)
	end
	if mekansm and Menu.IsEnabled(fooAllInOne.optionUtilityMek) then
		fooAllInOne.utilityItemMek(myHero, mekansm, myMana)
	end
	if greaves and Menu.IsEnabled(fooAllInOne.optionUtilityGreaves) then
		fooAllInOne.utilityItemGreaves(myHero, greaves)
	end
	if arcane and Menu.IsEnabled(fooAllInOne.optionUtilityArcane) then
		fooAllInOne.utilityItemArcane(myHero, arcane)
	end
	if midas and Menu.IsEnabled(fooAllInOne.optionUtilityMidas) then
		fooAllInOne.utilityItemMidas(myHero, midas)
	end
	if talon and Menu.IsEnabled(fooAllInOne.optionUtilityTalon) then
		fooAllInOne.utilityItemTalon(myHero, talon)
	end
end

function fooAllInOne.utilityItemStick(myHero, stick, wand)
	
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	
	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast")and not NPC.IsChannellingAbility(myHero) then
		if stick and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(stick) then
			if Item.GetCurrentCharges(stick) >= 1 then 
				Ability.CastNoTarget(stick)
				return
			end
		end
		if wand and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(wand) then 
			if Item.GetCurrentCharges(wand) >= 1 then 
				Ability.CastNoTarget(wand)
				return
			end
		end
	end
end

function fooAllInOne.utilityItemMek(myHero, mekansm, myMana)
	if not mekansm then return end
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	Log.Write(myHealthPerc)
	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
		if (myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth)) and Ability.IsCastable(mekansm, myMana) then 
			Ability.CastNoTarget(mekansm) 
			return
		end
	end

	for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
		if teamMates then
			if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(teamMates, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
				if (Entity.GetHealth(teamMates) / Entity.GetMaxHealth(teamMates)) * 100 <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsCastable(mekansm, myMana) then
					Ability.CastNoTarget(mekansm) 
					return 
				end
			end
		end
	end
end

function fooAllInOne.utilityItemGreaves(myHero, greaves)
	if not greaves then return end
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
		if greaves and (myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth)) and Ability.IsReady(greaves) then 
			Ability.CastNoTarget(greaves) 
			return
		end
	end

	for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
		if teamMates then
			if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(teamMates, "modifier_ice_blast") and not NPC.IsChannellingAbility(myHero) then	
				if greaves and (Entity.GetHealth(teamMates) / Entity.GetMaxHealth(teamMates)) * 100 <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(greaves) then
					Ability.CastNoTarget(greaves) 
					return 
				end
			end
		end
	end
end

function fooAllInOne.utilityItemArcane(myHero, arcane)
	if not arcane then return end
	local myManaMissing = NPC.GetMaxMana(myHero) - NPC.GetMana(myHero)
	if Entity.IsAlive(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.IsChannellingAbility(myHero) then
		if arcane and myManaMissing >= 200 and Ability.IsReady(arcane) then 
			Ability.CastNoTarget(arcane)
			return 
		end
	end


	for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
		if teamMates then
			if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.IsChannellingAbility(myHero) then
				if arcane and (NPC.GetMana(teamMates) / NPC.GetMaxMana(teamMates)) * 100 <= 40 and Ability.IsReady(arcane) then 
					Ability.CastNoTarget(arcane)
					return 
				end 
			end
		end
	end
end

function fooAllInOne.utilityItemMidas(myHero, midas)
	if not midas then return end
	AncientNameList = { "npc_dota_neutral_black_drake",
    				"npc_dota_neutral_black_dragon",
    				"npc_dota_neutral_blue_dragonspawn_sorcerer",
    				"npc_dota_neutral_blue_dragonspawn_overseer",
    				"npc_dota_neutral_granite_golem",
    				"npc_dota_neutral_elder_jungle_stalker",
    				"npc_dota_neutral_prowler_acolyte",
    				"npc_dota_neutral_prowler_shaman",
    				"npc_dota_neutral_rock_golem",
    				"npc_dota_neutral_small_thunder_lizard",
    				"npc_dota_neutral_jungle_stalker",
    				"npc_dota_neutral_big_thunder_lizard",
    				"npc_dota_roshan" }

	for _, creeps in pairs(NPC.GetUnitsInRadius(myHero, 580, Enum.TeamType.TEAM_ENEMY)) do
		local bounty = NPC.GetBountyXP(creeps)
		local creepName = NPC.GetUnitName(creeps)
			for _, ancientName in ipairs(AncientNameList) do
				if creepName ~= nil then	
					if creepName == ancientName then 
						return
					end
				end
			end
			if (NPC.IsLaneCreep(creeps) or NPC.IsCreep(creeps)) and bounty >= 88 and Ability.IsReady(midas) then
				Ability.CastTarget(midas, creeps)
				return
			end
	end
		

end

function fooAllInOne.utilityItemTalon(myHero, talon, midas)
	if not talon then return end
	if midas and Ability.IsReady(midas) then return end

	AncientNameList = { "npc_dota_neutral_black_drake",
    				"npc_dota_neutral_black_dragon",
    				"npc_dota_neutral_blue_dragonspawn_sorcerer",
    				"npc_dota_neutral_blue_dragonspawn_overseer",
    				"npc_dota_neutral_granite_golem",
    				"npc_dota_neutral_elder_jungle_stalker",
    				"npc_dota_neutral_prowler_acolyte",
    				"npc_dota_neutral_prowler_shaman",
    				"npc_dota_neutral_rock_golem",
    				"npc_dota_neutral_small_thunder_lizard",
    				"npc_dota_neutral_jungle_stalker",
    				"npc_dota_neutral_big_thunder_lizard",
    				"npc_dota_roshan" }

	local maxHPcreep
	local maxHP = 0
	for _, creeps in ipairs(NPC.GetUnitsInRadius(myHero, 250, Enum.TeamType.TEAM_ENEMY)) do
		if Entity.IsHero(creeps) or NPC.IsLaneCreep(creeps) then return end
	local creepName = NPC.GetUnitName(creeps)
			for _, ancientName in ipairs(AncientNameList) do
				if creepName ~= nil then	
					if creepName == ancientName then 
						return
					end
				end
			end


        if NPC.IsNeutral(creeps) and (Entity.GetHealth(creeps) / Entity.GetMaxHealth(creeps)) >= 0.7 and Entity.GetHealth(creeps) >= maxHP then
            maxHPcreep = creeps
            maxHP = Entity.GetMaxHealth(creeps)
        end
   	end

	if next(NPC.GetUnitsInRadius(myHero, 330, Enum.TeamType.TEAM_ENEMY)) == nil then
		maxHP = 0
	end

	if maxHPcreep and NPC.IsAttacking(myHero) and Ability.IsReady(talon) then
		Ability.CastTarget(talon, maxHPcreep)
		return
	end
end
		


function fooAllInOne.axeCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroAxe) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
	if (os.clock() - lastTick) < delay then return end

	
	local call = NPC.GetAbilityByIndex(myHero, 0)
	local hunger = NPC.GetAbilityByIndex(myHero, 1)
	local culling = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local myMana = NPC.GetMana(myHero)
	
	fooAllInOne.itemUsage(myHero, enemy)
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, 260) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
				return
			end
		else
			if culling and Entity.GetHealth(enemy) <= Ability.GetLevelSpecialValueFor(culling, "kill_threshold") and NPC.IsEntityInRange(myHero, enemy, 150) and Ability.IsCastable(culling, myMana) then 
				Ability.CastTarget(culling, enemy)
				return 
			end 
			if call and Ability.IsCastable(call, myMana) then 
				Ability.CastNoTarget(call)
				fooAllInOne.makeDelay(Ability.GetCastPoint(call))
				return 
			end
			if Blademail and NPC.HasModifier(enemy, "modifier_axe_berserkers_call") and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
				return 
			end
			if hunger and NPC.HasModifier(enemy, "modifier_axe_berserkers_call") and Ability.IsCastable(hunger, myMana - Ability.GetManaCost(culling)) then 
				Ability.CastTarget(hunger, enemy)
				fooAllInOne.makeDelay(Ability.GetCastPoint(hunger))
				return 
			end
			
		end
	end
end

function fooAllInOne.clockwerkCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroClock) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3100)	then return end
	if (os.clock() - lastTick) < delay then return end	
	
	local BatteryAssault = NPC.GetAbilityByIndex(myHero, 0)
	local PowerCogs = NPC.GetAbilityByIndex(myHero, 1)
	local RocketFlair = NPC.GetAbilityByIndex(myHero, 2)
	local HookShot = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local myMana = NPC.GetMana(myHero)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if HookShot and Ability.IsCastable(HookShot, myMana) and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(HookShot)) then
			local hookshotPrediction = Ability.GetCastPoint(HookShot) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / Ability.GetLevelSpecialValueFor(HookShot, "speed")) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
			Ability.CastPosition(HookShot, fooAllInOne.castLinearPrediction(myHero, enemy, hookshotPrediction))
			return
		end
	end

		if Entity.GetHealth(enemy) > 0 and NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) and Ability.GetCooldownTimeLeft(HookShot) > 1 and Ability.SecondsSinceLastUse(HookShot) <= 2 then
			fooAllInOne.itemUsage(myHero, enemy, true)
			if PowerCogs and Ability.IsCastable(PowerCogs, myMana) then 
				Ability.CastNoTarget(PowerCogs)
				fooAllInOne.makeDelay(Ability.GetCastPoint(PowerCogs))
				return 
			end
			if BatteryAssault and Ability.IsCastable(BatteryAssault, myMana) then 
				Ability.CastNoTarget(BatteryAssault)
				fooAllInOne.makeDelay(Ability.GetCastPoint(BatteryAssault))
				return 
			end
			if Blademail and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
				return 
			end			
			if RocketFlair and Ability.IsCastable(RocketFlair, myMana) then 
				Ability.CastPosition(RocketFlair, Entity.GetAbsOrigin(enemy))
				return 
			end
		end
	fooAllInOne.itemUsage(myHero, enemy)
end

function fooAllInOne.skywrathCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroSky) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1800)	then return end
	if (os.clock() - lastTick) < delay then return end

	local arcaneBolt = NPC.GetAbilityByIndex(myHero, 0)
    	local concussiveShot = NPC.GetAbilityByIndex(myHero, 1)
    	local ancientSeal = NPC.GetAbilityByIndex(myHero, 2)
    	local mysticFlare = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	fooAllInOne.itemUsage(myHero, enemy)
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 800) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(500)))
				return
			end
		
		else
	
			if ancientSeal and Ability.IsCastable(ancientSeal, myMana) then
				Ability.CastTarget(ancientSeal, enemy)
				fooAllInOne.makeDelay(Ability.GetCastPoint(ancientSeal))
				return
			end

			if arcaneBolt and Ability.IsCastable(arcaneBolt, myMana) then
				Ability.CastTarget(arcaneBolt, enemy)
				fooAllInOne.makeDelay(Ability.GetCastPoint(arcaneBolt))
				return
			end

			if concussiveShot and Ability.IsCastable(concussiveShot, myMana) then
				Ability.CastNoTarget(concussiveShot)
				fooAllInOne.makeDelay(Ability.GetCastPoint(concussiveShot))
				return
			end

			if mysticFlare and Ability.IsCastable(mysticFlare, myMana) then
				if NPC.HasModifier(enemy, "modifier_rod_of_atos_debuff") or NPC.HasModifier(enemy, "modifier_stunned") or NPC.HasModifier(enemy, "modifier_bashed") or NPC.HasModifier(enemy, "modifier_rooted") or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
					Ability.CastPosition(mysticFlare, Entity.GetAbsOrigin(enemy))
					return
				else
					local flarePrediction = Ability.GetCastPoint(mysticFlare) + 0.2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
					Ability.CastPosition(mysticFlare, fooAllInOne.castPrediction(myHero, enemy, flarePrediction))
					return
				end
			end

			if not (Ability.IsReady(ancientSeal) and Ability.IsReady(arcaneBolt) and Ability.IsReady(concussiveShot) and Ability.IsReady(mysticFlare)) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.makeDelay(0.1)
				return
			end
		end
	end
end			

function fooAllInOne.tinyCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroTiny) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
	if (os.clock() - lastTick) < delay then return end
    
    	local avalanche = NPC.GetAbilityByIndex(myHero, 0)
    	local toss = NPC.GetAbilityByIndex(myHero, 1)
    	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 275) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
				return
			end
		else

				if avalanche and Ability.IsCastable(avalanche, myMana) then 
					Ability.CastPosition(avalanche, Entity.GetAbsOrigin(enemy))
					fooAllInOne.makeDelay(Ability.GetCastPoint(avalanche))
					return 
				end

    				if toss and Ability.IsCastable(toss, myMana) and not Ability.IsReady(avalanche) then 
					Ability.CastTarget(toss, enemy)
					fooAllInOne.makeDelay(Ability.GetCastPoint(toss))
					return 
				end
		end
	end
	fooAllInOne.itemUsage(myHero, enemy)
end
   


function fooAllInOne.WindRunnerCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroWindrunner) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
	if (os.clock() - lastTick) < delay then return end

	local shackleShot = NPC.GetAbilityByIndex(myHero, 0)
	local powerShot = NPC.GetAbilityByIndex(myHero, 1)
	local windRun = NPC.GetAbilityByIndex(myHero, 2)
	local focusFire = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)
	
	local branch = NPC.GetItem(myHero, "item_branches", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and NPC.IsEntityInRange(myHero, enemy, 750) then
		if branch then
			if blink then	
				if shackleShot and Ability.IsCastable(shackleShot, myMana) then
					Ability.CastTarget(shackleShot, enemy)
			--		return
				end
				if blink and Ability.IsReady(blink) and not Ability.IsReady(shackleShot) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Rotated(Angle(0,45,0)):Normalized():Scaled(200))
					Ability.CastPosition(branch, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(150))
			--		return
				end
			end
		else fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Entity.GetHealth(enemy) > 0 then
		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then

			local shackleMod = NPC.GetModifier(enemy, "modifier_windrunner_shackle_shot")
				if not shackleMod then return end
			local shackleTime = Modifier.GetCreationTime(shackleMod) + Modifier.GetDuration(shackleMod)

			if NPC.HasModifier(enemy, "modifier_windrunner_shackle_shot") and Modifier.GetDuration(shackleMod) >= 1.5 then
				fooAllInOne.itemUsage(myHero, enemy, true)
				if focusFire and Ability.IsCastable(focusFire, myMana) then
					Ability.CastTarget(focusFire, enemy)
					return
				end
				if windRun and Ability.IsCastable(windRun, myMana) then
					Ability.CastNoTarget(windRun)
					return
				end
				if powerShot and Ability.IsCastable(powerShot, myMana) and Entity.GetHealth(enemy) <= (Ability.GetDamage(powerShot) * (1 - NPC.GetMagicalArmorValue(enemy))) then
					if GameRules.GetGameTime() <= (shackleTime - 1) then
						Ability.CastPosition(powerShot, Entity.GetAbsOrigin(enemy))
						return
					end
				end
			end
		end
	end
end



function fooAllInOne.TimberCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTimber) then return end
	
	if (os.clock() - lastTick) < delay then return end

	local whirlingDeath = NPC.GetAbilityByIndex(myHero, 0)
	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
	local chakram = NPC.GetAbility(myHero, "shredder_chakram")
	local chakramReturn = NPC.GetAbility(myHero, "shredder_return_chakram")
	local chakramAgha = NPC.GetAbility(myHero, "shredder_chakram_2")
	local chakramAghaReturn = NPC.GetAbility(myHero, "shredder_return_chakram_2")

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	local chainCheckRange = Ability.GetCastRange(timberChain) + NPC.GetCastRangeBonus(myHero)
		if blink then
			chainCheckRange = chainCheckRange + 1150
		end
	if not NPC.IsPositionInRange(myHero, Input.GetWorldCursorPos(), chainCheckRange, 0) then return end

	local myMana = NPC.GetMana(myHero)

	if Entity.GetHealth(enemy) > 0 and NPC.HasModifier(myHero, "modifier_shredder_timber_chain") then
		if whirlingDeath and Ability.IsCastable(whirlingDeath, myMana) and NPC.IsEntityInRange(myHero, enemy, 300) then
			Ability.CastNoTarget(whirlingDeath)
			fooAllInOne.makeDelay(Ability.GetCastPoint(whirlingDeath))
			return
		end
	end
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
	
		if not NPC.IsPositionInRange(myHero, Input.GetWorldCursorPos(), Ability.GetCastRange(timberChain), 0) then
			if blink and Ability.IsReady(blink) then
				Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) - (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(250))
			end
		else	
			if timberChain and Ability.IsCastable(timberChain, myMana) then
				Ability.CastPosition(timberChain, Input.GetWorldCursorPos())
				return
			end
			if NPC.HasModifier(enemy, "modifier_shredder_whirling_death_debuff") then
				fooAllInOne.itemUsage(myHero, enemy)
				local chakramPrediction = Ability.GetCastPoint(chakram) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 900) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				if blink and Ability.IsReady(blink) and (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D()) >= 800 then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					return
				elseif not Ability.IsHidden(chakram) then
					if chakram and Ability.IsCastable(chakram, myMana) then
						Ability.CastPosition(chakram, fooAllInOne.castLinearPrediction(myHero, enemy, chakramPrediction))
						lastCastTime = 1
						return
					end
				elseif not Ability.IsHidden(chakramAgha) and Ability.IsHidden(chakram) then
					if chakramAgha and Ability.IsCastable(chakramAgha, myMana) then
						Ability.CastPosition(chakramAgha, fooAllInOne.castLinearPrediction(myHero, enemy, chakramPrediction))
						lastCastTime2 = 1
						return
					end
				end
			end
		end


	end

	if not Ability.IsHidden(chakramReturn) and lastCastTime == 1 then
		if chakramReturn and Ability.IsCastable(chakramReturn, myMana) and (Ability.SecondsSinceLastUse(chakram) >= 1 and not NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff")) or (NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff") and Ability.SecondsSinceLastUse(chakram) >= 2.5) then
			Ability.CastNoTarget(chakramReturn)
			lastCastTime = 0
			return
		end
	end
	if not Ability.IsHidden(chakramAghaReturn) and lastCastTime2 == 1 then
		if chakramAghaReturn and Ability.IsCastable(chakramAghaReturn, myMana) and (Ability.SecondsSinceLastUse(chakramAgha) >= 1 and not NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff")) or (NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff") and Ability.SecondsSinceLastUse(chakramAgha) >= 2.5) then
			Ability.CastNoTarget(chakramAghaReturn)
			lastCastTime2 = 0
			return
		end
	end

end

function fooAllInOne.TimberSaveChakramReturn(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTimber) then return end

	local chakramReturn = NPC.GetAbility(myHero, "shredder_return_chakram")
	local chakramAghaReturn = NPC.GetAbility(myHero, "shredder_return_chakram_2")
	
	if Menu.IsKeyDownOnce(fooAllInOne.optionComboKey)then
		if not enemy then
			if not Ability.IsHidden(chakramReturn) and lastCastTime == 1 then
				if chakramReturn and Ability.IsReady(chakramReturn) then
					Ability.CastNoTarget(chakramReturn)
					lastCastTime = 0
					return
				end
			end
			if not Ability.IsHidden(chakramAghaReturn) and lastCastTime2 == 1 then
				if chakramAghaReturn and Ability.IsReady(chakramAghaReturn) then
					Ability.CastNoTarget(chakramAghaReturn)
					lastCastTime2 = 0
					return
				end
			end
		end
	end
end




function fooAllInOne.EmberCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroEmber) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1600)	then return end
	if (os.clock() - lastTick) < delay then return end


	local chains = NPC.GetAbility(myHero, "ember_spirit_searing_chains")
	local fist = NPC.GetAbility(myHero, "ember_spirit_sleight_of_fist")
	local flameGuard = NPC.GetAbility(myHero, "ember_spirit_flame_guard")
	local activeRemnant = NPC.GetAbilityByIndex(myHero, 3)
	local remnant = NPC.GetAbility(myHero, "ember_spirit_fire_remnant")
	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	local remnantModifier = NPC.GetModifier(myHero, "modifier_ember_spirit_fire_remnant_charge_counter")

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 800) then
			if blink and Ability.IsReady(blink) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(400)))
			end
		else
		
			if fist and Ability.IsCastable(fist, myMana) then
				Ability.CastPosition(fist, Entity.GetAbsOrigin(enemy))
				fooAllInOne.makeDelay(Ability.GetCastPoint(fist))
				return
			end
			if chains and Ability.IsCastable(chains, myMana) and NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") then
				local myPos = Entity.GetAbsOrigin(myHero)
				if NPC.IsPositionInRange(enemy, myPos, 250, 0) then
					Ability.CastNoTarget(chains)
					fooAllInOne.makeDelay(Ability.GetCastPoint(chains))
					return
				end
			end

			if flameGuard and Ability.IsCastable(flameGuard, myMana) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				Ability.CastNoTarget(flameGuard)
				fooAllInOne.makeDelay(Ability.GetCastPoint(flameGuard))
				return
			end
		
			if remnant and Ability.IsReady(remnant) and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.GetMana(myHero) >= Ability.GetManaCost(activeRemnant) then
				local remnantCharges = Modifier.GetStackCount(remnantModifier)
				if remnantCharges > 2 then
					lastCastTime = os.clock()
					Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
					local remnantTime = (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D()) / (2.5 * NPC.GetMoveSpeed(myHero))
					fooAllInOne.makeDelay(remnantTime)
					return
				end

				if remnantCharges >= 2 and ((os.clock() - lastCastTime) >= 3) then
					Log.Write(os.clock() - lastCastTime)
					Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
					local remnantTime = (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D()) / (2.5 * NPC.GetMoveSpeed(myHero))
					fooAllInOne.makeDelay(remnantTime)
					return
				end
			end
			local remnantCharges = Modifier.GetStackCount(remnantModifier)
			if activeRemnant and remnantCharges < 3 and Ability.IsCastable(activeRemnant, myMana) and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				Ability.CastPosition(activeRemnant, Entity.GetAbsOrigin(myHero))
				return
			end
		end
	end
	fooAllInOne.itemUsage(myHero, enemy)
end

function fooAllInOne.UrsaCombo(myHero, enemy)
	if not Menu.IsEnabled(fooAllInOne.optionHeroUrsa) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end
	if (os.clock() - lastTick) < delay then return end

	local earthShock = NPC.GetAbilityByIndex(myHero, 0)
	local overPower = NPC.GetAbilityByIndex(myHero, 1)
	local enrage = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if overPower and Ability.IsCastable(overPower, myMana) then
			Ability.CastNoTarget(overPower)
			fooAllInOne.makeDelay(Ability.GetCastPoint(overPower))
			return
		end
		if NPC.HasModifier(myHero, "modifier_ursa_overpower") then
			if blink and Ability.IsReady(blink) and not NPC.IsEntityInRange(myHero, enemy, 375) then
				Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
				return
			elseif NPC.IsEntityInRange(myHero, enemy, 375) then
				if earthShock and Ability.IsCastable(earthShock, myMana) then
					Ability.CastNoTarget(earthShock)
					return
				end
			end
		end
	end
	
	for k, _ in ipairs(NPC.GetHeroesInRadius(myHero, 650, Enum.TeamType.TEAM_ENEMY)) do		
		if (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) <= 0.35 and #NPC.GetHeroesInRadius(myHero, 650, Enum.TeamType.TEAM_ENEMY) >= 2 then
			if enrage and Ability.IsCastable(enrage, myMana) then
				Ability.CastNoTarget(enrage)
				return
			end
		end
	end
end

function fooAllInOne.TACombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTA) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
	if (os.clock() - lastTick) < delay then return end

	local refraction = NPC.GetAbilityByIndex(myHero, 0)
	local meld = NPC.GetAbilityByIndex(myHero, 1)
	local psionicTrap = NPC.GetAbilityByIndex(myHero, 4)
	local trap = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local refractionModifier = NPC.GetModifier(myHero, "modifier_templar_assassin_refraction_damage")
	local meldModifier = NPC.GetModifier(myHero, "modifier_templar_assassin_meld")

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.HasModifier(myHero, "modifier_templar_assassin_refraction_damage") then
			if refraction and Ability.IsCastable(refraction, myMana) then
				Ability.CastNoTarget(refraction)
				fooAllInOne.makeDelay(Ability.GetCastPoint(refraction))
				return
			end
		else
			if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
				if blink and Ability.IsReady(blink) then
					Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(200)))
					return
				end
			else
				if meld and Ability.IsCastable(meld, myMana) then
					Ability.CastNoTarget(meld)
					fooAllInOne.makeDelay(0.1)
					return
				end
				if NPC.HasModifier(myHero, "modifier_templar_assassin_meld") then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.makeDelay(0.1)
					return
				end
				if psionicTrap and Ability.IsCastable(psionicTrap, myMana) and not NPC.HasModifier(myHero, "modifier_templar_assassin_meld") and not Ability.IsReady(meld) then
					Ability.CastPosition(psionicTrap, Entity.GetAbsOrigin(enemy))
					fooAllInOne.makeDelay(Ability.GetCastPoint(psionicTrap))
					return
				end
				if trap and Ability.IsCastable(trap, myMana) and not Ability.IsReady(psionicTrap) and not Ability.IsReady(meld) then
					Ability.CastNoTarget(trap)
					fooAllInOne.makeDelay(Ability.GetCastPoint(trap))
					return
				end
			end
		end
	end		

end

function fooAllInOne.LegionCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroLegion) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end
	if (os.clock() - lastTick) < delay then return end

	local odds = NPC.GetAbilityByIndex(myHero, 0)
	local pressTheAttack = NPC.GetAbilityByIndex(myHero, 1)
    	local duel = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then

		if not NPC.IsEntityInRange(myHero, enemy, 150) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) then
					if Blademail and Ability.IsCastable(Blademail, myMana) then
						Ability.CastNoTarget(Blademail)
					end
					if pressTheAttack and Ability.IsCastable(pressTheAttack, myMana) then
						Ability.CastTarget(pressTheAttack, myHero)
						return
					end
					if blink and Ability.IsReady(blink) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.makeDelay(0.1)
				return
			end
		end
		if NPC.IsEntityInRange(myHero, enemy, 150) then
				if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
					if Blademail and Ability.IsCastable(Blademail, myMana) then
						Ability.CastNoTarget(Blademail)
					end
					if pressTheAttack and Ability.IsCastable(pressTheAttack, myMana) then
						Ability.CastTarget(pressTheAttack, myHero)
						return
					end
					if NPC.IsLinkensProtected(enemy) then
						if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
							Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
						end
					else
						Ability.CastTarget(duel, enemy)
					end
				end
		end
	end
	fooAllInOne.itemUsage(myHero, enemy)
end

function fooAllInOne.SlardarCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSlardar) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end
	if (os.clock() - lastTick) < delay then return end

	local sprint = NPC.GetAbilityByIndex(myHero, 0)
	local crush = NPC.GetAbilityByIndex(myHero, 1)
	local haze = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, 300) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.makeDelay(0.1)
				return
			end
		end
		if NPC.IsEntityInRange(myHero, enemy, 300) then
			
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
				if crush and Ability.IsCastable(crush, myMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastNoTarget(crush)
					fooAllInOne.makeDelay(Ability.GetCastPoint(crush))
					return
				end
				if NPC.IsLinkensProtected(enemy) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
					end
				end
				if haze and Ability.IsCastable(haze, myMana) and NPC.HasModifier(enemy, "modifier_stunned") then
					Ability.CastTarget(haze, enemy)
					fooAllInOne.makeDelay(Ability.GetCastPoint(haze))
					return
				end
			end
		end
	end

end

function fooAllInOne.ClinkzCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkz) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
	if (os.clock() - lastTick) < delay then return end

	local strafe = NPC.GetAbilityByIndex(myHero, 0)
	local searingArrows = NPC.GetAbilityByIndex(myHero, 1)
	local skeletonWalk = NPC.GetAbilityByIndex(myHero, 2)
	local deathPact = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)
	
	local clinkzAttackRange = NPC.GetAttackRange(myHero)
		if NPC.HasModifier(myHero, "modifier_item_dragon_lance") then
			clinkzAttackRange = clinkzAttackRange + 140
		end
	

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, clinkzAttackRange-160) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, NPC.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
			fooAllInOne.makeDelay(0.1)
			return
		end
		if NPC.IsEntityInRange(myHero, enemy, clinkzAttackRange-140) then
			
			if strafe and Ability.IsCastable(strafe, myMana) then
				Ability.CastNoTarget(strafe)
				fooAllInOne.makeDelay(Ability.GetCastPoint(strafe))
				return
			end
			if NPC.HasModifier(myHero, "modifier_clinkz_strafe") then
				Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
				fooAllInOne.makeDelay(0.1)
				return	
			end
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end
						
end

function fooAllInOne.ClinkzAutoUlt(myHero)

	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkz) then return end
	if (os.clock() - lastTick) < delay then return end

	AncientNameList = { "npc_dota_neutral_black_drake",
    				"npc_dota_neutral_black_dragon",
    				"npc_dota_neutral_blue_dragonspawn_sorcerer",
    				"npc_dota_neutral_blue_dragonspawn_overseer",
    				"npc_dota_neutral_granite_golem",
    				"npc_dota_neutral_elder_jungle_stalker",
    				"npc_dota_neutral_prowler_acolyte",
    				"npc_dota_neutral_prowler_shaman",
    				"npc_dota_neutral_rock_golem",
    				"npc_dota_neutral_small_thunder_lizard",
    				"npc_dota_neutral_jungle_stalker",
    				"npc_dota_neutral_big_thunder_lizard",
    				"npc_dota_roshan" }

	local deathPact = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)

	local maxHPcreep
	local maxHP = 0
	local ancientChecker = false
	for _, creeps in ipairs(NPC.GetUnitsInRadius(myHero, 380, Enum.TeamType.TEAM_ENEMY)) do
		if Entity.IsHero(creeps) then return end
	local creepName = NPC.GetUnitName(creeps)
			for _, ancientName in ipairs(AncientNameList) do
				if creepName ~= nil then	
					if creepName == ancientName then 
						ancientChecker = true
					end
				end
			end


      		if not ancientChecker and (NPC.IsCreep(creeps) or NPC.IsLaneCreep(creeps)) and Entity.GetMaxHealth(creeps) >= 550 and Entity.GetHealth(creeps) >= maxHP then
           		maxHPcreep = creeps
            		maxHP = Entity.GetMaxHealth(creeps)
        	end
   	end

	if next(NPC.GetUnitsInRadius(myHero, 380, Enum.TeamType.TEAM_ENEMY)) == nil then
		maxHP = 0
	end

	if maxHPcreep and deathPact and Ability.IsCastable(deathPact, myMana) and not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_clinkz_death_pact") then
		Ability.CastTarget(deathPact, maxHPcreep)
		fooAllInOne.makeDelay(Ability.GetCastPoint(deathPact))
		return
	end

end

function fooAllInOne.QoPCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroQoP) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end
	if (os.clock() - lastTick) < delay then return end

	local shadowStrike = NPC.GetAbilityByIndex(myHero, 0)
	local qopBlink = NPC.GetAbilityByIndex(myHero, 1)
	local screamOfPain = NPC.GetAbilityByIndex(myHero, 2)
	local sonicWave = NPC.GetAbilityByIndex(myHero, 3)

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if not NPC.IsEntityInRange(myHero, enemy, 425) then
			if qopBlink and Ability.IsCastable(qopBlink, myMana) then
				Ability.CastPosition(qopBlink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(350)))
				fooAllInOne.makeDelay(Ability.GetCastPoint(qopBlink))
			end
		else
			if screamOfPain and Ability.IsCastable(screamOfPain, myMana) then
				Ability.CastNoTarget(screamOfPain)
				return
			end
			if shadowStrike and Ability.IsCastable(shadowStrike, myMana) then
				Ability.CastTarget(shadowStrike, enemy)
				fooAllInOne.makeDelay(Ability.GetCastPoint(shadowStrike))
			end
		end
	end

	if aghanims then
		if NPC.IsEntityInRange(myHero, enemy, 1000) then
			if sonicWave and Ability.IsCastable(sonicWave, myMana) then
				if Entity.GetHealth(enemy) <= Ability.GetLevelSpecialValueFor(sonicWave, "damage_scepter") then
					Ability.CastPosition(sonicWave, (Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(600)))
					return
				end
			end
		end
	end
end

function fooAllInOne.SvenCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSven) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1200)	then return end
	if (os.clock() - lastTick) < delay then return end

	local stormHammer = NPC.GetAbilityByIndex(myHero, 0)
	local warCry = NPC.GetAbilityByIndex(myHero, 2)
	local godsStrength = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	local maskOfMadness = NPC.GetItem(myHero, "item_mask_of_madness", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, 150) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) then
					if warCry and Ability.IsCastable(warCry, myMana) then
						Ability.CastNoTarget(warCry)
					end
					if godsStrength and Ability.IsCastable(godsStrength, myMana) then
						Ability.CastNoTarget(godsStrength)
						fooAllInOne.makeDelay(Ability.GetCastPoint(godsStrength))
					end
					if blink and Ability.IsReady(blink) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					end
				end
				if not blink or (blink and not Ability.IsReady(blink)) then
					if stormHammer and Ability.IsCastable(stormHammer, myMana) and not (NPC.IsLinkensProtected(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
						Ability.CastTarget(stormHammer, enemy)
						return
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.makeDelay(0.1)
				return
			end
		end
		if NPC.IsEntityInRange(myHero, enemy, 150) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
				if warCry and Ability.IsCastable(warCry, myMana) then
					Ability.CastNoTarget(warCry)
				end
				if godsStrength and Ability.IsCastable(godsStrength, myMana) then
					Ability.CastNoTarget(godsStrength)
					fooAllInOne.makeDelay(Ability.GetCastPoint(godsStrength))
				end
				if NPC.IsLinkensProtected(enemy) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
					end
				end
				if stormHammer and Ability.IsCastable(stormHammer, myMana) and not (NPC.IsLinkensProtected(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) then
					Ability.CastTarget(stormHammer, enemy)
					return
				end
				if maskOfMadness and Ability.IsCastable(maskOfMadness, myMana) then
					Ability.CastNoTarget(maskOfMadness)
					return
				end
			end
		end
	end
end

-----------------------------------------------------------------------------------------------



fooAllInOne.AbilityList = {
{ "npc_dota_hero_abaddon", "abaddon_death_coil", "nuke", "target" , "target_damage" },
{ "npc_dota_hero_abaddon", "abaddon_frostmourne", "utility", "0" , "0" },
{ "npc_dota_hero_abaddon", "abaddon_aphotic_shield", "utility", "0" , "0" },
{ "npc_dota_hero_abaddon", "abaddon_borrowed_time", "utility", "0" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_pit_of_malice", "disable", "position" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_firestorm", "nuke", "position" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_atrophy_aura", "utility", "0" , "0" },
{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_dark_rift", "utility", "0" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_unstable_concoction", "disable", "target" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_unstable_concoction_throw", "disable", "target" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_acid_spray", "utility", "0" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_chemical_rage", "utility", "0" , "0" },
{ "npc_dota_hero_alchemist", "alchemist_goblins_greed", "utility", "0" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_blast", "nuke", "position" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_blast_release", "nuke", "position" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_chilling_touch", "utility", "0" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_cold_feet", "utility", "0" , "0" },
{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_vortex", "utility", "0" , "0" },
{ "npc_dota_hero_antimage", "antimage_mana_void"    , "nuke", "target" , "0" },
{ "npc_dota_hero_antimage", "antimage_blink", "utility", "0" , "0" },
{ "npc_dota_hero_antimage", "antimage_mana_break", "utility", "0" , "0" },
{ "npc_dota_hero_antimage", "antimage_spell_shield", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_flux", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_magnetic_field", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_spark_wraith", "utility", "0" , "0" },
{ "npc_dota_hero_arcwarden", "arc_warden_tempest_double", "utility", "0" , "0" },
{ "npc_dota_hero_axe", "axe_berserkers_call", "disable", "no target" , "0" },
{ "npc_dota_hero_axe", "axe_culling_blade", "nuke", "target" , "0" },
{ "npc_dota_hero_axe", "axe_battle_hunger", "utility", "0" , "0" },
{ "npc_dota_hero_axe", "axe_counter_helix", "utility", "0" , "0" },
{ "npc_dota_hero_bane", "bane_brain_sap", "nuke", "target" , "brain_sap_damage" },
{ "npc_dota_hero_bane", "bane_fiends_grip", "nuke", "target" , "0" },
{ "npc_dota_hero_bane", "bane_enfeeble", "utility", "0" , "0" },
{ "npc_dota_hero_bane", "bane_nightmare", "utility", "0" , "0" },
{ "npc_dota_hero_bane", "bane_nightmare_end", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_firefly", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_flamebreak", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_flaming_lasso", "utility", "0" , "0" },
{ "npc_dota_hero_batrider", "batrider_sticky_napalm", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_wild_axes", "nuke", "position" , "axe_damage" },
{ "npc_dota_hero_beastmaster", "beastmaster_primal_roar", "disable", "no target" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_boar_poison", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_call_of_the_wild", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_call_of_the_wild_boar", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_greater_boar_poison", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_hawk_invisibility", "utility", "0" , "0" },
{ "npc_dota_hero_beastmaster", "beastmaster_inner_beast", "utility", "0" , "0" },
{ "npc_dota_hero_bloodseeker", "bloodseeker_blood_bath", "nuke", "position" , "damage" },
{ "npc_dota_hero_bloodseeker", "bloodseeker_rupture", "utility", "0" , "0" },
{ "npc_dota_hero_bloodseeker", "bloodseeker_thirst", "utility", "0" , "0" },
{ "npc_dota_hero_bounty_hunter", "bounty_hunter_shuriken_toss", "nuke", "target" , "bonus_damage" },
{ "npc_dota_hero_bounty_hunter", "bounty_hunter_jinada", "utility", "0" , "0" },
{ "npc_dota_hero_bounty_hunter", "bounty_hunter_track", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_thunder_clap", "nuke", "no target" , "damage" },
{ "npc_dota_hero_brewmaster", "brewmaster_earth_hurl_boulder", "disable", "target" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_drunken_brawler", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_drunken_haze", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_earth_pulverize", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_earth_spell_immunity", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_fire_permanent_immolation", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_primal_split", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_storm_cyclone", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_storm_dispel_magic", "utility", "0" , "0" },
{ "npc_dota_hero_brewmaster", "brewmaster_storm_wind_walk", "utility", "0" , "0" },
{ "npc_dota_hero_bristleback", "bristleback_quill_spray", "nuke", "no target" , "quill_base_damage" },
{ "npc_dota_hero_bristleback", "bristleback_bristleback", "utility", "0" , "0" },
{ "npc_dota_hero_bristleback", "bristleback_viscous_nasal_goo", "utility", "0" , "0" },
{ "npc_dota_hero_bristleback", "bristleback_warpath", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spawn_spiderlings", "nuke", "target" , "damage" },
{ "npc_dota_hero_broodmother", "broodmother_incapacitating_bite", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_insatiable_hunger", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_poison_sting", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spawn_spiderite", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spin_web", "utility", "0" , "0" },
{ "npc_dota_hero_broodmother", "broodmother_spin_web_destroy"  , "utility", "0" , "0" },
{ "npc_dota_hero_centaur", "centaur_double_edge", "nuke", "no target" , "edge_damage" },
{ "npc_dota_hero_centaur", "centaur_hoof_stomp", "disable", "no target" , "0" },
{ "npc_dota_hero_centaur", "centaur_return", "utility", "0" , "0" },
{ "npc_dota_hero_centaur", "centaur_stampede", "utility", "0" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_chaos_bolt", "disable", "target" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_chaos_strike", "utility", "0" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_phantasm", "utility", "0" , "0" },
{ "npc_dota_hero_chaos_knight", "chaos_knight_reality_rift", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_test_of_faith", "nuke", "target" , "damage_min" },
{ "npc_dota_hero_chen", "chen_hand_of_god", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_holy_persuasion", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_penitence", "utility", "0" , "0" },
{ "npc_dota_hero_chen", "chen_test_of_faith_teleport", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_death_pact", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_searing_arrows", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_strafe", "utility", "0" , "0" },
{ "npc_dota_hero_clinkz", "clinkz_wind_walk", "utility", "0" , "0" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_crystal_nova", "nuke", "position" , "nova_damage" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_frostbite", "disable", "target" , "0" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_freezing_field", "nuke", "no target" , "0" },
{ "npc_dota_hero_crystal_maiden", "crystal_maiden_brilliance_aura", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_ion_shell", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_surge", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_vacuum", "utility", "0" , "0" },
{ "npc_dota_hero_dark_seer", "dark_seer_wall_of_replica", "utility", "0" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_poison_touch", "nuke", "target" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_shadow_wave", "utility", "0" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_shallow_grave", "utility", "0" , "0" },
{ "npc_dota_hero_dazzle", "dazzle_weave", "utility", "0" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_silence", "disable", "position" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_carrion_swarm", "nuke", "position" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_exorcism", "utility", "0" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_spirit_siphon", "utility", "0" , "0" },
{ "npc_dota_hero_death_prophet", "death_prophet_witchcraft", "utility", "0" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_thunder_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_glimpse", "utility", "0" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_kinetic_field", "utility", "0" , "0" },
{ "npc_dota_hero_disruptor", "disruptor_static_storm", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_devour", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_doom", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_infernal_blade", "utility", "0" , "0" },
{ "npc_dota_hero_doom_bringer", "doom_bringer_scorched_earth", "utility", "0" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_dragon_tail", "disable", "target" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_breathe_fire", "nuke", "position" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_dragon_blood", "utility", "0" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_elder_dragon_form", "utility", "0" , "0" },
{ "npc_dota_hero_dragon_knight", "dragon_knight_frost_breath", "utility", "0" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_silence", "disable", "position" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_wave_of_silence", "disable", "position" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_frost_arrows", "utility", "0" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_marksmanship", "utility", "0" , "0" },
{ "npc_dota_hero_drow_ranger", "drow_ranger_trueshot", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_boulder_smash", "disable", "position" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_geomagnetic_grip", "disable", "position" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_magnetize", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_petrify", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_rolling_boulder", "utility", "0" , "0" },
{ "npc_dota_hero_earth_spirit", "earth_spirit_stone_caller", "utility", "0" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_aftershock", "disable", "no target" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_fissure", "disable", "position" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_echo_slam", "nuke", "no target" , "0" },
{ "npc_dota_hero_earthshaker", "earthshaker_enchant_totem", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_ancestral_spirit", "nuke", "position" , "pass_damage" },
{ "npc_dota_hero_elder_titan", "elder_titan_echo_stomp_spirit", "disable", "no target" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_earth_splitter", "nuke", "position" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_natural_order", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_echo_stomp", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_natural_order_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_elder_titan", "elder_titan_return_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_searing_chains", "disable", "no target" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_activate_fire_remnant", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_fire_remnant", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_flame_guard", "utility", "0" , "0" },
{ "npc_dota_hero_ember_spirit", "ember_spirit_sleight_of_fist", "utility", "0" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_impetus", "nuke", "target" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_enchant", "utility", "0" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_natures_attendants", "utility", "0" , "0" },
{ "npc_dota_hero_enchantress", "enchantress_untouchable", "utility", "0" , "0" },
{ "npc_dota_hero_enigma", "enigma_black_hole", "disable", "position" , "0" },
{ "npc_dota_hero_enigma", "enigma_demonic_conversion", "utility", "0" , "0" },
{ "npc_dota_hero_enigma", "enigma_malefice", "utility", "0" , "0" },
{ "npc_dota_hero_enigma", "enigma_midnight_pulse", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_chronosphere", "disable", "position" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_backtrack", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_time_dilation", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_time_lock", "utility", "0" , "0" },
{ "npc_dota_hero_faceless_void", "faceless_void_time_walk", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_force_of_nature", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_sprout", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_teleportation", "utility", "0" , "0" },
{ "npc_dota_hero_furion", "furion_wrath_of_nature", "utility", "0" , "0" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_call_down", "nuke", "position" , "damage_first" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_homing_missile", "disable", "target" , "0" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_rocket_barrage", "nuke", "no target" , "0" },
{ "npc_dota_hero_gyrocopter", "gyrocopter_flak_cannon", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_berserkers_blood", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_burning_spear", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_inner_vitality", "utility", "0" , "0" },
{ "npc_dota_hero_huskar", "huskar_life_break", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_cold_snap", "disable", "no target" , "0" },
{ "npc_dota_hero_invoker", "invoker_tornado", "disable", "position" , "0" },
{ "npc_dota_hero_invoker", "invoker_alacrity", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_attribute_bonus", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_chaos_meteor", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_deafening_blast", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_emp", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_exort", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_forge_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_ghost_walk", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_ice_wall", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_invoke", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_quas", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_sun_strike", "utility", "0" , "0" },
{ "npc_dota_hero_invoker", "invoker_wex", "utility", "0" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_ice_path", "disable", "position" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_macropyre", "nuke", "position" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_dual_breath", "utility", "0" , "0" },
{ "npc_dota_hero_jakiro", "jakiro_liquid_fire", "utility", "0" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_omni_slash", "nuke", "target" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_blade_dance", "utility", "0" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_blade_fury", "utility", "0" , "0" },
{ "npc_dota_hero_juggernaut", "juggernaut_healing_ward", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_blinding_light", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_chakra_magic", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_illuminate", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_illuminate_end", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_mana_leak", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_recall", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form_illuminate", "utility", "0" , "0" },
{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form_illuminate_end", "utility", "0" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_ghostship", "nuke", "position" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_torrent", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_return", "utility", "0" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_tidebringer", "utility", "0" , "0" },
{ "npc_dota_hero_kunkka", "kunkka_x_marks_the_spot", "utility", "0" , "0" },
{ "npc_dota_hero_legion_commander", "legion_commander_overwhelming_odds", "nuke", "position" , "damage" },
{ "npc_dota_hero_legion_commander", "legion_commander_duel", "disable", "target" , "0" },
{ "npc_dota_hero_legion_commander", "legion_commander_moment_of_courage", "utility", "0" , "0" },
{ "npc_dota_hero_legion_commander", "legion_commander_press_the_attack", "utility", "0" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_split_earth", "disable", "position" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_lightning_storm", "nuke", "target" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_pulse_nova", "utility", "0" , "0" },
{ "npc_dota_hero_leshrac", "leshrac_diabolic_edict", "utility", "0" , "0" },
{ "npc_dota_hero_lich", "lich_chain_frost", "nuke", "target" , "damage" },
{ "npc_dota_hero_lich", "lich_frost_nova", "nuke", "position" , "0" },
{ "npc_dota_hero_lich", "lich_dark_ritual", "utility", "0" , "0" },
{ "npc_dota_hero_lich", "lich_frost_armor", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_assimilate", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_assimilate_eject", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_consume", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_control", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_1", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_2", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_3", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_empty_4", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_feast", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_infest", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_open_wounds", "utility", "0" , "0" },
{ "npc_dota_hero_life_stealer", "life_stealer_rage", "utility", "0" , "0" },
{ "npc_dota_hero_lina", "lina_laguna_blade", "nuke", "target" , "damage" },
{ "npc_dota_hero_lina", "lina_light_strike_array", "disable", "position" , "0" },
{ "npc_dota_hero_lina", "lina_dragon_slave", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_lina", "lina_fiery_soul", "utility", "0" , "0" },
{ "npc_dota_hero_lion", "lion_finger_of_death", "nuke", "target" , "damage" },
{ "npc_dota_hero_lion", "lion_impale", "disable", "position" , "0" },
{ "npc_dota_hero_lion", "lion_voodoo", "disable", "target" , "0" },
{ "npc_dota_hero_lion", "lion_mana_drain", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_rabid", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_savage_roar", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_savage_roar_bear", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_demolish", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_entangle", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_return", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_true_form", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_true_form_battle_cry", "utility", "0" , "0" },
{ "npc_dota_hero_lone_druid", "lone_druid_true_form_druid", "utility", "0" , "0" },
{ "npc_dota_hero_luna", "luna_lucent_beam", "nuke", "target" , "beam_damage" },
{ "npc_dota_hero_luna", "luna_eclipse", "nuke", "no target" , "0" },
{ "npc_dota_hero_luna", "luna_lunar_blessing", "utility", "0" , "0" },
{ "npc_dota_hero_luna", "luna_moon_glaive", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_feral_impulse", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_howl", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_shapeshift", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_summon_wolves", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_summon_wolves_critical_strike", "utility", "0" , "0" },
{ "npc_dota_hero_lycan", "lycan_summon_wolves_invisibility", "utility", "0" , "0" },
{ "npc_dota_hero_magnataur", "magnataur_shockwave", "nuke", "skillshot" , "shock_damage" },
{ "npc_dota_hero_magnataur", "magnataur_reverse_polarity", "disable", "no target" , "0" },
{ "npc_dota_hero_magnataur", "magnataur_empower", "utility", "0" , "0" },
{ "npc_dota_hero_magnataur", "magnataur_skewer", "utility", "0" , "0" },
{ "npc_dota_hero_medusa", "medusa_mystic_snake", "nuke", "target" , "snake_damage" },
{ "npc_dota_hero_medusa", "medusa_mana_shield", "utility", "0" , "0" },
{ "npc_dota_hero_medusa", "medusa_split_shot", "utility", "0" , "0" },
{ "npc_dota_hero_medusa", "medusa_stone_gaze", "utility", "0" , "0" },
{ "npc_dota_hero_meepo", "meepo_earthbind", "disable", "position" , "0" },
{ "npc_dota_hero_meepo", "meepo_poof", "utility", "0" , "0" },
{ "npc_dota_hero_meepo", "meepo_divided_we_stand", "utility", "0" , "0" },
{ "npc_dota_hero_meepo", "meepo_geostrike", "utility", "0" , "0" },
{ "npc_dota_hero_mirana", "mirana_arrow", "disable", "position" , "0" },
{ "npc_dota_hero_mirana", "mirana_starfall", "nuke", "no target" , "0" },
{ "npc_dota_hero_mirana", "mirana_invis", "utility", "0" , "0" },
{ "npc_dota_hero_mirana", "mirana_leap", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_primal_spring", "disable", "position" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_primal_spring_early", "disable", "position" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_boundless_strike", "nuke", "position" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_jingu_mastery", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_mischief", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_tree_dance", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_untransform", "utility", "0" , "0" },
{ "npc_dota_hero_monkey_king", "monkey_king_wukongs_command", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_adaptive_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_morphling", "morphling_waveform", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_morphling", "morphling_hybrid", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph_agi", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph_replicate", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_morph_str", "utility", "0" , "0" },
{ "npc_dota_hero_morphling", "morphling_replicate", "utility", "0" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_ensnare", "disable", "target" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_rip_tide", "nuke", "no target" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_mirror_image", "utility", "0" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_song_of_the_siren", "utility", "0" , "0" },
{ "npc_dota_hero_naga_siren", "naga_siren_song_of_the_siren_cancel", "utility", "0" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_reapers_scythe", "disable", "target" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_death_pulse", "nuke", "no target" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_heartstopper_aura", "utility", "0" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_sadist", "utility", "0" , "0" },
{ "npc_dota_hero_necrolyte", "necrolyte_sadist_stop", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_dark_lord", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_necromastery", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_requiem", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_shadowraze1", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_shadowraze2", "utility", "0" , "0" },
{ "npc_dota_hero_nevermore", "nevermore_shadowraze3", "utility", "0" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_void", "nuke", "target" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_crippling_fear", "utility", "0" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_darkness", "utility", "0" , "0" },
{ "npc_dota_hero_night_stalker", "night_stalker_hunter_in_the_night", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_impale", "disable", "position" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_mana_burn", "nuke", "special" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_burrow", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_spiked_carapace", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_unburrow", "utility", "0" , "0" },
{ "npc_dota_hero_nyx_assassin", "nyx_assassin_vendetta", "utility", "0" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_astral_imprisonment", "nuke", "target" , "damage" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_sanity_eclipse", "nuke", "position" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_arcane_orb", "utility", "0" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_essence_aura", "utility", "0" , "0" },
{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_mind_over_matter", "utility", "0" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_fireblast", "nuke", "target" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_unrefined_fireblast", "nuke", "target" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_bloodlust", "utility", "0" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_ignite", "utility", "0" , "0" },
{ "npc_dota_hero_ogre_magi", "ogre_magi_multicast", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_degen_aura", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_guardian_angel", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_purification", "utility", "0" , "0" },
{ "npc_dota_hero_omniknight", "omniknight_repel", "utility", "0" , "0" },
{ "npc_dota_hero_oracle", "oracle_fortunes_end", "disable", "target" , "0" },
{ "npc_dota_hero_oracle", "oracle_false_promise", "utility", "0" , "0" },
{ "npc_dota_hero_oracle", "oracle_fates_edict", "utility", "0" , "0" },
{ "npc_dota_hero_oracle", "oracle_purifying_flames", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_stifling_dagger", "nuke", "target" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_blur", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_coup_de_grace", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_assassin", "phantom_assassin_phantom_strike", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_spirit_lance", "nuke", "target" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_doppelwalk", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_juxtapose", "utility", "0" , "0" },
{ "npc_dota_hero_phantom_lancer", "phantom_lancer_phantom_edge", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_fire_spirits", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_icarus_dive", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_icarus_dive_stop", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_launch_fire_spirit", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray_stop", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray_toggle_move", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_sun_ray_toggle_move_empty", "utility", "0" , "0" },
{ "npc_dota_hero_phoenix", "phoenix_supernova", "utility", "0" , "0" },
{ "npc_dota_hero_puck", "puck_dream_coil", "disable", "position" , "0" },
{ "npc_dota_hero_puck", "puck_waning_rift", "disable", "no target" , "0" },
{ "npc_dota_hero_puck", "puck_ethereal_jaunt", "utility", "0" , "0" },
{ "npc_dota_hero_puck", "puck_illusory_orb", "utility", "0" , "0" },
{ "npc_dota_hero_puck", "puck_phase_shift", "utility", "0" , "0" },
{ "npc_dota_hero_pudge", "pudge_dismember", "disable", "target" , "0" },
{ "npc_dota_hero_pudge", "pudge_flesh_heap", "utility", "0" , "0" },
{ "npc_dota_hero_pudge", "pudge_meat_hook", "utility", "0" , "0" },
{ "npc_dota_hero_pudge", "pudge_rot", "utility", "0" , "0" },
{ "npc_dota_hero_pugna", "pugna_nether_blast", "nuke", "skillshot" , "blast_damage" },
{ "npc_dota_hero_pugna", "pugna_life_drain", "nuke", "target" , "0" },
{ "npc_dota_hero_pugna", "pugna_decrepify", "utility", "0" , "0" },
{ "npc_dota_hero_pugna", "pugna_nether_ward", "utility", "0" , "0" },
{ "npc_dota_hero_queenofpain", "queenofpain_sonic_wave", "nuke", "position" , "damage" },
{ "npc_dota_hero_queenofpain", "queenofpain_shadow_strike", "nuke", "target" , "strike_damage" },
{ "npc_dota_hero_queenofpain", "queenofpain_scream_of_pain", "nuke", "special" , "0" },
{ "npc_dota_hero_queenofpain", "queenofpain_blink", "utility", "0" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_battery_assault", "disable", "no target" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_hookshot", "disable", "position" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_rocket_flare", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_rattletrap", "rattletrap_power_cogs", "utility", "0" , "0" },
{ "npc_dota_hero_razor", "razor_plasma_field", "nuke", "no target" , "damage_max" },
{ "npc_dota_hero_razor", "razor_eye_of_the_storm", "nuke", "no target" , "0" },
{ "npc_dota_hero_razor", "razor_static_link", "utility", "0" , "0" },
{ "npc_dota_hero_razor", "razor_unstable_current", "utility", "0" , "0" },
{ "npc_dota_hero_riki", "riki_smoke_screen", "disable", "position" , "0" },
{ "npc_dota_hero_riki", "riki_blink_strike", "utility", "0" , "0" },
{ "npc_dota_hero_riki", "riki_permanent_invisibility", "utility", "0" , "0" },
{ "npc_dota_hero_riki", "riki_tricks_of_the_trade", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_fade_bolt", "nuke", "target" , "damage" },
{ "npc_dota_hero_rubick", "rubick_telekinesis", "disable", "target" , "0" },
{ "npc_dota_hero_rubick", "rubick_telekinesis_land", "disable", "target" , "0" },
{ "npc_dota_hero_rubick", "rubick_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_hidden1", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_hidden2", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_hidden3", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_null_field", "utility", "0" , "0" },
{ "npc_dota_hero_rubick", "rubick_spell_steal", "utility", "0" , "0" },
{ "npc_dota_hero_sand_king", "sandking_burrowstrike", "disable", "position" , "0" },
{ "npc_dota_hero_sand_king", "sandking_epicenter", "nuke", "no target" , "0" },
{ "npc_dota_hero_sand_king", "sandking_caustic_finale", "utility", "0" , "0" },
{ "npc_dota_hero_sand_king", "sandking_sand_storm", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_demonic_purge", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_disruption", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_shadow_poison", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_shadow_poison_release", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_demon", "shadow_demon_soul_catcher", "utility", "0" , "0" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_ether_shock", "nuke", "target" , "damage" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_shackles", "disable", "target" , "0" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_voodoo", "disable", "target" , "0" },
{ "npc_dota_hero_shadow_shaman", "shadow_shaman_mass_serpent_ward", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_whirling_death", "nuke", "no target" , "whirling_damage" },
{ "npc_dota_hero_shredder", "shredder_chakram", "nuke", "position" , "0" },
{ "npc_dota_hero_shredder", "shredder_chakram_2", "nuke", "position" , "0" },
{ "npc_dota_hero_shredder", "shredder_reactive_armor", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_return_chakram", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_return_chakram_2", "utility", "0" , "0" },
{ "npc_dota_hero_shredder", "shredder_timber_chain", "utility", "0" , "0" },
{ "npc_dota_hero_silencer", "silencer_last_word", "nuke", "target" , "damage" },
{ "npc_dota_hero_silencer", "silencer_global_silence", "disable", "no target" , "0" },
{ "npc_dota_hero_silencer", "silencer_curse_of_the_silent", "utility", "0" , "0" },
{ "npc_dota_hero_silencer", "silencer_glaives_of_wisdom", "utility", "0" , "0" },
{ "npc_dota_hero_skeleton_king", "skeleton_king_hellfire_blast", "disable", "target" , "0" },
{ "npc_dota_hero_skeleton_king", "skeleton_king_reincarnation", "utility", "0" , "0" },
{ "npc_dota_hero_skeleton_king", "skeleton_king_vampiric_aura", "utility", "0" , "0" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_arcane_bolt", "nuke", "target" , "bolt_damage" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_ancient_seal", "disable", "target" , "0" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_mystic_flare", "nuke", "position" , "0" },
{ "npc_dota_hero_skywrath_mage", "skywrath_mage_concussive_shot", "utility", "0" , "0" },
{ "npc_dota_hero_slardar", "slardar_slithereen_crush", "disable", "no target" , "0" },
{ "npc_dota_hero_slardar", "slardar_amplify_damage", "utility", "0" , "0" },
{ "npc_dota_hero_slardar", "slardar_bash", "utility", "0" , "0" },
{ "npc_dota_hero_slardar", "slardar_sprint", "utility", "0" , "0" },
{ "npc_dota_hero_slark", "slark_dark_pact", "nuke", "no target" , "total_damage" },
{ "npc_dota_hero_slark", "slark_essence_shift", "utility", "0" , "0" },
{ "npc_dota_hero_slark", "slark_pounce", "utility", "0" , "0" },
{ "npc_dota_hero_slark", "slark_shadow_dance", "utility", "0" , "0" },
{ "npc_dota_hero_sniper", "sniper_assassinate", "nuke", "target" , "0" },
{ "npc_dota_hero_sniper", "sniper_headshot", "utility", "0" , "0" },
{ "npc_dota_hero_sniper", "sniper_shrapnel", "utility", "0" , "0" },
{ "npc_dota_hero_sniper", "sniper_take_aim", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_spectral_dagger", "nuke", "target" , "damage" },
{ "npc_dota_hero_spectre", "spectre_desolate", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_dispersion", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_haunt", "utility", "0" , "0" },
{ "npc_dota_hero_spectre", "spectre_reality", "utility", "0" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_nether_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_charge_of_darkness", "utility", "0" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_empowering_haste", "utility", "0" , "0" },
{ "npc_dota_hero_spirit_breaker", "spirit_breaker_greater_bash", "utility", "0" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_electric_vortex", "disable", "target" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_ball_lightning", "utility", "0" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_overload", "utility", "0" , "0" },
{ "npc_dota_hero_storm_spirit", "storm_spirit_static_remnant", "utility", "0" , "0" },
{ "npc_dota_hero_sven", "sven_storm_bolt", "disable", "target" , "0" },
{ "npc_dota_hero_sven", "sven_gods_strength", "utility", "0" , "0" },
{ "npc_dota_hero_sven", "sven_great_cleave", "utility", "0" , "0" },
{ "npc_dota_hero_sven", "sven_warcry", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_land_mines", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_stasis_trap", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_suicide", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_remote_mines", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_focused_detonate", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_remote_mines_self_detonate", "utility", "0" , "0" },
{ "npc_dota_hero_techies", "techies_minefield_sign", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_meld", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_psi_blades", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_psionic_trap", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_refraction", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_self_trap", "utility", "0" , "0" },
{ "npc_dota_hero_templar_assassin", "templar_assassin_trap", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_conjure_image", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_metamorphosis", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_reflection", "utility", "0" , "0" },
{ "npc_dota_hero_terrorblade", "terrorblade_sunder", "utility", "0" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_ravage", "disable", "no target" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_anchor_smash", "nuke", "no target" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_gush", "nuke", "target" , "0" },
{ "npc_dota_hero_tidehunter", "tidehunter_kraken_shell", "utility", "0" , "0" },
{ "npc_dota_hero_tinker", "tinker_laser", "nuke", "target" , "laser_damage" },
{ "npc_dota_hero_tinker", "tinker_heat_seeking_missile", "nuke", "no target" , "0" },
{ "npc_dota_hero_tinker", "tinker_march_of_the_machines", "utility", "0" , "0" },
{ "npc_dota_hero_tinker", "tinker_rearm", "utility", "0" , "0" },
{ "npc_dota_hero_tiny", "tiny_toss", "nuke", "position" , "toss_damage" },
{ "npc_dota_hero_tiny", "tiny_avalanche", "disable", "position" , "0" },
{ "npc_dota_hero_tiny", "tiny_craggy_exterior", "utility", "0" , "0" },
{ "npc_dota_hero_tiny", "tiny_grow", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_overgrowth", "disable", "no target" , "0" },
{ "npc_dota_hero_treant", "treant_eyes_in_the_forest", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_leech_seed", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_living_armor", "utility", "0" , "0" },
{ "npc_dota_hero_treant", "treant_natures_guise", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_battle_trance", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_berserkers_rage", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_fervor", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_whirling_axes_melee", "utility", "0" , "0" },
{ "npc_dota_hero_troll_warlord", "troll_warlord_whirling_axes_ranged", "utility", "0" , "0" },
{ "npc_dota_hero_tusk", "tusk_ice_shards", "nuke", "skillshot" , "shard_damage" },
{ "npc_dota_hero_tusk", "tusk_walrus_kick", "nuke", "target" , "0" },
{ "npc_dota_hero_tusk", "tusk_walrus_punch", "nuke", "target" , "0" },
{ "npc_dota_hero_tusk", "tusk_frozen_sigil", "utility", "0" , "0" },
{ "npc_dota_hero_tusk", "tusk_launch_snowball", "utility", "0" , "0" },
{ "npc_dota_hero_tusk", "tusk_snowball", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_decay", "nuke", "position" , "decay_damage" },
{ "npc_dota_hero_undying", "undying_flesh_golem", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_soul_rip", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_tombstone", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_tombstone_zombie_aura", "utility", "0" , "0" },
{ "npc_dota_hero_undying", "undying_tombstone_zombie_deathstrike", "utility", "0" , "0" },
{ "npc_dota_hero_ursa", "ursa_earthshock", "nuke", "no target" , "0" },
{ "npc_dota_hero_ursa", "ursa_enrage", "utility", "0" , "0" },
{ "npc_dota_hero_ursa", "ursa_fury_swipes", "utility", "0" , "0" },
{ "npc_dota_hero_ursa", "ursa_overpower", "utility", "0" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_magic_missile", "disable", "target" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_wave_of_terror", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_command_aura", "utility", "0" , "0" },
{ "npc_dota_hero_vengefulspirit", "vengefulspirit_nether_swap", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_plague_ward", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_poison_nova", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_poison_sting", "utility", "0" , "0" },
{ "npc_dota_hero_venomancer", "venomancer_venomous_gale", "utility", "0" , "0" },
{ "npc_dota_hero_viper", "viper_viper_strike", "nuke", "target" , "0" },
{ "npc_dota_hero_viper", "viper_corrosive_skin", "utility", "0" , "0" },
{ "npc_dota_hero_viper", "viper_nethertoxin", "utility", "0" , "0" },
{ "npc_dota_hero_viper", "viper_poison_attack", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_soul_assumption", "nuke", "target" , "0" },
{ "npc_dota_hero_visage", "visage_grave_chill", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_gravekeepers_cloak", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_summon_familiars", "utility", "0" , "0" },
{ "npc_dota_hero_visage", "visage_summon_familiars_stone_form", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_rain_of_chaos", "disable", "position" , "0" },
{ "npc_dota_hero_warlock", "warlock_shadow_word", "nuke", "target" , "0" },
{ "npc_dota_hero_warlock", "warlock_fatal_bonds", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_golem_flaming_fists", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_golem_permanent_immolation", "utility", "0" , "0" },
{ "npc_dota_hero_warlock", "warlock_upheaval", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_geminate_attack", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_shukuchi", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_the_swarm", "utility", "0" , "0" },
{ "npc_dota_hero_weaver", "weaver_time_lapse", "utility", "0" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_shackleshot", "disable", "target" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_powershot", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_focusfire", "utility", "0" , "0" },
{ "npc_dota_hero_windrunner", "windrunner_windrun", "utility", "0" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_winters_curse", "disable", "target" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_splinter_blast", "nuke", "target" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_arctic_burn", "utility", "0" , "0" },
{ "npc_dota_hero_winter_wyvern", "winter_wyvern_cold_embrace", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_empty1", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_empty2", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_overcharge", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_relocate", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_spirits", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_spirits_in", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_spirits_out", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_tether", "utility", "0" , "0" },
{ "npc_dota_hero_wisp", "wisp_tether_break", "utility", "0" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_paralyzing_cask", "disable", "target" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_death_ward", "utility", "0" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_maledict", "utility", "0" , "0" },
{ "npc_dota_hero_witch_doctor", "witch_doctor_voodoo_restoration", "utility", "0" , "0" },
{ "npc_dota_hero_zuus", "zuus_arc_lightning", "nuke", "target" , "0" },
{ "npc_dota_hero_zuus", "zuus_lightning_bolt", "nuke", "skillshot" , "0" },
{ "npc_dota_hero_zuus", "zuus_thundergods_wrath", "nuke", "no target" , "0" },
{ "npc_dota_hero_zuus", "zuus_cloud", "utility", "0" , "0" },
{ "npc_dota_hero_zuus", "zuus_static_field", "utility", "0" , "0" } }

function fooAllInOne.AutoNukeKillSteal(myHero)

	local myMana = NPC.GetMana(myHero)

	for _, stealEnemyEntity in ipairs(NPC.GetHeroesInRadius(myHero, 1200, Enum.TeamType.TEAM_ENEMY)) do
		if not stealEnemyEntity then return end

	stealEnemy = fooAllInOne.targetChecker(stealEnemyEntity)
		if not stealEnemy then return end
		if NPC.HasState(stealEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or NPC.IsChannellingAbility(myHero) or NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return end

		for n, v in ipairs(fooAllInOne.AbilityList) do
			local heroName = v[1]
	      		local skillName = v[2]
			local skillType = v[3]
			local targetMode = v[4]
			local specialAttribute = v[5]
		
			
			if NPC.GetUnitName(myHero) == heroName then
				if skillType == "nuke" and not Ability.IsUltimate(NPC.GetAbility(myHero, skillName)) then
					if Entity.GetHealth(stealEnemy) > 0 then
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) then
							local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0)
							if  skillDamage < 1 then
								skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute)
							end
							if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*skillDamage then
								if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
									if targetMode == "target" and not NPC.IsLinkensProtected(enemy) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
									if targetMode == "position" then
										Ability.CastPosition(NPC.GetAbility(myHero, skillName), Entity.GetAbsOrigin(stealEnemy))
										return
									end
									if targetMode == "no target" then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
									if targetMode == "skillshot" then
										if skillName == "windrunner_powershot" then
											local powershotPrediction = 1 + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 3000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, powershotPrediction))
											return
										end
										if skillName == "kunkka_torrent" then
											local kunkkaPrediction = 2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, kunkkaPrediction))
											return
										end
										if skillName == "lina_dragon_slave" then
											local dragonSlavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1200) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, dragonSlavePrediction))
											return
										end
										if skillName == "magnataur_shockwave" then
											local shockwavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1050) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, shockwavePrediction))
											return
										end
										if skillName == "morphling_waveform" then
											local wavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1250) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, wavePrediction))
											return
										end
										if skillName == "pugna_nether_blast" then
											local blastPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + 0.9 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, blastPrediction))
											return
										end
										if skillName == "rattletrap_rocket_flare" then
											local flairPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1750) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, flairPrediction))
											return
										end
										if skillName == "tusk_ice_shards" then
											local shardsPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, shardsPrediction))
											return
										end
										if skillName == "vengefulspirit_wave_of_terror" then
											local wavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 2000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, wavePrediction))
											return
										end
										if skillName == "zuus_lightning_bolt" then
											local boltPrediction = 0.4 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, boltPrediction))
											return
										end
									end
								end
							end	
						end
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) and targetMode == "special" then
							if skillName == "nyx_assassin_mana_burn" then
								local skillDamage = Ability.GetLevelSpecialValueForFloat(NPC.GetAbility(myHero, skillName), "float_multiplier") * Hero.GetIntellectTotal(stealEnemy) * (1 + Hero.GetIntellectTotal(myHero) / 16 / 100)
								if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*skillDamage and NPC.GetMana(stealEnemy) >= Entity.GetHealth(stealEnemy) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
								end
							end
						end
						if skillName == "queenofpain_scream_of_pain" then
							if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), "area_of_effect")) and targetMode == "special" then
								if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
								end
							end
						end	
					end
				end
			end
		end
	end
end
		
	

return fooAllInOne
