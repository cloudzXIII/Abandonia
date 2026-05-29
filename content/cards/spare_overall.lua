SMODS.Joker {
    key = 'spare_overall',
    
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 5, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult=0 , mult_mod = 4, perma_chips = 1, perma_mult = 2, type = 'Four of a Kind'} },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return { vars = { card.ability.extra.mult_mod, localize(card.ability.extra.type, 'poker_hands'), card.ability.extra.mult, card.ability.extra.perma_chips,card.ability.extra.perma_mult,   } }
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card,"m_mult") and (context.other_card:get_id()%2 == 0 ) then
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.perma_mult
            end
            if SMODS.has_enhancement(context.other_card,"m_bonus") and (context.other_card:get_id()%2 ~= 0 ) then 
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.perma_chips
            end
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            if next(context.poker_hands[card.ability.extra.type]) then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra, -- the table that has the value you are changing in
                    ref_value = "mult", -- the key to the value in the ref_table
                    scalar_value = "mult_mod", -- the key to the value to scale by, in the ref_table by default
                })
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    abn_artist_credits = {
        artist = "Generic",
    },
    
}