loc_colour()
G.C.PARADOX = HEX("1bab90")
G.C.PARADOX_SECONDARY = HEX("983933")
G.ARGS.LOC_COLOURS["abn_Paradox"] = G.C.PARADOX

SMODS.ConsumableType {
  key = "paradox",
  collection_rows = { 5, 5 },
  shop_rate = 4,
  primary_colour = G.C.PARADOX,
  secondary_colour = G.C.PARADOX_SECONDARY,
  text_colour = HEX("1bab90"),
}


SMODS.Consumable {
    key = "laplace",
    set = "paradox",
    config = {},
    pos = { x = 0, y = 0 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
        return { vars = {} }
    end,

    can_use = function(self, card)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        if is_even then
            return G.hand and G.hand.cards and #G.hand.cards > 0
        else
            return G.playing_cards and #G.playing_cards > 0
        end
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        if is_even then
            -- Even
            local target_cards = {}
            for _, c in ipairs(G.hand.cards) do
                target_cards[#target_cards + 1] = c
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))

            for i, c in ipairs(target_cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if c.facing == 'front' then
                            c:flip()
                        end
                        c.ability.abn_perma_flipped = true
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        else
            -- Odd
            local eligible_cards = {}
            for _, c in ipairs(G.playing_cards) do
                eligible_cards[#eligible_cards + 1] = c
            end

            pseudoshuffle(eligible_cards, pseudoseed('laplace'))

            local target_count = math.min(5, #eligible_cards)
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))

            for i = 1, target_count do
                local c = eligible_cards[i]
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if c.facing == 'front' then
                            c:flip()
                        end
                        c.ability.abn_perma_flipped = true
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "maxwell",
    set = "paradox",
    config = {
        extra = {
            chips = 5,
            mult = 2
        }
    },
    pos = { x = 1, y = 0 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.chips, 
                card.ability.extra.mult 
            } 
        }
    end,

    can_use = function(self, card)
        return G.hand and G.hand.cards and #G.hand.cards > 0
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)
        local vanilla_suits = { "Spades", "Hearts", "Clubs", "Diamonds" }

        local target_cards = {}
        for _, c in ipairs(G.hand.cards) do
            local is_vanilla = false
            for _, suit_name in ipairs(vanilla_suits) do
                if c:is_suit(suit_name) then
                    is_vanilla = true
                    break
                end
            end

            if is_even and is_vanilla then
                target_cards[#target_cards + 1] = c
            elseif not is_even and not is_vanilla then
                target_cards[#target_cards + 1] = c
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        for _, c in ipairs(target_cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if is_even then
                        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
                        card_eval_status_text(c, 'extra', nil, nil, nil, {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS
                        })
                    else
                        c.ability.perma_mult = (c.ability.perma_mult or 0) + card.ability.extra.mult
                        card_eval_status_text(c, 'extra', nil, nil, nil, {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.MULT
                        })
                    end
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "schrodinger",
    set = "paradox",
    config = {},
    pos = { x = 2, y = 0 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_fragile", set = "Other", vars = { 1, 4 } }
        info_queue[#info_queue + 1] = { key = "perishable", set = "Other", vars = { 5, 5 } }
        return { vars = {} }
    end,

    can_use = function(self, card)
        return G.jokers and G.jokers.cards and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        for _, j in ipairs(G.jokers.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if is_even then
                        j:add_sticker('abn_fragile', true)
                    else
                        j:add_sticker('perishable', true)
                    end
                    j:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                if #G.jokers.cards < G.jokers.config.card_limit then
                    local target_rarity = is_even and "abn_SuperRare" or "abn_ParallelRare"
                    local created_joker = create_card('Joker', G.jokers, nil, target_rarity, nil, nil, nil, 'schrodinger')
                    
                    if created_joker then
                        created_joker:add_to_deck()
                        G.jokers:emplace(created_joker)
                        created_joker:start_materialize()

                        if is_even then
                            created_joker:add_sticker('perishable', true)
                        else
                            created_joker:add_sticker('abn_fragile', true)
                        end
                    end
                end
                return true
            end
        }))
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "zeno",
    set = "paradox",
    config = {},
    pos = { x = 3, y = 0 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        if is_even then
            local has_hand_edition = false
            if G.hand and G.hand.cards then
                for _, c in ipairs(G.hand.cards) do
                    if c.edition then
                        has_hand_edition = true
                        break
                    end
                end
            end
            return has_hand_edition and G.jokers and G.jokers.cards and #G.jokers.cards > 0
        else
            local has_joker_edition = false
            if G.jokers and G.jokers.cards then
                for _, j in ipairs(G.jokers.cards) do
                    if j.edition then
                        has_joker_edition = true
                        break
                    end
                end
            end
            return has_joker_edition and G.hand and G.hand.cards and #G.hand.cards > 0
        end
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        if is_even then
            local eligible_sources = {}
            for _, c in ipairs(G.hand.cards) do
                if c.edition then
                    eligible_sources[#eligible_sources + 1] = c
                end
            end

            if #eligible_sources > 0 and #G.jokers.cards > 0 then
                local source_card = pseudorandom_element(eligible_sources, pseudoseed('zeno_source'))
                local target_joker = pseudorandom_element(G.jokers.cards, pseudoseed('zeno_target'))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        source_card:juice_up(0.3, 0.3)
                        target_joker:set_edition(source_card.edition, true)
                        target_joker:juice_up(0.5, 0.5)
                        return true
                    end
                }))
            end
        else
            local eligible_sources = {}
            for _, j in ipairs(G.jokers.cards) do
                if j.edition then
                    eligible_sources[#eligible_sources + 1] = j
                end
            end

            if #eligible_sources > 0 and #G.hand.cards > 0 then
                local source_joker = pseudorandom_element(eligible_sources, pseudoseed('zeno_source'))
                local target_card = pseudorandom_element(G.hand.cards, pseudoseed('zeno_target'))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        source_joker:juice_up(0.3, 0.3)
                        target_card:set_edition(source_joker.edition, true)
                        target_card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "theseus",
    set = "paradox",
    config = {},
    pos = { x = 0, y = 1 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        if not (G.hand and G.hand.cards and #G.hand.cards > 0) then
            return false
        end

        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        for _, c in ipairs(G.hand.cards) do
            local nominal = c.base and c.base.nominal
            if nominal then
                if is_even and nominal > 4 then
                    return true
                elseif not is_even and nominal < 5 then
                    return true
                end
            end
        end

        return false
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        local cards_to_destroy = {}
        for _, c in ipairs(G.hand.cards) do
            local nominal = c.base and c.base.nominal
            if nominal then
                if is_even and nominal > 4 then
                    cards_to_destroy[#cards_to_destroy + 1] = c
                elseif not is_even and nominal < 5 then
                    cards_to_destroy[#cards_to_destroy + 1] = c
                end
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        if #cards_to_destroy > 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    for _, c in ipairs(cards_to_destroy) do
                        c:start_dissolve(nil, i == 1)
                    end
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "sortie",
    set = "paradox",
    config = {},
    pos = { x = 1, y = 1 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local copy = create_card('Consumable', G.vouchers, nil, nil, nil, nil, 'c_abn_sortie')
                if copy then
                    copy.ability.extra = copy.ability.extra or {}
                    copy.ability.extra.is_even = is_even
                    copy:add_to_deck()
                    G.vouchers:emplace(copy)
                end
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.setting_blind and card.area == G.vouchers and G.GAME.blind and G.GAME.blind.boss then
            local is_even = card.ability and card.ability.extra and card.ability.extra.is_even

            if is_even then
                G.GAME.blind.chips = G.GAME.blind.chips * 2
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.GAME.blind.dollars = G.GAME.blind.dollars * 2
            else
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.GAME.blind.dollars = math.floor(G.GAME.blind.dollars * 0.5)
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    card:juice_up(0.8, 0.5)
                    card:start_dissolve()
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}


local card_to_joker_enh = {
    m_bonus = "abn_stk_bonus",
    m_mult = "abn_stk_mult",
    m_wild = "abn_stk_wild",
    m_glass = "abn_stk_glass",
    m_steel = "abn_stk_steel",
    m_stone = "abn_stk_stone",
    m_gold = "abn_stk_gold",
    m_lucky = "abn_stk_lucky",
    m_abn_petroleum = "abn_stk_petroleum",
    m_abn_oilfire = "abn_stk_oilfire",
    m_abn_mercurial = "abn_stk_mercurial",
    m_abn_kintsugi = "abn_stk_kintsugi",
    m_abn_infra = "abn_stk_infra",
    m_abn_hazard = "abn_stk_hazard",
    m_abn_wallpaper = "abn_stk_wallpaper",
    m_abn_fossil = "abn_stk_fossil",
    m_abn_monitor = "abn_stk_monitor",
    m_abn_reinforcement = "abn_stk_reinforcement",
    m_abn_darkner = "abn_stk_darkner",
    m_abn_lightner = "abn_stk_lightner",
    m_abn_first_aid = "abn_stk_first_aid",
    m_abn_flux = "abn_stk_flux",
    m_abn_zen = "abn_stk_zen",
    m_abn_plank = "abn_stk_plank",
}

local joker_to_card_enh = {}
for card_enh, joker_stk in pairs(card_to_joker_enh) do
    joker_to_card_enh[joker_stk] = card_enh
end

local function get_card_enhancement_key(card)
    if not card then return nil end
    if card.config and card.config.center_key and card.config.center_key ~= 'c_base' then
        return card.config.center_key
    end
    if card.config and card.config.center and card.config.center.key and card.config.center.key ~= 'c_base' then
        return card.config.center.key
    end
    if card.get_enhancement then
        local enh = card:get_enhancement()
        if enh then return enh end
    end
    return nil
end

SMODS.Consumable {
    key = 'newcomb',
    set = 'paradox',
    atlas = 'AbandoniaParadox', 
    pos = { x = 2, y = 1 }, 
    config = {},
    
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        if not G.hand or #G.hand.cards == 0 then return false end
        if not G.jokers or #G.jokers.cards == 0 then return false end

        local is_even = (G.GAME.round_resets.ante % 2 == 0)
        local rightmost_card = G.hand.cards[#G.hand.cards]
        local leftmost_joker = G.jokers.cards[1]

        if is_even then
            local enh_key = get_card_enhancement_key(rightmost_card)
            return enh_key and card_to_joker_enh[enh_key] ~= nil
        else
            if not ABN or not ABN.enh_stickers_list then return false end
            for _, stk_key in ipairs(ABN.enh_stickers_list) do
                if (leftmost_joker.ability[stk_key] or (leftmost_joker.config and leftmost_joker.config.center and leftmost_joker.config.center[stk_key])) and joker_to_card_enh[stk_key] then
                    return true
                end
            end
            return false
        end
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        if is_even then
            local target_card = G.hand.cards[#G.hand.cards]
            local target_joker = G.jokers.cards[1]
            local card_enh = get_card_enhancement_key(target_card)
            local sticker_key = card_to_joker_enh[card_enh]

            if sticker_key then
                target_card:juice_up(0.5, 0.5)

                if SMODS.Sticker and SMODS.Stickers and SMODS.Stickers[sticker_key] then
                    SMODS.Stickers[sticker_key]:apply(target_joker, true)
                else
                    target_joker.ability[sticker_key] = true
                end
                target_joker:juice_up(0.5, 0.5)
            end
        else
            local target_joker = G.jokers.cards[1]
            local target_card = G.hand.cards[#G.hand.cards]
            local found_sticker = nil

            if ABN and ABN.enh_stickers_list then
                for _, stk_key in ipairs(ABN.enh_stickers_list) do
                    if target_joker.ability[stk_key] or (target_joker.config and target_joker.config.center and target_joker.config.center[stk_key]) then
                        found_sticker = stk_key
                        break
                    end
                end
            end

            if found_sticker and joker_to_card_enh[found_sticker] then
                local card_enh_key = joker_to_card_enh[found_sticker]

                target_joker:juice_up(0.5, 0.5)

                target_card:set_ability(G.P_CENTERS[card_enh_key], nil, true)
                target_card:juice_up(0.5, 0.5)
            end
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "epimenides",
    set = "paradox",
    config = {},
    pos = { x = 3, y = 1 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        return G.hand and G.hand.cards and #G.hand.cards > 0
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)
        local amount = is_even and -2 or 2

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        for _, c in ipairs(G.hand.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    SMODS.modify_rank(c, amount)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "barjavel",
    set = "paradox",
    config = {},
    pos = { x = 0, y = 2 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        if G.STATE == G.STATES.SHOP then return true end
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        if is_even then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    if G.shop_booster and G.shop_booster.cards then
                        G.GAME.SHOP_SAVED = false
                        local booster_num = (G.GAME.starting_params and G.GAME.starting_params.boosters_in_shop or 2) + (G.GAME.modifiers and G.GAME.modifiers.extra_boosters or 0)

                        for i = #G.shop_booster.cards, 1, -1 do
                            local c = G.shop_booster:remove_card(G.shop_booster.cards[i])
                            c:remove()
                        end

                        for i = 1, booster_num do
                            local pack_data = get_pack('shop_pack')
                            local pack_key = pack_data and pack_data.key or 'p_buffoon_normal_1'
                            
                            if G.GAME.current_round and G.GAME.current_round.used_packs then
                                G.GAME.current_round.used_packs[i] = pack_key
                            end

                            local card_booster = Card(
                                G.shop_booster.T.x + G.shop_booster.T.w / 2,
                                G.shop_booster.T.y,
                                G.CARD_W * 1.27,
                                G.CARD_H * 1.27,
                                G.P_CARDS.empty,
                                G.P_CENTERS[pack_key],
                                { bypass_discovery_center = true, bypass_discovery_ui = true }
                            )
                            create_shop_card_ui(card_booster, 'Booster', G.shop_booster)
                            card_booster.ability.booster_pos = i
                            card_booster:start_materialize()
                            G.shop_booster:emplace(card_booster)
                        end
                    end
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    if G.shop_vouchers and G.shop_vouchers.cards then
                        G.GAME.SHOP_SAVED = false

                        for i = #G.shop_vouchers.cards, 1, -1 do
                            local c = G.shop_vouchers:remove_card(G.shop_vouchers.cards[i])
                            c:remove()
                        end

                        local voucher_key = get_next_voucher_key(true)
                        if voucher_key then
                            local voucher = Card(
                                G.shop_vouchers.T.x + G.shop_vouchers.T.w / 2,
                                G.shop_vouchers.T.y,
                                G.CARD_W,
                                G.CARD_H,
                                G.P_CARDS.empty,
                                G.P_CENTERS[voucher_key],
                                { bypass_discovery_center = true, bypass_discovery_ui = true }
                            )
                            create_shop_card_ui(voucher, 'Voucher', G.shop_vouchers)
                            voucher:start_materialize()
                            G.shop_vouchers:emplace(voucher)
                        end
                    end
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "jevons",
    set = "paradox",
    config = {},
    pos = { x = 2, y = 2 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,
    hidden = true,
    soul_set = "paradox",
    soul_rate = 0.3,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "eternal", set = "Other", vars = { 5 } }
        return { vars = {} }
    end,

    can_use = function(self, card)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)
        
        if is_even then
            return G.jokers and G.jokers.cards and #G.jokers.cards > 0
        else
            return true
        end
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        if is_even then
            local ante_mod = 2 - G.GAME.round_resets.ante
            ease_ante(ante_mod)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                    local jokers_to_destroy = {}
                    for _, j in ipairs(G.jokers.cards) do
                        if not j.ability.eternal then
                            table.insert(jokers_to_destroy, j)
                        end
                    end

                    local destroyed_count = #jokers_to_destroy
                    for _, j in ipairs(jokers_to_destroy) do
                        j:start_dissolve()
                    end

                    if destroyed_count > 0 then
                        ease_dollars(destroyed_count * 5, true)
                    end
                    return true
                end
            }))
        else
            local ante_mod = 3 - G.GAME.round_resets.ante
            ease_ante(ante_mod)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                    for _, j in ipairs(G.jokers.cards) do
                        j:set_eternal(true)
                        j:juice_up(0.5, 0.5)
                    end

                    if G.GAME.dollars ~= 0 then
                        ease_dollars(-G.GAME.dollars, true)
                    end
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}

SMODS.Consumable {
    key = "roko",
    set = "paradox",
    config = {},
    pos = { x = 1, y = 2 },
    atlas = "AbandoniaParadox",
    cost = 4,
    discovered = false,
	hidden = true,
    soul_set = "paradox",
    soul_rate = 0.3,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local is_even = (G.GAME.round_resets.ante % 2 == 0)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)

                if is_even then
                    G.GAME.win_ante = G.GAME.win_ante + 4

                    if G.jokers then
                        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                    end
                else
                    G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 0.5

                    if G.jokers then
                        G.jokers.config.card_limit = G.jokers.config.card_limit - 2
                    end
                end

                return true
            end
        }))
    end,

    abn_artist_credits = {
        artist = "Tatsu",
    },
}