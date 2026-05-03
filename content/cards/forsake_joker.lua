SMODS.Joker {
  key = 'forsake_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 1, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 4, chips = 0, mult = 0, multadd = 5, } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.multadd,
        localize({ type = 'name_text', key = "e_abn_abandond", set = "Edition" }),
      }
    }
  end,

  in_pool = function(self)
    local has_playing_card = false
    local has_joker = false

    -- Check Playing Cards
    if G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card.edition and card.edition.key == 'e_abn_abandond' then
          has_playing_card = true
          break -- Found one, move to next check
        end
      end
    end

    -- Check Jokers
    if G.jokers and G.jokers.cards then
      for _, card in ipairs(G.jokers.cards) do
        if card.edition and card.edition.key == 'e_abn_abandond' then
          has_joker = true
          break -- Found one
        end
      end
    end

    -- Only returns true if both flags were set to true
    return has_playing_card and has_joker
  end,


  calculate = function(self, card, context)
    -- Trigger for other holo Jokers
    if context.post_trigger and context.other_card and not context.blueprint then
      local target = context.other_card

      -- Ensure the target is actually a Joker
      if target ~= card and type(target) == 'table' and target.ability and target.ability.set == 'Joker' and target.edition and target.edition.abn_abandond then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
        return {
          dollars = card.ability.extra.dollars,
          card = card
        }
      end
    end

    -- Trigger for holo cards played in the hand
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.abn_abandond then
        card.ability.extra.chips = card.ability.extra.chips + (context.other_card.base.nominal * 2)
        return {
          dollars = card.ability.extra.dollars,
          card = card
        }
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "b.b.b.b",
  },
}
