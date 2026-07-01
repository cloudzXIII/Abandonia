SMODS.Joker {
  key = 'joker_midnight',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge

    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    local tally = 0
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.edition and c.edition.key == "e_abn_sunscourge" then tally = tally + 1 end
      end
    end
    if G.jokers and G.jokers.cards then
      for _, c in ipairs(G.jokers.cards) do
        if c.edition and c.edition.key == "e_abn_sunscourge" then tally = tally + 1 end
      end
    end
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.mult * tally,
        localize({ type = 'name_text', key = "e_abn_sunscourge", set = "Edition" })
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 2, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 10
    },
  },
  calculate = function(self, card, context)
    if context.debuff_card and ABN.is_light(context.debuff_card) then
      return { debuff = true }
    end
    if context.setting_blind then
      local joker = G.jokers.cards[1]
      if not joker.edition then
        card:juice_up()
        joker:set_edition("e_abn_sunscourge", true)
      end
    end
    if context.joker_main then
      local tally = 0
      for _, c in ipairs(G.playing_cards) do
        if c.edition and c.edition.key == "e_abn_sunscourge" then tally = tally + 1 end
      end
      for _, c in ipairs(G.jokers.cards) do
        if c.edition and c.edition.key == "e_abn_sunscourge" then tally = tally + 1 end
      end
      return {
        mult = card.ability.extra.mult * tally
      }
    end
  end,
  abn_artist_credits = {
    artist = "AmaibleYak"
  },
}
