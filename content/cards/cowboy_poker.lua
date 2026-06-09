SMODS.Joker {
    key = 'cowboy_poker',
    rarity = 2,
    atlas = 'ABNJokerSheet13',
    pos = { x = 3, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            payout = 0,
            payoutadd = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.payout,
                card.ability.extra.payoutadd,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            if G.GAME.blind and G.GAME.blind.name == 'Big Blind' then
                local used_editions = {}

                for _, c in ipairs(G.consumeables.cards) do
                    local edition = nil
                    local attempts = 0
                    
                    -- Attempt to find an edition that hasn't been used yet in this sequence
                    repeat
                        edition = poll_edition('cowboy_poker_poll', nil, false, true)
                        attempts = attempts + 1
                        local ed_key = edition and edition.key or "none"
                    until not used_editions[ed_key] or attempts > 10

                    if edition then
                        c:set_edition(edition)
                        local final_key = edition.key or "none"
                        used_editions[final_key] = true
                    end
                end

                card.ability.extra.payout = card.ability.extra.payout + (card.ability.extra.payoutadd * #G.consumeables.cards)
                    
                card_eval_status_text(card, 'extra', nil, nil, nil, {
					message = localize('k_upgrade_ex'),
                    colour = G.C.MONEY,
                    card = card
                })
            end
        end
    end,
	
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.payout > 0 then
            return card.ability.extra.payout
        end
    end,
    
    abn_artist_credits = {
        artist = "Modliich",
    },
}