SMODS.Booster({
  key = 'standard_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 0, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "Standard",
  group_key = 'k_standard_kiddy',
  discovered = false,

  create_card = function(self, card, i)
    local _edition = SMODS.poll_edition { key = "standard_kiddy" .. G.GAME.round_resets.ante, mod = 2, no_negative = true }
    local _seal = SMODS.poll_seal({ mod = 10 })
    return {
      set = "Playing Card",
      edition = _edition,
      seal = _seal,
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_standard"
    }
  end,

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
    ease_background_colour_blind(G.STATES.STANDARD_PACK)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.3,
      initialize = true,
      lifespan = 3,
      speed = 0.2,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.BLACK, G.C.RED },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
})

SMODS.Booster({
  key = 'arcana_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 1, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "Arcana",
  group_key = 'k_arcana_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card, i)
    local _card
    if G.GAME.used_vouchers.v_omen_globe and pseudorandom('omen_globe') > 0.8 then
      _card = {
        set = "Spectral",
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true,
        key_append =
        "abn_ar2"
      }
    else
      _card = {
        set = "Tarot",
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true,
        key_append =
        "abn_ar1"
      }
    end
    return _card
  end,

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
    ease_background_colour_blind(G.STATES.TAROT_PACK)
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
      colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
})

SMODS.Booster({
  key = 'spectral_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 1, y = 1 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "Spectral",
  group_key = 'k_spectral_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card, i)
    return {
      set = "Spectral",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_spectral"
    }
  end,

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
    ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
  end,
  particles = function(self)
    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
      timer = 0.015,
      scale = 0.1,
      initialize = true,
      lifespan = 3,
      speed = 0.2,
      padding = -1,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, lighten(G.C.GOLD, 0.2) },
      fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
  end,
})

SMODS.Booster({
  key = 'celestial_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 0, y = 1 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "Celestial",
  group_key = 'k_celestial_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card, i)
    local _card
    if G.GAME.used_vouchers.v_telescope and i == 1 then
      local _planet, _hand, _tally = nil, nil, 0
      for _, handname in ipairs(G.handlist) do
        if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
          _hand = handname
          _tally = G.GAME.hands[handname].played
        end
      end
      if _hand then
        for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
          if planet_center.config.hand_type == _hand then
            _planet = planet_center.key
          end
        end
      end
      _card = {
        set = "Planet",
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true,
        key = _planet,
        key_append = "abn_pl1"
      }
    else
      _card = {
        set = "Planet",
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true,
        key_append = "abn_pl2"
      }
    end
    return _card
  end,

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
    ease_background_colour_blind(G.STATES.PLANET_PACK)
  end,
  particles = function(self)
    G.booster_pack_stars = Particles(1, 1, 0, 0, {
      timer = 0.07,
      scale = 0.1,
      initialize = true,
      lifespan = 15,
      speed = 0.1,
      padding = -4,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE, HEX('a7d6e0'), HEX('fddca0') },
      fill = true
    })
    G.booster_pack_meteors = Particles(1, 1, 0, 0, {
      timer = 2,
      scale = 0.05,
      lifespan = 1.5,
      speed = 4,
      attach = G.ROOM_ATTACH,
      colours = { G.C.WHITE },
      fill = true
    })
  end,
})

SMODS.Booster({
  key = 'astro_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 6, y = 1 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Astro",
  group_key = 'k_astro_kiddy',
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
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },

    }
  end,

  ease_background_colour = function(self)
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.astro_cards)
    ease_background_colour({ new_colour = G.C.SET.astro_cards, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'sigil_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 5, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Sigil",
  group_key = 'k_sigil_kiddy',
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
    local cfg = (card and card.ability) or self.config
    return {
      vars = {
        math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
          math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
        math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0)) },

    }
  end,

  ease_background_colour = function(self)
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.sigils)
    ease_background_colour({ new_colour = G.C.SET.sigils, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'weather_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 2, y = 2 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Weather",
  group_key = 'k_weather_kiddy',
  discovered = false,

  create_card = function(self, card)
    return {
      set = "weather_report",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_weather"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.weather_report)
    ease_background_colour({ new_colour = G.C.SET.weather_report, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'lexica_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 4, y = 1 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Lexica",
  group_key = 'k_lexica_kiddy',
  select_card = 'consumeables',
  discovered = false,

  create_card = function(self, card)
    return {
      set = "lexica",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_lexica"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.lexica)
    ease_background_colour({ new_colour = G.C.SET.lexica, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'continent_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 1, y = 2 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Continent",
  group_key = 'k_continent_kiddy',
  select_card = 'consumeables',
  discovered = false,

  create_card = function(self, card)
    return {
      set = "continent",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_continent"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.continent)
    ease_background_colour({ new_colour = G.C.SET.continent, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'solid_state_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 2, y = 1 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_solid_state",
  group_key = 'k_solid_state_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "solid_state",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_solid_state"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.solid_state)
    ease_background_colour({ new_colour = G.C.SET.solid_state, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'program_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 7, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Program",
  group_key = 'k_program_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "program_pack",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_program"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.program_pack)
    ease_background_colour({ new_colour = G.C.SET.program_pack, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'calligraphy_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 3, y = 1 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Calligraphy",
  group_key = 'k_calligraphy_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "calligraphy",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_calligraphy"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calligraphy)
    ease_background_colour({ new_colour = G.C.SET.calligraphy, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'glyph_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 6, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Glyph",
  group_key = 'k_glyph_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "glyphs",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_glyph"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.glyphs)
    ease_background_colour({ new_colour = G.C.SET.glyphs, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

SMODS.Booster({
  key = 'calamity_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 3, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Calamity",
  group_key = 'k_calamity_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "calamity_cards",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_calamity"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
    ease_background_colour({ new_colour = G.C.SET.calamity_cards, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})

--[[ no art so commented out for now
SMODS.Booster({
  key = 'illusion_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 0, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Illusion",
  group_key = 'k_illusion_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "illusion",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_illusion"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.illusion)
    ease_background_colour({ new_colour = G.C.SET.illusion, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "???",
  },
})
--]]

SMODS.Booster({
  key = 'crimson_kiddy',
  atlas = 'ABNKiddyPack',
  pos = { x = 4, y = 0 },
  config = { extra = 2, choose = 1, kiddy = true },
  weight = 1,
  cost = 2,
  kind = "abn_Crimson",
  group_key = 'k_crimson_kiddy',
  draw_hand = true,
  discovered = false,

  create_card = function(self, card)
    return {
      set = "crimson",
      area = G.pack_cards,
      skip_materialize = true,
      soulable = true,
      key_append = "abn_crimson"
    }
  end,

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
    ease_colour(G.C.DYN_UI.MAIN, G.C.SET.crimson)
    ease_background_colour({ new_colour = G.C.SET.crimson, special_colour = G.C.GOLD, contrast = 2 })
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
})
