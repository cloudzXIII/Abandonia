SMODS.Joker {
  key = 'dreamtime_sphinx',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_opaque
    return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain, card.ability.extra.mult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet22',
  pos = { x = 6, y = 6 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0, chips_gain = 20, mult = 0 } },
  
  in_pool = function(self)
    for _, card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(card, "m_abn_fossil") then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_abn_fossil") then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
          message_key = "a_chips"
        })

        if context.other_card.edition and context.other_card.edition.key == 'e_abn_opaque' then
          local card_rank = context.other_card.base.value
          if card_rank and G.GAME.abn_rank_upgrades and G.GAME.abn_rank_upgrades[card_rank] then
            ABN.level_up_rank(context.other_card, card_rank, 1)
          end
        end
      end
    end

    if context.destroying_card and not context.blueprint then
      if SMODS.has_enhancement(context.destroying_card, "m_abn_fossil") then
        local destroy_mult = context.destroying_card.base.nominal
        card.ability.extra.mult = card.ability.extra.mult + destroy_mult
        return {
			message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
		}
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Omicra",
  },
}