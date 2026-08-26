ABANDONIA = {}

ABN = SMODS.current_mod

-- Load Options
ABN_config = ABN.config
-- This will save the current state even when settings are modified
ABN.enabled = copy_table(ABN_config)

local config = ABN.config

ABN.description_loc_vars = function()
  return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

ABN.optional_features = {
  retrigger_joker = true,
  post_trigger = true,
}


ABN.spectrallib_features = {
  "ascension_power" -- see bottom of ascended.lua
}


-- G.GAME variables
local init_game_object_ref = Game.init_game_object
function Game:init_game_object(...)
  local ret = init_game_object_ref(self, ...)
  ret.abn = {
    legendary_pool = { in_shop = false, rate = 1.00 },
    cthonian = false,
    used_sigils = {},
    rank_planet_rate = 0.7,
    total_jacks_discarded = {},
    suits_played_this_blind = {},
    free_hand = false,
  }
  return ret
end

G.C.ABN_PLASMA = { 0.8, 0.45, 0.85, 1 }
G.C.ABN_PLAGUED = HEX("cfeb2d")

local abn = loc_colour
function loc_colour(_c, _default)
  if not G.ARGS.LOC_COLOURS then
    abn()
  end

  G.ARGS.LOC_COLOURS.abn_hazard = HEX("831717")
  G.ARGS.LOC_COLOURS.abn_calamity = HEX("c3a37a")
  G.ARGS.LOC_COLOURS.abn_perishable = HEX("687ee7")
  G.ARGS.LOC_COLOURS.abn_eternal = HEX("c65984")
  G.ARGS.LOC_COLOURS.abn_superrare = HEX("d59fcd")
  G.ARGS.LOC_COLOURS.abn_parallelrare = HEX("b26cbb")
  G.ARGS.LOC_COLOURS.abn_plasma = { 0.8, 0.45, 0.85, 1 }
  G.ARGS.LOC_COLOURS.abn_plagued = HEX("cfeb2d")

  -- Seal colours
  G.ARGS.LOC_COLOURS.abn_pink_seal = HEX("ec7de7")
  G.ARGS.LOC_COLOURS.abn_orange_seal = HEX("f8a166")
  G.ARGS.LOC_COLOURS.abn_grey_seal = HEX("cfcfcf")
  G.ARGS.LOC_COLOURS.abn_black_seal = HEX("454545")
  G.ARGS.LOC_COLOURS.abn_teal_seal = HEX("64a5a0")
  G.ARGS.LOC_COLOURS.abn_white_seal = HEX("dedede")
  G.ARGS.LOC_COLOURS.abn_brown_seal = HEX("793307")
  G.ARGS.LOC_COLOURS.abn_violet_seal = HEX("5600a4")
  G.ARGS.LOC_COLOURS.abn_lavender_seal = HEX("c68ede")
  G.ARGS.LOC_COLOURS.abn_skyblue_seal = HEX("86b8de")
  G.ARGS.LOC_COLOURS.abn_brine_seal = HEX("2660de")
  G.ARGS.LOC_COLOURS.abn_lime_seal = HEX("68de24")
  G.ARGS.LOC_COLOURS.abn_oxidized_seal = HEX("c75323")
  G.ARGS.LOC_COLOURS.abn_brass_seal = HEX("a07f1f")
  G.ARGS.LOC_COLOURS.abn_copper_seal = HEX("d97c42")
  G.ARGS.LOC_COLOURS.abn_silver_seal = HEX("bec7d4")
  G.ARGS.LOC_COLOURS.abn_duality_seal = HEX("a56be6")


  G.ARGS.LOC_COLOURS.abn_j = HEX("000000")
  G.ARGS.LOC_COLOURS.abn_e = HEX("6d6dc0")
  G.ARGS.LOC_COLOURS.abn_v = HEX("a6bdd0")
  G.ARGS.LOC_COLOURS.abn_i = HEX("fff200")
  G.ARGS.LOC_COLOURS.abn_l = HEX("b5e61d")

  return abn(_c, _default)
end

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

SMODS.ObjectType({
  key = "Comedians",
  default = "j_abn_night_comedian",
  cards = {},
  inject = function(self)
    SMODS.ObjectType.inject(self)
  end,
})

