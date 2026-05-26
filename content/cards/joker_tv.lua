-- Joker TV (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_tv',

  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 9, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { mult = 1, sell_value = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { vars = { card.ability.extra.sell_value, card.ability.extra.mult }, }
  end,


  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "program_pack" then
      for _, playing_card in ipairs(G.playing_cards) do
        if ABN.is_light(playing_card) then
          playing_card.ability.perma_mult = (playing_card.ability.perma_mult or 0) + card.ability.extra.mult
        end
      end
      for _, other_card in ipairs(G.jokers.cards) do
        if other_card.set_cost then
          other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
              card.ability.extra.sell_value
          other_card:set_cost()
        end
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end,
  abn_artist_credits = {
    artist = "Gud",
  },
}
