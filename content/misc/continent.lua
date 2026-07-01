-- Continent Card Consumables (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "continent",
  primary_colour = HEX("85b878"),
  secondary_colour = HEX("85b878"),
  collection_rows = { 6, 6 },
  shop_rate = 0.0,
}

local set_cost_ref = Card.set_cost -- for some reason hooking Card:set_sell_value() didn't work?
function Card:set_cost()
  local ret = set_cost_ref(self)
  if self.ability.set == "continent" then
    if next(SMODS.find_card("j_abn_explorer_joker")) then
      self.sell_cost = 5
    else
      self.sell_cost = 1
    end
  end
  return ret
end

ABN.ContinentCard = SMODS.Consumable:extend({
  set = 'continent',
  cost = 10,
  atlas = "abn_AbandoniaContinents",
  pos = { x = 0, y = 0 },
  pixel_size = { w = 65, h = 94 },
  display_size = { w = 65, h = 94 },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
  abn_artist_credits = {
    artist = "Muddz"
  },
  select_card = "consumeables"
})

ABN.ContinentCard {
  key = "africa",
  pos = { x = 4, y = 1 },
  config = { extra = { mult = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_diamond", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_diamond", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Diamonds") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
  abn_artist_credits = {
    artist = "HyperReal63"
  },
}

ABN.ContinentCard {
  key = "australia",
  pos = { x = 2, y = 1 },
  config = { extra = { mult = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_spade", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_spade", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Spades") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}

ABN.ContinentCard {
  key = "asia",
  pos = { x = 0, y = 1 },
  config = { extra = { chips = 10 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_daytime", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_daytime", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_light(c) then
        c.ability.perma_chips = (c.ability.perma_chips or 0) + card.ability.extra.chips
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}

ABN.ContinentCard {
  key = "europe",
  pos = { x = 3, y = 1 },
  config = { extra = { mult = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_club", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_club", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Clubs") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
  abn_artist_credits = {
    artist = "cloudzXIII",
    colour = G.C.GOLD
  },
}

ABN.ContinentCard {
  key = "antarctica",
  pos = { x = 1, y = 1 },
  config = { extra = { chips = 10 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_nighttime", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_nighttime", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_dark(c) then
        c.ability.perma_chips = (c.ability.perma_chips or 0) + card.ability.extra.chips
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}

ABN.ContinentCard {
  key = "south_america",
  pos = { x = 5, y = 1 },
  config = { extra = { mult = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_heart", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_heart", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("Hearts") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat"
  },
}

ABN.ContinentCard {
  key = "north_america",
  pos = { x = 0, y = 2 },
  config = { extra = { sell_value = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_jimbo_legacy", set = "Other", vars = { 50 } }
    local cae = card.ability.extra
    return { vars = { cae.sell_value } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_jimbo_legacy", true)
    joker:juice_up()
    G.jokers:unhighlight_all()
    for _, other_card in ipairs(G.jokers.cards) do
      other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
          card.ability.extra.sell_value
      SMODS.calculate_effect({ message = localize('k_val_up'), colour = G.C.MONEY }, other_card)
      other_card:set_cost()
    end
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat"
  },
}

ABN.ContinentCard {
  key = "atlantis",
  pos = { x = 5, y = 2 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_weight", set = "Other", vars = { 2 } }
    info_queue[#info_queue + 1] = { key = "abn_fragile", set = "Other", vars = { 1, 4 } }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_weight", true)
    joker:juice_up()

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("abn_fragile", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Penumbra") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}

ABN.ContinentCard {
  key = "hyperborea",
  pos = { x = 0, y = 3 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_even_legacy", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "perishable", set = "Other", vars = { 5, 5 } }
    info_queue[#info_queue + 1] = { key = "rental", set = "Other", vars = { 3 } }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_even_legacy", true)
    joker:juice_up()

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("perishable", true)
    leftmost:add_sticker("rental", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Snow") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}

ABN.ContinentCard {
  key = "lemuria",
  pos = { x = 0, y = 0 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_odd_legacy", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "abn_downgrade", set = "Other", vars = { -5 } }
    info_queue[#info_queue + 1] = { key = "eternal", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_odd_legacy", true)
    joker:juice_up()

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("abn_downgrade", true)
    leftmost:add_sticker("eternal", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Bow") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}

ABN.ContinentCard {
  key = "mu",
  pos = { x = 4, y = 0 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_rejok_legacy", set = "Other", vars = { 100 } }
    info_queue[#info_queue + 1] = { key = "rental", set = "Other", vars = { 3 } }
    info_queue[#info_queue + 1] = { key = "eternal", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_rejok_legacy", true)
    joker:juice_up()

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("rental", true)
    leftmost:add_sticker("eternal", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Tie") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.jokers and #G.jokers.cards > 0
  end,
}


ABN.ContinentCard {
  key = "asgard",
  pos = { x = 2, y = 2 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_obmij_legacy", set = "Other", vars = { 20 } }
    info_queue[#info_queue + 1] = { key = "rental", set = "Other", vars = { 3 } }
    info_queue[#info_queue + 1] = { key = "abn_fragile", set = "Other", vars = { 1, 4 } }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_obmij_legacy", true)
    joker:juice_up()

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("rental", true)
    leftmost:add_sticker("abn_fragile", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
    for _, c in ipairs(G.hand.cards) do
      if c:is_suit("abn_Tie") then
        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, c)
      end
    end
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0
  end,
}


ABN.ContinentCard {
  key = "shangrila",
  pos = { x = 3, y = 2 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_lucky", set = "Other", vars = { 1, 6, 10 } }
    info_queue[#info_queue + 1] = { key = "abn_possibility", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "eternal", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "abn_eraser", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker_to_destroy = G.jokers.cards[#G.jokers.cards]
    if joker_to_destroy:is_rarity("Common") then
      joker_to_destroy.getting_sliced = true
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card {
            set = 'Joker',
            rarity = "Uncommon",
            stickers = { "abn_lucky", "abn_possibility" }, force_stickers = true
          }
          return true
        end
      }))
    end

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("eternal", true)
    leftmost:add_sticker("abn_eraser", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and
        G.jokers.cards[#G.jokers.cards]:is_rarity("Common")
  end,
}

ABN.ContinentCard {
  key = "ker_is",
  pos = { x = 3, y = 0 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_glove_hand", set = "Other", vars = { 1 } }
    info_queue[#info_queue + 1] = { key = "abn_bullseye", set = "Other", vars = { 100 } }
    info_queue[#info_queue + 1] = { key = "abn_eraser", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "rental", set = "Other", vars = { 3 } }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,
  use = function(self, card, area, copier)
    local joker_to_destroy = G.jokers.cards[#G.jokers.cards]
    if joker_to_destroy:is_rarity("Uncommon") then
      joker_to_destroy.getting_sliced = true
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card {
            set = 'Joker',
            rarity = "Rare",
            stickers = { "abn_glove_hand", "abn_bullseye" }, force_stickers = true
          }
          return true
        end
      }))
    end

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("rental", true)
    leftmost:add_sticker("abn_eraser", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and
        G.jokers.cards[#G.jokers.cards]:is_rarity("Uncommon")
  end,
}


ABN.ContinentCard {
  key = "avalon",
  pos = { x = 1, y = 0 },
  config = { extra = { mult = 2, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_shovel", set = "Other", vars = { 2 } }
    info_queue[#info_queue + 1] = { key = "abn_jester_legacy", set = "Other", vars = { 40 } }
    info_queue[#info_queue + 1] = { key = "abn_chain", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "rental", set = "Other", vars = { 3 } }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,

  hidden = true,
  soul_set = 'continent',

  use = function(self, card, area, copier)
    local joker_to_destroy = G.jokers.cards[#G.jokers.cards]
    if joker_to_destroy:is_rarity("Rare") then
      joker_to_destroy.getting_sliced = true
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card {
            set = 'Joker',
            rarity = "abn_SuperRare",
            stickers = { "abn_shovel", "abn_jester_legacy" }, force_stickers = true
          }
          return true
        end
      }))
    end

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("rental", true)
    leftmost:add_sticker("abn_chain", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and
        G.jokers.cards[#G.jokers.cards]:is_rarity("Rare")
  end,
}

ABN.ContinentCard {
  key = "el_dorado",
  pos = { x = 4, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_immortal", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "abn_odd_legacy", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "abn_cat_eye", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "eternal", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "abn_even_legacy", set = "Other", vars = {} }
    info_queue[#info_queue + 1] = { key = "abn_lightning_bolt", set = "Other", vars = {} }
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,

  hidden = true,
  soul_set = 'continent',

  use = function(self, card, area, copier)
    local joker = G.jokers.cards[#G.jokers.cards]
    joker:add_sticker("abn_immortal", true)
    joker:add_sticker("abn_odd_legacy", true)
    joker:add_sticker("abn_cat_eye", true)
    joker:juice_up()

    local leftmost = G.jokers.cards[1]
    leftmost:add_sticker("eternal", true)
    leftmost:add_sticker("abn_even_legacy", true)
    leftmost:add_sticker("abn_lightning_bolt", true)
    leftmost:juice_up()
    G.jokers:unhighlight_all()
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0
  end,
}
