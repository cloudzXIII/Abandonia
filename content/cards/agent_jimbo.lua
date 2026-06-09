SMODS.Joker {
    key = 'agent_jimbo',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 6, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            xchips = 1,
            xchipsadd = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xchipsadd,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.shop_card_cost and not context.blueprint then
            local shop_card = context.card
            if shop_card.ability.set ~= 'Jokers' and shop_card.ability.set ~= 'Default' and shop_card.ability.set ~= 'Enhanced' and shop_card.ability.set ~= 'Voucher' then
                return {
                    cost = shop_card.cost * 2
                }
            end
        end

        if context.buying_card and context.card and context.card.ability.set ~= 'Jokers' and context.card.ability.set ~= 'Default' and context.card.ability.set ~= 'Enhanced' and context.card.ability.set ~= 'Voucher' then
            local bought_card = context.card
    
            if not bought_card.edition then
                local random_edition = nil
                
                repeat
                    random_edition = poll_edition('agent_jimbo_edition', nil, false, true)
                until not (random_edition and (random_edition.key == 'e_negative' or random_edition.negative))
                
                if random_edition then
                    bought_card:set_edition(random_edition)
                end
            end
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 6 then
                
                local unique_sets = {}
                local unique_count = 0
                
                if G.consumeables and G.consumeables.cards then
                    for _, c in ipairs(G.consumeables.cards) do
                        if c.ability and c.ability.set and c.edition then
                            if not unique_sets[c.ability.set] then
                                unique_sets[c.ability.set] = true
                                unique_count = unique_count + 1
                            end
                        end
                    end
                end

                if unique_count > 0 then
                    card.ability.extra.xchips = card.ability.extra.xchips + (card.ability.extra.xchipsadd * unique_count)
                    
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
        
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips,
            }
        end
    end,
    
    abn_artist_credits = {
        artist = "IPreferCheddar",
    },
}