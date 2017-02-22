local Clinkz = {}

Clinkz.optionKey = Menu.AddKeyOption({"Hero Specific","Clinkz"},"Combo Key",Enum.ButtonCode.KEY_SPACE)
Clinkz.optionEnable = Menu.AddOption({"Hero Specific","Clinkz"},"Enabled","Enable Or Disable Clinkz Script")

Clinkz.optionEnableAbly1 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Abilities"},"Use Strafe","Use Strafe In Combo")
--Clinkz.optionEnableAbly2 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Abilities"},"Use Searing Arrows","Use Searing Arrows In Combo")

Clinkz.optionEnableItem1 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Soul Ring","Use Soul Ring In Combo")
Clinkz.optionEnableItem2 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Solar Crest","Use Solar Crest In Combo")
Clinkz.optionEnableItem3 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Medallion Of Courage","Use Medallion Of Courage In Combo")
Clinkz.optionEnableItem4 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Diffusal Blade","Use Diffusal Blade In Combo")
Clinkz.optionEnableItem5 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Bloodthorn","Use Bloodthorn In Combo")
Clinkz.optionEnableItem6 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Orchid Malevolence","Use Orchid Malevolence In Combo")
Clinkz.optionEnableItem7 = Menu.AddOption({ "Hero Specific","Clinkz","Toggle Items"},"Use Scythe Of Vyse","Use Scythe Of Vyse In Combo")

Clinkz.optionEnableLinkens1 = Menu.AddOption({ "Hero Specific","Clinkz","Linkens Breaker"},"Break With Diffusal Blade","Use Diffusal Blade To Break Linkens")
Clinkz.optionEnableLinkens2 = Menu.AddOption({ "Hero Specific","Clinkz","Linkens Breaker"},"Break With Orchid Malevolence","Use Orchid Malevolence To Break Linkens")
Clinkz.optionEnableLinkens3 = Menu.AddOption({ "Hero Specific","Clinkz","Linkens Breaker"},"Break With Bloodthorn","Use Bloodthorn To Break Linkens")
Clinkz.optionEnableLinkens4 = Menu.AddOption({ "Hero Specific","Clinkz","Linkens Breaker"},"Break With Scythe Of Vyse","Use Scythe Of Vyse To Break Linkens")

Clinkz.optionSmartUSG = Menu.AddOption({"Hero Specific","Clinkz"},"Smart Usage","Smart Scythe Of Vyse And Orchid Malevolence/Bloodthorn Usage \r\n \r\n  If the enemy is already disabled, it wont cast scythe of vyse \r\n  or orchid malevolence/bloodthorn until the disable ends, and when it cast \r\n  scythe of vyse it will wait till it ends to cast orchid malevolence/bloodthorn., \r\n      same also goes for orchid malevolence/bloodthorn.  \r\n \r\n This way you will have total control over your enemies.")

Clinkz.optionEnableDiffP1 = Menu.AddOption({ "Hero Specific","Clinkz","Diffusal Blade Purge"},"Use On Ghost Form","Use Diffusal Blade On Ghost Form Affected Hero")
Clinkz.optionEnableDiffP2 = Menu.AddOption({ "Hero Specific","Clinkz","Diffusal Blade Purge"},"Use On Ether Blast","Use Diffusal Blade On Ether Blast Affected Hero")
Clinkz.optionEnableDiffP3 = Menu.AddOption({ "Hero Specific","Clinkz","Diffusal Blade Purge"},"Use On Eul's Scepter Of Divinity","Use Diffusal Blade On Eul's Scepter Of Divinity Affected Hero")
Clinkz.optionEnableDiffP4 = Menu.AddOption({ "Hero Specific","Clinkz","Diffusal Blade Purge"},"Use On Glimmer Cape","Use Diffusal Blade On Glimmer Cape Affected Hero")


function Clinkz.OnUpdate()
    if not Menu.IsEnabled(Clinkz.optionEnable) then return true end
    Clinkz.ITABcombo()
end

