local MyTeamateInGame = {}
MyTeamateInGame.optionEnable = Menu.AddOption({"Kostya12rus"}, "Player Log", "")
MyTeamateInGame.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function MyTeamateInGame.OnUpdate()
	if not Menu.IsEnabled(MyTeamateInGame.optionEnable) then return end
	if not Heroes.GetLocal() then return end
	for i=1,NPCs.Count() do
		NA_Unit = NPCs.Get(i)
		if Entity.IsHero(NA_Unit) and Entity.IsPlayer(Entity.GetOwner(NA_Unit)) and not NPC.IsIllusion(NA_Unit) and Player.GetName(Entity.GetOwner(NA_Unit)) ~= Player.GetName(Players.GetLocal()) then
			player = Entity.GetOwner(NA_Unit)
			if MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)] == nil then MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)] = {} end
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][1] = Player.GetName(player)
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][2] = NPC.GetUnitName(NA_Unit)
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][3] = "" .. Player.GetTeamData(player).kills .. "|" .. Player.GetTeamData(player).deaths .. "|" .. Player.GetTeamData(player).assists .. ""
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][4] = Player.GetPlayerData(player).steamid
		end
	end
	if MyTeamateInGame.FindFort() then
		MyTeamateInGame.WriteToList()
	end
end


function MyTeamateInGame.FindFort()
	for i=1,NPCs.Count() do
		NA_Unit = NPCs.Get(i)
		if NPC.GetUnitName(NA_Unit) == "npc_dota_goodguys_fort" or NPC.GetUnitName(NA_Unit) == "npc_dota_badguys_fort" then
			if Entity.GetHealth(NA_Unit) <= 0 then
				return true
			end
		end
	end
	return false
end

function MyTeamateInGame.WriteToList()
	if not MyTeamateInGame.WriteTriger then
		for key,ind in pairs(MyTeamateInGame.PlayerTable) do
			GamesRead = Config.ReadInt("MyTeamateInGameGames", MyTeamateInGame.PlayerTable[key][4], 0)
			Config.WriteString("MyTeamateInGame", tostring(os.date()).."|"..key, "SteamID="..MyTeamateInGame.PlayerTable[key][4].."|".."Game="..GamesRead.."|".."KDA="..MyTeamateInGame.PlayerTable[key][3]
			.."|".."Nick="..MyTeamateInGame.PlayerTable[key][1].."|".."Hero="..MyTeamateInGame.PlayerTable[key][2])
			Config.WriteInt("MyTeamateInGameGames", MyTeamateInGame.PlayerTable[key][4], GamesRead+1)
		end
		MyTeamateInGame.WriteTriger = true
	end
end


function MyTeamateInGame.init()
  MyTeamateInGame.PlayerTable = {}
  MyTeamateInGame.WriteTriger = false
end
function MyTeamateInGame.OnGameStart()
  MyTeamateInGame.init()
end
function MyTeamateInGame.OnGameEnd()
  MyTeamateInGame.init()
end
MyTeamateInGame.init()

return MyTeamateInGame