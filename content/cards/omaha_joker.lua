-- Omaha Joker

SMODS.Joker {
  key = 'omaha_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.asc, cae.asc_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet15',
  pos = { x = 9, y = 2 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,


  config = { extra = { asc = 0, asc_gain = 0.25 } },
  calculate = function(self, card, context)
    if context.before and context.poker_hands and #context.scoring_hand == 5 then
      if G.GAME.abn_underhands_unlocked and G.GAME.current_round.current_hand.abn_underhand then
        ABN.level_up_underhand(G.GAME.current_round.current_hand.abn_underhand, card)
      end
      if context.blueprint then return end
      local count = 0
      for k, v in pairs(context.poker_hands) do
        if next(v) then
          count = count + 1
        end
      end

      if count > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "asc",
          scalar_value = "asc_gain",
          message_colour = G.C.YELLOW,
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + count * change
          end,
        })
      end
    end
    if context.joker_main then
      return {
        asc = card.ability.extra.asc
      }
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },

}
