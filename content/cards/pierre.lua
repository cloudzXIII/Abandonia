SMODS.Joker {
    key = 'pierre',
    rarity = 2,
    atlas = 'ABNJokerSheet26', 
    pos = { x = 5, y = 0 }, 
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            common_mult = 8,
            uncommon_mult = 10,
            rare_mult = 30,
            legendary_mult = 80,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.common_mult,
                card.ability.extra.uncommon_mult,
                card.ability.extra.rare_mult,
                card.ability.extra.legendary_mult,
                card.ability.extra.mult
            }
        }
    end,

    update = function(self, card, dt)
        if G.jokers and G.jokers.cards and #G.jokers.cards > 0 and G.jokers.cards[#G.jokers.cards] ~= card then
            for i, jkr in ipairs(G.jokers.cards) do
                if jkr == card then
                    table.remove(G.jokers.cards, i)
                    table.insert(G.jokers.cards, card)
                    G.jokers:set_ranks()
                    break
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.post_trigger and context.other_card and context.other_card.ability and context.other_card.ability.set == 'Joker' and context.other_card.config.center and context.other_card.config.center.key and context.other_card.config.center.key ~= 'j_abn_percy' then
            local my_pos = nil
            local other_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i end
                if G.jokers.cards[i] == context.other_card then other_pos = i end
            end

            if my_pos and other_pos and other_pos < my_pos then
                local rarity = context.other_card.config.center.rarity
                local mult_gain = 0

                if rarity == 1 or rarity == 'Common' then
                    mult_gain = card.ability.extra.common_mult
                elseif rarity == 2 or rarity == 'Uncommon' then
                    mult_gain = card.ability.extra.uncommon_mult
                elseif rarity == 3 or rarity == 'Rare' then
                    mult_gain = card.ability.extra.rare_mult
                elseif rarity == 4 or rarity == 'Legendary' then
                    mult_gain = card.ability.extra.legendary_mult
                end

                if mult_gain > 0 then
                    card.ability.extra.mult = card.ability.extra.mult + mult_gain
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    })
                end
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.repetition and context.cardarea == G.play then
            if next(SMODS.find_card("j_percy")) or next(SMODS.find_card("j_abn_percy")) then
                local unique_rarities = {}
                local retriggers = 0

                if G.jokers and G.jokers.cards then
                    for _, jkr in ipairs(G.jokers.cards) do
                        local r = jkr.config.center.rarity
                        if r and not unique_rarities[r] then
                            unique_rarities[r] = true
                            retriggers = retriggers + 1
                        end
                    end
                end

                if retriggers > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = retriggers,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "La Ginger"
    }
}