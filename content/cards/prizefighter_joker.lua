SMODS.Joker {
    key = 'prizefighter_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet8',
    pos = { x = 1, y = 4 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult_mod = 2, chips_mod = 1, mult = 0,  chips = 0, }, saved = {hand_size = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.saved.hand_size, card.ability.extra.chips_mod, card.ability.extra.mult_mod, card.ability.extra.chips, card.ability.extra.mult} }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local ret = {}
            if #context.scoring_hand >= 1 then 
                ret.message = localize("k_upgrade_ex")
                ret.colour = G.C.FILTER
                card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod)
                card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_mod)

                if #context.scoring_hand == card.ability.saved.hand_size*2 then 
                    card.ability.extra.mult = card.ability.extra.mult * 2
                    card.ability.extra.chips = card.ability.extra.chips * 2
                end

                card.ability.saved.hand_size = #context.scoring_hand
            end
            
            ret.mult = card.ability.extra.mult
            ret.chips = card.ability.extra.chips
            
            return ret
		end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.saved.hand_size = 1
            return { message = localize("k_reset"), colour = G.C.FILTER}
        end
    end,


    
    abn_artist_credits = {
        artist = "Boytjie",
    },
}


