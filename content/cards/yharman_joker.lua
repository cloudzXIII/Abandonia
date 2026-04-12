SMODS.Joker {
  key = 'yharman_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 6 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.1, } },

  calculate = function(self, card, context)
    if context.abn_play_cards then
      for i = 1, #G.hand.highlighted do
        if G.hand.highlighted[i].facing == 'back' then
          G.hand.highlighted[i].yharman_flipped = true
        end
      end
    end
    if context.after and not context.blueprint and context.main_eval then
      local cards_to_destroy = {}
      for _, playing_card in ipairs(context.scoring_hand) do
        if playing_card.yharman_flipped then
          playing_card.yharman_flipped = false
          cards_to_destroy[#cards_to_destroy + 1] = playing_card
        end
      end
      if #cards_to_destroy > 0 then
        SMODS.destroy_cards(cards_to_destroy)
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + cards_to_destroy * change
          end,
        })
      end
    end
  end,
  abn_artist_credits = {
    artist = "FlamethrowerFirm"
  },
}
-- only appears if you have 5 or more flipped cards in deck
