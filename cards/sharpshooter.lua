SMODS.Joker {
  key = 'sharpshooter',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'sharpshooter')
    return { vars = { numerator, denominator } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 1 },
  cost = 8,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { repetitions = 1, count = 0, base = 1, odds = 2 } },

  calculate = function(self, card, context)
    if context.before then
      card.ability.extra.count = 0
      for _, playing_card in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(playing_card, "m_wild") then
          card.ability.extra.count = card.ability.extra.count + 1
        end
      end
    end
    if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_wild") then
      return {
        repetitions = card.ability.extra.repetitions * card.ability.extra.count
      }
    end
    if context.after and not context.blueprint and context.main_eval and SMODS.pseudorandom_probability(card, 'abn_seed', card.ability.extra.base, card.ability.extra.odds, 'sharpshooter') then
      local wild_cards = {}
      for _, playing_card in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(playing_card, "m_wild") then
          wild_cards[#wild_cards + 1] = playing_card
        end
      end
      SMODS.destroy_cards(wild_cards)

      return {
        message = localize('k_abn_destroyed'),
        colour = G.C.MULT
      }
    end
  end,
  abn_artist_credits = {
    artist = "iprefercheddar",
  },
}
