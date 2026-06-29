-- Time Attack (coded by cloudzXIII) - wip
SMODS.Joker {
  key = 'time_attack',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 6, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      repetitions = 1,
      fullfilled = false,
      jokers = {}
    },
  },
  calculate = function(self, card, context)
    if context.setting_blind then
      card.ability.extra.jokers = {}
      card.ability.extra.jokers[card.config.center.key] = true
    end
    if context.post_trigger and context.other_card.ability.set == "Joker" then
      card.ability.extra.jokers[context.other_card.config.center.key] = true
    end
    if context.starting_shop then -- more forgiving perhapss? will see if this lets golden joker and stuff trigger
      local should_destroy = false
      for _, joker in ipairs(G.jokers.cards) do
        if not card.ability.extra.jokers[joker.config.center.key] then
          should_destroy = true
          break
        end
      end
      if should_destroy then
        for _, playing_card in ipairs(G.deck.cards) do
          if playing_card then
            SMODS.destroy_cards(playing_card)
          end
        end

        SMODS.calculate_effect({ message = localize("k_abn_destroyed") }, card)
      end
    end
    if context.repetition and context.cardarea == G.play then
      if context.other_card.edition then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
  end,
  calc_scaling = function(self, card, other_card, initial, scalar_value, args)
    if args.operation == '+' or args.operation == 'X' then
      return {
        message = localize('k_again_ex'),
        override_scalar_value = {
          value = scalar_value * 2
        }
      }
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
  in_pool = function(self)
    for _, area in ipairs({ G.jokers.cards or {}, G.playing_cards or {} }) do
      for _, other_card in ipairs(area) do
        if other_card.edition then
          return true
        end
      end
    end
    return false
  end
}
