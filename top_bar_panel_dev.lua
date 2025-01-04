local top_bar_panel_dev = {}
local KostyaUtils = require("KostyaUtils/Utils")

top_bar_panel_dev.on_off_script_triger =        Menu.AddOption({"Kostya12rus", "Top Bar"},"01) Enable Script", "Full on/off script")

top_bar_panel_dev.on_off_crips_stats =          Menu.AddOption({"Kostya12rus", "Top Bar", "02) Крип Стат"},"01) Включить статистику крипов", "")
top_bar_panel_dev.on_off_crips_stats_alt =      Menu.AddOption({"Kostya12rus", "Top Bar", "02) Крип Стат"},"02) Только при нажатой ALT", "")

top_bar_panel_dev.on_off_health =               Menu.AddOption({"Kostya12rus", "Top Bar", "03) Здоровье"},"01) Включить здоровье", "")
top_bar_panel_dev.on_off_health_alt =           Menu.AddOption({"Kostya12rus", "Top Bar", "03) Здоровье"},"02) Только при нажатой ALT", "")
top_bar_panel_dev.on_off_health_no_text =       Menu.AddOption({"Kostya12rus", "Top Bar", "03) Здоровье"},"03) Только полоска", "")

top_bar_panel_dev.on_off_mana =                 Menu.AddOption({"Kostya12rus", "Top Bar", "04) Мана"},"01) Включить ману", "")
top_bar_panel_dev.on_off_mana_alt =             Menu.AddOption({"Kostya12rus", "Top Bar", "04) Мана"},"02) Только при нажатой ALT", "")
top_bar_panel_dev.on_off_mana_no_text =         Menu.AddOption({"Kostya12rus", "Top Bar", "04) Мана"},"03) Только полоска", "")

top_bar_panel_dev.on_off_ult =                  Menu.AddOption({"Kostya12rus", "Top Bar", "05) Ульта"},"01) Включить ульту", "")
top_bar_panel_dev.on_off_ult_alt =              Menu.AddOption({"Kostya12rus", "Top Bar", "05) Ульта"},"02) Только при нажатой ALT", "")
top_bar_panel_dev.on_off_ult_scepter =          Menu.AddOption({"Kostya12rus", "Top Bar", "05) Ульта"},"03) Показывать купленный аганим и шард", "")

top_bar_panel_dev.on_off_buyback =              Menu.AddOption({"Kostya12rus", "Top Bar", "06) БайБек"},"01) Включить БайБек", "")
top_bar_panel_dev.on_off_buyback_alt =          Menu.AddOption({"Kostya12rus", "Top Bar", "06) БайБек"},"02) Только при нажатой ALT", "")

top_bar_panel_dev.on_off_roshan =               Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"01) Включить Рошана", "")
top_bar_panel_dev.on_off_roshan_alt =           Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"02) Только при нажатой ALT", "")
top_bar_panel_dev.on_off_roshan_health =        Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"03) Показывать ХП", "")
top_bar_panel_dev.on_off_roshan_outfit =        Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"04) Показывать Рамку", "")
top_bar_panel_dev.on_off_roshan_no_text =       Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"05) Tекст если рошан не обнаружен", "")
top_bar_panel_dev.on_off_roshan_respawn =       Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"06) Показывать время возраждения", "")
top_bar_panel_dev.on_off_roshan_aegis =         Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"07) Показывать время аегиса", "")
top_bar_panel_dev.on_off_roshan_position =      Menu.AddOption({"Kostya12rus", "Top Bar", "07) Рошан"},"08) Пишет текущее место рошана", "")

top_bar_panel_dev.on_off_items =                Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"01) Включить Важные вещи", "")
top_bar_panel_dev.on_off_items_alt =            Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"02) Только при нажатой ALT", "")
top_bar_panel_dev.on_off_items_item_rapier =    Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"03) Вкл Рапиру", "")
top_bar_panel_dev.on_off_items_item_gem =       Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"04) Вкл Гем", "")
top_bar_panel_dev.on_off_items_item_ward =      Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"05) Вкл Варды", "")
top_bar_panel_dev.on_off_items_item_dust =      Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"06) Вкл Дасты", "")
top_bar_panel_dev.on_off_items_item_smoke =     Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"07) Вкл Смоки", "")
top_bar_panel_dev.on_off_items_item_aegis =     Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"08) Вкл Аегис", "")
top_bar_panel_dev.on_off_items_item_cheese =    Menu.AddOption({"Kostya12rus", "Top Bar", "08) Вещи"},"09) Вкл Сыр", "")

-- function top_bar_panel_dev.OnUI()
--     KostyaUtils.DebugData(top_bar_panel_dev, 'top_bar_panel_dev')
-- end

function top_bar_panel_dev.OnDraw()
    if not Menu.IsEnabled(top_bar_panel_dev.on_off_script_triger) then return end
    local game_state = GameRules.GetGameState()
    if game_state == -1 then
        top_bar_panel_dev.total_data = {}
        return
    end
    if game_state ~= 4 and game_state ~= 5 then return end
    if top_bar_panel_dev.shop_is_open then return end
    top_bar_panel_dev.game_time = GameRules.GetGameTime()
    top_bar_panel_dev.os_clock = os.clock()

    top_bar_panel_dev.OnDrawOtherData()
    top_bar_panel_dev.OnUpdateOtherData()


    top_bar_panel_dev.OnDrawHeroes()
    top_bar_panel_dev.OnCreateHeroes()
    top_bar_panel_dev.OnUpdateHeroes()

    top_bar_panel_dev.OnDrawRoshan()
    top_bar_panel_dev.OnUpdateRoshan()
end


