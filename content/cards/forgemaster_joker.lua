SMODS.Joker {
  key = 'forgemaster_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 3, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_hot_iron
    return { vars = { localize({ type = 'name_text', key = "m_abn_hot_iron", set = 'Enhanced' }), } }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end
    -- Trigger before scoring starts
    if context.cardarea == G.jokers and context.before then
      local scoringSet = {}
      for _, played_card in ipairs(context.scoring_hand or {}) do
        scoringSet[played_card] = true
      end

      -- Loop through all played cards and find the ones NOT in the scoring set
      for _, thisCard in ipairs(context.full_hand or {}) do
        if not scoringSet[thisCard] then
          thisCard:set_ability(G.P_CENTERS.m_abn_hot_iron, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              thisCard:juice_up()
              return true
            end,
          }))
        end
      end
    end
    if context.modify_scoring_hand and SMODS.has_enhancement(context.other_card, "m_abn_hot_iron") then
      return {
        add_to_hand = true
      }
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
