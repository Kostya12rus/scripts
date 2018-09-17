local HoursDotaPLayers = {}
local playerstable = {}
local api = "3266DA724E01A119230456FE08A99241" -- нужно получить на https://steamcommunity.com/dev/apikey

function HoursDotaPLayers.OnDraw()
	if HTTP.IsHostWhitelisted("api.steampowered.com") and Engine.IsInGame() then
		for _,player in pairs(Players.GetAll()) do
			if player and Players.Contains(player) then
				if Player.GetPlayerData(player) then
					if not playerstable[player] then
						local steamids = Player.GetPlayerData(player).steamid
						if steamids and HoursDotaPLayers.Steam32id(steamids) > 0 and HoursDotaPLayers.Steam32id(steamids) < 9387111184 then
							url = "https://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v1/?key=" .. api .. "&steamid=".. Player.GetPlayerData(player).steamid .."&count=1"
							playerstable[player] = {connect = HTTP.NewConnection(url), rqst = nil, housrs = nil}
						end
					end
					if playerstable[player] then
						if not playerstable[player].housrs then
							if not playerstable[player].rqst or not playerstable[player].rqst:IsValid() then
								playerstable[player].rqst = playerstable[player].connect:AsyncRequest("GET")
							end
							if playerstable[player].rqst and playerstable[player].rqst:IsValid() then
								if playerstable[player].rqst and playerstable[player].rqst:IsResolved() then
									local body = playerstable[player].rqst:Get()
									local result = JSON.Decode(body)
									if body and result then
										local gamest = result.response.games
										if gamest then
											for _,info in pairs(gamest) do
												if info.appid == 570 then
													playerstable[player].housrs = info.playtime_forever/60
													Console.Print(Player.GetName(player) .. " - " .. playerstable[player].housrs .. " часов")
												end
											end
										else
											playerstable[player].housrs = 0
											Console.Print(Player.GetName(player) .. " - игры скрыты")
										end
									end
								end
							end
						end
					end
				end
			end
		end
	else
		playerstable = {}
	end
end
function HoursDotaPLayers.Steam32id(Input)
  return Input - 76561197960265728
end
return HoursDotaPLayers