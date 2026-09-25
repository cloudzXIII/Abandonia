ABN.create_boosters_for_set = function(args)
  local set = args.set or "lexica"
  local atlas = args.atlas or "AbandoniaLexicaPack"
  local pos = args.booster_pos or {
    normal = {
      { x = 0, y = 0 },
      { x = 1, y = 0 },
      { x = 2, y = 0 },
      { x = 3, y = 0 },
    },
    jumbo = {
      { x = 0, y = 1 },
      { x = 1, y = 1 },
    },
    mega = {
      { x = 2, y = 1 },
      { x = 3, y = 1 },
    }
  }

  for i = 1, #pos["normal"] or 4 do
    SMODS.Booster({
      key = (args.key_prefix or set) .. '_normal_' .. i,

      atlas = atlas,
      pos = pos["normal"][i],
      config = { extra = 3, choose = 1 },

      weight = args.normal_weight or 0.8,
      cost = 4,

      kind = "abn_" .. (args.key_prefix or set),

      group_key = 'k_abn_' .. (args.key_prefix or set) .. '_pack',
      draw_hand = args.draw_hand or false,
      discovered = false,

      create_card = function(self, card, i)
        return {
          set = set,
          area = G.pack_cards,
          skip_materialize = true,
          soulable = true,
          key_append = "abn_" .. set
        }
      end,

      loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
          vars = {
            math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
              math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
            math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))
          },
          key = self.key:sub(1, -3),
        }
      end,

      particles = function(self)
        if not args.particles then return end

        return args.particles(self)
      end,
      ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET[set])
        ease_background_colour({ new_colour = G.C.SET[set], special_colour = args.special_colour or G.C.JOKER_GREY, contrast = 2 })
      end,
      abn_artist_credits = {
        artist = args.artist or "???",
      },
      select_card = function(self, card, pack)
        if card.config.center.use then
          return "consumeables", true
        else
          return "consumeables"
        end
      end,
    })
  end

  for i = 1, #pos["jumbo"] or 2 do
    SMODS.Booster({
      key = (args.key_prefix or set) .. '_jumbo_' .. i,

      atlas = atlas,
      pos = pos["jumbo"][i],
      config = { extra = 5, choose = 1 },

      weight = args.jumbo_weight or 0.8,
      cost = 6,

      kind = "abn_" .. (args.key_prefix or set),

      group_key = 'k_abn_' .. (args.key_prefix or set) .. '_pack',
      draw_hand = args.draw_hand or false,
      discovered = false,

      create_card = function(self, card, i)
        return {
          set = set,
          area = G.pack_cards,
          skip_materialize = true,
          soulable = true,
          key_append = "abn_" .. set
        }
      end,

      loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
          vars = {
            math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
              math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
            math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))
          },
          key = self.key:sub(1, -3),
        }
      end,

      particles = function(self)
        if not args.particles then return end

        return args.particles(self)
      end,
      ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET[set])
        ease_background_colour({ new_colour = G.C.SET[set], special_colour = args.special_colour or G.C.JOKER_GREY, contrast = 2 })
      end,
      abn_artist_credits = {
        artist = args.artist or "???",
      },
      select_card = function(self, card, pack)
        if card.config.center.use then
          return "consumeables", true
        else
          return "consumeables"
        end
      end,
    })
  end


  for i = 1, #pos["mega"] or 2 do
    SMODS.Booster({
      key = (args.key_prefix or set) .. '_mega_' .. i,

      atlas = atlas,
      pos = pos["mega"][i],
      config = { extra = 5, choose = 2 },

      weight = args.mega_weight or 0.25,
      cost = 8,

      kind = "abn_" .. (args.key_prefix or set),

      group_key = 'k_abn_' .. (args.key_prefix or set) .. '_pack',
      draw_hand = args.draw_hand or false,
      discovered = false,

      create_card = function(self, card, i)
        return {
          set = set,
          area = G.pack_cards,
          skip_materialize = true,
          soulable = true,
          key_append = "abn_" .. set
        }
      end,

      loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
          vars = {
            math.min(cfg.choose + (G.GAME.modifiers.booster_choice_mod or 0),
              math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))),
            math.max(1, cfg.extra + (G.GAME.modifiers.booster_size_mod or 0))
          },
          key = self.key:sub(1, -3),
        }
      end,


      particles = function(self)
        if not args.particles then return end

        return args.particles(self)
      end,
      ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET[set])
        ease_background_colour({ new_colour = G.C.SET[set], special_colour = args.special_colour or G.C.JOKER_GREY, contrast = 2 })
      end,
      abn_artist_credits = {
        artist = args.artist or "???",
      },
      select_card = function(self, card, pack)
        if card.config.center.use then
          return "consumeables", true
        else
          return "consumeables"
        end
      end,
    })
  end
end


ABN.create_boosters_for_set {
  atlas = "AstroBoosters",
  set = "astro_cards",
  special_colour = G.C.PURPLE,
  draw_hand = true,
  artist = "Vega",
  key_prefix = "astro",
}

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

local function get_sigil_booster_card(self, card, i)
  local card_key = nil

  if i == 1 and #SMODS.find_card('v_abn_athame') > 0 then
    local hand_to_sigil = {
      ['High Card'] = 'c_abn_bael',
      ['Pair'] = 'c_abn_botis',
      ['Two Pair'] = 'c_abn_vinea',
      ['Three of a Kind'] = 'c_abn_morax',
      ['Four of a Kind'] = 'c_abn_bune',
      ['Straight'] = 'c_abn_furfur',
      ['Flush'] = 'c_abn_bifrons',
      ['Full House'] = 'c_abn_crocell',
      ['Straight Flush'] = 'c_abn_belial',
      ['Five of a Kind'] = 'c_abn_astaroth',
      ['Flush House'] = 'c_abn_asmodeus',
      ['Flush Five'] = 'c_abn_camio',
    }

    local most_played = nil
    local max_played = -1

    if G.GAME and G.GAME.hands then
      for hand_name, hand_data in pairs(G.GAME.hands) do
        if hand_data.visible and hand_data.played > max_played then
          max_played = hand_data.played
          most_played = hand_name
        end
      end
    end

    if most_played and hand_to_sigil[most_played] then
      card_key = hand_to_sigil[most_played]
    end
  end

  return {
    set = "sigils",
    area = G.pack_cards,
    skip_materialize = true,
    soulable = true,
    key_append = "abn_sigils",
    key = card_key,
  }
