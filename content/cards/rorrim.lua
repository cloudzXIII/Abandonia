SMODS.Joker {
  key = 'rorrim', -- Rorrim Joker
  rarity = 3,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet15',
  pos = { x = 7, y = 5 },
  --atlas = 'jonklers',     -- test sprites from my own mod
  --pos = { x = 4, y = 4 }, -- Hideous Mass
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  demicoloncompat = false,
  config = { extra = { mult_per = 1, chips_per = 2 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    return { vars = { card.ability.extra.mult_per, card.ability.extra.chips_per } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_glass") then
        local count = 0
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_enhancement(scored_card, "m_glass") then
            count = count + 1
            scored_card.ability.perma_bonus = (scored_card.ability.perma_bonus or 0) +
                (card.ability.extra.chips_per * #context.scoring_hand)
            scored_card.ability.perma_mult = (scored_card.ability.perma_mult or 0) +
                (card.ability.extra.mult_per * #context.scoring_hand)
          end
        end
        if count > 0 then
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.RED
          }
        end
      end
    end
    if context.remove_playing_cards and not context.blueprint then
      local glass_cards = 0
      for _, removed_card in ipairs(context.removed) do
        if removed_card.shattered and SMODS.has_enhancement(removed_card, "m_glass") then
          glass_cards = glass_cards + 1
          if context.scoring_hand then
            for _, scored_card in ipairs(context.scoring_hand) do
              if not SMODS.has_enhancement(scored_card, "m_glass") then
                scored_card.ability.perma_bonus = scored_card:get_chip_bonus()
              end
            end
          end
        end
      end
      if glass_cards > 0 then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED
        }
      end
    end
  end,
  in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_steel'`
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_glass') then
        return true
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Triangle Snack",
  }
}
