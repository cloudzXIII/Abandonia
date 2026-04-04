loc_colour()
G.C.NIGHTSHIFT = HEX("5fb4c8")
G.C.NIGHTSHIFT_SECONDARY = HEX("1a6a5f")
G.ARGS.LOC_COLOURS["abn_Nightshift"] = G.C.NIGHTSHIFT

SMODS.ConsumableType {
  key = "nightshift_cards",
  collection_rows = { 6, 6 },
  shop_rate = 0.0,
  primary_colour = G.C.NIGHTSHIFT,
  secondary_colour = G.C.NIGHTSHIFT_SECONDARY,
  loc_txt = {
    collection = "Nightshift Cards",
    name = "Nightshift",
    undiscovered = {
      name = "Not Discovered",
      text = {
        "Purchase or use",
        "this card in an",
        "unseeded run to",
        "learn what it does"
      }
    },
  },
}

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
    
    --Check if we are actually in a run
    if not G or G.STAGE ~= G.STAGES.RUN then return end
    
    --check for playing cards
    if G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.antedebuff then
                card:set_debuff(true)
            end
        end
    end
    
    --check for Jokers
    if G.jokers and G.jokers.cards then
        for _, card in ipairs(G.jokers.cards) do
            if card.antedebuff then
                card:set_debuff(true)
            end
        end
    end
end

-- Hook into end of round
local end_round_original = end_round
function end_round()
    -- Call the original end_round
    end_round_original()

    if G.GAME.blind.boss then
		-- Remove antedebuff from all cards
		for _, area in pairs({G.hand, G.deck, G.jokers, G.discard}) do
			if area and area.cards then
				for _, card in ipairs(area.cards) do
					if card.antedebuff then
						card.antedebuff = false
					end
				end
			end
		end
	end
end

SMODS.Consumable {
    key = "furtive",
    set = "nightshift_cards",
	config = { extra = { used = 0 } },
    pos = { x = 0, y = 0 },
    atlas = "AbandoniaNightshift",
    cost = 4,
    discovered = false,
	hidden = false,
	soul_set = "Spectral",
	soul_rate = 0.35,
	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		return { vars = { (card and card.ability.extra.tags or self.config.extra.tags) } }
	end,
	
    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
		
		G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then

                    -- Create the legendary
                    local created_card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")

                    -- Add it to the deck and flip
                    created_card:add_to_deck()
                    created_card:start_materialize()
					created_card:set_edition({negative = true}, true)
                    G.jokers:emplace(created_card)
					
					if not created_card.ability.abn_perma_flipped then
						if created_card.facing == 'front' then
							created_card:flip()
						end
					created_card.ability.abn_perma_flipped = true
					end

                    return true
                end
            end,
        }))
		
    end,

    abn_artist_credits = {
        artist = "Inky",
    },
}

SMODS.Consumable {
    key = "intrusion",
    set = "nightshift_cards",
	config = { extra = { chips = 100, mult = 10 } },
    pos = { x = 1, y = 0 },
    atlas = "AbandoniaNightshift",
    cost = 4,
    discovered = false,
	hidden = false,
	soul_set = "Spectral",
	soul_rate = 0.35,
	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,

    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        -- Permaflip all current jokers
        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
			
			if not j.ability.abn_perma_flipped then
				if j.facing == 'front' then
					j:flip()
				end
			end
			j.ability.abn_perma_flipped = true
			-- Gain chips and mult
            j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
			j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
        end
    end,

    abn_artist_credits = {
        artist = "Inky",
    },
}

SMODS.Consumable {
    key = "aparition",
    set = "nightshift_cards",
    config = { extra = { odds = 10 } },
    pos = { x = 2, y = 0 },
    atlas = "AbandoniaNightshift",
    cost = 4,
    discovered = false,
    hidden = false,
    soul_set = "Spectral",
    soul_rate = 0.35,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
    
    can_use = function(self, card)
        -- Card is usable only if there is at least one empty slot
        return #G.consumeables.cards < G.consumeables.config.card_limit + 1
    end,

    use = function(self, card, area, copier)
        -- Determine how many slots are currently empty
        local space_available = G.consumeables.config.card_limit - #G.consumeables.cards
        
        -- Loop to fill every available slot
        for i = 1, space_available do
            local new_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'aparition_spawn')
            new_card:add_to_deck()
            G.consumeables:emplace(new_card)
        end
        
        -- Logic for the rare chance to increase Joker capacity
        if pseudorandom('aparition') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        end
    end,

    abn_artist_credits = {
        artist = "Inky",
    },
}