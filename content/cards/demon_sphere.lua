-- Demon Sphere (coded by cloudzXIII)
SMODS.Joker {
  key = 'demon_sphere',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_demon_sphere')
    return { vars = { cae.asc_power, numerator, denominator } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet22',
  pos = { x = 3, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { base = 1, odds = 6, asc_power = 0.25 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_modded_rank(context.other_card) then
        return {
          plus_asc = card.ability.extra.asc_power
        }
      end
    end

    if context.final_scoring_step and not context.blueprint then
      local to_destroy = {}
      for _, v in ipairs(context.scoring_hand) do
        if SMODS.pseudorandom_probability(card, 'spheree', card.ability.extra.base, card.ability.extra.odds, "abn_demon_sphere") then
          to_destroy[#to_destroy + 1] = v
        end
      end
      if #to_destroy > 0 then
        SMODS.destroy_cards(to_destroy)
        G.E_MANAGER:add_event(Event({
          func = function()
            card:juice_up()
            return true
          end
        }))
      end
    end
  end,
  abn_artist_credits = {
    artist = "Tisisrealnow",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if ABN.is_modded_rank(playing_card) then
        return true
      end
    end
    return false
  end
}
