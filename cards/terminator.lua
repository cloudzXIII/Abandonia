SMODS.Joker {
  key = 'terminator',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 4 },
  cost = 7,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { chips = 10, mult = 10 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, "m_steel") then
      if context.other_card.debuff then
        return {
          message = localize('k_debuffed'),
          colour = G.C.RED
        }
      else
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
            + card.ability.extra.mult
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0)
            + card.ability.extra.chips
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.FILTER,
          message_card = context.other_card
        }
      end
    end
    if context.after and not context.blueprint and context.main_eval then
      local steel_cards = {}
      for _, playing_card in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(playing_card, "m_steel") then
          steel_cards[#steel_cards + 1] = playing_card
        end
      end
      if #steel_cards > 0 then
        SMODS.destroy_cards(steel_cards)
        return {
          message = localize('k_abn_destroyed'),
          colour = G.C.MULT
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Firch"
  },

  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_steel') then
        return true
      end
    end
    return false
  end
}
