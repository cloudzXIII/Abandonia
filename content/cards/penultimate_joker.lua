-- Penultimate Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'penultimate_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 1, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dark_reps = 0, light_reps = 0 } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local light_enhancements = {}
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_light(v) and v.set == "Enhanced" then
          light_enhancements[v.config.center.key] = true
        end
      end

      local dark_enhancements = {}
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_dark(v) and v.set == "Enhanced" then
          dark_enhancements[v.config.center.key] = true
        end
      end

      local unique_light = 0
      for _ in pairs(light_enhancements) do
        unique_light = unique_light + 1
      end

      local unique_dark = 0
      for _ in pairs(dark_enhancements) do
        unique_dark = unique_dark + 1
      end

      card.ability.extra.light_reps = unique_light
      card.ability.extra.dark_reps = unique_dark
    end
    if context.repetition and context.cardarea == G.play and card.ability.extra.dark_reps > 0 and ABN.is_light(context.other_card) then
      return {
        repetitions = card.ability.extra.dark_reps
      }
    end
    if context.repetition and context.cardarea == G.play and card.ability.extra.light_reps > 0 and ABN.is_dark(context.other_card) then
      return {
        repetitions = card.ability.extra.light_reps
      }
    end
  end,
  abn_artist_credits = {
    artist = "Willthewednesday",
  },
  in_pool = function(self, args)
    local light_enhanced = false
    local dark_enhanced = false
    for _, v in ipairs(G.playing_cards or {}) do
      if ABN.is_light(v) and v.ability.set == "Enhanced" then
        light_enhanced = true
      end
      if ABN.is_dark(v) and v.ability.set == "Enhanced" then
        dark_enhanced = true
      end
    end

    return light_enhanced and dark_enhanced
  end,
}
