SMODS.Joker {
    key = 'maestro_joker',
    atlas = 'ABNJokerSheet12',
    pos = { x = 1, y = 2 },
    rarity = 2,
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            charge = 1,
            amp = 0,
            amp_gain = 2,
            modulate = 0,
            modulate_gain = 2,
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.charge,
            card.ability.extra.amp_gain,
            card.ability.extra.modulate_gain,
            card.ability.extra.amp,
            card.ability.extra.modulate,
        } }
    end,

    update = function(self, card, dt)
        if card.area ~= G.jokers or card.debuffed or not G.consumeables then return end
        local id = tostring(card.sort_id)
        for _, c in ipairs(G.consumeables.cards) do
            if c.config.center.set == "tonality"
                and c.ability.extra and c.ability.extra.uses then
                c.ability.abn_maestro_granted = c.ability.abn_maestro_granted or {}
                if not c.ability.abn_maestro_granted[id] then
                    c.ability.extra.uses = c.ability.extra.uses + card.ability.extra.charge
                    c.ability.abn_maestro_granted[id] = card.ability.extra.charge
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if not G.consumeables then return end
        local id = tostring(card.sort_id)
        for _, c in ipairs(G.consumeables.cards) do
            local granted = c.ability.abn_maestro_granted and c.ability.abn_maestro_granted[id]
            if granted and c.ability.extra and c.ability.extra.uses then
                c.ability.abn_maestro_granted[id] = nil
                c.ability.extra.uses = math.max(0, c.ability.extra.uses - granted)

                if c.ability.extra.uses <= 0 and (c.ability.extra.active_charges or 0) <= 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            c:start_dissolve()
                            return true
                        end
                    }))
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.post_trigger and not context.blueprint then
            local other = context.other_card or context.other_joker
            if other and other ~= card
                and other.ability and other.ability.set == 'Joker' then
                for k, v in pairs(other.ability) do
                    if v and FN_is_aura(k) then
                        card.ability.extra.amp = card.ability.extra.amp + card.ability.extra.amp_gain
                        return {
                            message = localize('k_upgrade_ex'),
                            colour = HEX("ff77a8"),
                        }
                    end
                end
            end
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            local other = context.other_card
            if other then
                for k, v in pairs(other.ability) do
                    if v and FN_is_aura(k) then
                        card.ability.extra.modulate = card.ability.extra.modulate + card.ability.extra.modulate_gain
                        return {
                            message = localize('k_upgrade_ex'),
                            colour = HEX("ba46ec"),
                            message_card = card,
                        }
                    end
                end
            end
        end

        if context.joker_main then
            return {
                modulate = card.ability.extra.modulate,
                amp = card.ability.extra.amp,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Mini Bit",
    },
}