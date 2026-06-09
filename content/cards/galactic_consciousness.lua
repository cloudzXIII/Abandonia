SMODS.Joker {
  key = 'galactic_consciousness',
  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 1, y = 0 },
  cost = 10,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      gloss_mult = 60,
      pearlescent_xchips = 3,
      iridescent_xmult = 3,
      chromatic_echips = 1.1
    }
  },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.gloss_mult,
        card.ability.extra.pearlescent_xchips,
        card.ability.extra.iridescent_xmult,
        card.ability.extra.chromatic_echips
      }
    }
  end,
  
  in_pool = function(self, args)
    if G.jokers and G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        if j.edition and (
          j.edition.abn_gloss or 
          j.edition.abn_pearlescent or 
          j.edition.abn_iridescent or 
          j.edition.abn_chromatic
        ) then
          return true
        end
      end
    end
    return false
  end,
  
  calculate = function(self, card, context)
    -- Jokers
    if context.other_joker and context.other_joker ~= card then
      local target_card = context.other_joker
      if target_card.edition then
        if target_card.edition.abn_gloss then return { mult = card.ability.extra.gloss_mult, card = card } end
        if target_card.edition.abn_pearlescent then return { xchips = card.ability.extra.pearlescent_xchips, card = card } end
        if target_card.edition.abn_iridescent then return { xmult = card.ability.extra.iridescent_xmult, card = card } end
        if target_card.edition.abn_chromatic then return { echips = card.ability.extra.chromatic_echips, card = card } end
      end
    end

    -- Cards
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      if target_card.edition then
        if target_card.edition.abn_gloss then return { mult = card.ability.extra.gloss_mult, card = card } end
        if target_card.edition.abn_pearlescent then return { xchips = card.ability.extra.pearlescent_xchips, card = card } end
        if target_card.edition.abn_iridescent then return { xmult = card.ability.extra.iridescent_xmult, card = card } end
        if target_card.edition.abn_chromatic then return { echips = card.ability.extra.chromatic_echips, card = card } end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Gfs",
  },
}