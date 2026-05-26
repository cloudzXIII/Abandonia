-- Ultimo Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'ultimo_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.repetitions } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 3, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { repetitions = 0 } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local enhancements = {}
      for _, v in ipairs(context.scoring_hand) do
        if v.set == "Enhanced" then
          enhancements[v.config.center.key] = true
        end
      end

      local unique_enhancements = 0
      for _ in pairs(enhancements) do
        unique_enhancements = unique_enhancements + 1
      end

      card.ability.extra.repetitions = unique_enhancements
    end
    if context.repetition and context.cardarea == G.play and card.ability.extra.repetitions > 0 then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "Revenge",
  },
  in_pool = function(self, args)
    local enhancements = {}
    for _, v in ipairs(G.playing_cards or {}) do
      enhancements[v.config.center.key] = true
    end

    local unique_enhancements = 0
    for _ in pairs(enhancements) do
      unique_enhancements = unique_enhancements + 1
    end
    return unique_enhancements >= 5
  end,
}
