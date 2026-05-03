SMODS.Joker {
  key = 'aliasing_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 4, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 5 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlenscene
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent

    return {
      vars = {
        card.ability.extra.dollars,
        localize({ type = 'name_text', key = "e_abn_gloss", set = "Edition" }),
        localize({ type = 'name_text', key = "e_abn_pearlenscene", set = "Edition" }),
        localize({ type = 'name_text', key = "e_abn_iridescent", set = "Edition" }),
      }
    }
  end,

  in_pool = function(self)
    if not G.playing_cards then return false end
    local edition_count = 0
    for _, card in ipairs(G.playing_cards) do
      if card and card.edition then
        edition_count = edition_count + 1
      end
      if edition_count >= 2 then return true end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- Trigger for every card in the scoring hand individually
    if context.individual and context.cardarea == G.play then
      -- 1. Identify and upgrade the first NON-FACE, NON-ACE card
      -- Ace ID is 14; Face IDs are 11, 12, 13
      if not context.other_card:is_face() and context.other_card:get_id() ~= 14 then
        local is_first_valid_card = false
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if not scoring_card:is_face() and scoring_card:get_id() ~= 14 then
            is_first_valid_card = (scoring_card == context.other_card)
            break
          end
        end

        -- Logic for First Hand or Last Hand of the round
        if is_first_valid_card and (G.GAME.current_round.hands_left == 0 or G.GAME.current_round.hands_played == 0) then
          local editions = { 'e_abn_gloss', 'e_abn_pearlenscene', 'e_abn_iridescent' }
          local chosen_edition = pseudorandom_element(editions, pseudoseed('aliasing_joker'))

          context.other_card:set_edition(chosen_edition, true)
        end
      end

      -- 2. Payout logic: All scoring cards with an edition give $5
      if context.other_card.edition then
        return {
          dollars = card.ability.extra.dollars,
          colour = G.C.MONEY,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
