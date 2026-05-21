-- Shovel Knight Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'shovel_knight',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    return { vars = {} }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 4, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },
  calculate = function(self, card, context)
    if context.setting_blind then
      local stone_card = SMODS.create_card { set = "Base", enhancement = "m_abn_fossil", area = G.discard }
      G.playing_card = (G.playing_card and G.playing_card + 1) or 1
      stone_card.playing_card = G.playing_card
      table.insert(G.playing_cards, stone_card)

      G.E_MANAGER:add_event(Event({
        func = function()
          stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
          G.play:emplace(stone_card)
          return true
        end
      }))
      return {
        message = localize('k_plus_fossil'),
        colour = G.C.SECONDARY_SET.Enhanced,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.deck.config.card_limit = G.deck.config.card_limit + 1
              return true
            end
          }))
          draw_card(G.play, G.deck, 90, 'up')
          SMODS.calculate_context({ playing_card_added = true, cards = { stone_card } })
        end
      }
    end
  end,
  abn_artist_credits = {
    artist = "DrSmey",
  },
}
