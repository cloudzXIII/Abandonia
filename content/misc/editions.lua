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

SMODS.Shader {
  key = 'iridescent',
  path = 'iridescent.fs',
}

SMODS.Edition {
  key = 'abn_iridescent',
  shader = "iridescent",
  discovered = true,
  config = { x_mult = 2, p_dollars = 3, },
  loc_vars = function(self, info_queue, card)
    return { vars = { self.config.x_mult, self.config.p_dollars } }
  end,
  calculate = function(self, card, context)
  end,
  on_apply = function(card)
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}

SMODS.Shader {
  key = 'abandond',
  path = 'abandond.fs',
}
SMODS.Edition {
  key = 'abn_abandond',
  shader = "abandond",
  discovered = true,
  config = {},
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  calculate = function(self, card, context)
  end,
  on_apply = function(card)
  end,
  abn_artist_credits = {
    artist = "Bro-Fly"
  },
}
