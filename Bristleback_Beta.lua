--Author: Neil Tyson
local Bristleback = {}

Bristleback.optionEnable = Menu.AddOption({ "Hero Specific", "Bristleback. Script By Neil Tyson"}, "Enabled", "Script by Neil Tyson")
Bristleback.optionGoo = Menu.AddOption({ "Hero Specific", "Bristleback. Script By Neil Tyson"}, "Auto Nasal Good", "")
Bristleback.optionQuill = Menu.AddOption({ "Hero Specific", "Bristleback. Script By Neil Tyson"}, "Auto Quill", "")
Bristleback.optionKey = Menu.AddKeyOption({ "Hero Specific", "Bristleback. Script By Neil Tyson"}, "Key", Enum.ButtonCode.KEY_F)
Bristleback.optionVersion = Menu.AddOption({ "Hero Specific","Bristleback. Script By Neil Tyson" }, "Version", "Author: Neil Tyson", 1, 1, 1)

Bristleback.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

-- More options to be added later when suggested

function Bristleback.OnUpdate()
	if not Menu.IsEnabled(Bristleback.optionEnable) then return end
		if Menu.IsKeyDown(Bristleback.optionKey) then
			Bristleback.Combo()
	end
end

function Bristleback.Combo()

	local myHero = Heroes.GetLocal()

	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_bristleback" then return end

	local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)

	local heroPos = Entity.GetAbsOrigin(hero)
	local goo = NPC.GetAbilityByIndex(myHero, 0)
	local quill = NPC.GetAbilityByIndex(myHero, 1)

	local myMana = NPC.GetMana(myHero)
	local mousePos = Input.GetWorldCursorPos()

	--Nasal Goo
	if Ability.IsCastable(goo, myMana) and Menu.IsEnabled(Bristleback.optionGoo) and not NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and hero and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(goo)) and Menu.IsKeyDown(Bristleback.optionKey) then Ability.CastNoTarget(goo) MakeDelay(0.5) return end

	--Quill
	if Ability.IsCastable(quill, myMana) and Menu.IsEnabled(Bristleback.optionQuill) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(quill)) and Menu.IsKeyDown(Bristleback.optionKey) then Ability.CastNoTarget(quill) return end

end

function MakeDelay(sec)
	delay = sec
	time = os.clock()
end

return Bristleback

