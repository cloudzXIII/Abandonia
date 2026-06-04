-- Rip edition tracking from Fortlatro
local set_edition_ref = Card.set_edition

local function _detect_edition_name(ed)
    if not ed then return nil end
    if type(ed) == "string" then
        return ed:match("^e_(.+)$") or ed
    elseif type(ed) == "table" then
        if type(ed.type) == "string" then return ed.type end
        if type(ed.key)  == "string" then return ed.key  end
        local EXCLUDE = { chips = true, mult = true, type = true, key = true, xmult = true, x_mult = true, xchips = true }
        for k, v in pairs(ed) do
            if v == true and not EXCLUDE[k] and type(k) == "string" then
                return k
            end
        end
    end
    return nil
end

function Card:set_edition(edition, immediate, silent)
    local run = true
    if edition then
        local is_foil_req = (edition == "e_foil") or (type(edition) == "table" and edition.foil == true)
        if is_foil_req
            and G and G.GAME and G.GAME.modifiers and G.GAME.modifiers.no_foil_jokers
            and self.ability and self.ability.set == "Joker"
        then
            self:juice_up(0.5)
            run = false
        end

        if run then
            local ret = set_edition_ref(self, edition, immediate, silent)
            if self.edition then
                local bestie_jokers = SMODS.find_card("j_abn_joker_besties")
                if bestie_jokers and next(bestie_jokers) then
                    local bestie_joker = bestie_jokers[1]
                    local bestie_chips = bestie_joker.ability.extra.chips or 0

                    if self.ability and self.ability.set then
                        if self.ability.set == 'Default' or self.ability.set == 'Enhanced' then
                            self.ability.perma_bonus = (self.ability.perma_bonus or 0) + bestie_chips
                        elseif self.ability.set == 'Joker' then
                            self.ability.abn_perma_bonus = (self.ability.abn_perma_bonus or 0) + bestie_chips
                        end
                        
                        card_eval_status_text(self, 'extra', nil, nil, nil, {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS
                        })
                    end
                end
            end

            if self.edition and self.area == G.hand then
                local applied = _detect_edition_name(self.edition)
                if applied then
                    G.GAME.purchased_editions = G.GAME.purchased_editions or {}
                    G.GAME.last_edition = applied

                    local already = false
                    for _, stored in ipairs(G.GAME.purchased_editions) do
                        if stored == applied then already = true; break end
                    end
                    if not already then
                        table.insert(G.GAME.purchased_editions, applied)
                    end
                end
            end

            return ret
        end
    end
end

SMODS.Joker {
  key = 'joker_besties',
  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 4, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 5
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      }
    }
  end,
  
  in_pool = function(self)
	if not G.playing_cards then return false end

	for _, card in ipairs(G.playing_cards) do
		if card and card.edition and card.edition.foil then
			if card.config.center == G.P_CENTERS.m_fn_Wood or card.config.center == G.P_CENTERS.m_fn_Brick then
				return true
			end
		end
	end
	return false
  end,

  calculate = function(self, card, context)
    local function upgrade_edition(target_card)
      local current_edition = target_card.edition and target_card.edition.type
      local next_edition = nil

      if current_edition == 'foil' then
        next_edition = 'holo'
      elseif current_edition == 'holo' then
        next_edition = 'polychrome'
      elseif current_edition == 'polychrome' then
        next_edition = 'abn_chromatic'
      end

      if next_edition then
        target_card:set_edition({ [next_edition] = true }, true)
      end
    end

    -- Cards
    if context.individual and context.cardarea == G.play then
      local target = context.other_card
      if target.config and target.config.center then
        local set_type = target.config.center.set
        if (set_type == "Default" or set_type == "Enhanced") and target.edition and target.edition.type then
          if target.edition.type == 'foil' or target.edition.type == 'holo' or target.edition.type == 'polychrome' then
            upgrade_edition(target)
          end
        end
      end
    end

    -- Jokers
    if context.other_joker and context.other_joker ~= card then
      local target = context.other_joker
      if target.config and target.config.center and target.config.center.set == "Joker" then
        if target.edition and target.edition.type then
          if target.edition.type == 'foil' or target.edition.type == 'holo' or target.edition.type == 'polychrome' then
            upgrade_edition(target)
          end
        end
      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Comykel",
  },
}