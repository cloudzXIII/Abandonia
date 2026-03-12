SMODS.Shader {
  key = 'chthonian',
  path = 'chthonian.fs',
}
-- NOT FUNCTIONAL YET, WILL DO IT LATER
SMODS.Edition {
  key = 'abn_chthonian',
  shader = "chthonian",
  discovered = true,
  config = { extra = { percent = 1.05 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { self.config.extra.percent } }
  end,
  calculate = function(self, card, context)
  end,
  on_apply = function(card)
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}
