local sadafaf = {}
sadafaf.optionEnable = Menu.AddOption({"Kostya12rus","ItemManeger"}, "Activate", "")
sadafaf.font = Renderer.LoadFont("Tahoma", 30, Enum.FontWeight.EXTRABOLD)
trigerTime = 0
tick = 0
function sadafaf.OnGameStart()
trigerTime = 0
tick = 0
end
function sadafaf.OnDraw()
	if not Menu.IsEnabled(sadafaf.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	Renderer.DrawTextCentered(sadafaf.font, 200, 300, tick, 1)
	if GameRules.GetGameTime() >= trigerTime then
		if tick < 10000 then
			sadafaf.BuyWard(tick)
			for index_item = 0, 15 do
				local item = NPC.GetItemByIndex(myHero, index_item)
				if item and Entity.IsAbility(item) then
					local itemName = Ability.GetName(item)
					Log.Write(tick .. " - ".. itemName)
					if not Item.IsSellable(item) then
						sadafaf.DropItem(item)
					else
						sadafaf.SellWard(item)
					end
					trigerTime = GameRules.GetGameTime() + 0.2
				end
			end
			tick = tick + 1
			if tick == 10000 then
				Log.Write("Все предметы купленны")
			end
		end
	end
end
function sadafaf.DropItem(item)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_DROP_ITEM, item, Entity.GetAbsOrigin(Heroes.GetLocal()), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
end

function sadafaf.SellWard(item)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_SELL_ITEM, item, Vector(0, 0, 0), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
end

function sadafaf.BuyWard(item)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM, item, Vector(0, 0, 0), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, Heroes.GetLocal(), false, true)
end

return sadafaf