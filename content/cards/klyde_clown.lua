-- Klyde Clown (coded by cloudzXIII)

function ABN.reset_klyde_clown()
  G.GAME.current_round.abn_klyde_clown = { suit = 'Hearts' }
  local valid_klyde_clowns = {}
  for _, playing_card in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(playing_card) then
      valid_klyde_clowns[#valid_klyde_clowns + 1] = playing_card
    end
  end
  local klyde_clown = pseudorandom_element(valid_klyde_clowns, 'abn_seed' .. G.GAME.round_resets.ante)
  if klyde_clown then
    G.GAME.current_round.abn_klyde_clown.suit = klyde_clown.base.suit
  end
end

SMODS.Joker {
  key = 'klyde_clown',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    local klyde_clown = G.GAME.current_round.abn_klyde_clown or { suit = 'Hearts' }

    return {
      vars = {
        cae.x_chips,
        cae.x_chips_gain,
        cae.mult_gain,
        cae.chips_gain,
        localize(klyde_clown.suit, 'suits_plural'),
        localize(klyde_clown.suit, 'suits_singular'),
        cae.x_mult,
        cae.x_mult_gain,
        colours = { G.C.SUITS[klyde_clown.suit] },
      }
    }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 10 },
  soul_pos = { x = 9, y = 10 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1, x_chips_gain = 0.04, mult_gain = 2, chips_gain = 2, x_mult = 1, x_mult_gain = 0.04 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and context.other_card:is_suit(G.GAME.current_round.abn_klyde_clown and G.GAME.current_round.abn_klyde_clown.suit or "Hearts") and not context.blueprint then
      if next(SMODS.find_card("j_joker")) then
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 1) +
            card.ability.extra.mult_gain * #G.hand.cards
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 1) +
            card.ability.extra.chips_gain * #G.hand.cards
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(G.GAME.current_round.abn_klyde_clown and G.GAME.current_round.abn_klyde_clown.suit or "Hearts") then
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          no_message = true,
        })
      end
      return {
        x_chips = card.ability.extra.x_chips,
        x_mult = card.ability.extra.x_mult,
        card = card,
      }
    end
    if context.after and context.main_eval and not context.blueprint then
      ABN.reset_klyde_clown()
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Inky & Vlambambo",
  },
}
