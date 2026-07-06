SMODS.Joker {
  key = 'spanish_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 5, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 1 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
      }
    end
    if context.final_scoring_step and not context.blueprint then
      local suit_mapping = {
        Hearts = 'abn_Coin',
        Diamonds = 'abn_Baton',
        Clubs = 'abn_Chalice',
        Spades = 'abn_Sword'
      }

      for _, scoring_card in ipairs(context.scoring_hand) do
        for base_suit, target_suit in pairs(suit_mapping) do
          if scoring_card:is_suit(base_suit) then
            G.E_MANAGER:add_event(Event({
              func = function()
                scoring_card:change_suit(target_suit)
                scoring_card:juice_up(0.3, 0.3)
                return true
              end
            }))
            break
          end
        end
      end
    end

    if context.before and not context.blueprint and card.edition and card.edition.key == "e_abn_vintage" then
      local count = 0
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card:is_suit("abn_Chalice") or scoring_card:is_suit("abn_Sword") or scoring_card:is_suit("abn_Coin") or scoring_card:is_suit("abn_Baton") then
          count = count + 1
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + count * change
        end,
      })
    end
  end,

  abn_artist_credits = {
    artist = "Generic1110",
  },
}
