SMODS.Joker {
  key = 'computerworm_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 2, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { emult = 1, echips = 1, emultadd = 1, echipsadd = 1, bad_emult = -1, bad_echips = -1 } },
  pools = { ["Plagued"] = true },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.emult,
        card.ability.extra.echips,
        card.ability.extra.emultadd,
        card.ability.extra.echipsadd,
        card.ability.extra.bad_emult,
        card.ability.extra.bad_echips,
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  set_ability = function(self, card, initial)
    card:set_eternal(true)
  end,

  update = function(self, card)
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then return end

    local count = 0
    for i = 1, #G.jokers.cards do
      local j = G.jokers.cards[i]
      if j.config.center and j.config.center.key == 'j_abn_computerworm_joker' then
        count = count + 1
      end
    end

    if count >= 3 and G.STATE ~= G.STATES.GAME_OVER and G.STATE ~= G.STATES.BLIND_SELECT and not card.game_over_triggered then
      card.game_over_triggered = true
      G.E_MANAGER:add_event(Event({
        func = function()
          G.STATE = G.STATES.GAME_OVER
          if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
            G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
          end
          G:save_settings()
          G.FILE_HANDLER.force = true
          G.STATE_COMPLETE = false
          return true
        end
      }))
    end

    card.ability.extra.emult = count * card.ability.extra.emultadd
    card.ability.extra.echips = count * card.ability.extra.echipsadd
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local leftmost_joker = G.jokers.cards[1]

      if leftmost_joker and not leftmost_joker.getting_sliced and not SMODS.is_eternal(leftmost_joker) then
        leftmost_joker.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        G.E_MANAGER:add_event(Event({
          func = function()
            G.GAME.joker_buffer = 0
            card:juice_up(0.8, 0.8)
            leftmost_joker:start_dissolve({ HEX("57ecab") }, nil, 1.6)
            play_sound('slice1', 0.96 + math.random() * 0.08)
            return true
          end
        }))

        local j = SMODS.copy_card(card)
		if j then
        	j:set_edition({ negative = true }, true)
			j:set_eternal(false)
		end
      end
    end

    if context.joker_main then
      local mayhem_chance = 0
      if (G.GAME.abn_max_mayhem or 0) > 0 then
        mayhem_chance = math.min((G.GAME.abn_mayhem or 0) / G.GAME.abn_max_mayhem, 1)
      end

      if pseudorandom('computerworm_mayhem') < mayhem_chance then
        if pseudorandom('computerworm_mayhem_bad') < mayhem_chance then
          return {
            emult = card.ability.extra.bad_emult,
            echips = card.ability.extra.bad_echips,
          }
        end
        return {
          message = localize('k_nope_ex'),
          colour = G.C.RED,
        }
      end

      return {
        emult = card.ability.extra.emult,
        echips = card.ability.extra.echips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Inky",
  },
}