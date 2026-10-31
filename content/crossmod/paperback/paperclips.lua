PB_UTIL.Paperclip {
    key = 'indigo_clip',
    atlas = 'AbandoniaPaperclips',
    pos = { x = 0, y = 0 },
    badge_colour = HEX("3d138c"),

    loc_txt = {
        name = "Indigo Clip",
        label = "Indigo Clip",
        text = {
            "When scored {C:abn_modulate}+#1#{} Modulate",
            "for each {C:attention}Clip{} held in hand",
            "{C:inactive}Currently:{} {C:abn_modulate}+#2#{} {C:inactive}Modulate"
        }
    },

    config = {
        modulate = 5
    },

    attributes = {
        'modulate'
    },

    loc_vars = function(self, info_queue, card)
        local clips = PB_UTIL.count_paperclips {
            area = G.hand,
            exclude_highlighted = true
        }

        return {
            vars = {
                card.ability[self.key].modulate,
                card.ability[self.key].modulate * clips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local clips = PB_UTIL.count_paperclips { area = G.hand }

            if clips > 0 then
                return {
                    modulate = card.ability[self.key].modulate * clips
                }
            end
        end
    end
}

PB_UTIL.Paperclip {
    key = 'lavender_clip',
    atlas = 'AbandoniaPaperclips',
    pos = { x = 1, y = 0 },
    badge_colour = HEX("d699ef"),

    loc_txt = {
        name = "Lavender Clip",
        label = "Lavender Clip",
        text = {
            "When scored {C:abn_amperage}+#1#{} Amperage",
            "for each {C:attention}Clip{} scored this round",
            "{C:inactive}Currently:{} {C:abn_amperage}+#2#{} {C:inactive}Amperage"
        }
    },

    config = {
        amp = 1
    },

    attributes = {
        'amp'
    },

    loc_vars = function(self, info_queue, card)
        local clips = (G.GAME.paperback and G.GAME.paperback.round and G.GAME.paperback.round.scored_clips or 0) 

        return {
            vars = {
                card.ability[self.key].amp,
                card.ability[self.key].amp * clips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local clips = G.GAME.paperback.round.scored_clips + 1

            return {
                amp = card.ability[self.key].amp * clips
            }
        end
    end
}

PB_UTIL.Paperclip {
    key = 'lime_clip',
    atlas = 'AbandoniaPaperclips',
    pos = { x = 2, y = 0 },
    badge_colour = HEX("70ef26"),

    loc_txt = {
        name = "Lime Clip",
        label = "Lime Clip",
        text = {
            "When scored {C:attention}+#1#{} Asc. Power",
            "for each {C:attention}Clip{} held in hand",
            "{C:inactive}Currently:{} {C:gold}+#2#{} {C:inactive}Asc. Power"
        }
    },

    config = {
        asc = 0.25
    },

    attributes = {
        'asc'
    },

    loc_vars = function(self, info_queue, card)
        local clips = PB_UTIL.count_paperclips {
            area = G.hand,
            exclude_highlighted = true
        }

        return {
            vars = {
                card.ability[self.key].asc,
                card.ability[self.key].asc * clips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local clips = PB_UTIL.count_paperclips { area = G.hand }

            if clips > 0 then
                return {
                    asc = card.ability[self.key].asc * clips
                }
            end
        end
    end
}

PB_UTIL.Paperclip {
    key = 'cedar_clip',
    atlas = 'AbandoniaPaperclips',
    pos = { x = 3, y = 0 },
    badge_colour = HEX("823707"),

    loc_txt = {
        name = "Cedar Clip",
        label = "Cedar Clip",
        text = {
            "This {C:attention}Clip{} gains {C:abn_amperage}+#1#{} Amperage for every",
            "{C:planet}Planet{} {C:attention}Rank{} on the scored card",
            "{C:inactive}Currently:{} {C:abn_amperage}+#2#{} {C:inactive}Amperage"
        }
    },

    config = {
        amp = 0,
        amp_gain = 0.5
    },

    attributes = {
        'amp'
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability[self.key].amp_gain,
                card.ability[self.key].amp
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local rank_data = G.GAME.abn_rank_upgrades and G.GAME.abn_rank_upgrades[card.base.value]
            local planet_ranks = 0
            if type(rank_data) == 'table' then
                planet_ranks = rank_data.level or 0
            elseif type(rank_data) == 'number' then
                planet_ranks = rank_data
            end

            card.ability[self.key].amp = card.ability[self.key].amp + card.ability[self.key].amp_gain * planet_ranks

            if card.ability[self.key].amp > 0 then
                return {
                    amp = card.ability[self.key].amp
                }
            end
        end
    end
}

PB_UTIL.Paperclip {
    key = 'teal_clip',
    atlas = 'AbandoniaPaperclips',
    pos = { x = 4, y = 0 },
    badge_colour = HEX("b4ece3"),

    loc_txt = {
        name = "Teal Clip",
        label = "Teal Clip",
        text = {
            "This {C:attention}Clip{} gains {C:abn_modulate}+#1#{} Modulate for every",
            "{C:planet}Planet {C:attention}Rank{} on the scored card",
            "{C:inactive}Currently:{} {C:abn_modulate}+#2#{} {C:inactive}Modulate"
        }
    },

    config = {
        modulate = 0,
        modulate_gain = 0.5
    },

    attributes = {
        'modulate'
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability[self.key].modulate_gain,
                card.ability[self.key].modulate
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local rank_data = G.GAME.abn_rank_upgrades and G.GAME.abn_rank_upgrades[card.base.value]
            local planet_ranks = 0
            if type(rank_data) == 'table' then
                planet_ranks = rank_data.level or 0
            elseif type(rank_data) == 'number' then
                planet_ranks = rank_data
            end

            card.ability[self.key].modulate = card.ability[self.key].modulate + card.ability[self.key].modulate_gain * planet_ranks

            if card.ability[self.key].modulate > 0 then
                return {
                    modulate = card.ability[self.key].modulate
                }
            end
        end
    end
}

PB_UTIL.Paperclip {
    key = 'skyblue_clip',
    atlas = 'AbandoniaPaperclips',
    pos = { x = 0, y = 1 },
    badge_colour = HEX("8aceeb"),

    loc_txt = {
        name = "Skyblue Clip",
        label = "Skyblue Clip",
        text = {
            "{C:gold}+#1#{} Asc. Power {X:mult,C:white}X#2#{} Mult {X:chips,C:white}X#2#{} Chips",
            "per different {C:attention}Clip{} held in hand",
            "{C:inactive}Currently:{} {C:gold}+#3#{} {C:inactive}Asc. Power{} {X:mult,C:white}X#4#{} {C:inactive}Mult{} {X:chips,C:white}X#4#{} {C:inactive}Chips",
        }
    },

    config = {
        asc = 1,
        x_mod = 1
    },

    attributes = {
        'asc',
        'xmult',
        'xchips'
    },

    loc_vars = function(self, info_queue, card)
        local different_clips = {}
        local different_count = 0
        for _, held_card in ipairs(G.hand and G.hand.cards or {}) do
            local clip_key = PB_UTIL.has_paperclip(held_card)
            if clip_key and not held_card.highlighted and not held_card.debuff and not different_clips[clip_key] then
                different_clips[clip_key] = true
                different_count = different_count + 1
            end
        end

        return {
            vars = {
                card.ability[self.key].asc,
                card.ability[self.key].x_mod,
                card.ability[self.key].asc * different_count,
                1 + card.ability[self.key].x_mod * different_count
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local different_clips = {}
            local different_count = 0
            for _, held_card in ipairs(G.hand.cards) do
                local clip_key = PB_UTIL.has_paperclip(held_card)
                if clip_key and not held_card.debuff and not different_clips[clip_key] then
                    different_clips[clip_key] = true
                    different_count = different_count + 1
                end
            end

            if different_count > 0 then
                return {
                    asc = card.ability[self.key].asc * different_count,
                    xmult = 1 + card.ability[self.key].x_mod * different_count,
                    xchips = 1 + card.ability[self.key].x_mod * different_count
                }
            end
        end
    end
}