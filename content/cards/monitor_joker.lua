SMODS.Joker {
  key = 'monitor_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 0, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xchips = 1.5 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  add_to_deck = function(self, card)
    card.ability.triggered = 0
    SMODS.change_play_limit(1)
    SMODS.change_discard_limit(1)
  end,

  remove_from_deck = function(self, card)
    SMODS.change_play_limit(-1)
    SMODS.change_discard_limit(-1)
  end,

  calculate = function(self, card, context)
    -- Check before the cards score
    if context.before and not context.blueprint and #context.full_hand >= 6 and (card.ability.triggered or 0) == 0 then
      local has_monitor = false

      -- Scan context.full_hand to find if any of them are the monitor card
      for _, played_card in ipairs(context.full_hand) do
        if played_card.config.center == G.P_CENTERS.m_abn_monitor then
          has_monitor = true
          break
        end
      end

      -- If the criteria matches, upgrade the rank levels of all unique played cards
      if has_monitor then
        card.ability.triggered = 1

        -- Use a tracking table so we don't double-level a rank if multiple of the same rank are in the hand
        local ranks_to_upgrade = {}
        for _, played_card in ipairs(context.full_hand) do
          if played_card.base and played_card.base.value then
            ranks_to_upgrade[played_card.base.value] = true
          end
        end

        -- Trigger the custom level up function for each unique rank found
        for rank_val, _ in pairs(ranks_to_upgrade) do
          if G.GAME.abn_rank_upgrades[rank_val] then
            ABN.level_up_rank(card, rank_val, 1)
          end
        end
      end
    end

    -- Scoring logic for individual cards
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card

      if target_card then
        return {
          xchips = card.ability.extra.xchips,
          card = card
        }
      end
    end

    -- Reset the trigger at the end of the round
    if context.end_of_round and not context.blueprint and not context.repetition then
      card.ability.triggered = 0
    end
  end,

  abn_artist_credits = {
    artist = "Ricottakitten",
  },
}
