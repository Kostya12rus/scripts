local Tusk = {}

Tusk.optionKey = Menu.AddKeyOption({"Hero Specific","Tusk"},"Combo Key",Enum.ButtonCode.KEY_D)
Tusk.optionEnable = Menu.AddOption({"Hero Specific","Tusk"},"Enabled","Enable Or Disable Tusk Combo Script")
--Menu Skills
Tusk.optionEnableIceShards = Menu.AddOption({ "Hero Specific","Tusk","Skills"},"Use Ice Shards","Use Ice Shards In Combo")
Tusk.optionEnableSnowball = Menu.AddOption({ "Hero Specific","Tusk","Skills"},"Use Snowball","Use Snowball In Combo")
Tusk.optionEnableFrozenSigil = Menu.AddOption({ "Hero Specific","Tusk","Skills"},"Use Frozen Sigil","Use Frozen Sigil In Combo")
Tusk.optionEnableWalrusPUNCH = Menu.AddOption({ "Hero Specific","Tusk","Skills"},"Use Walrus PUNCH","Use Walrus PUNCH In Combo")
--Tusk.optionEnableWalrusKICK = Menu.AddOption({ "Hero Specific","Tusk","Skills"},"Use Walrus KICK","Use Walrus KICK In Combo")
--Menu Items
Tusk.optionEnableMedallion = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Medallion","Use Medallion In Combo")
Tusk.optionEnableSolarCrest = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Solar Crest","Use Solar Crest In Combo")
Tusk.optionEnableOrchid = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Orchid","Use Orchid In Combo")
Tusk.optionEnableBloodthorn = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Bloodthorn","Use Bloodthorn In Combo")
Tusk.optionEnableHalberd = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Halberd","Use Halberd In Combo")
Tusk.optionEnableAbyssalBlade = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Abyssal Blade","Use Abyssal Blade In Combo")
Tusk.optionEnableMjollnir = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Mjollnir","Use Mjollnir In Combo")
--Tusk.optionEnableBlink = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Blink","Use Blink In Combo")
Tusk.optionEnableBladeMail = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Blade Mail","Use Blade Mail In Combo")


Tusk.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

function Tusk.OnUpdate()
    if not Menu.IsEnabled(Tusk.optionEnable) then return true end
    Tusk.Combo()
end
    
function Tusk.Combo()

if not Menu.IsKeyDown(Tusk.optionKey) then return end
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tusk" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if not hero then return end

--Enemy Hero Position
    local heroPos = Entity.GetAbsOrigin(hero)

--Skills	
    local IceShards = NPC.GetAbility(myHero, "tusk_ice_shards")
    local Snowball = NPC.GetAbility(myHero, "tusk_snowball")
    local LaunchSnowball = NPC.GetAbility(myHero, "tusk_launch_snowball")	
	local FrozenSigil = NPC.GetAbility(myHero, "tusk_frozen_sigil")
	local WalrusPUNCH = NPC.GetAbility(myHero, "tusk_walrus_punch")

--If have Aghanim's scepter	
	local WalrusKICK = NPC.GetAbility(myHero, "tusk_walrus_kick")

--Items    
	local blink = NPC.GetItem(myHero, "item_blink", true)
    local Orchid = NPC.GetItem(myHero, "item_orchid", true)
    local Bloodthorn = NPC.GetItem(myHero, "item_bloodthorn", true)
    local Halberd = NPC.GetItem(myHero, "item_heavens_halberd", true)
    local Medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
    local SolarCrest = NPC.GetItem(myHero, "item_solar_crest", true)
    local AbyssalBlade = NPC.GetItem(myHero, "item_abyssal_blade", true)
    local Mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local BladeMail = NPC.GetItem(myHero, "item_blade_mail", true)	


--Current Mana
    local myMana = NPC.GetMana(myHero)

	--Casting order    
	if Menu.IsEnabled(Tusk.optionEnable) then
		if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Snowball and Ability.IsCastable(Snowball, myMana) then Ability.CastTarget(Snowball, hero)return end
		if LaunchSnowball and not Ability.IsHidden(LaunchSnowball) then Ability.CastNoTarget(LaunchSnowball) return end
	 	 	 	
		if not NPC.HasModifier(myHero, "modifier_tusk_snowball_movement") and not NPC.HasModifier(myHero, "modifier_tusk_snowball_movement_friendly") then
	 
		if Menu.IsEnabled(Tusk.optionEnableIceShards) and IceShards and Ability.IsCastable(IceShards, myMana) then Ability.CastPosition(IceShards, heroPos) return end
		if Menu.IsEnabled(Tusk.optionEnableFrozenSigil) and FrozenSigil and Ability.IsCastable(FrozenSigil, myMana) then Ability.CastNoTarget(FrozenSigil) return end
		if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Menu.IsEnabled(Tusk.optionEnableMedallion) and Medallion and Ability.IsCastable(Medallion, myMana) then Ability.CastTarget(Medallion, hero) return end
		if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Menu.IsEnabled(Tusk.optionEnableSolarCrest) and SolarCrest and Ability.IsCastable(SolarCrest, myMana) then Ability.CastTarget(SolarCrest, hero) return end
		if Menu.IsEnabled(Tusk.optionEnableWalrusPUNCH) and not NPC.IsStunned(hero) and WalrusPUNCH and Ability.IsCastable(WalrusPUNCH, myMana) then Ability.CastTarget(WalrusPUNCH, hero) return end
		if Mjollnir and Ability.IsCastable(Mjollnir, myMana) and Menu.IsEnabled(Tusk.optionEnableMjollnir) then Ability.CastTarget(Mjollnir, myHero) return end
		if AbyssalBlade and Ability.IsCastable(AbyssalBlade, myMana) and Menu.IsEnabled(Tusk.optionEnableAbyssalBlade) and not NPC.IsStunned(hero) and not NPC.HasModifier(hero, "modifier_tusk_walrus_punch_air_time") and not NPC.IsLinkensProtected(hero) then Ability.CastTarget(AbyssalBlade, hero) return end
		if Orchid and Ability.IsCastable(Orchid, myMana) and Menu.IsEnabled(Tusk.optionEnableOrchid) and not NPC.IsStunned(hero) and not NPC.HasModifier(hero, "modifier_tusk_walrus_punch_air_time") and not NPC.IsLinkensProtected(hero)  then Ability.CastTarget(Orchid, hero) return end
	 	if Bloodthorn and Ability.IsCastable(Bloodthorn, myMana) and Menu.IsEnabled(Tusk.optionEnableBloodthorn) and not NPC.IsStunned(hero) and not NPC.HasModifier(hero, "modifier_tusk_walrus_punch_air_time") and not NPC.IsLinkensProtected(hero)  then Ability.CastTarget(Bloodthorn, hero) return end
		if Halberd and Ability.IsCastable(Halberd, myMana) and Menu.IsEnabled(Tusk.optionEnableHalberd) and not NPC.IsStunned(hero) and not NPC.HasModifier(hero, "modifier_tusk_walrus_punch_air_time") and not NPC.IsLinkensProtected(hero) then Ability.CastTarget(Halberd, hero) return end
		if BladeMail and Ability.IsCastable(BladeMail, myMana) and Menu.IsEnabled(Tusk.optionEnableBladeMail) then Ability.CastNoTarget(BladeMail) return end
		 end
	 end
	 
function sleep(n)  -- seconds
	local t0 = clock()
	while clock() - t0 <= n do end
end
    

Player.PrepareUnitOrders(Players.GetLocal(), 4, hero, Vector(0,0,0), hero, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero)
end


return Tusk