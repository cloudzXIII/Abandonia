SMODS.Joker {
    key = 'enigma_comedian',
    
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet10',
    pos = { x = 7, y = 0 },
    soul_pos = { x = 8, y = 0 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    
    config = { 
        extra = { 
            emult = 1.1, 
            echips = 1.1, 
        }, 
        imm = {
            count = 0
        },
    },
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
        return {
            vars = {
                card.ability.extra.emult,
                card.ability.extra.echips
            }
        }
    end,
    
    update = function(self, card)
        if card.area == G.shop_jokers then
            card.cost = 30
        end
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            local joker_p = get_current_pool('Joker')
            local selected_j = pseudorandom_element(joker_p, 'abn_enigma_comedian')
            local it = 1
            while (selected_j == 'UNAVAILABLE' or G.P_CENTERS[selected_j].mod ~= nil) do
                it = it + 1
                selected_j = pseudorandom_element(joker_p, 'abn_enigma_comedian'..it)
            end
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card {
                        set = 'Joker',
                        key = selected_j,
                        edition = 'e_abn_pearlescent',
                        key_append = 'abn_enigma_comedian',
                        legendary = 'false'
                    }
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
        if context.post_trigger and not context.other_card.config.original_mod then
            card.ability.imm.count = card.ability.imm.count + 1
        end
        if context.final_scoring_step then
            
            return {
                echips = card.ability.extra.echips * card.ability.imm.count,
                emult = card.ability.extra.emult * card.ability.imm.count,

            }
        end
        if context.after then 
            card.ability.imm.count = 0
        end
    end,
    abn_artist_credits = {
        artist = "Vega",
    },

}
