local original_add_tag = add_tag
function add_tag(tag, immediate)
    if not tag._from_consumable_joker and next(SMODS.find_card("j_abn_consumable_tag")) then
        local bonus_tags = { "tag_charm", "tag_ethereal", "tag_meteor" }
        local random_key = pseudorandom_element(bonus_tags, pseudoseed("abn_consumable_tag"))
        
        local extra_tag = Tag(random_key)
        extra_tag._from_consumable_joker = true
        add_tag(extra_tag, immediate)
    end

    original_add_tag(tag, immediate)
end

local original_use_card = G.FUNCS.use_card
G.FUNCS.use_card = function(e, mute, nosave)
    if e and e.config and e.config.ref_table then
        local card = e.config.ref_table
        if card.from_tag then
            -- Check pack/set key for excluded terms
            local pack_key = (card.config and card.config.center and card.config.center.key) or ""
            local set_key = (card.ability and card.ability.set) or ""
            local combined_key = (pack_key .. "_" .. set_key):lower()

            local is_excluded = combined_key:find("buffoon") 
                             or combined_key:find("standard") 
                             or combined_key:find("augment")

            if not is_excluded then
                local joker_cards = SMODS.find_card("j_abn_consumable_tag")
                if next(joker_cards) then
                    for _, joker in ipairs(joker_cards) do
                        if joker.ability and joker.ability.extra then
                            local extra = joker.ability.extra
                            local add_val = extra.xmultadd or 0
                            extra.xmult = (extra.xmult or 1) + add_val

                            card_eval_status_text(joker, 'extra', nil, nil, nil, {
                                message = localize('k_upgrade_ex'),
                                colour = G.C.MULT,
                            })
                        end
                    end
                end
            end
        end
    end

    return original_use_card(e, mute, nosave)
end

SMODS.Joker {
    key = 'consumable_tag',
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet24', 
    pos = { x = 7, y = 3 },
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            xmult = 1,
            xmultadd = 0.20,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultadd,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Patitofi8",
    },
}