-- Demolition Expert
-- Coded by J8-Bit
-- X4 Mult; Destroy leftmost Joker after each hand played (Demolition Expert excluded)


SMODS.Joker {
  key = 'demolition_expert',

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = {
    extra = {
      x_mult = 4,
    },
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult
      }
    }
  end,
  rarity = 2,
  cost = 6,
  atlas = 'ABNJokerSheet2',
  pos = { x = 7, y = 2 },
  discovered = false,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
    if context.after and not context.blueprint_compat then
      local compatible = G.jokers.cards[1]
      if compatible then
        return {
          message = localize("k_abn_destroyed"),
          message_card = G.jokers.cards[1],
          func = function()
            SMODS.destroy_cards(G.jokers.cards[1], nil, nil, true)
            return true
          end
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Posalla"
  },
}
