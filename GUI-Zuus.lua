local BTW = {}
BTW.Identity = "zuus_combos"
BTW.Locale = {
	["name"] = {
		["english"] = "Born to win",
		["russian"] = "Рождённый побеждать"
	},
	["desc"] = {
		["english"] = "Zuus helper",
		["russian"] = "Помощник"
	},
	["farm"] = {
		["english"] = "Farm key",
		["russian"] = "Клавиша для фарма"
	},
	["spam"] = {
		["english"] = "Spam arc key",
		["russian"] = "Клавиша для спама первым скилом"
	},
	["steal"] = {
		["english"] = "Auto steal by arc and bolt",
		["russian"] = "Стил героев первыми двумя способностями"
	},
	["stealcloud"] = {
		["english"] = "Auto steal by cloud",
		["russian"] = "Стил героев облачком"
	},
	["order"] = {
		["english"] = "Combo order",
		["russian"] = "Порядок каста комбо"
	},
	["combo"] = {
		["english"] = "Combo key",
		["russian"] = "Клавиша комбо"
	},
	["slider"] = {
		["english"] = "Closest to mouse range",
		["russian"] = "Радиус поиска ближнего"
	}
}
BTW.Hero = nil
BTW.Enabled = false
BTW.MP = 0

BTW.CastTypes  = {
	["item_blink"] = 3,
	["item_veil_of_discord"] = 3,
	["item_soul_ring"] = 1,
	["item_shivas_guard"] = 1,
	["item_orchid"] = 2,
	["item_bloodthorn"] = 2,
	["item_rod_of_atos"] = 2,
	["item_cyclone"] = 2,
	["zuus_arc_lightning"] = 2,
	["zuus_lightning_bolt"] = 2,
	["zuus_static_field"] = 0,
	["special_bonus_unique_zeus"] = 0,
	["zuus_cloud"] = 3,
	["zuus_thundergods_wrath"] = 1,
	["item_dagon"] = 2,
	["item_sheepstick"] = 2,
	["item_ethereal_blade"] = 2,
	["item_refresher"] = 1,
	["item_arcane_boots"] = 1
}

BTW.Items  = {
		["item_blink"] = "resource/flash3/images/items/",
		["item_veil_of_discord"] = "resource/flash3/images/items/",
		["item_soul_ring"] = "resource/flash3/images/items/",
		["item_shivas_guard"] = "resource/flash3/images/items/",
		["item_rod_of_atos"] = "resource/flash3/images/items/",
		["item_orchid"] = "resource/flash3/images/items/",
		["item_bloodthorn"] = "resource/flash3/images/items/",
		["zuus_arc_lightning"] = "resource/flash3/images/spellicons/",
		["zuus_lightning_bolt"] = "resource/flash3/images/spellicons/",
		["zuus_cloud"] = "resource/flash3/images/spellicons/",
		["zuus_thundergods_wrath"] = "resource/flash3/images/spellicons/",
		["item_dagon"] = "resource/flash3/images/items/",
		["item_sheepstick"] = "resource/flash3/images/items/",
		["item_ethereal_blade"] = "resource/flash3/images/items/",
		["item_refresher"] = "resource/flash3/images/items/",
		["item_arcane_boots"] = "resource/flash3/images/items/"
}

BTW.Abilitys = {}

function BTW.OnDraw()
	if GUI == nil then return end
	if not GUI.Exist(BTW.Identity) then
		GUI.Initialize(BTW.Identity, GUI.Category.Heroes, BTW.Locale["name"], BTW.Locale["desc"], "paroxysm", "npc_dota_hero_zuus")
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "farm", BTW.Locale["farm"], GUI.MenuType.Key, "F", BTW.Farm, 0)
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "spam", BTW.Locale["spam"], GUI.MenuType.Key, "T", BTW.Spam, 0)
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "steal", BTW.Locale["steal"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "stealcloud", BTW.Locale["stealcloud"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "ordercombo", BTW.Locale["order"], 
			GUI.MenuType.OrderBox, BTW.Items, "", "item_", 36, 36)
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "combo", BTW.Locale["combo"], GUI.MenuType.Key, "K", BTW.Combo, 0)
		GUI.AddMenuItem(BTW.Identity, BTW.Identity .. "closest", BTW.Locale["slider"], GUI.MenuType.Slider, 100, 1500, 200)
	end
	
	BTW.Initialize()
	if	BTW.Enabled 
	then
		if GUI.IsEnabled(BTW.Identity .. "steal") then BTW.Steal() end
		if GUI.IsEnabled(BTW.Identity .. "stealcloud") then BTW.StealCloud() end
	end
	
