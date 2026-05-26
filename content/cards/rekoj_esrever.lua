-- Rekoj Esrever (coded by cloudzXIII)
SMODS.Joker {
  key = 'rekoj_esrever',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.chips_gain, card.ability.extra.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet7',
  pos = { x = 7, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 3, chips_gain = 4, chips = 0 } },

  calculate = function(self, card, context)
    if context.final_scoring_step then
      for _, v in ipairs(context.scoring_hand) do
        if v.facing == 'back' then
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
              v.ability.abn_perma_flipped = false
              v:flip()
              return true
            end
          }))
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "mult",
            scalar_value = "mult_gain",
            operation = '+',
            no_message = true,
          })
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chips_gain",
            operation = '+',
          })
        end
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Littleroot",
  },
  in_pool = function(self)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.ability.abn_perma_flipped then
        return true
      end
    end
    for _, joker in ipairs(G.jokers.cards or {}) do
      if joker.ability.abn_perma_flipped then
        return true
      end
    end
    return false
  end
}
