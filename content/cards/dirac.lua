local Card_set_debuff_ref = Card.set_debuff

function Card:set_debuff(should_debuff)
    if self.edition and self.edition.negative and self.config and self.config.center and self.config.center.original_mod and next(SMODS.find_card('j_abn_dirac')) then
        self.debuff = false
        return
    end

    Card_set_debuff_ref(self, should_debuff)
end

SMODS.Joker {
    key = 'dirac',
    rarity = 3,
    cost = 8,
    atlas = 'ABNJokerSheet23',
    pos = { x = 9, y = 0 },
    blueprint_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            xchips = 1,
            xchipsadd = 0.2,
            xmult = 1,
            xmultadd = 0.1,
            handsize = 5,
			triggered = false
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xchipsadd,
                card.ability.extra.xmult,
                card.ability.extra.xmultadd,
                card.ability.extra.handsize
            }
        }
    end,

	update = function(self, card, dt)
        if card.area == G.jokers and card.edition and card.edition.negative and card.ability.extra.triggered == false then
			card.ability.extra.triggered = true
            G.hand:change_size(card.ability.extra.handsize)
        end
		
		if card.area == G.jokers and card.edition and not card.edition.negative and card.ability.extra.triggered == true or card.area == G.jokers and not card.edition and card.ability.extra.triggered == true then
			card.ability.extra.triggered = false
            G.hand:change_size(-card.ability.extra.handsize)
        end
    end,
	
	add_to_deck = function(self, card, from_debuff)
        if card.edition and card.edition.negative and card.ability.extra.triggered == true then
            G.hand:change_size(card.ability.extra.handsize)
        end
    end,
	
	remove_from_deck = function(self, card, from_debuff)
        if card.edition and card.edition.negative then
            G.hand:change_size(-card.ability.extra.handsize)
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card
            if scoring_card.edition and scoring_card.edition.negative then
                local center = scoring_card.config and scoring_card.config.center
                local base_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }
                
                local is_modded_center = center and center.original_mod
                local is_modded_suit = scoring_card.base and scoring_card.base.suit and not base_suits[scoring_card.base.suit]

                if is_modded_center or is_modded_suit then
                    card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
		end

        if context.post_trigger and context.other_card and context.other_card ~= card then
            local triggering_joker = context.other_card
            if triggering_joker.edition and triggering_joker.edition.negative then
                local center = triggering_joker.config and triggering_joker.config.center
                if center and center.original_mod then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
                    return {
                        message = localize('k_upgrade_ex'),
						colour = G.C.MULT,
                        card = card
                    }
                end
            end
        end
		

        if context.joker_main then
            return {
				xmult = card.ability.extra.xmult,
				xchips = card.ability.extra.xchips,
			}
        end
    end,

    abn_artist_credits = {
        artist = "GM36",
    },
}