local FuckMyFriend = {}
FuckMyFriend.optionEnable = Menu.AddOption({"Kostya12rus"}, "FuckMyFriend", "")
local tick = 0
local PlayerNameTable = {}

function FuckMyFriend.OnGameStart()
	local tick = 0
	local PlayerNameTable = {}
end
function FuckMyFriend.OnDraw()
	if not Menu.IsEnabled(FuckMyFriend.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	local curtime = GameRules.GetGameTime()
	local curtimepregame = GameRules.GetGameStartTime()
	local Minute = ((curtime-curtimepregame)/60)
	local MyPlayer = Players.GetLocal()
	local FuckTable = {
	[1] = "Ущербный игрок ",
	[2] = "Даун ",
	[3] = "Школьник ",
	[4] = "Ущерб ",
	[5] = "Гавно ",
	[6] = "Уебан ",
	[7] = "Нулевый игрок ",
	[8] = "Далбоеб ",
	[9] = "Обоссышь ",
	[10] = "Пиздюк "}	
	if tick <= Minute then
		for j = 1, #PlayerNameTable do
			table.remove(PlayerNameTable)
		end
		for i = 1, NPCs.Count() do
			local entity = NPCs.Get(i) 
			if entity and Entity.IsHero(entity) then
				local PlayerName = Player.GetName(Entity.GetOwner(entity))
				if PlayerName ~= Player.GetName(MyPlayer) then
					table.insert(PlayerNameTable, PlayerName)
				end
			end 
			if i == NPCs.Count() and #PlayerNameTable > 1 then
				tick = math.floor(Minute) + 1
				randomnick = math.random(1,#PlayerNameTable)
				randomFuck = math.random(1,#FuckTable)
				if randomnick and randomFuck then
					Engine.ExecuteCommand("say " .. FuckTable[randomFuck] .. math.floor(Minute) .." минуты - " .. PlayerNameTable[randomnick])
				end
			end
		end
	end
end
return FuckMyFriend