SMODS.Consumable {
  key = 'flipside',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 0 },
  config = { max_highlighted = 3, },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    for _, v in ipairs(G.hand.highlighted) do
      v:flip()
      v.ability.abn_perma_flipped = true
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "lolhappy909_lol"
  },
}

SMODS.Consumable {
  key = 'abyss',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 1, y = 0 },
  config = { max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    return { vars = { card.ability.max_highlighted, localize({ type = 'name_text', key = "e_abn_chthonian", set = "Edition" }) } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local aura_card = G.hand.highlighted[1]
        aura_card:set_edition("e_abn_chthonian", true)
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0 and
        (not G.hand.highlighted[1].edition)
  end,
  abn_artist_credits = {
    artist = "L'"
  },
}

SMODS.Consumable {
  key = 'body',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 0 },
  soul_pos = { x = 6, y = 0 },
  hidden = true,
  soul_set = 'Tarot',
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        SMODS.add_card({ set = 'Joker', rarity = "abn_SuperRare" })
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    delay(0.6)
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,
  abn_artist_credits = {
    artist = "ricottakitten"
  },
}


SMODS.Consumable {
  key = 'mind',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 0 },
  soul_pos = { x = 7, y = 0 },
  hidden = true,
  soul_set = 'Tarot',
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        SMODS.add_card({ set = 'Joker', rarity = "abn_ParallelRare" })
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    delay(0.6)
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,
  abn_artist_credits = {
    artist = "ricottakitten"
  },
}

local scu = set_consumeable_usage
function set_consumeable_usage(card)
  local ret = scu(card)
  if card.config.center.set == 'Spectral' and card.config.center.key ~= "c_soul" then
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.GAME.abn_last_spectral = card.config.center.key
            return true
          end
        }))
        return true
      end
    }))
  end
  return ret
end

SMODS.Consumable {
  key = 'deja_vecu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 1 },
  loc_vars = function(self, info_queue, card)
    local dejavecu_c = G.GAME.abn_last_spectral and G.P_CENTERS[G.GAME.abn_last_spectral] or nil
    local abn_last_spectral = dejavecu_c and
        localize { type = 'name_text', key = dejavecu_c.key, set = dejavecu_c.set } or
        localize('k_none')
    local colour = (not dejavecu_c or dejavecu_c.key == "c_abn_deja_vecu") and G.C.RED or G.C.GREEN

    if dejavecu_c and dejavecu_c.key ~= "c_abn_deja_vecu" then
      info_queue[#info_queue + 1] = dejavecu_c
    end

    local main_end = {
      {
        n = G.UIT.C,
        config = { align = "bm", padding = 0.02 },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
            nodes = {
              { n = G.UIT.T, config = { text = ' ' .. abn_last_spectral .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
            }
          }
        }
      }
    }

    return { vars = { abn_last_spectral }, main_end = main_end }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        if G.consumeables.config.card_limit > #G.consumeables.cards then
          play_sound('timpani')
          SMODS.add_card({ key = G.GAME.abn_last_spectral })
          card:juice_up(0.3, 0.5)
        end
        return true
      end
    }))
    delay(0.6)
  end,
  can_use = function(self, card)
    return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and
        G.GAME.abn_last_spectral and
        G.GAME.abn_last_spectral ~= 'c_abn_deja_vecu'
  end,
  abn_artist_credits = {
    artist = "Vega"
  },
}

SMODS.Consumable {
  key = 'presque_vu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 1 },
  config = { extra = {}, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local presque_vu_card = G.hand.highlighted[1]
        presque_vu_card:set_edition("e_negative", true)
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}

SMODS.Consumable {
  key = 'chance',
  set = 'Spectral',
  atlas = "AbandoniaChance",
  pos = { x = 0, y = 0 },
  config = { extra = { odds = 16, e_conv = "e_negative" } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS["e_negative"]
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return {
      vars = {
        numerator, denominator,
      }
    }
  end,
  can_use = function(self, card)
    return G.jokers and G.jokers.cards and #G.jokers.cards >= 1
  end,
  use = function(self, card, area, copier)
    if SMODS.pseudorandom_probability(card, "c_abn_chance", 1, card.ability.extra.odds) then
      for i = 1, #G.jokers.cards do
        local current = G.jokers.cards[i]
        current:set_edition(card.ability.extra.e_conv)
      end
    else
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          attention_text({
            text = localize('k_nope_ex'),
            scale = 1.3,
            hold = 1.4,
            major = card,
            backdrop_colour = G.C.SECONDARY_SET.Tarot,
            align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                'tm' or 'cm',
            offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
            silent = true
          })
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.06 * G.SETTINGS.GAMESPEED,
            blockable = false,
            blocking = false,
            func = function()
              play_sound('tarot2', 0.76, 0.4)
              return true
            end
          }))
          play_sound('tarot2', 1, 0.4)
          card:juice_up(0.3, 0.5)
          return true
        end
      }))
    end
  end,

  abn_artist_credits = {
    artist = "Shepcicle"
  },
}

SMODS.Consumable {
  key = 'distortion',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local eligible_card = pseudorandom_element(editionless_jokers, 'vremade_hex')
        eligible_card:set_edition("e_abn_pearlescent")

        local _first_dissolve = nil
        for _, joker in ipairs(G.jokers.cards) do
          if joker ~= eligible_card and not SMODS.is_eternal(joker, card) then
            joker:start_dissolve(nil, _first_dissolve)
            _first_dissolve = true
          end
        end

        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  can_use = function(self, card)
    return next(SMODS.Edition:get_edition_cards(G.jokers, true))
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}

