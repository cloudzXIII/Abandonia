SMODS.Joker {
    key = 'dryeraser_board',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, localize('Spades', 'suits_plural') } }
    end,

    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 6, y = 8 },
    cost = 6,
    discovered = true,
    blueprint_compat = true,

    config = { extra = { x_mult = 3 } },

    calculate = function(self, card, context)
        if context.joker_main then
            local all_spades = true
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card:is_suit('Spades', nil, true) then
                    all_spades = false
                    break
                end
            end
            for _, playing_card in ipairs(context.full_hand) do
                if not playing_card:is_suit('Spades', nil, true) then
                    all_spades = false
                    break
                end
            end
            if all_spades then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Flowr"
    },
}
