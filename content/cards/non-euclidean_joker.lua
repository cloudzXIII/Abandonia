-- TO FIX (wth is this code eric :sob:)
--[[
Minus said: I have Non-Euclidian Joker and Marmalize Joker. Marmalize's effect triggered for Non-Euclidian as expected for Mult, but it's Chips did not go up at all. It also had it's chips already at +2 while in the shop for some reason, and that's what it's stayed on.
It also seems like Non-Euclidian will jiggle when cards are added to my consumables
]]

local last_known_chips = {}
local last_known_mult = {}

SMODS.Joker {
  key = 'noneuclidean_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 3, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  -- Track both stats independently
  config = { extra = { chips = 0, mult = 0 } },
  pools = { ["Plagued"] = true },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
      }
    }
  end,

  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  update = function(self, card)
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then return end

    for i = 1, #G.jokers.cards do
      local j = G.jokers.cards[i]
      if j.config.center and j.config.center.key ~= 'j_abn_noneuclidean_joker' then
        local j_key = j.unique_val or tostring(j)

        local current_chips = 0
        local current_mult = 0

        -- Helper to check if string contains a target but isn't an X-mult metric
        local is_flat = function(k, target)
          local sk = string.lower(tostring(k))
          return string.find(sk, target) and not string.find(sk, "x_")
        end

        -- Check card.ability.extra
        if type(j.ability.extra) == "table" then
          for k, v in pairs(j.ability.extra) do
            if type(v) == "number" then
              if is_flat(k, "chip") then current_chips = current_chips + v end
              if is_flat(k, "mult") then current_mult = current_mult + v end
            end
          end
        elseif type(j.ability.extra) == "number" and j.config.center.config then
          if j.config.center.config.extra_value == 'chips' then
            current_chips = current_chips + j.ability.extra
          elseif j.config.center.config.extra_value == 'mult' then
            current_mult = current_mult + j.ability.extra
          end
        end

        -- Check base card.ability
        for k, v in pairs(j.ability) do
          if type(v) == "number" then
            if is_flat(k, "chip") then current_chips = current_chips + v end
            if is_flat(k, "mult") then current_mult = current_mult + v end
          end
        end

        -- Initialize caches if new card
        if not last_known_chips[j_key] then last_known_chips[j_key] = current_chips end
        if not last_known_mult[j_key] then last_known_mult[j_key] = current_mult end

        -- Calculate differences and scale 2x
        local chip_change = current_chips - last_known_chips[j_key]
        local mult_change = current_mult - last_known_mult[j_key]
        local triggered = false

        if chip_change > 0 then
          card.ability.extra.chips = card.ability.extra.chips + (chip_change * 2)
          triggered = true
        end
        if mult_change > 0 then
          card.ability.extra.mult = card.ability.extra.mult + (mult_change * 2)
          triggered = true
        end

        if triggered then card:juice_up() end

        -- Sync caches
        last_known_chips[j_key] = current_chips
        last_known_mult[j_key] = current_mult
      end
    end

    -- Clean up cache tracking
    for k, _ in pairs(last_known_chips) do
      local found = false
      for i = 1, #G.jokers.cards do
        if (G.jokers.cards[i].unique_val or tostring(G.jokers.cards[i])) == k then
          found = true; break
        end
      end
      if not found then
        last_known_chips[k] = nil
        last_known_mult[k] = nil
      end
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      -- Returns BOTH chips and mult simultaneously to the scoring engine
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Inky",
  },
}
