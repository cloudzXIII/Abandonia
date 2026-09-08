local ability_table = {
    [1] = {
        name = "Pair",
        ref_value = "slib_perma_plus_asc",
        scalar_value = "asc",
        desc = "+0.25",
        desc_color = G.C.GOLD,
        desc_text = "Ascension Power",
    },
    [2] = {
        name = "Three of a Kind",
        scalar_value = "planet",
        desc = "+3",
        desc_color = G.C.SECONDARY_SET.Planet,
        desc_text = "Planet Rank",
    },
    [3] = {
        name = "High Card",
        desc = "Chromatic",
        desc_color = G.C.DARK_EDITION,
        desc_text = "edition",
    },
    [4] = {
        name = "Flush",
        ref_value = "perma_mult",
        scalar_value = "mult",
        desc = "+5",
        desc_color = G.C.MULT,
        desc_text = "Mult",
    },
    [5] = {
        name = "Three of a Kind",
        ref_value = "perma_bonus",
        scalar_value = "chips",
        desc = "+10",
        desc_color = G.C.CHIPS,
        desc_text = "Chips",
    },
    [6] = {
        name = "High Card",
        ref_value = "perma_bonus",
        scalar_value = "chips_rank",
        desc = "chips",
        desc_color = G.C.CHIPS,
        desc_text = "equal to triple their rank",
    },
}

SMODS.Joker {
    key = 'tyches_keychain',
    rarity = 2,
    atlas = 'ABNJokerSheet19',
    pos = { x = 0, y = 0 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = {
        asc = 0.25,
        planet = 3,
        edition = "e_abn_chromatic",
        mult = 5,
        chips = 10,
        chips_rank = 0,
        chips_rank_mult = 3,
        index = 1 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(ability_table[card.ability.extra.index].name, 'poker_hands'), -- poker hand
                ability_table[card.ability.extra.index].desc,                          -- colroed text
                ability_table[card.ability.extra.index].desc_text,                     -- the text after that is black

                colours = {
                    ability_table[card.ability.extra.index].desc_color -- the color
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.scoring_name == ability_table[card.ability.extra.index].name then
            local index = card.ability.extra.index
            local ability = ability_table[index]
            card.ability.extra.chips_rank = context.other_card.base.nominal * card.ability.extra.chips_rank_mult
            if index == 1 or index == 4 or index == 5 or index == 6 then
                SMODS.scale_card(context.other_card, {
                    ref_table = context.other_card.ability,
                    ref_value = ability.ref_value,
                    scalar_table = card.ability.extra,
                    scalar_value = ability.scalar_value,
                })
            end
            if index == 2 then
                ABN.level_up_rank(context.other_card, context.other_card.base.value, card.ability.extra.planet)
            end
            if index == 3 then
                context.other_card:set_edition(card.ability.extra.edition)
            end
            return ret
        end

        if context.after and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local max_index = #ability_table
                    card.ability.extra.index = card.ability.extra.index or 1
                    card.ability.extra.index = card.ability.extra.index + 1

                    if card.ability.extra.index > max_index then
                        card.ability.extra.index = 1
                    end
                    return true
                end
            }))

            return {
                message = localize('k_reset')
            }
        end
    end,


    abn_artist_credits = {
        artist = "Shepcicle",
    },
}
