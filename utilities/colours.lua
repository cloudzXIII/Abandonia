local registered_colors = {}
local lc = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        lc()
    end
    for i, v in pairs(registered_colors) do
        local colour = v
        local this_colour = colour
        if type(colour) == "function" then
            local ret = colour()
            this_colour = ret
        end
        G.ARGS.LOC_COLOURS[i] = this_colour
    end
    return lc(_c, _default)
end

local function register_color(id, color, ignore_colour_global)
    if ignore_colour_global ~= true then
        G.C[id] = color
    end
    if ignore_colour_global == true then
        registered_colors[id] = color
    else
        registered_colors[id] = function()
            return G.C[id]
        end
    end
end
register_color("abn_vintage", HEX("989692"))

-- removed the suits as these are available by default, just do C:abn_penumbra or C:abn_chalice etc.
