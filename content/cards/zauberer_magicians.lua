SMODS.Joker {
  key = 'zauberer_magicians',
  rarity = 2,
  atlas = 'ABNJokerSheet19',
  pos = { x = 3, y = 0 },
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
        Hearts = 'abn_Snow',
        Diamonds = 'abn_Tie',
        Clubs = 'abn_Penumbra',
        Spades = 'abn_Bow'
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

    if context.change_suit and context.other_card and not context.blueprint then
      if card.edition and card.edition.key == "e_abn_vintage" then
        card.ability.extra_value = card.ability.extra_value + card.ability.extra.mult_gain
        card:set_cost()
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = '+',
        })
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comkyel",
  },
}
