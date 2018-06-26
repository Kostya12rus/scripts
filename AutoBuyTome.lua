local AutoBuyBock = {}

AutoBuyBock.Enable = Menu.AddOption({ "Kostya12rus"}, "Auto Buy Tome of Knowledge", "Buy every 10 minuts Tome of Knowledge if you have 150 gold")

function AutoBuyBock.OnUpdate()
	if not Menu.IsEnabled(AutoBuyBock.Enable) then return end
 	local myHero = Heroes.GetLocal()
	if not myHero then return end
	if GameRules.GetGameTime() > AutoBuyBock.Delay then
		local realtime = (GameRules.GetGameTime() - GameRules.GetGameStartTime()) / 60 % 10
		if realtime > 0 and realtime < 0.02 then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM, 257, Vector(0, 0, 0), 257, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, myHero, false, true)
		end
		AutoBuyBock.Delay = GameRules.GetGameTime() + 1
	end
end

function AutoBuyBock.init()
	AutoBuyBock.Delay = 0
end
function AutoBuyBock.OnGameEnd()
	AutoBuyBock.init()
end
function AutoBuyBock.OnGameStart()
	AutoBuyBock.init()
end
AutoBuyBock.init()
return AutoBuyBock