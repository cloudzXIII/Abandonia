loc_colour()
G.C.ABN_MODULATE = HEX("ba46ec")
G.ARGS.LOC_COLOURS["abn_modulate"] = G.C.ABN_MODULATE

SMODS.Sound{
    key = "sfx_modulate",
    path = "modulate.ogg",
}
SMODS.Sound{
    key = "sfx_xmodulate",
    path = "modulate.ogg",
}
SMODS.Scoring_Parameter({
    key = 'modulate',
    default_value = 1,
    colour = G.C.ABN_MODULATE,
    calculation_keys = {'modulate', 'xmodulate'},
    calc_effect = function(self, effect, scored_card, key, amount, from_edition)
        if not SMODS.Calculation_Controls.chips then return end
        if key == 'modulate' and amount then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            self:modify(amount)
            card_eval_status_text(scored_card, 'extra', nil, percent, nil,
                {sound = "abn_sfx_modulate", message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {amount..' Mod'}}, colour = self.colour})
            return true
        end
        if key == 'xmodulate' and amount then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            self:modify(self.current * (amount) - self.current)
            card_eval_status_text(scored_card, 'extra', nil, percent, nil,
                {sound = "abn_sfx_xmodulate", message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {'X'..amount..' Mod'}}, colour = self.colour})
            return true
        end
    end
})
SMODS.Scoring_Calculation{
    key = "modulate",
    func = function(self, chips, mult, flames)
        local mod_val = SMODS.get_scoring_parameter(self.mod.prefix..'_modulate', flames)
		local amp_val = SMODS.get_scoring_parameter(self.mod.prefix..'_amp', flames)
        return mod_val * chips * mult * amp_val
    end,
    parameters = {SMODS.current_mod.prefix..'_modulate', 'chips', 'mult', SMODS.current_mod.prefix..'_amp'},
    replace_ui = function (self) 
        local w = 2
        local h = 1
        local scaledown = 0.6
		local scale = 0.4
            return
        {n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.05}, nodes={
            {n=G.UIT.C, config={align = "cm", minh = 1, padding = 0.05}, nodes={
                {n=G.UIT.R, config={align = 'cm'}, nodes = {
                    {n=G.UIT.R, config={align = 'cm', id = 'hand_chips'}, nodes={
                        SMODS.GUI.score_container({
                            type = 'chips',
                            text = 'chip_text',
                            align = 'cr',
                            w = w,
                            h = h,
                            scale = scale,
                            colour = G.C.UI_CHIPS
                        })
                    }},
                }},
                {n=G.UIT.R, config={align = 'cr', id = 'hand_abn_modulate', detailed_tooltip = {set = "Other", key = "abn_modulate_tooltip"}}, nodes={
                    SMODS.GUI.score_container({
                        type = 'abn_modulate',
                        align = 'cr',
                        w = w * scaledown,
                        h = h * scaledown,
                        scale = scale * scaledown,
                        colour = G.C.ABN_MODULATE
                    })
                }},
            }},
            {n=G.UIT.C, config={align = 'cm'}, nodes = { 
                SMODS.GUI.operator(scale)
            }},
            {n=G.UIT.C, config={align = 'cm', padding = 0.05}, nodes={
                {n=G.UIT.R, config={align = 'cm'}, nodes = { 
                    {n=G.UIT.R, config={align = 'cm', id = 'hand_mult'}, nodes={
                        SMODS.GUI.score_container({
                            type = 'mult',
                            align = 'cl',
                            w = w ,
                            h = h,
                            scale = scale,
                            colour = G.C.UI_MULT
                        })
                    }},
                }},
                {n=G.UIT.R, config={align = 'cl', id = 'hand_abn_amperage', detailed_tooltip = {set = "Other", key = "abn_amperage_tooltip"}}, nodes={
                    SMODS.GUI.score_container({
                        type = 'abn_amp',
                        align = 'cl',
                        w = w * scaledown,
                        h = h * scaledown,
                        scale = scale * scaledown,
                        colour = G.C.ABN_AMPERAGE
                    })
                }},
            }},
        }}
    end
}
local start_run_ref = Game.start_run
function Game:start_run(args)
    local ret = start_run_ref(self, args)
    SMODS.set_scoring_calculation("abn_modulate")
    return ret
end
