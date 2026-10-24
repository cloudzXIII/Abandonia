SMODS.Joker {
    key = 'jokerlesness',
    atlas = 'ABNJokerSheet23',
    pos = { x = 6, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,

    config = { extra = { chips = 2, mult = 1, chips_gain = 2, mult_gain = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chips_gain, card.ability.extra.mult_gain } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local empty = G.jokers.config.card_limit - #G.jokers.cards
            if empty > 0 then
                return {
                    chips = card.ability.extra.chips * empty,
                    mult = card.ability.extra.mult * empty,
                }
            end
        end

        if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind and G.GAME.blind.boss then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain

            if card.facing == 'back' and G.GAME.last_hand_played then
                SMODS.upgrade_poker_hands({
                    hands = { G.GAME.last_hand_played },
                    level_up = 1,
                    from = card,
                })
            end

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ATTENTION,
            }
        end
    end,

    abn_artist_credits = {
		artist = "GM36" 
	},
}