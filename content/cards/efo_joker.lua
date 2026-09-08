SMODS.Joker {
    key = 'efo_joker',
    atlas = 'ABNJokerSheet13',
    pos = { x = 7, y = 1 }, 
    rarity = 3, 
    cost = 8,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    
    config = { 
        extra = { 
            odds = 3, 
            stampasc = 0.25, 
            xmultadd = 0.25, 
            ascadd = 0.10, 
            xmult = 1.0, 
            asc = 0.0
        } 
    },

    in_pool = function(self)
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.ability then
                    for k, active in pairs(card.ability) do
                        if active and ABN_is_stamp(k) then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.stampasc,
                card.ability.extra.xmultadd,
                card.ability.extra.ascadd,
                card.ability.extra.xmult,
                card.ability.extra.asc
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local first_stamp_card = nil
            for _, played_card in ipairs(context.scoring_hand) do
                if played_card.ability then
                    for k, active in pairs(played_card.ability) do
                        if active and ABN_is_stamp(k) then
                            first_stamp_card = played_card
                            break
                        end
                    end
                end
                if first_stamp_card then break end
            end

            if first_stamp_card then
                if pseudorandom('efo_joker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_card = copy_card(first_stamp_card, nil, nil, G.playing_cards)
                            copied_card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, copied_card)
                            G.hand:emplace(copied_card)
                            copied_card:start_materialize()
                            return true
                        end
                    }))
                    card_eval_status_text(card, 'extra', nil, nil, nil, {  message = localize("k_copied_ex") })
                end
            end
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card.ability then
                for k, active in pairs(context.other_card.ability) do
                    if active and ABN_is_stamp(k) then
                        return {
                            asc = card.ability.extra.stampasc,
                            colour = G.C.GOLD,
                            card = card
                        }
                    end
                end
            end
        end

        if context.before and not context.blueprint then
            local stamp_count = 0
            for _, played_card in ipairs(context.full_hand) do
                if played_card.ability then
                    for k, active in pairs(played_card.ability) do
                        if active and ABN_is_stamp(k) then
                            stamp_count = stamp_count + 1
                            break
                        end
                    end
                end
            end

            if stamp_count >= 5 then
                local added_xmult = card.ability.extra.xmultadd * stamp_count
                local added_asc = card.ability.extra.ascadd * stamp_count

                card.ability.extra.xmult = card.ability.extra.xmult + added_xmult
                card.ability.extra.asc = card.ability.extra.asc + added_asc

                return {
                    message = localize('k_upgrade_ex'),
                }
            end
        end

        if context.joker_main then
            return {
				xmult = card.ability.extra.xmult,
				asc = card.ability.extra.asc
			}
        end
    end,
	
	abn_artist_credits = {
		artist = "Gud",
	},
}