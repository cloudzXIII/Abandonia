SMODS.Consumable {
  key = 'abyss',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 1, y = 0 },
  config = { max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    return { vars = { card.ability.max_highlighted } }
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
  end
}
