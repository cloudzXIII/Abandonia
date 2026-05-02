--#region Astro Booster Packs
SMODS.Booster({
  key = 'astro_normal_1',
  atlas = 'AstroBoosters',
  pos = { x = 0, y = 0 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_normal_1',
  atlas = 'AstroBoosters',
  pos = { x = 1, y = 0 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_normal_3',
  atlas = 'AstroBoosters',
  pos = { x = 2, y = 0 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_normal_4',
  atlas = 'AstroBoosters',
  pos = { x = 3, y = 0 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_jumbo_1',
  atlas = 'AstroBoosters',
  pos = { x = 0, y = 1 },
  config = { extra = 5, choose = 1 },
  weight = 1,
  cost = 6,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_jumbo_2',
  atlas = 'AstroBoosters',
  pos = { x = 1, y = 1 },
  config = { extra = 5, choose = 1 },
  weight = 1,
  cost = 6,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_mega_1',
  atlas = 'AstroBoosters',
  pos = { x = 2, y = 1 },
  config = { extra = 5, choose = 2 },
  weight = 0.25,
  cost = 8,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})

SMODS.Booster({
  key = 'astro_mega_2',
  atlas = 'AstroBoosters',
  pos = { x = 3, y = 1 },
  config = { extra = 5, choose = 2 },
  weight = 0.25,
  cost = 8,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = true,
  create_card = function(self, card)
    return {
      set = "astro_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_astro_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.astro_cards, special_colour = G.C.PURPLE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour(chosen_effect)
  end
})
--#endregion
