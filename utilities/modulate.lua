SMODS.Sound{
    key = "sfx_modulate",
    path = "modulate.ogg",
}
SMODS.Sound{
    key = "sfx_xmodulate",
    path = "modulate.ogg",
}

local MOD_COLOUR = HEX("ffa300")


SMODS.Scoring_Parameter({
    key = 'modulate',
    default_value = 1,
    colour = MOD_COLOUR,
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
        local scaledown = 0.70
        local w = 1.65
        local side_w = 0.68
        local h = 0.95
        local scale = 0.38

        return {
            n = G.UIT.R, config = {align = "cm", minh = 1, padding = 0.04}, nodes = {
                {n = G.UIT.C, config = {align = 'cm'}, nodes = { 
                    {n = G.UIT.R, config = {align = 'cm', id = 'hand_abn_modulate'}, nodes = {
                        SMODS.GUI.score_container({
                            type = 'abn_modulate',
                            align = 'cm',
                            w = side_w,
                            h = h * scaledown,
                            scale = scale * 0.75 * scaledown
                        })
                    }},
                }},
                {n = G.UIT.C, config = {align = "cm", id = 'hand_modulate_operator'}, nodes = {
                    {n = G.UIT.T, config = {text = "X", scale = scale * 1.15 * scaledown, colour = MOD_COLOUR, shadow = true}},
                }},
                {n = G.UIT.C, config = {align = 'cm'}, nodes = { 
                    {n = G.UIT.R, config = {align = 'cm', id = 'hand_chips'}, nodes = {
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
                {n = G.UIT.C, config = {align = 'cm'}, nodes = { 
                    SMODS.GUI.operator(scale * scaledown)
                }},
                {n = G.UIT.C, config = {align = 'cm'}, nodes = { 
                    {n = G.UIT.R, config = {align = 'cm', id = 'hand_mult'}, nodes = {
                        SMODS.GUI.score_container({
                            type = 'mult',
                            align = 'cl',
                            w = w * scaledown,
                            h = h * scaledown,
                            scale = scale * scaledown,
                        })
                    }},
                }},
                {n = G.UIT.C, config = {align = "cm", id = 'hand_amp_operator'}, nodes = {
                    {n = G.UIT.T, config = {text = "X", scale = scale * 1.15 * scaledown, colour = HEX("ff77a8"), shadow = true}},
                }},
                {n = G.UIT.C, config = {align = 'cm'}, nodes = { 
                    {n = G.UIT.R, config = {align = 'cm', id = 'hand_abn_amp'}, nodes = {
                        SMODS.GUI.score_container({
                            type = 'abn_amp',
                            align = 'cm',
                            w = side_w,
                            h = h * scaledown,
                            scale = scale * 0.75 * scaledown
                        })
                    }},
                }},
            }
        }
    end
}


local start_run_ref = Game.start_run
function Game:start_run(args)
    local ret = start_run_ref(self, args)
    SMODS.set_scoring_calculation("abn_modulate")
    return ret
end