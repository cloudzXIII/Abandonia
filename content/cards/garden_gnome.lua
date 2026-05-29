SMODS.Joker {
  key = 'garden_gnome',
  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 0, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chance = 10,
    },
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
        if SMODS.pseudorandom_probability(card, "j_abn_garden_gnome", 1, card.ability.extra.chance, "j_abn_garden_gnome") then
          context.other_card:set_edition("e_negative")
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "TanTanich",
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_playing_card', set = 'Edition', config = { extra = 1 } }
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, "j_abn_garden_gnome")
    return {
      vars = {
        numerator, denominator, localize({ type = 'name_text', key = "e_negative", set = 'Edition' }),
      },
    }
  end,
}
