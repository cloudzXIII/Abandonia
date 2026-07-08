-- Jack of all Trades (coded by cloudzXIII)
local function count_total_jacks()
  local unique = 0
  for _, v in pairs(G.GAME.abn.total_jacks_discarded) do
    unique = unique + 1
  end
  return unique
end
SMODS.Joker {
  key = 'jack_of_all_trades',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local jacks = count_total_jacks()
    return {
      vars = {
        cae.xmult,
        jacks,
        localize("Jack", 'ranks'),
        jacks > 0 and cae.xmult * jacks or 1
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet15',
  pos = { x = 0, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.2 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == "unscored" then
      if context.other_card:get_id() ~= 11 then
        local jacks = count_total_jacks()
        if jacks > 0 then
          return {
            xmult = card.ability.extra.xmult * jacks
          }
        end
      end
    end
    if context.final_scoring_step and not context.blueprint then
      local jack = false
      for _, v in ipairs(context.full_hand) do
        if v:get_id() == 11 then
          jack = true
        end
      end
      if not jack then
        SMODS.destroy_cards(card, nil, nil, true)
        SMODS.calculate_effect({ message = localize('k_abn_destroyed'), colour = G.C.RED }, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Gud",
  },
}
