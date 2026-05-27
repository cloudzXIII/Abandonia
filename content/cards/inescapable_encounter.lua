-- Hook into G.FUNCS.skip_blind
local skip_blind_ref = G.FUNCS.skip_blind
G.FUNCS.skip_blind = function(e)
  -- Check if the specific joker exists
  local jokers = SMODS.find_card('j_abn_inescapable_encounter')

  if #jokers > 0 then
    -- Loop through found jokers
    for _, v in ipairs(jokers) do
      -- 1. Visual "bump" effect
      v:juice_up(0.3, 0.3)

      -- 2. Display the message over the card
      attention_text({
        text = 'Not Allowed!',
        scale = 0.7,
        hold = 1.2,
        major = v,
        backdrop_col = G.C.ATTENTION,
        align = 'cm',
        offset = { x = 0, y = -1 }
      })
    end

    return     -- Exit to block the skip
  end

  -- If the joker isn't found, run the original function logic
  skip_blind_ref(e)
end


SMODS.Joker {
  key = 'inescapable_encounter',
  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 7, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  -- Calculate function for giving permanent rank-based chip bonus
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card
      if currentCard then
        -- Grant the played card's rank value as a permanent chip bonus
        currentCard.ability.perma_bonus = (currentCard.ability.perma_bonus or 0) +
        SMODS.Ranks[currentCard.base.value].nominal

        -- Replace the "big juice" effect with card:juice_up()
        if currentCard.juice_up then
          currentCard:juice_up()
        else
          print("Error: The card does not have the juice_up method.")
        end

        return {
          extra = { message = "Upgrade!", colour = G.C.CHIPS },
          colour = G.C.CHIPS,
          card = currentCard
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Beenix",
  },
}
