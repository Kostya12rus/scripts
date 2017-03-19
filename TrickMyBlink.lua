local TrickMyBlink = {}

TrickMyBlink.IsToggled = Menu.AddOption( {"Utility", "TrickMyBlink"}, "Enabled", "")
TrickMyBlink.IsBlinkToCursor = Menu.AddOption( {"Utility", "TrickMyBlink"}, "Blink to Cursor", "")
TrickMyBlink.IsCheckForModifiers = Menu.AddOption( {"Utility", "TrickMyBlink"}, "Check for modifiers", "Abuse blink dagger while debuffs deal damage over time")
TrickMyBlink.IsBlinkAbuse = Menu.AddOption( {"Utility", "TrickMyBlink"}, "Blink Abuze", "Abuse blink dagget via backpack to avoid 3 sec cooldown when enemy is attacking")
TrickMyBlink.BlinkKey = Menu.AddKeyOption( {"Utility", "TrickMyBlink"}, "Blink Key", Enum.ButtonCode.KEY_TAB)
TrickMyBlink.BlinkSlot = Menu.AddOption( {"Utility", "TrickMyBlink"}, "Blink Slot Num", "", 1, 6, 1)
TrickMyBlink.Modifiers =
{ 
  [0] = "modifier_item_orb_of_venom",
  [1] = "modifier_queenofpain_shadow_strike",
  [2] = "modifier_venomancer_venomous_gale",
  [3] = "modifier_venomancer_poison_sting",
  [4] = "modifier_venomancer_poison_nova",
  [5] = "modifier_ice_blast",
  [6] = "modifier_pudge_rot",
  [7] = "modifier_item_urn_damage",
  [8] = "modifier_alchemist_acid_spray",
  [9] = "modifier_item_radiance_debuff",
  [10] = "modifier_rattletrap_battery_assault",
  [11] = "modifier_doom_bringer_scorched_earth_effect",
  [12] = "modifier_earth_spirit_magnetize",
  [13] = "modifier_huskar_burning_spear_debuff",
  [14] = "modifier_phoenix_fire_spirit_burn",
  [15] = "modifier_treant_leech_seed",
  [16] = "modifier_skeleton_king_hellfire_blast",
  [17] = "modifier_ember_spirit_flame_guard",
  [18] = "modifier_dark_seer_ion_shell",
  [19] = "modifier_lone_druid_spirit_bear_entangle_effect", 
  [20] = "modifier_jakiro_dual_breath_burn",
  [21] = "modifier_jakiro_liquid_fire_burn",
  [22] = "modifier_batrider_firefly",
  [23] = "modifier_greevil_cold_snap_freeze",
  [24] = "modifier_leshrac_diabolic_edict",
  [25] = "modifier_ogre_magi_ignite",
  [26] = "modifier_invoker_chaos_meteor_burn",
  [27] = "modifier_silencer_curse_of_the_silent", 
  [28] = "modifier_crystal_maiden_frostbite"
 }
TrickMyBlink.sleepers = {}
TrickMyBlink.BlinkInPack = false

function TrickMyBlink.OnUpdate()
    local hero = Heroes.GetLocal()
	local player = Players.GetLocal()
	if not hero or not Menu.IsEnabled(TrickMyBlink.IsToggled) or not Entity.IsAlive(hero) then return end
	if not Menu.IsKeyDown(TrickMyBlink.BlinkKey) or not TrickMyBlink.SleepCheck(0.05, "updaterate") then return end
	local blink = NPC.GetItem(hero, "item_blink", false)
	if not blink then return end
	if Ability.IsReady(blink) then
		TrickMyBlink.UseBlink(hero, blink) 
	end
	if Menu.IsEnabled(TrickMyBlink.IsBlinkAbuse) then
		if Ability.GetCooldownTimeLeft(blink) > 2 and Ability.GetCooldownTimeLeft(blink) < 6 then
			local entities = Heroes.GetAll()
			for index, ent in pairs(entities) do
				local enemyhero = Heroes.Get(index)
				if ((not Entity.IsSameTeam(hero, enemyhero) and NPC.IsEntityInRange(hero, enemyhero, NPC.GetAttackRange(enemyhero)) and NPC.IsAttacking(enemyhero)) or TrickMyBlink.CheckForModifiers(hero)) and NPC.HasInventorySlotFree(hero, false) and TrickMyBlink.SleepCheck(6, "backpack") then
					Player.PrepareUnitOrders(player, Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_ITEM, 8, Vector(0,0,0), blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, hero)
					Player.PrepareUnitOrders(player, Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_ITEM, Menu.GetValue(TrickMyBlink.BlinkSlot) - 1, Vector(0,0,0), blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, hero)
					TrickMyBlink.Sleep(6, "backpack")
					return
				end
			end
		end
	end
	TrickMyBlink.Sleep(0.05, "updaterate");
end

function TrickMyBlink.UseBlink(hero, blink)
	local castRange = Ability.GetLevelSpecialValueFor(blink, "blink_range") + NPC.GetCastRangeBonus(hero)
	local heroPosition = NPC.GetAbsOrigin(hero)
	local distance = Vector(0,0,0)
	if Menu.IsEnabled(TrickMyBlink.IsBlinkToCursor) then 
		distance = Input.GetWorldCursorPos() - heroPosition
	else
		distance = TrickMyBlink.InFront(hero, heroPosition, castRange) - heroPosition
	end

	distance:SetZ(0)
	distance:Normalize()
	distance:Scale(castRange - 1)

	local blinkpos = heroPosition + distance
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, hero, blinkpos, blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, hero, false, false)
end

function TrickMyBlink.CheckForModifiers(hero)
	if not Menu.IsEnabled(TrickMyBlink.IsCheckForModifiers) then return false end
	for i=0,28 do
		if NPC.HasModifier(hero, TrickMyBlink.Modifiers[i]) then
			return true
		end
	end
	return false
end

function TrickMyBlink.InFront(hero, heroPosition, castRange)
	local vec = Entity.GetRotation(hero):GetVectors()
	if vec then
		local x = heroPosition:GetX() + vec:GetX() * castRange
		local y = heroPosition:GetY() + vec:GetY() * castRange
		return Vector(x,y,0)
	end
end

function TrickMyBlink.SleepCheck(delay, id)
	if not TrickMyBlink.sleepers[id] or (os.clock() - TrickMyBlink.sleepers[id]) > delay then
		return true
	end
	return false
end

function TrickMyBlink.Sleep(delay, id)
	if not TrickMyBlink.sleepers[id] or TrickMyBlink.sleepers[id] < os.clock() + delay then
		TrickMyBlink.sleepers[id] = os.clock() + delay
	end
end

return TrickMyBlink