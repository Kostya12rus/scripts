local PugnaD = {}

PugnaD.optionEnable = Menu.AddOption({"Hero Specific","PugnaD"},"Enabled","")
PugnaD.optionKey = Menu.AddKeyOption({"Hero Specific","PugnaD"},"Combo Key",Enum.ButtonCode.KEY_SPACE)
PugnaD.optionEnableVeil = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Veil Of Discord","")
PugnaD.optionEnableHex = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Scythe Of Vyse","")
PugnaD.optionEnableBloth = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Bloodthorn","")
PugnaD.optionEnableEblade = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Ethereal Blade","")
PugnaD.optionEnableOrchid = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Orchid Malevolence","")
PugnaD.optionEnableRefresher = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Refresher Orb","")
PugnaD.optionEnableBlink = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Blink","")
PugnaD.optionEnableShadow = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Shadow Blade","")
PugnaD.optionEnableSilver = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Silver Edge","")
PugnaD.optionEnableGlimmer = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Glimmer Cape","")
PugnaD.optionEnableRoA = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Rod Of Atos","")
PugnaD.optionEnableSring = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Soul Ring","")
PugnaD.optionEnableSguard = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Shivas Guard","")
PugnaD.optionEnableDagon = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Items"},"Use Dagon","")
PugnaD.optionEnableNetherBlast = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Abilities"},"Use NetherBlast","")
PugnaD.optionEnableDecrepify = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Abilities"},"Use Decrepify","")
PugnaD.optionEnableNWard = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Abilities"},"Use NWard","")
PugnaD.optionEnableLifedrain = Menu.AddOption({ "Hero Specific","PugnaD","Toggle Abilities"},"Use Lifedrain","")
PugnaD.optionEnableLinkens1 = Menu.AddOption({ "Hero Specific","PugnaD","Linkens Breaker"},"Break With Lifedrain","")
PugnaD.optionEnableLinkens2 = Menu.AddOption({ "Hero Specific","PugnaD","Linkens Breaker"},"Break With Decrepify","")
PugnaD.optionEnableLinkens3 = Menu.AddOption({ "Hero Specific","PugnaD","Linkens Breaker"},"Break With Force Staff","")
PugnaD.optionEnableLinkens4 = Menu.AddOption({ "Hero Specific","PugnaD","Linkens Breaker"},"Break With Hurricane Pike","")
PugnaD.optionEnableLinkens5 = Menu.AddOption({ "Hero Specific","PugnaD","Linkens Breaker"},"Break With EUL","")
PugnaD.optionEnableBmail = Menu.AddOption({"Hero Specific","PugnaD"},"Stop Combo When Blademail Activated","")
PugnaD.optionEnableLorb = Menu.AddOption({"Hero Specific","PugnaD"},"Stop Combo When Lotus Orb Activated","")

