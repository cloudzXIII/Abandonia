SMODS.Joker {
  key = 'corpuscular_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 3, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { mult = 30 }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    return { vars = { card.ability.extra.mult } }
  end,

  in_pool = function(self)
    if not G.playing_cards or not G.jokers then return false end
    local has_foil = false

    -- Helper function to check a table of cards
    local function check_for_editions(card_table)
      for _, card in ipairs(card_table) do
        if card.edition then
          -- If any edition that isn't Foil is found, return "invalid"
          if card.edition.key ~= 'e_foil' then
            return "invalid"
          end
          has_foil = true
        end
      end
      return "valid"
    end

    -- Check Deck
    if check_for_editions(G.playing_cards) == "invalid" then return false end

    -- Check Joker Bar
    if check_for_editions(G.jokers.cards) == "invalid" then return false end

    -- Returns true only if at least one Foil was found and no other editions exist
    return has_foil
  end,

  calculate = function(self, card, context)
    -- Trigger for Foil Jokers
    if context.other_joker and context.other_joker.edition and context.other_joker.edition.foil then
      return {
        mult = card.ability.extra.mult,
        card = card
      }
    end

    -- Trigger for Foil cards played
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.foil then
        return {
          mult = context.other_card.base.nominal * 2,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
