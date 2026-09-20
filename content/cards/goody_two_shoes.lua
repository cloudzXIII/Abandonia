SMODS.Joker {
  key = 'goody_two_shoes',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet24',
  pos = { x = 1, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      dollars=4,
    },

  },

  calculate = function(self, card, context)
    if context.setting_blind and not card.getting_sliced then
        local hands_gained = G.GAME.current_round.discards_left
        ease_discard(-G.GAME.current_round.discards_left, nil, true)
        ease_hands_played(hands_gained)
        local context_blueprint_card = context.blueprint_card
        card_eval_status_text(context_blueprint_card or card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {hands_gained}}})
    end
    if context.individual and context.cardarea == G.play then
        if context.other_card.debuff then
            return {
                dollars=card.ability.extra.dollars,
            }
        end
    end
  end,


  abn_artist_credits = {
    artist = "Mini Bit",
  },
}