end

function BTW.Combo()
	if not BTW.Enabled then return end
    local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(BTW.Hero), Enum.TeamType.TEAM_ENEMY)
    if not enemy or not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), GUI.Get(BTW.Identity .. "closest"), 0) then return end
	local ordercast = GUI.Get(BTW.Identity .. "ordercombo", 1)
	if ordercast == nil then return end
    local position = Entity.GetAbsOrigin(enemy)   
    local manapoint = NPC.GetMana(self)
	
	local prevcast = nil
	for i = 1, Length(ordercast) do
		BTW.Cast(ordercast[i], BTW.Hero, enemy, NPC.GetAbsOrigin(enemy), BTW.MP)
	end

	if not NPC.HasModifier(hero, "modifier_item_ethereal_blade_slow") then
		Player.PrepareUnitOrders(Players.GetLocal(), 4, enemy, Vector(0,0,0), enemy, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, BTW.Hero)
	end
end

function BTW.Steal()
	if not BTW.Enabled then return end
	local staticdmg = 0
	if Ability.GetLevel(BTW.Abilitys['zuus_static_field']) > 0 then
		staticdmg = 2 + (2 * Ability.GetLevel(BTW.Abilitys['zuus_static_field']))
		if Ability.GetLevel(BTW.Abilitys['special_bonus_unique_zeus']) == 1 then
			staticdmg = staticdmg + 1.5
		end
	end
		
	for n, npc in pairs(NPC.GetHeroesInRadius(BTW.Hero, Ability.GetCastRange(BTW.Abilitys['zuus_lightning_bolt']), Enum.TeamType.TEAM_ENEMY)) do	
	
		if Entity.IsHero(npc) and not NPC.IsIllusion(npc) and not Entity.IsDormant(npc) and not NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			local boltdmg = Ability.GetDamage(BTW.Abilitys['zuus_lightning_bolt'])
			local lightdmg = Ability.GetDamage(BTW.Abilitys['zuus_arc_lightning'])
			
			if Ability.GetLevel(BTW.Abilitys['zuus_static_field']) > 0 then
				boltdmg  = boltdmg + (Entity.GetHealth(npc) * (staticdmg / 100) )
				lightdmg = lightdmg + (Entity.GetHealth(npc) * (staticdmg / 100) )
			end
			
			boltdmg = NPC.GetMagicalArmorDamageMultiplier(npc) * boltdmg
			lightdmg = NPC.GetMagicalArmorDamageMultiplier(npc) * lightdmg
			
			if	Entity.GetHealth(npc) < lightdmg 
			then
				BTW.Cast('zuus_arc_lightning', BTW.Hero, npc, nil, BTW.MP)
			elseif	Entity.GetHealth(npc) < boltdmg
				then
				BTW.Cast('zuus_lightning_bolt', BTW.Hero, npc, nil, BTW.MP)
			return end
		end
		
	end
end

