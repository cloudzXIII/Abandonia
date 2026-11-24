SMODS.Joker {
  key = 'crayon_mishap_joker',
  atlas = 'ABNJokerSheet28',
  pos = { x = 0, y = 6 },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  config = {
    extra = {
      chips = 30,
      mult = 8,
      chips_add = 10,
      mult_add = 4,
    }
  },


  abn_spectrum_hands = {
    ['abn_Spectrum'] = true,
    ['abn_Straight Spectrum'] = true,
    ['abn_Spectrum House'] = true,
    ['abn_Spectrum Five'] = true,
    ['abn_Spectrum Six'] = true,
    ['abn_Inverse Spectrum'] = true,
    ['abn_Emperium Spectrum'] = true,
    ['abn_Skeet Spectrum'] = true,
    ['abn_Specflush'] = true,
    ['abn_Straight Specflush'] = true,
    ['abn_Specflush House'] = true,
    ['abn_Specflush Five'] = true,
    ['abn_Specflush Six'] = true,
  },

  abn_specflush_hands = {
    ['abn_Specflush'] = true,
    ['abn_Straight Specflush'] = true,
    ['abn_Specflush House'] = true,
    ['abn_Specflush Five'] = true,
    ['abn_Specflush Six'] = true,
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_juggle
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.chips_add,
        card.ability.extra.mult_add,
      }
    }
  end,

  in_pool = function(self, args)
    for hand_key, _ in pairs(self.abn_spectrum_hands) do
      if G.GAME.hands[hand_key] and G.GAME.hands[hand_key].played > 0 then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint and self.abn_specflush_hands[context.scoring_name] then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_add
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.ATTENTION,
      }
    end

    if context.joker_main and self.abn_spectrum_hands[context.scoring_name] then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
      }
    end

    if context.end_of_round and context.main_eval and not context.game_over and card.edition and G.GAME.blind and G.GAME.blind.boss then
      G.E_MANAGER:add_event(Event({
        func = function()
          add_tag(Tag('tag_juggle'))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        end
      }))
    end
  end,
  
  abn_artist_credits = {
    artist = "Glitchkat",
  },
}