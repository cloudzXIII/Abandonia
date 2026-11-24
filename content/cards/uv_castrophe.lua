SMODS.Joker {
  key = 'uv_castrophe_joker',
  atlas = 'ABNJokerSheet28',
  pos = { x = 8, y = 4 },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  config = {
    extra = {
      score = 0,
      score_mult = 200,
      destroy_this_hand = false,
      last_hand_type = nil,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_ultraviolet
    return {
      vars = {
        card.ability.extra.score_mult,
        card.ability.extra.score,
      }
    }
  end,

  in_pool = function(self, args)
    if not G.playing_cards then return false end
    local vanilla_suits = { Spades = false, Hearts = false, Clubs = false, Diamonds = false }
    for _, playing_card in ipairs(G.playing_cards) do
      if vanilla_suits[playing_card.base.suit] ~= nil then
        vanilla_suits[playing_card.base.suit] = true
      end
    end
    for _, has_suit in pairs(vanilla_suits) do
      if not has_suit then return true end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      card.ability.extra.destroy_this_hand = (G.GAME.current_round.hands_played == 0)
        or (G.GAME.current_round.hands_left == 0)

      if context.scoring_name == 'abn_Spectrum Six' then
        local last_scoring_card = context.scoring_hand[#context.scoring_hand]
        if last_scoring_card then
          last_scoring_card:set_edition('e_abn_ultraviolet', true)
        end
      end
    end

    if context.destroy_card and context.cardarea == G.play and not context.blueprint
        and card.ability.extra.destroy_this_hand
        and SMODS.in_scoring(context.destroy_card, context.scoring_hand)
        and not SMODS.has_no_suit(context.destroy_card) then
      local suit_object = SMODS.Suits[context.destroy_card.base.suit]
      if suit_object and not suit_object.mod then
        card.ability.extra.score = card.ability.extra.score
          + (context.destroy_card:get_chip_bonus() * card.ability.extra.score_mult)
        return {
          remove = true,
          message = localize('k_upgrade_ex'),
          colour = G.C.PURPLE,
        }
      end
    end

    if context.joker_main then
      local effect = {}

      if card.ability.extra.score > 0 then
        effect.score = card.ability.extra.score
      end

      if card.edition then
        local current_hand = G.GAME.hands[context.scoring_name]
        local previous_hand = card.ability.extra.last_hand_type and G.GAME.hands[card.ability.extra.last_hand_type]
        effect.chips = (current_hand and current_hand.chips or 0) + (previous_hand and previous_hand.chips or 0)
        effect.mult = (current_hand and current_hand.mult or 0) + (previous_hand and previous_hand.mult or 0)
      end

      if next(effect) then return effect end
    end

    if context.after and not context.blueprint then
      card.ability.extra.last_hand_type = context.scoring_name
    end
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}