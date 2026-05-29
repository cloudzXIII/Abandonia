-- Grey Goo Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'greygoo_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 9, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.before and G.GAME.current_round.hands_played == 0 then
      local only_null = true
      for _, _card in ipairs(context.full_hand) do
        if _card.base.suit ~= "abn_suitless" then
          only_null = false
          break
        end
      end
      if only_null then
        G.playing_card = (G.playing_card and G.playing_card + #context.full_hand) or #context.full_hand
        local cards_copied = {}
        for _, _card in ipairs(context.full_hand) do
          local card_copied = copy_card(_card, nil, nil, G.playing_card)
          card_copied:add_to_deck()
          G.deck.config.card_limit = G.deck.config.card_limit + 1
          table.insert(G.playing_cards, card_copied)
          G.hand:emplace(card_copied)
          card_copied.states.visible = nil
          G.E_MANAGER:add_event(Event({
            func = function()
              card_copied:start_materialize()
              return true
            end
          }))
          cards_copied[#cards_copied + 1] = card_copied
        end
        return {
          message = localize('k_copied_ex'),
          colour = G.C.CHIPS,
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.calculate_context({ playing_card_added = true, cards = cards_copied })
                return true
              end
            }))
          end
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.base.suit == "abn_suitless" then
        return true
      end
    end
    return false
  end
}
