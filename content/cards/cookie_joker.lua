SMODS.Joker {
    key = 'cookie_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet16',
    pos = { x = 5, y = 1 },
    soul_pos = { x = 6, y = 1 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            asc = 0,
            ascadd = 0.25,
            mult = 0,
        }
    },
    
    in_pool = function(self, args)
        local has_honey = false
        local has_tea = false

        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center_key == 'm_abn_honey' then
                    has_honey = true
                elseif card.config.center_key == 'm_abn_teastain' then
                    has_tea = true
                end

                if has_honey and has_tea then
                    return true
                end
            end
        end

        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ascadd,
                card.ability.extra.asc,
                card.ability.extra.mult,
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local play_limit = G.GAME.starting_params.play_limit
            local honey_count = 0

            for i, played_card in ipairs(context.scoring_hand) do
                if i > play_limit and played_card.config.center_key == 'm_abn_honey' then
                    honey_count = honey_count + 1
                end
            end

            if honey_count > 0 then
                local gained_asc = card.ability.extra.ascadd * honey_count
                card.ability.extra.asc = card.ability.extra.asc + gained_asc
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.GOLD,
                })
            end

            local has_tea = false
            local has_honey = false

            for _, played_card in ipairs(context.full_hand) do
                if played_card.config.center_key == 'm_abn_teastain' then
                    has_tea = true
                elseif played_card.config.center_key == 'm_abn_honey' then
                    has_honey = true
                end
            end

            if has_tea and has_honey then
                local mult_gained = 0
                for _, scoring_card in ipairs(context.scoring_hand) do
                    mult_gained = mult_gained + ((scoring_card.base.nominal or 0) * 2)
                end

                if mult_gained > 0 then
                    card.ability.extra.mult = card.ability.extra.mult + mult_gained
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                    })
                end
            end
        end
        
        if context.joker_main then
            return {
                asc = card.ability.extra.asc,
                mult = card.ability.extra.mult
            }
        end
    end,

    abn_artist_credits = {
        artist = "Nice Cream"
    }
}