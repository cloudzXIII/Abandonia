-- Full Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'full_jester',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.x_chips, cae.x_chips_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet14',
  pos = { x = 1, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 1, x_chips = 1, x_chips_gain = 1 } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local suits = {}
      local has_rankless = false
      for _, scoring_card in ipairs(context.scoring_hand) do
        if SMODS.has_no_rank(scoring_card) then
          has_rankless = true
        elseif scoring_card.base.suit then
          suits[scoring_card.base.suit] = true
        end
      end
      local unique_suits = 0
      for _ in pairs(suits) do
        unique_suits = unique_suits + 1
      end
      if unique_suits >= 6 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + unique_suits * change
          end,
        })
      elseif unique_suits == 5 and has_rankless then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + unique_suits * change
          end,
        })
      end
    end
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        x_chips = card.ability.extra.x_chips > 1 and card.ability.extra.x_chips or nil,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },

  in_pool = function(self)
    return G.GAME.hands["abn_Spectrum Six"] and G.GAME.hands["abn_Spectrum Six"].played > 0
  end,
}
