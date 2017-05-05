--Author: spiregor
local Nyx = {}

Nyx.optionKey = Menu.AddKeyOption({"Hero Specific","Nyx"},"Combo Key",Enum.ButtonCode.KEY_D)
Nyx.optionEnable = Menu.AddOption({"Hero Specific","Nyx"},"Enabled","Enable Or Disable Nyx Combo Script")
Nyx.optionManaBurn = Menu.AddOption({"Hero Specific","Nyx"},"Auto Mana Burn","Auto use Mana Burn if you can kill enemy")
Nyx.sleepers = {}
Nyx.Modifiers = { [0] = "modifier_medusa_stone_gaze_stone", [1] = "modifier_winter_wyvern_winters_curse", [2] = "modifier_item_lotus_orb_active", [3] = "modifier_templar_assassin_refraction_absorb", [4] = "modifier_item_blade_mail_reflect", [5] = "modifier_nyx_assassin_spiked_carapace" }

function Nyx.OnUpdate()
    if not Menu.IsEnabled(Nyx.optionEnable) then return true end
	if Menu.IsKeyDown(Nyx.optionKey)then
    Nyx.Combo()
	end
	if not Menu.IsKeyDown(Nyx.optionKey)then
	Nyx.AutoSteal()
	end
end	


function Nyx.Combo()
if not Menu.IsKeyDown(Nyx.optionKey) then return end
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_nyx_assassin" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	--local AlliesHero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_FRIEND)
    local heroPos = Entity.GetAbsOrigin(hero)
	local myMana = NPC.GetMana(myHero)
	
	
	
	if not hero then return end
	
--Skills
    local Impale = NPC.GetAbility(myHero, "nyx_assassin_impale")
    local ManaBurn = NPC.GetAbility(myHero, "nyx_assassin_mana_burn")
    local Carapace = NPC.GetAbility(myHero, "nyx_assassin_spiked_carapace")	
	local Vendetta = NPC.GetAbility(myHero, "nyx_assassin_vendetta")
--Skills(Aghanim)
    local Vendetta = NPC.GetAbility(myHero, "nyx_assassin_burrow")
    local Vendetta = NPC.GetAbility(myHero, "nyx_assassin_unburrow")
--Items	
    local dagon = NPC.GetItem(myHero, "item_dagon", true)
	if not dagon then
		for i = 2, 5 do
			dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
			if dagon then break end
		end
	end	
    local EtherealBlade  = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local VeilOfDiscord  = NPC.GetItem(myHero, "item_veil_of_discord", true)
	
	if Menu.IsEnabled(Nyx.optionEnable) then
	   if NPC.HasModifier(myHero, "modifier_nyx_assassin_vendetta") then
	   Player.AttackTarget( Players.GetLocal(), myHero , hero , false )
	      elseif not NPC.HasModifier(myHero, "modifier_nyx_assassin_vendetta") then
		     
			 if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
			 and VeilOfDiscord and Ability.IsCastable(VeilOfDiscord, myMana) then Ability.CastPosition(VeilOfDiscord, heroPos) return end 
	         
			 if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(hero)
			 and EtherealBlade and Ability.IsCastable(EtherealBlade, myMana) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(EtherealBlade)) then Ability.CastTarget(EtherealBlade, hero) return end
	         
			 if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)
			 and Impale and Ability.IsCastable(Impale, myMana) then Ability.CastPosition(Impale, heroPos) return end
	         
			 if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(hero)
			 and ManaBurn and Ability.IsCastable(ManaBurn, myMana) then Ability.CastTarget(ManaBurn, hero) return end
	         
			 if not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(hero)
			 and dagon and Ability.IsCastable(dagon, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(dagon)) then Ability.CastTarget(dagon, hero) return end
	         end
	 
	 end
end

function Nyx.AutoSteal()
    local hero = Heroes.GetLocal()
	local player = Players.GetLocal()
	if not hero or not Menu.IsEnabled(Nyx.optionManaBurn) or not Nyx.SleepCheck(0.1, "updaterate") or not Entity.IsAlive(hero) then return end
	local ManaBurn = NPC.GetAbility(hero, "nyx_assassin_mana_burn")
	if not ManaBurn or not Ability.IsReady(ManaBurn) or not Ability.IsCastable(ManaBurn, Ability.GetManaCost(ManaBurn)) then return end
	local target = Nyx.FindTarget(hero, ManaBurn)
	if not target then return end
	Ability.CastTarget(ManaBurn, target)	
	Nyx.Sleep(0.1, "updaterate");
end

function Nyx.FindTarget(me, item)
    for k, enemyhero in pairs(NPC.GetHeroesInRadius(me, Ability.GetCastRange(item) + NPC.GetCastRangeBonus(me), Enum.TeamType.TEAM_ENEMY)) do
        if not NPC.IsLinkensProtected(enemyhero)
            and not NPC.IsIllusion(enemyhero)
            and NPC.IsEntityInRange(me, enemyhero, Ability.GetCastRange(item) + NPC.GetCastRangeBonus(me))
        then
            local dagondmg = Ability.GetLevelSpecialValueForFloat(item, "float_multiplier")*Hero.GetIntellectTotal(enemyhero) + Ability.GetLevelSpecialValueForFloat(item, "float_multiplier")*Hero.GetIntellectTotal(enemyhero) * (Hero.GetIntellectTotal(me) / 16 / 100)
            local totaldmg = (1 - NPC.GetMagicalArmorValue(enemyhero)) * dagondmg
			Log.Write(totaldmg)
            local isValid = Nyx.CheckForModifiers(enemyhero)
            if Entity.GetHealth(enemyhero) < totaldmg and NPC.GetMana(enemyhero) >= totaldmg and isValid then return enemyhero end
        end
    end
end
	
function Nyx.CheckForModifiers(target)
	for i=0,5 do
		if NPC.HasModifier(target, Nyx.Modifiers[i]) then
			return false
		end
	end
	return true
end

function Nyx.SleepCheck(delay, id)
	if not Nyx.sleepers[id] or (os.clock() - Nyx.sleepers[id]) > delay then
		return true
	end
	return false
end

function Nyx.Sleep(delay, id)
	if not Nyx.sleepers[id] or Nyx.sleepers[id] < os.clock() + delay then
		Nyx.sleepers[id] = os.clock() + delay
	end
end	
	
return Nyx