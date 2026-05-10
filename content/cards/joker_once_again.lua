SMODS.Joker {
  key = 'joker_once_again',

  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 9, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {

  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_SEALS["abn_white"]
  end,


  calculate = function(self, card, context)
    if context.before and context.main_eval and not context.blueprint then
        local first_scored_card = context.scoring_hand[1]
        first_scored_card:set_seal("abn_white")
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet & Smolicon",
  },
}
