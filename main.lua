ABANDONIA = {}

ABN = SMODS.current_mod

SMODS.current_mod.config_tab = function()
    local scale = 5/6
    return {n=G.UIT.ROOT, config = {align = "cl", minh = G.ROOM.T.h*0.25, padding = 0.0, r = 0.1, colour = G.C.GREY}, nodes = {
        {n = G.UIT.R, config = { padding = 0.05 }, nodes = {
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, nodes = {
                create_toggle{ label = "Toggle Music", info = {"Enable Custom Music"}, active_colour = ABN.badge_colour, ref_table = ABN.config, ref_value = "Music" },
            }}
        }}
    }}
end


ABN = SMODS.current_mod
-- Load Options
ABN_config = ABN.config
-- This will save the current state even when settings are modified
ABN.enabled = copy_table(ABN_config)

local config = SMODS.current_mod.config

ABN.description_loc_vars = function()
  return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

ABN.optional_features = {
  retrigger_joker = true,
  quantum_enhancements = true,
  post_trigger = true,
}

local abn = loc_colour
function loc_colour(_c, _default)
  if not G.ARGS.LOC_COLOURS then
    abn()
  end

  G.ARGS.LOC_COLOURS.abn_snow = HEX("5dc6e2")
  G.ARGS.LOC_COLOURS.abn_penumbra = HEX("8570c7")
  G.ARGS.LOC_COLOURS.abn_hazard = HEX("831717")
  G.ARGS.LOC_COLOURS.abn_calamity = HEX("c3a37a")
  G.ARGS.LOC_COLOURS.abn_perishable = HEX("687ee7")
  G.ARGS.LOC_COLOURS.abn_eternal = HEX("c65984")
  G.ARGS.LOC_COLOURS.abn_sigil = HEX("fd5f55")
  G.ARGS.LOC_COLOURS.abn_nightshift = HEX("1a6a5f")
  G.ARGS.LOC_COLOURS.abn_astro = HEX("5204ff")
  G.ARGS.LOC_COLOURS.abn_superrare = HEX("d59fcd")
  G.ARGS.LOC_COLOURS.abn_parallelrare = HEX("b26cbb")


  return abn(_c, _default)
end

SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = '34',
    py = '34'
})

SMODS.Atlas({
  key = "AbandoniaStickers",
  path = "stickers.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaSuits",
  path = "suits.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaSuitIcons",
  path = "icons.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaHazardTags",
  path = "hazard_tags.png",
  px = 34,
  py = 34,
})

SMODS.Atlas({
  key = "AbandoniaTags",
  path = "tags.png",
  px = 34,
  py = 34,
})

SMODS.Atlas({
  key = "AbandoniaJokers",
  path = "jokers_1.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaReverse",
  path = "reverse_legendary.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = 'AbandoniaBlinds',
  path = 'blinds.png',
  px = 34,
  py = 34,
  frames = 21,
  atlas_table = 'ANIMATION_ATLAS'
})

SMODS.Atlas({
  key = "AbandoniaSpectrals",
  path = "spectrals.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaPlanets",
  path = "planets.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaTarots",
  path = "tarots.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaEnhancements",
  path = "enhancements.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaVouchers",
  path = "vouchers.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaCalamity",
  path = "calamity.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaSigils",
  path = "sigils.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaNightshift",
  path = "nightshift.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaAstro",
  path = "astro.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaStakes",
  path = "stakes.png",
  px = 29,
  py = 29,
})

SMODS.Atlas({
  key = "AbandoniaDecks",
  path = "decks.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "abn_hidden_blind",
  path = "hidden_blind.png",
  px = 34,
  py = 34,
})

SMODS.Sound({
    key = 'music_title',
    path = 'music_title.ogg',
	pitch = 1,
	speed = 1,
    select_music_track = function(self)
        -- If it's title play music
        if G.STAGE == G.STAGES.MAIN_MENU and config.Music ~= false then
            return 1e10
        end
    end
})

