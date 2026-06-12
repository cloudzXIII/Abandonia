SMODS.Joker {
    key = "tlumddo",
    name = "Tlumddo Joker",
    config = {
        extra = {
            perma_mult = 9,
            perma_chips = 33
        }
    },
    pos = { x = 8, y = 5 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    atlas = "ABNJokerSheet11",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.perma_mult,
                card.ability.extra.perma_chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local other_card = context.other_card
            local enhancements = SMODS.get_enhancements(other_card)
            local is_bonus = enhancements and enhancements.m_bonus
            if is_bonus then
                local id = other_card:get_id()
                local is_odd = (id <= 10 and id >= 0 and id % 2 == 1) or (id == 14)
                for _, scored_card in ipairs(context.scoring_hand) do
                    local scored_enhancements = SMODS.get_enhancements(scored_card)
                    local scored_is_bonus = scored_enhancements and scored_enhancements.m_bonus
                    if not scored_is_bonus then
                        scored_card.ability.perma_mult = (scored_card.ability.perma_mult or 0) + card.ability.extra.perma_mult
                        if is_odd then
                            scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) + card.ability.extra.perma_chips
                        end
                    end
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "Inky",
    },
}