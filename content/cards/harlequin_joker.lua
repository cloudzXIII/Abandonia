
SMODS.Joker {
    key = "harlequin_joker",
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    atlas = 'ABNJokerSheet16',
    pos = { x = 5, y = 2 },
    abn_coder = "LasagnaFelidae",
    


    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            local fc = context.scoring_hand[1]
            local lc = context.scoring_hand[#context.scoring_hand]
            fc.rank_a = fc.base.id
            if fc.base.value == "abn_14" 
            or fc.base.value == "abn_13"
            or fc.base.value == "abn_12"
            or fc.base.value == "abn_11" then 
                fc.rank_a = fc.base.nominal 
            end
            lc.rank_a = lc.base.id
            if lc.base.value == "abn_14" 
            or lc.base.value == "abn_13"
            or lc.base.value == "abn_12"
            or lc.base.value == "abn_11" then 
                lc.rank_a = lc.base.nominal 
            end
            if lc.rank_a <= 10 and lc.rank_a >= 0 and lc.rank_a % 2 == 1 and fc.rank_a <= 10 and fc.rank_a >= 0 and fc.rank_a % 2 == 0 then
                if (fc.edition 
                and lc.edition) 
                and fc.edition.key == lc.edition.key then 
                    SMODS.add_card({set="solid_state", area = G.consumeables, edition="e_negative"})
                end

                if (next(SMODS.get_enhancements(fc))
                and next(SMODS.get_enhancements(lc)))
                and lc.config.center.key == fc.config.center.key then
                    SMODS.add_card({set="sigils", area = G.consumeables, edition="e_negative"})
                end

                if (fc.seal 
                and lc.seal) 
                and fc.seal == lc.seal then 
                    SMODS.add_card({set="lexica", area = G.consumeables, edition="e_negative"})
                end

            end


        end
    end,
    in_pool = function(self, args)
        for i, playing_card in ipairs(G.playing_cards) do
            if SMODS.get_enhancements(playing_card) or playing_card.edition or playing_card.seal then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = {
        artist = "Akuma no Tatsujin",
    },
}