SMODS.Joker {
  key = 'meatkin', -- Meatkin Joker
  rarity = 3,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet11',
  pos = { x = 7, y = 5 },
  --atlas = 'jonklers',     -- test sprites from my own mod
  --pos = { x = 4, y = 4 }, -- Hideous Mass
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  demicoloncompat = true,
  config = { extra = { xmult = 0.1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return { vars = { card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_steel") then
        local count = 0
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_enhancement(scored_card, "m_steel") then
            count = count + 1
            scored_card.ability.perma_x_mult = (scored_card.ability.perma_x_mult or 1) +
                card.ability.extra.xmult
            G.E_MANAGER:add_event(Event({
              func = function()
                scored_card:juice_up()
                return true
              end
            }))
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
    if context.forcetrigger then
      for _, scored_card in ipairs(context.scoring_hand) do
        if not SMODS.has_enhancement(scored_card, "m_steel") then
          count = count + 1
          scored_card.ability.perma_x_mult = (scored_card.ability.perma_x_mult or 1) +
              card.ability.extra.xmult
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              return true
            end
          }))
        end
      end
      if count > 0 then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED
        }
      end
    end
  end,
  in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_steel'`
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_steel') then
        return true
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Sirtime",
  }
}
