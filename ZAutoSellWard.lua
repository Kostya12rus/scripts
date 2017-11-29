local AutoSellWard = {}
AutoSellWard.optionEnable = Menu.AddOption({"Kostya12rus","AutoSellWard"}, "Activate", "")
AutoSellWard.optionKey = Menu.AddKeyOption({"Kostya12rus","AutoSellWard"}, "TestKey",Enum.ButtonCode.KEY_D)
AutoSellWard.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

function AutoSellWard.init()
	trigerTime = 0
end
function AutoSellWard.OnGameStart()
	AutoSellWard.init()
end
function AutoSellWard.OnGameEnd()
	AutoSellWard.init()
end
AutoSellWard.init()

function AutoSellWard.OnDraw()
	if not Menu.IsEnabled(AutoSellWard.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	if GameRules.GetGameTime() <= trigerTime then return end
	if not Entity.IsAlive(myHero) then return end
	ItemPanel = {"item_ward_dispenser","item_ward_dispenser_sentry","item_ward_sentry","item_ward_observer"}
	haweitem = false
	for index_item = 0, 15 do
		for items = 1, #ItemPanel do
			local item = NPC.GetItemByIndex(myHero, index_item)
			if item and Entity.IsAbility(item) then
			local itemName = Ability.GetName(item)
				if ItemPanel[items] == itemName then
					AutoSellWard.SellWard(item)
					haweitem = true
				end
			end
		end
	end
	if not haweitem then
		AutoSellWard.BuyWard(42)
		AutoSellWard.BuyWard(43)
		trigerTime = GameRules.GetGameTime() + 0.1
	end
end

function AutoSellWard.SellWard(item)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_SELL_ITEM, item, Vector(0, 0, 0), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
end

function AutoSellWard.BuyWard(item)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM, item, Vector(0, 0, 0), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
end

return AutoSellWard