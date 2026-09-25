-- The Gleam (coded by cloudzXIII)
SMODS.Joker {
  key = 'the_gleam',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bright
    return { vars = { cae.xmult, } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet24',
  pos = { x = 2, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 5, } },

  calculate = function(self, card, context)
    if context.joker_main and #context.scoring_hand >= 5 then
      local all_light = true
      for _, v in ipairs(context.scoring_hand) do
        if not ABN.is_light(v) then
          all_light = false
        end
      end
      if all_light then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end
    if context.after then
      local all_bright = true
      for _, v in ipairs(context.scoring_hand) do
        if not v.edition or (v.edition and v.edition.key ~= "e_abn_bright") then
          all_bright = false
        end
      end
      if all_bright then
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
    return G.GAME.abn.light_suits_played >= 5
  end
}
