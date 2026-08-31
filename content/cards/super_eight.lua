local Card_set_debuff_ref = Card.set_debuff

function Card:set_debuff(should_debuff)
    if self:get_id() == 8 and next(SMODS.find_card('j_abn_super_eight')) then
        self.debuff = false
        return
    end

    Card_set_debuff_ref(self, should_debuff)
end

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if not ret and not SMODS.has_no_suit(self) then
        if self:get_id() == 8 and next(SMODS.find_card("j_abn_super_eight")) then
            if suit == "Hearts" or suit == "Clubs" or suit == "Spades" or suit == "Diamonds" then
                return true
            end
        end
    end
    return ret
end


SMODS.Joker {
    key = 'super_eight',
    rarity = 3,
    cost = 8,
    atlas = 'ABNJokerSheet23', 
    pos = { x = 2, y = 2 },
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card
            if scoring_card:get_id() == 8 then
                card.ability.extra.mult = card.ability.extra.mult + 16
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        if context.before and not context.blueprint then
            local scored_eight = false
            for _, scoring_card in ipairs(context.scoring_hand) do
                if scoring_card:get_id() == 8 then
                    scored_eight = true
                    break
                end
            end

            if not scored_eight then
                card:start_dissolve()
				card.ability.extra.mult = 0
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    abn_artist_credits = {
        artist = "GM36",
    },
}