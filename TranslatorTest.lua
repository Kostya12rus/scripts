local TransLator = {}
TransLator.TrigerActiv = Menu.AddOption({"Kostya12rus","TransLator"}, "1) Activation", "")
TransLator.ChatTranslation = Menu.AddOption({"Kostya12rus","TransLator"}, "3) Chat translation on", "", 0, 2, 1)
TransLator.YourTextTranslation = Menu.AddOption({"Kostya12rus","TransLator"}, "4) Your Text Translation on", "", 0, 2, 1)
TransLator.WriteYourText = Menu.AddOption({"Kostya12rus","TransLator"}, "2) Write your text in translation", "")

Menu.SetValueName(TransLator.ChatTranslation, 0, 'Russian')
Menu.SetValueName(TransLator.ChatTranslation, 1, 'English')
Menu.SetValueName(TransLator.ChatTranslation, 2, 'Chinese')

Menu.SetValueName(TransLator.YourTextTranslation, 0, 'Russian')
Menu.SetValueName(TransLator.YourTextTranslation, 1, 'English')
Menu.SetValueName(TransLator.YourTextTranslation, 2, 'Chinese')

function TransLator.OnSayText(textEvent)
    if not Menu.IsEnabled(TransLator.TrigerActiv) then return end
    if not textEvent.params[2] then return end
	local writeutext = false
	if not Menu.IsEnabled(TransLator.WriteYourText) then
		writeutext = textEvent.params[1] == TransLator.MyNickName
	end
	if not textEvent.params[1] or writeutext then return end
	if not TransLator.connection then
		TransLator.connection = HTTP.NewConnection(TransLator.url:gsub("NeedLang", TransLator.NeedTranslationLanguage(Menu.GetValue(TransLator.ChatTranslation))):gsub("HereText", textEvent.params[2]))
		TransLator.WhoWrite = textEvent.params[1]
	end
end

function TransLator.startsWith(str, start)
    return string.sub(str, 1, string.len(start)) == start
end

function TransLator.OnUserSay(info)
    if not Menu.IsEnabled(TransLator.TrigerActiv) then return end
	if TransLator.startsWith(info.msg, "!") then
		TransLator.connection = HTTP.NewConnection(TransLator.url:gsub("NeedLang", TransLator.NeedTranslationLanguage(Menu.GetValue(TransLator.YourTextTranslation))):gsub("HereText", string.sub(info.msg,2)))
		TransLator.NeedWriteChat = info.channel
		TransLator.TranslationYourText = true
        return false
	else
		return true
	end
	
end

function TransLator.OnUpdate()
	if not Menu.IsEnabled(TransLator.TrigerActiv) then return end
	if TransLator.MyNickName == nil and Players.GetLocal() then
		TransLator.MyNickName = Player.GetName(Players.GetLocal())
	end
	if TransLator.connection then
		if TransLator.response == nil or not TransLator.response:IsValid() then
			TransLator.response = TransLator.connection:AsyncRequest("POST")
		end
		if TransLator.response ~= nil and TransLator.response:IsResolved() then
			local body = TransLator.response:Get()
			local result = JSON.Decode(body)
			if (result.lang ~= "ru-ru" and result.lang ~= "en-en" and result.lang ~= "zh-zh") and result.code == 200 then
				if TransLator.TranslationYourText then
					do
						TransLator.TranslationYourText = false
						Chat.Say(TransLator.NeedWriteChat,result.text[1])
					end
				else
					Chat.Print("ConsoleChat", '<font color="lime;">'..TransLator.WhoWrite..'</font><font color="red;">: '..result.text[1]..'</font>')
				end
			end
			TransLator.response = nil
			TransLator.connection = nil
			TransLator.WhoWrite = nil
		end
	end
end

function TransLator.NeedTranslationLanguage(index)
	if index == 0 then
		return "ru"
	elseif index == 1 then
		return "en"
	elseif index == 2 then
		return "zh"
	else
		return "ru"
	end
end

function TransLator.init()
	TransLator.connection = nil
	TransLator.response = nil
	TransLator.WhoWrite = nil
	TransLator.NeedWriteChat = nil
	TransLator.MyNickName = nil
	TransLator.TranslationYourText = false
	TransLator.url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20180504T185013Z.d40d5af9faf1c3b9.3ff01d9487dbed6710b02087b4117f88861881db&text=HereText&lang=NeedLang"
end

function TransLator.OnGameStart()
	TransLator.init()
end

function TransLator.OnGameEnd()
	TransLator.init()
end
TransLator.init()

return TransLator