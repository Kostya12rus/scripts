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
	}
}

function AP.OnDraw()
	if GUI == nil then return end
	
	if not GUI.Exist(AP.Identity) then
		GUI.Initialize(AP.Identity, GUI.Category.General, AP.Locale["name"], AP.Locale["desc"], "paroxysm")
		GUI.AddMenuItem(AP.Identity, AP.Identity .. "pickedHero", AP.Locale["select"], GUI.MenuType.ImageBox, 1, GUI.HeroesList, GUI.HeroesIconPath, "npc_dota_hero_")
	end
	
	if	GameRules.GetGameState() == 2
		and GUI.IsEnabled(AP.Identity)
	then
		if GUI.Get(AP.Identity .. "pickedHero") == nil then return end
	
		for k,v in pairs(GUI.Get(AP.Identity .. "pickedHero", 1)) do
			Engine.ExecuteCommand("dota_select_hero " .. v)
		return end
	end
end

return AP