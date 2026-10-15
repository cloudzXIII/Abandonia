SMODS.Joker {
  key = 'silly_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet27',
  pos = { x = 0, y = 3 },
  cost = 4,
  blueprint_compat = true,
  config = { extra = { mult = 1 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then      
      if ABN.is_number(context.other_card) then
        local hand_level = G.GAME.hands[context.scoring_name].level or 1
        local mult_bonus = card.ability.extra.mult * hand_level

        if mult_bonus > 0 then
          return {
            mult = mult_bonus,
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