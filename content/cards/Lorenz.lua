SMODS.Joker{
  key = "Lorenz",

  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 19 },
  soul_pos = { x = 5, y = 19 },
  cost = 20, 
  rarity = 4,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      xmult = 1.5,
      gain = 0.04
    }
  },


  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.gain,
        0.25
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Acorn" or context.other_card.base.suit == "abn_Acorn" then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

        local chips = 0

        if G.jokers then
          for _, joker in ipairs(G.jokers.cards) do
            if joker ~= card and joker.config and joker.config.center then
              local rarity = joker.config.center.rarity
              if type(rarity) == "number" then
                chips = chips + (0.25 * rarity)
              end
            end
          end
        end

        return {
          x_mult = card.ability.extra.xmult,
          chips = chips,
        }
      end
    end
  end,

abn_artist_credits = {
    artist = "Inky & Lapsem"
  }
}