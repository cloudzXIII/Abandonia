-- Armageddon Road (coded by cloudzXIII)
SMODS.Joker {
  key = 'armageddon_road',

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 8, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = {} }
  end,

  calculate = function(self, card, context)
    if context.blind_defeated and not context.blueprint then
      if G.GAME.blind:get_type() == "Big" then
        local continent_cards = {}
        for _, v in ipairs(G.consumeables.cards) do
          if v.ability.set == "continent" then
            continent_cards[#continent_cards + 1] = v
          end
        end

        if #continent_cards > 0 then
          local count = #continent_cards
          SMODS.destroy_cards(continent_cards, nil, true)
          for _ = 1, count do
            SMODS.add_card({
              set = "calamity_cards",
              edition = "e_negative"
            })
          end
        end

        local tarot_cards = {}
        for _, v in ipairs(G.consumeables.cards) do
          if v.ability.set == "Tarot" then
            tarot_cards[#tarot_cards + 1] = v
          end
        end

        if #tarot_cards > 0 then
          local count = #tarot_cards
          SMODS.destroy_cards(tarot_cards, nil, true)
          for _ = 1, count do
            SMODS.add_card({
              set = "weather_report",
              edition = "e_negative"
            })
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = " b.b.b.b",
  },
}
