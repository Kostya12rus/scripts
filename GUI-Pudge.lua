local PE	= {}
PE.Identity	= "butcher"
PE.Locale	= {
	["name"] = {
		["english"] = "Butcher",
		["russian"] = "Мясник"
	},
	["desc"] = {
		["english"] = "Fake hook / creep farm / suicide",
		["russian"] = "Фейк хук / фарм крипов / суицид"
	},
	["fakehook"] = {
		["english"] = "Fake hook (auto cansel)",
		["russian"] = "Фейковый хук (авто отмена)"
	},
	["suicide"] = {
		["english"] = "Automatically kills you on low hp",
		["russian"] = "Убивает вас при малом здоровье"
	},
	["rotfarm"] = {
		["english"] = "Rot farm (Try to deny creep with Rot)",
		["russian"] = "Рут фарм (Пытается добивать врагов при помощи вони)"
	},
	["rotfarmthreshold"] = {
		["english"] = "Use rot farm only when HP more than",
		["russian"] = "Фармить вонью только когда ХП больше чем"
	}
}

PE.NextTime				= {}
PE.NextTime["scary"]	= 0
PE.NextTime["rot"]		= 0
local Pudge 			= {}

function PE.OnDraw()
	if GUI == nil then return end
	
	if not GUI.Exist(PE.Identity) then
		local GUI_Object	= {}
		GUI_Object["perfect_name"]		= PE.Locale['name']
		GUI_Object["perfect_desc"]		= PE.Locale['desc']
		GUI_Object["perfect_author"]	= 'paroxysm'
		GUI_Object["perfect_version"]	= 171223
		GUI_Object["hero"]				= "Pudge"
		GUI_Object["category"]			= GUI.Category.Heroes
		GUI.Initialize(PE.Identity, GUI_Object)
		
		GUI.AddMenuItem(PE.Identity,	PE.Identity .. "fakehook",			PE.Locale["fakehook"],			GUI.MenuType.Key,		"N",			PE.FakeHook,	1)
		GUI.AddMenuItem(PE.Identity,	PE.Identity .. "suicide",			PE.Locale['suicide'],			GUI.MenuType.CheckBox,	1)
		GUI.AddMenuItem(PE.Identity,	PE.Identity .. "rotfarm",			PE.Locale['rotfarm'],			GUI.MenuType.CheckBox,	1)
		GUI.AddMenuItem(PE.Identity,	PE.Identity .. "rotfarmthreshold",	PE.Locale["rotfarmthreshold"],	GUI.MenuType.Slider,	1,				1000,	300)		
	end
end

function PE.FakeHook()
	if	GUI.IsEnabled(PE.Identity)
		and Pudge.Hero ~= nil
		and Pudge.Hook ~= nil
		and PE.NextTime["scary"] == 0
		and Ability.IsCastable(Pudge.Hook, NPC.GetMana(Pudge.Hero))
	then
		Ability.CastPosition(Pudge.Hook, Input.GetWorldCursorPos())
		PE.NextTime["scary"] = GameRules.GetGameTime() + 0.25
	end
end

function PE.OnUpdate()
	if Heroes.GetLocal() == nil then return end
	Pudge.Hero		= Heroes.GetLocal()
	if NPC.GetUnitName(Pudge.Hero) ~= "npc_dota_hero_pudge" then return end
	Pudge.Hook		= NPC.GetAbility(Pudge.Hero, 'pudge_meat_hook')
	Pudge.Rot		= NPC.GetAbility(Pudge.Hero, 'pudge_rot')
	Pudge.RotDMG	= NPC.GetAbilityByIndex(Pudge.Hero, 5)
	if	not	Entity.IsAlive(Pudge.Hero)
		or	NPC.IsStunned(Pudge.Hero)
		or	NPC.IsSilenced(Pudge.Hero)
	then return end
	
	if	PE.NextTime["scary"] > 0 
		and GameRules.GetGameTime() > PE.NextTime["scary"]
	then 
		Player.HoldPosition(Players.GetLocal(), Pudge.Hero, false) 
		PE.NextTime["scary"] = 0
	end

	
	local rotdmg	= math.floor(Ability.GetLevel(Pudge.Rot) * 30)
	if Pudge.RotDMG == 1 then
		rotdmg		= rotdmg + 35
	end
	
	if	GUI.IsEnabled(PE.Identity .. "rotfarm")
		and not Ability.GetToggleState(Pudge.Rot)
		and Entity.GetHealth(Pudge.Hero) > tonumber(GUI.Get(PE.Identity .. "rotfarmthreshold"))
	then
		for k, v in pairs(NPC.GetUnitsInRadius(Pudge.Hero, 250, Enum.TeamType.TEAM_ENEMY)) do
			if NPC.IsKillable(v) then
				if Entity.GetHealth(v) < ((rotdmg / 4) * NPC.GetMagicalArmorDamageMultiplier(v)) then
					Ability.Toggle(Pudge.Rot)
					PE.NextTime["rot"] = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 0.1
				end
			end
		end
	else
		if	GameRules.GetGameTime() >= PE.NextTime["rot"]
			and PE.NextTime["rot"] ~= 0
		then
			Ability.Toggle(Pudge.Rot)
			PE.NextTime["rot"] = 0
		end
	end
	
	if	GUI.IsEnabled(PE.Identity .. "suicide") 
	then
		local hpdie	= rotdmg
		local soul	= NPC.GetItem(Pudge.Hero, "item_soul_ring", true)

		hpdie		=	(hpdie * NPC.GetMagicalArmorDamageMultiplier(Pudge.Hero)) / 4
		
		if	soul 
			and Ability.IsCastable(soul, NPC.GetMana(Pudge.Hero)) 
		then
			hpdie = hpdie + 150
		end		
		
		if Entity.GetHealth(Pudge.Hero) < hpdie then
			Ability.CastNoTarget(soul)
			if not Ability.GetToggleState(Pudge.Rot) then Ability.Toggle(Pudge.Rot) end
		end
	end
	
end

return PE
