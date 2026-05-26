-- Main Mod Tab
ABN.custom_ui = function(modNodes)
  modNodes[1].nodes[1].config.colour = G.C.BLUE

  G.abn_desc_area = CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    4.25 * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
  )

  local abn_jokers = ABN.get_resource_by_key("j_abn")
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
                    n = G.UIT.R,
                    config = {
                      align = "cm",
                      r = 0.1,
                      emboss = 0.1,
                      outline = 1,
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
                    }
                  },
                }
              },
            }
          },
        }
      },
    }
  }
end
