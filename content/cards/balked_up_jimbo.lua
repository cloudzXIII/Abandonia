-- Coded by Okronix
SMODS.Joker {
    key = 'balked_up_jimbo',
    rarity = 3,
    atlas = 'ABNBalkedUpJimbo',
    pixel_size = { w = 284, h = 190 },
    display_size = { w = 284 * 0.5, h = 190 * 0.5 },
    pos = { x = 0, y = 0 },
    cost = 10,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { mult = 10 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra_slots_used = 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        card.ability.extra_slots_used = 0
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local play_amount = G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played or 1

            return {
                mult = card.ability.extra.mult * play_amount
            }
        end
    end,

    abn_artist_credits = {
        artist = "Null",
    },
}