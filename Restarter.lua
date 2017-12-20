local Restarter = {}
Restarter.optionEnable = Menu.AddOption({"Kostya12rus","Restarter"}, "Включение скрипта", "")
Restarter.Key = Menu.AddKeyOption({"Kostya12rus","Restarter"}, "Крашнуть игру",Enum.ButtonCode.KEY_NONE)

function Restarter.OnUpdate()
	if not Menu.IsEnabled(Restarter.optionEnable) then return end
	if Menu.IsKeyDownOnce(Restarter.Key) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM, 82, Vector(0, 0, 0), 82, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
	end
end
return Restarter