SMODS.Joker {
    key = 'the_feast',
    rarity = 3,
    atlas = 'AbandoniaTeamJokers',
    pos = { x = 2, y = 0 },
    cost = 8,
    abn_coder = "LasagnaFelidae",
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    config = {
        extra = {
            xmult_mod = 0.2,
            xchips_mod = 0.4,
            xmult = 1,
            xchips = 1,
        }
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xchips_mod,
                card.ability.extra.xmult,
                card.ability.extra.xchips,
            },
        }
    end,

    
    is_food_joker = function(card)
        return card and (card:has_attribute('food') or (card.config.center.pools or {}).Food)
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.cardarea == G.jokers and not context.blueprint then
            local bought = context.card
            bought.ability.round_added = G.GAME.round
            if self.is_food_joker(bought) and bought.config and bought.config.center and bought.config.center.key then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = SMODS.add_card({
                            set = "Joker", 
                            key = bought.config.center.key, 
                            area = G.jokers, 
                            edition = "e_negative"
                        })
                        new_card.ability.round_added = G.GAME.round
                        return true
                    end
                }))
                return {
                    message = "Copy!",
                    colour = G.C.DARK_EDITION
                }
            end
        end
        
        if context.selling_card and context.cardarea == G.jokers and not context.blueprint then
            local sold = context.card
            if self.is_food_joker(sold) then
                local rounds_held = (G.GAME.round - (sold.ability.round_added or G.GAME.round))
                rounds_held = math.max(1, rounds_held)
                SMODS.scale_card(card,{
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_mod",
                    scalar_factor = rounds_held,
                    message_key = 'a_xmult',
					message_colour = G.C.RED,
                })
            end
        end
        
        if context.joker_type_destroyed and context.card and not context.blueprint then
            local destroyed = context.card
            if self.is_food_joker(destroyed) then
                local rounds_held = (G.GAME.round - (destroyed.ability.round_added or G.GAME.round))
                rounds_held = math.max(1, rounds_held)
                
                SMODS.scale_card(card,{
                    ref_table = card.ability.extra,
                    ref_value = "xchips",
                    scalar_value = "xchips_mod",
                    scalar_factor = rounds_held,
                    message_key = 'a_xchips',
					message_colour = G.C.BLUE,
                })
            end
        end
        
        if context.joker_main then
            local ret = {}
            if card.ability.extra.xmult > 1 then
                ret.xmult = card.ability.extra.xmult
            end
            if card.ability.extra.xchips > 1 then
                ret.xchips = card.ability.extra.xchips
            end
            return ret
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            for index, j in ipairs(G.jokers.cards) do
                if self.is_food_joker(j) then
                    j.ability.round_added = G.GAME.round
                end
            end
        end
    end,
    
    abn_artist_credits = {
        artist = "Comykel",
    },
}