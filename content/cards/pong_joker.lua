SMODS.Joker {
  key = 'pong_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 1, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1,
      xchips = 1,
      xmultadd = 0.1,
      xchipsadd = 0.1,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        card.ability.extra.xmultadd,
        card.ability.extra.xchipsadd,
      },
    }
  end,

  calculate = function(self, card, context)
    -- Individual card triggers
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card
      local is_dark = ABN.is_dark(currentCard)
      local is_light = ABN.is_light(currentCard)

      if is_dark and is_light then
        return {
          message = "Piong?",
          colour = G.C.PURPLE,
          card = currentCard
        }
      elseif is_dark then
        return {
          message = "Ping!",
          colour = G.C.CHIPS,
          card = currentCard
        }
      elseif is_light then
        return {
          message = "Pong!",
          colour = G.C.MULT,
          card = currentCard
        }
      end
    end

    -- Scaling Logic
    if context.before and not context.blueprint then
      if context.scoring_name == "Straight" or
      context.scoring_name == "Straight Flush" then
        local all_light = true
        local all_dark = true

        for i = 1, #context.scoring_hand do
          if not ABN.is_light(context.scoring_hand[i]) then all_light = false end
          if not ABN.is_dark(context.scoring_hand[i]) then all_dark = false end
        end

        local triggered = false
        if all_light then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
          triggered = true
        end
        if all_dark then
          card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
          triggered = true
        end

        if triggered then
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.Mult,
            card = card
          }
        end
      end
    end

    -- Scoring Logic
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Yahooyowza",
  },
}
