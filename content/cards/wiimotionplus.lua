SMODS.Joker {
  key = 'wiimotionplus',
  rarity = 2,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet21',
  pos = { x = 3, y = 4 },
  --atlas = 'jonklers', -- test sprites from my own mod
  --pos = { x = 3, y = 0 }, -- Wii Remote (a MUCH more convoluted rendition than this one, though)
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  demicoloncompat = true,
  config = { extra = { mult = 0, mult_gain = 8 }, immutable = { slots = {} } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, (table.concat(card.ability.immutable.slots, ', ') or "None") } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          local found = false
          for k, v in pairs(card.ability.immutable.slots) do
            if v == i then
              found = true
            end
          end
          if found == false then
            table.insert(card.ability.immutable.slots, i)
            SMODS.scale_card(card, {
              ref_table = card.ability.extra,
              ref_value = 'mult',
              scalar_value = 'mult_gain',
              message_colour = G.C.ATTENTION
            })
          end
        end
      end
    end
    if context.joker_main or context.forcetrigger then
      if not (card.ability.extra.mult == 0) then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Pitissaria 2",
  }
}
