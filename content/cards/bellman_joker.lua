SMODS.Joker {
  key = 'bellman_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet20',
  pos = { x = 7, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { 
    extra = { 
      chips = 5, 
      mult = 2, 
      chipsadd = 10, 
      multadd = 4 
    } 
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.chipsadd,
        card.ability.extra.multadd,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint and not context.repetition and not context.individual and context.game_over == false then
      local current_consumables = G.consumeables and #G.consumeables.cards or 0
      local max_consumables = G.consumeables and G.consumeables.config.card_limit or 0

      if current_consumables >= max_consumables and max_consumables > 0 then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd

        return {
          message = "come again!",
          colour = G.C.MULT
        }
      end
    end

    if context.joker_main then
      local current_consumables = G.consumeables and #G.consumeables.cards or 0
      local max_consumables = G.consumeables and G.consumeables.config.card_limit or 0

      if current_consumables >= max_consumables and max_consumables > 0 then
        local is_boss = G.GAME.blind and G.GAME.blind.boss
        local quip_options = is_boss 
          and { "on the double", "finest hotel around" }
          or { "right on it sir!", "my pleasure!" }

        local quip = pseudorandom_element(quip_options, pseudoseed('bellman_quip'))

        return {
          message = quip,
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Mini Bit",
  },
}