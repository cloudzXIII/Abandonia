SMODS.Joker {
    key = 'joker_form',

    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 4, y = 31 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra={
            chips=16,
            mult=4,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.chips,card.ability.extra.mult
            },
        }
    end,


    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 8 or context.other_card:get_id() == 2 then
                return {
                    chips=card.ability.extra.chips,
                    mult=card.ability.extra.mult,
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "DrSmey",
    },
}
