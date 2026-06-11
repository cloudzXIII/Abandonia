SMODS.Joker {
    key = 'mult_disco',
    rarity = 2,
    atlas = 'ABNJokerSheet13',
    pos = { x = 7, y = 5 },
    cost = 5,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult_mod = 1, mult = 0, xmult = 1, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.mult_mod, card.ability.extra.mult } }
    end,

    countMults = function(self, card)
        local ct = 0
        local d_ct = 0
        if G.playing_cards then
            for i, playing_card in ipairs(G.play.cards) do
                if SMODS.has_enhancement(playing_card, "m_mult") then
                    if playing_card.edition and playing_card.edition.key =="e_negative" then ct = ct + 1 end
                    if ABN.is_dark(playing_card) then d_ct = d_ct + 1 end
                end
            end
        end
        return ct, d_ct
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local ret = {}
            local ct, d_ct = self.countMults()
            if ct >= 1 then 
                ret.message = localize("k_upgrade_ex")
                ret.colour = G.C.FILTER
                card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod*ct)
            end
            ret.mult = card.ability.extra.mult
            if d_ct >= 1 then
            ret.xmult = card.ability.extra.xmult + d_ct
            end
            
            return ret
		end

    end,

    in_pool = function(self, args)
        for i, playing_card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, "m_mult") and ((playing_card.edition and playing_card.edition.key =="e_negative") or ABN.is_dark(playing_card)) then
                return true
            end
        end
        return false
    end,
    
    abn_artist_credits = {
        artist = "Pooper McFart",
    },
}


