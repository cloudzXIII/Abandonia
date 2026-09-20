SMODS.Joker {
    key = 'chocolate_coin',
    rarity = 2,
    atlas = 'ABNJokerSheet16',
    pos = { x = 2, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
	pools = { ["Food"] = true,},

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
	
	in_pool = function(self, args)
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card:is_suit("abn_Coin") then
                    local c_key = card.config.center_key or (card.config.center and card.config.center.key)
                    if c_key == 'm_gold' or c_key == 'm_abn_honey' then
                        return true
                    end
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.before then
            local is_all_gold_coins = #context.scoring_hand > 0

            for _, played_card in ipairs(context.scoring_hand) do
                local c_key = played_card.config.center_key or (played_card.config.center and played_card.config.center.key)
                local is_gold = (c_key == 'm_gold')
                local is_coin = played_card:is_suit("abn_Coin")

                if not (is_gold and is_coin) then
                    is_all_gold_coins = false
                    break
                end
            end

            if is_all_gold_coins then
                local base_hand_mult = G.GAME.hands[context.scoring_name].mult or 0
                return {
					dollars = base_hand_mult
				}
            end
        end

        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card
            local c_key = scoring_card.config.center_key or (scoring_card.config.center and scoring_card.config.center.key)

            if scoring_card:is_suit("abn_Coin") and c_key == 'm_abn_honey' then
				return {
					mult = scoring_card.base.nominal,
                    card = card
				}
            end
        end
    end,

    abn_artist_credits = {
        artist = "Toyrapple"
    }
}