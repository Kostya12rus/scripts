local SkyWRTH = {}

SkyWRTH.optionEnable = Menu.AddOption({"Hero Specific","Skywrath Mage"},"Enabled","")
SkyWRTH.optionKey = Menu.AddKeyOption({"Hero Specific","Skywrath Mage"},"Combo Key",Enum.ButtonCode.KEY_SPACE)
SkyWRTH.optionEnableVeil = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Veil Of Discord","")
SkyWRTH.optionEnableHex = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Scythe Of Vyse","")
SkyWRTH.optionEnableBloth = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Bloodthorn","")
SkyWRTH.optionEnableEblade = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Ethereal Blade","")
SkyWRTH.optionEnableOrchid = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Orchid Malevolence","")
SkyWRTH.optionEnableRefresher = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Refresher Orb","")
SkyWRTH.optionEnableRoA = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Rod Of Atos","")
SkyWRTH.optionEnableSring = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Soul Ring","")
SkyWRTH.optionEnableSguard = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Shivas Guard","")
SkyWRTH.optionEnableDagon = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Items"},"Use Dagon","")
SkyWRTH.optionEnableArcBolt = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Abilities"},"Use Arcane Bolt","")
SkyWRTH.optionEnableConShot = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Abilities"},"Use Concussive Shot","")
SkyWRTH.optionEnableAncSeal = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Abilities"},"Use Ancient Seal","")
SkyWRTH.optionEnableMFlare = Menu.AddOption({ "Hero Specific","Skywrath Mage","Toggle Abilities"},"Use Mystic Flare","")
SkyWRTH.optionEnableLinkens1 = Menu.AddOption({ "Hero Specific","Skywrath Mage","Linkens Breaker"},"Break With Arcane Bolt","")
SkyWRTH.optionEnableLinkens2 = Menu.AddOption({ "Hero Specific","Skywrath Mage","Linkens Breaker"},"Break With Ancient Seal","")
SkyWRTH.optionEnableLinkens3 = Menu.AddOption({ "Hero Specific","Skywrath Mage","Linkens Breaker"},"Break With Force Staff","")
SkyWRTH.optionEnableLinkens4 = Menu.AddOption({ "Hero Specific","Skywrath Mage","Linkens Breaker"},"Break With Hurricane Pike","")
SkyWRTH.optionEnableBmail = Menu.AddOption({"Hero Specific","Skywrath Mage"},"Stop Combo When Blademail Activated","")
SkyWRTH.optionEnableLorb = Menu.AddOption({"Hero Specific","Skywrath Mage"},"Stop Combo When Lotus Orb Activated","")

function SkyWRTH.OnUpdate()
    if not Menu.IsEnabled(SkyWRTH.optionEnable) then return true end
    SkyWRTH.ITABcombo()
end

