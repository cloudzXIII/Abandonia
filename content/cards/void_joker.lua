SMODS.Joker {
  key = 'void_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { localize({ type = 'name_text', key = "e_foil", set = "Edition" }), localize({ type = 'name_text', key = "e_holo", set = "Edition" }), localize({ type = 'name_text', key = "e_polychrome", set = "Edition" }) } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 7, y = 1 },
  cost = 4,

  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.buying_card and context.card and context.card.ability.joker_flipped then
      local edition = poll_edition('j_abn_void_joker', nil, true, true, { 'e_polychrome', 'e_holo', 'e_foil' })
      context.card:set_edition(edition, true)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Cybertsarbomba",
  },
  in_pool = function()
    for _, joker in ipairs(G.jokers.cards or {}) do
      if joker.facing == "back" or joker.ability.abn_perma_flipped or joker.ability.joker_flipped then
        return true
      end
    end
    return false
  end,

}

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
  card_set_cost_ref(self)
  if next(SMODS.find_card("j_abn_void_joker")) then
    if self.ability.joker_flipped then
      self.cost = 0
      self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
      self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
    end
  end
end
