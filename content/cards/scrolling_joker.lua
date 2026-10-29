SMODS.Joker {
    key = 'scrolling_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet12',
    pos = { x = 2, y = 5 },
    cost = 5,
    blueprint_compat = false,
    discovered = false,

    config = { extra = { cost = 10, xmodulate = 1.5, active = false, triggered = false } },

    abn_artist_credits = {
        artist = "Nevermade"
    },

    abn_use_config = { colour = G.C.ORANGE, text = "USE" },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cost,
                card.ability.extra.xmodulate,
                card.ability.extra.active and "Active" or "Inactive",
            }
        }
    end,

    can_use = function(self, card)
        return not card.ability.extra.active and (G.GAME.dollars - G.GAME.bankrupt_at) >= card.ability.extra.cost
    end,

    use = function(self, card)
        ease_dollars(-card.ability.extra.cost)
        card.ability.extra.active = true
        card:juice_up()
        card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = localize('k_active_ex'),
        })
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and card.ability.extra.active then
            local enhancement = context.other_card.config.center.key
            if context.other_card.config.center.set == 'Enhanced' then
                local enhancement_counts = {}
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.config.center.set == 'Enhanced' then
                        enhancement_counts[scored_card.config.center.key] = (enhancement_counts[scored_card.config.center.key] or 0) + 1
                    end
                end

                local unique_count = 0
                for _, amount in pairs(enhancement_counts) do
                    if amount == 1 then unique_count = unique_count + 1 end
                end

                if enhancement_counts[enhancement] == 1 then
                    card.ability.extra.triggered = true
                    return {
                        xmodulate = card.ability.extra.xmodulate * unique_count,
                    }
                end
            end
        end

        if context.after and card.ability.extra.active and card.ability.extra.triggered then
            card.ability.extra.active = false
            card.ability.extra.triggered = false
        end
    end,
}