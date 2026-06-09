SMODS.Joker {
    key = 'psychokinesis_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet8',
    pos = { x = 9, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { dollars = 5 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS["e_abn_reversal"]
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.key == "e_abn_reversal" then
                ease_dollars(card.ability.extra.dollars)
            end
        end
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 then
            for i, playing_card in ipairs(G.hand.cards) do
                if SMODS.has_enhancement(playing_card, "m_steel") or SMODS.has_enhancement(playing_card, "m_gold") then
                    playing_card:set_edition("e_abn_reversal")
                end
            end
        end
    end,


    abn_artist_credits = {
        artist = "bird_but_bread",
    },
}
