-- Create collection entry for Stamps
SMODS.current_mod.custom_collection_tabs = function()
  return {
    UIBox_button({
      button = 'your_collection_abn_stamps',
      id = 'your_collection_abn_stamps',
      label = { localize('abn_ui_stamps') },
      minw = 5,
      minh = 1
    })
  }
end

function ABN_is_stamp(key)
    if not key or not SMODS.Stickers[key] then return false end
    return SMODS.Stickers[key].set == "stamp"
end

local function stamp_ui()
  local stamps = {}

  for k, v in pairs(SMODS.Stickers) do
    if ABN_is_stamp(k) then
      stamps[k] = v
    end
  end

  return SMODS.card_collection_UIBox(stamps, { 5, 5 }, {
    snap_back = true,
    hide_single_page = true,
    collapse_single_page = true,
    center = 'c_base',
    h_mod = 1.18,
    back_func = 'your_collection_other_gameobjects',
    modify_card = function(card, center)
      card.ignore_pinned = true
      center:apply(card, true)
    end,
  })
end

G.FUNCS.your_collection_abn_stamps = function()
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu {
    definition = stamp_ui()
  }
end

local function wrap_without_stamps(func)
  -- Temporarily remove our stamps from SMODS.Stickers
  local removed = {}
  for k, v in pairs(SMODS.Stickers) do
    if ABN_is_stamp(k) then
      removed[k] = v
      SMODS.Stickers[k] = nil
    end
  end

  local ret = func()

  -- Add them back once the UI was created
  for k, v in pairs(removed) do
    SMODS.Stickers[k] = v
  end

  return ret
end

-- Override Stickers tab in collection
local stickers_ui_ref = create_UIBox_your_collection_stickers
create_UIBox_your_collection_stickers = function()
  return wrap_without_stamps(stickers_ui_ref)
end

-- Override Stickers tab in Additions
local other_objects_ref = create_UIBox_Other_GameObjects
create_UIBox_Other_GameObjects = function()
  return wrap_without_stamps(other_objects_ref)
end

--- Tooltip builder for Stamps
--- @param type string
--- @return table | nil
function stamp_tooltip(type)
  local key = 'abn_' .. type .. '_stamp'
  local stamp = SMODS.Stickers[key]
  local vars = {}

  if not stamp then return end

  if stamp.loc_vars then
    local dummy_card = { ability = {} }
    stamp:apply(dummy_card, true)
    vars = stamp:loc_vars({}, dummy_card).vars
  end

  return {
    set = 'Other',
    key = key,
    vars = vars
  }
end

-- make remove from deck trigger on stamps
local card_remove_from_deck_ref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.ability then
        for sticker_key, active in pairs(self.ability) do
            if active and ABN_is_stamp(sticker_key) then
                local sticker_obj = SMODS.Stickers[sticker_key]
                if sticker_obj and sticker_obj.remove_from_deck then
                    sticker_obj:remove_from_deck(self, from_debuff)
                end
            end
        end
    end
    card_remove_from_deck_ref(self, from_debuff)
end
local card_remove_ref = Card.remove
function Card:remove()
    if self.ability then
        for sticker_key, active in pairs(self.ability) do
            if active and ABN_is_stamp(sticker_key) then
                local sticker_obj = SMODS.Stickers[sticker_key]
                if sticker_obj and sticker_obj.remove_from_deck then
                    sticker_obj:remove_from_deck(self, false)
                end
            end
        end
    end
    card_remove_ref(self)
end
local card_remove_sticker_ref = Card.remove_sticker
function Card:remove_sticker(sticker_key)
    if self.ability and self.ability[sticker_key] and ABN_is_stamp(sticker_key) then
        local sticker_obj = SMODS.Stickers[sticker_key]
        if sticker_obj and sticker_obj.remove_from_deck then
            sticker_obj:remove_from_deck(self, false)
        end
    end
    card_remove_sticker_ref(self, sticker_key)
end

-- trigger add to deck effects on stamps
local card_add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    card_add_to_deck_ref(self, from_debuff)
    if self.ability then
        for sticker_key, active in pairs(self.ability) do
            if active and ABN_is_stamp(sticker_key) then
                local sticker_obj = SMODS.Stickers[sticker_key]
                if sticker_obj and sticker_obj.add_to_deck then
                    sticker_obj:add_to_deck(self, from_debuff)
                end
            end
        end
    end
end

local card_add_sticker_ref = Card.add_sticker
function Card:add_sticker(sticker_key, silent)
    card_add_sticker_ref(self, sticker_key, silent)
    if self.ability and self.ability[sticker_key] and ABN_is_stamp(sticker_key) then
        local sticker_obj = SMODS.Stickers[sticker_key]
        if sticker_obj and sticker_obj.add_to_deck and self.added_to_deck then
            sticker_obj:add_to_deck(self, false)
        end
    end
