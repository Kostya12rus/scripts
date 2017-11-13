local MyTeamateInGame = {}
MyTeamateInGame.optionEnable = Menu.AddOption({"Kostya12rus"}, "Player Log", "")
MyTeamateInGame.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function MyTeamateInGame.OnUpdate()
	if not Menu.IsEnabled(MyTeamateInGame.optionEnable) then return end
	if not Heroes.GetLocal() then return end
	for i=1,NPCs.Count() do
		NA_Unit = NPCs.Get(i)
		if Entity.IsHero(NA_Unit) and Entity.IsPlayer(Entity.GetOwner(NA_Unit)) and not NPC.IsIllusion(NA_Unit) and NA_Unit ~= Heroes.GetLocal() then
			player = Entity.GetOwner(NA_Unit)
			if MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)] == nil then MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)] = {} end
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][1] = Player.GetName(player)
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][2] = NPC.GetUnitName(NA_Unit)
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][3] = Config.ReadInt("MyTeamateInGame", Player.GetPlayerData(player).steamid*10, 0)
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][4] = Player.GetPlayerData(player).steamid
			MyTeamateInGame.PlayerTable[Hero.GetPlayerID(NA_Unit)][5] = "" .. Player.GetTeamData(player).kills .. "|" .. Player.GetTeamData(player).deaths .. "|" .. Player.GetTeamData(player).assists .. ""
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
		
			stringhero = Config.ReadString("MyTeamateInGame", MyTeamateInGame.PlayerTable[key][4], " ")
			
			GamesRead = Config.ReadInt("MyTeamateInGame", MyTeamateInGame.PlayerTable[key][4]*10, 0)
			
			Config.WriteString("MyTeamateInGame", MyTeamateInGame.PlayerTable[key][4] ,"Time="..tostring(os.date()).."|".."Nick="..MyTeamateInGame.PlayerTable[key][1].."|"..
			"Hero="..MyTeamateInGame.PlayerTable[key][2].."|".."KDA="..MyTeamateInGame.PlayerTable[key][5].."|".."Game="..GamesRead.."|||".. stringhero)
			
			Config.WriteInt("MyTeamateInGame", MyTeamateInGame.PlayerTable[key][4]*10, GamesRead+1)
		
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