function BTW.StealCloud()
	if not BTW.Enabled then return end
	local staticdmg = 0
	if Ability.GetLevel(BTW.Abilitys['zuus_static_field']) > 0 then
		staticdmg = 2 + (2 * Ability.GetLevel(BTW.Abilitys['zuus_static_field']))
		if Ability.GetLevel(BTW.Abilitys['special_bonus_unique_zeus']) == 1 then
			staticdmg = staticdmg + 1.5
		end
	end
		
	for n, npc in pairs(Heroes.GetAll()) do	
		if not Entity.IsDormant(npc) and Entity.IsAlive(npc) and not NPC.IsIllusion(npc) and not NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			local boltdmg = Ability.GetDamage(BTW.Abilitys['zuus_lightning_bolt'])
		
			if Ability.GetLevel(BTW.Abilitys['zuus_static_field']) > 0 then
				boltdmg  = boltdmg + (Entity.GetHealth(npc) * (staticdmg / 100) )
			end
			
			boltdmg = NPC.GetMagicalArmorDamageMultiplier(npc) * boltdmg
		
			if	Entity.GetHealth(npc) < boltdmg
			then
				BTW.Cast('zuus_cloud', BTW.Hero, npc, NPC.GetAbsOrigin(npc), BTW.MP)
			return end
		end
		
	end
end

function BTW.InitAbility(name)
	if not BTW.Enabled then return end
	
	if BTW.Abilitys[name] ~= nil then return end
	BTW.Abilitys[name] = NPC.GetItem(BTW.Hero, name, true) or NPC.GetAbility(BTW.Hero, name)
	
	-- kostyli
	if name == "item_dagon" then
		BTW.Abilitys[name] = NPC.GetItem(BTW.Hero, "item_dagon", true)
		for i = 0, 5 do
			if not BTW.Abilitys[name] then BTW.Abilitys[name] = NPC.GetItem(BTW.Hero, "item_dagon_" .. i, true) end
		end
	end
end

function BTW.Initialize()
	BTW.Enabled = false
	if not GUI.IsEnabled(BTW.Identity) then return end
	BTW.Hero = Heroes.GetLocal()
	if BTW.Hero == nil then return end
	if NPC.GetUnitName(BTW.Hero) ~= "npc_dota_hero_zuus" then return end
	if not Entity.IsAlive(BTW.Hero) then return end
    BTW.MP = NPC.GetMana(BTW.Hero)
	BTW.Enabled = true

	for k, v in pairs(BTW.CastTypes) do
		BTW.InitAbility(k)
	end
end

function BTW.Farm()
	if not BTW.Enabled then return end
	for n, npc in pairs(NPC.GetUnitsInRadius(BTW.Hero, Ability.GetCastRange(BTW.Abilitys['zuus_arc_lightning']), Enum.TeamType.TEAM_ENEMY)) do	
		if	not NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
			and (Entity.GetHealth(npc) < (Ability.GetDamage(BTW.Abilitys['zuus_arc_lightning']) * NPC.GetMagicalArmorDamageMultiplier(npc)))
		then
			BTW.Cast('zuus_arc_lightning', BTW.Hero, npc, nil, BTW.MP)
		end
	end
end

function BTW.Spam()
	if not BTW.Enabled then return end
	for n, npc in pairs(NPC.GetUnitsInRadius(BTW.Hero, Ability.GetCastRange(BTW.Abilitys['zuus_arc_lightning']), Enum.TeamType.TEAM_ENEMY)) do	
		if	not NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
		then
			BTW.Cast('zuus_arc_lightning', BTW.Hero, npc, nil, BTW.MP)
		return end
	end
end

function BTW.Cast(name, self, npc, position, manapoint)
	local ability = NPC.GetItem(self, name, true) or NPC.GetAbility(self, name)
	if not GUI.SleepReady(BTW.Identity .. "casted" ) then return end
	if name == "item_dagon" then
		ability = NPC.GetItem(self, "item_dagon", true)

		for i = 0, 5 do
			if not ability then ability = NPC.GetItem(self, "item_dagon_" .. i, true) end
		end
	end
	
	local casttype = BTW.CastTypes[name]
	if ability == nil then return end
	if	ability
		and  Ability.IsCastable(ability, manapoint)
		and  Ability.IsReady(ability)
	then
		if casttype == 1 then Ability.CastNoTarget(ability)
			elseif casttype == 2 then Ability.CastTarget(ability, npc)
			else Ability.CastPosition(ability, position)
		end
		GUI.Sleep(BTW.Identity .. "casted", Ability.GetCastPoint(ability) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING))
	end
end

return BTW
