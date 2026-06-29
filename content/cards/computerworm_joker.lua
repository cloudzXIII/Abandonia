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
  config = { extra = { emult = 1, echips = 1, emultadd = 1, echipsadd = 1 } },
  pools = { ["Plagued"] = true },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.emult,
        card.ability.extra.echips,
        card.ability.extra.emultadd,
        card.ability.extra.echipsadd,
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
    -- Only run during a game run and after G.jokers is initialized
    if G.STAGE ~= G.STAGES.RUN or not G.jokers or not G.jokers.cards then return end

    -- Count worms
    local count = 0
    for i = 1, #G.jokers.cards do
      local j = G.jokers.cards[i]
      if j.config.center and j.config.center.key == 'j_abn_computerworm_joker' then
        count = count + 1
      end
    end

    card.ability.extra.emult = count * card.ability.extra.emultadd
    card.ability.extra.echips = count * card.ability.extra.echipsadd
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      -- identify the leftmost Joker
      local leftmost_joker = G.jokers.cards[1]

      if leftmost_joker and not leftmost_joker.getting_sliced and not SMODS.is_eternal(leftmost_joker, card) then
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

        -- create joker
        local j = SMODS.create_card({
          set = 'Joker',
          key = 'j_abn_computerworm_joker',
          area = G.jokers
        })

        j:set_edition({ negative = true }, true)
        j:set_eternal(nil)

        j:add_to_deck()
        G.jokers:emplace(j)
      end
    end

    if context.joker_main then
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
