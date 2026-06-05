SMODS.Joker {
  key = 'gold_7',
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS["m_gold"]
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 0, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
        local transformed = false
        for k, v in ipairs(context.scoring_hand) do
            if v:get_id() == 7 then
                if transformed == false then transformed=true end
                v:set_ability(G.P_CENTERS.m_gold, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                            v:juice_up()
                            return true
                    end
                })) 
            end
        end
        if transformed then
            return {
                message=localize("k_gold"),
                colour=G.C.MONEY,
            }
        end
    end
    if context.individual and context.cardarea == G.play then
        if SMODS.has_enhancement(context.other_card,"m_gold") then
            return {
                mult=context.other_card:get_id()*2
            }
        end
    end
  end,
  in_pool = function()
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, "m_gold") then
        return true
      end
    end
  end,

  abn_artist_credits = {
    artist = "Swizik",
  },
}
