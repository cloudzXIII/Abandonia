-- Coded by Okronix
SMODS.Joker {
    key = 'clown_crayons',
    rarity = 3,
    atlas = 'ABNJokerSheet26',
    pos = { x = 7, y = 5 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { xmult = 1, xmult_gain = 0.4 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.before and not context.blueprint then
            local suits_found = {}
            local modded_suits_count = 0

            for i = 1, #context.full_hand do
                local suit = context.full_hand[i].base.suit
                if ABN.is_modded_suit(context.full_hand[i]) and not suits_found[suit] then
                    suits_found[suit] = true
                    modded_suits_count = modded_suits_count + 1
                end
            end

            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_table = card.ability.extra.xmult_gain * modded_suits_count,
                operation = '+',
                message_colour = G.C.MULT
            })
        end
    end,

    in_pool = function(self, args)
        return G.GAME.abn.modded_suits_played > 0
    end,

    abn_artist_credits = {
        artist = "IIye",
    },
}