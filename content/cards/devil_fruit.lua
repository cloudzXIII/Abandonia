SMODS.Joker {
  key = 'devil_fruit',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'devil_fruit')
    return {
      vars = {
        numerator,
        denominator,
        localize({ type = 'name_text', key = "e_abn_chthonian", set = "Edition" })
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 5, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      base = 1,
      odds = 4
    },
  },
  calculate = function(self, card, context)
    if context.setting_blind then
      local joker = G.jokers.cards[#G.jokers.cards]
      if not joker.edition then
        card:juice_up()
        joker:set_edition("e_abn_chthonian", true)
      end
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if SMODS.pseudorandom_probability(card, 'abn_devil_fruit', card.ability.extra.base, card.ability.extra.odds, "devil_fruit") then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_extinct_ex')
        }
      else
        return {
          message = localize('k_safe_ex')
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "L'"
  },
  in_pool = function(self, args)
    return G.GAME.pool_flags.abn_cavendish_extinct
  end
}
