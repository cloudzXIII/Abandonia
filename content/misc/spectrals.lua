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
  config = { immutable = {max_highlighted = 1} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    return { vars = { card.ability.immutable.max_highlighted, localize({ type = 'name_text', key = "e_abn_chthonian", set = "Edition" }) } }
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
    return G.hand and #G.hand.highlighted == card.ability.immutable.max_highlighted and not G.hand.highlighted[1].edition
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
  config = { immutable = {max_highlighted = 1} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_playing_card', set = 'Edition', config = { extra = 1 } }
    return { vars = { card.ability.immutable.max_highlighted } }
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.highlighted == card.ability.immutable.max_highlighted and (not G.hand.highlighted[1].edition)
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
    return ABN.count_jokers(function(joker) return not joker.edition or not joker.edition.negative end) > 0
  end,
  use = function(self, card, area, copier)
    if SMODS.pseudorandom_probability(card, "c_abn_chance", 1, card.ability.extra.odds) then
      ABN.all_jokers(function(current)
        current:set_edition(card.ability.extra.e_conv)
      end)
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
--[[
SMODS.Consumable { --This effect will be given to a different consumable
  key = 'super_id',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 1 },
  config = { immutable = {max_highlighted = 1} },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return { vars = { card.ability.immutable.max_highlighted } }
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.highlighted == card.ability.immutable.max_highlighted and (not G.hand.highlighted[1].edition)
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
--]]
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
  key = "brand",
  set = "Spectral",
  config = { extra = {} },
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaSpectrals",
  cost = 4,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
  end,
  can_use = function(self, card)
    return ABN.count_stickers() > 0
  end,
  use = function(self, card)
    ABN.all_jokers(function(joker)
      for key, _ in pairs(SMODS.Sticker.obj_table) do
        if joker.ability and joker.ability[key] then
          SMODS.destroy_cards(joker, { bypass_eternal = true })
          break
        end
      end
    end)
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
          SMODS.copy_card(source_card, {area = G.deck})
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

SMODS.Consumable {
  key = "eon2",
  set = "Spectral",
  config = { extra = { ante = 1 } },
  pos = { x = 7, y = 4 },
  atlas = "AbandoniaSpectrals",
  cost = 4,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_newestia_only", set = "Other" }
    return { vars = { card.ability.extra.ante } }
  end,

  can_use = function(self, card)
    return G.GAME.round_resets.ante > 1 and G.STATE ~= G.STATES.BLIND_SELECT and not G.GAME.blind.in_blind and
    not G.GAME.abn_newestia_permanent
  end,

  in_pool = function(self, args)
    return G.GAME.abn_newestia and not G.GAME.abn_newestia_permanent
  end,

  use = function(self, card, area, copier)
    G.GAME.abn_newestia_permanent = true
    G.FUNCS.abn_toggle_newestia()
    ease_ante(card.ability.extra.ante - G.GAME.round_resets.ante)
  end,

  abn_artist_credits = {
    artist = "Triangle Snack",
  },
}


SMODS.Consumable {
  key = "ram_10",
  set = 'Spectral',

  atlas = "abn_AbandoniaRam",
  pos = { x = 5, y = 1 },
  cost = 4,

  config = { extra = {} },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    return {
      vars = {
      }
    }
  end,

  can_use = function(self, card)
    local modded = 0
    for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
      if v ~= card and v.config.center.mod then
        modded = modded + 1
      end
    end
    return modded > 0
  end,

  use = function(self, card, area, copier)
    card:juice_up(0.3, 0.5)
    local modded = {}
    for _, v in ipairs(G.consumeables and G.consumeables.cards) do
      if v ~= card and v.config.center.mod then
        modded[#modded + 1] = v.config.center.key
      end
    end
    for _, v in ipairs(modded) do
      SMODS.add_card { key = v, edition = "e_negative" }
    end
    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}

SMODS.Consumable {
  key = "balatro_illustrious_ritual",
  set = "Spectral",
  config = { extra = { cards = 3 } },
  pos = { x = 2, y = 2 },
  atlas = "AbandoniaSpectrals",
  cost = 4,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_jimbo_newestia_only", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_megido_mayhem", set = "Other" }
    return { vars = { card.ability.extra.cards } }
  end,

  can_use = function(self, card)
    return #G.hand.cards > 0
  end,

  in_pool = function(self, args)
    return G.GAME.abn_newestia and G.GAME.modifiers.Honor
  end,

  use = function(self, card, area, copier)
    for _, c in ipairs(G.hand.cards) do
		c:start_dissolve()
	end
	for i = 1, card.ability.extra.cards do
		SMODS.add_card({set = "Base", area = G.hand, suit = "abn_megido"})
	end
  end,

  abn_artist_credits = {
    artist = "Tatsu",
  },
}

SMODS.Consumable {
  key = "raigeki",
  set = "Spectral",
  config = { extra = { cards = 3 } },
  pos = { x = 1, y = 2 },
  atlas = "AbandoniaSpectrals",
  cost = 4,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_jimbo_newestia_only", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_musica_mayhem", set = "Other" }
    return { vars = { card.ability.extra.cards } }
  end,

  can_use = function(self, card)
    return #G.hand.cards > 0
  end,

  in_pool = function(self, args)
    return G.GAME.abn_newestia and G.GAME.modifiers.Honor
  end,

  use = function(self, card, area, copier)
    for _, c in ipairs(G.hand.cards) do
		c:start_dissolve()
	end
	for i = 1, card.ability.extra.cards do
		SMODS.add_card({set = "Base", area = G.hand, suit = "abn_musica"})
	end
  end,

  abn_artist_credits = {
    artist = "Tatsu",
  },
}

SMODS.Consumable {
    key = 'promotion',
    set = 'Spectral',
    atlas = 'AbandoniaSpectrals',
    pos = { x = 1, y = 4 },
    config = { extra = { cards = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,

    can_use = function(self, card)
        if not (G.hand and G.hand.highlighted) then return false end
        local count = #G.hand.highlighted
        if count < 1 or count > card.ability.extra.cards then return false end

        local promotions = { Jack = 'abn_11', Queen = 'abn_12', King = 'abn_13', Ace = 'abn_14' }
        for _, playing_card in ipairs(G.hand.highlighted) do
            if SMODS.has_no_rank(playing_card) or not promotions[playing_card.base.value] then
                return false
            end
        end
        return true
    end,

    use = function(self, card, area, copier)
        local promotions = { Jack = 'abn_11', Queen = 'abn_12', King = 'abn_13', Ace = 'abn_14' }

        local targets = {}
        local new_ranks = {}
        for _, playing_card in ipairs(G.hand.highlighted) do
            table.insert(targets, playing_card)
            new_ranks[playing_card] = promotions[playing_card.base.value]
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i, target in ipairs(targets) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:flip()
                    play_sound('card1', 1.15 - (i - 1) / #targets * 0.3)
                    target:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for _, target in ipairs(targets) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    SMODS.change_base(target, nil, new_ranks[target])
                    return true
                end
            }))
        end

        for i, target in ipairs(targets) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:flip()
                    play_sound('tarot2', 0.85 + (i - 1) / #targets * 0.3, 0.6)
                    target:juice_up(0.3, 0.3)
                    return true
                end
            }))
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
		artist = "Okronix",
	},
}

