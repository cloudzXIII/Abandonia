SMODS.Joker{
    key = "ancient_tapestry",
    atlas = "ABNJokerSheet24",
    pos = { x = 2, y = 5 },               
    rarity = 2,                           
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    abn_coder = "LasagnaFelidae",
    config = {
        extra = {
            mult = 0,
            chips = 0,
            xmult = 1,
            xchips = 1,
            mod = 0,
            flipped = false
        }
    },
    
    loc_vars = function(self, info_queue, card)
        local flipped = card.ability.extra.flipped == true and "chips" or "mult"
        local flipped_c = card.ability.extra.flipped == true and G.C.CHIPS or G.C.MULT
        return { vars = { card.ability.extra[flipped], card.ability.extra["x" .. flipped], flipped:sub(1,1):upper()..flipped:sub(2), colours = { flipped_c } } }
    end,
    
    is_modded_seal = function(self, card)
        if card.seal and SMODS.Seals[card.seal].mod then   
            return true
        end
        return false
    end,
    _flip = function(self, card)
        card.ability.extra.flipped = not card.ability.extra.flipped
        local flipped = card.ability.extra.flipped == true and 3 or 2
        G.E_MANAGER:add_event(Event({
            func = function()
                card:flip()
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                card.children.center:set_sprite_pos({ x = flipped, y = 5 })
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                card:flip()
                return true
            end
        }))
    end,
    set_sprites = function(self, card, front)
        if card.ability and card.ability.extra then
            local flipped = card.ability.extra.flipped == true and 3 or 2
            card.children.center:set_sprite_pos({ x = flipped, y = 5 })
        else
            card.children.center:set_sprite_pos({ x = 2, y = 5 })
        end
    end,
    load = function(self, card, card_table, other_card)
        if card and card.ability and card.ability.extra and card.ability.extra.flipped then
            local flipped = card.ability.extra.flipped == true and 3 or 2
            card.children.center:set_sprite_pos({ x = flipped, y = 5 })
        end
    end,
    
    calculate = function(self, card, context)
        
        if context.joker_main then
            local flipped = card.ability.extra.flipped == true and "chips" or "mult"
            local ret = {}
            ret[flipped] = math.max(card.ability.extra[flipped] > 0 and card.ability.extra[flipped] or 0, 0)
            ret["x" .. flipped] = math.max(card.ability.extra["x" .. flipped] > 1 and card.ability.extra["x" .. flipped] or 1, 1)
            
            return ret
        end
        
        if context.before and not context.blueprint then
            local scoring = context.scoring_hand
            if not scoring or #scoring == 0 then return end
            if context.scoring_name == "High Card" then return end
            
            local flipped = card.ability.extra.flipped == true and "chips" or "mult"
            local flipped_c = card.ability.extra.flipped == true and G.C.CHIPS or G.C.MULT
            
            local all_vanilla = true
            local all_modded = true
            card.ability.extra.mod = #scoring
            
            for _, c in ipairs(scoring) do
                if not c.seal then
                    all_vanilla = false
                    all_modded = false
                    break
                end
                if self:is_modded_seal(c) then
                    all_vanilla = false
                else
                    all_modded = false
                end
            end
            
            if all_vanilla then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = flipped,
                    scalar_value = "mod",
                    scaling_message = {
                        message = localize{type = 'variable', key = 'a_'..flipped, vars = {card.ability.extra.mod}},
                        colour = flipped_c
                    }
                })
            end
            
            if all_modded then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "x" .. flipped,
                    scalar_value = "mod",
                    scaling_message = {
                        message = localize{type = 'variable', key = 'a_x'..flipped, vars = {card.ability.extra.mod}},
                        colour = flipped_c
                    }
                })
                self:_flip(card)
            end
        end
    end,
    
    in_pool = function(self, args)
        for i, v in ipairs(G.playing_cards or {}) do
            if v.seal then
                return true
            end
        end
        return false
    end,
    
    abn_artist_credits = {
        artist = "La Ginger",
    },
    
}