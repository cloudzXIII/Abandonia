local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount, statustext)
  level_up_hand_ref(card, hand, instant, amount, statustext)
  if hand ~= "Flush" then
    SMODS.calculate_context({ abn_hand_levelled_up = true })
  end
end

SMODS.Joker { -- This currently excludes when a flush is levelled up otherwise infinite loop :p
  key = 'faded_graffiti',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { dollars = 1 } },

  calculate = function(self, card, context)
    if context.abn_hand_levelled_up then
      SMODS.calculate_effect({ message = localize("k_level_up_ex"), colour = G.C.FILTER }, card)
      SMODS.smart_level_up_hand(card, "Flush", nil, 1)
    end
  end,
  abn_artist_credits = {
    artist = "Szymii"
  },
}
