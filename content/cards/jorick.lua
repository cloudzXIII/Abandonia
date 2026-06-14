SMODS.Joker {
  key = 'jorick',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult_gain, card.ability.extra.draws, card.ability.extra.draws_remaining, card.ability.extra.x_mult } }
  end,

  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 1, y = 0 },
  soul_pos = { x = 0, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xmult = 2, xchips = 2, } },
  
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.xmult, cae.xchips, } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.discards_left == 0 then
		return {
			xmult = card.ability.extra.xmult,
			xchips = card.ability.extra.xchips,
		}
	end
  end,
  abn_artist_credits = {
    artist = "Olsberg",
  },
}
