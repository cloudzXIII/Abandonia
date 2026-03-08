SMODS.Joker {
  key = 'menacing_clown',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 3 },
  cost = 6,
  discovered = true,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local my_pos = ABN.get_pos(card, G.jokers.cards)
      if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
        local sliced_card = G.jokers.cards[my_pos + 1]
        sliced_card.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        G.E_MANAGER:add_event(Event({
          func = function()
            G.GAME.joker_buffer = 0
            card:juice_up(0.8, 0.8)
            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
            play_sound('slice1', 0.96 + math.random() * 0.08)
            return true
          end
        }))
        if G.jokers.cards[my_pos - 1] and not G.jokers.cards[my_pos - 1].edition then
          local edition = poll_edition('j_abn_menacing_clown', nil, true, true, { 'e_polychrome', 'e_holo', 'e_foil' })
          G.jokers.cards[my_pos - 1]:set_edition(edition, true)
        end
        return {
          message = localize("k_abn_destroyed"),
          colour = G.C.RED,
          no_juice = true
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "fattywapp"
  },
}
