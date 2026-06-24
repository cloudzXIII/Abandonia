-- This is just looking really ugly and pmo, so want to comment it out for now till i find a way to implement it better
-- - cloudz :)
--[[
SMODS.Joker {
  key = 'jolly_roger',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 3, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      tarotchips = 5,
      planetmult = 1,
      spectralretrigger = 1,
      astrochips = 10,
      calamitymult = 4,
      lexicaxmult = 0.1,
      text1 = "",
      text2 = "",
      text3 = "",
      text4 = "",
      text5 = "",
      text6 = "",
      text7 = ""
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.text1,
        card.ability.extra.text2,
        card.ability.extra.text3,
        card.ability.extra.text4,
        card.ability.extra.text5,
        card.ability.extra.text6,
        card.ability.extra.text7,
      },
    }
  end,

  update = function(self, card)
    if card.area == G.jokers then

      -- Track currently owned consumable sets
      local owned = { Tarot = false, Planet = false, Spectral = false, astro_cards = false, calamity_cards = false, lexica = false, continent = false }
      if G.consumeables and G.consumeables.cards then
        for _, c in ipairs(G.consumeables.cards) do
          if c.ability and c.ability.set and owned[c.ability.set] ~= nil then
            owned[c.ability.set] = true
          end
        end
      end

      -- Dynamically set the text strings if they exist in your inventory, otherwise clear them
      card.ability.extra.text1 = owned.Tarot and ("Tarot: Random deck card gains +" .. card.ability.extra.tarotchips .. " Chips") or ""
      card.ability.extra.text2 = owned.Planet and ("Planet: Random deck card gains +" .. card.ability.extra.planetmult .. " Mult") or ""
      card.ability.extra.text3 = owned.Spectral and ("Spectral: Random deck card gains +" .. card.ability.extra.spectralretrigger .. " Retrigger") or ""
      card.ability.extra.text4 = owned.astro_cards and ("Astro: Random Joker gains +" .. card.ability.extra.astrochips .. " Chips") or ""
      card.ability.extra.text5 = owned.calamity_cards and ("Calamity: Random Joker gains +" .. card.ability.extra.calamitymult .. " Mult") or ""
      card.ability.extra.text6 = owned.lexica and ("Lexica: Random Joker gains x" .. card.ability.extra.lexicaxmult .. " Mult") or ""
      card.ability.extra.text7 = owned.continent and "Continent: Random Joker gains a random edition" or ""
    end
  end,

  calculate = function(self, card, context)
    if context.selling_card then
      local sold_card = context.card
      if not sold_card or not sold_card.config or not sold_card.config.center then return end

      local sold_set = sold_card.config.center.set

      -- TAROT
      if sold_set == "Tarot" and G.deck and #G.playing_cards > 0 then
        local target = pseudorandom_element(G.playing_cards, pseudoseed('jolly_tarot'))
        target.ability.perma_bonus = (target.ability.perma_bonus or 0) + card.ability.extra.tarotchips
        target:juice_up()

      -- PLANET
      elseif sold_set == "Planet" and G.deck and #G.playing_cards > 0 then
        local target = pseudorandom_element(G.playing_cards, pseudoseed('jolly_planet'))
        target.ability.perma_mult = (target.ability.perma_mult or 0) + card.ability.extra.planetmult
        target:juice_up()

      -- SPECTRAL
      elseif sold_set == "Spectral" and G.deck and #G.playing_cards > 0 then
        local target = pseudorandom_element(G.playing_cards, pseudoseed('jolly_spectral'))
        target.ability.perma_repetitions = (target.ability.perma_repetitions or 0) + card.ability.extra.spectralretrigger
        target:juice_up()

      -- ASTRO
      elseif sold_set == "astro_cards" and G.jokers and #G.jokers.cards > 0 then
        local target = pseudorandom_element(G.jokers.cards, pseudoseed('jolly_astro'))
        target.ability.abn_perma_chips = (target.ability.abn_perma_chips or 0) + card.ability.extra.astrochips
        target:juice_up()

      -- CALAMITY
      elseif sold_set == "calamity_cards" and G.jokers and #G.jokers.cards > 0 then
        local target = pseudorandom_element(G.jokers.cards, pseudoseed('jolly_calamity'))
        target.ability.abn_perma_mult = (target.ability.abn_perma_mult or 0) + card.ability.extra.calamitymult
        target:juice_up()

      -- LEXICA
      elseif sold_set == "lexica" and G.jokers and #G.jokers.cards > 0 then
        local target = pseudorandom_element(G.jokers.cards, pseudoseed('jolly_lexica'))
        target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.lexicaxmult
        target:juice_up()

      -- CONTINENT (these aren't implemented yet?)
      elseif sold_set == "continent" and G.jokers and #G.jokers.cards > 0 then
        local target = pseudorandom_element(G.jokers.cards, pseudoseed('jolly_continent'))
        target:set_edition(poll_edition('random key', nil, false, true))
        target:juice_up()
      end
    end
  end,

  abn_artist_credits = {
    artist = "Omicra",
  },
}
--]]