function top_bar_panel_dev.OnDrawOtherData()
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.other_data = top_bar_panel_dev.total_data.other_data or {}
    if not top_bar_panel_dev.total_data.other_data.win_chance then return end

    if top_bar_panel_dev.total_data.other_data.top_position then
        local start_pos_table = top_bar_panel_dev.total_data.other_data.top_position[5]
        local end_pos_table = top_bar_panel_dev.total_data.other_data.top_position[6]
        local position_x = math.ceil(start_pos_table.x + start_pos_table.w)
        local position_y = math.ceil(start_pos_table.y + start_pos_table.h * 1.5)
        local position_w = math.ceil(end_pos_table.x - position_x)
        local position_h = math.ceil(start_pos_table.h * 0.4)
        dire_networth = top_bar_panel_dev.total_data.other_data.win_chance['dire_networth']
        dire_total_gold = top_bar_panel_dev.total_data.other_data.win_chance['dire_total_gold']
        dire_total_XP = top_bar_panel_dev.total_data.other_data.win_chance['dire_total_XP']
        radiant_networth = top_bar_panel_dev.total_data.other_data.win_chance['radiant_networth']
        radiant_total_gold = top_bar_panel_dev.total_data.other_data.win_chance['radiant_total_gold']
        radiant_total_XP = top_bar_panel_dev.total_data.other_data.win_chance['radiant_total_XP']
        radiant_win_chance = top_bar_panel_dev.total_data.other_data.win_chance['radiant_win_chance']
        dire_win_chance = top_bar_panel_dev.total_data.other_data.win_chance['dire_win_chance']
        if radiant_win_chance and dire_win_chance then
            local x_text = math.ceil(position_x+position_w * 0.5)
            local text_print = tostring(radiant_win_chance) .. '%'
            if radiant_win_chance >= dire_win_chance then
                text_print = text_print .. " > "
                Renderer.SetDrawColor(0, 255, 0, 200)
            else
                text_print = text_print .. " < "
                Renderer.SetDrawColor(255, 0, 0, 200)
            end
            text_print = text_print .. tostring(dire_win_chance) .. "%"
            Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.roshan_font, x_text, position_y, text_print, 0)
        end
        if radiant_networth or radiant_total_gold or radiant_total_XP then
            local x_text = math.ceil(position_x)
            local y_text = position_y
            if radiant_networth then
                local text_print = radiant_networth .. ' NW'
                local text_w, text_h = Renderer.MeasureText(top_bar_panel_dev.total_data.other_data.roshan_font, text_print)
                Renderer.SetDrawColor(100, 255, 100, 200)
                Renderer.DrawText(top_bar_panel_dev.total_data.other_data.roshan_font, x_text, y_text, text_print, 0)
                y_text = math.ceil(y_text + text_h * 0.5)
            end
            if radiant_total_gold then
                local text_print = radiant_total_gold .. ' TG'
                local text_w, text_h = Renderer.MeasureText(top_bar_panel_dev.total_data.other_data.roshan_font, text_print)
                Renderer.SetDrawColor(255, 215, 0, 200)
                Renderer.DrawText(top_bar_panel_dev.total_data.other_data.roshan_font, x_text, y_text, text_print, 0)
                y_text = math.ceil(y_text + text_h * 0.5)
            end
            if radiant_total_XP then
                local text_print = radiant_total_XP .. ' XP'
                local text_w, text_h = Renderer.MeasureText(top_bar_panel_dev.total_data.other_data.roshan_font, text_print)
                Renderer.SetDrawColor(100, 100, 255, 200)
                Renderer.DrawText(top_bar_panel_dev.total_data.other_data.roshan_font, x_text, y_text, text_print, 0)
                y_text = math.ceil(y_text + text_h * 0.5)
            end
        end
        if dire_networth or dire_total_gold or dire_total_XP then
            local x_text = math.ceil(position_x + position_w)
            local y_text = position_y
            if dire_networth then
                local text_print = dire_networth .. ' NW'
                local text_w, text_h = Renderer.MeasureText(top_bar_panel_dev.total_data.other_data.roshan_font, text_print)
                Renderer.SetDrawColor(100, 255, 100, 200)
                Renderer.DrawText(top_bar_panel_dev.total_data.other_data.roshan_font, x_text-text_w, y_text, text_print, 0)
                y_text = math.ceil(y_text + text_h * 0.5)
            end
            if dire_total_gold then
                local text_print = dire_total_gold .. ' TG'
                local text_w, text_h = Renderer.MeasureText(top_bar_panel_dev.total_data.other_data.roshan_font, text_print)
                Renderer.SetDrawColor(255, 215, 0, 200)
                Renderer.DrawText(top_bar_panel_dev.total_data.other_data.roshan_font, x_text-text_w, y_text, text_print, 0)
                y_text = math.ceil(y_text + text_h * 0.5)
            end
            if dire_total_XP then
                local text_print = dire_total_XP .. ' XP'
                local text_w, text_h = Renderer.MeasureText(top_bar_panel_dev.total_data.other_data.roshan_font, text_print)
                Renderer.SetDrawColor(100, 100, 255, 200)
                Renderer.DrawText(top_bar_panel_dev.total_data.other_data.roshan_font, x_text-text_w, y_text, text_print, 0)
                y_text = math.ceil(y_text + text_h * 0.5)
            end
        end
    end
end

function top_bar_panel_dev.OnUpdateOtherData()
    top_bar_panel_dev.triger_update_other_data = top_bar_panel_dev.triger_update_other_data or top_bar_panel_dev.os_clock
    if top_bar_panel_dev.triger_update_other_data > top_bar_panel_dev.os_clock then return end
    top_bar_panel_dev.triger_update_other_data = top_bar_panel_dev.os_clock + 1

    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.other_data = top_bar_panel_dev.total_data.other_data or {}

    local size_x, size_y = Renderer.GetScreenSize()
    if size_x ~= top_bar_panel_dev.total_data.other_data.size_x or size_y ~= top_bar_panel_dev.total_data.other_data.size_y then
        top_bar_panel_dev.total_data.other_data = {}
    end
    top_bar_panel_dev.total_data.other_data.size_x, top_bar_panel_dev.total_data.other_data.size_y = size_x, size_y

    if not top_bar_panel_dev.total_data.other_data.font then
        top_bar_panel_dev.total_data.other_data.font = Renderer.LoadFont("Tahoma", math.ceil(size_y * 0.018111), Enum.FontWeight.EXTRABOLD, nil, 3)
    end

    if not top_bar_panel_dev.total_data.other_data.crips_stats_font then
        top_bar_panel_dev.total_data.other_data.crips_stats_font = Renderer.LoadFont("Tahoma", math.ceil(size_y * 0.011111), Enum.FontWeight.EXTRABOLD, nil, 3)
    end

    if not top_bar_panel_dev.total_data.other_data.roshan_font then
        top_bar_panel_dev.total_data.other_data.roshan_font = Renderer.LoadFont("Tahoma", math.ceil(size_y * 0.012), Enum.FontWeight.EXTRABOLD, nil, 3)
    end
    
    if not top_bar_panel_dev.total_data.other_data.top_position then
        top_bar_panel_dev.total_data.other_data.top_position = KostyaUtils.GetActualPos("top")
    end

    top_bar_panel_dev.total_data.other_data.win_chance = KostyaUtils.GetWinChance()
