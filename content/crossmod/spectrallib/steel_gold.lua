SMODS.Joker {
  key = 'steel_gold',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local last_used = G.GAME.abn.last_consumable_used and G.GAME.abn.last_consumable_used[cae.set]
    local consumable = last_used and G.P_CENTERS[last_used] or nil

    if consumable then
      info_queue[#info_queue + 1] = consumable
    end

    local last_used_name = consumable and
        localize({ type = 'name_text', key = consumable.key, set = consumable.set }) or localize('k_none')

    return {
      vars = {
        cae.asc_gain,
        cae.score_gain,
        cae.xmult,
        cae.xchips,
        last_used_name
      },
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 3, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      asc_gain = 0.02,
      score_gain = 100,
      xmult = 0.25,
      xchips = 0.25,
      set = "periodic"
    }
  },
  calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind.config.blind.key == "bl_big" and not context.blueprint and #G.consumeables.cards < G.consumeables.config.card_limit then
      if G.GAME.abn.last_consumable_used[card.ability.extra.set] then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = (function()
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.add_card {
                  set = card.ability.extra.set,
                  key = G.GAME.abn.last_consumable_used[card.ability.extra.set]
                }
                G.GAME.consumeable_buffer = 0
                return true
              end
            }))
            SMODS.calculate_effect(
              {
                message = localize('k_abn_plus_' .. card.ability.extra.set),
                colour = G.C.SECONDARY_SET
                    [card.ability.extra.set]
              },
              context.blueprint_card or card)
            return true
          end)
        }))
        return nil, true -- This is for Joker retrigger purposes
      end
    end


    if context.before then
      local has_gold = false
      local has_steel = false

      for _, playing_card in ipairs(context.full_hand) do
        if SMODS.has_enhancement(playing_card, "m_gold") then
          has_gold = true
        end
        if SMODS.has_enhancement(playing_card, "m_steel") then
          has_steel = true
        end
        if has_gold and has_steel then break end
      end

      if has_gold and has_steel then
        for _, playing_card in ipairs(context.full_hand) do
          if SMODS.has_enhancement(playing_card, "m_steel") or SMODS.has_enhancement(playing_card, "m_gold") then
            playing_card.ability.slib_perma_plus_asc = (playing_card.ability.slib_perma_plus_asc or 0) +
                card.ability.extra.asc_gain
            playing_card.ability.perma_score = (playing_card.ability.perma_score or 0) + card.ability.extra.score_gain

            SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, playing_card)
          end
        end
      end
    end

    if context.post_trigger and context.other_card then
      if context.other_card ~= card and context.other_card.ability then
        -- Steel Sticker
        if context.other_card.ability.abn_stk_steel or context.other_card.config.center == G.P_CENTERS.m_steel then
          context.other_card.ability.abn_perma_xmult = (context.other_card.ability.abn_perma_xmult or 1) +
              card.ability.extra.xmult
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end

        -- Gold Sticker
        if context.other_card.ability.abn_stk_gold or context.other_card.config.center == G.P_CENTERS.m_gold then
          context.other_card.ability.abn_perma_xchips = (context.other_card.ability.abn_perma_xchips or 1) +
              card.ability.extra.xchips
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dottykitty",
  },

  in_pool = function(self, args)
    local has_gold = false
    local has_steel = false

    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, "m_gold") then
        has_gold = true
      end
      if SMODS.has_enhancement(playing_card, "m_steel") then
        has_steel = true
      end
      if has_gold and has_steel then break end
    end

    return has_gold and has_steel
  end,
}
