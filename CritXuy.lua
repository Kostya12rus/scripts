local CritAttack = {}
CritAttack.optionEnable = Menu.AddOption({"Utility", "CritHack"}, "Activation", "")
CritAttack.key = Menu.AddKeyOption({"Utility","CritHack"},"Key for critattak only target",Enum.ButtonCode.BUTTON_CODE_NONE)

function CritAttack.OnUnitAnimation(animation)
	if not Menu.IsEnabled(CritAttack.optionEnable) then return end
	if not Menu.IsKeyDown(CritAttack.key) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if animation.unit == myHero then
		if animation.activity == 1505 then
			timer = GameRules.GetGameTime() + animation.castpoint
		elseif animation.activity == 1503 then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_STOP, myHero, Vector(0,0,0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
		end
	end
end

function CritAttack.OnPrepareUnitOrders(orders)
	if orders.order == 4 then
		target = orders.target
	else
		target = nil
	end
	return true
end

function CritAttack.OnUpdate()
	if not Menu.IsEnabled(CritAttack.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if Menu.IsKeyDown(CritAttack.key) then
		if target then
			if Entity.IsAlive(target) then
				if timer <= GameRules.GetGameTime() then
					if NPC.GetUnitName(Heroes.GetLocal()) == "npc_dota_hero_phantom_assassin" then
						if NPC.GetAttackTime(myHero)<0.29 then
							timer = GameRules.GetGameTime() + 0.14
						elseif NPC.GetAttackTime(myHero) < 0.35 then
							timer = GameRules.GetGameTime() + 0.15
						elseif NPC.GetAttackTime(myHero) < 0.54 then
							timer = GameRules.GetGameTime() + 0.17
						elseif NPC.GetAttackTime(myHero) < 0.71 then
							timer = GameRules.GetGameTime() + 0.20
						elseif NPC.GetAttackTime(myHero) < 0.86 then
							timer = GameRules.GetGameTime() + 0.24
						elseif NPC.GetAttackTime(myHero) < 1.08 then
							timer = GameRules.GetGameTime() + 0.27
						elseif NPC.GetAttackTime(myHero) < 1.24 then
							timer = GameRules.GetGameTime() + 0.3
						end
					elseif NPC.GetUnitName(Heroes.GetLocal()) == "npc_dota_hero_skeleton_king" then 
						if NPC.GetAttackTime(myHero) < 0.29 then
							timer = GameRules.GetGameTime() + 0.175
						elseif NPC.GetAttackTime(myHero) < 0.34 then
							timer = GameRules.GetGameTime() + 0.2
						elseif NPC.GetAttackTime(myHero) < 0.44 then
							timer = GameRules.GetGameTime() + 0.24
						elseif NPC.GetAttackTime(myHero) < 0.54 then
							timer = GameRules.GetGameTime() + 0.27
						elseif NPC.GetAttackTime(myHero) < 0.67 then
							timer = GameRules.GetGameTime() + 0.3
						elseif NPC.GetAttackTime(myHero) < 0.79 then
							timer = GameRules.GetGameTime() + 0.32
						elseif NPC.GetAttackTime(myHero) < 0.87 then
							timer = GameRules.GetGameTime() + 0.37
						elseif NPC.GetAttackTime(myHero) < 0.96 then
							timer = GameRules.GetGameTime() + 0.4
						elseif NPC.GetAttackTime(myHero) < 1.10 then
							timer = GameRules.GetGameTime() + 0.44
						elseif NPC.GetAttackTime(myHero) < 1.20 then
							timer = GameRules.GetGameTime() + 0.47
						elseif NPC.GetAttackTime(myHero) < 1.45 then
							timer = GameRules.GetGameTime() + 0.57
						end
					elseif NPC.GetUnitName(Heroes.GetLocal()) == "npc_dota_hero_juggernaut" then
						if NPC.GetAttackTime(myHero) < 0.27 then
							timer = GameRules.GetGameTime() + 0.14
						elseif NPC.GetAttackTime(myHero) < 0.39 then
							timer = GameRules.GetGameTime() + 0.17
						elseif NPC.GetAttackTime(myHero) < 0.48 then
							timer = GameRules.GetGameTime() + 0.20
						elseif NPC.GetAttackTime(myHero) < 0.69 then
							timer = GameRules.GetGameTime() + 0.24
						elseif NPC.GetAttackTime(myHero) < 0.85 then
							timer = GameRules.GetGameTime() + 0.27
						elseif NPC.GetAttackTime(myHero) < 0.97 then
							timer = GameRules.GetGameTime() + 0.30
						elseif NPC.GetAttackTime(myHero) < 1.12 then
							timer = GameRules.GetGameTime() + 0.34
						end
					elseif NPC.GetUnitName(Heroes.GetLocal()) == "npc_dota_hero_chaos_knight" then
						if NPC.GetAttackTime(myHero) < 0.33 then
							timer = GameRules.GetGameTime() + 0.17
						elseif NPC.GetAttackTime(myHero) < 0.38 then
							timer = GameRules.GetGameTime() + 0.2
						elseif NPC.GetAttackTime(myHero) < 0.42 then
							timer = GameRules.GetGameTime() + 0.21
						elseif NPC.GetAttackTime(myHero) < 0.48 then
							timer = GameRules.GetGameTime() + 0.24
						elseif NPC.GetAttackTime(myHero) < 0.67 then
							timer = GameRules.GetGameTime() + 0.27
						elseif NPC.GetAttackTime(myHero) < 0.79 then
							timer = GameRules.GetGameTime() + 0.31
						elseif NPC.GetAttackTime(myHero) < 0.87 then
							timer = GameRules.GetGameTime() + 0.35
						elseif NPC.GetAttackTime(myHero) < 0.96 then
							timer = GameRules.GetGameTime() + 0.37
						elseif NPC.GetAttackTime(myHero) < 1.10 then
							timer = GameRules.GetGameTime() + 0.41
						elseif NPC.GetAttackTime(myHero) < 1.28 then
							timer = GameRules.GetGameTime() + 0.44
						elseif NPC.GetAttackTime(myHero) < 1.5 then
							timer = GameRules.GetGameTime() + 0.54
						end
					elseif NPC.GetUnitName(Heroes.GetLocal()) == "npc_dota_hero_brewmaster" then  
						if NPC.GetAttackTime(myHero) < 0.33 then
							timer = GameRules.GetGameTime() + 0.14
						elseif NPC.GetAttackTime(myHero) < 0.47 then
							timer = GameRules.GetGameTime() + 0.17
						elseif NPC.GetAttackTime(myHero) < 0.65 then
							timer = GameRules.GetGameTime() + 0.20
						elseif NPC.GetAttackTime(myHero) < 0.78 then
							timer = GameRules.GetGameTime() + 0.25
						elseif NPC.GetAttackTime(myHero) < 0.94 then
							timer = GameRules.GetGameTime() + 0.28
						elseif NPC.GetAttackTime(myHero) < 1.21 then
							timer = GameRules.GetGameTime() + 0.30
						elseif NPC.GetAttackTime(myHero) < 1.4 then
							timer = GameRules.GetGameTime() + 0.37
						end
					end
					Player.AttackTarget(Players.GetLocal(),myHero,target)
				end
			end
		end
	end
end

function CritAttack.init()
	target = nil
	timer = 0
end
function CritAttack.OnGameStart()
	CritAttack.init()
end
function CritAttack.OnGameEnd()
	CritAttack.init()
end
CritAttack.init()

return CritAttack