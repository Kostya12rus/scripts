--Author: spiregor
--Version: 2.0
local Tusk = {}

Tusk.optionKey = Menu.AddKeyOption({"Hero Specific","Tusk"},"Combo Key",Enum.ButtonCode.KEY_D)
Tusk.optionEnable = Menu.AddOption({"Hero Specific","Tusk"},"Enabled","Enable Or Disable Tusk Combo Script")
Tusk.optionTeamEnable = Menu.AddOption({"Hero Specific","Tusk"},"Adding allies to the snowball","Enable Or Disable Allies added to the snowball ")
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
Tusk.optionEnableBlackKingBar = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Black King Bar","Use Black King Bar In Combo")
Tusk.optionEnableArmlet = Menu.AddOption({ "Hero Specific","Tusk","Items"},"Use Armlet of Mordiggian","Use Armlet of Mordiggian In Combo")
Tusk.sleepers = {}
local Utility = require("Utility")

Tusk.Summons = {
--Eidolons
    "npc_dota_lesser_eidolon",
    "npc_dota_eidolon",
    "npc_dota_greater_eidolon",
    "npc_dota_dire_eidolon",
--Forged(Invoker)	
    "npc_dota_invoker_forged_spirit",
--Wolfs(Lycan)	
    "npc_dota_lycan_wolf1",
    "npc_dota_lycan_wolf2",
    "npc_dota_lycan_wolf3",
    "npc_dota_lycan_wolf4",
--Bear(Lone Druide)	
    "npc_dota_lone_druid_bear1",
    "npc_dota_lone_druid_bear2",
    "npc_dota_lone_druid_bear3",
    "npc_dota_lone_druid_bear4",
--Golem(Warlock)	
	"npc_dota_warlock_golem_1",
	"npc_dota_warlock_golem_2",
	"npc_dota_warlock_golem_3",
	"npc_dota_warlock_golem_scepter_1",
	"npc_dota_warlock_golem_scepter_2",
	"npc_dota_warlock_golem_scepter_3",
--Spiders(Broodmother)	
	"npc_dota_broodmother_spiderling",
	"npc_dota_broodmother_spiderite",
--Treant(Furion)	
	"npc_dota_furion_treant",
	"npc_dota_furion_treant_large",
--Necronomicon	
	"npc_dota_necronomicon_archer_1",
	"npc_dota_necronomicon_archer_2",
	"npc_dota_necronomicon_archer_3",
	"npc_dota_necronomicon_warrior_1",
	"npc_dota_necronomicon_warrior_2",
	"npc_dota_necronomicon_warrior_3",
--Zombies(Undying)	
	"npc_dota_unit_undying_zombie",
	"npc_dota_unit_undying_zombie_torso",
--Boar(Beastmaster)	
	"npc_dota_beastmaster_boar_1",
	"npc_dota_beastmaster_boar_2",
	"npc_dota_beastmaster_boar_3",
	"npc_dota_beastmaster_boar_4",
	
	"npc_dota_brewmaster_earth_1",
	"npc_dota_brewmaster_earth_2",
	"npc_dota_brewmaster_earth_3",
	"npc_dota_brewmaster_fire_1",
	"npc_dota_brewmaster_fire_2",
	"npc_dota_brewmaster_fire_3",
	"npc_dota_brewmaster_storm_1",
	"npc_dota_brewmaster_storm_2",
	"npc_dota_brewmaster_storm_3",
--Familiar(Visage)	
	"npc_dota_visage_familiar1",
	"npc_dota_visage_familiar2",
	"npc_dota_visage_familiar3"
}

function Tusk.OnUpdate()
    if not Menu.IsEnabled(Tusk.optionEnable) then return true end
	--Log.Write(NPC.GetUnitName(Input.GetNearestUnitToCursor(Entity.GetTeamNum(Heroes.GetLocal()), Enum.TeamType.TEAM_FRIEND)))
	if Menu.IsKeyDown(Tusk.optionKey)then
    Tusk.Combo()
	end
end

function Tusk.IsSummonCreep(npc)
    if not npc then return false end

    for i, name in ipairs(Tusk.Summons) do
        if name and NPC.GetUnitName(npc) == name then return true end
    end

    return false
end

function Tusk.GetPredictedPosition(npc, delay)
    local pos = Entity.GetAbsOrigin(npc)
    local dir = Entity.GetRotation(npc):GetForward():Normalized()
    local speed = Utility.GetMoveSpeed(npc)
	if speed <= 350 then
    return pos + dir:Scaled(speed * delay)
	else
	return pos + dir:Scaled(speed/1.5 * delay)
	end
end

function Tusk.Combo()

if not Menu.IsKeyDown(Tusk.optionKey) then return end
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tusk" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if not hero or not Tusk.SleepCheck(0.1, "updaterate") then return end

--Enemy Hero Position
    local heroPos = Entity.GetAbsOrigin(hero)+Vector(100, 0, 0)
	
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
    local BlackKingBar = NPC.GetItem(myHero, "item_black_king_bar", true)
	local Armlet = NPC.GetItem(myHero, "item_armlet", true)

