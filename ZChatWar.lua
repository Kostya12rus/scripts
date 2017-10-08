--Author: Kostya12rus
local ZChatWar = {}
ZChatWar.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
ZChatWar.optionEnable = Menu.AddOption({"Kostya12rus","Chat War"}, "Activate", "")
-- ZChatWar.NickAndItemseKey =     Menu.AddKeyOption({"Kostya12rus","MultiCheat",  "4 Nick And Items"}, "Fuck Key",Enum.ButtonCode.KEY_P)
function ZChatWar.init()
	HeroDataInfo = {}
	NameKey = 1
	TeamKey = 2
	ValueStreakKey = 3
	RespawnTimeKey = 4
	OldStreakKey = 5
	TimeTick = 6
	BeenKill = 7
	Killtick = 8
	Msgtick = 9
	TimeStreak = 18
	kill2 = true
	kill3 = true
	kill4 = true
	kill5 = true
	kill6 = true
	Testtxt1 = 'Красавчик '..Herotable[NameKey]..', сделал ДаблКил'
	Testtxt2 = 'Это трипл килл в исполнении '..Herotable[NameKey]
	Testtxt3 = Herotable[NameKey]..', он пришел за рампагой'
	Testtxt4 = 'Да пацаны это рампага в исполнении '..Herotable[NameKey]..', просто лайк'
	Testtxt5 = 'Остановите '..Herotable[NameKey]..', он просто ебанутый, сделал '..Herotable[Killtick]..' килов подряд'
end

function ZChatWar.OnUpdate()
	if not Menu.IsEnabled(ZChatWar.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local NeedX = 1000
	local NeedY = 500
	for i=1,NPCs.Count() do
		NA_Unit = NPCs.Get(i)
		if Entity.IsHero(NA_Unit) and Entity.IsPlayer(Entity.GetOwner(NA_Unit)) and not NPC.IsIllusion(NA_Unit) then
			if HeroDataInfo[NPC.GetUnitName(NA_Unit)] == nil then
				HeroDataInfo[NPC.GetUnitName(NA_Unit)] = {} 
			end
			Herotable = HeroDataInfo[NPC.GetUnitName(NA_Unit)]
			Herotable[NameKey] = Player.GetName(Entity.GetOwner(NA_Unit))
			Herotable[TeamKey] = Entity.IsSameTeam(myHero, NA_Unit)
			Herotable[ValueStreakKey] = Player.GetTeamData(Entity.GetOwner(NA_Unit)).streak
			Herotable[RespawnTimeKey] = Player.GetTeamData(Entity.GetOwner(NA_Unit)).respawnTime
			if Herotable[TimeTick] == nil then Herotable[TimeTick] = 9999999 end
			if Herotable[BeenKill] == nil then Herotable[BeenKill] = false end
			if Herotable[Killtick] == nil then Herotable[Killtick] = 0 end
			if Herotable[Msgtick] == nil then Herotable[Msgtick] = false end
			if (Herotable[ValueStreakKey] == 0 and Herotable[RespawnTimeKey] <= 0) or Herotable[OldStreakKey] == nil then
				Herotable[OldStreakKey] = 0
			end
			if Herotable[OldStreakKey] == 0 and Herotable[ValueStreakKey] >= 2 then
				Herotable[OldStreakKey] = Herotable[ValueStreakKey]
			end
			if Herotable[ValueStreakKey] > Herotable[OldStreakKey] then
				Herotable[OldStreakKey] = Herotable[OldStreakKey]+1
				Herotable[Killtick] = Herotable[Killtick]+1
				Herotable[BeenKill] = true
			end
			
			if Herotable[TimeTick] >= GameRules.GetGameTime() and Herotable[BeenKill] then
				Herotable[TimeTick] = GameRules.GetGameTime() + TimeStreak
				Herotable[BeenKill] = false
				Herotable[Msgtick] = true
			end
			
			if Herotable[TimeTick]-GameRules.GetGameTime() <= TimeStreak-1 and Herotable[Msgtick] then 
				
				if Herotable[Killtick] == 2 and kill2 then
					Engine.ExecuteCommand('say Красавчик '..Herotable[NameKey]..', сделал ДаблКил')
					local kill2 = false
				else
					local kill2 = true
				end
				if Herotable[Killtick] == 3 and kill3 then
					Engine.ExecuteCommand('say Это трипл килл в исполнении '..Herotable[NameKey])
					local kill3 = false
				else 
					local kill3 = true 
				end
				if Herotable[Killtick] == 4 and kill4 then
					Engine.ExecuteCommand('say '..Herotable[NameKey]..', он пришел за рампагой')
					local kill4 = false
				else 
					local kill4 = true 
				end
				if Herotable[Killtick] == 5 and kill5 then
					Engine.ExecuteCommand('say Да пацаны это рампага в исполнении '..Herotable[NameKey]..', просто лайк')
					local kill5 = false
				else 
					local kill5 = true 
				end
				if Herotable[Killtick] > 5 and kill6 then
					Engine.ExecuteCommand('say Остановите '..Herotable[NameKey]..', он просто ебанутый, сделал '..Herotable[Killtick]..' килов подряд')
					local kill6 = false
				else 
					local kill6 = true 
				end
				Herotable[Msgtick] = false
			end
			if Herotable[TimeTick] < GameRules.GetGameTime() and not Herotable[BeenKill] then
				Herotable[Killtick] = 0
				Herotable[TimeTick]=Herotable[TimeTick]+1
			end
		end
	end
end

function ZChatWar.SayInChat(txt)

end
function ZChatWar.OnGameStart()
  ZChatWar.init()
end
function ZChatWar.OnGameEnd()
  ZChatWar.init()
end
ZChatWar.init()
return ZChatWar