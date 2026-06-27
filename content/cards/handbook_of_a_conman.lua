SMODS.Joker {
  key = 'handbook_of_a_conman',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 3, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  pools = { ["Plagued"] = true, },

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  update = function(self, card)
    if card.area == G.jokers and not card.debuffed then
      for _, j in ipairs(G.jokers.cards) do
        if j ~= card then
          local is_plagued = j.config.center.pools and j.config.center.pools.Plagued

          if not is_plagued then
            j:set_debuff(true)
          end
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.modify_hand and not card.debuffed then
      -- Double the global hand values
      mult = mod_mult(mult * 2)
      hand_chips = mod_chips(hand_chips * 2)

      update_hand_text({ sound = 'chips1', modded = true }, { chips = hand_chips, mult = mult })
    end
  end,

  abn_artist_credits = {
    artist = "Inky and Vega",
  },
}
