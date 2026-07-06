SMODS.Joker {
    key = "tlumddo",
    name = "Tlumddo Joker",
    config = {
        extra = {
            perma_mult = 9,
            perma_chips = 33
        }
    },
    pos = { x = 8, y = 5 },
    cost = 8,
    rarity = 3,
    unlocked = false,
    blueprint_compat = true,
    atlas = "ABNJokerSheet11",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        return {
            vars = {
                card.ability.extra.perma_mult,
                card.ability.extra.perma_chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local triggered = false
            if SMODS.has_enhancement(context.other_card, "m_bonus") then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if not SMODS.has_enhancement(scored_card, "m_bonus") then
                        scored_card.ability.perma_mult = (scored_card.ability.perma_mult or 0) +
                            card.ability.extra.perma_mult
                        triggered = true

                        if ABN.is_odd(context.other_card) then
                            scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) +
                                card.ability.extra.perma_chips
                            triggered = true
                        end
                    end
                    if triggered then
                        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, scored_card)
                    end
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "Inky",
    },
    check_for_unlock = function(self, args)
        if args.type == "modify_deck" then
            for _, card in ipairs(G.playing_cards or {}) do
                if ABN.is_odd(card) and SMODS.has_enhancement(card, "m_bonus") then
                    unlock_card(self)
                    return true
                end
            end
        end
        return false
    end
}
