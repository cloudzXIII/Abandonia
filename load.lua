local abandonia_loading_bg = nil
local abandonia_loading_bg_tried = false
local abandonia_cat = nil
local abandonia_cat_tried = false
local abandonia_fonts = {}
local abandonia_mod_folder = nil

local function abandonia_find_asset_path(relative_path)
    if not abandonia_mod_folder then
        pcall(function()
            local lovely = require("lovely")
            for _, entry in ipairs(NFS.getDirectoryItems(lovely.mod_dir)) do
                local candidate = lovely.mod_dir .. "/" .. entry
                local info = NFS.getInfo(candidate .. "/load.lua")
                if info and info.type == "file" then
                    abandonia_mod_folder = candidate
                    break
                end
            end
        end)
    end
    if not abandonia_mod_folder then return nil end
    return abandonia_mod_folder .. "/" .. relative_path
end

local function abandonia_load_image(relative_path, name)
    local image = nil
    pcall(function()
        local path = abandonia_find_asset_path(relative_path)
        local file = path and io.open(path, "rb")
        if file then
            local contents = file:read("*all")
            file:close()
            image = love.graphics.newImage(love.filesystem.newFileData(contents, name))
        end
    end)
    return image
end

local function abandonia_get_font(size)
    size = math.max(8, math.floor(size))
    if not abandonia_fonts[size] then
        abandonia_fonts[size] = love.graphics.newFont("resources/fonts/m6x11plus.ttf", size)
    end
    return abandonia_fonts[size]
end

local function abandonia_get_cat()
    if not abandonia_cat_tried then
        abandonia_cat_tried = true
        abandonia_cat = abandonia_load_image("assets/cat.png", "cat.png")
        if abandonia_cat then
            abandonia_cat:setFilter("nearest", "nearest")
        end
    end
    return abandonia_cat
end

-- Full-screen background ("cover" scaling: fills the window, no stretching)
function abandonia_loading_bg_draw()
    if not abandonia_loading_bg_tried then
        abandonia_loading_bg_tried = true
        abandonia_loading_bg = abandonia_load_image("assets/loadscreen.png", "loadscreen.png")
    end
    if not abandonia_loading_bg then return end

    local window_width, window_height = love.graphics.getDimensions()
    local image_width, image_height = abandonia_loading_bg:getDimensions()
    local scale = math.max(window_width / image_width, window_height / image_height)
    local offset_x = (window_width - image_width * scale) / 2
    local offset_y = (window_height - image_height * scale) / 2
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(abandonia_loading_bg, offset_x, offset_y, 0, scale, scale)
end

-- Bar, LOADING... text, cat and the abandonia badge
function abandonia_loading_screen_draw(progress, step_name)
    local window_width, window_height = love.graphics.getDimensions()
    local previous_font = love.graphics.getFont()
    progress = math.max(0, math.min(1, progress or 0))

    -- Layout: cat at the bottom left, bar and text to its right
    local bar_height = math.max(6, window_height * 0.018)
    local bar_y = window_height * 0.925
    local cat_size = window_height * 0.15
    local cat_x = window_width * 0.012
    local cat_y = bar_y + bar_height - cat_size
    local content_x = cat_x + cat_size + window_width * 0.015
    local bar_width = window_width * 0.95 - content_x

    -- abandonia's own cat.png
    local cat = abandonia_get_cat()
    if cat then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(cat, cat_x, cat_y, 0,
            cat_size / cat:getWidth(), cat_size / cat:getHeight())
        love.graphics.setLineWidth(3)
        love.graphics.rectangle("line", cat_x, cat_y, cat_size, cat_size, 5)
    end

    -- Progress bar along the bottom
    love.graphics.setColor(0, 0, 0, 0.35)
    love.graphics.rectangle("fill", content_x, bar_y, bar_width, bar_height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", content_x, bar_y, bar_width * progress, bar_height)

    -- "LOADING." -> "LOADING.." -> "LOADING..." above the bar
    local loading_font = abandonia_get_font(window_height * 0.06)
    love.graphics.setFont(loading_font)
    local dot_count = math.floor(love.timer.getTime() / 0.4) % 3 + 1
    local label = "LOADING" .. string.rep(".", dot_count)
    local text_y = bar_y - loading_font:getHeight() - window_height * 0.01
    love.graphics.setColor(0, 0, 0, 0.6)
    love.graphics.print(label, content_x + 3, text_y + 3)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(label, content_x, text_y)

    -- Yellow "abandonia" badge, top right
    local badge_width = window_width * 0.15
    local badge_height = window_height * 0.075
    local badge_x = window_width - badge_width - window_width * 0.035
    local badge_y = window_height * 0.005
    local skew = badge_height * 0.06
    love.graphics.setColor(1, 0.85, 0.05, 1)
    love.graphics.polygon("fill",
        badge_x, badge_y + skew,
        badge_x + badge_width, badge_y,
        badge_x + badge_width, badge_y + badge_height - skew,
        badge_x, badge_y + badge_height)
    local badge_font = abandonia_get_font(badge_height * 0.55)
    love.graphics.setFont(badge_font)
    love.graphics.setColor(0.08, 0.08, 0.08, 1)
    love.graphics.printf("ABANDONIA", badge_x, badge_y + (badge_height - badge_font:getHeight()) / 2,
        badge_width, "center")

    love.graphics.setColor(1, 1, 1, 1)
    if previous_font then love.graphics.setFont(previous_font) end
end