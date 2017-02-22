local stormCalculateUltimate = {}

stormCalculateUltimate.optionEnable = Menu.AddOption({"Hero Specific", "Storm Spirit"}, "Enabled","on/off")
stormCalculateUltimate.optionDrawingX = Menu.AddOption({"Hero Specific", "Storm Spirit", "Drawing"}, "X = ","X coord", 1, 100, 1)
stormCalculateUltimate.optionDrawingY = Menu.AddOption({"Hero Specific", "Storm Spirit", "Drawing"}, "Y = ","Y coord", 1, 100, 1)
stormCalculateUltimate.fontItem = Renderer.LoadFont("Arial", 15, Enum.FontWeight.EXTRABOLD)

stormCalculateUltimate.Ultimate = {}
stormCalculateUltimate.Ultimate[0] = 1
stormCalculateUltimate.Ultimate[1] = 8
stormCalculateUltimate.Ultimate[2] = 12
stormCalculateUltimate.Ultimate[3] = 16

function stormCalculateUltimate.OnDraw()
	if not Menu.IsEnabled(stormCalculateUltimate.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_storm_spirit" then return end
	local myMana = NPC.GetMana(myHero)
	
	local ultimate = NPC.GetAbilityByIndex(myHero, 3)
	if ultimate ~= nil and Ability.GetLevel(ultimate) > 0 then
		local my_pos = NPC.GetAbsOrigin(myHero)
		local mouse_pos = Input.GetWorldCursorPos()
		local ultimate_pos =  mouse_pos - my_pos
		local w, h = Renderer.GetScreenSize()
		local x = Menu.GetValue(stormCalculateUltimate.optionDrawingX) / 100
		local y = Menu.GetValue(stormCalculateUltimate.optionDrawingY) / 100
		local outsizeWidth = 140
		local insizeWidth = 131
		local manaStartUltimatePerc = Ability.GetLevelSpecialValueForFloat(ultimate, "ball_lightning_initial_mana_percentage")
		local manaStartUltimateConst = Ability.GetLevelSpecialValueForFloat(ultimate, "ball_lightning_initial_mana_base")
		local speedUltimate = Ability.GetLevelSpecialValueForFloat(ultimate, "ball_lightning_move_speed")
		local manaForUnits = NPC.GetMaxMana(myHero) * 0.007 + 12
		local manaStartUltimate = manaStartUltimateConst + (manaStartUltimatePerc / 100) * NPC.GetMaxMana(myHero)
		local loss_mana = NPC.GetMana(myHero) - (ultimate_pos:Length() / 100) * manaForUnits - manaStartUltimate
		local time_ultimate_to_point = math.ceil((ultimate_pos:Length() / speedUltimate * 100)) / 100
		local damage = (math.floor((ultimate_pos:Length() / 100))-1) * stormCalculateUltimate.Ultimate[Ability.GetLevel(ultimate)]	
		Renderer.SetDrawColor(0, 0, 0, 170 )
		Renderer.DrawFilledRect(math.ceil(w*x-outsizeWidth/2), math.ceil(h*y), outsizeWidth, 50)	
		Renderer.SetDrawColor(57, 57, 57, 170)
		Renderer.DrawFilledRect(math.ceil(w*x-insizeWidth/2), math.ceil(h*y+3), insizeWidth, 44)
		Renderer.SetDrawColor(255, 255, 255, 255)
		if loss_mana < 0 then
			Renderer.SetDrawColor(255, 11, 11, 255)
		end
		Renderer.DrawTextCentered(stormCalculateUltimate.fontItem, math.ceil(w*x), math.ceil(h*y+15),"mana: " .. math.ceil(loss_mana), 255)
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawTextCentered(stormCalculateUltimate.fontItem, math.ceil(w*x), math.ceil(h*y+25),"time: " .. time_ultimate_to_point, 255)
		Renderer.DrawTextCentered(stormCalculateUltimate.fontItem, math.ceil(w*x), math.ceil(h*y+35),"damage: " .. math.ceil(damage), 255)	
	end
	
end
return stormCalculateUltimate
