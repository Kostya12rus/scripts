local MovePosition = {}
MovePosition.optionEnable = Menu.AddOption({"Kostya12rus","Waltz"}, "Activate", "")
MovePosition.optionKey = Menu.AddKeyOption({"Kostya12rus","Waltz"},"Key for waltz",Enum.ButtonCode.KEY_D)
local tick = 0

function MovePosition.OnGameStart()
  local tick = 0
end

function MovePosition.OnUpdate()
  if not Menu.IsEnabled(MovePosition.optionEnable) then return end
  local myHero = Heroes.GetLocal()
  if not myHero then return end 
  local degree = 160  -- угол поворота персонажа       можно менять   
  local timign = 0.15 -- повторно задать угол поворота можно менять   
  if Menu.IsKeyDown(MovePosition.optionKey) then
    if tick <= GameRules.GetGameTime() then
      local angle = Entity.GetRotation(myHero)
      local angleOffset = Angle(0, 45+degree, 0)
      angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
      local x,y,z = angle:GetVectors()
      local direction = x + y + z
      direction:SetZ(0)
      direction:Normalize()
      direction:Scale(1)
      local origin = NPC.GetAbsOrigin(myHero)
      tohere = origin + direction
      MovePosition.NeedMove(myHero , tohere)
      tick = GameRules.GetGameTime() + timign
    end
  end
end

function MovePosition.NeedMove(npc , vectore)
  Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, npc, vectore, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
end

return MovePosition