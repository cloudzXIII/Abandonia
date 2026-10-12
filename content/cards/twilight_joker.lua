SMODS.Joker {
  key = 'twilight_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet26',
  pos = { x = 3, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0, mult = 0 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        card = card
      }
    end

    if context.change_suit and context.other_card then
      local old_suit = context.old_suit or context.from_suit
      local new_suit = context.new_suit or context.suit or (context.other_card.base and context.other_card.base.suit)
      local other = context.other_card
      local rank_val = other.base and other.base.nominal or 0

      local function is_suit_shade(suit_str, target_shade)
        if not suit_str or type(suit_str) ~= "string" then return false end

        if SMODS.Suits and SMODS.Suits[suit_str] then
          local s_shade = SMODS.Suits[suit_str].lc_properties and SMODS.Suits[suit_str].lc_properties.shade
            or SMODS.Suits[suit_str].shade
          if s_shade then
            return s_shade:lower() == target_shade:lower()
          end
        end

        if target_shade == "light" then
          return suit_str == 'Hearts' or suit_str == 'Diamonds' or suit_str == 'abn_Rose' or suit_str == 'abn_Anchor'
        elseif target_shade == "dark" then
          return suit_str == 'Spades' or suit_str == 'Clubs' or suit_str == 'abn_Arrow' or suit_str == 'abn_Shield'
        end

        return false
      end

      local was_light = is_suit_shade(old_suit, "light")
      local was_dark  = is_suit_shade(old_suit, "dark")
      local is_light  = is_suit_shade(new_suit, "light")
      local is_dark   = is_suit_shade(new_suit, "dark")

      if was_light and is_dark then
        card.ability.extra.chips = card.ability.extra.chips + rank_val
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end

      if was_dark and is_light then
        card.ability.extra.mult = card.ability.extra.mult + rank_val
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    if context.individual and context.cardarea == G.play then
      local is_bright = card.edition and (card.edition.key == 'e_abn_bright' or card.edition.e_abn_bright)
      if is_bright and ABN and ABN.is_light and ABN.is_light(context.other_card) then
        local is_first_light = false
        if context.scoring_hand then
          for i = 1, #context.scoring_hand do
            if ABN.is_light(context.scoring_hand[i]) then
              is_first_light = context.scoring_hand[i] == context.other_card
              break
            end
          end
        end

        if is_first_light then
          return {
            amp = context.other_card.base.nominal,
            card = card
          }
        end
      end

      local is_opaque = card.edition and (card.edition.key == 'e_abn_opaque' or card.edition.e_abn_opaque)
      if is_opaque and ABN and ABN.is_dark and ABN.is_dark(context.other_card) then
        local is_first_dark = false
        if context.scoring_hand then
          for i = 1, #context.scoring_hand do
            if ABN.is_dark(context.scoring_hand[i]) then
              is_first_dark = context.scoring_hand[i] == context.other_card
              break
            end
          end
        end

        if is_first_dark then
          return {
            modulate = context.other_card.base.nominal,
            card = card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
}