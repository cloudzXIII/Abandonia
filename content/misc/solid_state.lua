-- Solid State Consumables (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "solid_state",
  primary_colour = HEX("709795"),
  secondary_colour = HEX("709795"),
  collection_rows = { 5, 5 },
  shop_rate = 0,
}

ABN.SolidState = SMODS.Consumable:extend({
  set = 'solid_state',
  cost = 4,
  atlas = "abn_AbandoniaSolidState",
  pos = { x = 0, y = 0 },
})


function ABN.get_rarity(card)
  if not card then return end

  local rarity = card.config.center.rarity

  if rarity then
    local rarities = { "Common", "Uncommon", "Rare", "Legendary" }
    if type(rarity) == "number" then
      return rarities[rarity]
    end
    return rarity
  end

  return "Common"
end

ABN.SolidState {
  key = "digitization",
  pos = { x = 5, y = 0 },
  config = { max_highlighted = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_digitization_upgrades", set = "Other" }
  end,

  can_use = function(self, card)
    local digitization_upgrades = {
      Common = "Uncommon",
      Uncommon = "Rare",
      Rare = "abn_SuperRare",
      Legendary = "abn_ParallelRare"
    }

    return G.jokers and #G.jokers.highlighted == 1 and digitization_upgrades[ABN.get_rarity(G.jokers.highlighted[1])]
  end,
  use = function(self, card, area, copier)
    local selected = G.jokers.highlighted[1]

    local digitization_upgrades = {
      Common = "Uncommon",
      Uncommon = "Rare",
      Rare = "abn_SuperRare",
      Legendary = "abn_ParallelRare"
    }

    local upper_rarity = digitization_upgrades[ABN.get_rarity(selected)]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        selected:flip()
        play_sound('card1', 1)
        selected:juice_up(0.3, 0.3)
        return true
      end
    }))

    local old_edition = selected.edition and selected.edition.key or nil

    local pool = SMODS.get_clean_pool("Joker", upper_rarity, false)
    local new_key = pseudorandom_element(pool, "abn_digitization")
    G.E_MANAGER:add_event(Event({
      func = function()
        selected:set_ability(G.P_CENTERS[new_key])
        return true
      end
    }))

    if old_edition then
      selected:set_edition(old_edition)
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        selected:flip()
        play_sound('tarot2', 1, 0.6)
        selected:juice_up(0.3, 0.3)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        if G.GAME.dollars ~= -10 then
          ease_dollars(-(G.GAME.dollars + 10), true)
        end
        return true
      end
    }))

    delay(0.5)
    G.jokers:unhighlight_all()
  end,
  abn_artist_credits = {
    artist = "Muddz"
  },
}