--[[
For common effect of:
Selected Joker gains <Edition>, and a number
of random cards [in your full deck/held in hand] are
<effect>, equal to number of owned jokers

With optional:
If the Cut-Out mod is installed,
another random Joker gains <Cut-Out Edition>
--]]
local function joker_edition_at_cost_of_cards(self, card, edition, list, card_effect, card_condition, cutout_edition)
  local target_joker = ABN.highlighted_jokers()[1]
  local jokers_owned = ABN.count_jokers()

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.4,
    func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      target_joker:set_edition(edition, true)
      return true
    end
  }))

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.4,
    func = function()
      local candidates = {}
      for _, playing_card in ipairs(list) do
        if not card_condition or card_condition(playing_card) then candidates[#candidates + 1] = playing_card end
      end
      pseudoshuffle(candidates, pseudoseed(self.key.."_shuffle"))
      for i = 1, math.min(jokers_owned, #candidates) do
        card_effect(candidates[i])
        candidates[i]:juice_up(0.3, 0.3)
      end
      return true
    end
  }))

  -- Cutout Only
  if cutout_edition and SMODS.find_mod("cutout") then
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local candidates = {}
        ABN.all_jokers(function(joker)
          if joker ~= target_joker and not joker.edition then
            candidates[#candidates + 1] = joker
          end
        end)
        if #candidates > 0 then
          local chosen_joker = pseudorandom_element(candidates, pseudoseed(self.key.."_cutout"))
          chosen_joker:set_edition(cutout_edition, true)
        end
        return true
      end
    }))
  end

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.2,
    func = function()
      G.jokers:unhighlight_all()
      return true
    end
  }))
  delay(0.6)
