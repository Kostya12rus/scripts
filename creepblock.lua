local Blocker = {}

local creep_melee_collision_size = 16
local creep_ranged_collision_size =  8
local key = Menu.AddKeyOption({"Utility"}, "[W] CreepBlock", Enum.ButtonCode.KEY_SPACE)
local font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

local DOTA_TEAM_GOODGUYS = 2
local DOTA_TEAM_BADGUYS = 3

-- local npc_to_ignore = {}
local top_towers = {}
local mid_towers = {}
local bottom_towers = {}
local my_line = nil
local my_team = nil


local last_stop = 0
local sleep = 0
local less_stopping = false

local Fountain = nil

function Blocker.OnDraw()

    if not Menu.IsKeyDown(key) then
        return false
    end

    local myHero = Heroes.GetLocal()
    if not myHero then return end
    if not Fountain or Fountain == nil then
        Blocker.getFountain(myHero)
    end
    local hero_collision_size = 24
    local radius = 500

    local creeps = NPC.GetUnitsInRadius(myHero, radius, Enum.TeamType.TEAM_FRIEND)
    local origin = Entity.GetAbsOrigin(myHero)

    best_npc = nil
    best_position = nil
    best_distance = 99999

    local curtime = GameRules.GetGameTime()

    local fountain_origin = Entity.GetAbsOrigin(Fountain)
    local hero_to_fountain_len = (origin - fountain_origin):Length()

    local hx, hy = Renderer.WorldToScreen(origin)
    if less_stopping then
        Renderer.SetDrawColor(0, 255, 255, 150)
        Renderer.DrawText(font, hx, hy, 'LESS STOPPING (TOWER NEAR)', 1)
    end

    for i, npc in ipairs(creeps) do
        if NPC.IsCreep(npc) and not Entity.IsDormant(npc) and Entity.IsAlive(npc) then
            local npc_id = Entity.GetIndex(npc)
            local creep_origin = Entity.GetAbsOrigin(npc)

            local x, y = Renderer.WorldToScreen(creep_origin)
            DrawCircle(creep_origin, creep_melee_collision_size)
            local moves_to = Blocker.GetPredictedPosition(npc, 0.66) --0.45)

            -- local pos_to_fountain_len = (moves_to - fountain_origin):Length()
            -- Renderer.SetDrawColor(0, 255, 255, 150)
            -- Renderer.DrawText(font, x, y, pos_to_fountain_len, 1)

            if not NPC.IsRunning(npc) then
                --npc_to_ignore[npc_id] = curtime + 0.01
            -- elseif (npc_to_ignore[npc_id] ~= nil and npc_to_ignore[npc_id] < curtime) then
            --     -- do nothing here
            else
                local x2, y2 = Renderer.WorldToScreen(moves_to)
                Renderer.DrawLine(x, y, x2, y2)

                local distance = (origin - creep_origin):Length()
                distance = distance - hero_collision_size

                if distance <= best_distance then
                    best_npc = npc
                    best_position = moves_to
                    best_distance = distance
                end
            end
        end
    end

    -- Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_DIRECTION, nil, best_position, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY , myHero)
    if best_position then
        local pos_to_fountain_len = (best_position - fountain_origin):Length()
        local name = NPC.GetUnitName(best_npc)
        local collision_size = creep_melee_collision_size
        -- if name ~= '' then
        --     collision_size = creep_ranged_collision_size
        -- end
        -- Renderer.DrawText(font, hx, hy, (best_position - origin):Length()..'\n'..(hero_collision_size + collision_size + 1), 1)
        if curtime > sleep then--and pos_to_fountain_len >= hero_to_fountain_len then -- and (best_position - origin):Length() <= 80 then -- and (best_position - origin):Length() <= hero_collision_size + collision_size + 1 then
            Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, myHero, best_position, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
        end
        local dist = (best_position - origin):Length()
        local speed = NPC.GetMoveSpeed(myHero)
        if curtime > last_stop and dist >= 30 * speed / 315 and dist <= 150 * speed / 315 then--dist >= 30 and dist <= 150 then
            last_stop = curtime + 0.21 * speed / 315--0.21
            if less_stopping then
                last_stop = curtime + 0.9
            end
            sleep = curtime + 0.05 -- 0.05
            Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_STOP, myHero, best_position, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
        end
    end

    -- get my line and towers
    less_stopping = false
    local TOWER_WARNING = 350
    for i, tower in pairs(top_towers) do
        local torigin = Entity.GetAbsOrigin(tower)
        if (origin - torigin):Length() <= TOWER_WARNING then
            less_stopping = true
        end
    end
    for i, tower in pairs(mid_towers) do
        local torigin = Entity.GetAbsOrigin(tower)
        if (origin - torigin):Length() <= TOWER_WARNING then
            less_stopping = true
        end
    end
    for i, tower in pairs(bottom_towers) do
        local torigin = Entity.GetAbsOrigin(tower)
        if (origin - torigin):Length() <= TOWER_WARNING then
            less_stopping = true
        end
    end