function PugnaD.OnUpdate()
    if not Menu.IsEnabled(PugnaD.optionEnable) then return true end
   if not Menu.IsKeyDown(PugnaD.optionKey) then return end

    local myHero = Heroes.GetLocal()
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_pugna" then return end
    if not hero then return end
	
	
    local dagon = NPC.GetItem(myHero, "item_dagon", true)
	if not dagon then
    for i = 2, 5 do
         dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
      		if dagon then 
				break 
			end
		end
	end


    local NetherBlast = NPC.GetAbilityByIndex(myHero, 0)
    local Decrepify = NPC.GetAbilityByIndex(myHero, 1)
    local NWard = NPC.GetAbilityByIndex(myHero, 2)
    local Lifedrain = NPC.GetAbilityByIndex(myHero, 3)


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
    local EUL = NPC.GetItem(myHero, "item_cyclone", true)
    local shadowblyad = NPC.GetItem(myHero, "item_invis_sword", true)
    local silveredge = NPC.GetItem(myHero, "item_silver_edge", true)
    local glimmer = NPC.GetItem(myHero, "item_glimmer_cape", true)

    if Ability.IsInAbilityPhase(Lifedrain) and shadowblyad and Menu.IsEnabled(PugnaD.optionEnableShadow) then Ability.CastNoTarget(shadowblyad); return end
    if Ability.IsInAbilityPhase(Lifedrain) and silveredge and Menu.IsEnabled(PugnaD.optionEnableSilver) then Ability.CastNoTarget(silveredge); return end
    if Ability.IsInAbilityPhase(Lifedrain) and glimmer and Menu.IsEnabled(PugnaD.optionEnableGlimmer) then Ability.CastTarget(glimmer, myHero); return end

    if Ability.IsChannelling(Lifedrain) then return end

    local myMana = NPC.GetMana(myHero)
    local mousePos = Input.GetWorldCursorPos()
    local heroPos = Entity.GetAbsOrigin(hero)
    local heroAng = Entity.GetAbsRotation(hero)
    local heroMs = NPC.GetMoveSpeed(hero)
    local CP = Ability.GetCastPoint(Lifedrain)
    local myPos = Entity.GetAbsOrigin(myHero)
  --blink function
    local blink = NPC.GetItem(myHero, "item_blink", true)
    if Menu.IsEnabled(PugnaD.optionEnableBlink) and blink and Ability.IsCastable(blink, 0) and NPC.IsEntityInRange(hero, myHero, 1270) and not NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(NetherBlast)-10)  then Ability.CastPosition(blink, heroPos); return end
  --end
    if NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return true end

    if Menu.IsEnabled(PugnaD.optionEnableLorb) and NPC.HasModifier(hero, "modifier_item_lotus_orb_active") then return true end
    if Menu.IsEnabled(PugnaD.optionEnableBmail) and NPC.HasModifier(hero, "modifier_item_blade_mail_reflect") then return true end

    if Menu.IsEnabled(PugnaD.optionEnableLinkens1) and Lifedrain and Ability.IsCastable(Lifedrain, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Lifedrain) - 10) and NPC.IsLinkensProtected(hero) and not Ability.IsInAbilityPhase(Lifedrain) then Ability.CastTarget(Lifedrain, hero); return end
    if Menu.IsEnabled(PugnaD.optionEnableLinkens2) and Decrepify and Ability.IsCastable(Decrepify, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Decrepify) - 10) and NPC.IsLinkensProtected(hero) and not Ability.IsInAbilityPhase(Lifedrain) then Ability.CastTarget(Decrepify, hero); return end
    if Menu.IsEnabled(PugnaD.optionEnableLinkens3) and Fstaff and Ability.IsCastable(Fstaff, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Fstaff) - 10) and NPC.IsLinkensProtected(hero) and not Ability.IsInAbilityPhase(Lifedrain) then Ability.CastTarget(Fstaff, hero); return end
    if Menu.IsEnabled(PugnaD.optionEnableLinkens4) and Hstaff and Ability.IsCastable(Hstaff, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Hstaff) - 10) and NPC.IsLinkensProtected(hero) and not Ability.IsInAbilityPhase(Lifedrain) then Ability.CastTarget(Hstaff, hero); return end
    if Menu.IsEnabled(PugnaD.optionEnableLinkens5) and EUL and Ability.IsCastable(EUL, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(EUL) - 10) and NPC.IsLinkensProtected(hero) and not Ability.IsInAbilityPhase(Lifedrain) then Ability.CastTarget(EUL, hero); return end

    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableSring) and Sring and Ability.IsCastable(Sring, 0) then Ability.CastNoTarget(Sring); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableHex) and hex and Ability.IsCastable(hex, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(hex) - 10) then Ability.CastTarget(hex, hero); return end
    if Menu.IsEnabled(PugnaD.optionEnableNetherBlast) and NetherBlast and Ability.IsCastable(NetherBlast, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(NetherBlast) - 10) then Ability.CastPosition(NetherBlast, heroPos); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableDecrepify) and Decrepify and Ability.IsCastable(Decrepify, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Decrepify) - 10) then Ability.CastTarget(Decrepify, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableVeil) and veil and Ability.IsCastable(veil, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(veil) - 10) then Ability.CastPosition(veil, heroPos); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableEblade) and eblade and Ability.IsCastable(eblade, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(eblade) - 10) then Ability.CastTarget(eblade, hero); return end
       if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableRoA) and RoA and Ability.IsCastable(RoA, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(RoA) - 10) then Ability.CastTarget(RoA, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableBloth) and bloth and Ability.IsCastable(bloth, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(bloth) - 10) then Ability.CastTarget(bloth, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableOrchid) and orchid and Ability.IsCastable(orchid, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(orchid) - 10) then Ability.CastTarget(orchid, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableSguard) and Sguard and Ability.IsCastable(Sguard, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Sguard) - 10) then Ability.CastNoTarget(Sguard); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableDagon) and dagon and Ability.IsCastable(dagon, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(dagon) - 10) then  Ability.CastTarget(dagon, hero) return end
    if Menu.IsEnabled(PugnaD.optionEnableNWard) and NWard and Ability.IsCastable(NWard, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(NWard) + 400) then Ability.CastPosition(NWard, myPos); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableLifedrain) and Lifedrain and Ability.IsCastable(Lifedrain, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(Lifedrain) - 10) and not Ability.IsInAbilityPhase(Lifedrain) then Ability.CastTarget(Lifedrain, hero); return end
    if not NPC.IsLinkensProtected(hero) and Menu.IsEnabled(PugnaD.optionEnableRefresher) and refresh and Ability.IsCastable(refresh, myMana) then Ability.CastNoTarget(refresh); return end end



return PugnaD