--Current Mana
    local myMana = NPC.GetMana(myHero)
	
	if Menu.IsEnabled(Tusk.optionEnable) then
     if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and Menu.IsEnabled(Tusk.optionEnableSnowball) and 
	 Snowball and Ability.IsCastable(Snowball, myMana) then Ability.CastTarget(Snowball, hero)return end
     
	 for k, v in pairs(NPC.GetHeroesInRadius(myHero, 350 , Enum.TeamType.TEAM_FRIEND)) do
	   	if not NPC.IsIllusion(v) and Entity.IsAlive(v) and not NPC.HasModifier(v, "modifier_tusk_snowball_movement_friendly") then
			if Menu.IsEnabled(Tusk.optionTeamEnable) and NPC.HasModifier(myHero, "modifier_tusk_snowball_movement") then
			Player.AttackTarget( Players.GetLocal(), myHero , v , true )
		    end
			
        end  
	 end
	 
	 for key, value in pairs(NPC.GetUnitsInRadius(myHero, 350 , Enum.TeamType.TEAM_FRIEND)) do
	   	if Tusk.IsSummonCreep(value) and not NPC.IsIllusion(value) and Entity.IsAlive(value) and not NPC.HasModifier(value, "modifier_tusk_snowball_movement_friendly") then
			if Menu.IsEnabled(Tusk.optionTeamEnable) and NPC.HasModifier(myHero, "modifier_tusk_snowball_movement") then
			Player.AttackTarget( Players.GetLocal(), myHero , value , true )
		    end
			
        end  
	 end
	 
	    if not Ability.IsHidden(LaunchSnowball) then Ability.CastNoTarget(LaunchSnowball) return end
		 if not NPC.HasModifier(myHero, "modifier_tusk_snowball_movement") and NPC.IsPositionInRange(myHero, NPC.GetAbsOrigin(hero),200,0) and Ability.IsHidden(LaunchSnowball) then
		 
		 if Menu.IsEnabled(Tusk.optionEnableIceShards) and 
		 IceShards and Ability.IsCastable(IceShards, myMana) then Ability.CastPosition(IceShards, Tusk.GetPredictedPosition(myHero, 1.5)) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableFrozenSigil) and 
		 FrozenSigil and Ability.IsCastable(FrozenSigil, myMana) then Ability.CastNoTarget(FrozenSigil) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableBlackKingBar) and
		 BlackKingBar and Ability.IsCastable(BlackKingBar, 0) then Ability.CastNoTarget(BlackKingBar) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableArmlet) and 
		 Armlet and not Ability.GetToggleState(Armlet) then Ability.Toggle(Armlet, true) Tusk.Sleep(0.1, "updaterate") end
		 
		 if Menu.IsEnabled(Tusk.optionEnableMedallion) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and 
		 Medallion and Ability.IsCastable(Medallion, myMana) then Ability.CastTarget(Medallion, hero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableSolarCrest) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and 
		 SolarCrest and Ability.IsCastable(SolarCrest, myMana) then Ability.CastTarget(SolarCrest, hero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableOrchid) and 
		 Orchid and Ability.IsCastable(Orchid, myMana) and not NPC.IsLinkensProtected(hero) then Ability.CastTarget(Orchid, hero) return end
	 	 
		 if Menu.IsEnabled(Tusk.optionEnableBloodthorn) and 
		 Bloodthorn and Ability.IsCastable(Bloodthorn, myMana) and not NPC.IsLinkensProtected(hero)  then Ability.CastTarget(Bloodthorn, hero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableWalrusPUNCH) and 
		 WalrusPUNCH and Ability.IsCastable(WalrusPUNCH, myMana) then Ability.CastTarget(WalrusPUNCH, hero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableMjollnir) and 
		 Mjollnir and Ability.IsCastable(Mjollnir, myMana) then Ability.CastTarget(Mjollnir, myHero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableAbyssalBlade) and 
		 AbyssalBlade and Ability.IsCastable(AbyssalBlade, myMana) and not NPC.IsStunned(hero) and not NPC.HasModifier(hero, "modifier_tusk_walrus_punch_air_time") and not NPC.IsLinkensProtected(hero) then Ability.CastTarget(AbyssalBlade, hero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableHalberd) and 
		 Halberd and Ability.IsCastable(Halberd, myMana) and not NPC.IsStunned(hero) and not NPC.HasModifier(hero, "modifier_tusk_walrus_punch_air_time") and not NPC.IsLinkensProtected(hero) then Ability.CastTarget(Halberd, hero) return end
		 
		 if Menu.IsEnabled(Tusk.optionEnableBladeMail) and 
		 BladeMail and Ability.IsCastable(BladeMail, myMana) then Ability.CastNoTarget(BladeMail) return end
		 
	    end
    end
end

	
function Tusk.SleepCheck(delay, id)
	if not Tusk.sleepers[id] or (os.clock() - Tusk.sleepers[id]) > delay then
		return true
	end
	return false
end

function Tusk.Sleep(delay, id)
	if not Tusk.sleepers[id] or Tusk.sleepers[id] < os.clock() + delay then
		Tusk.sleepers[id] = os.clock() + delay
	end
end

return Tusk	