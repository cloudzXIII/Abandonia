SMODS.Joker {
    key = 'bauhaus_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet12',
    pos = { x = 3, y = 5 },
    cost = 6,
    blueprint_compat = false,
    discovered = false,

    config = { extra = { uses = 1, uses_add = 1, active = false, amp = 0, modulate = 0, amp_gain = 0.25, modulate_gain = 0.25 } },

    abn_artist_credits = {
        artist = "Honkz"
    },

    abn_use_config = { colour = G.C.ORANGE, text = "USE" },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.amp_gain,
                card.ability.extra.modulate_gain,
                card.ability.extra.uses,
                card.ability.extra.uses_add,
                card.ability.extra.amp,
                card.ability.extra.modulate,
            }
        }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0 and not card.ability.extra.active
    end,

    use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        card.ability.extra.active = true
        card:juice_up()
        card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = localize('k_active_ex'),
        })
    end,

    calculate = function(self, card, context)
        if context.hand_drawn and card.ability.extra.active and not context.blueprint then
            local vanilla_suits = { Hearts = true, Diamonds = true, Clubs = true, Spades = true }
            local vanilla_ranks = {
                ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true,
                ['9'] = true, ['10'] = true, Jack = true, Queen = true, King = true, Ace = true,
            }

            local vanilla_drawn = 0
            local modded_drawn = 0
            for _, drawn_card in ipairs(context.hand_drawn) do
                local is_modded = not vanilla_suits[drawn_card.base.suit] or not vanilla_ranks[drawn_card.base.value]
                if drawn_card.config.center.original_mod then is_modded = true end
                if drawn_card.edition and G.P_CENTERS[drawn_card.edition.key] and G.P_CENTERS[drawn_card.edition.key].original_mod then
                    is_modded = true
                end
                if drawn_card.seal and G.P_SEALS[drawn_card.seal] and G.P_SEALS[drawn_card.seal].original_mod then
                    is_modded = true
                end

                if is_modded then
                    modded_drawn = modded_drawn + 1
                else
                    vanilla_drawn = vanilla_drawn + 1
                end
            end

            if vanilla_drawn > 0 or modded_drawn > 0 then
                card.ability.extra.amp = card.ability.extra.amp + card.ability.extra.amp_gain * vanilla_drawn
                card.ability.extra.modulate = card.ability.extra.modulate + card.ability.extra.modulate_gain * modded_drawn
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.ATTENTION,
                    card = card,
                }
            end
        end

        if context.joker_main and (card.ability.extra.amp > 0 or card.ability.extra.modulate > 0) then
            return {
                amp = card.ability.extra.amp > 0 and card.ability.extra.amp or nil,
                modulate = card.ability.extra.modulate > 0 and card.ability.extra.modulate or nil,
            }
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.active = false
            if G.GAME.blind and G.GAME.blind.boss then
                card.ability.extra.uses = card.ability.extra.uses + card.ability.extra.uses_add
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.ATTENTION,
                    card = card,
                }
            end
        end
    end,
}