end

-- apply stamps with this function
function abn_add_stamp(card, new_stamp_key)
    if card and card.ability and SMODS and SMODS.Sticker and SMODS.Sticker.obj_buffer then
        for _, sticker in ipairs(SMODS.Sticker.obj_buffer) do
            if card.ability[sticker] and ABN_is_stamp(sticker) then
                card:remove_sticker(sticker)
            end
        end
    end

    card:add_sticker(new_stamp_key, true)
end


SMODS.Sticker {
    key = 'empty_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 0, y = 0 },
    badge_colour = HEX("45283c"),
    set = "stamp",

	
	add_to_deck = function(self, card, from_debuff)
        card.ability.abn_stamp_extra = card.ability.abn_stamp_extra or {}
        card.ability.abn_stamp_extra.triggered = false
    end,
	
    remove_from_deck = function(self, card, from_debuff)
        card.ability.abn_stamp_extra = card.ability.abn_stamp_extra or { triggered = false }
        if card.ability.abn_stamp_extra.triggered then
            card.ability.abn_stamp_extra.triggered = false
            if G.hand then G.hand:change_size(-1) end
        end
    end,

    calculate = function(self, card, context)
        if not G.playing_cards or not G.hand then return end

        card.ability.abn_stamp_extra = card.ability.abn_stamp_extra or { triggered = false }

        local card_edition = card.edition and card.edition.key or nil
        local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
        local card_seal = card.seal or nil

        local has_all_traits = card_edition and card_enhancement and card_seal
        local is_unique = false

        if has_all_traits then
            is_unique = true
            for _, other_card in ipairs(G.playing_cards) do
                if other_card ~= card then
                    local other_edition = other_card.edition and other_card.edition.key or nil
                    local other_enhancement = (other_card.config.center and other_card.config.center.key ~= 'c_base') and other_card.config.center.key or nil
                    local other_seal = other_card.seal or nil

                    if (card_edition == other_edition) or 
                       (card_enhancement == other_enhancement) or 
                       (card_seal == other_seal) then
                        is_unique = false
                        break
                    end
                end
            end
        end

        if is_unique and not card.ability.abn_stamp_extra.triggered then
            card.ability.abn_stamp_extra.triggered = true
            G.hand:change_size(1)
        elseif not is_unique and card.ability.abn_stamp_extra.triggered then
            card.ability.abn_stamp_extra.triggered = false
            G.hand:change_size(-1)
        end
    end
}

SMODS.Sticker {
    key = 'jester_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 1, y = 0 }, 
    badge_colour = HEX("3b2f38"),
    set = "stamp",

    calculate = function(self, card, context)
        if not context.remove_playing_cards or not context.removed then return end

        local is_destroyed = false
        for _, removed_card in ipairs(context.removed) do
            if removed_card == card then
                is_destroyed = true
                break
            end
        end

        if not is_destroyed or not G.playing_cards then return end

        local card_edition = card.edition and card.edition.key or nil
        local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
        local card_seal = card.seal or nil

        if not (card_edition and card_enhancement and card_seal) then return end

        local is_unique = true
        for _, other_card in ipairs(G.playing_cards) do
            if other_card ~= card then
                local other_edition = other_card.edition and other_card.edition.key or nil
                local other_enhancement = (other_card.config.center and other_card.config.center.key ~= 'c_base') and other_card.config.center.key or nil
                local other_seal = other_card.seal or nil

                if (card_edition == other_edition) or 
                   (card_enhancement == other_enhancement) or 
                   (card_seal == other_seal) then
                    is_unique = false
                    break
                end
            end
        end

        if is_unique then
			G.GAME.JesterStampsTriggered = (G.GAME.JesterStampsTriggered or 0) + 1
			if G.GAME.JesterStampsTriggered <= 5 then
				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
				return {
					message = "+1 Joker Slot!",
				}
			end
        end
    end
}

