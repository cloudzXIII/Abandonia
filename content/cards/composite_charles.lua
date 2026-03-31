-- Composite Charles
-- Coded by J8-Bit
-- Each played 4, 6, 8, 9 or 10 gives X1.8 Chips when scored


SMODS.Joker {
    key = 'composite_charles',

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            ranks = { "4", "6", "8", "9", "10" },
            x_chips = 1.8,
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.ranks[1], 'ranks'),
                localize(card.ability.extra.ranks[2], 'ranks'),
                localize(card.ability.extra.ranks[3], 'ranks'),
                localize(card.ability.extra.ranks[4], 'ranks'),
                localize(card.ability.extra.ranks[5], 'ranks'),
                card.ability.extra.x_chips,
            }
        }
    end,
    rarity = 1,
    cost = 4,
    atlas = 'AbandoniaJokers',
    pos = { x = 4, y = 22 },
    discovered = false,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local is_rank = false
            for index, rank in ipairs(card.ability.extra.ranks) do
                if context.other_card:get_id() == SMODS.Ranks[rank].id then
                    is_rank = true
                    break
                end
            end
            if is_rank then
                return {
                    x_chips = card.ability.extra.x_chips,
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Modlich_303"
    },
}
