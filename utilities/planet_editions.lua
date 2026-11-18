
ABN = ABN or {}

function ABN.has_planet_transfer()
    return next(SMODS.find_card('j_abn_rudimentary_joker')) ~= nil
end

ABN.planet_edition_blacklist = {}

ABN.planet_edition_effects = {
    e_negative = { chips = 100 },
    e_abn_gloss = { chips = 500 },
    e_abn_pearlescent = { dollars = 1, chips = 30, mult = 20 },
    e_abn_iridescent = { chips = 20, mult = 30 },
    e_abn_bit_rot = { mult = 100 },

    e_abn_reel = { mult = 200 },
    e_abn_chthonian = { chips = 50, mult = 50 },
    e_abn_abandond = { dollars = 2, chips = 10, mult = 5 },
    e_abn_collodion = { chips = 20, mult = 10 },
    e_abn_reversal = { chips = 10, mult = 20 },
    e_abn_bright = { chips = 2, mult = 8 },
    e_abn_opaque = { chips = 8, mult = 2 },
    e_abn_vintage = { dollars = 1, chips = 2, mult = 2 },
    e_abn_chromatic = { dollars = 2, chips = 100, mult = 80 },

    e_cutout_abstract = { score = 200 },
    e_cutout_amp = { amp = 0.10, modulate = 0.10 },
    e_cutout_distortion = { chips = 10, mult = 15, asc = 0.10 },
    e_cutout_energy = { asc = 0.25 },
    e_cutout_inverted = { chips = 40, mult = 10 },
}

ABN.planet_edition_effect_order = {
    'dollars', 'chips', 'mult', 'x_mult',
    'score', 'amp', 'modulate', 'asc'
}

