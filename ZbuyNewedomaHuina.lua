local TopbuyKek = {}
TopbuyKek.optionEnable = Menu.AddOption({"Kostya12rus","ItemManeger"}, "Activate", "")
TopbuyKek.optionKey = Menu.AddKeyOption({"Kostya12rus","ItemManeger"},"Key for buy",Enum.ButtonCode.KEY_D)
trigerTimes = 0

function TopbuyKek.OnGameStart()
trigerTimes = 0
end

function TopbuyKek.OnDraw()
	if not Menu.IsEnabled(TopbuyKek.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	if Menu.IsKeyDownOnce(TopbuyKek.optionKey) then
		if GameRules.GetGameTime() >= trigerTimes then
			for i = 20,30 do
				itemid = 1000 + i
				TopbuyKek.BuyWard(itemid)
				trigerTimes = GameRules.GetGameTime() + 0.2
			end
		end
	end
end

function TopbuyKek.BuyWard(item)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM, item, Vector(0, 0, 0), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
end

return TopbuyKek