local AB	= {}
AB.Identity	= "autoban"
AB.Locale	= {
	["name"] = {
		["english"] = "Auto Ban",
		["russian"] = "Авто Бан",
		["chinese"] = "自动选择"
	},
	["desc"] = {
		["english"] = "You'll be the first who ban this hero.",
		["russian"] = "Вы будете первым кто забанит данного героя.",
		["chinese"] = "你將是第一個禁止這個英雄的人."
	},
	["select"] = {
		["english"] = "Select Hero",
		["russian"] = "Выберите героя",
		["chinese"] = "选择英雄"
	}
}

function AB.OnDraw()
	if GUI == nil then return end

	if not GUI.Exist(AB.Identity) then
		GUI.Initialize(AB.Identity,		GUI.Category.General,			AB.Locale["name"],			AB.Locale["desc"],		"Alfred Xia, paroxysm")
		GUI.AddMenuItem(AB.Identity,	AB.Identity .. "pickedHero",	AB.Locale["select"],		GUI.MenuType.ImageBox,	1,	GUIDB.Heroes,	GUIDB.HeroPath,	"npc_dota_hero_")
	end
	
	if	GameRules.GetGameState() == 1
		and GUI.IsEnabled(AB.Identity)
	then
		if GUI.Get(AB.Identity .. "pickedHero") == nil then return end
	
		for k,v in pairs(GUI.Get(AB.Identity .. "pickedHero", 1)) do
			Engine.ExecuteCommand("dota_captain_ban_hero " .. v)
		return end
	end
end


return AB
