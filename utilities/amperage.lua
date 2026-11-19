loc_colour()
G.C.ABN_AMPERAGE = HEX("ff77a8")
G.ARGS.LOC_COLOURS["abn_amperage"] = G.C.ABN_AMPERAGE

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
  colour = G.C.ABN_AMPERAGE,
  calculation_keys = {'amp', 'xamp'},
    calc_effect = function(self, effect, scored_card, key, amount, from_edition)
		if not SMODS.Calculation_Controls.chips then return end
	    if key == 'amp' and amount and amount ~= 0 then
	        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
	        self:modify(amount)
	        card_eval_status_text(scored_card, 'extra', nil, percent, nil,
	            {sound = "abn_sfx_amp", message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {amount..' Amp'}}, colour = self.colour})
	        return true
        end
        if key == 'xamp' and amount and amount ~= 1 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            self:modify(self.current * (amount) - self.current)
            card_eval_status_text(scored_card, 'extra', nil, percent, nil,
                {sound = "abn_sfx_xamp", message = localize{type = 'variable', key = amount >= 0 and 'a_chips' or 'a_chips_minus', vars = {'X'..amount..' Amp'}}, colour = self.colour})
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
    -- See utilities/modulate.lua for how the UI is defined.
}

local start_run_ref = Game.start_run
function Game:start_run(args)
    local ret = start_run_ref(self, args)
    SMODS.set_scoring_calculation("abn_amp")
    return ret
end
