local Weather = {}
Weather.Identity = "gui_weather"
Weather.Locale = {
	["name"] = {
		["english"] = "Weather",
		["russian"] = "Погода",
		["chinese"] = "天氣"
	},
	["desc"] = {
		["english"] = "Manage the weather",
		["russian"] = "Управляем погодой",
		["chinese"] = "簡單的換天氣"
	},
	["selectbox"] = {
		["english"] = "Select weather",
		["russian"] = "Выберите погоду",
		["chinese"] = "選擇天氣"
	},
	["random"] = {
		["english"] = "Select random weather at the beginning of match",
		["russian"] = "Выбирать случайную погоду в начале матча",
		["chinese"] = "選擇隨機的天氣在比賽的開始"
	},
	["items"] = {
		["english"] = {
			[0] = "Default",
			[1] = "Snow",
			[2] = "Rain",
			[3] = "Moonbeam",
			[4] = "Pestilence",
			[5] = "Harvest",
			[6] = "Sirocco",
			[7] = "Spring",
			[8] = "Ash",
			[9] = "Aurora",
			[10] = "Random"
		},
		["russian"] = {
			[0] = "Стандартная",
			[1] = "Снег",
			[2] = "Дождь",
			[3] = "Лунная",
			[4] = "Чума",
			[5] = "Жатва",
			[6] = "Пустыня",
			[7] = "Весна",
			[8] = "Жара",
			[9] = "Аврора",
			[10] = "Случайная"
		},
		["chinese"] = {
			[0] = "標準",
			[1] = "雪",
			[2] = "雨",
			[3] = "月光",
			[4] = "瘟疫",
			[5] = "收成",
			[6] = "熱風",
			[7] = "彈簧",
			[8] = "灰",
			[9] = "極光",
			[10] = "隨機"
		}
	}
}


function Weather.OnDraw()
	if GUI == nil then return end
	if not GUI.Exist(Weather.Identity) then
		GUI.Initialize(Weather.Identity, GUI.Category.General, Weather.Locale["name"], Weather.Locale["desc"], "paroxysm")
		GUI.AddMenuItem(Weather.Identity, Weather.Identity .. "select", Weather.Locale["selectbox"], GUI.MenuType.SelectBox, Weather.Locale["items"], { 0 }, 1, Weather.UpdateSelect)
		GUI.AddMenuItem(Weather.Identity, Weather.Identity .. "random", Weather.Locale["random"], GUI.MenuType.CheckBox, 0)
		GUI.Subscribe(Weather.Identity, GUI.GameStates.OnLobbyChoosed, NewGameStart)
	end
end

function Weather.UpdateSelect(t)
	if not GUI.IsEnabled(Weather.Identity) then return end
	for k, v in pairs(t) do
		if v == 10 then 
			v = math.random(0, 9)
		end
		Engine.ExecuteCommand("cl_weather " .. v)
	end
end

function NewGameStart(o, n)
	if not GUI.IsEnabled(Weather.Identity) then return end
	if GUI.IsEnabled(Weather.Identity .. "random") then
		Engine.ExecuteCommand("cl_weather " .. math.random(1, 9))
	else
		Weather.UpdateSelect(GUI.Get(Weather.Identity .. "select", 1))
	end
end

return Weather
