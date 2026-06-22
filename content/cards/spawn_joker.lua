-- Spawn Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'spawn_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_infra
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_spawn_joker')
    return { vars = { numerator, denominator } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 7, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { base = 1, odds = 6 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_negative" then
        return {
          chips = context.other_card.base.nominal * 2
        }
      end

      if SMODS.has_enhancement(context.other_card, "m_abn_infra") and SMODS.pseudorandom_probability(card, 'spawn_joker', card.ability.extra.base, card.ability.extra.odds, "abn_spawn_joker") then
        local _card = context.other_card
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            SMODS.upgrade_poker_hands({ hands = { context.scoring_name }, level_up = 1, from = _card })
            card:juice_up(0.3, 0.5)
            return true
          end
        }))
      end

      if context.other_card:get_id() == 4 or context.other_card:get_id() == 6 then
        context.other_card:set_edition("e_negative", true)
      end
    end
	
	if context.final_scoring_step and not context.repetition and card.edition and card.edition.negative then
		local blind_chips = G.GAME.blind and G.GAME.blind.chips or 0
        local result = SMODS.calculate_round_score()

        if result > blind_chips then
			for _, hand_card in ipairs(G.hand.cards) do
				hand_card:set_edition({negative = true}, true)
			end
		end
	end
  end,
  abn_artist_credits = {
    artist = "NiceCream",
  },
  in_pool = function(self, args)
    local has_negative = false
    local has_infra = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.edition and playing_card.edition.key == "e_negative" then
        has_negative = true
      end
      if SMODS.has_enhancement(playing_card, "m_abn_infra") then
        has_infra = true
      end
    end
    return has_infra and has_negative
  end
}
