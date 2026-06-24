SMODS.Joker {
  key = 'invisible_ink_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 6, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 0,
      xchips = 1,
      multadd = 10,
      xchipsadd = 1,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.xchips,
        card.ability.extra.multadd,
        card.ability.extra.xchipsadd,
      }
    }
  end,

  in_pool = function(self)
    if G.playing_cards then
      local lucky_suits = {}
      local distinct_suits_count = 0

      for _, c in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(c, "m_lucky") then
          local suit = c.base.suit -- Fixed to look at base suit string
          if not lucky_suits[suit] then
            lucky_suits[suit] = true
            distinct_suits_count = distinct_suits_count + 1
          end
        end
      end

      if distinct_suits_count >= 2 then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- SCALING LOGIC
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      local scoring_lucky_suits = {}
      local lucky_suit_count = 0
      local total_scoring_cards = #context.scoring_hand
      local lucky_card_count = 0

      for _, sc in ipairs(context.scoring_hand) do
        if sc.config.center == G.P_CENTERS.m_lucky then
          lucky_card_count = lucky_card_count + 1
          local suit = sc.base.suit
          if not scoring_lucky_suits[suit] then
            scoring_lucky_suits[suit] = true
            lucky_suit_count = lucky_suit_count + 1
          end
        end
      end

      local upgraded = false

      --  Gain +10 mult per different scoring suit of Lucky cards
      if lucky_suit_count > 0 then
        card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.multadd * lucky_suit_count)
        upgraded = true
      end

      -- If it's a Spectrum hand AND made entirely of Lucky cards gain X1 chips per card
      if context.scoring_name == "abn_Spectrum" or
          context.scoring_name == "abn_Specflush" or
          context.scoring_name == "abn_Straight Specflush" or
          context.scoring_name == "abn_Specflush House" or
          context.scoring_name == "abn_Specflush Five" or
          context.scoring_name == "abn_Specflush Six" then
        if (lucky_card_count == total_scoring_cards) and total_scoring_cards > 0 then
          card.ability.extra.xchips = card.ability.extra.xchips + (card.ability.extra.xchipsadd * lucky_card_count)
          upgraded = true
        end
      end

      if upgraded then
        return {
          message = localize('k_upgrade_ex'),
          card = card
        }
      end
    end

    -- SCORING LOGIC
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        xchips = card.ability.extra.xchips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Littleroot",
  },
}
