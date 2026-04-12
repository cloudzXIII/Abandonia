local function scale_this_joker(card, joker)
  if joker.ability.chips then
    SMODS.scale_card(card, {
      ref_table = card.ability.extra,
      ref_value = "chips",
      scalar_table = joker.ability,
      scalar_value = "chips",
      no_message = true
    })
  end
  if joker.ability.mult then
    SMODS.scale_card(card, {
      ref_table = card.ability.extra,
      ref_value = "mult",
      scalar_table = joker.ability,
      scalar_value = "mult",
      no_message = true
    })
  end
  if joker.ability.Xmult then
    SMODS.scale_card(card, {
      ref_table = card.ability.extra,
      ref_value = "x_mult",
      scalar_table = joker.ability,
      scalar_value = "Xmult",
      no_message = true,
      operation = function(ref_table, ref_value, initial, change)
        ref_table[ref_value] = initial + (change - 1)
      end,
    })
  end

  if joker.ability.x_mult then
    SMODS.scale_card(card, {
      ref_table = card.ability.extra,
      ref_value = "x_mult",
      scalar_table = joker.ability,
      scalar_value = "x_mult",
      no_message = true,
      operation = function(ref_table, ref_value, initial, change)
        ref_table[ref_value] = initial + (change - 1)
      end,
    })
  end

  if type(joker.ability.extra) == "table" then
    if joker.ability.extra.chips then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_table = joker.ability.extra,
        scalar_value = "chips",
        no_message = true
      })
    end

    if joker.ability.extra.mult then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_table = joker.ability.extra,
        scalar_value = "mult",
        no_message = true
      })
    end

    if joker.ability.extra.Xmult then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_table = joker.ability.extra,
        scalar_value = "Xmult",
        no_message = true,
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + (change - 1)
        end,
      })
    end

    if joker.ability.extra.x_mult then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_table = joker.ability.extra,
        scalar_value = "x_mult",
        no_message = true,
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + (change - 1)
        end,
      })
    end
  end
end
SMODS.Joker {
  key = 'trojan_joker',

  rarity = 3,
  atlas = "AbandoniaJokers",
  pos = { x = 2, y = 28 },
  cost = 2,

  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, mult = 0, x_mult = 1 }, },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.x_mult } }
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local pos = ABN.get_pos(card, G.jokers.cards)
      local destroyed_count = 0
      local left = G.jokers.cards[pos - 1]
      local right = G.jokers.cards[pos + 1]

      if left and not left.ability.eternal and not left.getting_sliced then
        destroyed_count = destroyed_count + 1
        left.getting_sliced = true
        scale_this_joker(card, left)
      end

      if right and not right.ability.eternal and not right.getting_sliced then
        destroyed_count = destroyed_count + 1
        right.getting_sliced = true
        scale_this_joker(card, right)
      end

      G.GAME.joker_buffer = G.GAME.joker_buffer - destroyed_count
      G.E_MANAGER:add_event(Event({
        func = function()
          G.GAME.joker_buffer = 0
          card:juice_up(0.8, 0.8)
          if left and left.getting_sliced then
            left:start_dissolve({ HEX("7869ff") }, nil, 1.6)
            play_sound('negative', 0.8 + math.random() * 0.08)
          end
          if right and right.getting_sliced then
            right:start_dissolve({ HEX("7869ff") }, nil, 1.6)
            play_sound('negative', 0.8 + math.random() * 0.08)
          end
          if destroyed_count > 0 then
            SMODS.calculate_effect({ message = localize("k_abn_merged") }, card)
          end
          return true
        end
      }))
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Evilclownmusic"
  },
}
