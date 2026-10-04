--See utilities/hooks.lua for boss replacement logic

SMODS.Joker {
  key = 'final_showdown',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.amount } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 4, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      amount = 1,
      joker_slots = 0
    },
  },
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and context.beat_boss and (G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss or {}).showdown then
      card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.amount
      G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.amount
      return {message = localize('k_upgrade_ex')}
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.round_resets.blind_choices.Boss and not G.GAME.blind.in_blind and not (G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss or {}).showdown then
	  G.E_MANAGER:add_event(Event({
        func = function()
          G.from_boss_tag = true -- so money isn't taken away
          G.FUNCS.reroll_boss()
	      return true
	    end
	  }))
    end
  end,
  abn_artist_credits = {
    artist = "superb_thing"
  },
}
