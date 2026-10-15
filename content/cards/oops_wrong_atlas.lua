SMODS.Joker {
  key = 'oops_wrong_atlas',
  rarity = 2,
  atlas = 'ABNJokerSheet27',
  pos = { x = 2, y = 3 }, 
  cost = 5,
  blueprint_compat = true,
  config = { extra = { xmult = 2 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local other = context.other_card

      if SMODS.has_no_rank(other) and other.config.center.key == 'm_stone' then
        local scoring_hand = context.scoring_hand or {}
        local current_index = nil

        for i, c in ipairs(scoring_hand) do
          if c == other then
            current_index = i
            break
          end
        end

        if current_index and current_index > 1 then
          local prev_card = scoring_hand[current_index - 1]
          local is_prev_modded_rankless = SMODS.has_no_rank(prev_card) and prev_card.config.center.key ~= 'm_stone'

          if is_prev_modded_rankless then
            return {
              xmult = card.ability.extra.xmult,
              card = card
            }
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Tevi",
  },
}