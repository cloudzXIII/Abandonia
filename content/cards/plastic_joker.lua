SMODS.Joker {
  key = 'plastic_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 9, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,

  -- Pool condition: Must own a Petroleum card somewhere in the full deck
  in_pool = function(self)
    if G.STAGE ~= G.STAGES.RUN or not G.playing_cards then return false end
    for _, v in ipairs(G.playing_cards) do
      if v.config and v.config.center == G.P_CENTERS.m_abn_petroleum then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step then
      -- Check if the current round score beats the blind requirement
      if SMODS.calculate_round_score() > G.GAME.blind.chips then
        local petroleum_scoring_count = 0
        local triggered_transform = false

        -- 1. Loop through the scoring hand to count and transform Petroleum cards
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if scoring_card.config and scoring_card.config.center == G.P_CENTERS.m_abn_petroleum then
            petroleum_scoring_count = petroleum_scoring_count + 1

            triggered_transform = true
          end
        end

        -- If transformations occurred, find the lowest rank card remaining unplayed in hand
        if triggered_transform and petroleum_scoring_count > 0 then
          if G.hand and G.hand.cards and #G.hand.cards > 0 then
            local lowest_rank_val = 99
            local lowest_rank_key = nil

            -- Find lowest rank in hand
            for _, hand_card in ipairs(G.hand.cards) do
              if hand_card.base and hand_card.base.nominal then
                local current_val = hand_card.base.nominal
                if current_val < lowest_rank_val then
                  lowest_rank_val = current_val
                  lowest_rank_key = hand_card.base.value
                end
              end
            end

            -- level up card rank
            if lowest_rank_key and G.GAME.abn_rank_upgrades[lowest_rank_key] then
              ABN.level_up_rank(card, lowest_rank_key, petroleum_scoring_count)


              return {
                message = localize('k_level_up'),
                card = card
              }
            end
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
