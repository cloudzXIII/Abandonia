-- Eye Exam (coded by cloudzXIII)
SMODS.Joker {
  key = 'eye_exam',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 0, y = 1 },
  cost = 2,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { dollars = 1 } },

  abn_artist_credits = {
    artist = "Skittleskitty"
  },
  kh_use_config = { colour = G.C.RED, text = "REVEAL", cost = 1 },
  can_use = function(self, card)
    local condition = false
    if G.hand and #G.hand.cards > 0 then
      for i = 1, #G.hand.cards do
        if G.hand.cards[i].facing == 'back' then
          condition = true
        end
      end
    end
    return condition and G.GAME.dollars >= card.ability.extra.dollars
  end,
  use = function(self, card)
    ease_dollars(-card.ability.extra.dollars)
    for i = 1, #G.hand.cards do
      if G.hand.cards[i].facing == 'back' then
        G.hand.cards[i].ability.abn_perma_flipped = false
        G.hand.cards[i]:flip()
      end
    end
    SMODS.calculate_effect({ message = localize("k_abn_unflipped") }, card)
  end,
}
