local csa = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
  csa(self, center, initial, delay_sprites)
  if center == G.P_CENTERS.m_abn_oilfire and next(SMODS.find_card('j_abn_inferno_comedian')) then
    self.config.center.replace_base_card = false
    self.config.center.no_rank = false
    self.config.center.no_suit = false
  end
end

local shf = Card.should_hide_front
function Card:should_hide_front()
  if self.config.center == G.P_CENTERS.m_abn_oilfire and next(SMODS.find_card('j_abn_inferno_comedian')) then return false end
  return shf(self)
end

SMODS.Joker {
  key = 'inferno_comedian',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_oilfire 
    return { vars = { card.ability.extra.xmult, card.ability.extra.mult } }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet4',
  pos = { x = 1, y = 2 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.7, mult = 0 } },
  pools = { ["Comedians"] = true },

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    -- 1. XMult from played cards individually
    if context.individual and context.cardarea == G.play then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
	
    -- 2. Regular flat Mult evaluation during final scoring
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end

    -- 3. Scaling logic: when a playing card is destroyed/removed
    if context.remove_playing_cards and not context.blueprint then
      local gained_mult = 0
      for _, removed_card in ipairs(context.removed) do
        -- Check if the destroyed card specifically has the Oilfire enhancement
        if removed_card.config.center == G.P_CENTERS.m_abn_oilfire then
          -- Safely fetch nominal chip value (Aces = 11, Face = 10, etc.) 
          -- Falls back to 0 if it has no rank (like a Stone card)
          local card_value = (not SMODS.has_no_rank(removed_card)) and removed_card.base.nominal or 0
          gained_mult = gained_mult + card_value
        end
      end

      if gained_mult > 0 then
        card.ability.extra.mult = card.ability.extra.mult + gained_mult
        return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT,
            card = card
        }
      end
    end


    if context.final_scoring_step and not context.repetition then
      local blind_chips = G.GAME.blind and G.GAME.blind.chips or 0
      local result = SMODS.calculate_round_score()

      if result > blind_chips then
        card.ability.extra.sunscourge_triggered = true
        
        if #G.hand.cards > 0 then
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.ATTENTION})
          
          for _, h_card in ipairs(G.hand.cards) do
            h_card:set_edition({abn_sunscourge = true}, true)
            h_card:set_ability(G.P_CENTERS.m_abn_oilfire)
            h_card:juice_up()
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Toyrapple",
  },
}