local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set == 'paradox' then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn_last_paradox = card.config.center.key
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
  key = 'lucky_mult',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 9, y = 2 },
  soul_pos = { x = 0, y = 3 },
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
    local last_key = G.GAME and G.GAME.abn_last_paradox
    local paradox_center = last_key and G.P_CENTERS[last_key] or nil

    if paradox_center then
      info_queue[#info_queue + 1] = paradox_center
    end

    local last_paradox_name = paradox_center and localize({ type = 'name_text', key = paradox_center.key, set = paradox_center.set }) or localize('k_none')

    return {
      vars = {
        card.ability.extra.asc_gain,
        card.ability.extra.score_gain,
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        last_paradox_name
      },
    }
  end,

  in_pool = function(self, args)
    local has_lucky = false
    local has_mult = false

    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.config.center == G.P_CENTERS.m_lucky then
          has_lucky = true
        elseif c.config.center == G.P_CENTERS.m_mult then
          has_mult = true
        end
        if has_lucky and has_mult then break end
      end
    end

    return has_lucky and has_mult
  end,

  calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind.name == 'Big Blind' and not context.blueprint then
      if G.GAME.abn_last_paradox and #G.consumeables.cards < G.consumeables.config.card_limit then
        G.E_MANAGER:add_event(Event({
          func = function()
            local paradox_card = create_card('paradox', G.consumeables, nil, nil, nil, nil, G.GAME.abn_last_paradox)
            paradox_card:add_to_deck()
            G.consumeables:emplace(paradox_card)
            return true
          end
        }))
        return {
          message = "+1 Paradox",
          colour = G.C.SECONDARY_SET.paradox,
        }
      end
    end

    if context.before and context.full_hand then
      local has_lucky = false
      local has_mult = false

      for _, sc in ipairs(context.full_hand) do
        if sc.config.center == G.P_CENTERS.m_lucky then
          has_lucky = true
        elseif sc.config.center == G.P_CENTERS.m_mult then
          has_mult = true
        end
      end

      if has_lucky and has_mult then
        for _, sc in ipairs(context.full_hand) do
          if sc.config.center == G.P_CENTERS.m_lucky or sc.config.center == G.P_CENTERS.m_mult then
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
        -- LuckySticker
        if target.ability.abn_stk_lucky or target.config.center == G.P_CENTERS.m_lucky then
          target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end

        -- MultSticker
        if target.ability.abn_stk_mult or target.config.center == G.P_CENTERS.m_mult then
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
    artist = "J8-Bit",
  },
}