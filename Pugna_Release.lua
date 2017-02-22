--Author: Neil Tyson
--Version: 1
--Last Updated: 2-5-17
local PugnaIsOP = {}

PugnaIsOP.optionEnable = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Enabled", "Script by Neil Tyson")
PugnaIsOP.optionNetherBlast = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Netherblast", "")
PugnaIsOP.optionDecrepify = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Decrepify", "")
PugnaIsOP.optionLifedrain = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Lifedrain", "")
PugnaIsOP.optionVeil = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Veil of Discord", "")
PugnaIsOP.optionEblade = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Ethereal Blade", "")
PugnaIsOP.optionDagon = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Dagon", "")
PugnaIsOP.optionAtos = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Atos", "")
PugnaIsOP.optionHex = Menu.AddOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Auto Hex", "")
PugnaIsOP.optionDMG = Menu.AddOption ({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Damage Calculator", "")
PugnaIsOP.optionKey = Menu.AddKeyOption({ "Hero Specific", "Pugna. Script By Neil Tyson"}, "Key", Enum.ButtonCode.KEY_F)

PugnaIsOP.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

-- More options to be added later when suggested

function PugnaIsOP.OnUpdate()
	if not Menu.IsEnabled(PugnaIsOP.optionEnable) then return end
		if Menu.IsKeyDown(PugnaIsOP.optionKey) then
			PugnaIsOP.Combo()
	end
end

function PugnaIsOP.OnDraw()
    if not Menu.IsEnabled(PugnaIsOP.optionDMG) then return true end
	
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_pugna" then return end
	local totaldmg = 0
	local xfactor = 1;

	local ethereal = NPC.GetItem(myHero, "item_ethereal_blade", true)
	if ethereal and Menu.IsEnabled(PugnaIsOP.optionEblade) then xfactor = xfactor + 0.4 totaldmg = totaldmg + 75 + (Hero.GetIntellectTotal(myHero) * 2) end

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	if veil and Menu.IsEnabled(PugnaIsOP.optionVeil) then xfactor = xfactor + 0.25 end

	for i = 0, 5 do
		local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
		if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
        if dagon and Menu.IsEnabled(PugnaIsOP.optionDagon) then
			totaldmg = totaldmg + ( Ability.GetLevelSpecialValueFor(dagon, "damage") * xfactor)
		end
    end	
	
	local netherblast = NPC.GetAbilityByIndex(myHero, 0)
    local lifedrain = NPC.GetAbilityByIndex(myHero, 3)
   
	if Ability.GetLevel(netherblast) > 0 then totaldmg = totaldmg + Ability.GetLevelSpecialValueFor(netherblast, "nether_blast_damage") end
	if Ability.GetLevel(lifedrain) > 0 then totaldmg = totaldmg + (Ability.GetLevelSpecialValueFor(lifedrain, "life_drain_damage") * xfactor) end
   

	Renderer.SetDrawColor(0, 0, 0, 255)
	Renderer.DrawFilledRect(0, 180, 200, 40)
	
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(PugnaIsOP.font, 10, 190, "total damage~: " .. math.floor(totaldmg), 1)
end

function PugnaIsOP.Combo()

	local myHero = Heroes.GetLocal()

	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_pugna" then return end

	local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)

	local heroPos = Entity.GetAbsOrigin(hero)
	local netherblast = NPC.GetAbilityByIndex(myHero, 0)
	local decrepify = NPC.GetAbilityByIndex(myHero, 1)
	local netherward = NPC.GetAbilityByIndex(myHero, 2)
	local lifedrain = NPC.GetAbilityByIndex(myHero, 3)
	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local eblade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local hex = NPC.GetItem(myHero, "item_sheepstick", true)

	if Ability.IsInAbilityPhase(lifedrain) then return end
    if Ability.IsChannelling(lifedrain) then return end

	local myMana = NPC.GetMana(myHero)
	local mousePos = Input.GetWorldCursorPos()

	--Veil of Discord
	if veil and Ability.IsCastable(veil, myMana) and Menu.IsEnabled(PugnaIsOP.optionVeil) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(veil)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastPosition(veil, NPC.GetAbsOrigin(hero)) return end

	--Sheep Stick
	if hex and Ability.IsCastable(hex, myMana) and Menu.IsEnabled(PugnaIsOP.optionHex) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(hex)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastTarget(hex, hero) return end

	--Decrepify
	if Ability.IsCastable(decrepify, myMana) and Menu.IsEnabled(PugnaIsOP.optionDecrepify) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(decrepify)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastTarget(decrepify, hero) return end

	--Ethereal Blade
	if eblade and Ability.IsCastable(eblade, myMana) and Menu.IsEnabled(PugnaIsOP.optionEblade) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(eblade)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastTarget(eblade, hero) return end
	
	--Dagon
	for i = 0, 5 do
        local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
		if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
	if dagon and Ability.IsCastable(dagon, myMana) and Menu.IsEnabled(PugnaIsOP.optionDagon) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(dagon)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastTarget(dagon, hero) return end
	end
	--Nether Blast
	if Ability.IsCastable(netherblast, myMana) and Menu.IsEnabled(PugnaIsOP.optionNetherBlast) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(netherblast)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastPosition(netherblast, NPC.GetAbsOrigin(hero)) return end

	--Atos
	if atos and Ability.IsCastable(atos, myMana) and Menu.IsEnabled(PugnaIsOP.optionAtos) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(atos)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastTarget(atos, hero) return end

	--Life Drain
	if Ability.IsCastable(lifedrain, myMana) and Menu.IsEnabled(PugnaIsOP.optionLifedrain) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(lifedrain)) and Menu.IsKeyDown(PugnaIsOP.optionKey) then Ability.CastTarget(lifedrain, hero) return end

end

function MakeDelay(sec)
	delay = sec
	time = os.clock()
end

return PugnaIsOP

