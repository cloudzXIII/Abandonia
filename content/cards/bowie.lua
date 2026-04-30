SMODS.Joker {
  key = 'bowie',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 1 },
  soul_pos = { x = 3, y = 1 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { xmult = 2 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    -- Ensure the card has an edition
    if context.other_joker and context.other_joker ~= card and context.other_joker.edition and context.other_joker.edition.type then
      return {
        xmult = card.ability.extra.xmult, -- Apply multiplier to the current card
        card = card
      }
    end

    return nil -- No multiplier if no edition
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