end


function top_bar_panel_dev.OnDrawRoshan()
    if not Menu.IsEnabled(top_bar_panel_dev.on_off_roshan) then return end
    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_alt) and not Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then return end
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.roshan = top_bar_panel_dev.total_data.roshan or {}
    top_bar_panel_dev.total_data.other_data = top_bar_panel_dev.total_data.other_data or {}
    if not top_bar_panel_dev.total_data.roshan.position then return end
    local x = top_bar_panel_dev.total_data.roshan.position.x
    local y = top_bar_panel_dev.total_data.roshan.position.y
    local w = top_bar_panel_dev.total_data.roshan.position.w
    local h = top_bar_panel_dev.total_data.roshan.position.h
    local position_now = top_bar_panel_dev.total_data.roshan.position_now
    local x_text = top_bar_panel_dev.total_data.roshan.position.x_text
    local y_text = top_bar_panel_dev.total_data.roshan.position.y_text

    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_outfit) then
        Renderer.SetDrawColor(255, 0, 0, 200)
        Renderer.DrawOutlineRect(x, y, w, h)
    end

    local text = ''
    local dota_roshan_kill = top_bar_panel_dev.total_data.roshan.dota_roshan_kill or 0
    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_respawn) then
        if dota_roshan_kill > top_bar_panel_dev.game_time then
            local max_time = dota_roshan_kill - top_bar_panel_dev.game_time
            local min_time = max_time - 180
            if min_time < 0 then
                min_time = 0
            end
            text = text .. KostyaUtils.TimeSecToNormal(min_time) .. " - " .. KostyaUtils.TimeSecToNormal(max_time)
        end
    end

    local aegis_event = top_bar_panel_dev.total_data.roshan.aegis_event or 0
    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_aegis) then
        if aegis_event > top_bar_panel_dev.game_time then
            local aegis_event_time = aegis_event - top_bar_panel_dev.game_time
            text = text .. " (" .. KostyaUtils.TimeSecToNormal(aegis_event_time) .. ")"
        end
    end

    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_aegis) or Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_respawn) then
        Renderer.SetDrawColor(255, 255, 255, 200)
        Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.roshan_font, x_text, y_text, text, 0)
    end
    if dota_roshan_kill > 0 or aegis_event > 0 then return end
    
    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_health) then
        if top_bar_panel_dev.total_data.roshan.health and top_bar_panel_dev.total_data.roshan.max_health then
            local text = top_bar_panel_dev.total_data.roshan.percente_health .. "% " .. math.ceil(top_bar_panel_dev.total_data.roshan.health) .. " HP" .. position_now
            Renderer.SetDrawColor(255, 255, 255, 200)
            Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.roshan_font, x_text, y_text, text, 0)
        end
    end
end

function top_bar_panel_dev.OnUpdateRoshan()
    if not Menu.IsEnabled(top_bar_panel_dev.on_off_roshan) then return end
    top_bar_panel_dev.triger_update_roshan = top_bar_panel_dev.triger_update_roshan or top_bar_panel_dev.os_clock
    if top_bar_panel_dev.triger_update_roshan > top_bar_panel_dev.os_clock then return end
    top_bar_panel_dev.triger_update_roshan = top_bar_panel_dev.os_clock + 1
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.roshan = top_bar_panel_dev.total_data.roshan or {}

    local last_update = math.floor((top_bar_panel_dev.game_time - GameRules.GetGameStartTime())/60)
    local last_update_regen = math.floor(top_bar_panel_dev.game_time)
    local health_add = 130
    if GameRules.GetGameMode() == 23 or GameRules.GetGameMode() == 13 then
        health_add = health_add * 2
    end

    top_bar_panel_dev.total_data.roshan.position_now = ''
    if Menu.IsEnabled(top_bar_panel_dev.on_off_roshan_position) then
        if GameRules.IsDayTime() then
            top_bar_panel_dev.total_data.roshan.position_now = ' [Низ]'
        else
            top_bar_panel_dev.total_data.roshan.position_now = ' [Вверх]'
        end
    end

    local max_health = 6000 + health_add * last_update
    if GameRules.GetGameState() == 5 then
        if top_bar_panel_dev.total_data.roshan.max_health ~= max_health then
            top_bar_panel_dev.total_data.roshan.max_health = max_health
        end
    end
    if top_bar_panel_dev.total_data.roshan.health == nil then
        top_bar_panel_dev.total_data.roshan.health = max_health
        top_bar_panel_dev.total_data.roshan.last_update = last_update
    end

    if top_bar_panel_dev.total_data.roshan.last_update == nil or top_bar_panel_dev.total_data.roshan.last_update < last_update then
        top_bar_panel_dev.total_data.roshan.last_update = last_update
        top_bar_panel_dev.total_data.roshan.health = top_bar_panel_dev.total_data.roshan.health + health_add
    end
    if top_bar_panel_dev.total_data.roshan.last_update_regen ~= last_update_regen then
        if top_bar_panel_dev.total_data.roshan.max_health and top_bar_panel_dev.total_data.roshan.health then
            local max_regen = top_bar_panel_dev.total_data.roshan.max_health - top_bar_panel_dev.total_data.roshan.health
            if max_regen >= 20 then
                top_bar_panel_dev.total_data.roshan.health = top_bar_panel_dev.total_data.roshan.health + 20
            else
                top_bar_panel_dev.total_data.roshan.health = top_bar_panel_dev.total_data.roshan.health + max_regen
            end
            top_bar_panel_dev.total_data.roshan.last_update_regen = last_update_regen
        end
    end

    local roshan_entity = Entities.Get(1, 'C_DOTA_Unit_Roshan')
    if Entity.IsEntity(roshan_entity) then
        top_bar_panel_dev.total_data.roshan.roshan_entity = roshan_entity
        if not Entity.IsDormant(roshan_entity) then
            top_bar_panel_dev.total_data.roshan.last_update = last_update
            top_bar_panel_dev.total_data.roshan.last_update_regen = last_update_regen
            top_bar_panel_dev.total_data.roshan.health = Entity.GetHealth(roshan_entity)
            top_bar_panel_dev.total_data.roshan.max_health = Entity.GetMaxHealth(roshan_entity)
        end
    end

    if top_bar_panel_dev.total_data.roshan.health and top_bar_panel_dev.total_data.roshan.max_health then
        top_bar_panel_dev.total_data.roshan.percente_health = math.ceil(top_bar_panel_dev.total_data.roshan.health/top_bar_panel_dev.total_data.roshan.max_health*100)
        if top_bar_panel_dev.total_data.roshan.percente_health > 100 then
            top_bar_panel_dev.total_data.roshan.percente_health = 100
        end
    end

    if top_bar_panel_dev.total_data.other_data.top_position then
        top_bar_panel_dev.total_data.roshan.position = top_bar_panel_dev.total_data.roshan.position or {}
        local start_pos_table = top_bar_panel_dev.total_data.other_data.top_position[5]
        local end_pos_table = top_bar_panel_dev.total_data.other_data.top_position[6]
        top_bar_panel_dev.total_data.roshan.position.x = math.ceil(start_pos_table.x + start_pos_table.w)
        top_bar_panel_dev.total_data.roshan.position.y = math.ceil(start_pos_table.y + start_pos_table.h)
        top_bar_panel_dev.total_data.roshan.position.w = math.ceil(end_pos_table.x - top_bar_panel_dev.total_data.roshan.position.x)
        top_bar_panel_dev.total_data.roshan.position.h = math.ceil(start_pos_table.h * 0.4)
        top_bar_panel_dev.total_data.roshan.position.x_text = math.ceil(top_bar_panel_dev.total_data.roshan.position.x+top_bar_panel_dev.total_data.roshan.position.w*0.5)
        top_bar_panel_dev.total_data.roshan.position.y_text = math.ceil(top_bar_panel_dev.total_data.roshan.position.y+top_bar_panel_dev.total_data.roshan.position.h*0.5)
    end
