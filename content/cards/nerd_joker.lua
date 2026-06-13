SMODS.Joker {
    key = "nerd_joker",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = 'ABNJokerSheet15',
    pos = { x = 1, y = 0 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 0 , chips_mod = 2,} },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips_mod, card.ability.extra.chips,} }
    end,
    f_rank = function(c)
        
        if c.base.value == "abn_14" 
        or c.base.value == "abn_13"
        or c.base.value == "abn_12"
        or c.base.value == "abn_11" then 
            rank = c.base.nominal 
        end
        return rank
    end,

    calculate = function(self, card, context)
        if context.joker_main and #context.scoring_hand % 2 == 0 then
            local ret = {}
            local flag = true
            local total = 0
            local rank = 0
            for _, c in ipairs(context.scoring_hand) do
                if c.base.value == "abn_14" 
                or c.base.value == "abn_13"
                or c.base.value == "abn_12"
                or c.base.value == "abn_11" then 
                    rank = c.base.nominal 
                else 
                    rank = c.base.id 
                end
                if rank <= 10 and rank >= 0 and rank % 2 == 0 then
                    flag = false
                end
                total = total + rank

            end
            if flag == true then
                ret.message = localize("k_upgrade_ex")
                card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_mod * total)
            end
            ret.chips = card.ability.extra.chips

            return ret

        end

        

    end,
    abn_artist_credits = {
        artist = "Pepix",
    },
}