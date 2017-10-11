local Spinner = {}
Spinner.optionEnable = Menu.AddOption({"Kostya12rus","Waltz"}, "Activate", "")
Spinner.optionKey = Menu.AddKeyOption({"Kostya12rus","Waltz"},"Key for waltz",Enum.ButtonCode.KEY_D)
Spinner.typemove = Menu.AddOption({"Kostya12rus","Waltz"}, "Movement Type", "", 0, 1, 1)

Menu.SetValueName(Spinner.typemove, 0, 'One place')
Menu.SetValueName(Spinner.typemove, 1, 'Сircle')

function Spinner.OnUpdate()
  if not Menu.IsEnabled(Spinner.optionEnable) then return end
  local myHero = Heroes.GetLocal()
  if not myHero then return end   
  if Menu.IsKeyDown(Spinner.optionKey) then
    if Menu.GetValue(Spinner.typemove) == 0 then
	  local degree = 160  -- угол поворота персонажа       можно менять   
	  local timign = 0.05 -- повторно задать угол поворота можно менять
      if tick <= GameRules.GetGameTime() then
        Spinner.NeedMove(myHero , Spinner.PositionAngle(myHero,degree,1))
        tick = GameRules.GetGameTime() + timign
      end
    end
    if Menu.GetValue(Spinner.typemove) == 1 then
	  local degree = 100  -- угол поворота персонажа       можно менять   
	  local timign = 0.05 -- повторно задать угол поворота можно менять 
      if tick <= GameRules.GetGameTime() then
        Spinner.NeedMove(myHero , Spinner.PositionAngle(myHero,degree,40))
        tick = GameRules.GetGameTime() + timign
      end
    end
  end
end

function Spinner.PositionAngle(nps,rotation,range)
  local angle = Entity.GetRotation(nps)
  local angleOffset = Angle(0, 45+rotation, 0)
  angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
  local x,y,z = angle:GetVectors()
  local direction = x + y + z
  direction:SetZ(0)
  direction:Normalize()
  direction:Scale(range)
  local origin = NPC.GetAbsOrigin(nps)
  NeedPos = origin + direction
  return NeedPos
end

function Spinner.NeedMove(npc,vectore)
  Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, npc, vectore, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
end

local tick = 0
function Spinner.OnGameStart()
  local tick = 0
end
function Spinner.OnGameEnd()
  local tick = 0
end
return Spinner