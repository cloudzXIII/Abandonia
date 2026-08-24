SMODS.Joker {
  key = 'metallic_upgrade',
  rarity = 3,
  atlas = 'ABNJokerSheet16',
  pos = { x = 2, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      triggered_this_hand = false,
      chips = 10,
      mult = 4,
      score = 100
    }
  },
  
  loc_vars = function(self, info_queue, card)
	return {
		vars = {
			card.ability.extra.chips,
            card.ability.extra.mult,
			card.ability.extra.score,
        }
    }
  end,

  enhancement_to_sticker = {
    m_bonus = "abn_stk_bonus",
    m_mult  = "abn_stk_mult",
    m_gold  = "abn_stk_gold",
    m_stone = "abn_stk_stone",
    m_glass = "abn_stk_glass",
    m_steel = "abn_stk_steel",
    m_lucky = "abn_stk_lucky",
  },

  calculate = function(self, card, context)
    local function check_spectrum_hand()
      local spectrum_hands = {
        "abn_Spectrum",
        "abn_Specflush",
        "abn_Straight Specflush",
        "abn_Specflush House",
        "abn_Specflush Five",
        "abn_Specflush Six"
      }
      if context.poker_hands then
        for _, hand_type in ipairs(spectrum_hands) do
          if context.poker_hands[hand_type] and next(context.poker_hands[hand_type]) then
            return true
          end
        end
      end
      return false
    end

    if context.before then
      card.ability.extra.triggered_this_hand = false

      if check_spectrum_hand() and context.full_hand and #context.full_hand >= 5 then
        local vanilla_enhancement_count = 0
        for _, played_card in ipairs(context.full_hand) do
          local center_key = played_card.config.center and played_card.config.center.key
          if center_key and self.enhancement_to_sticker[center_key] then
            vanilla_enhancement_count = vanilla_enhancement_count + 1
          end
        end

        if vanilla_enhancement_count >= 5 then
          for _, played_card in ipairs(context.full_hand) do
            played_card.ability.perma_bonus = (played_card.ability.perma_bonus or 0) + card.ability.extra.chips
            played_card.ability.perma_mult = (played_card.ability.perma_mult or 0) + card.ability.extra.mult
            played_card:juice_up(0.3, 0.3)
          end

          if G.jokers and G.jokers.cards then
            for _, joker in ipairs(G.jokers.cards) do
              joker.ability.abn_perma_score = (joker.ability.abn_perma_score or 0) + card.ability.extra.score
              joker:juice_up(0.3, 0.3)
            end
          end

          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.ATTENTION,
            card = card
          }
        end
      end
    end

    if context.individual and context.cardarea == G.play then
      if not card.ability.extra.triggered_this_hand then
        local scoring_card = context.other_card
        local is_spectrum = check_spectrum_hand()

        local center_key = scoring_card.config.center and scoring_card.config.center.key
        local sticker_key = center_key and self.enhancement_to_sticker[center_key]

        if is_spectrum and sticker_key then
          local leftmost_joker = G.jokers and G.jokers.cards[1]

          if leftmost_joker then
            card.ability.extra.triggered_this_hand = true

            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.4,
              func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
              end
            }))
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.15,
              func = function()
                leftmost_joker:flip()
                play_sound('card1', 1)
                leftmost_joker:juice_up(0.3, 0.3)
                return true
              end
            }))
            G.E_MANAGER:add_event(Event({
              func = function()
                leftmost_joker:add_sticker(sticker_key, true)
                return true
              end
            }))
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.15,
              func = function()
                leftmost_joker:flip()
                play_sound('tarot2', 1, 0.6)
                leftmost_joker:juice_up(0.3, 0.3)
                return true
              end
            }))

            return {
              message = localize('k_upgrade_ex'),
              colour = G.C.ATTENTION,
              card = card
            }
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Nice Cream",
  },
}