SMODS.Joker {
  key = 'seal_letter',

  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 8, y = 2 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_SEALS["Red"]
  end,


  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
        if context.other_card.seal == "Red" then
            return {
                repetitions=1,
                message = localize('k_again_ex')
            }
        end
    end
  end,
  in_pool=function (self,args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card.seal == "Red" then
            return true
        end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Littleroot",
  },
}
