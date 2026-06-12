SMODS.Joker {
    key = "spilling_salt",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'ABNJokerSheet15',
    pos = { x = 6, y = 0 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].debuff then
                    local card_rank = context.scoring_hand[i].base.value
                    if G.GAME.abn_rank_upgrades[card_rank] then
                        ABN.level_up_rank(card, card_rank, 1)
                    end
                end
            end
        end
    end,
    in_pool = function(self, args)
        for _, card in pairs(G.playing_cards or {}) do
            if card and card.debuff then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = {
        artist = "Grassy",
    },
}