SMODS.Sticker {
    key = 'icon_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 2, y = 0 },
    badge_colour = HEX("7357bb"),
    set = "stamp",
	
	loc_vars = function(self, info_queue, card)
        local trait_count = 1

        if card then
            local card_edition = card.edition and card.edition.key or nil
            local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
            local card_seal = card.seal or nil

            if card_edition and card_enhancement and card_seal then
                local is_unique = true
                if G.playing_cards then
                    for _, other_card in ipairs(G.playing_cards) do
                        if other_card ~= card then
                            local other_edition = other_card.edition and other_card.edition.key or nil
                            local other_enhancement = (other_card.config.center and other_card.config.center.key ~= 'c_base') and other_card.config.center.key or nil
                            local other_seal = other_card.seal or nil

                            if (card_edition == other_edition) or 
                               (card_enhancement == other_enhancement) or 
                               (card_seal == other_seal) then
                                is_unique = false
                                break
                            end
                        end
                    end
                end

                if is_unique then
                    local total = 0
                    if G.playing_cards then
                        for _, c in ipairs(G.playing_cards) do
                            if c.edition then total = total + 1 end
                            if c.config.center and c.config.center.key ~= 'c_base' then total = total + 1 end
                            if c.seal then total = total + 1 end
                        end
                    end
                    if total > 0 then trait_count = total end
                end
            end
        end

        return { vars = { trait_count } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            local card_edition = card.edition and card.edition.key or nil
            local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
            local card_seal = card.seal or nil

            if not (card_edition and card_enhancement and card_seal) then return end

            local is_unique = true
            if G.playing_cards then
                for _, other_card in ipairs(G.playing_cards) do
                    if other_card ~= card then
                        local other_edition = other_card.edition and other_card.edition.key or nil
                        local other_enhancement = (other_card.config.center and other_card.config.center.key ~= 'c_base') and other_card.config.center.key or nil
                        local other_seal = other_card.seal or nil

                        if (card_edition == other_edition) or 
                           (card_enhancement == other_enhancement) or 
                           (card_seal == other_seal) then
                            is_unique = false
                            break
                        end
                    end
                end
            end

            if is_unique then
                local trait_count = 0
                if G.playing_cards then
                    for _, c in ipairs(G.playing_cards) do
                        if c.edition then trait_count = trait_count + 1 end
                        if c.config.center and c.config.center.key ~= 'c_base' then trait_count = trait_count + 1 end
                        if c.seal then trait_count = trait_count + 1 end
                    end
                end

                if trait_count > 0 then
                    return {
                        xchips = trait_count,
                        colour = G.C.CHIPS
                    }
                end
            end
        end

        if context.end_of_round and G.GAME.current_round.hands_played <= 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.2,
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
        end
    end
}


SMODS.Sticker {
    key = 'psychomancy_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 3, y = 0 }, 
    badge_colour = HEX("5b1746"),
    set = "stamp",

    calculate = function(self, card, context)
        if not context.remove_playing_cards or not context.removed then return end

        local is_destroyed = false
        for _, removed_card in ipairs(context.removed) do
            if removed_card == card then
                is_destroyed = true
                break
            end
        end

        if not is_destroyed then return end

        local trait_count = 0
        if card.edition then trait_count = trait_count + 1 end
        if card.config.center and card.config.center.key ~= 'c_base' then trait_count = trait_count + 1 end
        if card.seal then trait_count = trait_count + 1 end

        if trait_count <= 0 then return end

        local tempuse = -1
        local target_hand = nil
        for k, v in pairs(G.GAME.hands) do
            if v.played > tempuse and v.visible then
                tempuse = v.played
                target_hand = k
            end
        end

        if target_hand then
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {
                handname = G.GAME.hands[target_hand].loc_name or localize(target_hand, 'poker_hands'),
                level = G.GAME.hands[target_hand].level + trait_count,
                mult = G.GAME.hands[target_hand].mult,
                chips = G.GAME.hands[target_hand].chips
            })

            level_up_hand(card, target_hand, nil, trait_count)

            return {
                message = localize('k_level_up_ex'),
            }
        end
    end
}

SMODS.Sticker {
    key = 'prehensile_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 0, y = 1 },
    badge_colour = HEX("916b09"),
    set = "stamp",

    calculate = function(self, card, context)
        if context.modify_scoring_hand and context.other_card == card then
            if not G.playing_cards then return end

            local card_edition = card.edition and card.edition.key
            local card_seal = card.seal
            local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
            if not card_edition and not card_seal and not card_enhancement then return end

            local edition_count = 0
            local seal_count = 0
            local enhancement_count = 0

            for _, other in ipairs(G.playing_cards) do
                if card_edition and other.edition and other.edition.key == card_edition then
                    edition_count = edition_count + 1
                end
                if card_seal and other.seal == card_seal then
                    seal_count = seal_count + 1
                end
                if card_enhancement then
                    local other_enhancement = (other.config.center and other.config.center.key ~= 'c_base') and other.config.center.key or nil
                    if other_enhancement == card_enhancement then
                        enhancement_count = enhancement_count + 1
                    end
                end
            end
            local edition_valid = not card_edition or (edition_count == 1)
            local seal_valid = not card_seal or (seal_count == 1)
            local enhancement_valid = not card_enhancement or (enhancement_count == 1)

            if edition_valid and seal_valid and enhancement_valid then
                return {
                    add_to_hand = true
                }
            end
        end
    end
}