SMODS.ObjectType({
  key = "Plagued",
  default = "j_abn_contagion",
  cards = {},
  inject = function(self)
    SMODS.ObjectType.inject(self)
  end,
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

-- Misc additions
local subdir = "content/misc"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
  assert(SMODS.load_file(subdir .. "/" .. filename))()
end

--#region Crossmod Stuff
local function abn_load_crossmod(mod_id)
  if next(SMODS.find_mod(mod_id)) then
    local subdir = "content/crossmod/" .. string.lower(mod_id)
    local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
    for _, filename in pairs(cards) do
      assert(SMODS.load_file(subdir .. "/" .. filename))()
    end
  end
end
abn_load_crossmod("allinjest")
abn_load_crossmod("Spectrallib")
abn_load_crossmod("Fortlatro")
abn_load_crossmod("ortalab")
abn_load_crossmod("paperback")
--#endregion

ABN.calculate = function(self, context)
  -- Shadowy Joker
  if #SMODS.find_card("j_abn_shadowy_joker", true) > 0 then
    local card_areas = { G.jokers, G.consumeables, G.shop_jokers, G.pack_cards }
    for _, area in ipairs(card_areas) do
      if area and area.cards then
        for _, v in ipairs(area.cards) do
          if v.facing == "front" then
            v:flip()
            v.ability.shadowy_flipped = true
          end
        end
      end
    end
  end


  if context.setting_blind then
    G.GAME.abn.suits_played_this_blind = {}
  end

  if context.individual and context.cardarea == G.play then
    if context.other_card.ability.abn_perma_flipped then
      local target_xmult = 1.25

      if G.jokers and G.jokers.cards then
        for _, joker in ipairs(G.jokers.cards) do
          if joker.config.center.key == 'j_abn_reversecard_joker' and joker.facing == 'back' then
            target_xmult = target_xmult * 2
            break
          end
        end
      end

      return {
        x_mult = target_xmult
      }
    end
    if not G.GAME.abn_13_played_this_run and context.other_card:get_id() == SMODS.Ranks.abn_13.id then
      G.GAME.abn_13_played_this_run = true
    end
    if context.other_card.base.suit and not SMODS.has_no_suit(context.other_card) and G.GAME.abn.suits_played_this_blind then
      G.GAME.abn.suits_played_this_blind[context.other_card.base.suit] = (G.GAME.abn.suits_played_this_blind[context.other_card.base.suit] or 0) +
          1
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

  -- Perma Bonuses on Jokers
  if context.other_joker then
    local ability = context.other_joker.ability
    local has_chips = ability.abn_perma_bonus and ability.abn_perma_bonus ~= 0
    local has_mult = ability.abn_perma_mult and ability.abn_perma_mult ~= 0
    local has_x_mult = ability.abn_perma_xmult and ability.abn_perma_xmult ~= 1
    local has_x_chips = ability.abn_perma_xchips and ability.abn_perma_xchips ~= 1
    local has_dollars = ability.abn_perma_dollars and ability.abn_perma_dollars ~= 0
    local has_score = ability.abn_perma_score and ability.abn_perma_score ~= 0

    if has_chips or has_mult or has_x_mult or has_x_chips or has_dollars or has_score then
      return {
        chips = has_chips and ability.abn_perma_bonus or nil,
        mult = has_mult and ability.abn_perma_mult or nil,
        x_mult = has_x_mult and ability.abn_perma_xmult or nil,
        x_chips = has_x_chips and ability.abn_perma_xchips or nil,
        dollars = has_dollars and ability.abn_perma_dollars or nil,
        score = has_score and ability.abn_perma_score or nil,
        card = context.other_joker,
        message_card = context.other_joker,
        no_juice = true,
      }
    end
  end

  -- Perma Repetitions on Jokers
  if context.retrigger_joker_check and context.other_card then
    local ability = context.other_card.ability
    if ability then
      local has_rep = ability.abn_perma_rep and ability.abn_perma_rep ~= 0
      if has_rep then
        return {
          repetitions = has_rep and ability.abn_perma_rep or nil,
          card = context.other_card,
          message_card = context.other_card,
        }
      end
    end
  end

  -- Used by Possibility sticker to double probabilities for the first hand of round
  if context.mod_probability and not context.blueprint and G.GAME.abn_possibility_sticker then
    return {
      numerator = context.numerator * 2,
    }
  end
  if context.after and context.main_eval and not context.blueprint and G.GAME.abn_possibility_sticker then
    G.GAME.abn_possibility_sticker = false
  end

  -- Used by Elementalist Joker, only in pool if a six card hand has been played this run
  if context.before and #context.full_hand == 6 and not G.GAME.abn_has_played_six_hand then
    G.GAME.abn_has_played_six_hand = true
  end

  -- Used by Regalia Joker, only in pool if a royal flush has been played this run
  if context.evaluate_poker_hand then
    G.GAME.abn_is_royal_flush = context.display_name == localize("Royal Flush", "poker_hands")
  end
  if context.before and not G.GAME.abn_has_played_royal_flush and G.GAME.abn_is_royal_flush then
    G.GAME.abn_has_played_royal_flush = true
  end

  -- Used by Jack of All Trades to track the number of unique-suited Jacks
  if G.GAME.abn.total_jacks_discarded and context.discard and context.other_card:get_id() == 11 and not SMODS.has_no_rank(context.other_card) and not G.GAME.abn.total_jacks_discarded[context.other_card.base.suit] then
    G.GAME.abn.total_jacks_discarded[context.other_card.base.suit] = true
  end

  -- Only show the option to switch between ruinous and consumable area after a ruinous power card has been used
  if context.using_consumeable and context.consumeable.ability.set == "ruinous_power" and not G.GAME.abn_ruinous then
    G.GAME.abn_ruinous = true
  end
end



function ABN.reset_game_globals(run_start)
  ABN.reset_abn_gerrymandering()
  ABN.reset_monitor_card()
  ABN.reset_abn_motocross_card()
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

SMODS.Rarity {
  key = "VirusRare",
  default_weight = 0,
  badge_colour = HEX("2e2b2e"),
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

if ABN.config.enable_logo then
  SMODS.Atlas {
    key = 'balatro',
    path = 'logo.png',
    px = 332,
    py = 216,
    prefix_config = { key = false }
  }
end

--[[ this is used to replace the smods logo if y'all want to do that just throw a cat.png into assets and uncomment this code
local function replaceSmodsCatWithAbandonia()
    local modsDir = "mods"
    local abandoniaCatPath = modsDir .. "/abandonia-main/assets/cat.png"

    if not love.filesystem.getInfo(abandoniaCatPath) then
        return
    end

    local catData = love.filesystem.read(abandoniaCatPath)
    if not catData then
        return
    end

    local items = love.filesystem.getDirectoryItems(modsDir)

    for _, folder in ipairs(items) do
		--surely despite the stupid shit smods does for names this will work right?
        if folder:match("^smods") then
            local targetCatPath = modsDir .. "/" .. folder .. "/assets/cat.png"
            love.filesystem.write(targetCatPath, catData)
        end
		
		--bmm compat
		if folder:match("^Steamodded") then
            local targetCatPath = modsDir .. "/" .. folder .. "/assets/cat.png"
            love.filesystem.write(targetCatPath, catData)
        end
    end
end

-- runs immediately when this file is loaded
replaceSmodsCatWithAbandonia()
--]]

--Modified Fortlatro Auto Updater for Abandonia you're welcome ~Eric
------------CHECK FOR UPDATES----------------------
local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
  local ret = oldfunc(change_context)

  if ABN.config.enable_update_popup then
    ----------------------------------------------------------------
    -- AUTO-UPDATE CHECK
    ----------------------------------------------------------------
    local id = "abandonia"
    local modPath = "Mods/Abandonia"

    ----------------------------------------------------------------
    -- STEP 0 — Ensure the mod is actually loaded
    ----------------------------------------------------------------
    if not SMODS.Mods[id] then
      return ret
    end

    ----------------------------------------------------------------
    -- STEP 1 — GitHub repo info
    ----------------------------------------------------------------
    local owner = "cloudzXIII"
    local repo = "Abandonia"

    ----------------------------------------------------------------
    -- Fetch latest release tag
    ----------------------------------------------------------------
    local curl_cmd =
        ('curl -sL "https://api.github.com/repos/%s/%s/releases/latest"')
        :format(owner, repo)

    local fp = io.popen(curl_cmd, "r")
    if not fp then
      return ret
    end

    local body = fp:read("*a")
    fp:close()

    if not body or body == "" then
      return ret
    end

    local latest = body:match('"tag_name"%s*:%s*"([^"]+)"')
    if not latest then
      return ret
    end

    -- Strips leading 'v' and handles hyphens, tildes (~), dots, and build identifiers
    local git_version = latest:match("^v?([%w%-%_%.%~]+)$")
    if not git_version then
      return ret
    end

    ----------------------------------------------------------------
    -- Compare with installed
    ----------------------------------------------------------------
    local current_raw = SMODS.Mods[id].version

    -- Strips leading 'v' and handles Steamodded's tilde syntax (e.g. 0.1.1~DEV-2a)
    local current_version = current_raw and current_raw:match("^v?([%w%-%_%.%~]+)$")

    if not current_version then
      return ret
    end

    if V(git_version) <= V(current_version) then
      return ret
    end

    ----------------------------------------------------------------
    -- Popup UI
    ----------------------------------------------------------------
    local msg = {
      ("A new version of %s is available!\n"):format(SMODS.Mods[id].name),
      ("Installed: v%s\n"):format(current_version),
      ("Latest: v%s\n\n"):format(latest),
      localize("k_abn_update_question")
    }

    local lines = {
      n = G.UIT.R,
      config = { padding = 0.2, align = "tm" },
      nodes = {
        {
          n = G.UIT.C,
          nodes = {
            {
              n = G.UIT.T,
              config = {
                text = msg[1] .. msg[2] .. msg[3] .. msg[4],
                scale = 0.5
              }
            }
          }
        }
      }
    }

    local button_row = {
      n = G.UIT.R,
      config = { padding = 0.2, align = "bm" },
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.1 },
          nodes = {
            UIBox_button {
              colour = G.C.GREEN,
              label = { localize("k_abn_yes") },
              button = "update_accepted",
            }
          }
        },
        {
          n = G.UIT.C,
          config = { padding = 0.1 },
          nodes = {
            UIBox_button {
              colour = G.C.RED,
              label = { localize("k_abn_no") },
              button = "update_denied",
            }
          }
        }
      }
    }

    local confirm_ui = {
      n = G.UIT.ROOT,
      config = {
        align = "cm",
        minw = 4,
        minh = 5,
        padding = 0.3,
        colour = G.C.UI.TEXT_DARK,
        outline = 5,
        outline_colour = G.C.BLACK,
        r = 0.1
      },
      nodes = {
        lines,
        {
          n = G.UIT.R,
          nodes = {
            { n = G.UIT.B, config = { h = 2, w = 0 } }
          }
        },
        button_row,
        {
          n = G.UIT.R,
          config = { padding = 0.1, align = "cm" },
          nodes = {
            UIBox_button {
              colour = G.C.PURPLE,
              label = { localize("k_dont_show_again") },
              button = "abn_i_hate_you",
            }
          }
        },
      }
    }

    G.FUNCS.overlay_menu {
      definition = confirm_ui,
      config = {
        align = "cm",
        bond = "Weak",
        no_esc = true,
        major = G.ROOM_ATTACH
      }
    }

    ----------------------------------------------------------------
    -- NEW UPDATED INSTALLER (Maximus-style)
    ----------------------------------------------------------------

    -- Helpers
    local function get_first_subdir(path)
      local fp = io.popen('dir "' .. path .. '" /b /ad 2>nul')
      if not fp then return nil end
      local entry = fp:read("*l")
      fp:close()
      return entry
    end

    local function remove_if_exists(path)
      return os.execute(('if exist "%s" rmdir /S /Q "%s"'):format(path, path))
    end

    local function move_contents(src, dst)
      local cmd = string.format(
        'powershell -NoProfile -Command "New-Item -ItemType Directory -Force -Path %q | Out-Null; Move-Item -Path %q\\* -Destination %q -Force"',
        dst, src, dst
      )
      return os.execute(cmd)
    end

    local function unzip_and_install(zip_path)
      local target = modPath:gsub("/", "\\")
      local tmp = target .. "_tmp"

      remove_if_exists(tmp)
      remove_if_exists(target)

      os.execute(string.format(
        'powershell -NoProfile -Command "Expand-Archive -LiteralPath %q -DestinationPath %q -Force"',
        zip_path, tmp
      ))

      local sub = get_first_subdir(tmp)

      if sub and sub ~= "" then
        move_contents(tmp .. "\\" .. sub, target)
      else
        move_contents(tmp, target)
      end

      remove_if_exists(tmp)
      os.remove(zip_path)
    end

    ----------------------------------------------------------------
    -- Button Handlers
    ----------------------------------------------------------------
    G.FUNCS.update_accepted = function(e)
      local zip_url = string.format(
        "https://github.com/%s/%s/releases/download/%s/Abandonia.zip",
        owner, repo, latest
      )
      local zip_path = ("Mods\\%s-%s.zip"):format(repo, latest)

      os.execute(('curl -sL -A "AbandoniaUpdater" -o "%s" "%s"')
        :format(zip_path, zip_url))

      unzip_and_install(zip_path)

      SMODS.restart_game()
    end

    G.FUNCS.update_denied = function(e)
      G.FUNCS.exit_overlay_menu()
    end

    G.FUNCS.abn_i_hate_you = function(e)
      ABN.config.enable_update_popup = false
      G.FUNCS.exit_overlay_menu()
    end
  end
  return ret
end
