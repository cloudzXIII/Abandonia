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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'astro_normal_2',
  atlas = 'AstroBoosters',
  pos = { x = 1, y = 0 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_astrobooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
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
  discovered = false,
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
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})
--#endregion

--#region Sigil Booster Packs

-- Hook to disable skipping
local can_skip_booster_ref = G.FUNCS.can_skip_booster
G.FUNCS.can_skip_booster = function(e)
  -- Run the original logic first to handle standard UI states
  can_skip_booster_ref(e)

  -- Check if the pack contains sigils
  if G.pack_cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].config.center.set == 'sigils' then
    -- Grey out the button and remove the click functionality
    e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    e.config.button = nil
  end
end

SMODS.Booster({
  key = 'sigil_normal_1',
  atlas = 'SigilBoosters',
  pos = { x = 0, y = 0 },

  config = { extra = 3, choose = 1 },
  weight = 0.2,
  cost = 4,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_normal_2',
  atlas = 'SigilBoosters',
  pos = { x = 1, y = 0 },

  config = { extra = 3, choose = 1 },
  weight = 0.2,
  cost = 4,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_normal_3',
  atlas = 'SigilBoosters',
  pos = { x = 2, y = 0 },

  config = { extra = 3, choose = 1 },
  weight = 0.2,
  cost = 4,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_normal_4',
  atlas = 'SigilBoosters',
  pos = { x = 3, y = 0 },

  config = { extra = 3, choose = 1 },
  weight = 0.2,
  cost = 4,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_jumbo_1',
  atlas = 'SigilBoosters',
  pos = { x = 0, y = 1 },

  config = { extra = 5, choose = 1 },
  weight = 0.2,
  cost = 6,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_jumbo_2',
  atlas = 'SigilBoosters',
  pos = { x = 1, y = 1 },

  config = { extra = 5, choose = 1 },
  weight = 0.2,
  cost = 6,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_mega_1',
  atlas = 'SigilBoosters',
  pos = { x = 2, y = 1 },

  config = { extra = 5, choose = 2 },
  weight = 0.1,
  cost = 8,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'sigil_mega_2',
  atlas = 'SigilBoosters',
  pos = { x = 2, y = 1 },

  config = { extra = 5, choose = 2 },
  weight = 0.1,
  cost = 8,
  group_key = 'abn_sigilbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "sigils",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_sigils"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})
--#endregion

--#region Weather Packs
SMODS.Booster {
  key = "weather_normal_1",
  weight = 1,
  kind = 'Weather',
  cost = 4,
  atlas = "AbandoniaWeatherPack",
  pos = { x = 0, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_weather_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.weather_report, special_colour = G.C.BLUE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.weather_report)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.BLUE, 0.4), lighten(G.C.BLUE, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "weather_report",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "weather_normal_2",
  weight = 1,
  kind = 'Weather',
  cost = 4,
  atlas = "AbandoniaWeatherPack",
  pos = { x = 1, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_weather_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.weather_report, special_colour = G.C.BLUE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.weather_report)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.BLUE, 0.4), lighten(G.C.BLUE, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "weather_report",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "weather_normal_3",
  weight = 1,
  kind = 'Weather',
  cost = 4,
  atlas = "AbandoniaWeatherPack",
  pos = { x = 2, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_weather_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.weather_report, special_colour = G.C.BLUE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.weather_report)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.BLUE, 0.4), lighten(G.C.BLUE, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "weather_report",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "weather_jumbo",
  weight = 1,
  kind = 'Weather',
  cost = 6,
  atlas = "AbandoniaWeatherPack",
  pos = { x = 0, y = 1 },
  config = { extra = 5, choose = 1 },
  group_key = "k_weather_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.weather_report, special_colour = G.C.BLUE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.weather_report)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.BLUE, 0.4), lighten(G.C.BLUE, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "weather_report",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "weather_mega",
  weight = 0.25,
  kind = 'Weather',
  cost = 8,
  atlas = "AbandoniaWeatherPack",
  pos = { x = 1, y = 1 },
  config = { extra = 5, choose = 2 },
  group_key = "k_weather_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.weather_report, special_colour = G.C.BLUE, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.weather_report)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.BLUE, 0.4), lighten(G.C.BLUE, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "weather_report",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

--#endregion

--#region Lexica Packs
SMODS.Booster {
  key = "lexica_normal_1",
  weight = 1,
  kind = 'Lexica',
  cost = 4,
  atlas = "AbandoniaLexicaPack",
  pos = { x = 0, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_lexica_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.lexica, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.lexica)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.FILTER, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "lexica",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "lexica_normal_2",
  weight = 1,
  kind = 'Lexica',
  cost = 4,
  atlas = "AbandoniaLexicaPack",
  pos = { x = 1, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_lexica_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.lexica, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.lexica)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.FILTER, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "lexica",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "lexica_normal_3",
  weight = 1,
  kind = 'Lexica',
  cost = 4,
  atlas = "AbandoniaLexicaPack",
  pos = { x = 2, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_lexica_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.lexica, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.lexica)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.FILTER, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "lexica",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "lexica_jumbo",
  weight = 1,
  kind = 'Lexica',
  cost = 6,
  atlas = "AbandoniaLexicaPack",
  pos = { x = 0, y = 1 },
  config = { extra = 5, choose = 1 },
  group_key = "k_lexica_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.lexica, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.lexica)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.FILTER, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "lexica",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "lexica_mega",
  weight = 0.25,
  kind = 'Lexica',
  cost = 8,
  atlas = "AbandoniaLexicaPack",
  pos = { x = 1, y = 1 },
  config = { extra = 5, choose = 2 },
  group_key = "k_lexica_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.lexica, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.lexica)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.FILTER, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "lexica",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}
--#endregion

--#region Continent Packs
SMODS.Booster {
  key = "continent_normal_1",
  weight = 1,
  kind = 'Continent',
  cost = 4,
  atlas = "AbandoniaContinentPack",
  pos = { x = 0, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_continent_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.continent, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.continent)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.GREEN, 0.2), lighten(G.C.PALE_GREEN, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "continent",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}
SMODS.Booster {
  key = "continent_normal_2",
  weight = 1,
  kind = 'Continent',
  cost = 4,
  atlas = "AbandoniaContinentPack",
  pos = { x = 1, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_continent_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.continent, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.continent)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.GREEN, 0.2), lighten(G.C.PALE_GREEN, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "continent",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}


SMODS.Booster {
  key = "continent_normal_3",
  weight = 1,
  kind = 'Continent',
  cost = 4,
  atlas = "AbandoniaContinentPack",
  pos = { x = 2, y = 0 },
  config = { extra = 3, choose = 1 },
  group_key = "k_continent_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.continent, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.continent)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.GREEN, 0.2), lighten(G.C.PALE_GREEN, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "continent",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}


SMODS.Booster {
  key = "continent_jumbo",
  weight = 1,
  kind = 'Continent',
  cost = 6,
  atlas = "AbandoniaContinentPack",
  pos = { x = 0, y = 1 },
  config = { extra = 5, choose = 1 },
  group_key = "k_continent_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.continent, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.continent)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.GREEN, 0.2), lighten(G.C.PALE_GREEN, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "continent",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}


SMODS.Booster {
  key = "continent_mega",
  weight = 0.25,
  kind = 'Continent',
  cost = 8,
  atlas = "AbandoniaContinentPack",
  pos = { x = 1, y = 1 },
  config = { extra = 5, choose = 2 },
  group_key = "k_continent_pack",
  select_card = 'consumeables',
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.continent, special_colour = G.C.FILTER, contrast = 3 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.continent)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.FILTER, 0.4), lighten(G.C.GREEN, 0.2), lighten(G.C.PALE_GREEN, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "continent",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "solid_normal_1",
  weight = 1,
  kind = 'solid_state',
  cost = 4,
  atlas = "abn_AbandoniaSolidState",
  pos = { x = 0, y = 3 },
  config = { extra = 3, choose = 1 },
  group_key = "k_solid_pack",
  draw_hand = true,
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.solid_state, special_colour = G.C.SET.solid_state, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.solid_state)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { 
        G.C.WHITE, 
        G.C.SET.solid_state,                
        lighten(G.C.SET.solid_state, 0.4),  
        darken(G.C.PURPLE, 0.2)              
      },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "solid_state",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "solid_normal_2",
  weight = 1,
  kind = 'solid_state',
  cost = 4,
  atlas = "abn_AbandoniaSolidState",
  pos = { x = 1, y = 3 },
  config = { extra = 3, choose = 1 },
  group_key = "k_solid_pack",
  draw_hand = true,
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.solid_state, special_colour = G.C.SET.solid_state, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.solid_state)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { 
        G.C.WHITE, 
        G.C.SET.solid_state,                
        lighten(G.C.SET.solid_state, 0.4),  
        darken(G.C.PURPLE, 0.2)              
      },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "solid_state",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "solid_jumbo_1",
  weight = 1,
  kind = 'solid_state',
  cost = 6,
  atlas = "abn_AbandoniaSolidState",
  pos = { x = 2, y = 3 },
  config = { extra = 5, choose = 1 },
  group_key = "k_solid_pack",
  draw_hand = true,
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.solid_state, special_colour = G.C.SET.solid_state, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.solid_state)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { 
        G.C.WHITE, 
        G.C.SET.solid_state,                
        lighten(G.C.SET.solid_state, 0.4),  
        darken(G.C.PURPLE, 0.2)              
      },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "solid_state",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster {
  key = "solid_mega_1",
  weight = 1,
  kind = 'solid_state',
  cost = 8,
  atlas = "abn_AbandoniaSolidState",
  pos = { x = 3, y = 3 },
  config = { extra = 5, choose = 2 },
  group_key = "k_solid_pack",
  draw_hand = true,
  loc_vars = function(self, info_queue, card)
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },
      key = self.key:sub(1, -3),
    }
  end,
  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.SET.solid_state, special_colour = G.C.SET.solid_state, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.solid_state)
    ease_background_colour(chosen_effect)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.2,
      initialize = true,
      lifespan = 1,
      speed = 1.1,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { 
        G.C.WHITE, 
        G.C.SET.solid_state,                
        lighten(G.C.SET.solid_state, 0.4),  
        darken(G.C.PURPLE, 0.2)              
      },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card, i)
    return {
      set = "solid_state",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
    }
  end,
}

