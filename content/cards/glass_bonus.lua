local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set == 'crepuscular' then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn_last_crepuscular = card.config.center.key
            return true
          end
        }))
        return true
      end
    }))
  end
  return ret
end

SMODS.Joker {
  key = 'glass_bonus',
  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 6, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      asc_gain = 0.02,
      score_gain = 100,
      xmult = 0.25,
      xchips = 0.25
    }
  },

  loc_vars = function(self, info_queue, card)
    local last_key = G.GAME and G.GAME.abn_last_crepuscular
    local crepuscular_center = last_key and G.P_CENTERS[last_key] or nil

    if crepuscular_center then
      info_queue[#info_queue + 1] = crepuscular_center
    end

    local last_crepuscular_name = crepuscular_center and localize({ type = 'name_text', key = crepuscular_center.key, set = crepuscular_center.set }) or localize('k_none')

    return {
      vars = {
        card.ability.extra.asc_gain,
        card.ability.extra.score_gain,
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        last_crepuscular_name
      },
    }
  end,

  in_pool = function(self, args)
    local has_glass = false
    local has_bonus = false

    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.config.center == G.P_CENTERS.m_glass then
          has_glass = true
        elseif c.config.center == G.P_CENTERS.m_bonus then
          has_bonus = true
        end
        if has_glass and has_bonus then break end
      end
    end

    return has_glass and has_bonus
  end,

  calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind.name == 'Big Blind' and not context.blueprint then
      if G.GAME.abn_last_crepuscular and #G.consumeables.cards < G.consumeables.config.card_limit then
        G.E_MANAGER:add_event(Event({
          func = function()
            local crepuscular_card = create_card('crepuscular', G.consumeables, nil, nil, nil, nil, G.GAME.abn_last_crepuscular)
            crepuscular_card:add_to_deck()
            G.consumeables:emplace(crepuscular_card)
            return true
          end
        }))
        return {
          message = "+1 Crepuscular",
          colour = G.C.SECONDARY_SET.crepuscular or G.C.DARK_EDITION,
        }
      end
    end

    if context.before and context.full_hand then
      local has_glass = false
      local has_bonus = false

      for _, sc in ipairs(context.full_hand) do
        if sc.config.center == G.P_CENTERS.m_glass then
          has_glass = true
        elseif sc.config.center == G.P_CENTERS.m_bonus then
          has_bonus = true
        end
      end

      if has_glass and has_bonus then
        for _, sc in ipairs(context.full_hand) do
          if sc.config.center == G.P_CENTERS.m_glass or sc.config.center == G.P_CENTERS.m_bonus then
            sc.ability.slib_perma_plus_asc = (sc.ability.slib_perma_plus_asc or 0) + card.ability.extra.asc_gain
            sc.ability.perma_score = (sc.ability.perma_score or 0) + card.ability.extra.score_gain
            
            card_eval_status_text(sc, 'extra', nil, nil, nil, {
              message = localize('k_upgrade_ex'),
              colour = G.C.ATTENTION
            })
          end
        end
      end
    end

    if context.post_trigger and context.other_card then
      local target = context.other_card

      if target ~= card and target.ability then
        -- Glass Sticker
        if target.ability.abn_stk_glass or target.config.center == G.P_CENTERS.m_glass then
          target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end

        -- Bonus Sticker
        if target.ability.abn_stk_bonus or target.config.center == G.P_CENTERS.m_bonus then
          target.ability.abn_perma_xchips = (target.ability.abn_perma_xchips or 1) + card.ability.extra.xchips
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Shai",
  },
}