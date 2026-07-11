local registered_colors = {}
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
    for i,v in pairs(registered_colors) do
        local colour = v
        local this_colour = colour
        if type(colour) == "function" then
            local ret = colour()
            this_colour=ret
        end
        G.ARGS.LOC_COLOURS[i] = this_colour
    end
	return lc(_c, _default)
end
local function register_color(id,color,ignore_colour_global)
    if ignore_colour_global ~= true then
        G.C[id] = color
    end
    if ignore_colour_global == true then
        registered_colors[id] = color
    else
        registered_colors[id] = function ()
            return G.C[id]
        end
    end
end
register_color("abn_vintage",HEX("989692"))
register_color("abn_coins",HEX("f0ba3f"))
register_color("abn_batons",HEX("235945"))
register_color("abn_chalice",HEX("f0349c"))
register_color("abn_swords",HEX("3c5168"))
register_color("abn_snow",HEX("5dacdf"))
register_color("abn_penumbra",HEX("8570c7"))
register_color("abn_suitless",HEX("8d9fa3"))
register_color("abn_tie",HEX("82e888"))
register_color("abn_bow",HEX("3f2c6d"))
register_color("abn_shield",HEX("395c8b"))
register_color("abn_rose",HEX("f2db51"))
register_color("abn_leaf",HEX("764a76"))
register_color("abn_goblet",HEX("5edb61"))