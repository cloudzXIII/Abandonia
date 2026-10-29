SMODS.Joker {
    key = 'visual_illustration_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet12',
    pos = { x = 0, y = 5 },
    cost = 6,
    blueprint_compat = false,
    discovered = false,

    config = { extra = { uses = 1, uses_add = 1, create = 2 } },

    abn_artist_credits = {
        artist = "Nevermade"
    },

    abn_use_config = { colour = G.C.ORANGE, text = "USE" },

    get_targets = function(self, card)
        local targets = {}
        for _, owned_joker in ipairs(G.jokers.cards) do
            if owned_joker ~= card
                and owned_joker.config.center.original_mod
                and not SMODS.is_eternal(owned_joker)
                and not owned_joker.getting_sliced then
                targets[#targets + 1] = owned_joker
            end
        end
        return targets
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
        return {
            vars = {
                card.ability.extra.uses,
                card.ability.extra.uses_add,
                card.ability.extra.create,
            }
        }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0 and #self:get_targets(card) > 0
    end,

    use = function(self, card)
        local targets = self:get_targets(card)
        if #targets == 0 then return end

        card.ability.extra.uses = card.ability.extra.uses - 1
        card:juice_up()

        local target = pseudorandom_element(targets, pseudoseed('abn_visual_illustration'))

        local rarity_order = { 1, 2, 3, 'abn_SuperRare', 'abn_ParalellRare', 4 }
        local target_position = 1
        for position, rarity in ipairs(rarity_order) do
            if rarity == target.config.center.rarity then target_position = position end
        end

        local vanilla_pool = {}
        for position = math.max(target_position - 1, 1), 1, -1 do
            for _, center in pairs(G.P_CENTER_POOLS.Joker) do
                if center.rarity == rarity_order[position] and not center.original_mod
                    and not (G.GAME.banned_keys and G.GAME.banned_keys[center.key]) then
                    vanilla_pool[#vanilla_pool + 1] = center.key
                end
            end
            if #vanilla_pool > 0 then break end
        end

        local free_slots = G.jokers.config.card_limit - (#G.jokers.cards - 1)
        local to_create = math.min(card.ability.extra.create, free_slots, #vanilla_pool)

        SMODS.destroy_cards(target)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                for _ = 1, to_create do
                    local pick = pseudorandom_element(vanilla_pool, pseudoseed('abn_visual_illustration_new'))
                    SMODS.add_card({ key = pick, edition = 'e_abn_gloss' })
                    if #vanilla_pool > 1 then
                        for i, key in ipairs(vanilla_pool) do
                            if key == pick then table.remove(vanilla_pool, i) break end
                        end
                    end
                end
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
            card.ability.extra.uses = card.ability.extra.uses + card.ability.extra.uses_add
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ATTENTION,
                card = card
            }
        end
    end,
}