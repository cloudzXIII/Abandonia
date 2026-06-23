-- Ponzi (coded by cloudzXIII)
SMODS.Joker {
  key = 'ponzi',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 0 },
  soul_pos = { x = 1, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { dollars = 1, } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and not context.end_of_round then
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
          (card.ability.extra.dollars * #context.scoring_hand)
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      return {
        dollars = -card.ability.extra.dollars,
        card = card,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Gfs",
  },
}
