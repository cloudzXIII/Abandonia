-- Joker Rave (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_rave',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.chips_gain,
        card.ability.extra.mult,
        card.ability.extra.mult_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 4, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 0,
      mult = 0,
      chips_gain = 5,
      mult_gain = 2
    },
  },
  calculate = function(self, card, context)
    if context.setting_blind then
      for _, area in ipairs({ G.jokers.cards or {}, G.playing_cards }) do
        for e, joker in ipairs(area) do
          if not joker.edition then
            joker:flip()
            if joker.facing == "back" then
              joker.ability.abn_perma_flipped = true
            end
          end
        end
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.abn_perma_flipped then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
          message_key = "a_chips"
        })
      end
    end
    if context.repetition and context.cardarea == G.play then
      if card.edition then
        return {
          repetitions = 1,
          card = context.other_card
        }
      end
    end
    if context.post_trigger and context.other_card.edition then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
  in_pool = function(self)
    for _, area in ipairs({ G.jokers.cards or {}, G.playing_cards }) do
      for e, other_card in ipairs(area) do
        if other_card.edition then
          return true
        end
      end
    end
  end
}