end


function top_bar_panel_dev.OnDrawHeroes()
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.heroes = top_bar_panel_dev.total_data.heroes or {}
    for hero_entity, hero_data in pairs(top_bar_panel_dev.total_data.heroes) do
        if Entity.IsEntity(hero_entity) and hero_data.top_position and hero_data.top_position.has_pos then
            local x = hero_data.top_position.x
            local y = hero_data.top_position.y
            local w = hero_data.top_position.w
            local h = hero_data.top_position.h

            do -- crips_stats
                if hero_data.top_position and hero_data.top_position.crips_stats_x and hero_data.top_position.crips_stats_y then
                    if (hero_data.lasthit and hero_data.lasthit > 0) or (hero_data.deny and hero_data.deny > 0) then
                        Renderer.SetDrawColor(255, 255, 255, 200)
                        Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.crips_stats_font, hero_data.top_position.crips_stats_x, hero_data.top_position.crips_stats_y, hero_data.lasthit .. '/'..hero_data.deny, 0)
                    end
                end
            end

            do -- health
                if hero_data.top_position.health_x then
                    if hero_data.health and hero_data.health > 0 then
                        Renderer.SetDrawColor(30, 30, 30, 200)
                        Renderer.DrawFilledRect(hero_data.top_position.health_x, hero_data.top_position.health_y, hero_data.top_position.health_w, hero_data.top_position.health_h)
                        if hero_data.percente_health > 0.75 then
                            Renderer.SetDrawColor(0, 255, 0, 200)
                        elseif hero_data.percente_health > 0.50 then
                            Renderer.SetDrawColor(100, 200, 0, 200)
                        elseif hero_data.percente_health > 0.25 then
                            Renderer.SetDrawColor(200, 100, 0, 200)
                        else
                            Renderer.SetDrawColor(255, 0, 0, 200)
                        end
                        if hero_data.top_position.health_percente_w then
                            Renderer.DrawFilledRect(hero_data.top_position.health_x, hero_data.top_position.health_y, hero_data.top_position.health_percente_w, hero_data.top_position.health_h)
                        end
                        if hero_data.top_position.health_text_x then
                            Renderer.SetDrawColor(255, 255, 255, 200)
                            Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.crips_stats_font, hero_data.top_position.health_text_x, hero_data.top_position.health_text_y, hero_data.health, 0)
                        end
                    end
                end
            end

            do -- mana
                if hero_data.top_position.mana_x then
                    if hero_data.mana and hero_data.mana > 0 then
                        Renderer.SetDrawColor(30, 30, 30, 200)
                        Renderer.DrawFilledRect(hero_data.top_position.mana_x, hero_data.top_position.mana_y, hero_data.top_position.mana_w, hero_data.top_position.mana_h)
                        Renderer.SetDrawColor(0, 0, 255, 200)
                        if hero_data.top_position.mana_percente_w then
                            Renderer.DrawFilledRect(hero_data.top_position.mana_x, hero_data.top_position.mana_y, hero_data.top_position.mana_percente_w, hero_data.top_position.mana_h)
                        end
                        if hero_data.top_position.mana_text_x then
                            Renderer.SetDrawColor(255, 255, 255, 200)
                            Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.crips_stats_font, hero_data.top_position.mana_text_x, hero_data.top_position.mana_text_y, hero_data.mana, 0)
                        end
                    end
                end
            end
            
            do -- buyback
                if hero_data.top_position.buyback_x then
                    if hero_data.time_buyback ~= nil and hero_data.time_buyback > top_bar_panel_dev.game_time then
                        Renderer.SetDrawColor(255, 255, 255, 200)
                        local time = KostyaUtils.TimeSecToNormal(hero_data.time_buyback - top_bar_panel_dev.game_time)
                        Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.crips_stats_font, hero_data.top_position.buyback_x, hero_data.top_position.buyback_y, time, 0)
                    end
                end
            end

            do -- ultimate
                if hero_data.top_position.ultimate_x then
                    if Entity.IsEntity(hero_data.ultimate_entity) then
                        if hero_data.ultimate_image ~= nil then
                            Renderer.SetDrawColor(255, 255, 255, 200)
                            Renderer.DrawImage(hero_data.ultimate_image, hero_data.top_position.ultimate_x, hero_data.top_position.ultimate_y, hero_data.top_position.ultimate_w, hero_data.top_position.ultimate_w)
                        end
                        if hero_data.ultimate_ready ~= nil then
                            if hero_data.ultimate_ready then
                                Renderer.SetDrawColor(0, 255, 0, 200)
                            else
                                Renderer.SetDrawColor(255, 0, 0, 200)
                            end
                            Renderer.DrawOutlineRect(hero_data.top_position.ultimate_x, hero_data.top_position.ultimate_y, hero_data.top_position.ultimate_w, hero_data.top_position.ultimate_w)
                        end
                        if hero_data.top_position.ultimate_text_x then
                            if hero_data.ultimate_cooldown_time_left ~= nil and hero_data.ultimate_cooldown_time_left > top_bar_panel_dev.game_time then
                                Renderer.SetDrawColor(255, 255, 255, 200)
                                Renderer.DrawTextCentered(top_bar_panel_dev.total_data.other_data.font, hero_data.top_position.ultimate_text_x, hero_data.top_position.ultimate_text_y, math.ceil(hero_data.ultimate_cooldown_time_left-top_bar_panel_dev.game_time), 0)
                            end
                        end
                    end
                    if hero_data.top_position.scepter_x then
                        local is_scepter_img = KostyaUtils.LoadingImgFullName('panorama/images/hud/reborn/aghsstatus_scepter_marker_psd.vtex_c')
                        if hero_data.is_scepter then
                            Renderer.SetDrawColor(0, 0, 255, 200)
                        else
                            Renderer.SetDrawColor(255, 255, 255, 200)
                        end
                        Renderer.DrawImage(is_scepter_img, hero_data.top_position.scepter_x, hero_data.top_position.scepter_y, hero_data.top_position.scepter_w, hero_data.top_position.scepter_w)

                        local is_shard_img = KostyaUtils.LoadingImgFullName('panorama/images/hud/reborn/aghsstatus_shard_marker_psd.vtex_c')
                        if hero_data.is_shard then
                            Renderer.SetDrawColor(0, 0, 255, 200)
                        else
                            Renderer.SetDrawColor(255, 255, 255, 200)
                        end
                        Renderer.DrawImage(is_shard_img, hero_data.top_position.scepter_x, hero_data.top_position.shard_y, hero_data.top_position.scepter_w, hero_data.top_position.scepter_w)
                    end
                end
            end

            do -- items
                if hero_data.items then
                    local items_count = #hero_data.items
                    local item_triger = 0
                    local pos_x = math.ceil(x)
                    local pos_y = math.ceil(y+h*1.5+w*0.51)
                    if not Menu.IsEnabled(top_bar_panel_dev.on_off_ult) then
                        pos_y = math.ceil(y+h*1.5)
                    elseif Menu.IsEnabled(top_bar_panel_dev.on_off_ult_alt) and not Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                        pos_y = math.ceil(y+h*1.5)
                    end
                    local size_x = math.ceil(w*0.32)
                    local size_y = math.ceil(h*0.32)

                    Renderer.SetDrawColor(255, 255, 255, 200)
                    for i, j in pairs(hero_data.items) do
                        if item_triger > 2 then
                            pos_x = math.ceil(x)
                            pos_y = math.ceil(pos_y+size_y)
                            item_triger = 0
                        end
                        item_triger = item_triger + 1

                        if item_triger == 1 then
                            if items_count == 1 then
                                pos_x = math.ceil(pos_x + size_x)
                            elseif items_count == 2 then
                                pos_x = math.ceil(pos_x + size_x*0.5)
                            end
                        end
                        items_count = items_count - 1

                        Renderer.DrawImage(j, pos_x, pos_y, size_x, size_y)
                        pos_x = math.ceil(pos_x + size_x)
                    end
                end
            end
        end
    end
