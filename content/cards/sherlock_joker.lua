SMODS.Joker {
    key = 'sherlock_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 6, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,
    abn_coder = "LasagnaFelidae",
    config = { extra = { } },
    loc_vars = function(self, info_queue, card)
        local flipped_card, next_card = "None", "None"
        if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 and G.hand.highlighted[1].facing == "back" then
            flipped_card = G.hand.highlighted[1].base.name
        end
        if G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.name then
            next_card = G.deck.cards[#G.deck.cards].base.name
        end
        return { vars = { flipped_card, next_card } }
    end,


    
    
    abn_artist_credits = {
        artist = "Usualboo",
    },
}