function SkyWRTH.ITABcombo()
    if not Menu.IsKeyDown(SkyWRTH.optionKey) then return end

    local myHero = Heroes.GetLocal()
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_skywrath_mage" then return end
    if not hero then return end

    local arcBolt = NPC.GetAbilityByIndex(myHero, 0)
    local conShot = NPC.GetAbilityByIndex(myHero, 1)
    local ancSeal = NPC.GetAbilityByIndex(myHero, 2)
    local mFlare = NPC.GetAbilityByIndex(myHero, 3)

    local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
    local hex = NPC.GetItem(myHero, "item_sheepstick", true)
    local bloth = NPC.GetItem(myHero, "item_bloodthorn", true)
    local eblade = NPC.GetItem(myHero, "item_ethereal_blade", true)
    local orchid = NPC.GetItem(myHero, "item_orchid", true)
    local refresh = NPC.GetItem(myHero, "item_refresher", true)
    local RoA = NPC.GetItem(myHero, "item_rod_of_atos", true)
    local Sguard = NPC.GetItem(myHero, "item_shivas_guard", true)
    local Sring = NPC.GetItem(myHero, "item_soul_ring", true)
    local Fstaff = NPC.GetItem(myHero, "item_force_staff", true)
    local BladeM = NPC.GetItem(myHero, "item_blade_mail", true)
    local Hstaff = NPC.GetItem(myHero, "item_hurricane_pike", true)
    for i = 0, 5 do
    local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
    if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
	
    local myMana = NPC.GetMana(myHero)
    local mousePos = Input.GetWorldCursorPos()
    local heroPos = Entity.GetAbsOrigin(hero)  -- Pretinieka Heroja Vektors.
    local heroAng = Entity.GetAbsRotation(hero) -- Pretinieka Heroja Lenķis.
    local heroMs = NPC.GetMoveSpeed(hero) -- Pretinieka kustības ātrums.
    local CP = Ability.GetCastPoint(mFlare) -- Manas Ultras Kast Punkts.
    local myPos = Entity.GetAbsOrigin(myHero)

    if NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return true end

    if Menu.IsEnabled(SkyWRTH.optionEnableLorb) and NPC.HasModifier(hero, "modifier_item_lotus_orb_active") then return true end
    if Menu.IsEnabled(SkyWRTH.optionEnableBmail) and NPC.HasModifier(hero, "modifier_item_blade_mail_reflect") then return true end

    if Menu.IsEnabled(SkyWRTH.optionEnableLinkens1) and arcBolt and Ability.IsCastable(arcBolt, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(arcBolt) - 10) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(arcBolt, hero); return end
    if Menu.IsEnabled(SkyWRTH.optionEnableLinkens2) and ancSeal and Ability.IsCastable(ancSeal, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(ancSeal) - 10) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(ancSeal, hero); return end
    if Menu.IsEnabled(SkyWRTH.optionEnableLinkens3) and Fstaff and Ability.IsCastable(Fstaff, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Fstaff) - 10) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Fstaff, hero); return end
    if Menu.IsEnabled(SkyWRTH.optionEnableLinkens4) and Hstaff and Ability.IsCastable(Hstaff, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Hstaff) - 10) and NPC.IsLinkensProtected(hero) then Ability.CastTarget(Hstaff, hero); return end


    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableSring) and Sring and Ability.IsCastable(Sring, 0) then Ability.CastNoTarget(Sring); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableAncSeal) and ancSeal and Ability.IsCastable(ancSeal, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(ancSeal) - 10) then Ability.CastTarget(ancSeal, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableVeil) and veil and Ability.IsCastable(veil, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(veil) - 10) then Ability.CastPosition(veil, heroPos); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableSguard) and Sguard and Ability.IsCastable(Sguard, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Sguard) - 10) then Ability.CastNoTarget(Sguard); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableRoA) and RoA and Ability.IsCastable(RoA, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(RoA) - 10) then Ability.CastTarget(RoA, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableHex) and hex and Ability.IsCastable(hex, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(hex) - 10) then Ability.CastTarget(hex, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableBloth) and bloth and Ability.IsCastable(bloth, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(bloth) - 10) then Ability.CastTarget(bloth, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableEblade) and eblade and Ability.IsCastable(eblade, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(eblade) - 10) then Ability.CastTarget(eblade, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableDagon) and dagon and Ability.IsCastable(dagon, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(dagon) - 10) then  Ability.CastTarget(dagon, hero) return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableOrchid) and orchid and Ability.IsCastable(orchid, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(orchid) - 10) then Ability.CastTarget(orchid, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableArcBolt) and arcBolt and Ability.IsCastable(arcBolt, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(arcBolt) - 10) then Ability.CastTarget(arcBolt, hero); return end
    if Menu.IsEnabled(SkyWRTH.optionEnableConShot) and conShot and Ability.IsCastable(conShot, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(conShot) - 10) then Ability.CastNoTarget(conShot); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableMFlare) and mFlare and Ability.IsCastable(mFlare, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(mFlare) - 10) then Ability.CastPosition(mFlare, heroPos); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(SkyWRTH.optionEnableRefresher) and refresh and Ability.IsCastable(refresh, myMana) then Ability.CastNoTarget(refresh); return end end
end

return SkyWRTH
