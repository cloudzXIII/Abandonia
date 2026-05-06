SMODS.Joker {
  key = 'pixelgrid_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 7, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 0,
      multadd = 2,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.multadd,
      },
    }
  end,

  calculate = function(self, card, context)
    -- Scaling
    if context.before and not context.blueprint then
      if #context.scoring_hand > 0 and #context.scoring_hand % 2 == 0 then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
        
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    -- Scoring
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult}},
        mult_mod = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Yahooyowza",
  },
}