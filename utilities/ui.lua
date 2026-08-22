-- Main Mod Tab
ABN.custom_ui = function(modNodes)
  modNodes[1].nodes[1].config.colour = G.C.BLUE

  G.abn_desc_area = CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    4.25 * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
  )

  local abn_jokers = ABN.get_center_with_prefix({ "j_abn", "c_abn", "v_abn", "m_abn" })
  local random_jokers = {}

  pseudoshuffle(abn_jokers, pseudoseed("abn_ui_seed"))
  for i = 1, 5 do
    random_jokers[#random_jokers + 1] = abn_jokers[1]
    table.remove(abn_jokers, 1)
  end

  for i, key in ipairs(random_jokers) do
    local card = Card(G.abn_desc_area.T.x + G.abn_desc_area.T.w / 2, G.abn_desc_area.T.y,
      G.CARD_W, G.CARD_H, G.P_CARDS.empty,
      G.P_CENTERS[key])
    G.abn_desc_area:emplace(card)
    card:juice_up()
  end

  modNodes[#modNodes + 1] = {
    n = G.UIT.R,
    config = { align = "cm", padding = 0.07, no_fill = true },
    nodes = {
      { n = G.UIT.O, config = { object = G.abn_desc_area } }
    }
  }
end

-- Config Tab
ABN.config_tab = function()
  local title_text = DynaText({
    string = "Settings",
    colours = { G.C.WHITE },
    shadow = true,
    float = true,
    silent = true,
    spacing = 5,
    scale = 1.3,
    rotate = true,
    pop_in = 0,
  })
  title_text.states.visible = false

  return {
    n = G.UIT.ROOT,
    config = {
      emboss = 0.05,
      r = 0.1,
      align = "tm",
      padding = 0.2,
      colour = G.C.BLACK
    },
    nodes = {
      {
        n = G.UIT.R,
        config = { r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.5, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                  { n = G.UIT.O, config = { object = title_text } },
                }
              },
              {
                n = G.UIT.R,
                config = { align = "cm", no_fill = true },
                nodes = {
                  {
                    n = G.UIT.C,
                    config = {
                      align = "cm",
                      r = 0.1,
                      emboss = 0.1,
                      padding = 0.14
                    },
                    nodes = {
                      create_toggle({
                        id = "enable_music",
                        ref_table = ABN.config,
                        ref_value = "Music",
                        label = localize("k_abn_config_toggle_music"),
                        info = {
                          G.localization.misc.dictionary.abn_toggle_music,
                        },
                      }),
                      create_toggle({
                        id = "show_credits",
                        ref_table = ABN.config,
                        ref_value = "show_credits",
                        label = localize("k_abn_config_show_credits"),
                        info = {
                          G.localization.misc.dictionary.abn_show_credits,
                        },
                      }),
                      create_toggle({
                        id = "enable_logo",
                        ref_table = ABN.config,
                        ref_value = "enable_logo",
                        label = localize("k_abn_config_enable_logo"),
                      }),
                    }
                  },
                  {
                    n = G.UIT.C,
                    config = {
                      align = "cm",
                      r = 0.1,
                      emboss = 0.1,
                      padding = 0.14
                    },
                    nodes = {
                      create_toggle({
                        id = "enable_update_popup",
                        ref_table = ABN.config,
                        ref_value = "enable_update_popup",
                        label = localize("k_abn_config_enable_update_popup"),
                      }),
                      create_toggle({
                        id = "disable_flipped_stakes",
                        ref_table = ABN.config,
                        ref_value = "disable_flipped_stakes",
                        label = localize("k_abn_config_disable_flipped_stakes"),
                        info = {
                          G.localization.misc.dictionary.abn_disable_flipped_stakes,
                        },
                      }),
                    }
                  },
                }
              },
              {
                n = G.UIT.R,
                config = { padding = 0.1, align = "cm" },
                nodes = {
                  {
                    n = G.UIT.T,
                    config = {
                      text = localize("abn_requires_restart"),
                      colour = G.C.JOKER_GREY,
                      scale = 0.4,
                      padding = 0.1,
                      align = "cm",
                    },
                  },
                },
              },
            }
          },
        }
      },
    }
  }
end

-- Crossmod Tab

local function button_with_tooltip(args)
  local button = UIBox_button(args)
  if args.tooltip then
    button.nodes[1].config.tooltip = {
      title = args.label and args.label[1] or "",
      text = { args.tooltip },
    }
  end
  return button
end

ABN.crossmod_tab = function()
  local title_text = DynaText({
    string = localize("k_abn_crossmod"),
    colours = { G.C.DARK_EDITION },
    shadow = true,
    float = true,
    silent = true,
    spacing = 5,
    scale = 1.3,
    rotate = true,
    pop_in = 0,
  })
  title_text.states.visible = false

  return {
    n = G.UIT.ROOT,
    config = {
      emboss = 0.05,
      r = 0.1,
      align = "tm",
      padding = 0.2,
      colour = G.C.BLACK
    },
    nodes = {
      {
        n = G.UIT.R,
        config = { r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.5, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 },
            nodes = {
              {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                  { n = G.UIT.O, config = { object = title_text } },
                },
              },
              {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.2 },
                nodes = {
                  button_with_tooltip({
                    minw = 2.5,
                    colour = HEX("8b61ad"),
                    button = "abn_aij",
                    label = { localize("k_abn_crossmod_aij") },
                    tooltip = localize("k_abn_crossmod_aij_info"),
                    col = true,
                  }),
                  button_with_tooltip({
                    minw = 2.5,
                    colour = HEX("672A62"),
                    button = "abn_fortlatro",
                    label = { localize("k_abn_crossmod_fortlatro") },
                    tooltip = localize("k_abn_crossmod_fortlatro_info"),
                    col = true,
                  }),
                },
              },
              {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.2 },
                nodes = {
                  button_with_tooltip({
                    minw = 2.5,
                    colour = HEX("990000"),
                    button = "abn_ortalab",
                    label = { localize("k_abn_crossmod_ortalab") },
                    tooltip = localize("k_abn_crossmod_ortalab_info"),
                    col = true,
                  }),
                  button_with_tooltip({
                    minw = 2.5,
                    colour = G.C.SECONDARY_SET.Spectral,
                    button = "abn_spectrallib",
                    label = { localize("k_abn_crossmod_spectrallib") },
                    tooltip = localize("k_abn_crossmod_spectrallib_info"),
                    col = true,
                  }),
                },
              },
            },
          },
        },
      },
    },
  }
end
ABN.extra_tabs = function()
  return {
    label = localize("k_abn_crossmod"),
    tab_definition_function = ABN.crossmod_tab,
  }
end

G.FUNCS.abn_aij = function(e)
  love.system.openURL("https://github.com/survovoaneend/All-In-Jest")
end

G.FUNCS.abn_fortlatro = function(e)
  love.system.openURL("https://github.com/EricTheToon/Fortlatro")
end

G.FUNCS.abn_ortalab = function(e)
  love.system.openURL("https://github.com/EremelMods/Ortalab")
end

G.FUNCS.abn_spectrallib = function(e)
  love.system.openURL("https://github.com/SpectralPack/Spectrallib")
end
