SMODS.Joker {
  key = 'colorimetry_joker',
  atlas = 'ABNJokerSheet28',
  pos = { x = 0, y = 5 },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  config = {
    extra = {
      chips = 40,
      mult = 10,
      asc_add = 0.5,
      asc = 0,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_rgb
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.asc_add,
        card.ability.extra.asc,
      }
    }
  end,

  in_pool = function(self, args)
    return G.GAME.abn_any_spectrum_played --See main.lua
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_name == 'abn_Specflush Five' and context.scoring_hand and context.scoring_hand[1] then
      context.scoring_hand[1]:set_edition('e_abn_rgb', true)
    end

    if context.individual and context.cardarea == G.play and context.other_card then
      local scored_card = context.other_card
      local effect = {}

      if card.edition and not context.blueprint and scored_card.edition and scored_card.edition.key == 'e_abn_rgb' then
        card.ability.extra.asc = card.ability.extra.asc + card.ability.extra.asc_add
        effect.message = localize('k_upgrade_ex')
        effect.message_card = card
        effect.colour = G.C.ATTENTION
      end
	  
      if next(context.poker_hands["abn_Spectrum"]) and not SMODS.has_no_suit(scored_card) then
        local suit_object = SMODS.Suits[scored_card.base.suit]
        if suit_object then
          if suit_object.mod then
            effect.mult = card.ability.extra.mult
          else
            effect.chips = card.ability.extra.chips
          end
        end
      end

      if next(effect) then return effect end
    end

    if context.joker_main and card.ability.extra.asc > 0 then
      return {
        asc = card.ability.extra.asc,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
