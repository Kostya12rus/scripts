local spam = {}
spam.optionEnable = Menu.AddOption({"Utility","SpamActivate"}, "Spam", "")
spam.optionKey = Menu.AddKeyOption({"Utility","SpamActivate"}, "For Test",Enum.ButtonCode.KEY_D)
function spam.OnDraw()
    local myHero = Heroes.GetLocal()
	local GameTime = GameRules.GetGameTime()
	local PreGameTime = GameRules.GetGameStartTime()
	local RealTime = GameTime-PreGameTime
	local Minute = math.floor(RealTime/60)
	local Second = math.floor(RealTime-(Minute*60))
	local text = { 
		[0] = "\"Всем привет и удачи в игре. С вас +rep\"",
		[1] = "\"Поставте +rep в мой профиль Steam\"", 
		[2] = "\"Если хотите добавить в друзья, добавлю после комента у меня в профиле\"", 
		[3] = "\"Оцените мой профиль Steam\"", 
	}
	if not myHero or not Menu.IsEnabled(spam.optionEnable) then return end
	if GameRules.GetGameState() == 4 then return end
	if Minute == 0 and Second == 1 and GameRules.GetGameState() == 5 then
		Engine.ExecuteCommand("say ".. text[0])
	end
	for i = 1,100 do
		if Minute == i and Second == 0 and retwit then
			local randoma = math.random(1,#text)
			Engine.ExecuteCommand("say " .. text[randoma])
			retwit = false
		else
			if Second == 1 then
				retwit = true
			end
		end
	end
	-- local text = { 
		-- [1] = "Гей", 
		-- [2] = "Чмо", 
		-- [3] = "Баба", 
		-- [4] = "Лох",
		-- [5] = "Хуй",
		-- [6] = "Гавно",
		-- [7] = "Сабака",
		-- [8] = "Олень",
		-- [9] = "Дурак",
		-- [10] = "Идиот",
		-- [11] = "Долбаеб",
	-- }
	-- if not myHero or not Menu.IsEnabled(spam.optionEnable) then return end
	-- if Menu.IsKeyDown(spam.optionKey) then
		-- local randoma = math.random(1,#text)
		-- Engine.ExecuteCommand("say ты "..text[randoma])
	-- end
end
return spam