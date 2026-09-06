SMODS.Sticker {
    key = 'membership_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 4, y = 0 },
    badge_colour = HEX("df73ff"),
    set = "stamp",

    add_to_deck = function(self, card, from_debuff)
        card.ability.abn_stamp_extra = card.ability.abn_stamp_extra or {}
        card.ability.abn_stamp_extra.asc = card.ability.abn_stamp_extra.asc or 0
        card.ability.abn_stamp_extra.asc_add = card.ability.abn_stamp_extra.asc_add or 0.01
    end,

    loc_vars = function(self, info_queue, card)
        local extra = card and card.ability and card.ability.abn_stamp_extra or {}
        return { 
            vars = { 
                extra.asc_add or 0.01,
                extra.asc or 0
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if not G.playing_cards then return end

            card.ability.abn_stamp_extra = card.ability.abn_stamp_extra or {}
            card.ability.abn_stamp_extra.asc = card.ability.abn_stamp_extra.asc or 0
            card.ability.abn_stamp_extra.asc_add = card.ability.abn_stamp_extra.asc_add or 0.01

            local card_edition = card.edition and card.edition.key or nil
            local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
            local card_seal = card.seal or nil

            local has_all_traits = card_edition and card_enhancement and card_seal
            local is_unique = false

            if has_all_traits then
                is_unique = true
                for _, other_card in ipairs(G.playing_cards) do
                    if other_card ~= card then
                        local other_edition = other_card.edition and other_card.edition.key or nil
                        local other_enhancement = (other_card.config.center and other_card.config.center.key ~= 'c_base') and other_card.config.center.key or nil
                        local other_seal = other_card.seal or nil

                        if (card_edition == other_edition) or 
                           (card_enhancement == other_enhancement) or 
                           (card_seal == other_seal) then
                            is_unique = false
                            break
                        end
                    end
                end
            end

            if is_unique then
                local added = card.ability.abn_stamp_extra.asc_add
                card.ability.abn_stamp_extra.asc = card.ability.abn_stamp_extra.asc + added
                
                return {
					message = localize('k_upgrade_ex'),
					colour = G.C.GOLD,
                    asc = card.ability.abn_stamp_extra.asc,
                    card = card
                }
            end
        end
    end
}

SMODS.Consumable {
    key = "stupification",
    set = 'illusion',
    cost = 4,
    atlas = "abn_AbandoniaIllusions",
    pos = { x = 6, y = 0 },
    config = { extra = { cards = 1, } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_membership_stamp", set = "Other", vars = { 0.01, 0} }
        return { vars = { card.ability.extra.cards, } }
    end,

    can_use = function(self, card)
        if G and G.hand and G.hand.highlighted and card.ability and card.ability.extra and card.ability.extra.cards then
            if #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.cards then
                return true
            end
        end
        return false
    end,

    use = function(self, card, area, copier)
        if G and G.hand and G.hand.highlighted then
            for i = 1, #G.hand.highlighted do
                local c = G.hand.highlighted[i]
                abn_add_stamp(c, "abn_membership_stamp")
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b"
    },
}