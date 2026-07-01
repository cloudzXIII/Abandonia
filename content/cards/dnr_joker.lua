SMODS.Joker {
    key = 'dnr_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet16',
    pos = { x = 0, y = 4 },
	soul_pos = { x = 1, y = 4 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,

    config = { extra = { xmult = 0.02 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult }
        }
    end,

    calculate = function(self, card, context)
        if context.destroy_card then
            local target_card = context.destroy_card

            if target_card.config and target_card.config.center and target_card.config.center.set == "Enhanced" then
                if G.jokers and G.jokers.cards then
                    for _, target in ipairs(G.jokers.cards) do
                        target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
                        
                        card_eval_status_text(target, 'extra', nil, nil, nil, {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.MULT
                        })
                    end
                end
                return { remove = true }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Inky"
    },
}