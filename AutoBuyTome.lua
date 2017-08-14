local AutoBuyTome = {}

AutoBuyTome.Enable = Menu.AddOption({ "Utility" }, "Auto Buy Tome of Knowledge", "Buy every 10 minuts Tome of Knowledge if you have 150 gold")

AutoBuyTome.Delay = 0
function AutoBuyTome.OnUpdate()
	if not Menu.IsEnabled(AutoBuyTome.Enable) then
		return
	end

	local myHero = Heroes.GetLocal()

	if not myHero then
		return
	end

	if (GameRules.GetGameTime() - GameRules.GetGameStartTime()) / 60 % 10 < 0.01 and GameRules.GetGameTime() > AutoBuyTome.Delay then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM, 257, Vector(0, 0, 0), 257, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, false, true)
		AutoBuyTome.Delay = GameRules.GetGameTime() + 0.2
	end
end

return AutoBuyTome