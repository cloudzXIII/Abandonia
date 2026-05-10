SMODS.Joker {
  key = 'planetoid_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 3, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {

  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_SEALS["abn_orange"]
  end,


  calculate = function(self, card, context)
    if context.before and context.main_eval and not context.blueprint and context.scoring_name == "Straight" then
        if G.GAME.hands[context.scoring_name].played_this_round == 1 then
            local leftmost = context.scoring_hand[1]
            leftmost:set_seal("abn_orange")
        end
    end
  end,
  abn_artist_credits = {
    artist = "DrSmey",
  },
}
