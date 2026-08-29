SMODS.Joker {
  key = 'shy_gall',
  rarity = 3,
  atlas = 'ABNJokerSheet16',
  pos = { x = 2, y = 5 }, 
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = {} }
  end,

  in_pool = function(self, args)
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.ability and c.ability.abn_perma_flipped then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_hand and not context.blueprint then
      local all_flipped = #context.scoring_hand > 0

      for _, scoring_card in ipairs(context.scoring_hand) do
        if not (scoring_card.ability and scoring_card.ability.abn_perma_flipped) then
          all_flipped = false
          break
        end
      end

      if all_flipped then
        return {
			level_up = true,
			message = localize('k_level_up_ex')
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Nice Cream",
  },
}