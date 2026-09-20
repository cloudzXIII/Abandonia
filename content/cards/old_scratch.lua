-- Coded by Okronix
SMODS.Joker {
    key = 'old_scratch',
    rarity = 2,
    atlas = 'ABNJokerSheet26',
    pos = { x = 4, y = 1 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { rank = 6, type = "Three of a Kind", chthonian = false }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
        return {
            vars = {
                card.ability.extra.rank,
                card.ability.extra.type
            }
        }
    end,

    calculate = function(self, card, context)
        -- first scoring 6 gains Chthonian
        if context.individual and not card.ability.extra.chthonian and context.other_card:get_id() == 6 then
            local target_card = context.other_card

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    target_card:set_edition("e_abn_chthonian", true)
                    target_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            card.ability.extra.chthonian = true
        end

        if context.end_of_round then
            card.ability.extra.chthonian = false
        end

        -- if Chthonian 6 scores it becomes darkner
        if context.individual and context.other_card.edition and
        context.other_card.edition.key == "e_abn_chthonian" and context.other_card:get_id() == 6 then
            local target_card = context.other_card

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    target_card:set_ability("m_abn_darkner", nil, true)
                    return true
                end
            }))
            SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
        end

        -- 3oak of 6s gives triple its chips and mult
        if context.before and context.scoring_name == card.ability.extra.type then
            local is_666 = true

            for _, c in ipairs(context.scoring_hand) do
                if c.base.value ~= '6' then
                    is_666 = false
                    break
                end
            end

            if is_666 then
                local base_chips = G.GAME.hands[card.ability.extra.type].chips or 30
                local base_mult = G.GAME.hands[card.ability.extra.type].mult or 3

                return {
                    message = "666!",
                    colour = G.C.RED,
                    chip_mod = base_chips * 2,
                    mult_mod = base_mult * 2,
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Morphine Milkshake",
    },
}