-- Coded by Okronix
SMODS.Joker {
    key = 'agent_of_fate',
    rarity = 2,
    atlas = 'ABNJokerSheet15',
    pos = { x = 1, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { active = true }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_abn_wheel_of_fate']
        main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = card.ability.extra.active and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. (card.ability.extra.active and 'active' or 'inactive') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        if card.area and card.area == G.jokers then
            return { main_end = main_end }
        end
    end,

    calculate = function(self, card, context)
        if card.ability.extra.active and context.mod_probability then
			return {
				denominator = 1,
			}
		end

        if context.using_consumeable and context.consumeable.config.center.key == "c_abn_wheel_of_fate" then
            card.ability.extra.active = false
        end
    end,

    abn_artist_credits = {
        artist = "Toyrapple",
    },
}