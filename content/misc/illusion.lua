SMODS.ConsumableType {
  key = "illusion",
  primary_colour = HEX("d4bae6"),
  secondary_colour = HEX("40145d"),
  collection_rows = { 6, 6 },
  shop_rate = 0,
}

SMODS.Consumable {
    key = "euclidean",
    set = 'illusion',
    cost = 4,
    atlas = "abn_AbandoniaIllusions",
    pos = { x = 0, y = 0 },
    config = { extra = { cards = 1, odds = 6 } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_abn_penrose
        return { vars = { card.ability.extra.cards, G.GAME.probabilities.normal, card.ability.extra.odds } }
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
                abn_add_stamp(c, "abn_empty_stamp")
            end
        end

        if pseudorandom('euclidean') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
					play_sound('timpani')
                    local c = create_card('illusion', G.consumeables, nil, nil, nil, nil, 'c_abn_penrose', 'euclid')
                    c:add_to_deck()
                    G.consumeables:emplace(c)
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot })
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "0kronix"
    },
}

SMODS.Consumable {
    key = "penrose",
    set = 'illusion',
    cost = 4,
    atlas = "abn_AbandoniaIllusions",
    pos = { x = 0, y = 1 }, 
    config = {},
	hidden = true,
    soul_set = "illusion",
    soul_rate = 0,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_empty_stamp", set = "Other", vars = {} }
        return { vars = {} }
    end,

    can_use = function(self, card)
        if G and G.hand and G.hand.cards then
            return #G.hand.cards > 0
        end
        return false
    end,

    use = function(self, card, area, copier)

        if G and G.hand and G.hand.cards then
            for i = 1, #G.hand.cards do
                local c = G.hand.cards[i]
                abn_add_stamp(c, "abn_empty_stamp")
            end
        end
    end,

    abn_artist_credits = {
        artist = "Grummy"
    },
}