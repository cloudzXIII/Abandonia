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
    artist = "?"
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
    artist = "?"
  },
}
