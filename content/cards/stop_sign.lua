-- Stop Sign (coded by cloudzXIII)
SMODS.Joker {
  key = 'stop_sign',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_buffoon_normal_1
    return {
      vars = {
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet7',
  pos = { x = 4, y = 2 },
  cost = 3,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
    },
  },

  add_to_deck = function(self, card, from_debuff)
    card.ability.extra.original_jonkler_rate = G.GAME.joker_rate
    G.GAME.joker_rate = 0
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.joker_rate = G.GAME.joker_rate + card.ability.extra.original_jonkler_rate
  end,
  abn_artist_credits = {
    artist = "Patitofi8"
  },
}
