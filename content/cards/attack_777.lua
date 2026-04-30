SMODS.Joker {
  key = 'attack_777',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
      'abn_attack_777')
    return { vars = { numerator, denominator, card.ability.extra.xmult } }
  end,
  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 0, y = 0 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { xmult = 3, odds = 7 } },
  calculate = function(self, card, context)
    -- X3 Mult if played hand contains only Hearts and Diamonds
    if context.joker_main then
      local only_red_suits = true
      for _, playing_card in ipairs(G.play.cards) do
        if not (playing_card:is_suit('Hearts') or playing_card:is_suit('Diamonds')) then
          only_red_suits = false
          break
        end
      end
      if only_red_suits then
        return { x_mult = card.ability.extra.xmult, card = card }
      end
    end
    -- 1 in 7 chance to retrigger each played card
    if context.repetition and context.cardarea == G.play then
      if SMODS.pseudorandom_probability(card, 'abn_attack_777', 1, card.ability.extra.odds) then
        return { repetitions = 1, card = card }
      end
    end
  end,

  abn_artist_credits = { artist = "Tevi" },
}
