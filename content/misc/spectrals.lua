SMODS.Consumable {
  key = 'abyss',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 1, y = 0 },
  config = { max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    return { vars = { card.ability.max_highlighted, localize({ type = 'name_text', key = "e_abn_chthonian", set = "Edition" }) } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local aura_card = G.hand.highlighted[1]
        aura_card:set_edition("e_abn_chthonian", true)
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0 and
        (not G.hand.highlighted[1].edition)
  end,
  abn_artist_credits = {
    artist = "L'"
  },
}

SMODS.Consumable {
  key = 'body',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 0 },
  soul_pos = { x = 6, y = 0 },
  hidden = true,
  soul_set = 'Tarot',
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        SMODS.add_card({ set = 'Joker', rarity = "abn_SuperRare" })
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    delay(0.6)
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,
  abn_artist_credits = {
    artist = "ricottakitten"
  },
}


SMODS.Consumable {
  key = 'mind',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 0 },
  soul_pos = { x = 7, y = 0 },
  hidden = true,
  soul_set = 'Tarot',
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        SMODS.add_card({ set = 'Joker', rarity = "abn_ParallelRare" })
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    delay(0.6)
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,
  abn_artist_credits = {
    artist = "ricottakitten"
  },
}

-- Seal Spectrals
SMODS.Consumable {
  key = 'deja_vecu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 1 },
  config = { extra = { seal = 'abn_pink' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Vega"
  },
}

SMODS.Consumable {
  key = 'deja_reve',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 1, y = 1 },
  config = { extra = { seal = 'abn_orange' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'entendu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 2 },
  config = { extra = { seal = 'abn_grey' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'paramenal',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 2, y = 1 },
  config = { extra = { seal = 'abn_black' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'sapience',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 3, y = 1 },
  config = { extra = { seal = 'abn_teal' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'jamais_vu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 1 },
  config = { extra = { seal = 'abn_white' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'presque_vu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 1 },
  config = { extra = { seal = 'abn_brown' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'super_id',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 1 },
  config = { extra = { seal = 'abn_violet' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'spiral',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 7, y = 1 },
  config = { extra = { seal = 'abn_lavender' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
    artist = "Dogg-Fly"
  },
}

SMODS.Consumable {
  key = 'door',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 2 },
  config = { extra = { seal = 'abn_skyblue' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
}

SMODS.Consumable {
  key = 'silver',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 2 },
  config = { extra = { seal = 'abn_silver' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
}

SMODS.Consumable {
  key = 'copper',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 2 },
  config = { extra = { seal = 'abn_copper' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
}

SMODS.Consumable {
  key = 'impure',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 1, y = 3 },
  config = { extra = { seal = 'abn_oxidized' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
}

SMODS.Consumable {
  key = 'instrument',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 2, y = 3 },
  config = { extra = { seal = 'abn_lime' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
}

SMODS.Consumable {
  key = 'make',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 3 },
  config = { extra = { seal = 'abn_brass' }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
    return { vars = { card.ability.max_highlighted } }
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
}

local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set == 'Spectral' and card.config.center.key ~= "c_soul" then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn_last_spectral = card.config.center.key
            return true
          end
        }))
        return true
      end
    }))
  end
  return ret
end

SMODS.Consumable {
  key = 'transform',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 7, y = 2 },
  loc_vars = function(self, info_queue, card)
    local transform_c = G.GAME.abn_last_spectral and G.P_CENTERS[G.GAME.abn_last_spectral] or nil
    local abn_last_spectral = transform_c and
        localize { type = 'name_text', key = transform_c.key, set = transform_c.set } or
        localize('k_none')
    local colour = (not transform_c or transform_c.key == "c_abn_transform") and G.C.RED or G.C.GREEN

    if transform_c and transform_c.key ~= "c_abn_transform" then
      info_queue[#info_queue + 1] = transform_c
    end

    local main_end = {
      {
        n = G.UIT.C,
        config = { align = "bm", padding = 0.02 },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
            nodes = {
              { n = G.UIT.T, config = { text = ' ' .. abn_last_spectral .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
            }
          }
        }
      }
    }

    return { vars = { abn_last_spectral }, main_end = main_end }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        if G.consumeables.config.card_limit > #G.consumeables.cards then
          play_sound('timpani')
          SMODS.add_card({ key = G.GAME.abn_last_spectral })
          card:juice_up(0.3, 0.5)
        end
        return true
      end
    }))
    delay(0.6)
  end,
  can_use = function(self, card)
    return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and
        G.GAME.abn_last_spectral and
        G.GAME.abn_last_spectral ~= 'c_abn_transform'
  end
}

SMODS.Consumable {
  key = 'exile',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 3 },
  config = { extra = {}, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local exile_card = G.hand.highlighted[1]
        exile_card:set_edition("e_negative", true)
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}

SMODS.Consumable {
  key = 'distortion',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local eligible_card = pseudorandom_element(editionless_jokers, 'vremade_hex')
        eligible_card:set_edition("e_abn_pearlescent")

        local _first_dissolve = nil
        for _, joker in ipairs(G.jokers.cards) do
          if joker ~= eligible_card and not SMODS.is_eternal(joker, card) then
            joker:start_dissolve(nil, _first_dissolve)
            _first_dissolve = true
          end
        end

        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  can_use = function(self, card)
    return next(SMODS.Edition:get_edition_cards(G.jokers, true))
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}

SMODS.Consumable {
  key = 'ascend',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 3, y = 3 },
  config = { extra = {}, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return { vars = { card.ability.max_highlighted } }
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.highlighted == card.ability.max_highlighted and (not G.hand.highlighted[1].edition)
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local choices = { 'abn_gloss', 'abn_iridescent', 'abn_pearlescent' }
        
        local chosen_edition = pseudorandom_element(choices, 'abn_ascend')

        local ascend_card = G.hand.highlighted[1]

        ascend_card:set_edition({ [chosen_edition] = true }, true)
        
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}

SMODS.Consumable {
  key = 'whitehole',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 3 },
  hidden = true,
  soul_set = 'Planet',

  use = function(self, card, area, copier)
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
      { handname = "All Ranks", chips = '...', mult = '...', level = '' })
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = true
        return true
      end
    }))
    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.9,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))
    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.9,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = nil
        return true
      end
    }))
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
    delay(1.3)
    for rank, _ in pairs(SMODS.Ranks) do
      if G.GAME.abn_rank_upgrades[rank] then
        ABN.level_up_rank(card, rank, 1, true)
      end
    end
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
      { mult = 0, chips = 0, handname = '', level = '' })
  end,
  can_use = function(self, card)
    return true
  end,
  abn_artist_credits = {
    artist = "shepcicle"
  },
}
