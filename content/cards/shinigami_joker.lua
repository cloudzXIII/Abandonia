local config = SMODS.current_mod.config


SMODS.Sound({
  key = 'music_bleach',
  path = 'music_bleach.ogg',
  pitch = 1,
  speed = 1,
  select_music_track = function(self)
    -- bleach theme
    if G.jokers then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j.config.center.key and j.config.center.key == 'j_abn_shinigami_joker' and config.Music ~= false then
          return 1e10
        end
      end
    end
  end
})

local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local is_from_joker = scored_card 
        and scored_card.ability 
        and scored_card.ability.set == 'Joker' 
        and scored_card.ability.name ~= 'j_abn_shinigami_joker'

    if is_from_joker then
        local shinigami_card = nil
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability and G.jokers.cards[i].ability.name == 'j_abn_shinigami_joker' then
                    if G.jokers.cards[i].ability.extra.active then
                        shinigami_card = G.jokers.cards[i]
                        break
                    end
                end
            end
        end

        if shinigami_card then
            local extra = shinigami_card.ability.extra
            local is_reversed = (extra.activations % 3 == 0) 

            if not is_reversed then
                if (key == "chips" or key == "chip_mod") and amount and amount > 0 then
                    extra.temp_x_chips = (extra.temp_x_chips or 1) + amount            
                elseif (key == "mult" or key == "mult_mod") and amount and amount > 0 then
                    extra.temp_x_mult = (extra.temp_x_mult or 1) + amount
                end
            else
                if (key == "chips" or key == "chip_mod") and amount and amount > 0 then
                    extra.x_chips = (extra.x_chips or 1) + amount
                    card_eval_status_text(shinigami_card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.BLUE })
                
                elseif (key == "mult" or key == "mult_mod") and amount and amount > 0 then
                    extra.x_mult = (extra.x_mult or 1) + amount
                    card_eval_status_text(shinigami_card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.RED })
                end
            end
        end
    end

    return scie(effect, scored_card, key, amount, from_edition)
end

SMODS.Joker {
    key = 'shinigami_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet26',
    pos = { x = 3, y = 5 },
    cost = 10,
    discovered = false,
    blueprint_compat = false,

    config = { 
        extra = { 
            cost = 5, 
            active = false, 
            x_chips = 1, 
            x_mult = 1, 
			temp_x_mult = 1,
			temp_x_chips = 1,
            activations = 0 
        } 
    },

    abn_use_config = { colour = G.C.DARK_EDITION, text = "USE" },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.cost,
                card.ability.extra.x_chips,
                card.ability.extra.x_mult,
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.activations
            } 
        }
    end,

    can_use = function(self, card)
        return not card.ability.extra.active and G.GAME.dollars >= card.ability.extra.cost
    end,

    use = function(self, card)
        ease_dollars(-card.ability.extra.cost)
        card.ability.extra.active = true
        card.ability.extra.activations = card.ability.extra.activations + 1
        
        local is_reversed = (card.ability.extra.activations % 3 == 0)
        local status_msg = is_reversed and "Bankai!" or "Roar, Shin-Zantetsuken!"

        card_eval_status_text(card, 'extra', nil, nil, nil, { message = status_msg, colour = G.C.RED })
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
				xmult = card.ability.extra.temp_x_mult + card.ability.extra.x_mult -1,
				xchips = card.ability.extra.temp_x_chips + card.ability.extra.x_chips -1,
			}
        end
		
		if context.final_scoring_step then
			card.ability.extra.active = false
			card.ability.extra.temp_x_mult = 1
			card.ability.extra.temp_x_chips = 1
		end
		
		if context.end_of_round then
			card.ability.extra.activations = 0
		end
    end,

    abn_artist_credits = {
        artist = "Comkyel"
    },
}