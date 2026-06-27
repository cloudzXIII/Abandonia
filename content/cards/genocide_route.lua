SMODS.Joker {
  key = 'genocide_route',

  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 8, y = 6 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult = 1,
      x_chips = 1,
      x_mult_gain = 0.2,
      x_chips_gain = 0.3,
      progression = 1,
    }
  },

  loc_vars = function(self, info_queue, card)
    local current_stage = card.ability.extra.progression

    local rarity_names = { 'Common', 'Uncommon', 'Rare', 'abn_SuperRare' }
    local edition_names = { 'Foil', 'Holographic', 'Polychrome', 'Negative' }

    local next_rarity = rarity_names[current_stage] or "Loop Reset"
    local next_edition = edition_names[current_stage] or "Loop Reset"

    return {
      vars = {
        card.ability.extra.x_mult,                  -- #1#
        card.ability.extra.x_chips,                 -- #2#
        card.ability.extra.x_mult_gain,             -- #3#
        card.ability.extra.x_chips_gain,            -- #4#
        SMODS.Rarity:get_rarity_badge(next_rarity), -- #5#
        next_edition,                               -- #6#
        colours = { G.C.RARITY[next_rarity] or G.C.ATTENTION }
      }
    }
  end,

  abn_purge_and_scale = function(self, card)
    local destroyed_count = 0
    local targets = {}
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] ~= card then
        targets[#targets + 1] = G.jokers.cards[i]
      end
    end

    if #targets > 0 then
      destroyed_count = #targets
      card.ability.extra.x_mult = card.ability.extra.x_mult + (destroyed_count * card.ability.extra.x_mult_gain)
      card.ability.extra.x_chips = card.ability.extra.x_chips + (destroyed_count * card.ability.extra.x_chips_gain)

      G.E_MANAGER:add_event(Event({
        func = function()
          for _, target in ipairs(targets) do
            target:start_dissolve()
          end
          card:juice_up(0.8, 0.8)
          play_sound('slice1', 0.9, 1.2)
          return true
        end
      }))
    end
  end,

  add_to_deck = function(self, card, from_debuff)
    if not from_debuff then
      self:abn_purge_and_scale(card)
    end
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        x_chips = card.ability.extra.x_chips,
        card = card
      }
    end

    if context.setting_blind and not context.blueprint then
      -- LOOP RESET BRANCH: If flipped, destroy everything, scale up, reset progress, unflip, and STOP.
      if card.facing == 'back' then
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          func = function()
            play_sound('tarot2', 1.2, 1.4)
            card.ability.extra.progression = 1 -- Reset progression cycle to stage 1

            -- Purely purges and scales up from existing Jokers without creating anything new
            card.ability.abn_perma_flipped = false
            card:flip() -- Flip back to the front face
            self:abn_purge_and_scale(card)
            return true
          end
        }))

        -- NORMAL PROGRESSION BRANCH: Only runs if the card was already face-up at the start of the selection phase
      elseif card.facing == 'front' then
        local current_stage = card.ability.extra.progression

        local rarities = { 'Common', 'Uncommon', 'Rare', 'abn_SuperRare' }
        local editions = {
          { foil = true },
          { holo = true },
          { polychrome = true },
          { negative = true }
        }

        if current_stage >= 1 and current_stage <= 4 then
          if #G.jokers.cards < G.jokers.config.card_limit or editions[current_stage].negative then
            G.E_MANAGER:add_event(Event({
              trigger = 'before',
              func = function()
                local new_joker = SMODS.create_card({
                  set = 'Joker',
                  area = G.jokers,
                  rarity = rarities[current_stage],
                  discover = true
                })

                new_joker:set_edition(editions[current_stage], true)
                G.jokers:emplace(new_joker)
                card:juice_up(0.5, 0.5)
                return true
              end
            }))

            card.ability.extra.progression = current_stage + 1

            -- When reaching the end of the line, flip face-down as the warning flag
            if card.ability.extra.progression > 4 then
              G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                  if card.facing == 'front' then
                    card:flip()
                  end
                  card.ability.abn_perma_flipped = true
                  play_sound('tarot2', 0.6, 0.8)
                  return true
                end
              }))
            end
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
