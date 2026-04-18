SMODS.Joker {
  key = 'coercive_comedian',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
        card.ability.extra.chips,
        card.ability.extra.chipsadd,
      }
    }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 17 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1, xmultadd = 0.3, chips = 0, chipsadd = 100 } },


  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  --increase play/discard limit
  add_to_deck = function(self, card)
    SMODS.change_play_limit(1)
    SMODS.change_discard_limit(1)
  end,

  --decrease play/discard limit
  remove_from_deck = function(self, card)
    SMODS.change_play_limit(-1)
    SMODS.change_discard_limit(-1)
  end,

  calculate = function(self, card, context)
    if context.before then
      if context.scoring_hand then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.BLUE,
          card = card
        }
      end
    end

    -- Trigger for each card as it scores
    if context.individual and context.cardarea == G.play then
      local current_card = context.other_card
      local rank = current_card:get_id()

      -- Check if it is a numbered card (2-10)
      if rank >= 2 and rank <= 10 then
        local is_unique = true

        -- Look back at previous cards in the scoring hand to see if this rank already scored
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i] == current_card then break end       -- Stop when we hit the current card
          if context.scoring_hand[i]:get_id() == rank then
            is_unique = false
            break
          end
        end

        -- If this is the first time this rank is appearing in this specific hand
        if is_unique then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.RED,
            card = card,
          }
        end
      end
    end

    -- Scoring logic
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Yahooyowza & Nice Cream",
  },
}
