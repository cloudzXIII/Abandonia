SMODS.Joker {
  key = 'meddlesome_naidemoc',
  rarity = 2,
  atlas = 'ABNJokerSheet15',
  pos = { x = 0, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0, mult = 0, chipsadd = 10, multadd = 2 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chipsadd, card.ability.extra.multadd } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        card = card
      }
    end


    if context.before and not context.blueprint then

      local suit_map = {
        ['Diamonds']     = 'Spades',
        ['Spades']       = 'Hearts',
        ['Hearts']       = 'Clubs',
        ['Clubs']        = 'abn_Snow',
        ['abn_Snow']     = 'abn_Penumbra',
        ['abn_Penumbra'] = 'abn_Tie',
        ['abn_Tie']      = 'abn_Bow'
      }

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        local current_suit = scoring_card.base.suit
        local next_suit = suit_map[current_suit]
        
        if next_suit then

          scoring_card:change_suit(next_suit)
          

        end
      end
    end


    if context.change_suit and context.other_card then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
      
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.ATTENTION,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}