end

function top_bar_panel_dev.OnUpdateHeroes()
    top_bar_panel_dev.triger_update_heroes = top_bar_panel_dev.triger_update_heroes or top_bar_panel_dev.os_clock
    if top_bar_panel_dev.triger_update_heroes > top_bar_panel_dev.os_clock then return end
    top_bar_panel_dev.triger_update_heroes = top_bar_panel_dev.os_clock + 0.5
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.heroes = top_bar_panel_dev.total_data.heroes or {}
    
    local delete_hero_entity = {}
    for hero_entity, hero_data in pairs(top_bar_panel_dev.total_data.heroes) do
        if not Entity.IsEntity(hero_entity) then
            table.insert (delete_hero_entity, hero_entity)
        else
            hero_data.top_position = hero_data.top_position or {}
            local top_position = top_bar_panel_dev.total_data.other_data.top_position[hero_data.team_slot]
            if top_position then
                local offset = math.ceil(top_position.w*0.07)
                hero_data.top_position = {
                    x = top_position.x + (hero_data.team_slot < 6 and offset or 0),
                    y = top_position.y,
                    h = top_position.h,
                    w = top_position.w - offset,
                    has_pos = true
                }
            end

            if Entity.IsHero(hero_entity) then
                local health = math.ceil(Entity.GetHealth(hero_entity))
                local max_health = math.ceil(Entity.GetMaxHealth(hero_entity))
                local mana = math.ceil(NPC.GetMana(hero_entity))
                local max_mana = math.ceil(NPC.GetMaxMana(hero_entity))
                if hero_data.health == nil or not hero_data.max_health == nil then
                    hero_data.health = health
                    hero_data.max_health = max_health
                    hero_data.percente_health = hero_data.health / hero_data.max_health
                end
                if hero_data.mana == nil or not hero_data.max_mana == nil then
                    hero_data.mana = mana
                    hero_data.max_mana = max_mana
                    hero_data.percente_mana = hero_data.mana / hero_data.max_mana
                end
                
                if Entity.IsEntity(hero_data.owner_player) then
                    local respawn_time = (Player.GetTeamData(hero_data.owner_player) or {}).respawnTime or -1
                    local saved_respawn_time = hero_data.respawn_time or -1
                    if respawn_time ~= saved_respawn_time then
                        -- Log.Write(Entity.GetClassName(hero_entity) .. ': respawn_time='..respawn_time .. ", " .. 'saved_respawn_time='..saved_respawn_time)
                        if respawn_time >= 0 then
                            hero_data.health = 0
                            hero_data.percente_health = 0
                            hero_data.mana = 0
                            hero_data.percente_mana = 0
                        else
                            hero_data.health = hero_data.max_health or 1
                            hero_data.percente_health = 1
                            hero_data.mana = hero_data.max_mana or 1
                            hero_data.percente_mana = 1
                        end
                        hero_data.respawn_time = respawn_time
                    end
                end

                local life_state = Hero.GetLifeState(hero_entity)
                if life_state ~= hero_data.life_state then
                    -- Log.Write(Entity.GetClassName(hero_entity) .. ': life_state='..tostring(life_state) .. ", " .. 'hero_data.life_state='..tostring(hero_data.life_state))
                    if not life_state then
                        hero_data.health = 0
                        hero_data.percente_health = 0
                        hero_data.mana = 0
                        hero_data.percente_mana = 0
                    else
                        hero_data.health = hero_data.max_health or 1
                        hero_data.percente_health = 1
                        hero_data.mana = hero_data.max_mana or 1
                        hero_data.percente_mana = 1
                    end
                    hero_data.life_state = life_state
                end

                hero_data.is_dormant = Entity.IsDormant(hero_entity)
                hero_data.is_alive = Entity.IsAlive(hero_entity)
                if not hero_data.is_dormant then
                    hero_data.is_shard = NPC.GetModifierConstantAdditive(hero_entity, Enum.ModifierFunction.MODIFIER_PROPERTY_IS_SHARD) > 0
                    hero_data.is_scepter = NPC.GetModifierConstantAdditive(hero_entity, Enum.ModifierFunction.MODIFIER_PROPERTY_IS_SCEPTER) > 0
                    if hero_data.is_alive then
                        hero_data.health = health
                        hero_data.max_health = max_health
                        hero_data.percente_health = hero_data.health / hero_data.max_health
                        hero_data.mana = mana
                        hero_data.max_mana = max_mana
                        hero_data.percente_mana = hero_data.mana / hero_data.max_mana
                    end

                    if Entity.IsEntity(hero_data.ultimate_entity) and Entity.IsAbility(hero_data.ultimate_entity) then
                        hero_data.ultimate_ready = true
                        if Ability.GetLevel(hero_data.ultimate_entity) < 1 then
                            hero_data.ultimate_ready = false
                        elseif not Ability.IsReady(hero_data.ultimate_entity) then
                            hero_data.ultimate_ready = false
                            hero_data.ultimate_cooldown_time_left = Ability.GetCooldownTimeLeft(hero_data.ultimate_entity) + top_bar_panel_dev.game_time
                        elseif Ability.GetManaCost(hero_data.ultimate_entity) > hero_data.mana then
                            hero_data.ultimate_ready = false
                        end
                    else
                        hero_data.ultimate_entity = nil
                    end
                end

                if not hero_data.ultimate_entity then
                    for i=0, 25, 1 do
                        local ability_entity = NPC.GetAbilityByIndex(hero_entity, i)
                        if Entity.IsEntity(ability_entity) and Ability.IsUltimate(ability_entity) and not Ability.IsHidden(ability_entity) then
                            hero_data.ultimate_entity = ability_entity
                            hero_data.ultimate_image = KostyaUtils.LoadingImg(ability_entity)
                            hero_data.ultimate_ready = false
                            hero_data.ultimate_cooldown_time_left = 0
                            break
                        end
                    end
                end

                do -- top items
                    hero_data.items = {}
                    if Menu.IsEnabled(top_bar_panel_dev.on_off_items) then
                        if not Menu.IsEnabled(top_bar_panel_dev.on_off_items_alt) or Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                            local itemChecks = {
                                ["item_rapier"] = top_bar_panel_dev.on_off_items_item_rapier,
                                ["item_gem"] = top_bar_panel_dev.on_off_items_item_gem,
                                ["item_ward_dispenser"] = top_bar_panel_dev.on_off_items_item_ward,
                                ["item_ward_dispenser_sentry"] = top_bar_panel_dev.on_off_items_item_ward,
                                ["item_ward_sentry"] = top_bar_panel_dev.on_off_items_item_ward,
                                ["item_ward_observer"] = top_bar_panel_dev.on_off_items_item_ward,
                                ["item_dust"] = top_bar_panel_dev.on_off_items_item_dust,
                                ["item_smoke_of_deceit"] = top_bar_panel_dev.on_off_items_item_smoke,
                                ["item_aegis"] = top_bar_panel_dev.on_off_items_item_aegis,
                                ["item_cheese"] = top_bar_panel_dev.on_off_items_item_cheese
                            }
                    
                            for i = 0, 8, 1 do
                                local item_entity = NPC.GetItemByIndex(hero_entity, i)
                                if Entity.IsEntity(item_entity) and Entity.IsAbility(item_entity) then
                                    local name_ability = Ability.GetName(item_entity)
                                    if itemChecks[name_ability] and Menu.IsEnabled(itemChecks[name_ability]) then
                                        table.insert(hero_data.items, KostyaUtils.LoadingImg(item_entity))
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            if Entity.IsEntity(hero_data.owner_player) and Entity.IsPlayer(hero_data.owner_player) then
                hero_data.lasthit = Player.GetLastHitCount(hero_data.owner_player) or 0
                hero_data.deny = Player.GetDenyCount(hero_data.owner_player) or 0
                local time_buyback = Player.GetBuybackCooldownTime(hero_data.owner_player) or 0
                if time_buyback > 0 then
                    hero_data.time_buyback = time_buyback
                end
            end

            do -- crips_stats position
                hero_data.top_position.crips_stats_x = nil
                hero_data.top_position.crips_stats_y = nil
                if Menu.IsEnabled(top_bar_panel_dev.on_off_crips_stats) then
                    if not Menu.IsEnabled(top_bar_panel_dev.on_off_crips_stats_alt) or Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                        if hero_data.top_position.has_pos then
                            hero_data.top_position.crips_stats_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w*0.5)
                            hero_data.top_position.crips_stats_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h*0.8)
                        end
                    end
                end
            end

            do -- health position
                hero_data.top_position.health_x = nil
                hero_data.top_position.health_y = nil
                hero_data.top_position.health_w = nil
                hero_data.top_position.health_h = nil
                hero_data.top_position.health_percente_w = nil
                hero_data.top_position.health_text_x = nil
                hero_data.top_position.health_text_y = nil
                if Menu.IsEnabled(top_bar_panel_dev.on_off_health) then
                    if not Menu.IsEnabled(top_bar_panel_dev.on_off_health_alt) or Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                        if hero_data.top_position.has_pos then
                            hero_data.top_position.health_x = math.ceil(hero_data.top_position.x)
                            hero_data.top_position.health_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h)
                            hero_data.top_position.health_w = math.ceil(hero_data.top_position.w)
                            hero_data.top_position.health_h = math.ceil(hero_data.top_position.h * 0.15)
                            if hero_data.percente_health ~= nil then
                                hero_data.top_position.health_percente_w = math.ceil(hero_data.top_position.w*hero_data.percente_health)
                            end
                            if not Menu.IsEnabled(top_bar_panel_dev.on_off_health_no_text) then
                                hero_data.top_position.health_text_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w * 0.75)
                                hero_data.top_position.health_text_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h + (hero_data.top_position.h * 0.15 * 0.5))
                            end
                        end
                    end
                end
            end

            do -- mana position
                hero_data.top_position.mana_x = nil
                hero_data.top_position.mana_y = nil
                hero_data.top_position.mana_w = nil
                hero_data.top_position.mana_h = nil
                hero_data.top_position.mana_percente_w = nil
                hero_data.top_position.mana_text_x = nil
                hero_data.top_position.mana_text_y = nil
                if Menu.IsEnabled(top_bar_panel_dev.on_off_mana) then
                    if not Menu.IsEnabled(top_bar_panel_dev.on_off_mana_alt) or Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                        if hero_data.top_position.has_pos then
                            hero_data.top_position.mana_x = math.ceil(hero_data.top_position.x)
                            hero_data.top_position.mana_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h * 1.2)
                            hero_data.top_position.mana_w = math.ceil(hero_data.top_position.w)
                            hero_data.top_position.mana_h = math.ceil(hero_data.top_position.h * 0.15)
                            if hero_data.percente_mana ~= nil then
                                hero_data.top_position.mana_percente_w = math.ceil(hero_data.top_position.w*hero_data.percente_mana)
                            end
                            if not Menu.IsEnabled(top_bar_panel_dev.on_off_mana_no_text) then
                                hero_data.top_position.mana_text_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w * 0.25)
                                hero_data.top_position.mana_text_y = math.ceil(hero_data.top_position.mana_y + (hero_data.top_position.h * 0.15 * 0.5))
                            end
                        end
                    end
                end
            end
            
            do -- buyback position
                hero_data.top_position.buyback_x = nil
                hero_data.top_position.buyback_y = nil
                hero_data.top_position.buyback_w = nil
                hero_data.top_position.buyback_h = nil
                if Menu.IsEnabled(top_bar_panel_dev.on_off_buyback) then
                    if not Menu.IsEnabled(top_bar_panel_dev.on_off_buyback_alt) or Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                        if hero_data.top_position.has_pos then
                            hero_data.top_position.buyback_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w * 0.5)
                            hero_data.top_position.buyback_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h * 0.2)
                        end
                    end
                end
            end

            do -- ultimate position
                hero_data.top_position.ultimate_x = nil
                hero_data.top_position.ultimate_y = nil
                hero_data.top_position.ultimate_w = nil
                hero_data.top_position.ultimate_h = nil
                hero_data.top_position.ultimate_text_x = nil
                hero_data.top_position.ultimate_text_y = nil
                hero_data.top_position.scepter_x = nil
                hero_data.top_position.scepter_y = nil
                hero_data.top_position.scepter_w = nil
                hero_data.top_position.shard_y = nil
                hero_data.top_position.scepter_h = nil
                if Menu.IsEnabled(top_bar_panel_dev.on_off_ult) then
                    if not Menu.IsEnabled(top_bar_panel_dev.on_off_ult_alt) or Input.IsKeyDown(Enum.ButtonCode.KEY_LALT) then
                        hero_data.top_position.ultimate_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w * 0.1)
                        hero_data.top_position.ultimate_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h * 1.5)
                        hero_data.top_position.ultimate_w = math.ceil(hero_data.top_position.w * 0.5)
                        hero_data.top_position.ultimate_h = math.ceil(hero_data.top_position.h * 0.5)
                        if not Menu.IsEnabled(top_bar_panel_dev.on_off_ult_scepter) then
                            hero_data.top_position.ultimate_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w * 0.25)
                        end
                        hero_data.top_position.ultimate_text_x = math.ceil(hero_data.top_position.ultimate_x + (hero_data.top_position.ultimate_w * 0.5))
                        hero_data.top_position.ultimate_text_y = math.ceil(hero_data.top_position.ultimate_y + (hero_data.top_position.ultimate_w * 0.5))

                        if Menu.IsEnabled(top_bar_panel_dev.on_off_ult_scepter) then
                            hero_data.top_position.scepter_x = math.ceil(hero_data.top_position.x + hero_data.top_position.w * 0.65)
                            hero_data.top_position.scepter_y = hero_data.top_position.ultimate_y
                            hero_data.top_position.shard_y = math.ceil(hero_data.top_position.y + hero_data.top_position.h * 1.9)
                            hero_data.top_position.scepter_w = math.ceil(hero_data.top_position.w * 0.3)
                        end
                    end
                end
            end
        end
    end

    for _, hero_entity in pairs(delete_hero_entity) do
        top_bar_panel_dev.total_data.heroes[hero_entity] = nil
    end
