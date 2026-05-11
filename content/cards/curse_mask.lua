if ((SMODS.Mods["ortalab"] or {}).can_load) then

SMODS.Joker {
  key = 'curse_mask',
  rarity = 2,
  atlas = 'AbandoniaCrossmod',
  pos = { x = 0, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 0,
      chips = 0,
      multadd = 5,
      chipsadd = 10,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
      },
    }
  end,
  
  in_pool = function(self)
	-- Check for cursed playing cards
    if G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card and card.curse then
                return true
            end
        end
    end

    -- Check for cursed Jokers
    if G.jokers and G.jokers.cards then
        for _, joker in ipairs(G.jokers.cards) do
            if joker and joker.curse then
                return true
            end
        end
    end

    return false
   end,

  calculate = function(self, card, context)
    -- Trigger when the Blind is set
    if context.setting_blind and not context.blueprint then
        local removed_any = false
        
        -- Check Playing Cards (Deck/Hand/Discard)
        for _, c in ipairs(G.playing_cards) do
            if c.curse then
                c:set_curse() -- Removes the curse
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                removed_any = true
            end
        end
        
        -- Check Jokers
        for _, j in ipairs(G.jokers.cards) do
            if j.curse then
                j:set_curse() -- Removes the curse
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                removed_any = true
            end
        end

        if removed_any then
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.Mult
            }
        end
    end

    -- Scored chips and mult
    if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            chips = card.ability.extra.chips,
        }
    end
  end,

  abn_artist_credits = {
    artist = "Yotam",
  },
}

end