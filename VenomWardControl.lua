local VenomWardControl = {}
VenomWardControl.optionEnable = Menu.AddOption({"Utility", "Venomanser Ward Control"}, "Script On/Off", "")
--VenomWardControl.FarmMod = Menu.AddOption({"Kostya12rus", "Venomanser Ward Control"}, "Farm Mod", "")
--VenomWardControl.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function VenomWardControl.OnUpdate()
	if not Menu.IsEnabled(VenomWardControl.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	VenomWardControl.FindMyWard()
	if wardtable then
		VenomWardControl.ClearTable()
		for _,ward in pairs(wardtable) do
			if ward and ward.attacktime <= GameRules.GetGameTime() then
				if VenomWardControl.FindEnemy(ward.npc) then
					local creepfarm = VenomWardControl.FindCreepFarm(ward.npc)
					local heroforatackk = VenomWardControl.FindHero(ward.npc)
					local heroforpoison = VenomWardControl.FindHeroForPoisoning(ward.npc)
					if creepfarm then
						Player.AttackTarget(Players.GetLocal(),ward.npc,creepfarm)
						ward.attacktime = GameRules.GetGameTime() + 1.5
					elseif heroforpoison then --and not Menu.IsEnabled(VenomWardControl.FarmMod) then
						Player.AttackTarget(Players.GetLocal(),ward.npc,heroforpoison)
						ward.attacktime = GameRules.GetGameTime() + 1.5
					elseif heroforatackk then --and not Menu.IsEnabled(VenomWardControl.FarmMod) then
						Player.AttackTarget(Players.GetLocal(),ward.npc,heroforatackk)
						ward.attacktime = GameRules.GetGameTime() + 1.5
					-- elseif Menu.IsEnabled(VenomWardControl.FarmMod) and not creepfarm then
						-- Player.PrepareUnitOrders(Players.GetLocal(),Enum.UnitOrder.DOTA_UNIT_ORDER_STOP,nil,Vector(0,0,0),nil,Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,ward.npc)
						-- ward.attacktime = GameRules.GetGameTime() + 1
					end
				end
			end
		end
	end
end

function VenomWardControl.FindEnemy(ward)
	if ward then
		for _,npc in pairs(NPCs.GetAll()) do
			if npc and Entity.IsNPC(npc) then
				if NPC.IsKillable(npc) and not NPC.IsIllusion(npc) and Entity.IsAlive(npc) and not Entity.IsSameTeam(ward,npc) then
					if NPC.IsEntityInRange(ward,npc,NPC.GetAttackRange(ward)-25) then
						return true
					end
				end
			end
		end
	end
	return false
end

function VenomWardControl.ClearTable()
	if wardtable then
		for i,tableward in pairs(wardtable) do
			if tableward then
				if not Entity.IsAlive(tableward.npc) then
					wardtable[i] = nil
				end
			end
		end
	end
	return
end

function VenomWardControl.FindMyWard()
	for _,npc in pairs(NPCs.GetAll()) do
		if npc then
			for _,nameward in pairs(wardname) do
				if Entity.OwnedBy(npc,Heroes.GetLocal()) and NPC.GetUnitName(npc) == nameward then
					if not VenomWardControl.IsInTable(npc) then
						table.insert(wardtable,{npc = npc,attacktime = GameRules.GetGameTime()})
					end
				end
			end
		end
	end
end

function VenomWardControl.IsInTable(checknpc)
	if wardtable then
		for _,ward in pairs(wardtable) do
			if ward and ward.npc == checknpc then
				return true
			end
		end
		return false
	end
end

function VenomWardControl.FindCreepFarm(ward)
	local target = nil
	for _,npc in pairs(NPCs.GetAll()) do
		if npc then
			if NPC.IsEntityInRange(ward,npc,NPC.GetAttackRange(ward)-25) and not Entity.IsSameTeam(ward,npc) and Entity.IsAlive(npc) then
				local damage_to_creep = ((NPC.GetTrueDamage(ward)+NPC.GetTrueMaximumDamage(ward))/2)-NPC.GetPhysicalDamageReduction(npc)*((NPC.GetTrueDamage(ward)+NPC.GetTrueMaximumDamage(ward))/2)
				if Entity.GetHealth(npc) < damage_to_creep then
					return npc
				end
			end
		end
	end
	return target
end

function VenomWardControl.FindHeroForPoisoning(ward)
	local heroes = Heroes.InRadius(Entity.GetAbsOrigin(ward),NPC.GetAttackRange(ward)-25,Entity.GetTeamNum(ward),Enum.TeamType.TEAM_ENEMY)
	for _,hero in pairs(heroes) do
		if hero and not NPC.IsIllusion(hero) and not Entity.IsDormant(hero) and Entity.IsAlive(hero) then
			local mod
			if NPC.HasModifier(hero,"modifier_venomancer_poison_sting_ward") then
				mod = NPC.GetModifier(hero,"modifier_venomancer_poison_sting_ward")
			end
			if ((mod and (Modifier.GetDieTime(mod)-GameRules.GetGameTime()) <= 3) or not mod) then
				return hero
			end
		end
	end
	return nil
end

function VenomWardControl.FindHero(ward)
	local heroes = Heroes.InRadius(Entity.GetAbsOrigin(ward),NPC.GetAttackRange(ward)-25,Entity.GetTeamNum(ward),Enum.TeamType.TEAM_ENEMY)
	for _,hero in pairs(heroes) do
		if hero and not NPC.IsIllusion(hero) and not Entity.IsDormant(hero) and Entity.IsAlive(hero) then
			return hero
		end
	end
	return nil
end

function VenomWardControl.init()
	wardname = {"npc_dota_venomancer_plague_ward_1","npc_dota_venomancer_plague_ward_2","npc_dota_venomancer_plague_ward_3","npc_dota_venomancer_plague_ward_4"}
	wardtable = {}
end

function VenomWardControl.OnGameStart()
	VenomWardControl.init()
end

function VenomWardControl.OnGameEnd()
	VenomWardControl.init()
end
VenomWardControl.init()

return VenomWardControl