SMODS.Sound({
    key = 'music_stakes',
    path = 'music_stakes.ogg',
	pitch = 1,
	speed = 1,
    select_music_track = function(self)
        -- If it's stakes play music
        if G.GAME.modifiers.Honor and config.Music ~= false then
            return 1e10
        end
    end
})

-- Utilities
local subdir = "utilities"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
  assert(SMODS.load_file(subdir .. "/" .. filename))()
end

-- Jokers
local subdir = "content/cards"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
  assert(SMODS.load_file(subdir .. "/" .. filename))()
end

local subdir = "content/misc"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
  assert(SMODS.load_file(subdir .. "/" .. filename))()
end
ABN.calculate = function(self, context)
  -- Shadowy Joker
  if #SMODS.find_card("j_abn_shadowy_joker", true) > 0 then
    local card_areas = { G.jokers, G.consumeables, G.shop_jokers, G.pack_cards }
    for _, area in ipairs(card_areas) do
      if area and area.cards then
        for _, v in ipairs(area.cards) do
          if v.facing == "front" then
            v:flip()
            v.shadowy_flipped = true
          end
        end
      end
    end
  end

  if context.individual and context.cardarea == G.play then
    if context.other_card.ability.abn_perma_flipped then
      return {
        x_mult = 1.25
      }
    end
  end

  if context.after and context.main_eval and not context.blueprint then
    for _, v in ipairs(context.full_hand) do
      if v.ability.abn_forced_selection or v.abn_inkblot_forced_selection then
        v.ability.abn_forced_selection = nil
        v.ability.abn_inkblot_forced_selection = nil
      end
    end
  end

  if context.joker_type_destroyed and context.card.config.center.key == "j_cavendish" then
    G.GAME.pool_flags.abn_cavendish_extinct = true
  end

  if context.other_joker then
    local ability = context.other_joker.ability
    local has_chips = ability.abn_perma_bonus and ability.abn_perma_bonus ~= 0
    local has_mult = ability.abn_perma_mult and ability.abn_perma_mult ~= 0
    -- Adding checks for XMult and XChips
    local has_x_mult = ability.abn_perma_xmult and ability.abn_perma_xmult ~= 1
    local has_x_chips = ability.abn_perma_xchips and ability.abn_perma_xchips ~= 1

    if has_chips or has_mult or has_x_mult or has_x_chips then
        return {
            chips = has_chips and ability.abn_perma_bonus or nil,
            mult = has_mult and ability.abn_perma_mult or nil,
            x_mult = has_x_mult and ability.abn_perma_xmult or nil,
            x_chips = has_x_chips and ability.abn_perma_xchips or nil,
            message_card = context.other_joker,
            no_juice = true,
        }
    end
  end
  if context.mod_probability and not context.blueprint and G.GAME.abn_possibility_sticker then
    return {
      numerator = context.numerator * 2,
    }
  end
  if context.after and context.main_eval and not context.blueprint and G.GAME.abn_possibility_sticker then
    G.GAME.abn_possibility_sticker = false
  end
end

function ABN.reset_game_globals(run_start)
  ABN.reset_abn_gerrymandering()
  ABN.reset_felix_joker()
end

SMODS.Rarity {
  key = "SuperRare",
  default_weight = 0,
  badge_colour = HEX("d59fcd"),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Rarity {
  key = "ParallelRare",
  default_weight = 0,
  badge_colour = HEX("b26cbb"),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Gradient {
  key = "rainbow",
  colours = {
    HEX("a79475"),
    HEX("e0483e"),
    HEX("fda200"),
    HEX("8dae5f"),
    HEX("33966e"),
    HEX("4f6c74"),
    HEX("403fb2"),
    HEX("726ca0"),
    HEX("ae6c98"),
    HEX("7a4158"),
    HEX("9facc4"),

  },
  cycle = 10
}