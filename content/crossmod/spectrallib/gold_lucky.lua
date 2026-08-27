local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set == 'continent' then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn_last_continent = card.config.center.key
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
  key = 'gold_lucky',
  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 0, y = 2 },
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
    local last_key = G.GAME and G.GAME.abn_last_continent
    local continent_center = last_key and G.P_CENTERS[last_key] or nil

    if continent_center then
      info_queue[#info_queue + 1] = continent_center
    end

    local last_continent_name = continent_center and localize({ type = 'name_text', key = continent_center.key, set = continent_center.set }) or localize('k_none')

    return {
      vars = {
        card.ability.extra.asc_gain,
        card.ability.extra.score_gain,
        card.ability.extra.xmult,
        card.ability.extra.xchips,
        last_continent_name
      },
    }
  end,

  in_pool = function(self, args)
    local has_gold = false
    local has_lucky = false

    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.config.center == G.P_CENTERS.m_gold then
          has_gold = true
        elseif c.config.center == G.P_CENTERS.m_lucky then
          has_lucky = true
        end
        if has_gold and has_lucky then break end
      end
    end

    return has_gold and has_lucky
  end,

  calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind.name == 'Big Blind' and not context.blueprint then
      if G.GAME.abn_last_continent and #G.consumeables.cards < G.consumeables.config.card_limit then
        G.E_MANAGER:add_event(Event({
          func = function()
            local continent_card = create_card('continent', G.consumeables, nil, nil, nil, nil, G.GAME.abn_last_continent)
            continent_card:add_to_deck()
            G.consumeables:emplace(continent_card)
            return true
          end
        }))
        return {
          message = "+1 Continent",
          colour = G.C.SECONDARY_SET.continent,
        }
      end
    end


    if context.before and context.full_hand then
      local has_gold = false
      local has_lucky = false

      for _, sc in ipairs(context.full_hand) do
        if sc.config.center == G.P_CENTERS.m_gold then
          has_gold = true
        elseif sc.config.center == G.P_CENTERS.m_lucky then
          has_lucky = true
        end
      end

      if has_gold and has_lucky then
        for _, sc in ipairs(context.full_hand) do
          if sc.config.center == G.P_CENTERS.m_gold or sc.config.center == G.P_CENTERS.m_lucky then
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
        -- Gold Sticker
        if target.ability.abn_stk_gold or target.config.center == G.P_CENTERS.m_gold then
          target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end

        -- Lucky Sticker
        if target.ability.abn_stk_lucky or target.config.center == G.P_CENTERS.m_lucky then
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
    artist = "Comykel",
  },
}