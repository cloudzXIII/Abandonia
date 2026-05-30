
SMODS.Joker {
    key = 'baba_joker',
    abn_coder = "LasagnaFelidae",
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.chips, card.ability.extra.mult,
                    card.ability.extra.chips * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report or 0), 
                card.ability.extra.mult *(G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report or 0)
            } 
        }
    end,
    
    rarity = 2,
    atlas = 'placeholder',
    pos = { x = 2, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { chips = 10, mult = 3 } },
    calculate = function(self, card, context)
        if context.selling_card and context.card.config.center.consumeable and context.card.config.center.set == "weather_report" then
            context.card:set_cost()
        end
        if (context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "weather_report") or (context.destroy_card and context.cardarea == G.consumeables and context.destroy_card.config.center.consumeable and context.destroy_card.config.center.set == "weather_report") then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.consumeable_usage_total.weather_report * card.ability.extra.mult } },
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips *
                (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report or 0),
                mult = card.ability.extra.mult *
                (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report or 0)
            }
        end
    end,
    abn_artist_credits = {
        artist = "Swizik",
    },
    in_pool = function(self)
        return (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report or 0) > 0
    end
}
