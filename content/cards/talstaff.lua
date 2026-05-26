SMODS.Joker {
  key = 'talstaff',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 1 },
  soul_pos = { x = 9, y = 1 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { xmult = 1, xmultadd = 2 } },

  loc_vars = function(self, info_queue, card)
    -- Count jokers to the left
    local jokers_to_left = 0
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          jokers_to_left = i - 1
          break
        end
      end
    end
    
    -- update xmult
    if jokers_to_left == 0 then
      card.ability.extra.xmult = 1
    else
      card.ability.extra.xmult = jokers_to_left * card.ability.extra.xmultadd
    end
    
    return { vars = { card.ability.extra.xmult, card.ability.extra.xmultadd } }
  end,
  
  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local jokers_to_left = 0
      if G.jokers and G.jokers.cards then
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i] == card then
            jokers_to_left = i - 1
            break
          end
        end
      end

      if jokers_to_left == 0 then
        card.ability.extra.xmult = 1
      else
        card.ability.extra.xmult = jokers_to_left * card.ability.extra.xmultadd
      end

      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Weasel.922",
  },
}