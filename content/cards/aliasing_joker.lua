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
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent

    return {
      vars = {
        card.ability.extra.dollars,
        localize({ type = 'name_text', key = "e_abn_gloss", set = "Edition" }),
        localize({ type = 'name_text', key = "e_abn_pearlescent", set = "Edition" }),
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
    if context.individual and context.cardarea == G.play then
      if ABN.is_number(context.other_card) then
        local is_first_valid_card = false
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if ABN.is_number(context.other_card) then
            is_first_valid_card = (scoring_card == context.other_card)
            break
          end
        end

        if is_first_valid_card and (G.GAME.current_round.hands_left == 0 or G.GAME.current_round.hands_played == 0) then
          local editions = { 'e_abn_gloss', 'e_abn_pearlescent', 'e_abn_iridescent' }
          local chosen_edition = pseudorandom_element(editions, pseudoseed('aliasing_joker'))

          context.other_card:set_edition(chosen_edition, true)
        end
      end

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
