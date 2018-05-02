local Translate= {}
Translate.alerts={}
Translate.optionEnable = Menu.AddOption({ "Utility","Translate"}, "Enabled", "Auto Translate")
Translate.font = Renderer.LoadFont("Tahoma", 50, Enum.FontWeight.EXTRABOLD)

function Translate.OnUpdate()
    if not Menu.IsEnabled(Translate.optionEnable) then return end
end

function Translate.OnSayText(textEvent)
    if not textEvent.params[2] then return end 
    local header = "Content-Type: application/json"
    local body = JSON.Encode({
        text = textEvent.params[2],
        lan ="en"
    })
    Log.Write(textEvent.messageName)
    local result = JSON.Decode(HTTP.Post("https://translate-alfred.herokuapp.com/translate", header, body))
    if result.from.language.iso == "en" then return end
    --if textEvent.messageName == 'DOTA_Chat_Team' then
    local newAlert = {
            msg = result.text,
            endTime = os.clock() + 4,
        }
    table.insert(Translate.alerts, newAlert)
   --elseif textEvent.messageName == "DOTA_Chat_All" then
       
end

function Translate.OnDraw()
    for i, alert in ipairs(Translate.alerts) do
        local timeLeft = alert.endTime - os.clock()

        if timeLeft < 0 then
            table.remove(Translate.alerts, i)
        else
            -- Fade out the last 5 seconds of the alert.
            local alpha = 255 * math.min(timeLeft / 5, 1)

            -- Some really obnoxious color to grab your attention.
            Renderer.SetDrawColor(255, 0, 255, math.floor(alpha))

            local w, h = Renderer.GetScreenSize()

            Renderer.DrawTextCentered(Translate.font, w / 2 - math.floor(string.len(alert.msg)/2), h / 2 + (i - 1) * 22, alert.msg, 1)

            if alert.position then 
                local x, y, onScreen = Renderer.WorldToScreen(alert.position)

                if onScreen then
                    Renderer.DrawTextCentered(Translate.mapFont, x, y, alert.name, 1)
                    --Renderer.DrawFilledRect(x - 5, y - 5, 10, 10)
                end
            end
        end
    end
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

return Translate