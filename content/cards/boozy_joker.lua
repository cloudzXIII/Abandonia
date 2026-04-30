SMODS.Joker {
  key = 'boozy_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 1, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      dollars = 10
    },
  },
  add_to_deck = function(self, card, from_debuff)
    SMODS.change_play_limit(1)
    SMODS.change_discard_limit(1)
  end,
  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_play_limit(-1)
    SMODS.change_discard_limit(-1)
  end,
  calculate = function(self, card, context)
    -- context.full_hand counts unscoring, change to context.scoring_hand if you only want it so it's when its 6 cards scored
    if context.joker_main and #context.full_hand == 6 then
      return {
        dollars = card.ability.extra.dollars
      }
    end
  end,
  abn_artist_credits = {
    artist = "modlich_303"
  },
}
