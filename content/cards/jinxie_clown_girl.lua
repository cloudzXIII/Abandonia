-- Jenna the Jester Girl (coded by cloudzXIII)
SMODS.Joker {
  key = 'jinxie_clown_girl',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.mult, cae.asc, cae.asc_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet26',
  pos = { x = 2, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 100, mult = 40, asc = 0, asc_gain = 0.25 } },

  calculate = function(self, card, context)
    if context.other_joker and not context.other_joker.config.center.mod then
      local count = 0
      for _, joker in ipairs(G.jokers.cards) do
        if not joker.config.center.mod then
          count = count + 1
        end
      end
      if count % 2 == 0 then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
    if context.individual and context.cardarea == G.play and next(SMODS.find_card("j_joker")) then
      if not ABN.is_modded_suit(context.other_card) then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
    if context.joker_main then
      return {
        plus_asc = card.ability.extra.asc
      }
    end

    if next(SMODS.find_card("j_abn_jenna_jester_girl")) and context.post_trigger and context.other_card.ability.set == "Joker" and not context.other_card.config.center.mod then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "asc",
        scalar_value = "asc_gain",
        operation = '+',
        message_colour = G.C.GOLD,
      })
    end
  end,

  abn_artist_credits = {
    artist = "La Ginger",
  },
}
