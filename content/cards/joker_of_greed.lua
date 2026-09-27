-- Coded by Okronix
SMODS.Joker {
    key = 'joker_of_greed',
    rarity = 1,
    atlas = 'ABNJokerSheet26',
    pos = { x = 7, y = 6 },
    cost = 8,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { extra_cards = 2, first_hand_drawn = false }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.extra_cards
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.first_hand_drawn = true
        end

        if context.drawing_cards and not context.blueprint then
            if not card.ability.extra.first_hand_drawn then
                return {cards_to_draw = context.amount + context.amount * card.ability.extra.extra_cards}
            end
            card.ability.extra.first_hand_drawn = false
        end
    end,

    abn_artist_credits = {
        artist = "Sebm",
    },
}