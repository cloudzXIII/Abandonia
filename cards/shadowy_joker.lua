SMODS.Joker {
  key = 'shadowy_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.percent } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 3, y = 7 },
  cost = 4,

  discovered = true,
  blueprint_compat = false,

  config = { extra = { percent = 80 } },

  calculate = function(self, card, context)
    if context.stay_flipped and context.to_area == G.hand then
      return {
        stay_flipped = true
      }
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.percent
        for _, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.percent
        for _, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))

    local card_areas = { G.jokers, G.consumeables, G.shop_jokers, G.pack_cards }
    for _, area in ipairs(card_areas) do
      if area and area.cards then
        for _, v in ipairs(area.cards) do
          if v.facing == "back" and v.shadowy_flipped then
            v:flip()
            v.shadowy_flipped = false
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Maw",
  },
}
