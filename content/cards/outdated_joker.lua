SMODS.Joker {
  key = 'outdated_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chipsadd, card.ability.extra.multadd, card.ability.extra.chips, card.ability.extra.mult } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 5, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chipsadd = 16, multadd = 6, chips = 0, mult = 0 } },

  calculate = function(self, card, context)
    if context.final_scoring_step and G.GAME.chips + SMODS.calculate_round_score() >= G.GAME.blind.chips then
      if context.scoring_hand and #context.scoring_hand % 2 == 0 then
        --upgrade
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.Mult,
          card = card
        }
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Leno"
  },
}
