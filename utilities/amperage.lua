SMODS.Sound{
    key = "sfx_amp",
    path = "amp.ogg",
}
SMODS.Sound{
    key = "sfx_xamp",
    path = "amp.ogg",
}

SMODS.Scoring_Parameter({
  key = 'amp',
  default_value = G.GAME and G.GAME.ampvalue or 1,
  colour = HEX("ff77a8"),
  calculation_keys = {'amp', 'xamp'},
    calc_effect = function(self, effect, scored_card, key, amount, from_edition)
		if not SMODS.Calculation_Controls.chips then return end
	    if key == 'amp' and amount then
	        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
	        self:modify(amount)
	        card_eval_status_text(scored_card, 'extra', nil, percent, nil,
	            {sound = "abn_sfx_amp", message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {amount..' Amp'}}, colour = self.colour})
	        return true
        end
        if key == 'xamp' and amount then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            self:modify(self.current * (amount) - self.current)
            card_eval_status_text(scored_card, 'extra', nil, percent, nil,
                {sound = "abn_sfx_xamp", message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {'X'..amount..' Amp'}}, colour = self.colour})
            return true
        end
    end
})

SMODS.Scoring_Calculation{
    key = "amp",
    func = function(self, chips, mult, flames)
	    return chips * mult * SMODS.get_scoring_parameter(self.mod.prefix..'_amp', flames)
	end,
    parameters = {'chips', 'mult', SMODS.current_mod.prefix..'_amp'},
    replace_ui = function (self) 
        local scaledown = 0.75
        local w = 2
        local h = 1
		local scale = 0.4
        return
        {n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.1}, nodes={
            {n=G.UIT.C, config={align = 'cm'}, nodes = { 
                {n=G.UIT.R, config={align = 'cm', id = 'hand_chips'}, nodes={
                    SMODS.GUI.score_container({
                        type = 'chips',
                        text = 'chip_text',
                        align = 'cr',
                        w = w * scaledown,
                        h = h * scaledown,
						scale = scale * scaledown,
                    })
                }},
            }},
            {n=G.UIT.C, config={align = 'cm'}, nodes = { 
                SMODS.GUI.operator(scale * scaledown)
            }},
            {n=G.UIT.C, config={align = 'cm'}, nodes = { 
                {n=G.UIT.R, config={align = 'cm', id = 'hand_mult'}, nodes={
                    SMODS.GUI.score_container({
                        type = 'mult',
                        align = 'cl',
                        w = w * scaledown,
                        h = h * scaledown,
						scale = scale * scaledown,
                    })
                }},
            }},
			{n=G.UIT.C, config={align = "cl", id = 'hand_operator_container'}, nodes={
				{n=G.UIT.T, config={text = "X", scale = scale * 1.25 * scaledown, colour = HEX("ff77a8"), shadow = true}},
			}},
            {n=G.UIT.C, config={align = 'cm'}, nodes = { 
			{n=G.UIT.R, config={align = 'cl', id = 'hand_abn_amp'}, nodes={
				SMODS.GUI.score_container({
					type = 'abn_amp',
					align = 'cl',
					w = 0.75,
					h = h * scaledown,
					scale = scale * 0.75 * scaledown
				})
			}},
        }},
	}}
    end
}

local start_run_ref = Game.start_run
function Game:start_run(args)
    local ret = start_run_ref(self, args)
    SMODS.set_scoring_calculation("abn_amp")
    return ret
end

--[[
SMODS.Joker {
  key = 'test_joker',
  rarity = 1,
  pos = { x = 0, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
	if context.joker_main then
        return {
			amp = 4,
            card = self
		}
    end
  end,
}
--]]