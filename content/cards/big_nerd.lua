SMODS.Joker {
  key = 'big_nerd',
  rarity = 2,
  atlas = 'ABNJokerSheet27',
  pos = { x = 1, y = 3 },
  cost = 6,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand then
      local scoring_hand = context.scoring_hand or {}
      local poker_hand = context.scoring_name

      if poker_hand ~= 'High Card' and #scoring_hand > 0 then
        local all_even = true
        local all_odd = true

        for _, played_card in ipairs(scoring_hand) do
          if ABN and ABN.is_even and ABN.is_odd then
            if not ABN.is_even(played_card) then
              all_even = false
            end
            if not ABN.is_odd(played_card) then
              all_odd = false
            end
          end
        end

        local held_card = context.other_card
        local is_held_odd = ABN and ABN.is_odd and ABN.is_odd(held_card)
        local is_held_even = ABN and ABN.is_even and ABN.is_even(held_card)

        if all_even and is_held_odd then
          return {
            mult = held_card.base and held_card.base.nominal or 0,
            card = card
          }
        end

        if all_odd and is_held_even then
          return {
            mult = held_card.base and held_card.base.nominal or 0,
            card = card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Tevi",
  },
}