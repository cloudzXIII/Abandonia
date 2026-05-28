local function faces_in_hand()
  local a = 0
  for k, v in pairs(G.hand.cards) do
    if v:is_face(true) then
      a = a + 1
    end
  end
  return a
end

SMODS.Consumable({
  key = "crown",
  set = "Tarot",
  hidden = true,
  soul_set = "Tarot",
  soul_rate = 0.025,
  config = { extra = {} },
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaTarots",
  cost = 4,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1 and not G.hand.highlighted[1]:is_face() and
        faces_in_hand() > 0
  end,
  use = function(self, card)
    local aeaeae, ccard = 0, G.hand.highlighted[1]
    for k, v in pairs(G.hand.cards) do
      if v ~= ccard and v:is_face() then
        aeaeae = aeaeae + v.base.nominal
        SMODS.destroy_cards(v)
      end
    end

    ccard.ability.perma_bonus = ccard.ability.perma_bonus or 0
    ccard.ability.perma_bonus = ccard.ability.perma_bonus + aeaeae
    card_eval_status_text(ccard, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
  end,
  abn_artist_credits = {
    artist = "b.b.b.b",
  },
})

SMODS.Consumable({
  key = "eon",
  set = "Tarot",
  hidden = true,
  soul_set = "Tarot",
  soul_rate = 0.025,
  config = { extra = { max = 2 } },
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaTarots",
  cost = 4,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'abn_immortal', set = 'Other' }
    return { vars = { card.ability.extra.max } }
  end,
  can_use = function(self, card)
    if G.jokers and #G.jokers.highlighted > 0 and #G.jokers.highlighted < (card.ability.extra.max + 1) then
      local no = false
      for k, v in pairs(G.jokers.highlighted) do
        if v.eternal_compat == false then
          no = true
        end
      end

      if not no then
        return true
      end
    end
    return false
  end,
  use = function(self, card)
    for k, v in pairs(G.jokers.highlighted) do
      v:add_sticker("abn_immortal", true)
      v:juice_up()
      G.jokers:unhighlight_all()
    end
  end,
  abn_artist_credits = {
    artist = "b.b.b.b",
  },
})

SMODS.Consumable {
  key = 'wheel_of_fate',
  set = 'Tarot',
  hidden = true,
  soul_set = "Tarot",
  soul_rate = 0.025,
  atlas = "AbandoniaTarots",
  pos = { x = 1, y = 0 },
  config = { extra = { odds = 6 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
      'abn_wheel_of_fate')
    return { vars = { numerator, denominator } }
  end,
  use = function(self, card, area, copier)
    if SMODS.pseudorandom_probability(card, 'abn_wheel_of_fate', 1, card.ability.extra.odds) then
      local eligible_card = pseudorandom_element(G.jokers.cards, 'abn_wheel_of_fate')
      local sticker = ABN.random_sticker(eligible_card, 'abn_wheel_of_fate')
      SMODS.Stickers[sticker]:apply(eligible_card, true)
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
  can_use = function(self, card)
    return true
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}

SMODS.Consumable {
  key = 'snowflake',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 3, y = 0 },
  config = { max_highlighted = 3, suit_conv = 'abn_Snow' },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
  end,
  abn_artist_credits = {
    artist = "camostar34",
  },
}

SMODS.Consumable {
  key = 'masquerade',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 4, y = 0 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_infra' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
  abn_artist_credits = {
    artist = "???",
  },
}


SMODS.Consumable {
  key = 'orbit',
  set = 'Tarot',
  pos = { x = 5, y = 0 },
  atlas = "AbandoniaTarots",
  config = { max_highlighted = 3, suit_conv = 'abn_Penumbra' },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
  end,
  abn_artist_credits = {
    artist = "SmoliconBoi",
  },
}

SMODS.Consumable {
  key = 'toxin',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 0, y = 1 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_hazard' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
}

SMODS.Consumable {
  key = 'anvil',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 1, y = 1 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_hot_iron' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
}

SMODS.Consumable {
  key = 'strike',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 2, y = 1 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_petroleum' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
}

SMODS.Consumable {
  key = 'merchant',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 3, y = 1 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_mercurial' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
}

SMODS.Consumable {
  key = 'shovel',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 4, y = 1 },
  config = { max_highlighted = 1, mod_conv = 'm_abn_fossil' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
}

SMODS.Consumable {
  key = 'needlework',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 5, y = 1 },
  config = { max_highlighted = 1, mod_conv = 'm_abn_sew' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  abn_artist_credits = {
    artist = "Lizzie",
  },
}

SMODS.Consumable {
  key = 'teaset',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 0, y = 2 },
  config = { max_highlighted = 1, mod_conv = 'm_abn_teabag' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  abn_artist_credits = {
    artist = "Lizzie",
  },
}

SMODS.Consumable {
  key = 'easel',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 1, y = 2 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_polkadot' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,

  abn_artist_credits = {
    artist = "Lizzie",
  },
}

SMODS.Consumable {
  key = 'terminal',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 2, y = 2 },
  config = { max_highlighted = 1, mod_conv = 'm_abn_monitor' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  abn_artist_credits = {
    artist = "Lizzie",
  },
}

SMODS.Consumable {
  key = 'pillow',
  set = 'Tarot',
  atlas = "AbandoniaTarots",
  pos = { x = 3, y = 2 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_cotton' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
}