function ABN.planet_edition_loc_vars(edition_key, card)
    if not ABN.has_planet_transfer() then return nil end

    if not card or not card.ability or card.ability.set ~= 'Planet' then
        return nil
    end

    local effect = ABN.planet_edition_effects[edition_key]
    if not effect then return nil end

    local effect_vars = {}

    for _, effect_name in ipairs(ABN.planet_edition_effect_order) do
        if effect[effect_name] then
            effect_vars[#effect_vars + 1] = effect[effect_name]
        end
    end

    return {
        key = edition_key .. (card.ability.rank and '_rank_planet' or '_planet'),
        vars = effect_vars,
    }
end

function ABN.apply_planet_edition(source_card, target_key, levels, instant, is_rank)
    if not ABN.has_planet_transfer() then return end

    if not source_card or not source_card.edition then return end
    if not source_card.ability or source_card.ability.set ~= 'Planet' then return end

    local edition_key = source_card.edition.key
    if ABN.planet_edition_blacklist[edition_key] then return end

    local edition_center = G.P_CENTERS[edition_key]
    local target_data

    if is_rank then
        target_data = G.GAME.abn_rank_upgrades[target_key]
    else
        target_data = G.GAME.hands[target_key]
    end

    if not edition_center or not target_data then return end

    levels = (type(levels) == 'number') and levels or 1
    local edition_config = ABN.planet_edition_effects[edition_key] or edition_center.config or {}

    local steps = {
        { parameter = 'chips', kind = 'add', amount = (edition_config.chips or 0) * levels, sound = 'chips1' },
        { parameter = 'mult', kind = 'add', amount = (edition_config.mult or 0) * levels, sound = 'multhit1' },
        { parameter = 'score', kind = 'add', amount = (edition_config.score or 0) * levels, sound = 'chips1' },
        { parameter = 'amp', kind = 'add', amount = (edition_config.amp or 0) * levels, sound = 'multhit1' },
        { parameter = 'modulate', kind = 'add', amount = (edition_config.modulate or 0) * levels, sound = 'multhit1' },
        { parameter = 'asc', kind = 'add', amount = (edition_config.asc or 0) * levels, sound = 'multhit1' },
        { parameter = 'chips', kind = 'times', amount = (edition_config.x_chips or 1) ^ levels, sound = 'xchips' },
        { parameter = 'mult', kind = 'times', amount = (edition_config.x_mult or 1) ^ levels, sound = 'multhit2' },
    }

    local applied_any_step = false

    for _, step in ipairs(steps) do
        local is_active = (step.kind == 'add' and step.amount ~= 0) or (step.kind == 'times' and step.amount ~= 1)

        if is_active then
            applied_any_step = true

            if step.kind == 'add' then
                target_data[step.parameter] = (target_data[step.parameter] or 0) + step.amount
            else
                target_data[step.parameter] = (target_data[step.parameter] or 0) * step.amount
            end

            if is_rank then
                local level_base = target_data['l_' .. step.parameter] or 0
                target_data['s_' .. step.parameter] = target_data[step.parameter]
                    - level_base * (target_data.level - 1)
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

                if step.parameter == 'chips' or step.parameter == 'mult' then
                    update_hand_text({ delay = 0.9 }, {
                        [step.parameter] = status_text,
                        StatusText = true
                    })
                end
            end
        end
    end

    local dollars_amount = (edition_config.dollars or 0) * levels

    if dollars_amount ~= 0 then
        target_data.abn_dollars = (target_data.abn_dollars or 0) + dollars_amount
    end

    if edition_center.abn_planet_apply then
        edition_center:abn_planet_apply(source_card, target_key, levels, instant, is_rank)
    end

    if applied_any_step and not instant then
        update_hand_text({ delay = 0 }, {
            chips = target_data.chips,
            mult = target_data.mult,
            level = target_data.level
        })
    end
end

for _, edition_name in ipairs({ 'foil', 'holo', 'polychrome' }) do
    SMODS.Edition:take_ownership(edition_name, {
        loc_vars = function(self, info_queue, card)
            local edition_config = self.config or {}
            local main_value = edition_config.chips or edition_config.mult or edition_config.x_mult or edition_config.x_chips

            if ABN.has_planet_transfer() and card and card.ability and card.ability.set == 'Planet' then
                local key_suffix = card.ability.rank and '_rank_planet' or '_planet'
                return {
                    key = 'e_' .. edition_name .. key_suffix,
                    vars = { main_value }
                }
            end

            return { vars = { main_value } }
        end
    }, true)
end

-- Tooltips
local abn_previous_process_loc_text = SMODS.current_mod and SMODS.current_mod.process_loc_text

if SMODS.current_mod then
    SMODS.current_mod.process_loc_text = function()
        if abn_previous_process_loc_text then
            abn_previous_process_loc_text()
        end

        G.localization.descriptions.Edition = G.localization.descriptions.Edition or {}
        local edition_loc = G.localization.descriptions.Edition

        local function register_planet_tooltip(key, name, target, effect)
            local effect_texts = {}

            for _, effect_name in ipairs(ABN.planet_edition_effect_order) do
                local amount = effect[effect_name]

                if amount then
                    local placeholder = '#' .. (#effect_texts + 1) .. '#'

                    if effect_name == 'dollars' then
                        effect_texts[#effect_texts + 1] = '{C:money}+$' .. placeholder .. '{}'
                    elseif effect_name == 'chips' then
                        effect_texts[#effect_texts + 1] = '{C:chips}+' .. placeholder .. '{} Chips'
                    elseif effect_name == 'mult' then
                        effect_texts[#effect_texts + 1] = '{C:mult}+' .. placeholder .. '{} Mult'
                    elseif effect_name == 'x_mult' then
                        effect_texts[#effect_texts + 1] = '{X:mult,C:white}X' .. placeholder .. '{} Mult'
                    elseif effect_name == 'score' then
                        effect_texts[#effect_texts + 1] = '{C:purple}+' .. placeholder .. '{} Score'
                    elseif effect_name == 'amp' then
                        effect_texts[#effect_texts + 1] = '{C:abn_amperage}+' .. placeholder .. '{} Amperage'
                    elseif effect_name == 'modulate' then
                        effect_texts[#effect_texts + 1] = '{C:abn_modulate}+' .. placeholder .. '{} Modulate'
                    elseif effect_name == 'asc' then
                        effect_texts[#effect_texts + 1] = '{C:gold}+' .. placeholder .. '{} Asc. Power'
                    end
                end
            end

            local prefix = target == 'hand' and 'Leveled hand gains' or 'Leveled rank gains'

            SMODS.process_loc_text(edition_loc, key, {
                name = name,
                text = {
                    prefix,
                    table.concat(effect_texts, ', ')
                }
            })
        end

        register_planet_tooltip('e_foil_planet', 'Foil', 'hand', { chips = 50 })
        register_planet_tooltip('e_holo_planet', 'Holographic', 'hand', { mult = 10 })
        register_planet_tooltip('e_polychrome_planet', 'Polychrome', 'hand', { x_mult = 1.5 })

        register_planet_tooltip('e_foil_rank_planet', 'Foil', 'rank', { chips = 50 })
        register_planet_tooltip('e_holo_rank_planet', 'Holographic', 'rank', { mult = 10 })
        register_planet_tooltip('e_polychrome_rank_planet', 'Polychrome', 'rank', { x_mult = 1.5 })

        local edition_names = {
            e_negative = 'Negative',
            e_abn_gloss = 'Gloss',
            e_abn_pearlescent = 'Pearlescent',
            e_abn_iridescent = 'Iridescent',
            e_abn_bit_rot = 'Bit Rot',

            e_abn_reel = 'Reel',
            e_abn_chthonian = 'Chthonian',
            e_abn_abandond = 'Abandoned',
            e_abn_collodion = 'Collodion',
            e_abn_reversal = 'Reversal',
            e_abn_bright = 'Bright',
            e_abn_opaque = 'Opaque',
            e_abn_vintage = 'Vintage',
            e_abn_chromatic = 'Chromatic',

            e_cutout_abstract = 'Abstract',
            e_cutout_amp = 'Transduced',
            e_cutout_distortion = 'Distortion',
            e_cutout_energy = 'Volcanic',
            e_cutout_inverted = 'Inverted',
        }

        for edition_key, effect in pairs(ABN.planet_edition_effects) do
            local name = edition_names[edition_key] or edition_key

            register_planet_tooltip(
                edition_key .. '_planet',
                name,
                'hand',
                effect
            )

            register_planet_tooltip(
                edition_key .. '_rank_planet',
                name,
                'rank',
                effect
            )
        end
    end
end
