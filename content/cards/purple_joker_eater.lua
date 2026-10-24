SMODS.Joker {
    key = 'purple_joker_eater',
    atlas = 'ABNJokerSheet23',
    pos = { x = 8, y = 3 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,

    config = { extra = { modulate = 0.15, modulate_gain = 0.10 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.modulate, card.ability.extra.modulate_gain } }
    end,

    calculate = function(self, card, context)

        if context.joker_main then
            local empty = G.jokers.config.card_limit - #G.jokers.cards
            if empty > 0 then
                return { modulate = card.ability.extra.modulate * empty }
            end
        end

        if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind and G.GAME.blind.name == 'Big Blind' then
            card.ability.extra.modulate = card.ability.extra.modulate + card.ability.extra.modulate_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.PURPLE,
            }
        end
    end,

    abn_artist_credits = {
		artist = "Inky" 
	},
}