end

ABN.create_boosters_for_set {
  atlas = "SigilBoosters",
  set = "sigils",
  special_colour = G.C.RED,
  artist = "Vega",
  key_prefix = "sigil",

  normal_weight = 0.2,
  jumbo_weight = 0.2,
  mega_weight = 0.2,
  create_card = function()
    return get_sigil_booster_card
  end
}

ABN.create_boosters_for_set {
  atlas = "ParadoxBoosters",
  set = "paradox",
  special_colour = G.C.GREEN,
  draw_hand = true,
  artist = "Okronix",
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaCrimsonPack",
  set = "crimson",
  special_colour = G.C.RED,
  artist = "GM36",

  normal_weight = 0.3,
  jumbo_weight = 0.3,
  mega_weight = 0.07,
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaCalligraphyPack",
  set = "calligraphy",
  special_colour = G.C.RED,
  draw_hand = true,
  artist = "0kronix",

  normal_weight = 0.3,
  jumbo_weight = 0.3,
  mega_weight = 0.07,
}

ABN.create_boosters_for_set {
  atlas = "IllusionBoosters",
  set = "illusion",
  special_colour = G.C.PURPLE,
  draw_hand = true,
  artist = "0kronix",

  normal_weight = 0.2,
  jumbo_weight = 0.2,
  mega_weight = 0.06,
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaGlyphPack",
  set = "glyphs",
  key_prefix = "glyph",
  special_colour = G.C.PURPLE,
  draw_hand = true,
  artist = "0kronix",
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaWeatherPack",
  set = "weather_report",
  special_colour = G.C.BLUE,
  key_prefix = "weather",

  booster_pos = {
    normal = {
      { x = 0, y = 0 },
      { x = 1, y = 0 },
      { x = 2, y = 0 },
    },
    jumbo = {
      { x = 0, y = 1 },
    },
    mega = {
      { x = 1, y = 1 },
    }
  },
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
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaLexicaPack",
  set = "lexica",
  special_colour = G.C.FILTER,

  booster_pos = {
    normal = {
      { x = 0, y = 0 },
      { x = 1, y = 0 },
      { x = 2, y = 0 },
    },
    jumbo = {
      { x = 0, y = 1 },
    },
    mega = {
      { x = 1, y = 1 },
    }
  },
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
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaContinentPack",
  set = "continent",
  special_colour = G.C.FILTER,
  draw_hand = true,

  booster_pos = {
    normal = {
      { x = 0, y = 0 },
      { x = 1, y = 0 },
      { x = 2, y = 0 },
    },
    jumbo = {
      { x = 0, y = 1 },
    },
    mega = {
      { x = 1, y = 1 },
    }
  },
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
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaSolidState",
  set = "solid_state",
  special_colour = G.C.PURPLE,
  key_prefix = "solid",
  draw_hand = true,

  booster_pos = {
    normal = {
      { x = 0, y = 3 },
      { x = 1, y = 3 },
    },
    jumbo = {
      { x = 2, y = 3 },
    },
    mega = {
      { x = 3, y = 3 },
    }
  },
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
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaProgramPack",
  set = "program_pack",
  key_prefix = "program",
  special_colour = G.C.RED,
  artist = "Vega",
  draw_hand = true,

  booster_pos = {
    normal = {
      { x = 0, y = 2 },
      { x = 1, y = 2 },
    },
    jumbo = {
      { x = 2, y = 2 },
    },
    mega = {
      { x = 3, y = 2 },
    }
  },
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaCalamity",
  set = "calamity_cards",
  key_prefix = "calamity",
  special_colour = G.C.PURPLE,
  artist = "Flote",
  draw_hand = true,

  normal_weight = 0.2,
  jumbo_weight = 0.2,
  mega_weight = 0.06,

  booster_pos = {
    normal = {
      { x = 0, y = 3 },
      { x = 1, y = 3 },
    },
    jumbo = {
      { x = 2, y = 3 },
    },
    mega = {
      { x = 3, y = 3 },
    }
  },
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaRAMPack",
  set = "ram",
  special_colour = G.C.GREEN,
  artist = "Okronix",
}

ABN.create_boosters_for_set {
  atlas = "AbandoniaAtomicPack",
  set = "atomic",
  key_prefix = "atomic",
  special_colour = G.C.BLACK,
  artist = "Scruffy",
  draw_hand = true,

  normal_weight = 0.2,
  jumbo_weight = 0.2,
  mega_weight = 0.06,

  booster_pos = {
    normal = {
      { x = 0, y = 0 },
      { x = 1, y = 0 },
      { x = 2, y = 0 },
      { x = 3, y = 0 },
    },
    jumbo = {
      { x = 0, y = 1 },
      { x = 1, y = 1 },
    },
    mega = {
      { x = 2, y = 1 },
      { x = 3, y = 1 },
    }
  },
}


ABN.create_boosters_for_set {
  atlas = "AbandoniaArtistryPack",
  set = "artistry_cards",
  key_prefix = "artistry",
  special_colour = G.C.BLUE,
  draw_hand = true,
  artist = "Okronix",
}
