local earthShakerHelper = {}

earthShakerHelper.optionEnable = Menu.AddOption({"Utility", "EarthShaker Ultimate"}, "Enabled","on/off")
earthShakerHelper.optionKey = Menu.AddKeyOption({ "Utility","EarthShaker Ultimate"}, "Key to check damage", Enum.ButtonCode.KEY_T)
earthShakerHelper.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

earthShakerHelper.afterShock = {}
earthShakerHelper.afterShock[1] = 50
earthShakerHelper.afterShock[2] = 75
earthShakerHelper.afterShock[3] = 100
earthShakerHelper.afterShock[4] = 125

earthShakerHelper.echoSlam = {}
earthShakerHelper.echoSlam[1] = 160
earthShakerHelper.echoSlam[2] = 210
earthShakerHelper.echoSlam[3] = 270

earthShakerHelper.damageAfterShock = {0}
earthShakerHelper.damageEchoSlam = {0}
earthShakerHelper.damageEcho = {0}
earthShakerHelper.damage = {0}

local targetEcho = 0

function earthShakerHelper.OnDraw()
	if not Menu.IsEnabled(earthShakerHelper.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_earthshaker" then return end
	
	if not Menu.IsKeyDown(earthShakerHelper.optionKey) then return end
	
	local skillAfterShock = NPC.GetAbilityByIndex(myHero, 2)
	local skillEchoSlam = NPC.GetAbilityByIndex(myHero, 3)
	
	local rangeAfterShock = Ability.GetLevelSpecialValueFor(skillAfterShock, "aftershock_range")
	local rangeEchoslam = Ability.GetLevelSpecialValueFor(skillEchoSlam, "echo_slam_damage_range")
	local rangeEcho = Ability.GetLevelSpecialValueFor(skillEchoSlam, "echo_slam_echo_search_range")
	
	
	local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	
	Log.Write(rangeAfterShock)
	local unitsDpsAfterShock = NPC.GetUnitsInRadius(enemy, rangeAfterShock, Enum.TeamType.TEAM_FRIEND)
	local unitsDpsEchoSlam = NPC.GetUnitsInRadius(enemy, rangeEchoslam, Enum.TeamType.TEAM_FRIEND)
	local unitsDpsEcho = NPC.GetUnitsInRadius(enemy, rangeEcho, Enum.TeamType.TEAM_FRIEND)
	
	
	
	if skillEchoSlam ~= nil then
		
		local index_target = Entity.GetIndex(enemy)
		for key,value in ipairs(unitsDpsEcho) do
			local index = Entity.GetIndex(value)
			earthShakerHelper.damageEcho[index] = Ability.GetLevelSpecialValueFor(skillEchoSlam, "echo_slam_echo_damage") + Ability.GetLevelSpecialValueFor(skillEchoSlam, "echo_slam_echo_damage") * #unitsDpsEcho
			earthShakerHelper.damage[index] = earthShakerHelper.damageEcho[index]
		end
		earthShakerHelper.damageEcho[index_target] = Ability.GetLevelSpecialValueFor(skillEchoSlam, "echo_slam_echo_damage") + Ability.GetLevelSpecialValueFor(skillEchoSlam, "echo_slam_echo_damage") * #unitsDpsEcho
		earthShakerHelper.damage[index_target] = earthShakerHelper.damageEcho[index_target]
		if skillAfterShock ~= nil then
			for key,value in ipairs(unitsDpsAfterShock) do
				local index = Entity.GetIndex(value)
				earthShakerHelper.damageAfterShock[index] = earthShakerHelper.afterShock[Ability.GetLevel(skillAfterShock)]
				earthShakerHelper.damage[index] = earthShakerHelper.damage[index] + earthShakerHelper.damageAfterShock[index]
			end
		end
		earthShakerHelper.damageAfterShock[index_target] = earthShakerHelper.afterShock[Ability.GetLevel(skillAfterShock)]
		earthShakerHelper.damage[index_target] = earthShakerHelper.damage[index_target] + earthShakerHelper.damageAfterShock[index_target]
		for key,value in ipairs(unitsDpsEchoSlam) do
			local index = Entity.GetIndex(value)
			earthShakerHelper.damageEchoSlam[index] = earthShakerHelper.echoSlam[Ability.GetLevel(skillEchoSlam)]
			earthShakerHelper.damage[index] = earthShakerHelper.damage[index] + earthShakerHelper.damageEchoSlam[index]
			
			local pos = Entity.GetAbsOrigin(value)
			local x, y, visible = Renderer.WorldToScreen(pos)
			
			--local damage = earthShakerHelper.damageAfterShock[index] + earthShakerHelper.damageEchoSlam[index] + earthShakerHelper.damageEcho[index]
			if Entity.IsHero(value) and visible then
				if earthShakerHelper.damage[index] - earthShakerHelper.damage[index] * NPC.GetMagicalArmorValue(enemy) <= Entity.GetHealth(value)*0.35 then
					Renderer.SetDrawColor(35, 255, 35, 255) 
				elseif earthShakerHelper.damage[index] - earthShakerHelper.damage[index] * NPC.GetMagicalArmorValue(enemy) <= Entity.GetHealth(value) then
					Renderer.SetDrawColor(255, 255, 35, 255) 
				else
					Renderer.SetDrawColor(255, 35, 35, 255) 
				end
				Renderer.DrawTextCentered(earthShakerHelper.font, x, y, math.ceil(earthShakerHelper.damage[index] - earthShakerHelper.damage[index] * NPC.GetMagicalArmorValue(value)), 255)
			end
		end
		local pos = Entity.GetAbsOrigin(enemy)
		local x, y, visible = Renderer.WorldToScreen(pos)
		earthShakerHelper.damageEchoSlam[index_target] = earthShakerHelper.echoSlam[Ability.GetLevel(skillEchoSlam)]
		earthShakerHelper.damage[index_target] = earthShakerHelper.damage[index_target] + earthShakerHelper.damageEchoSlam[index_target]
		Renderer.SetDrawColor(35, 255, 35, 255)
		Renderer.DrawTextCentered(earthShakerHelper.font, x, y, math.ceil(earthShakerHelper.damage[index_target] - earthShakerHelper.damage[index_target] * NPC.GetMagicalArmorValue(enemy)), 255)
	end
	
end

return earthShakerHelper