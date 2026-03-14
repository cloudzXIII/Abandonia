local unkeywords = {
    perish_tally = true,
    id = true,
    suit_nominal = true,
    base_nominal = true,
    face_nominal = true,
    qty = true,
    h_x_chips = true,
    d_size = true,
    h_size = true,
    selected_d6_face = true,
    cry_hook_id = true,
    colour = true,
    times_played = true,
    extra_slots_used = true,
    card_limit = true,
    yorick_discards = true,
    discards = true,
    Xmult = true,
    x_mult = true,
    x_chips = true
}

local function multiply_table_values(tbl, multiplier, skip_key)
    for key, value in pairs(tbl) do
        if skip_key and unkeywords[key] then
        elseif type(value) == "number" then
            if value ~= 0 and value ~= 1 then
                tbl[key] = value * multiplier
            end
        elseif type(value) == "table" then
            multiply_table_values(value, multiplier, true)
        end
    end
end

ABN.mod_card_values = function(card, args)
    if card.ability then
        multiply_table_values(card.ability, args.multiplier, true)
    end

    if card.base then
        multiply_table_values(card.base, args.multiplier, true)
    end
    return true
end
