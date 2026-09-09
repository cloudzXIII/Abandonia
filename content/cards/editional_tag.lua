local ref_apply_to_run = Tag.apply_to_run

function Tag:apply_to_run(_context)
    if not self.triggered and self.config.type == _context.type and _context.type == 'store_joker_modify' then
        local card = _context.card
        if card and not card.edition and not card.temp_edition and card.ability and card.ability.set == 'Joker' then
            
            -- Intercept Card:set_edition to catch any custom or base game edition
            local ref_set_edition = card.set_edition
            card.set_edition = function(card_self, _edition, _immediate)
                local edition_name = "Unknown"
                if type(_edition) == "table" then
                    for k, v in pairs(_edition) do
                        if v and k ~= 'type' then
                            edition_name = k
                            break
                        end
                    end
                elseif type(_edition) == "string" then
                    edition_name = _edition
                end

                -- Check if Editional Tag is present AND has an edition assigned
                local editional_jokers = SMODS.find_card("j_abn_editional_tag")
                local has_edition_tag = false

                for _, tag_joker in ipairs(editional_jokers) do
                    if tag_joker.edition then
                        has_edition_tag = true
                        break
                    end
                end

                if has_edition_tag then
                    if G.playing_cards then
                        local discontinued_cards = {}
                        for _, c in ipairs(G.playing_cards) do
                            if c.config and c.config.center_key == 'm_abn_discontinued' and not c.edition then
                                table.insert(discontinued_cards, c)
                            end
                        end

                        if #discontinued_cards > 0 then
                            local target_card = pseudorandom_element(discontinued_cards, pseudoseed('editional_tag_apply'))
                            if target_card then
                                target_card:set_edition(_edition, true)
                            end
                        end
                    end
                end

                card.set_edition = ref_set_edition
                return ref_set_edition(card_self, _edition, _immediate)
            end

            return ref_apply_to_run(self, _context)
        end
    end

    return ref_apply_to_run(self, _context)
end


SMODS.Joker {
    key = 'editional_tag',
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet24', 
    pos = { x = 5, y = 3 },
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            xmult = 1,
            xmultadd = 0.25,
            mult = 1,
            dollars = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultadd,
                card.ability.extra.mult,
                card.ability.extra.dollars,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.tag_added then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd

            local tag = context.tag_added
            local tag_def = tag and tag.key and SMODS.Tags[tag.key]
            local is_modded = (tag and tag.config and tag.config.mod) or (tag_def and tag_def.mod and tag_def.mod.id ~= "SMODS")

            if is_modded and G.playing_cards then
                for _, c in ipairs(G.playing_cards) do
                    if c.config.center_key == 'm_abn_discontinued' then
                        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
                        c.ability.perma_p_dollars = (c.ability.perma_p_dollars or 0) + card.ability.extra.dollars
                    end
                end
            end

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                card = card
            }
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

    abn_artist_credits = {
        artist = "Patitofi8",
    },
}