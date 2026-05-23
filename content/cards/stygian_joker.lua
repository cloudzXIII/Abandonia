-- Stygian Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'stygian_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    local cae = card.ability.extra
    local numerator, denominator = SMODS.get_probability_vars(card, cae.base, cae.odds,
      'abn_stygian_joker')

    local chthonian_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card.edition and playing_card.edition.key == "e_abn_chthonian" then
          chthonian_tally = chthonian_tally + 1
        end
      end
    end
    return { vars = { cae.xmult, 1 + cae.xmult * chthonian_tally, numerator, denominator } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 0, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 0.1, base = 1, odds = 15 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Hearts") and SMODS.pseudorandom_probability(card, 'stygian', card.ability.extra.base, card.ability.extra.odds, "abn_stygian_joker") then
        context.other_card:set_edition("e_abn_chthonian", true, nil, true)
        SMODS.calculate_effect({ message = localize("k_abn_chthonian") }, context.other_card)
      end
    end
    if context.joker_main then
      local chthonian_tally = 0
      if G.playing_cards then
        for _, playing_card in ipairs(G.playing_cards) do
          if playing_card.edition and playing_card.edition.key == "e_abn_chthonian" then
            chthonian_tally = chthonian_tally + 1
          end
        end
      end
      return {
        x_mult = 1 + card.ability.extra.xmult * chthonian_tally,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Iprefercheddar",
  },
  in_pool = function(self)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.edition and playing_card.edition.key == "e_abn_chthonian" then
        return true
      end
    end
    return false
  end
}