function Clinkz.ITABcombo()
    if not Menu.IsKeyDown(Clinkz.optionKey) then return end

    local myHero = Heroes.GetLocal()
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_clinkz" then return end
    if not hero then return end

    local Ably1 = NPC.GetAbilityByIndex(myHero, 0)
    local Ably2 = NPC.GetAbilityByIndex(myHero, 1)

    local myMana = NPC.GetMana(myHero)

    local Item7 = NPC.GetItem(myHero, "item_sheepstick", true)
    local Item5 = NPC.GetItem(myHero, "item_bloodthorn", true)
    local Item6 = NPC.GetItem(myHero, "item_orchid", true)
    local Item1 = NPC.GetItem(myHero, "item_soul_ring", true)
    --local BladeM = NPC.GetItem(myHero, "item_blade_mail", true)
    --local Lorb = NPC.GetItem(myHero, "item_lotus_orb", true)
    local Item4 = NPC.GetItem(myHero, "item_diffusal_blade", true)
    local Item8 = NPC.GetItem(myHero, "item_diffusal_blade_2", true)
    local Item3 = NPC.GetItem(myHero, "item_medallion_of_courage", true)
	local Item2 = NPC.GetItem(myHero, "item_solar_crest", true)

    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableLinkens1) and Item4 and Ability.IsCastable(Item4, 0) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Item4, hero); return end --Diffusal Blade 1
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableLinkens1) and Item8 and Ability.IsCastable(Item8, 0) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Item8, hero); return end --Diffusal Blade 2
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableLinkens2) and Item6 and Ability.IsCastable(Item6, myMana) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Item6, hero); return end --Orchid
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableLinkens3) and Item5 and Ability.IsCastable(Item5, myMana) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Item5, hero); return end --Bloodthorn
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableLinkens4) and Item7 and Ability.IsCastable(Item7, myMana) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Item7, hero); return end --Hex


    if Menu.IsEnabled(Clinkz.optionEnableItem1) 
    and Item1 and Ability.IsCastable(Item1, 0) then Ability.CastNoTarget(Item1); return end 
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableItem4) and Item4 and Ability.IsCastable(Item4, 0) then Ability.CastTarget(Item4, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableItem4) and Item8 and Ability.IsCastable(Item8, 0) then Ability.CastTarget(Item8, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableItem2) and not NPC.HasModifier(hero, "modifier_item_solar_crest_armor_reduction") and Item2 and Ability.IsCastable(Item2, 0) then Ability.CastTarget(Item2, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionEnableItem3) and not NPC.HasModifier(hero, "modifier_item_medallion_of_courage_armor_reduction") and Item3 and Ability.IsCastable(Item3, 0) then Ability.CastTarget(Item3, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
    and Menu.IsEnabled(Clinkz.optionEnableItem5) and not Menu.IsEnabled(Clinkz.optionSmartUSG) and not NPC.HasModifier(hero, "modifier_item_bloodthorn") and not NPC.IsLinkensProtected(hero) and Item5 and Ability.IsCastable(Item5, myMana) then Ability.CastTarget(Item5, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
    and Menu.IsEnabled(Clinkz.optionEnableItem6) and not Menu.IsEnabled(Clinkz.optionSmartUSG) and not NPC.HasModifier(hero, "modifier_orchid_malevolence_debuff") and not NPC.IsLinkensProtected(hero) and Item6 and Ability.IsCastable(Item6, myMana) then Ability.CastTarget(Item6, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
    and Menu.IsEnabled(Clinkz.optionEnableItem7) and not Menu.IsEnabled(Clinkz.optionSmartUSG) and not NPC.HasModifier(hero, "modifier_sheepstick_debuff") and not NPC.IsLinkensProtected(hero) and Item7 and Ability.IsCastable(Item7, myMana) then Ability.CastTarget(Item7, hero); return end
    
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionSmartUSG) and not NPC.IsLinkensProtected(hero) and not NPC.IsSilenced(hero) and not NPC.IsStunned(hero) and  Item7 and Ability.IsCastable(Item7, myMana) then Ability.CastTarget(Item7, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionSmartUSG) and not NPC.IsLinkensProtected(hero) and not NPC.IsSilenced(hero) and not NPC.IsStunned(hero) and Item6 and Ability.IsCastable(Item6, myMana) then Ability.CastTarget(Item6, hero); return end
    if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) 
    and Menu.IsEnabled(Clinkz.optionSmartUSG) and not NPC.IsLinkensProtected(hero) and not NPC.IsSilenced(hero) and not NPC.IsStunned(hero) and Item5 and Ability.IsCastable(Item5, myMana) then Ability.CastTarget(Item5, hero); return end

    if Menu.IsEnabled(Clinkz.optionEnableDiffP2) and not NPC.IsLinkensProtected(hero) and  NPC.HasModifier(hero, "modifier_item_ethereal_blade_ethereal") and Item4 and Ability.IsCastable(Item4, myMana) then Ability.CastTarget(Item4, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP2) and not NPC.IsLinkensProtected(hero) and NPC.HasModifier(hero, "modifier_item_ethereal_blade_ethereal") and Item8 and Ability.IsCastable(Item8, myMana) then Ability.CastTarget(Item8, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP1) and not NPC.IsLinkensProtected(hero) and  NPC.HasModifier(hero, "modifier_ghost_state") and Item4 and Ability.IsCastable(Item4, myMana) then Ability.CastTarget(Item4, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP1) and not NPC.IsLinkensProtected(hero) and NPC.HasModifier(hero, "modifier_ghost_state") and Item8 and Ability.IsCastable(Item8, myMana) then Ability.CastTarget(Item8, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP3) and not NPC.IsLinkensProtected(hero) and NPC.HasModifier(hero, "modifier_eul_cyclone") and Item4 and Ability.IsCastable(Item4, myMana) then Ability.CastTarget(Item4, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP3) and not NPC.IsLinkensProtected(hero) and NPC.HasModifier(hero, "modifier_eul_cyclone") and Item8 and Ability.IsCastable(Item8, myMana) then Ability.CastTarget(Item8, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP4) and not NPC.IsLinkensProtected(hero) and NPC.HasModifier(hero, "modifier_item_glimmer_cape") and Item4 and Ability.IsCastable(Item4, myMana) then Ability.CastTarget(Item4, hero); return end
    if Menu.IsEnabled(Clinkz.optionEnableDiffP4) and not NPC.IsLinkensProtected(hero) and NPC.HasModifier(hero, "modifier_item_glimmer_cape") and Item8 and Ability.IsCastable(Item8, myMana) then Ability.CastTarget(Item8, hero); return end

    if Menu.IsEnabled(Clinkz.optionEnableAbly1) and Ably1 and Ability.IsCastable(Ably1, myMana) then Ability.CastNoTarget(Ably1); return end  
 
    Player.PrepareUnitOrders(Players.GetLocal(), 4, hero, Vector(0,0,0), hero, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)

end

return Clinkz