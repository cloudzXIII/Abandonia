SMODS.Joker {
    key = 'palindromic_beetle',
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 2, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'abn_palindromic_sequence', set = 'Other'}
	end,
    
    
    
    calculate = function(self, card, context)
        if context.joker_main then
            local hand_ids = {}
            local has_dark = false
            local has_light = false
            for i, card in ipairs(context.full_hand) do
                if ABN.is_dark(card) then has_dark = true end
                if ABN.is_light(card) then has_light = true end
                hand_ids[i] = card:get_id()
            end
            if ABN.is_palindrome(hand_ids) and (has_dark and has_light) then
                for i, _card in ipairs(context.scoring_hand) do
                    local _rank = G.GAME.abn_rank_upgrades[_card.base.value]
                    update_hand_text(
                        { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
                        { handname = _rank.name .. "s", chips = _rank.chips, mult = _rank.mult, level = _rank.level }
                    )
                    ABN.level_up_rank(_card, _card.base.value, (ABN.table_count(hand_ids,_card:get_id())-1))
                    update_hand_text(
                        { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
                        { mult = 0, chips = 0, handname = "", level = "" }
                    )
                end
            end
        end
        
    end,
    
    
    abn_artist_credits = {
        artist = "Notextify",
    },
    
}