end

function top_bar_panel_dev.OnCreateHeroes()
    top_bar_panel_dev.triger_create_heroes = top_bar_panel_dev.triger_create_heroes or top_bar_panel_dev.os_clock
    if top_bar_panel_dev.triger_create_heroes > top_bar_panel_dev.os_clock then return end
    top_bar_panel_dev.triger_create_heroes = top_bar_panel_dev.os_clock + 5
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}

    top_bar_panel_dev.total_data.heroes = top_bar_panel_dev.total_data.heroes or {}
    local all_players = Players.GetAll()
    for _, player_entity in pairs(all_players) do
        if Entity.IsEntity(player_entity) then
            local hero_entity = Player.GetAssignedHero(player_entity)
            if Entity.IsEntity(hero_entity) and not top_bar_panel_dev.total_data.heroes[hero_entity] then
                local team_slot = Player.GetTeamSlot(player_entity)
                team_slot = Entity.GetTeamNum(hero_entity) == 2 and team_slot + 1 or team_slot + 6

                local respawn_time = (Player.GetTeamData(player_entity) or {}).respawnTime or -1

                top_bar_panel_dev.total_data.heroes[hero_entity] = {
                    team_slot = team_slot,
                    owner_player = player_entity,
                    time_buyback = 0,
                    is_shard = false,
                    is_scepter = false,
                    items = {},
                }
            end
        end
    end
