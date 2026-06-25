SMODS.Joker {
  key = 'rough_draft_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 1, y = 3 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      odds_10 = 4,
      odds_50 = 7,
      odds_double = 13,
      chips_10 = 10,
      chips_50 = 50
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    return {
      vars = {
        '' .. (G.GAME and G.GAME.probabilities.normal or 1),
        card.ability.extra.odds_10,
        card.ability.extra.odds_50,
        card.ability.extra.odds_double,
        card.ability.extra.chips_10,
        card.ability.extra.chips_50
      }
    }
  end,

  in_pool = function(self, args)
    if G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card.base.suit == "abn_suitless" and SMODS.has_enhancement(card, "m_lucky") then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local scoring_card = context.other_card

      if scoring_card and scoring_card.base.suit == "abn_suitless" and scoring_card.config.center == G.P_CENTERS.m_lucky then
        local added_chips = 0
        local double_all = false

        scoring_card.ability.perma_bonus = scoring_card.ability.perma_bonus or 0

        if pseudorandom('rough_draft_10') < G.GAME.probabilities.normal / card.ability.extra.odds_10 then
          added_chips = added_chips + card.ability.extra.chips_10
        end

        if pseudorandom('rough_draft_50') < G.GAME.probabilities.normal / card.ability.extra.odds_50 then
          added_chips = added_chips + card.ability.extra.chips_50
        end

        if pseudorandom('rough_draft_double') < G.GAME.probabilities.normal / card.ability.extra.odds_double then
          double_all = true
        end

        local triggered = false

        if added_chips > 0 then
          scoring_card.ability.perma_bonus = scoring_card.ability.perma_bonus + added_chips
          triggered = true
        end

        if double_all then
          triggered = true
          for i = 1, #context.scoring_hand do
            local target_card = context.scoring_hand[i]
            target_card.ability.perma_bonus = target_card.ability.perma_bonus or 0

            if target_card.ability.perma_bonus > 0 then
              target_card.ability.perma_bonus = target_card.ability.perma_bonus * 2
            else
              target_card.ability.perma_bonus = target_card.base.nominal
            end

            target_card:juice_up()
          end
        end

        if triggered then
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Jollydude1",
  },
}
