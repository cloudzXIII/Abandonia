-- The Gloom (coded by cloudzXIII)
SMODS.Joker {
  key = 'the_gloom',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_opaque
    return { vars = { cae.xmult, } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet24',
  pos = { x = 0, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 5, } },

  calculate = function(self, card, context)
    if context.joker_main and #context.scoring_hand >= 5 then
      local all_dark = true
      for _, v in ipairs(context.scoring_hand) do
        if not ABN.is_dark(v) then
          all_dark = false
        end
      end
      if all_dark then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end
    if context.after then
      local all_opaque = true
      for _, v in ipairs(context.scoring_hand) do
        if not v.edition or (v.edition and v.edition.key ~= "e_abn_opaque") then
          all_opaque = false
        end
      end
      if all_opaque then
        for _, scored_card in ipairs(context.scoring_hand) do
          card:juice_up(0.3, 0.5)
          ABN.level_up_rank(scored_card, scored_card.base.value)
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Superb Thing",
  },
  in_pool = function(self, args)
    return G.GAME.abn.dark_suits_played >= 5
  end
}
