SMODS.Joker {
    key = 'colour_vortex',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,

    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 9, y = 2 },
    cost = 4,
    discovered = true,
    blueprint_compat = true,

    config = { extra = { x_mult = 3, poker_hand = "Flush" } },

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand and G.GAME.current_round.hands_played == 0 then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,
    abn_artist_credits = {
        artist = "Fridgemancer"
    },
}
