SMODS.Joker {
    key = 'pandemonium_jester',
    rarity = 3,
    atlas = 'ABNJokerSheet26',
    pos = { x = 1, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 0.25
        }
    },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_stk_oilfire", set = "Other", vars = { 10, 3, 1, 2 } }
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                j:add_sticker("abn_stk_oilfire", true)
            end
        end
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            for _, target in ipairs(G.jokers.cards) do
				if target.ability and target.ability.abn_stk_oilfire then
					target.ability.rounds_held = (target.ability.rounds_held or 0) + 1
                    local rounds_held = target.ability.rounds_held
                        
                    target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + (card.ability.extra.xmult * rounds_held)

                    card_eval_status_text(target, 'extra', nil, nil, nil, {
						message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    })
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Comkyel"
    }
}