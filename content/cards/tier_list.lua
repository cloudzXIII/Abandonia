local add_to_deckref = Card.add_to_deck

function Card.add_to_deck(self, from_debuff)
  if not self.added_to_deck then
    if not from_debuff then
      -- Tracking seals
      if self.seal then
        G.GAME.purchased_seals = G.GAME.purchased_seals or {}
        local seal_key = self.seal
        local already_added = false
        for _, stored_key in ipairs(G.GAME.purchased_seals) do
          if stored_key == seal_key then
            already_added = true
            break
          end
        end
        if not already_added then
          table.insert(G.GAME.purchased_seals, seal_key)
        end
      end

      -- Tracking editions
      if self.edition and self.edition.type then
        G.GAME.purchased_editions = G.GAME.purchased_editions or {}
        local edition_key = self.edition.type
        local already_added = false
        for _, stored_key in ipairs(G.GAME.purchased_editions) do
          if stored_key == edition_key then
            already_added = true
            break
          end
        end
        if not already_added then
          table.insert(G.GAME.purchased_editions, edition_key)
        end
      end

      -- Tracking enhancements
      if self.config and self.config.center and self.config.center.set == "Enhanced" then
        G.GAME.purchased_enhancements = G.GAME.purchased_enhancements or {}
        local enh_key = self.config.center.key or "UnknownEnhancement"
        G.GAME.last_enhancement = enh_key
        local already_added = false
        for _, stored_key in ipairs(G.GAME.purchased_enhancements) do
          if stored_key == enh_key then
            already_added = true
            break
          end
        end
        if not already_added then
          table.insert(G.GAME.purchased_enhancements, enh_key)
          --print("Added Enhancement:", enh_key, "| Total:", #G.GAME.purchased_enhancements)
        end
      end

      -- Tracking jokers
      if self.ability and self.ability.set == "Joker" then
        G.GAME.purchased_jokers = G.GAME.purchased_jokers or {}
        local key = self.config.center.key
        if self.config.center.key ~= 'j_fn_NPC' then
          G.GAME.last_joker = key
          G.GAME.last_joker_rarity = self.config.center.rarity
        end
        local already_added = false
        for _, stored_key in ipairs(G.GAME.purchased_jokers) do
          if stored_key == key then
            already_added = true
            break
          end
        end
        if not already_added then
          table.insert(G.GAME.purchased_jokers, key)
        end
      end
    end
  end

  return add_to_deckref(self, from_debuff)
end

SMODS.Joker {
  key = 'tier_list',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 0, y = 3 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 0,
      mult = 0,
      xmult = 1,
      xchips = 1,
      repetitions = 0,
      chipsadd = 10,
      multadd = 4,
      xmultadd = 0.3,
      xchipsadd = 0.3,
      repetitionsadd = 1,
      rarity = 0, -- rarity of last joker
      last_joker = "none",
    },
  },

  loc_vars = function(self, info_queue, card)
    -- Map rarities to their localized strings and colors
    local raritys = {
      [0] = "None",
      [1] = "Common",
      [2] = "Uncommon",
      [3] = "Rare",
      [4] = "Legendary",
      ['abn_SuperRare'] = "Super Rare",
      ['abn_ParallelRare'] = "Parallel Rare",
    }

    local raritys = raritys[card.ability.extra.rarity or 0]


    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        card.ability.extra.repetitions,
        card.ability.extra.chipsadd,
        card.ability.extra.multadd,
        card.ability.extra.xmultadd,
        card.ability.extra.xchipsadd,
        card.ability.extra.repetitionsadd,

        raritys
      }
    }
  end,

  update = function(self, card)
    -- Only run during a game run
    if G.STAGE ~= G.STAGES.RUN then return end

    if card.area == G.jokers then
      if G.GAME.last_joker and G.GAME.last_joker ~= card.ability.extra.last_joker then
        card.ability.extra.last_joker = G.GAME.last_joker
        card.ability.extra.rarity = G.GAME.last_joker_rarity
        if card.ability.extra.rarity == 1 then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.BLUE,
            card = card
          }
        elseif card.ability.extra.rarity == 2 then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.RED,
            card = card
          }
        elseif card.ability.extra.rarity == 3 then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.RED,
            card = card
          }
        elseif card.ability.extra.rarity == 'abn_SuperRare' then
          card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.BLUE,
            card = card
          }
        elseif card.ability.extra.rarity == 'abn_ParallelRare' then
          card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.repetitionsadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.BLUE,
            card = card
          }
        elseif card.ability.extra.rarity == 4 then
          card.ability.extra.chips = card.ability.extra.chips * 2
          card.ability.extra.mult = card.ability.extra.mult * 2
          card.ability.extra.xmult = card.ability.extra.xmult * 2
          card.ability.extra.xchips = card.ability.extra.xchips * 2
          card.ability.extra.repetitions = card.ability.extra.repetitions * 2
          card.ability.extra.chipsadd = card.ability.extra.chipsadd * 2
          card.ability.extra.multadd = card.ability.extra.multadd * 2
          card.ability.extra.xmultadd = card.ability.extra.xmultadd * 2
          card.ability.extra.xchipsadd = card.ability.extra.xchipsadd * 2
          card.ability.extra.repetitionsadd = card.ability.extra.repetitionsadd * 2
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.Mult,
            card = card
          }
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips,
        card = card
      }
    end

    -- Joker retrigger (only once, never self)
    if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and context.other_card.config and context.other_card.config.center and context.other_card.config.center.key and context.other_card.config.center.key == 'j_abn_tier_list' then
      G.GAME.pool_flags.clam = true
      return {
        repetitions = card.ability.extra.repetitions,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
