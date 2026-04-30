SMODS.Joker {
  key = 'creechie_buffoon',
  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 0, y = 0 },
  cost = 3,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xmult = 1, xmultadd = 1, odds = 6, } },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return { vars = { numerator, denominator, card.ability.extra.xmult, card.ability.extra.xmultadd } }
  end,

  --only appear if you have an enhanced card and a commedian
  in_pool = function(self)
    if not G.playing_cards or not G.jokers then return false end

    local has_comedian = false
    local has_enhanced = false

    -- Check for Comedian (Super Rare) Jokers
    for _, j in ipairs(G.jokers.cards) do
      if j.config.center and j.config.center.rarity == "abn_SuperRare" then
        has_comedian = true
        break
      end
    end

    -- Check for Enhanced Cards in the deck
    for _, card in ipairs(G.playing_cards) do
      if card.edition then
        has_edition = true
        break
      end
    end

    -- Only return true if BOTH conditions are met
    return has_comedian and has_edition
  end,


  update = function(self, card)
    -- Only run during a game run
    if G.STAGE ~= G.STAGES.RUN then return end

    -- count Commedians
    local count = 0
    for i = 1, #G.jokers.cards do
      local j = G.jokers.cards[i]
      if j.config.center and j.config.center.rarity and j.config.center.rarity == "abn_SuperRare" then
        count = count + 1
      end
    end

    card.ability.extra.xmult = count * card.ability.extra.xmultadd
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card

      if currentCard and currentCard.edition then
        return { xmult = card.ability.extra.xmult }
      end
    end

    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if SMODS.pseudorandom_probability(card, 'abn_creechie', 1, card.ability.extra.odds) then
        SMODS.destroy_cards(card, nil, nil, true)
        G.GAME.CreechieDied = true
        return {
          message = ("oops"),
          colour = G.C.ATTENTION
        }
      else
        return {
          message = localize('k_safe_ex')
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Creechie",
  },
}
