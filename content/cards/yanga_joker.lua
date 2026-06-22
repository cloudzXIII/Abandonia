SMODS.Joker {
  key = 'yanga_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 5, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 0,
      mult = 0,
      chipsadd = 20,
      multadd = 10,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_darkner
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_dark
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Changing
    if context.before and context.scoring_hand and G.GAME.hands_played == 0 then
      if next(context.poker_hands["Flush"]) then
        local target_suit = nil
        local potential_suits = { 'Bows', 'Spades', 'Clubs' }

        for _, suit in ipairs(potential_suits) do
          if context.scoring_hand[1]:is_suit(suit) then
            target_suit = suit
            break
          end
        end
        if target_suit then
          local valid_flush = true
          for _, scoring_card in ipairs(context.scoring_hand) do
            if not scoring_card:is_suit(target_suit) then
              valid_flush = false
              break
            end
          end

          if valid_flush then
            local target_edition = nil

            if target_suit == 'abn_Bow' then
              target_edition = { abn_chthonian = true }
            elseif target_suit == 'Spades' then
              target_edition = { abn_dark = true }
            elseif target_suit == 'Clubs' then
              target_edition = { abn_chthonian = true }
            end

            if target_edition then
              for _, scoring_card in ipairs(context.scoring_hand) do
                scoring_card:set_ability(G.P_CENTERS.m_abn_darkner)
                scoring_card:set_edition(target_edition, true)
              end
            end
          end
        end
      end
    end

    -- Scaling
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      if target_card.edition and target_card.edition.abn_dark then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      elseif target_card.edition and target_card.edition.abn_chthonian then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    -- Scoring
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