end



function top_bar_panel_dev.dota_buyback(event)
    if event.name ~= 'dota_buyback' then return end
    local data = event.data
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.heroes = top_bar_panel_dev.total_data.heroes or {}
    for hero_entity, hero_data in pairs(top_bar_panel_dev.total_data.heroes) do
        if Entity.IsEntity(hero_data.owner_player) then
            if data.player_id == Player.GetPlayerID(hero_data.owner_player) then
                hero_data.time_buyback = GameRules.GetGameTime() + 480
                break
            end
        end
    end
end
function top_bar_panel_dev.dota_roshan_kill(event)
    if event.name ~= 'dota_roshan_kill' then return end
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.roshan = top_bar_panel_dev.total_data.roshan or {}
    top_bar_panel_dev.total_data.roshan.dota_roshan_kill = GameRules.GetGameTime() + 660
end
function top_bar_panel_dev.aegis_event(event)
    if event.name ~= 'aegis_event' then return end
    if event.data['chat_message_type'] == 8 and event.data['chat_message_type'] == 53 then return end
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.roshan = top_bar_panel_dev.total_data.roshan or {}
    top_bar_panel_dev.total_data.roshan.aegis_event = GameRules.GetGameTime() + 300
end
function top_bar_panel_dev.entity_hurt(event)
    if event.name ~= 'entity_hurt' then return end
    local data = event.data
    local entindex_killed = Entities.GetEntityByIndex(data.entindex_killed)
    if not Entity.IsEntity(entindex_killed) then return end
    if not Entity.IsDormant(entindex_killed) then return end
    if not Entity.IsNPC(entindex_killed) then return end
    if not NPC.IsRoshan(entindex_killed) then return end
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.roshan = top_bar_panel_dev.total_data.roshan or {}
    top_bar_panel_dev.total_data.roshan.health = top_bar_panel_dev.total_data.roshan.health or 0
    top_bar_panel_dev.total_data.roshan.health = top_bar_panel_dev.total_data.roshan.health - data.damage
