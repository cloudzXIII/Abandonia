SMODS.Joker {
  key = 'ransomware_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 0, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  -- Storing all scaling, losing, and exponential values here
  config = {
    extra = {
      tarot_chips = 10, tarot_dollars = -2,
      spectral_chips = 5, spectral_dollars = -15,
      calamity_pow = 1.1, calamity_dollars = -10,
      weather_mult = 10, weather_dollars = -7,
      astro_mult = 13, astro_dollars = -9,
      nightshift_pow = 0.3,
    }
  },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.tarot_chips, card.ability.extra.tarot_dollars,
        card.ability.extra.spectral_chips, card.ability.extra.spectral_dollars,
        card.ability.extra.calamity_pow, card.ability.extra.calamity_dollars,
        card.ability.extra.weather_mult, card.ability.extra.weather_dollars,
        card.ability.extra.astro_mult, card.ability.extra.astro_dollars,
        card.ability.extra.nightshift_pow
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    -- TAROT: All Jokers gain +10 chips, lose $2
    if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
      ease_dollars(card.ability.extra.tarot_dollars)
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.tarot_chips
      end


      -- SPECTRAL: All Jokers gain +5 chips, lose $15
    elseif context.using_consumeable and context.consumeable.ability.set == "Spectral" then
      ease_dollars(card.ability.extra.spectral_dollars)
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.spectral_chips
      end


      -- CALAMITY: All Jokers chips increased by ^1.1, lose $10
    elseif context.using_consumeable and context.consumeable.ability.set == "calamity_cards" then
      ease_dollars(card.ability.extra.calamity_dollars)
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        local current_chips = j.ability.abn_perma_bonus or 0
        if current_chips == 0 then current_chips = 10 end -- Fallback if the Joker has no bonus yet
        j.ability.abn_perma_bonus = math.floor(current_chips ^ card.ability.extra.calamity_pow)
      end


      -- WEATHER REPORT: All Jokers gain +10 mult, lose $7
    elseif context.using_consumeable and context.consumeable.ability.set == "weather_report" then
      ease_dollars(card.ability.extra.weather_dollars)
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.weather_mult
      end


      -- ASTRO: All Jokers gain +13 mult, lose $9
    elseif context.using_consumeable and context.consumeable.ability.set == "astro_cards" then
      ease_dollars(card.ability.extra.astro_dollars)
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.astro_mult
      end


      -- NIGHTSHIFT: All Jokers mult increased by ^0.3
    elseif context.using_consumeable and context.consumeable.ability.set == "nightshift_cards" then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        local current_mult = j.ability.abn_perma_mult or 0
        if current_mult == 0 then current_mult = 10 end -- Fallback if the Joker has no mult yet
        j.ability.abn_perma_mult = math.floor(current_mult ^ card.ability.extra.nightshift_pow)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly & Vega",
  },
}
