SMODS.Joker {
  key = 'ruin_bastion',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    return {
      vars = {
        localize({ type = 'name_text', key = "e_abn_abandond", set = "Edition" })
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 1, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
    },
  },
  calculate = function(self, card, context)
    if context.setting_blind then
      local joker = G.jokers.cards[#G.jokers.cards]
      if not joker.edition then
        card:juice_up()
        joker:set_edition("e_abn_abandond", true)
      end
    end
  end,
  abn_artist_credits = {
    artist = "b.b.b.b"
  },
}
