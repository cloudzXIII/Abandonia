-- Syntha Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'syntha_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.GAME.abn_letters_activated or 0) } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet10',
  pos = { x = 0, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 6, } },
  calculate = function(self, card, context)
    if context.abn_letter_activated then
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.abn_letters_activated * card.ability.extra.mult } },
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * (G.GAME.abn_letters_activated or 0)
      }
    end
  end,
  abn_artist_credits = {
    artist = "Lazzy",
  },
  in_pool = function(self)
    return (G.GAME.abn_letters_activated or 0) > 0
  end
}