SMODS.Booster({
  key = 'program_normal_1',
  atlas = 'abn_AbandoniaProgramPack',
  pos = { x = 0, y = 2 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_programbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "program_pack",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_program_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREEN, special_colour = G.C.MULT, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.program_pack)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'program_normal_2',
  atlas = 'abn_AbandoniaProgramPack',
  pos = { x = 1, y = 2 },
  config = { extra = 3, choose = 1 },
  weight = 1,
  cost = 4,
  group_key = 'abn_programbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "program_pack",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_program_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREEN, special_colour = G.C.MULT, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.program_pack)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'program_jumbo_1',
  atlas = 'abn_AbandoniaProgramPack',
  pos = { x = 2, y = 2 },
  config = { extra = 5, choose = 1 },
  weight = 1,
  cost = 6,
  group_key = 'abn_programbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "program_pack",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_program_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREEN, special_colour = G.C.MULT, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.program_pack)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})

SMODS.Booster({
  key = 'program_mega_1',
  atlas = 'abn_AbandoniaProgramPack',
  pos = { x = 3, y = 2 },
  config = { extra = 5, choose = 2 },
  weight = 1,
  cost = 8,
  group_key = 'abn_programbooster',
  draw_hand = true,
  unlocked = true,
  discovered = false,
  create_card = function(self, card)
    return {
      set = "program_pack",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_program_cards"
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.choose, card.ability.extra }, key = self.key:sub(1, -3), }
  end,

  ease_background_colour = function(self)
    local effects = {
      { new_colour = G.C.GREEN, special_colour = G.C.MULT, contrast = 2 },
    }
    local random_index = math.random(#effects)
    local chosen_effect = effects[random_index]
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.program_pack)
    ease_background_colour(chosen_effect)
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
})