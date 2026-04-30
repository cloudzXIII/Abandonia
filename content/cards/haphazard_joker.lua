SMODS.Joker {
  key = 'haphazard_joker',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return { vars = { numerator, denominator, card.ability.extra.xmultadd, card.ability.extra.xmult, } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 4, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 0.1, xmultadd = 0.1, odds = 10, } },

  in_pool = function(self)
    if not G.playing_cards then return false end

    local count = 0
    for _, card in ipairs(G.playing_cards) do
      -- Check if there are enhanced cards
      if card.config and card.config.center and card.config.center ~= G.P_CENTERS.c_base then
        count = count + 1
      end
      -- If 10 or more then this can appear
      if count >= 10 then return true end
    end

    return false
  end,


  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card
      local rank = currentCard:get_id()


      if currentCard and rank >= 2 and rank <= 10 and rank % 2 == 0 and currentCard.config.center.set == "Enhanced" then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        if SMODS.pseudorandom_probability(card, 'haphazard', 1, card.ability.extra.odds) then
          local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
          add_tag(Tag(tag_key))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        else
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = localize('k_nope_ex'),
            colour = G.C.SECONDARY_SET.Tarot,
          })
        end

        return {
          xmult = card.ability.extra.xmult
        }
      elseif currentCard and rank >= 2 and rank <= 10 and rank % 2 ~= 0 or rank == 14 then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED,
          card = card
        }
      elseif currentCard and rank >= 2 and rank <= 10 and rank % 2 == 0 then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        if SMODS.pseudorandom_probability(card, 'haphazard', 1, card.ability.extra.odds) then
          local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
          add_tag(Tag(tag_key))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        else
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = localize('k_nope_ex'),
            colour = G.C.SECONDARY_SET.Tarot,
          })
        end
      elseif currentCard then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED,
          card = card
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "WarpedCloset"
  },
}