end
function top_bar_panel_dev.OnGameEvent(event)
    top_bar_panel_dev.dota_buyback(event)
    top_bar_panel_dev.dota_roshan_kill(event)
    top_bar_panel_dev.aegis_event(event)
    top_bar_panel_dev.entity_hurt(event)
end


function top_bar_panel_dev.roshan_spawn(particle)
    if particle.name ~= "roshan_spawn" then return end
    top_bar_panel_dev.total_data = top_bar_panel_dev.total_data or {}
    top_bar_panel_dev.total_data.roshan = top_bar_panel_dev.total_data.roshan or {}
    top_bar_panel_dev.total_data.roshan.aegis_event = 0
    top_bar_panel_dev.total_data.roshan.dota_roshan_kill = 0
    if top_bar_panel_dev.total_data.roshan.max_health then
        top_bar_panel_dev.total_data.roshan.health = top_bar_panel_dev.total_data.roshan.max_health
    end
end
function top_bar_panel_dev.OnParticleCreate(particle)
    top_bar_panel_dev.roshan_spawn(particle)
end


function top_bar_panel_dev.OnInit()
    top_bar_panel_dev.total_data = {}
end


function top_bar_panel_dev.dota_buyback_panarama(event)
    if event.name ~= 'DOTAChatMessagePrintf' then return end

    local data = event.GetArguments()
    if not data then return end

    local DOTA_Chat_BuyBack_text = string.gsub(Localize.Find("DOTA_Chat_BuyBack") or '', "%%s1 ", "")
    if not string.find(tostring(data[1]), tostring(DOTA_Chat_BuyBack_text)) then return end

    for _, hero_data in pairs(top_bar_panel_dev.total_data.heroes) do
        if Entity.IsEntity(hero_data.owner_player) and data[2] == Player.GetPlayerID(hero_data.owner_player) then
            hero_data.time_buyback = GameRules.GetGameTime() + 480
            break
        end
    end
end

function top_bar_panel_dev.OnPanoramaUIEvent(event)
    if not Menu.IsEnabled(top_bar_panel_dev.on_off_script_triger) then return end
    KostyaUtils.PanaramaUIParser(event, "top")
    
    local panarama_is_open = KostyaUtils.PanaramaIsOpen(event)
    if panarama_is_open ~= nil then
        top_bar_panel_dev.shop_is_open = panarama_is_open
    end
    top_bar_panel_dev.dota_buyback_panarama(event)
end

return top_bar_panel_dev