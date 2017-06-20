local AP = {}
AP.Identity = "autopick"
AP.Locale = {
	["name"] = {
		["english"] = "Auto Pick",
		["russian"] = "Авто Выбор"
	},
	["desc"] = {
		["english"] = "You'll be the first who choose this hero.",
		["russian"] = "Вы будете первым кто выберет данного героя."
	},
	["select"] = {
		["english"] = "Select Hero",
		["russian"] = "Выберите героя"
	},
	["write"] = {
		["english"] = "Write message on start",
		["russian"] = "Написать сообщение в начале"
	},
	["chat_message"] = {
		["english"] = "Message",
		["russian"] = "Сообщение"
	}
}

function AP.OnDraw()
	if GUI == nil then return end
	
	if not GUI.Exist(AP.Identity) then
		GUI.Initialize(AP.Identity, GUI.Category.General, AP.Locale["name"], AP.Locale["desc"], "paroxysm")
		local templist = GUI.HeroesList
		templist["roshan"] = "zRandom"
		GUI.AddMenuItem(AP.Identity, AP.Identity .. "pickedHero", AP.Locale["select"], GUI.MenuType.ImageBox, 1, templist, GUI.HeroesIconPath, "npc_dota_hero_")
		GUI.Subscribe(AP.Identity, GUI.GameStates.OnLobbyLoad, AP.WriteMessage)
		GUI.AddMenuItem(AP.Identity, AP.Identity .. "write_message", AP.Locale["write"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(AP.Identity, AP.Identity .. "message", AP.Locale["chat_message"], GUI.MenuType.TextBox, "mid")
	end
	
	if	GameRules.GetGameState() == 2
		and GUI.IsEnabled(AP.Identity)
	then
		if GUI.Get(AP.Identity .. "pickedHero") == nil then return end
	
		for k,v in pairs(GUI.Get(AP.Identity .. "pickedHero", 1)) do
			if v == "roshan" then
				Engine.ExecuteCommand("dota_select_hero random")
			else
				Engine.ExecuteCommand("dota_select_hero " .. v)
			end
		return end
	end
end

function AP.WriteMessage(o, w)
	if GUI.IsEnabled(AP.Identity .. "write_message") and GUI.IsEnabled(AP.Identity) then
		Engine.ExecuteCommand("say_team " .. GUI.Get(AP.Identity .. "message"))
	end
end

return AP
