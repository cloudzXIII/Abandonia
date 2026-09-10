SMODS.Joker {
  key = 'monocromator_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 7, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { mult = 0, chips = 0, chipsadd = 10 } },
  
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_opaque
    return { vars = { cae.mult, cae.chips, cae.chipsadd } }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local hand_eval = context.scoring_hand
      
      local is_straight = false
      if context.poker_hands and context.poker_hands['Straight'] then
        is_straight = next(context.poker_hands['Straight']) ~= nil
      end
      
      local is_straight_spectrum = (context.scoring_name == "abn_Straight Spectrum")

      if is_straight and not context.blueprint then
        local unique_suits = {}
        for _, scoring_card in ipairs(hand_eval) do
          for suit_key, _ in pairs(SMODS.Suits) do
            if scoring_card:is_suit(suit_key) then
              unique_suits[suit_key] = true
            end
          end
        end
        
        local suit_count = 0
        for _ in pairs(unique_suits) do
          suit_count = suit_count + 1
        end

        if suit_count > 0 then
          local total_chips_to_add = card.ability.extra.chipsadd * suit_count
          card.ability.extra.chips = card.ability.extra.chips + total_chips_to_add
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
        end
      end

      if is_straight_spectrum then
        local vanilla_suits = { Spades = true, Hearts = true, Clubs = true, Diamonds = true }
        local total_rank_mult = 0
        local has_vanilla = false

        for _, scoring_card in ipairs(hand_eval) do
          local is_vanilla_card = false
          for v_suit, _ in pairs(vanilla_suits) do
            if scoring_card:is_suit(v_suit) then
              is_vanilla_card = true
              has_vanilla = true
              break
            end
          end

          if not is_vanilla_card then
            local nominal = scoring_card.base and scoring_card.base.nominal or 0
            total_rank_mult = total_rank_mult + nominal 
          end
        end

        if total_rank_mult > 0 then
          card.ability.extra.mult = card.ability.extra.mult + total_rank_mult
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
        end

        if not has_vanilla then
          for _, scoring_card in ipairs(hand_eval) do
            scoring_card:set_edition("e_abn_opaque", true)
          end
          card:juice_up(0.3, 0.5)
        end
      end
    end

    if context.joker_main then
      if card.ability.extra.chips > 0 or card.ability.extra.mult > 0 then
        return {
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Swizik",
  },
}