SMODS.Joker {
  key = 'inkblot_test',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 4 },
  cost = 5,
  discovered = true,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.hand_drawn then
      local lowest_card = nil
      local lowest_id = 15

      for i = 1, #G.hand.cards do
        local _card = G.hand.cards[i]
        if not SMODS.has_no_rank(_card) then
          if _card.base.id < lowest_id then
            lowest_id = _card.base.id
            lowest_card = _card
          end
        end
      end

      local any_forced = nil
      for _, playing_card in ipairs(G.hand.cards) do
        if playing_card.ability.abn_inkblot_forced_selection then
          any_forced = true
        end
      end
      if not any_forced and lowest_card then
        G.hand:unhighlight_all()
        lowest_card.ability.abn_inkblot_forced_selection = true
        G.hand:add_to_highlighted(lowest_card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "HyperReal63"
  },
}

local always_scores_ref = SMODS.always_scores
function SMODS.always_scores(card)
  if card.ability.abn_inkblot_forced_selection then
    return true
  end
  return always_scores_ref(card)
end

local discard_cards_from_highlighted_ref = G.FUNCS.discard_cards_from_highlighted
G.FUNCS.discard_cards_from_highlighted = function(e, hook)
  for k, v in ipairs(G.playing_cards) do
    v.ability.abn_forced_selection = nil
    v.ability.abn_inkblot_forced_selection = nil
  end
  local ret = discard_cards_from_highlighted_ref(e, hook)
  return ret
end
