local GT = {}
GT.Identity = "tiny_combos"
GT.Locale = {
	["name"] = {
		["english"] = "Sky Tiny",
		["russian"] = "Облачный Tiny"
	},
	["desc"] = {
		["english"] = "Tiny combo",
		["russian"] = "Комбо на тини"
	},
	["order"] = {
		["english"] = "Select combo order",
		["russian"] = "Выберите порядок каста способностей"
	},
	["combo"] = {
		["english"] = "Combo Key",
		["russian"] = "Комбо клавиша"
	}
}

GT.Items  = {
		["item_blink"] = "resource/flash3/images/items/",
		["item_veil_of_discord"] = "resource/flash3/images/items/",
		["item_soul_ring"] = "resource/flash3/images/items/",
		["item_orchid"] = "resource/flash3/images/items/",
		["item_bloodthorn"] = "resource/flash3/images/items/",
		["tiny_avalanche"] = "resource/flash3/images/spellicons/",
		["tiny_toss"] = "resource/flash3/images/spellicons/",
		["item_dagon"] = "resource/flash3/images/items/",
		["item_sheepstick"] = "resource/flash3/images/items/",
		["item_ethereal_blade"] = "resource/flash3/images/items/"
}

GT.CastTypes  = {
		["item_blink"] = 3,
		["item_veil_of_discord"] = 3,
		["item_soul_ring"] = 1,
		["item_orchid"] = 2,
		["item_bloodthorn"] = 2,
		["tiny_avalanche"] = 3,
		["tiny_toss"] = 2,
		["item_dagon"] = 2,
		["item_sheepstick"] = 2,
		["item_ethereal_blade"] = 2
}


function GT.OnUpdate()
	if GUI == nil then return end
	if not GUI.Exist(GT.Identity) then
		GUI.Initialize(GT.Identity, GUI.Category.Heroes, GT.Locale["name"], GT.Locale["desc"], "paroxysm, Beastmode, Jerfelly", "npc_dota_hero_tiny")
		GUI.AddMenuItem(GT.Identity, GT.Identity .. "ordercast", GT.Locale["order"], 
			GUI.MenuType.OrderBox, GT.Items, "", "item_", 36, 36)
		GUI.AddMenuItem(GT.Identity, GT.Identity .. "combokey", GT.Locale["combo"], GUI.MenuType.Key, "F", GT.Skycombo)
	end
end
    
function GT.Skycombo()
	if not GUI.IsEnabled(GT.Identity) then return end
    local self = Heroes.GetLocal()
    if NPC.GetUnitName(self) ~= "npc_dota_hero_tiny" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(self), Enum.TeamType.TEAM_ENEMY)
    if not hero then return end
	local ordercast = GUI.Get(GT.Identity .. "ordercast", 1)
	if ordercast == nil then return end
    local position = Entity.GetAbsOrigin(hero)   
    local manapoint = NPC.GetMana(self)

	for i = 1, Length(ordercast) do
		GT.Cast(ordercast[i], self, hero, position, manapoint)
	end

	if not NPC.HasModifier(hero, "modifier_item_ethereal_blade_slow") then
		Player.PrepareUnitOrders(Players.GetLocal(), 4, hero, Vector(0,0,0), hero, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, self)
	end
end

function GT.Cast(name, self, hero, position, manapoint)
	if not GUI.SleepReady(GT.Identity .. "cast" .. name) then return end
	local ability = NPC.GetItem(self, name, true) or NPC.GetAbility(self, name)
	
	if name == "item_dagon" then
		ability = NPC.GetItem(self, "item_dagon", true)

		for i = 0, 5 do
			if not ability then ability = NPC.GetItem(self, "item_dagon_" .. i, true) end
		end
	end
	
	local casttype = GT.CastTypes[name]
	if ability == nil then return end
	if	ability
		and  Ability.IsCastable(ability, manapoint)
		and  Ability.IsReady(ability)
	then
		if casttype == 1 then Ability.CastNoTarget(ability)
			elseif casttype == 2 then Ability.CastTarget(ability, hero)
			else Ability.CastPosition(ability, position)
		end
	end
	
	GUI.Sleep(GT.Identity .. "cast" .. name, 0.1)
end

return GT
