local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set == 'program_pack' then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn_last_program = card.config.center.key
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
  key = 'mult_glass',
  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 3, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      asc_gain = 0.02,
      score_gain = 100,
      xchips_mult = 0.25,
      xchips_glass = 0.35
    }
  },

  loc_vars = function(self, info_queue, card)
    local last_key = G.GAME and G.GAME.abn_last_program
    local program_center = last_key and G.P_CENTERS[last_key] or nil

    if program_center then
      info_queue[#info_queue + 1] = program_center
    end

    local last_program_name = program_center and localize({ type = 'name_text', key = program_center.key, set = program_center.set }) or localize('k_none')

    return {
      vars = {
        card.ability.extra.asc_gain,
        card.ability.extra.score_gain,
        card.ability.extra.xchips_mult,
        card.ability.extra.xchips_glass,
        last_program_name
      },
    }
  end,

  in_pool = function(self, args)
    local has_mult = false
    local has_glass = false

    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.config.center == G.P_CENTERS.m_mult then
          has_mult = true
        elseif c.config.center == G.P_CENTERS.m_glass then
          has_glass = true
        end
        if has_mult and has_glass then break end
      end
    end

    return has_mult and has_glass
  end,

  calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind.name == 'Big Blind' and not context.blueprint then
      if G.GAME.abn_last_program and #G.consumeables.cards < G.consumeables.config.card_limit then
        G.E_MANAGER:add_event(Event({
          func = function()
            local program_card = create_card('program_pack', G.consumeables, nil, nil, nil, nil, G.GAME.abn_last_program)
            program_card:add_to_deck()
            G.consumeables:emplace(program_card)
            return true
          end
        }))
        return {
          message = "+1 Program",
          colour = G.C.SECONDARY_SET.program_pack,
        }
      end
    end

    if context.before and context.full_hand then
      local has_mult = false
      local has_glass = false

      for _, sc in ipairs(context.full_hand) do
        if sc.config.center == G.P_CENTERS.m_mult then
          has_mult = true
        elseif sc.config.center == G.P_CENTERS.m_glass then
          has_glass = true
        end
      end

      if has_mult and has_glass then
        for _, sc in ipairs(context.full_hand) do
          if sc.config.center == G.P_CENTERS.m_mult or sc.config.center == G.P_CENTERS.m_glass then
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
        -- Mult Sticker
        if target.ability.abn_stk_mult or target.config.center == G.P_CENTERS.m_mult then
          target.ability.abn_perma_xchips = (target.ability.abn_perma_xchips or 1) + card.ability.extra.xchips_mult
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
          }
        end

        -- Glass Sticker
        if target.ability.abn_stk_glass or target.config.center == G.P_CENTERS.m_glass then
          target.ability.abn_perma_xchips = (target.ability.abn_perma_xchips or 1) + card.ability.extra.xchips_glass
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "GeorgetheRat",
  },
}