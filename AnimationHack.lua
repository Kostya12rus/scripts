local CreateHero = {}
CreateHero.TrigerActiv = Menu.AddOption({"Kostya12rus","CreateHero"}, "Activation", "")
--[[ CreateHero.Key = Menu.AddKeyOption({"Kostya12rus","CreateHero"}, " ", Enum.ButtonCode.BUTTON_CODE_NONE)
CreateHero.Slider = Menu.AddOption({"Kostya12rus","CreateHero"}, " ", "", 0, 1, 100000) ]]
CreateHero.Font = Renderer.LoadFont("Tahoma", 30, Enum.FontWeight.EXTRABOLD)

CreateHero.ActivScript = false
CreateHero.TableAnimation = {}

function CreateHero.OnUpdate()
    if not Menu.IsEnabled(CreateHero.TrigerActiv) then return end
  
    if not CreateHero.ActivScript then
        CreateHero.ActivScript = true
    end
end

function CreateHero.OnDraw()
    if not CreateHero.ActivScript then return end
    Renderer.SetDrawColor(255,0,0,255)
    for npc,table in pairs(CreateHero.TableAnimation) do
        if npc and NPCs.Contains(npc) and Entity.IsDormant(npc) and not Heroes.Contains(npc) then
            if table.time + 3 >= GameRules.GetGameTime() then
                local x,y,v = Renderer.WorldToScreen(Entity.GetAbsOrigin(npc))
                if v then
                    Renderer.DrawTextCentered(CreateHero.Font, x, y, "X", 1)
                end
            end
            if table.time + 3 < GameRules.GetGameTime() then
                CreateHero.TableAnimation[npc] = nil
            end
        end
    end
end

function CreateHero.OnUnitAnimation(animation)
    if not CreateHero.ActivScript then return end
    if animation.unit and NPCs.Contains(animation.unit) and not Entity.IsSameTeam(Heroes.GetLocal(), animation.unit) and Entity.IsDormant(animation.unit) then
        CreateHero.TableAnimation[animation.unit] = {time = GameRules.GetGameTime(), icon = nil}
        MiniMap.AddIconByName(nil, nil, Entity.GetAbsOrigin(animation.unit), 255, 0, 0, 255, 3.0, 500)
    end
end

function CreateHero.init()
end

function CreateHero.OnGameStart()
    CreateHero.init()
end
function CreateHero.OnGameEnd()
    CreateHero.init()
end
CreateHero.init()

return CreateHero