end

-- return predicted position
function Blocker.GetPredictedPosition(npc, delay)
    local pos = Entity.GetAbsOrigin(npc)
    if not NPC.IsRunning(npc) or not delay then return pos end

    local dir = Entity.GetRotation(npc):GetForward():Normalized()
    local speed = Blocker.GetMoveSpeed(npc)

    return pos + dir:Scaled(speed * delay)
end

function Blocker.GetMoveSpeed(npc)
    local base_speed = NPC.GetBaseSpeed(npc)
    local bonus_speed = NPC.GetMoveSpeed(npc) - NPC.GetBaseSpeed(npc)

    return base_speed + bonus_speed
end

local size_x, size_y = Renderer.GetScreenSize()

function DrawCircle(UnitPos, radius)
    local x1, y1 = Renderer.WorldToScreen(UnitPos)
    if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
        local x4, y4, x3, y3, visible3
        local dergee = 90
        for angle = 0, 360 / dergee do
            x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
            y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
            x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
            Renderer.DrawLine(x1,y1,x3,y3)
            x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
        end
    end
end

function Blocker.getFountain(Hero)

    local team = 'badguys'
    my_team = Entity.GetTeamNum(Hero)
    if my_team ~= DOTA_TEAM_BADGUYS then
        team = 'goodguys'
    end

    for i = 1, NPCs.Count() do 
        local npc = NPCs.Get(i)
        if NPC.IsStructure(npc) then
            local name = NPC.GetUnitName(npc)
            if name ~= nil then

                if name == "dota_fountain" then
                    if Entity.IsSameTeam(Hero, npc) then
                        Fountain = npc
                    -- else
                    --     Blocker.EnemyFountain = npc
                    end
                end

                if name == "npc_dota_"..team.."_tower1_top" then
                    top_towers[1] = npc
                end
                if name == "npc_dota_"..team.."_tower2_top" then
                    top_towers[2] = npc
                end
                if name == "npc_dota_"..team.."_tower3_top" then
                    top_towers[3] = npc
                end

                if name == "npc_dota_"..team.."_tower1_mid" then
                    mid_towers[1] = npc
                end
                if name == "npc_dota_"..team.."_tower2_mid" then
                    mid_towers[2] = npc
                end
                if name == "npc_dota_"..team.."_tower3_mid" then
                    mid_towers[3] = npc
                end

                if name == "npc_dota_"..team.."_tower1_bot" then
                    bottom_towers[1] = npc
                end
                if name == "npc_dota_"..team.."_tower2_bot" then
                    bottom_towers[2] = npc
                end
                if name == "npc_dota_"..team.."_tower3_bot" then
                    bottom_towers[3] = npc
                end

            end
        end
    end
end

return Blocker
