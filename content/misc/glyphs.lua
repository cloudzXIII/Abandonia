-- Glyphs (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "glyphs",
  primary_colour = HEX("dcece6"),
  secondary_colour = HEX("dcece6"),
  text_colour = HEX("4f6367"),
  collection_rows = { 6, 5 },
  shop_rate = 0,
}

SMODS.UndiscoveredSprite {
  key = 'glyphs',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 0, y = 1 },
  overlay_pos = { x = 1, y = 1 },
}

ABN.GlyphCard = SMODS.Consumable:extend({
  set = 'glyphs',
  cost = 4,
  atlas = "abn_AbandoniaGlyphs",
  pos = { x = 0, y = 0 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return {
      vars = {
        card.ability.max_highlighted,
        localize { type = 'name_text', set = "Other", key = string.lower(card.ability.extra.seal) .. '_seal' },
        colours = {
          G.P_SEALS[card.ability.extra.seal].badge_colour or G.C.FILTER
        }
      }
    }
  end,

  use = function(self, card, area, copier)
    local conv_card = G.hand.highlighted[1]
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        conv_card:set_seal(card.ability.extra.seal, nil, true)
        return true
      end
    }))

    delay(0.5)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Flote"
  },
})


ABN.GlyphCard {
  key = "exile",
  pos = { x = 0, y = 0 },

  config = { extra = { seal = 'abn_black' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "impure",
  pos = { x = 1, y = 0 },

  config = { extra = { seal = 'abn_oxidized' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "instrument",
  pos = { x = 2, y = 0 },

  config = { extra = { seal = 'abn_brine' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "ascend",
  pos = { x = 3, y = 0 },

  config = { extra = { seal = 'abn_linguistic' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "make",
  pos = { x = 0, y = 1 },

  config = { extra = { seal = 'abn_brass' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "door",
  pos = { x = 1, y = 1 },

  config = { extra = { seal = 'abn_skyblue' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "silver",
  pos = { x = 2, y = 1 },

  config = { extra = { seal = 'abn_silver' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "copper",
  pos = { x = 3, y = 1 },

  config = { extra = { seal = 'abn_copper' }, max_highlighted = 1 },
}

--[[
ABN.GlyphCard {
  key = "transform",
  pos = { x = 0, y = 2 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "revive_zero",
  pos = { x = 1, y = 2 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "tower",
  pos = { x = 2, y = 2 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "i_seven",
  pos = { x = 3, y = 2 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "balance",
  pos = { x = 0, y = 3 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "fear_four",
  pos = { x = 1, y = 3 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "c_formula",
  pos = { x = 2, y = 3 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "treasure",
  pos = { x = 3, y = 3 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "seek",
  pos = { x = 0, y = 4 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}
--]]

ABN.GlyphCard {
  key = "free",
  pos = { x = 1, y = 4 },

  config = { extra = { seal = 'abn_violet' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "plural",
  pos = { x = 2, y = 4 },

  config = { extra = { seal = 'abn_brown' }, max_highlighted = 1 },
}

--[[
ABN.GlyphCard {
  key = "revive",
  pos = { x = 3, y = 4 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}
--]]

ABN.GlyphCard {
  key = "music",
  pos = { x = 0, y = 5 },

  config = { extra = { seal = 'abn_pink' }, max_highlighted = 1 },
}

--[[
ABN.GlyphCard {
  key = "scientist",
  pos = { x = 1, y = 5 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "warrior",
  pos = { x = 2, y = 5 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "fear_one",
  pos = { x = 3, y = 5 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "gold_seven",
  pos = { x = 0, y = 6 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}

ABN.GlyphCard {
  key = "brother",
  pos = { x = 1, y = 6 },

  config = { extra = { seal = 'nil' }, max_highlighted = 1 },
}
--]]
