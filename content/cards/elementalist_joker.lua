-- Elementalist Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'elementalist_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { localize(cae.type, 'poker_hands') } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 8, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { type = "abn_Inverse Spectrum" } },

  calculate = function(self, card, context)
    if context.before then
      if context.scoring_name == card.ability.extra.type then
        for _, scored_card in ipairs(context.scoring_hand) do
          card:juice_up(0.3, 0.5)
          local _rank = G.GAME.abn_rank_upgrades[scored_card.base.value]
          update_hand_text(
            { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = _rank.name .. "s", chips = _rank.chips, mult = _rank.mult, level = _rank.level }
          )
          ABN.level_up_rank(scored_card, scored_card.base.value)
          update_hand_text(
            { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = "", level = "" }
          )
        end
      end
      local suits = {}
      for _, v in ipairs(context.full_hand) do
        suits[v.base.suit] = true
      end

      local unique_suits = 0
      for _ in pairs(suits) do
        unique_suits = unique_suits + 1
      end
      if unique_suits >= 6 then
        return {
          level_up = true,
          message = localize('k_level_up_ex')
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
