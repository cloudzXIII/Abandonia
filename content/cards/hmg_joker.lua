SMODS.Joker {
    key = 'hmg_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet12',
    pos = { x = 4, y = 3 },
    cost = 6,
    blueprint_compat = false,
    discovered = false,

    config = { extra = { uses = 1, uses_add = 1, active = false } },

    abn_artist_credits = {
        artist = "Inky"
    },

    abn_use_config = { colour = G.C.ORANGE, text = "USE" },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.uses_add, card.ability.extra.active and "Active" or "Inactive" } }
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
        if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
            card.ability.extra.uses = card.ability.extra.uses + card.ability.extra.uses_add
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ATTENTION,
                card = card
            }
        end

        if context.joker_main and card.ability.extra.active then
            local hand_name = context.scoring_name
            local hand_data = hand_name and G.GAME.hands[hand_name] or nil
            
            local total_chips = 0
            local total_mult = 0

            if hand_data then
                local function get_num(v)
                    if not v then return 0 end
                    if type(v) == "number" then return v end
                    if type(v) == "string" then return tonumber(v) or 0 end
                    if v.to_number then return v:to_number() end
                    if to_val then 
                        local val = to_val(v)
                        if type(val) == "number" then return val end
                    end
                    return tonumber(tostring(v)) or 0
                end

                local lvl = math.max(1, get_num(hand_data.level))
                local cur_chips = get_num(hand_data.chips)
                local cur_mult = get_num(hand_data.mult)
                local l_chips = get_num(hand_data.l_chips)
                local l_mult = get_num(hand_data.l_mult)

                local level_reduction = (lvl * (lvl - 1)) / 2
                total_chips = (lvl * cur_chips) - (level_reduction * l_chips)
                total_mult = (lvl * cur_mult) - (level_reduction * l_mult)

                if to_big then
                    total_chips = to_big(total_chips)
                    total_mult = to_big(total_mult)
                end
            end

            card.ability.extra.active = false
            return {
                chips = total_chips,
                mult = total_mult,
                card = card
            }
        end
    end,
}