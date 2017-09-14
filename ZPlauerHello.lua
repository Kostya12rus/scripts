local HelloMyFriend = {}
HelloMyFriend.optionEnable = Menu.AddOption({"Kostya12rus"}, "HelloMyFriend", "")
HelloMyFriend.optionKey = Menu.AddKeyOption({"Kostya12rus","HelloMyFriend"},"TestKey",Enum.ButtonCode.KEY_D)
HelloMyFriend.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
HelloMyFriend.FontSkill = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
local tick = 0

function HelloMyFriend.OnDraw()
	-- if not Menu.IsEnabled(HelloMyFriend.optionEnable) then return end
	-- local myHero = Heroes.GetLocal()
	-- if not myHero then return end 
	-- local DrawX = 500
	-- local DrawY = 300
	-- local MyPlayer = Players.GetLocal()
	-- local mywad = Player.GetPlayerID(MyPlayer)
	-- local MyName = Player.GetName(mywad)
	-- for index = 1, Players.Count() do
		-- local PlayersID = Players.Get(index)
		-- local PlayerName = Player.GetName(PlayersID)
		-- Renderer.DrawText(HelloMyFriend.Font, DrawX, DrawY, PlayersID, 1)
		-- DrawX = DrawX + 100
		-- Renderer.DrawText(HelloMyFriend.Font, DrawX, DrawY, PlayerName, 1)
		-- DrawY = DrawY + 20
	-- end
end


return HelloMyFriend