SMODS.Joker {
  key = 'statue_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 9, y = 3 },
  cost = 9,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { mult = 0, mult_gain = 10 } },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then
      local upgraded = false

      for _, target_card in ipairs(context.full_hand) do
        if SMODS.has_no_rank(target_card) then
          local changed_edition = false
		  
		  card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
		  upgraded = true
		  
          if target_card.config.center == G.P_CENTERS.m_stone then
            target_card:set_edition({ abn_chromatic = true }, true)
          elseif target_card.config.center == G.P_CENTERS.m_abn_petroleum then
            target_card:set_edition({ abn_collodion = true }, true)
          elseif target_card.config.center == G.P_CENTERS.m_abn_polkadot then
            target_card:set_edition({ abn_gloss = true }, true)
          elseif target_card.config.center == G.P_CENTERS.m_abn_oilfire then
            target_card:set_edition({ abn_abandond = true }, true)
          end
        end
      end

      if upgraded then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end


    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  
  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
}