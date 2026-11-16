ABN = ABN or {}

ABN.planet_edition_blacklist = {}

function ABN.apply_planet_edition(source_card, hand, levels, instant)
    if not source_card or not source_card.edition then return end
    local edition_key = source_card.edition.key
    if ABN.planet_edition_blacklist[edition_key] then return end

    local edition_center = G.P_CENTERS[edition_key]
    local hand_data = G.GAME.hands[hand]
    if not edition_center or not hand_data then return end

    levels = (type(levels) == 'number') and levels or 1
    local edition_config = edition_center.config or {}

    local steps = {
        { parameter = 'chips', kind = 'add',   amount = (edition_config.chips or 0) * levels,   sound = 'chips1' },
        { parameter = 'mult',  kind = 'add',   amount = (edition_config.mult or 0) * levels,    sound = 'multhit1' },
        { parameter = 'chips', kind = 'times', amount = (edition_config.x_chips or 1) ^ levels, sound = 'xchips' },
        { parameter = 'mult',  kind = 'times', amount = (edition_config.x_mult or 1) ^ levels,  sound = 'multhit2' },
    }

    local applied_any_step = false
    for _, step in ipairs(steps) do
        local is_active = (step.kind == 'add' and step.amount ~= 0) or (step.kind == 'times' and step.amount ~= 1)
        if is_active then
            applied_any_step = true

            if step.kind == 'add' then
                hand_data[step.parameter] = hand_data[step.parameter] + step.amount
            else
                hand_data[step.parameter] = hand_data[step.parameter] * step.amount
            end

            if not instant then
                local status_text
                if step.kind == 'add' then
                    status_text = (step.amount > 0 and '+' or '') .. number_format(step.amount)
                else
                    status_text = 'X' .. number_format(step.amount)
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        play_sound(step.sound)
                        source_card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = true
                        return true
                    end
                }))
                update_hand_text({ delay = 0.9 }, { [step.parameter] = status_text, StatusText = true })
            end
        end
    end

    if edition_center.abn_planet_apply then
        edition_center:abn_planet_apply(source_card, hand, levels, instant)
    end

    if applied_any_step and not instant then
        update_hand_text({ delay = 0 }, { chips = hand_data.chips, mult = hand_data.mult, level = hand_data.level })
    end
end

for _, edition_name in ipairs({ 'foil', 'holo', 'polychrome' }) do
    SMODS.Edition:take_ownership(edition_name, {
        loc_vars = function(self, info_queue, card)
            local edition_config = self.config or {}
            local main_value = edition_config.chips or edition_config.mult or edition_config.x_mult or edition_config.x_chips
            if card and card.ability and card.ability.set == 'Planet' then
                return { key = 'e_' .. edition_name .. '_planet', vars = { main_value } }
            end
            return { vars = { main_value } }
        end
    }, true)
end

-- Tooltips
local abn_previous_process_loc_text = SMODS.current_mod and SMODS.current_mod.process_loc_text
if SMODS.current_mod then
    SMODS.current_mod.process_loc_text = function()
        if abn_previous_process_loc_text then abn_previous_process_loc_text() end
        SMODS.process_loc_text(G.localization.descriptions.Edition, 'e_foil_planet', {
            name = "Foil",
            text = { "Leveled hand", "gains {C:chips}+#1#{} Chips" },
        })
        SMODS.process_loc_text(G.localization.descriptions.Edition, 'e_holo_planet', {
            name = "Holographic",
            text = { "Leveled hand", "gains {C:mult}+#1#{} Mult" },
        })
        SMODS.process_loc_text(G.localization.descriptions.Edition, 'e_polychrome_planet', {
            name = "Polychrome",
            text = { "Leveled hand's Mult is", "multiplied by {X:mult,C:white}X#1#{}" },
        })
    end
end