SMODS.Joker {
  key = 'depresor_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet15',
  pos = { x = 7, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = {
    extra = {
      xmult = 1,
      mult = 0,
      chips = 0,
      xmultadd = 0.1,
      multadd = 3,
      chipsadd = 10,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_playing_card', set = 'Edition', config = { extra = 1 } }
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.xmultadd,
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
      }
    }
  end,

  -- Only available if you have a negative card in your deck
  in_pool = function(self)
    if G.STAGE ~= G.STAGES.RUN or not G.playing_cards then return false end
    for _, v in ipairs(G.playing_cards) do
      if v.edition and v.edition.negative then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- Turn the first played dark Suit card Negative
    if context.before and not context.blueprint then
      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        if ABN.is_dark(scoring_card) and not scoring_card.edition then
          scoring_card:set_edition({ negative = true }, true)
          break -- Only the first one gets turned negative
        end
      end
    end

    -- Scaling
    if context.individual and context.cardarea == G.play then
      local upgraded = false

      if context.other_card and ABN.is_dark(context.other_card) then
        if context.other_card.edition and context.other_card.edition.negative then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
          upgraded = true
        end
      end

      if context.other_card and context.other_card.edition and context.other_card.edition.negative and card.edition and card.edition.negative then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        upgraded = true
      end

      if upgraded then
        return {
          message = localize('k_upgrade_ex'),
          card = card
        }
      end
    end

    -- Scoring
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Ton",
  },
}
