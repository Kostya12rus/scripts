local SkillDistanse = {}
SkillDistanse.optionEnable = Menu.AddOption({"Kostya12rus","SkillDistanse"}, "Activate", "")
SkillDistanse.optionEnable1 = Menu.AddOption({"Kostya12rus","SkillDistanse"}, "Activate1", "")
SkillDistanse.optionEnable2 = Menu.AddOption({"Kostya12rus","SkillDistanse"}, "Activate2", "")
SkillDistanse.optionEnable3 = Menu.AddOption({"Kostya12rus","SkillDistanse"}, "Activate3", "")
SkillDistanse.optionEnable4 = Menu.AddOption({"Kostya12rus","SkillDistanse"}, "Activate4", "")
SkillDistanse.optionKey = Menu.AddKeyOption({"Kostya12rus","SkillDistanse"},"TestKey",Enum.ButtonCode.KEY_D)
SkillDistanse.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
SkillDistanse.FontSkill = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
function SkillDistanse.OnDraw()
	if not Menu.IsEnabled(SkillDistanse.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	local DrawX = 500
	local DrawY = 300
	local abilities = {}
    for i = 0, 24 do
        local ability = NPC.GetAbilityByIndex(myHero, i)
        if ability ~= nil and Entity.IsAbility(ability) and not Ability.IsAttributes(ability) then
            local DrawX = 500
			table.insert(abilities, ability)
			index_skill = Ability.GetIndex(ability)
			name_skill = Ability.GetName(ability)
			distanse_skill = Ability.GetCastRange(ability)
			Renderer.SetDrawColor(234, 255, 0, 255)
			Renderer.DrawText(SkillDistanse.Font, DrawX, DrawY, index_skill, 1)
			DrawX = DrawX + 100
			Renderer.DrawText(SkillDistanse.Font, DrawX, DrawY, distanse_skill, 1)
			DrawX = DrawX + 50
			Renderer.DrawText(SkillDistanse.Font, DrawX, DrawY, name_skill, 1)
			DrawY = DrawY + 20
        end
    end

end
return SkillDistanse