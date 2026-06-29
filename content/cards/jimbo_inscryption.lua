-- Jimbo Inscryption (coded by cloudzXIII)
SMODS.Joker {
  key = 'jimbo_inscryption',

  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 0, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1.5,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
      },
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if context.other_card:get_id() == 9 or context.other_card:get_id() == 3 then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED
          }
        else
          return {
            xmult = card.ability.extra.xmult
          }
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "DrSmey",
  },
}
