SMODS.Joker {
    key = 'tri_tag',
    rarity = 3,
    cost = 8,
    atlas = 'ABNJokerSheet24', 
    pos = { x = 9, y = 3 },
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            xmult = 1,
            xmultadd = 0.35,
            xchips = 1,
            xchipsadd = 0.50,
            dollars = 3,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultadd,
                card.ability.extra.xchips,
                card.ability.extra.xchipsadd,
                card.ability.extra.dollars,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.tag_added then
            local tag = context.tag_added
            local tag_key = tag and tag.key and tag.key:lower() or ''
            local tag_def = tag and tag.key and SMODS.Tags[tag.key]
            
            local is_hazard = string.find(tag_key, 'hazard') ~= nil
            local is_modded = (tag and tag.config and tag.config.mod) or (tag_def and tag_def.mod and tag_def.mod.id ~= "SMODS")

            if is_hazard then
                return {
                    dollars = card.ability.extra.dollars,
                    colour = G.C.MONEY,
                    card = card
                }
            elseif is_modded then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = card
                }
            else
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                xchips = card.ability.extra.xchips,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Patitofi8",
    },
}