-- Discontinued Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'discontinued_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.mult,
        cae.mult * (G.GAME.abn_UniqueTags or 0),
      },
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet20',
  pos = { x = 1, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 1
    }
  },
  calculate = function(self, card, context)
    if context.skip_blind then
      local _card = context.blueprint_card or card
      ABN.create_random_tag(_card)
    end
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_abn_discontinued") then
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
            card.ability.extra.mult * (G.GAME.abn_UniqueTags or 0)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, context.other_card)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Flote",
  },

  enhancement_gate = "m_abn_discontinued"
}
