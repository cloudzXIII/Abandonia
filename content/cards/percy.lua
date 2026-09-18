SMODS.Joker {
    key = 'percy',
    rarity = 2,
    atlas = 'ABNJokerSheet26', 
    pos = { x = 6, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            common_chips = 10,
            uncommon_chips = 20,
            rare_chips = 40,
            legendary_chips = 100,
            chips = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.common_chips,
                card.ability.extra.uncommon_chips,
                card.ability.extra.rare_chips,
                card.ability.extra.legendary_chips,
                card.ability.extra.chips
            }
        }
    end,

    update = function(self, card, dt)
        if G.jokers and G.jokers.cards and G.jokers.cards[1] ~= card then
            for i, jkr in ipairs(G.jokers.cards) do
                if jkr == card then
                    table.remove(G.jokers.cards, i)
                    table.insert(G.jokers.cards, 1, card)
                    G.jokers:set_ranks()
                    break
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.post_trigger and context.other_card and context.other_card.ability and context.other_card.ability.set == 'Joker' and context.other_card.config.center and context.other_card.config.center.key and context.other_card.config.center.key ~= 'j_abn_pierre' then
            local my_pos = nil
            local other_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i end
                if G.jokers.cards[i] == context.other_card then other_pos = i end
            end

            if my_pos and other_pos and other_pos > my_pos then
                local rarity = context.other_card.config.center.rarity
                local chip_gain = 0

                if rarity == 1 or rarity == 'Common' then
                    chip_gain = card.ability.extra.common_chips
                elseif rarity == 2 or rarity == 'Uncommon' then
                    chip_gain = card.ability.extra.uncommon_chips
                elseif rarity == 3 or rarity == 'Rare' then
                    chip_gain = card.ability.extra.rare_chips
                elseif rarity == 4 or rarity == 'Legendary' then
                    chip_gain = card.ability.extra.legendary_chips
                end

                if chip_gain > 0 then
                    card.ability.extra.chips = card.ability.extra.chips + chip_gain
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS
                    })
                end
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.retrigger_joker_check and not context.retrigger_joker then
            if next(SMODS.find_card("j_abn_pierre")) then
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