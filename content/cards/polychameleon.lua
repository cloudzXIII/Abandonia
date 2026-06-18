SMODS.Joker({
    key = 'polychameleon',
    rarity = 3,
    atlas = 'ABNJokerSheet3',
    pos = { x = 6, y = 0 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { 
        extra = { 
            holo_xmult = 2,        
            poly_mult = 40,        
            holo_gain_xchips = 0.3,
            poly_gain_chips = 50,  
            chips = 0,             
            xchips = 1             
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.holo_xmult, 
                card.ability.extra.poly_mult, 
                card.ability.extra.holo_gain_xchips, 
                card.ability.extra.poly_gain_chips,
                card.ability.extra.chips,
                card.ability.extra.xchips
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker ~= card then
            local triggered = false
            local ret_val = {}

            if context.other_joker.edition then
                if context.other_joker.edition.holo then
                    ret_val.xmult = card.ability.extra.holo_xmult
                    triggered = true
                elseif context.other_joker.edition.polychrome then
                    ret_val.mult = card.ability.extra.poly_mult
                    triggered = true
                end
            end

            if triggered and not context.blueprint then
                local gained = false
                if card.edition then
                    if card.edition.holo then
                        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.holo_gain_xchips
                        gained = true
                    elseif card.edition.polychrome then
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.poly_gain_chips
                        gained = true
                    end
                end

                if gained then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.7, 0.5)
                            return true
                        end
                    }))
                end
            end

            if triggered then return ret_val end
        end

        if context.joker_main then
            local has_chips = card.ability.extra.chips > 0
            local has_xchips = card.ability.extra.xchips > 1

            if has_chips or has_xchips then
                local ret = { card = card }
                if has_chips then ret.chips = card.ability.extra.chips end
                if has_xchips then ret.xchips = card.ability.extra.xchips end
                return ret
            end
        end
    end,

    in_pool = function(self, args)
        local has_holo = false
        local has_polychrome = false
        if G.jokers and G.jokers.cards then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.edition then
                    if joker.edition.polychrome then has_polychrome = true end
                    if joker.edition.holo then has_holo = true end
                end
            end
        end
        return has_holo and has_polychrome
    end,

    abn_artist_credits = {
        artist = "Grass",
    },
})