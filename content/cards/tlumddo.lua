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
            local other_card = context.other_card
            local enhancements = SMODS.get_enhancements(other_card)
            local is_bonus = enhancements and enhancements.m_bonus
            if is_bonus then
                local id = other_card:get_id()
                if
                    context.other_card.base.value == "abn_14" or
                    context.other_card.base.value == "abn_13" or
                    context.other_card.base.value == "abn_12" or
                    context.other_card.base.value == "abn_11"
                then
                    id = context.other_card.base.nominal
                end
                local is_odd = (id <= 10 and id >= 0 and id % 2 == 1) or (id == 14)
                for _, scored_card in ipairs(context.scoring_hand) do
                    local scored_enhancements = SMODS.get_enhancements(scored_card)
                    local scored_is_bonus = scored_enhancements and scored_enhancements.m_bonus
                    if not scored_is_bonus then
                        scored_card.ability.perma_mult = (scored_card.ability.perma_mult or 0) +
                            card.ability.extra.perma_mult
                        if is_odd then
                            scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) +
                                card.ability.extra.perma_chips
                        end
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
            for _, card in ipairs(G.playing_cards) do
                local enhancements = SMODS.get_enhancements(card)
                local is_bonus = enhancements and enhancements.m_bonus
                if is_bonus then
                    local id = card.base.id
                    if
                        card.base.value == "abn_14" or
                        card.base.value == "abn_13" or
                        card.base.value == "abn_12" or
                        card.base.value == "abn_11"
                    then
                        id = card.base.nominal
                    end
                    local is_odd = (id <= 10 and id >= 0 and id % 2 == 1) or (id == 14)
                    if is_odd then
                        unlock_card(self)
                        return true
                    end
                end
            end
        end
        return false
    end
}
