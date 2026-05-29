SMODS.Joker {
  key = 'feste',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 3 },
  soul_pos = { x = 1, y = 3 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = { localize({ type = 'name_text', key = "e_negative", set = 'Edition' }), } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      local nightshift_pool = {}
      for k, v in pairs(G.P_CENTER_POOLS["nightshift_cards"]) do
        nightshift_pool[#nightshift_pool + 1] = v.key
      end

      local chosen_key = pseudorandom_element(nightshift_pool, pseudoseed('feste'))

      G.E_MANAGER:add_event(Event({
        func = function()
          local _card = create_card(nil, G.consumeables, nil, nil, nil, nil, chosen_key)
          _card:set_edition({ negative = true }, true)
          _card:add_to_deck()
          G.consumeables:emplace(_card)
          return true
        end
      }))
    end
  end,

  abn_artist_credits = {
    artist = "Grass",
  },
}
