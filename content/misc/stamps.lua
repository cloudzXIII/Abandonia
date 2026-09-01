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

-- Simple helper: checks if a Sticker is a Stamp
local function is_stamp(key)
  return string.find(key, "^abn_") and string.find(key, "_stamp$")
end

local function stamp_ui()
  local stamps = {}

  for k, v in pairs(SMODS.Stickers) do
    if is_stamp(k) then
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
    if is_stamp(k) then
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

SMODS.Sticker {
    key = 'empty_stamp',
    atlas = 'AbandoniaStamps',
    pos = { x = 0, y = 0 },
    badge_colour = HEX("45283c"),

    set_ability = function(self, card)
        if not card.ability.abn_stamp_extra then
            card.ability.abn_stamp_extra = {
                triggered = false
            }
        end
    end,

    update = function(self, card, dt)
        if not G.playing_cards or not G.hand then return end

        -- Extract key traits (treating 'c_base' / missing enhancement as nil)
        local card_edition = card.edition and card.edition.key or nil
        local card_enhancement = (card.config.center and card.config.center.key ~= 'c_base') and card.config.center.key or nil
        local card_seal = card.seal or nil

        -- Must have at least one non-base trait to be unique
        local has_any_trait = card_edition or card_enhancement or card_seal
        local is_unique = false

        if has_any_trait then
            is_unique = true
            for _, other_card in ipairs(G.playing_cards) do
                if other_card ~= card then
                    local other_edition = other_card.edition and other_card.edition.key or nil
                    local other_enhancement = (other_card.config.center and other_card.config.center.key ~= 'c_base') and other_card.config.center.key or nil
                    local other_seal = other_card.seal or nil

                    if card_edition == other_edition and 
                       card_enhancement == other_enhancement and 
                       card_seal == other_seal then
                        is_unique = false
                        break
                    end
                end
            end
        end

        -- Dynamically adjust hand size limit
        if is_unique and not card.ability.abn_stamp_extra.triggered then
            card.ability.abn_stamp_extra.triggered = true
            G.hand:change_config({card_limit = G.hand.config.card_limit + 1})
        elseif not is_unique and card.ability.abn_stamp_extra.triggered then
            card.ability.abn_stamp_extra.triggered = false
            G.hand:change_config({card_limit = G.hand.config.card_limit - 1})
        end
    end
}