end

SMODS.Consumable {
  key = 'swap',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 2 },
  cost = 4,
  config = {
    extra = { rank_increase = 2 },
  },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reversal
    if SMODS.find_mod("cutout") then
      info_queue[#info_queue + 1] = G.P_CENTERS.e_cutout_inverted
    end
    return { vars = { card.ability.extra.rank_increase } }
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_reversal", G.playing_cards,
      function(c) SMODS.modify_rank(c, card.ability.extra.rank_increase) end,
      function(c) return not SMODS.has_no_rank(c) end, "e_cutout_inverted"
    )
  end,

  abn_artist_credits = {
    artist = "Okronix",
  },
}

SMODS.Consumable {
  key = 'distortion',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 2 },
  config = {
    extra = { rank_decrease = 2 },
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    if SMODS.find_mod("cutout") then
      info_queue[#info_queue + 1] = G.P_CENTERS.e_cutout_distortion
    end
    return { vars = { card.ability.extra.rank_decrease } }
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_pearlescent", G.playing_cards,
      function(c) SMODS.modify_rank(c, -card.ability.extra.rank_decrease) end,
      function(c) return not SMODS.has_no_rank(c) end, "e_cutout_distortion"
    )
  end,

  abn_artist_credits = {
    artist = "Inky",
  },
}

SMODS.Consumable {
  key = 'ischemia',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 3 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_collodion
    if SMODS.find_mod("cutout") then
      info_queue[#info_queue + 1] = G.P_CENTERS.e_cutout_abstract
    end
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    local all_suits = {}
    for suit_key, _ in pairs(SMODS.Suits) do all_suits[#all_suits + 1] = suit_key end
    table.sort(all_suits)
    joker_edition_at_cost_of_cards(self, card, "e_abn_collodion", G.playing_cards,
      function(c)
        local new_suit = pseudorandom_element(all_suits, pseudoseed('c_abn_ischemia_suit'))
        SMODS.change_base(c, new_suit)
      end,
      function(c) return not SMODS.has_no_suit(c) end, "e_cutout_abstract"
    )
  end,

  abn_artist_credits = {
    artist = "Okronix",
  },
}

SMODS.Consumable {
  key = 'shattered',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 3, y = 3 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bit_rot
    if SMODS.find_mod("cutout") then
      info_queue[#info_queue + 1] = G.P_CENTERS.e_cutout_energy
    end
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_bit_rot", G.playing_cards,
      function(c) SMODS.destroy_cards(c) end, nil, "e_cutout_energy"
    )
  end,

  abn_artist_credits = {
    artist = "Okronix",
  },
}

SMODS.Consumable {
  key = 'dualism',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 3 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bright
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_opaque
  end,

  can_use = function(self, card)
    local l, r = ABN.get_leftmost_joker(), ABN.get_rightmost_joker()
	return l and r and l ~= r and not l.edition and not r.edition
  end,

  use = function(self, card, area, copier)
    local l, r = ABN.get_leftmost_joker(), ABN.get_rightmost_joker()
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        l:set_edition("e_abn_bright", true)
        r:set_edition("e_abn_opaque", true)
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "Grummy",
  },
}

SMODS.Consumable {
  key = 'spiral',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 7, y = 1 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_jimbo_only", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reel
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_reel", G.playing_cards,
      function(c) SMODS.debuff_card(c, true, self.key) end,
      function(c) return not c.debuff end
    )
  end,

  in_pool = function(self, args)
    return G.GAME.modifiers.Honor
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly",
  },
}

SMODS.Consumable {
  key = 'minus_id',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 4 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_glitter
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
  end,

  can_use = function(self, card)
    if not G.hand or not G.hand.cards or #G.hand.cards == 0 then return false end
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_glitter", G.hand.cards,
      function(c)
        if c.facing == 'front' then c:flip() end
        c.ability.abn_perma_flipped = true
      end,
      function(c) return not c.ability.abn_perma_flipped end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}

