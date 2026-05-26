-- Glasgow Smile (coded by cloudzXIII)
SMODS.Joker {
  key = 'glasgow_smile',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return {
      vars = {
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 5, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
    },
  },
  calculate = function(self, card, context)
    if context.before and not context.blueprint and (G.GAME.current_round.hands_played == 0 or G.GAME.current_round.hands_left == 0) then
      for _, _card in ipairs(context.scoring_hand) do
        if ABN.is_dark(_card) then
          if _card.edition ~= "e_abn_chthonian" then
            _card:set_edition("e_abn_chthonian", true)
          end
          if _card.facing == "front" then
            _card:flip()
            _card.ability.abn_perma_flipped = true
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "HyperReal63",
  },
}
