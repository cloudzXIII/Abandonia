SMODS.Joker {
  key = 'daredevil',
  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 6, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      facedown_retriggers = 0
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.j_abn_stuntdouble
  end,
  calculate = function(self, card, context)
    -- Force all played cards (including face down ones) into the scoring hand
    if context.modify_scoring_hand and not context.blueprint then
      return {
        add_to_hand = true
      }
    end

    -- Individual scoring evaluation (runs once per individual scoring card)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      local scoring_card = context.other_card
      if scoring_card and scoring_card.facing == 'back' and scoring_card.base then
        -- Check if Stunt Double is present in the Joker slots
        if G.jokers and #SMODS.find_card('j_abn_stuntdouble') > 0 then
          local card_rank = scoring_card.base.value
          if card_rank and G.GAME.abn_rank_upgrades[card_rank] then
            -- Upgrade ONLY this specific card's rank level by 1
            ABN.level_up_rank(scoring_card, card_rank, 1)
          end
        end
      end
    end

    -- Retrigger logic for face down cards
    if context.repetition and context.cardarea == G.play then
      -- At the start of repetition evaluating the first card, calculate total face-down cards
      if context.scoring_hand and context.other_card == context.scoring_hand[1] then
        card.ability.extra.facedown_retriggers = 0
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i] and context.scoring_hand[i].facing == 'back' then
            card.ability.extra.facedown_retriggers = card.ability.extra.facedown_retriggers + 1
          end
        end
      end

      -- Retrigger this card if it is face down
      if context.other_card and context.other_card.facing == 'back' and card.ability.extra.facedown_retriggers > 0 then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability.extra.facedown_retriggers,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "GhostSalt"
  },
}