SMODS.Consumable {
  key = 'super_id',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 1 },
  config = { extra = {}, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return { vars = { card.ability.max_highlighted } }
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.highlighted == card.ability.max_highlighted and (not G.hand.highlighted[1].edition)
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local choices = { 'abn_gloss', 'abn_iridescent', 'abn_pearlescent' }

        local chosen_edition = pseudorandom_element(choices, 'abn_ascend')

        local ascend_card = G.hand.highlighted[1]

        ascend_card:set_edition({ [chosen_edition] = true }, true)

        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'whitehole',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 5, y = 2 },
  hidden = true,
  soul_set = 'Planet',

  use = function(self, card, area, copier)
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
      { handname = "All Ranks", chips = '...', mult = '...', level = '' })
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = true
        return true
      end
    }))
    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.9,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))
    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.9,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = nil
        return true
      end
    }))
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
    delay(1.3)
    for rank, _ in pairs(SMODS.Ranks) do
      if G.GAME.abn_rank_upgrades[rank] then
        ABN.level_up_rank(card, rank, 1, true)
      end
    end
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
      { mult = 0, chips = 0, handname = '', level = '' })
  end,
  can_use = function(self, card)
    return true
  end,
  abn_artist_credits = {
    artist = "shepcicle"
  },
}

SMODS.Consumable {
  key = "ultra_ego",
  set = "Spectral",
  config = { extra = { tags = 1 } },
  pos = { x = 3, y = 2 },
  atlas = "AbandoniaSpectrals",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_ultra_ego_info", set = "Other", vars = { G.GAME.abn_ultra_egos_used or 0 } }
    return { vars = {} }
  end,
  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0 and
        (G.GAME.abn_ultra_egos_used or 0) < 4
  end,
  in_pool = function(self, args)
    return (G.GAME.abn_ultra_egos_used or 0) < 4
  end,
  use = function(self, card, area, copier)
    local used_tarot = copier or card

    SMODS.change_booster_limit(1)
    G.GAME.abn_ultra_egos_used = (G.GAME.abn_ultra_egos_used or 0) + 1

    for _, joker in ipairs(G.jokers.cards) do
      if not joker.ability.abn_perma_flipped then
        if joker.facing == 'front' then
          joker:flip()
        end
        joker.ability.abn_perma_flipped = true
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        used_tarot:juice_up(0.3, 0.5)

        for i = 1, #G.playing_cards do
          local v = G.playing_cards[i]

          v:juice_up(0.3, 0.3)

          if not v.ability.abn_perma_flipped then
            if v.facing == 'front' then
              v:flip()
            end
            v.ability.abn_perma_flipped = true
          end
        end

        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}

SMODS.Consumable {
  key = "brand",
  set = "Spectral",
  config = { extra = {} },
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaSpectrals",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return { vars = {} }
  end,
  can_use = function(self, card)
    return G.jokers and ABN.count_stickers() > 0
  end,
  use = function(self, card)
    for key, _ in pairs(SMODS.Sticker.obj_table) do
      for _, joker in pairs(G.jokers.cards) do
        if joker.ability and joker.ability[key] then
          SMODS.destroy_cards(joker, { bypass_eternal = true })
        end
      end
    end
    for i = 1, 2 do
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound('timpani')
          SMODS.add_card({ set = 'Tarot', key_append = "abn_brand", edition = "e_negative" })
          card:juice_up(0.3, 0.5)
          return true
        end
      }))
    end
    for i = 1, 2 do
      local voucher_pool = get_current_pool('Voucher')
      local selected_voucher = pseudorandom_element(voucher_pool, 'abn_brand')
      local it = 1
      while selected_voucher == 'UNAVAILABLE' do
        it = it + 1
        selected_voucher = pseudorandom_element(voucher_pool, 'abn_brand' .. it)
      end
      local voucher_card = SMODS.create_card({ area = G.play, key = selected_voucher }) -- Ignore the previous code and just use a key for a prefined voucher
      local prev_state = G.STATE
      voucher_card:start_materialize()
      voucher_card.cost = 0

      G.play:emplace(voucher_card)

      if i > 1 then
        voucher_card.T.x = voucher_card.T.x + 2
      end

      voucher_card:redeem()

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.5,
        func = function()
          voucher_card:start_dissolve()
          return true
        end
      }))
    end
    delay(0.6)
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}

SMODS.Consumable {
  key = "deja_reve",
  set = "Spectral",
  config = { extra = { tags = 2 } },
  pos = { x = 1, y = 1 },
  atlas = "AbandoniaSpectrals",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.tags } }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area, copier)
    --Add the Tags
    for i = 1, card.ability.extra.tags do
      G.E_MANAGER:add_event(Event({
        func = function()
          local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
          add_tag(Tag(tag_key))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        end
      }))
    end

    --Double the Deck
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)

        local new_cards = {}
        local cards_to_copy = {}
        for _, v in ipairs(G.deck.cards) do
          table.insert(cards_to_copy, v)
        end

        for i, source_card in ipairs(cards_to_copy) do
          local _card = copy_card(source_card)

          _card:add_to_deck()
          table.insert(G.playing_cards, _card)

          G.deck:emplace(_card)

          _card:start_materialize(nil, i == 1)
          table.insert(new_cards, _card)
        end

        playing_card_joker_effects(new_cards)

        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Grass",
  },
}
