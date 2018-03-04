local CritAttackPetri = {}
CritAttackPetri.optionEnable = Menu.AddOption({"Kostya12rus", "AutoCritP"}, "Activation", "")
CritAttackPetri.key = Menu.AddKeyOption({"Kostya12rus","AutoCritP"},"Key for critattak only target",Enum.ButtonCode.BUTTON_CODE_NONE)
CritAttackPetri.font = Renderer.LoadFont("Tahoma", 50, Enum.FontWeight.EXTRABOLD)

function CritAttackPetri.OnDraw()
	if not Menu.IsEnabled(CritAttackPetri.optionEnable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
end

function CritAttackPetri.OnParticleCreate(particle)
	if not Menu.IsEnabled(CritAttackPetri.optionEnable) then return end
	if not Menu.IsKeyDown(CritAttackPetri.key) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if particle.entity == myHero and particle.particleNameIndex == 3250460079235145121 then
		partikle = true
	end
end

function CritAttackPetri.OnUnitAnimation(animation)
	if not Menu.IsEnabled(CritAttackPetri.optionEnable) then return end
	if not Menu.IsKeyDown(CritAttackPetri.key) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if animation.unit == myHero then
		if animation.activity == 1503 then
			if partikle then
				attackcrit = true
			else
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_STOP, myHero, Vector(0,0,0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
			end
		end
	end
end

function CritAttackPetri.OnUpdate()
	if not Menu.IsEnabled(CritAttackPetri.optionEnable) then return end
	if GameRules.GetGameMode() ~= 15 then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if Menu.IsKeyDown(CritAttackPetri.key) then
		target = Input.GetNearestUnitToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
		if target and Entity.IsAlive(target) then
			if partikle and attackcrit then
				attackcrit = false
				partikle = false
			else
				Player.AttackTarget(Players.GetLocal(),myHero,target)
			end
		end
	end
end

function CritAttackPetri.init()
	attackcrit = false
	partikle = false
	target = nil
	timer = 0
end
function CritAttackPetri.OnGameStart()
	CritAttackPetri.init()
end
function CritAttackPetri.OnGameEnd()
	CritAttackPetri.init()
end
CritAttackPetri.init()

return CritAttackPetri