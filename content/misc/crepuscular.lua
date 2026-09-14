SMODS.ConsumableType {
  key = "crepuscular",
  primary_colour = HEX("547799"),
  secondary_colour = HEX("547799"),
  text_colour = HEX("0f1725"),
  collection_rows = { 6, 6 },
  shop_rate = 4,
}

SMODS.Consumable {
    key = "sailboat",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 0, y = 1 },
    config = { max_highlighted = 2, mod_conv = 'm_abn_ocean' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    abn_artist_credits = {
        artist = "SmoliconBoi",
    },
}

SMODS.Consumable {
    key = "stone_of_destiny",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 2, y = 1 },
    config = { max_highlighted = 2, mod_conv = 'm_abn_kinship' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    abn_artist_credits = {
        artist = "SmoliconBoi",
    },
}