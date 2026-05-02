SMODS.Joker {
  key = 'artistic_difference',

  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 2, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_played == 0 then
      local has_face = false
      for i, v in pairs(context.scoring_hand) do
        if v:is_face() then
          has_face = true
          break
        end
      end
      if has_face == false then
        local card_key = nil
        for i, v in pairs(G.P_CENTERS) do
          local card = v
          if card.set == "Planet" and card.config.hand_type and card.config.hand_type == context.scoring_name then
            card_key = card.key
            break
          end
        end
        local limit = G.consumeables.config.card_limit
        if #G.consumeables.cards < limit then
          SMODS.add_card { key = card_key, set = "Planet" }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Elder",
  },
}
