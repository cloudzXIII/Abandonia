SMODS.Joker {
  key = 'fraudulent_mod_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet12',
  pos = { x = 7, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { multadd = 10, chipsadd = 20, mult = 0, chips = 0 } },
  pools = { ["Plagued"] = true },

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_sew
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_cotton
    return {
      vars = {
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
        card.ability.extra.mult,
        card.ability.extra.chips
      }
    }
  end,

  -- Only available on Jimbo Stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then
      local mult_count = 0
      local chip_count = 0

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        if scoring_card:is_suit('abn_Tie') or scoring_card:is_suit('abn_Bow') then
          if scoring_card.config.center then
            if scoring_card.config.center.key == 'm_abn_sew' then
              mult_count = mult_count + 1
            elseif scoring_card.config.center.key == 'm_abn_cotton' then
              chip_count = chip_count + 1
            end
          end
        end
      end

      if mult_count > 0 or chip_count > 0 then
        card.ability.extra.mult = card.ability.extra.mult + (mult_count * card.ability.extra.multadd)
        card.ability.extra.chips = card.ability.extra.chips + (chip_count * card.ability.extra.chipsadd)

        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = localize('k_upgrade_ex'),
          colour = G.C.ATTENTION
        })
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly",
  },
}