SMODS.Consumable {
  key = 'jamais_vu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 4, y = 1 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_ultraviolet
  end,

  can_use = function(self, card)
    if not G.hand or not G.hand.cards or #G.hand.cards == 0 then return false end
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_ultraviolet", G.hand.cards,
      function(c) SMODS.debuff_card(c, true, self.key) end,
      function(c) return not c.debuff end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}

SMODS.Consumable {
  key = 'entendu',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 2 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_rgb
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    local h_jokers = ABN.highlighted_jokers()
    local jokers = {}
    ABN.all_jokers(function(joker)
      if joker ~= h_jokers[1] and not joker.ability.abn_perma_flipped then
        table.insert(jokers, joker)
      end
    end)
    joker_edition_at_cost_of_cards(self, card, "e_abn_rgb", jokers,
      function(c)
        if c.facing == 'front' then c:flip() end
        c.ability.abn_perma_flipped = true
      end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}

SMODS.Consumable {
  key = 'paramenal',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 2, y = 1 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_fragmented
  end,

  can_use = function(self, card)
    if not G.hand or not G.hand.cards or #G.hand.cards == 0 then return false end
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_fragmented", G.hand.cards,
      function(c) SMODS.destroy_cards(c) end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}

SMODS.Consumable {
  key = 'sapience',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 3, y = 1 },
  cost = 4,
  config = {extra = {cost = -4}},
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
    return {vars = {card.ability.extra.cost}}
  end,

  can_use = function(self, card)
    if not G.hand or not G.hand.cards or #G.hand.cards == 0 then return false end
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_iridescent", G.hand.cards,
      function(c) c.ability.perma_p_dollars = (c.ability.perma_p_dollars or 0) + card.ability.extra.cost end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}

SMODS.Consumable {
  key = 'ultra_ego',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 3, y = 2 },
  cost = 4,
  config = {extra = {chip = 1}},
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
    return {vars = {card.ability.extra.chip}}
  end,

  can_use = function(self, card)
    if not G.hand or not G.hand.cards or #G.hand.cards == 0 then return false end
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    joker_edition_at_cost_of_cards(self, card, "e_abn_pearlescent", G.hand.cards,
      function(c) c.ability.perma_bonus = (c.ability.perma_bonus or 0) - c:get_chip_bonus() + card.ability.extra.chip end,
      function(c) return c:get_chip_bonus() ~= 1 end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}

SMODS.Consumable {
  key = 'substitute',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 3, y = 4 },
  cost = 4,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and h_jokers[1].edition and SMODS.Centers[h_jokers[1].edition.key].original_mod
  end,

  use = function(self, card, area, copier)
    local target_joker = ABN.highlighted_jokers()[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        target_joker:set_edition("e_abn_chromatic", true)
        return true
      end
    }))
    if target_joker.config.center.original_mod then
      local candidates = {}
      for _, c in ipairs(G.playing_cards) do
        if not c.edition then table.insert(candidates, c) end
      end
      local target_card = pseudorandom_element(candidates, self.key)
      if target_card then
		G.E_MANAGER:add_event(Event({
		  trigger = 'after',
		  delay = 0.4,
		  func = function()
		    target_card:set_edition("e_abn_chromatic", true)
		    return true
		  end
		}))
      end
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.jokers:unhighlight_all()
        return true
      end
    }))
    delay(0.6)
  end,

  abn_artist_credits = {
    artist = "Okronix",
  },
}

SMODS.Consumable {
  key = 'apotheosis',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 3 },
  cost = 4,
  hidden = true,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = { key = "abn_newestia_only", set = "Other" }
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and h_jokers[1].edition and h_jokers[1].edition.key == "e_negative" and not SMODS.is_eternal(h_jokers[1], card)
  end,

  use = function(self, card, area, copier)
    local target_joker = ABN.highlighted_jokers()[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        SMODS.destroy_cards(target_joker)
        return true
      end
    }))
	G.E_MANAGER:add_event(Event({
	  trigger = 'after',
	  delay = 0.4,
	  func = function()
	    ABN.all_jokers(function(joker)
          if joker ~= target_joker then
            if not joker.edition then
              local edi = SMODS.poll_object({
                type = "Edition",
                seed = self.key.."_edition",
                guaranteed = true,
                filter = function(pool)
                  for _, obj in ipairs(pool) do
                    if not G.P_CENTERS[obj.key] or not G.P_CENTERS[obj.key].original_mod then
                      obj.key = "UNAVAILABLE"
                    end
                  end
		  		  return pool
		  	    end
              })
              if edi then joker:set_edition(edi, true) end
            end
            local enh = SMODS.poll_object({
              pool = ABN.EnhStickerPool,
              seed = self.key.."_enhancement",
              filter = function(pool)
                for k, obj in ipairs(pool) do
                  if not ABN.EnhStickers[obj] or not ABN.EnhStickers[obj].abn_vanilla then
                    pool[k] = "UNAVAILABLE"
                  end
                end
			    return pool
		  	  end
            })
            if enh then joker:add_sticker(enh, true) end
          end
        end)
	    return true
	  end
	}))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.jokers:unhighlight_all()
        return true
      end
    }))
    delay(0.6)
  end,

  in_pool = function(self, args)
    if not G.GAME.abn_newestia then return end
    return ABN.all_jokers(function(joker)
      if joker.edition and joker.edition.key == "e_negative" then
        return true
      end
    end)
  end,

  abn_artist_credits = {
    artist = "Muddz",
  },
}

