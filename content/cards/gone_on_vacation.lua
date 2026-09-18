SMODS.Joker {
  key = 'gone_on_vacation',
  rarity = 3,
  atlas = 'ABNJokerSheet23',
  pos = { x = 9, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 10, mult = 4 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_hand then
      local empty_slots = math.max(0, G.jokers.config.card_limit - #G.jokers.cards)

      if empty_slots > 0 then
        local bonus_chips = card.ability.extra.chips * empty_slots
        local bonus_mult = card.ability.extra.mult * empty_slots

        for _, scoring_card in ipairs(context.scoring_hand) do
          scoring_card.ability.perma_bonus = (scoring_card.ability.perma_bonus or 0) + bonus_chips
          scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + bonus_mult
        end

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ATTENTION,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Mathe000"
  },
}