SMODS.Joker {
    key = 'balatro_university',
    loc_txt = {
        ['en-us'] = {
            unlock = {
                "?????",
            },
        }
    },
    rarity = 4,
    atlas = 'AbandoniaLegendary',
    pos = { x = 4, y = 5 },
    soul_pos = { x = 5, y = 5 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { mult = 5, chips = 10, dollars = 0 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_abn_lucrative_joker
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,

    update = function(self, card)
        if card.area == G.jokers then
            if G.GAME.blind and G.GAME.blind.chips and G.GAME.blind.chips >= 1 then
                if G.GAME.dollars > card.ability.extra.dollars then
                    card.ability.extra.dollars = G.GAME.dollars
                    for i = 1, #G.jokers.cards do
                        local j = G.jokers.cards[i]

                        -- Gain chips and mult
                        j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
                        j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
                    end
                end
            else
                card.ability.extra.dollars = G.GAME.dollars
            end
        end
    end,

    calculate = function(self, card, context)
        -- Level up hand if it contains a Gold Card
        if context.before and not context.blueprint then
            local contains_gold_card = false
            for i = 1, #context.full_hand do
                -- Check for Gold Enhancement and lucrative joker
                if context.full_hand[i].config.center == G.P_CENTERS.m_gold and next(SMODS.find_card("j_abn_lucrative_joker")) then
                    contains_gold_card = true
                    break
                end
            end

            if contains_gold_card then
                return {
                    level_up = true,
                    message = localize('k_level_up_ex'),
                    card = card
                }
            end
        end

        -- Retrigger Gold Seals
        if context.repetition and context.cardarea == G.play then
            if context.other_card.seal and context.other_card.seal == 'Gold' and next(SMODS.find_card("j_abn_slot_machine")) then
                return {
                    repetitions = 1,
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Long Rooster",
    },
}
