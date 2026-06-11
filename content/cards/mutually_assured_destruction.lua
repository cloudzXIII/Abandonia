SMODS.Joker {
    key = 'mutually_assured_destruction',
    rarity = 3,
    atlas = 'ABNJokerSheet15',
    pos = { x = 2, y = 1 },
    cost = 10,
    discovered = false,
    blueprint_compat = false,
    abn_coder = "LasagnaFelidae",
    loc_vars = function(self,info_queue, card)
        local color = G.C.RED
        local text = "Unsafe"
        if card.ability.purchased then
            color, text = G.C.GREEN, "Safe"
        end
        return {vars = {text, colours = {color}}}

    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.abn_legendary_rate = (G.GAME.abn_legendary_rate or 0) + 0.001
        G.GAME.abn_superrare_rate = (G.GAME.abn_superrare_rate or 0) + 0.005
        G.GAME.abn_parallelrare_rate = (G.GAME.abn_parallelrare_rate or 0) + 0.005
        G.GAME.abn_virusrare_rate = (G.GAME.abn_virusrare_rate or 0) + 0.0005
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.GAME.abn_legendary_rate = (G.GAME.abn_legendary_rate or 0) - 0.001
        G.GAME.abn_superrare_rate = (G.GAME.abn_superrare_rate or 0) - 0.005
        G.GAME.abn_parallelrare_rate = (G.GAME.abn_parallelrare_rate or 0) - 0.005
        G.GAME.abn_virusrare_rate = (G.GAME.abn_virusrare_rate or 0) - 0.0005
    end,
    
    calculate = function(self, card, context)
        if context.starting.shop then
            if card.ability.purchased == true then
                card.ability.purchased = nil
            end
        end
        if context.buying_card and context.card.config.center.set == "Joker" then
            card.ability.purchased = true
        end
        if context.ending_shop and card.ability.purchased == nil then
            SMODS.destroy_cards(G.jokers.cards, true)
        end


    end,


    
    abn_artist_credits = {
        artist = "Firch",
    },
}

