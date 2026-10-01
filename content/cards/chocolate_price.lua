-- Coded by Okronix
SMODS.Joker {
    key = 'chocolate_price',
    rarity = 2,
    atlas = 'ABNJokerSheet26',
    pos = { x = 5, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
	pools = { ["Food"] = true,},

    config = {
        extra = {
            active = true,
        }
    },

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
        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card
            local c_key = scoring_card.config.center_key or (scoring_card.config.center and scoring_card.config.center.key)

            if scoring_card:is_suit("abn_Coin") then
                if c_key == 'm_gold' then
                    return {
                        mult = scoring_card.base.nominal,
                        card = card
                    }
                elseif c_key == 'm_abn_honey' and card.ability.extra.active then
                    card.ability.extra.active = false
                    return {
                        dollars = scoring_card.base.nominal,
                        card = card
                    }
                end
            end
        end

        if context.setting_blind then
            card.ability.extra.active = true
        end
    end,

    abn_artist_credits = {
        artist = "Null"
    }
}

local Card_set_debuff_ref = Card.set_debuff
function Card:set_debuff(should_debuff)
    local c_key = self.config.center_key or (self.config.center and self.config.center.key)
    if (c_key == 'm_gold' or c_key == 'm_abn_honey') and next(SMODS.find_card('j_abn_chocolate_coin')) and next(SMODS.find_card('j_abn_chocolate_price')) then
        self.debuff = false
        return
    end

    Card_set_debuff_ref(self, should_debuff)
end