SMODS.Consumable {
  key = 'paradigm',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 7, y = 2 },
  cost = 4,
  hidden = true,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    info_queue[#info_queue + 1] = { key = "abn_newestia_only", set = "Other" }
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and h_jokers[1].edition and h_jokers[1].edition.key == "e_polychrome" and not SMODS.is_eternal(h_jokers[1], card)
  end,

  use = function(self, card, area, copier)
    local target_joker = ABN.highlighted_jokers()[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        SMODS.destroy_cards(target_joker)
        return true
      end
    }))
	G.E_MANAGER:add_event(Event({
	  trigger = 'after',
	  delay = 0.4,
	  func = function()
	    ABN.all_jokers(function(joker)
          if joker ~= target_joker then
            if not joker.edition then
              local edi = SMODS.poll_object({
                type = "Edition",
                seed = self.key.."_edition",
                guaranteed = true,
                filter = function(pool)
                  for _, obj in ipairs(pool) do
                    if not G.P_CENTERS[obj.key] or G.P_CENTERS[obj.key].original_mod then
                      obj.key = "UNAVAILABLE"
                    end
                  end
		  		  return pool
		  	    end
              })
              if edi then joker:set_edition(edi, true) end
            end
            local enh = SMODS.poll_object({
              pool = ABN.EnhStickerPool,
              seed = self.key.."_enhancement",
              filter = function(pool)
                for k, obj in ipairs(pool) do
                  if not ABN.EnhStickers[obj] or ABN.EnhStickers[obj].abn_vanilla then
                    pool[k] = "UNAVAILABLE"
                  end
                end
			    return pool
		  	  end
            })
            if enh then joker:add_sticker(enh, true) end
          end
        end)
	    return true
	  end
	}))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.jokers:unhighlight_all()
        return true
      end
    }))
    delay(0.6)
  end,

  in_pool = function(self, args)
    if not G.GAME.abn_newestia then return end
    return ABN.all_jokers(function(joker)
      if joker.edition and joker.edition.key == "e_polychrome" then
        return true
      end
    end)
  end,

  abn_artist_credits = {
    artist = "Muddz",
  },
}

SMODS.Consumable {
  key = 'super_id',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 6, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
  end,

  can_use = function(self, card)
    if not G.deck or not G.deck.cards or #G.deck.cards == 0 then return false end
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    local jcount = ABN.count_jokers()
    local top_cards = {}
    for i = #G.deck.cards, math.max(1, #G.deck.cards - jcount + 1), -1 do
      table.insert(top_cards, G.deck.cards[i])
    end
    joker_edition_at_cost_of_cards(self, card, "e_abn_gloss", top_cards,
      function(c)
        SMODS.destroy_cards(c, {immediate = true})
      end
    )
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat"
  },
}

SMODS.Consumable {
  key = 'pendulum',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 7, y = 3 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_thermal
  end,

  can_use = function(self, card)
    local h_jokers = ABN.highlighted_jokers()
    return #h_jokers == 1 and not h_jokers[1].edition
  end,

  use = function(self, card, area, copier)
    local target_joker = ABN.highlighted_jokers()[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        target_joker:set_edition("e_abn_thermal", true)
        G.GAME.win_ante = G.GAME.win_ante + ABN.count_jokers()
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.jokers:unhighlight_all()
        return true
      end
    }))
    delay(0.6)
  end,

  abn_artist_credits = {
    artist = "TriangleSnack"
  },
}
