SMODS.Joker {
  key = 'photopic_efficiency_joker',
  atlas = 'ABNJokerSheet28',
  pos = { x = 1, y = 5 },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  config = {
    extra = {
      score = 400,
    }
  },

  abn_spectrum_hands = {
    ['abn_Spectrum'] = true,
    ['abn_Straight Spectrum'] = true,
    ['abn_Spectrum House'] = true,
    ['abn_Spectrum Five'] = true,
    ['abn_Spectrum Six'] = true,
    ['abn_Inverse Spectrum'] = true,
    ['abn_Emperium Spectrum'] = true,
    ['abn_Skeet Spectrum'] = true,
    ['abn_Specflush'] = true,
    ['abn_Straight Specflush'] = true,
    ['abn_Specflush House'] = true,
    ['abn_Specflush Five'] = true,
    ['abn_Specflush Six'] = true,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.score,
      }
    }
  end,

  in_pool = function(self, args)
    if not G.playing_cards then return false end
    local has_foil = false
    local has_holographic = false
    local has_polychrome = false
    for _, playing_card in ipairs(G.playing_cards) do
      if playing_card.edition then
        if playing_card.edition.foil then has_foil = true end
        if playing_card.edition.holo then has_holographic = true end
        if playing_card.edition.polychrome then has_polychrome = true end
      end
    end
    return has_foil and has_holographic and has_polychrome
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      for _, scored_card in ipairs(context.scoring_hand) do
        if scored_card.edition and not scored_card.debuff then
          local is_even = ABN.is_even(scored_card)
          local is_odd = ABN.is_odd(scored_card)
          local new_edition = nil

          if scored_card.edition.key == 'e_foil' then
            if is_even then new_edition = 'e_abn_gloss'
            elseif is_odd then new_edition = 'e_abn_glitter' end
          elseif scored_card.edition.key == 'e_holo' then
            if is_even then new_edition = 'e_abn_iridescent'
            elseif is_odd then new_edition = 'e_abn_sparkling' end
          elseif scored_card.edition.key == 'e_polychrome' then
            if is_even then new_edition = 'e_abn_pearlescent'
            elseif is_odd then new_edition = 'e_abn_rgb' end
          end

          if new_edition then
            scored_card:set_edition(new_edition, true)
          end
        end
      end
    end

    if context.joker_main and card.edition and self.abn_spectrum_hands[context.scoring_name] then
      local times_played = G.GAME.hands[context.scoring_name].played
      return {
        score = card.ability.extra.score * times_played,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}