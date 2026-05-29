-- Credits Tab

SMODS.Atlas {
  key = 'ABNExternal',
  path = 'external_tags.png',
  px = 34,
  py = 34,
}
SMODS.Atlas { -- tysm inky these are lovely - cloudz
  key = 'ABNCredits',
  path = 'credits.png',
  px = 71,
  py = 95,
}

--#region Cards for credits :>
SMODS.ObjectType {
  key = "abn_credit_card",
  primary_colour = G.C.BLUE,
  secondary_colour = HEX("734933"),

  process_loc_text = function(self)
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_' .. string.lower(self.key), self.loc_txt, 'name')
    SMODS.process_loc_text(G.localization.descriptions.Other, 'undiscovered_' .. string.lower(self.key),
      self.loc_txt, 'undiscovered')

    G.C.SECONDARY_SET[self.key] = self.secondary_colour
    G.C.SET[self.key] = self.primary_colour
  end,
};
ABN.CreditCard = SMODS.Center:extend({
  class_prefix = "credit",
  set = "abn_credit_card",
  atlas = "abn_ABNCredits",
  pos = { x = 0, y = 0 },
  discovered = true,
  required_params = {
    "key",
  },
  config = {},
  no_mod_badges = true,
  inject = function(self)
    SMODS.Center.inject(self)
  end,
  set_card_type_badge = function(self, card, badges)
  end,
})
ABN.CreditCard {
  key = "bunnet",
  pos = { x = 0, y = 0 },
}
ABN.CreditCard {
  key = "cloudzXIII",
  pos = { x = 1, y = 0 },
  soul_pos = { x = 1, y = 1 },
}
ABN.CreditCard {
  key = "ericthetoon",
  pos = { x = 2, y = 0 },
  soul_pos = { x = 2, y = 1 },
}
ABN.CreditCard {
  key = "doggfly",
  pos = { x = 3, y = 0 },
}
ABN.CreditCard {
  key = "comykel",
  pos = { x = 4, y = 0 },
}
ABN.CreditCard {
  key = "vega",
  pos = { x = 5, y = 0 },
  soul_pos = { x = 5, y = 1 },
}
--#endregion

ABN.contributors = {
  {
    key = "credit_abn_cloudzXIII",
    name = "cloudzXIII",
    role = "Lead Dev",
    has_icon = true,
    colour = G.C.GOLD,
    links = {
      { url = "github.com/cloudzXIII", pos = { x = 0, y = 0 }, name = "Github" },
      { url = "ko-fi.com/cloudzxiii",  pos = { x = 0, y = 1 }, name = "Buy me a Coffee!" }
    }
  },
  {
    key = "credit_abn_bunnet",
    name = "Bunnet",
    has_icon = true,
    role = "Founder",
    colour = G.C.DARK_EDITION,
    links = {
      { url = "github.com/Bunnetdeluz", pos = { x = 0, y = 0 }, name = "Github" },
    }
  },
  {
    key = "credit_abn_ericthetoon",
    name = "EricTheToon",
    role = "Lead Dev",
    has_icon = true,
    colour = G.C.GOLD,
    links = {
      { url = "github.com/EricTheToon", pos = { x = 0, y = 0 }, name = "Github" },
    }
  },
  {
    key = "credit_abn_coderevo",
    name = "Revo",
    role = "Programmer",
    colour = G.C.BLUE,
    links = {
      { url = "github.com/Cdrvo", pos = { x = 0, y = 0 }, name = "Github" }
    }
  },
  {
    key = "credit_abn_deleteduser",
    name = "Deleted User",
    role = "Programmer",
    colour = G.C.BLUE,
    links = {
      { url = "github.com/marcoosgiam", pos = { x = 0, y = 0 }, name = "Github" },
    }
  },
  {
    key = "credit_abn_j8bit",
    name = "J8-Bit",
    role = "Programmer",
    colour = G.C.BLUE,
    links = {
      { url = "github.com//orangequilavaburst", pos = { x = 0, y = 0 }, name = "Github" }
    }
  },
  {
    key = "credit_abn_vega",
    name = "Vega",
    has_icon = true,
    role = "Artist",
    colour = G.C.GREEN,
    links = {
      { url = "github.com/VegaTheAvali", pos = { x = 0, y = 0 }, name = "Github" }
    }
  },
  {
    key = "credit_abn_comykel",
    name = "Comykel",
    has_icon = true,
    role = "Artist",
    colour = G.C.GREEN,
    links = {
      { url = "github.com/comykel", pos = { x = 0, y = 0 }, name = "Github" }
    }
  },
  {
    key = "credit_abn_inky",
    name = "Inky",
    role = "Artist",
    colour = G.C.GREEN,
    links = {
      { url = "github.com/InkystA", pos = { x = 0, y = 0 }, name = "Github" }
    }
  },
  {
    key = "credit_abn_feli",
    name = "Feli",
    role = "Coder",
    colour = G.C.BLUE,
    links = {
      { url = "github.com/LasagnaFelidae", pos = { x = 0, y = 0 }, name = "Github" },
      { url = "ko-fi.com/lasagnafelidae",  pos = { x = 0, y = 1 }, name = "Buy me a Coffee!" }
    }
  },
  {
    key = "credit_abn_marffe",
    name = "Marffe",
    role = "Programmer",
    colour = G.C.BLUE,
    links = {
      { url = "github.com/Marffe", pos = { x = 0, y = 0 }, name = "Github" },
    }
  },
  {
    key = "credit_abn_rkart",
    name = "RKart",
    role = "Music",
    colour = G.C.RED,
    links = {
      { url = "youtube.com/@RKart-Musica", pos = { x = 0, y = 2 }, name = "Youtube" },
    }
  },
  {
    key = "credit_abn_firch",
    name = "Firch",
    role = "Music",
    colour = G.C.RED,
    links = {
      { url = "github.com/Firch", pos = { x = 0, y = 0 }, name = "Github" },
    }
  },
  {
    key = "credit_abn_doggfly",
    name = "Dogg-Fly",
    role = "Artist",
    has_icon = true,
    colour = G.C.GREEN,
    links = {
      { url = "github.com/Dogg-Fly", pos = { x = 0, y = 0 }, name = "Github" },
    }
  }
}

--#region Credits Tab
function ABN.generate_credit_card(contributor)
  local desc_nodes = {}
  localize({
    type = "descriptions",
    set = "abn_credit_card",
    key = contributor.key,
    nodes = desc_nodes,
    vars = {}
  })
  local text_rows = {}
  for _, v in ipairs(desc_nodes) do
    text_rows[#text_rows + 1] = {
      n = G.UIT.R,
      config = { align = "cm" },
      nodes = v
    }
  end

  --#region Link tags
  local link_nodes = {}
  for _, link in ipairs(contributor.links) do
    local sprite = Sprite(0, 0, 0.75, 0.75, G.ASSET_ATLAS["abn_ABNExternal"], link.pos)

    sprite.states.collide.can = true

    function sprite:click()
      play_sound('button', 1, 0.3)
      love.system.openURL("https://" .. link.url)
    end

    function sprite:hover()
      sprite:juice_up(0.05, 0.03)
      play_sound('paper1', math.random() * 0.2 + 0.9, 0.35)
      Node.hover(self)
    end

    function sprite:stop_hover()
      Node.stop_hover(self)
    end

    link_nodes[#link_nodes + 1] = {
      n = G.UIT.C,
      config = {
        align = "cm",
        padding = 0.05,
        colour = G.C.CLEAR,
        hover = true,
        shadow = true,
      },
      nodes = {
        {
          n = G.UIT.R,
          config = { align = "cm" },
          nodes = {
            {
              n = G.UIT.O,
              config = {
                object = sprite,
                tooltip = {
                  title = link.name,
                },
              },
            },
          },
        },
      },
    }
  end
  --#endregion

  local credit_area
  if contributor.has_icon then
    credit_area = CardArea(
      0, 0,
      0.75 * G.CARD_W,
      0.75 * G.CARD_H,
      { card_limit = 1, type = 'title_2', highlight_limit = 0, collection = true }
    )

    local card = Card(
      credit_area.T.x, credit_area.T.y,
      0.75 * G.CARD_W, 0.75 * G.CARD_H,
      G.P_CARDS.empty,
      G.P_CENTERS[contributor.key],
      {
        bypass_discovery_center = true,
        bypass_discovery_ui = true,
        bypass_lock = true,
        viewing_back = false,
      }
    )
    card.no_ui = true
    credit_area:emplace(card)
    card:start_materialize({ G.C.RED }, true)
  end

  return {
    n = G.UIT.C,
    config = { align = "cm", padding = 0.1 },
    nodes = {
      {
        n = G.UIT.R,
        config = {
          emboss = 0.05,
          r = 0.1,
          align = "cm",
          padding = 0.1,
          colour = G.C.L_BLACK,
          minw = 3.5,
        },
        nodes = {
          contributor.has_icon and {
            n = G.UIT.R,
            config = { align = 'cm', no_fill = true },
            nodes = {
              {
                n = G.UIT.O,
                config = {
                  object = credit_area
                }
              }
            }
          } or nil,
          {
            n = G.UIT.R,
            config = { align = 'cm' },
            nodes = {
              {
                n = G.UIT.C,
                config = { align = "cm" },
                nodes = {
                  {
                    n = G.UIT.T,
                    config = {
                      text = contributor.name,
                      colour = G.C.WHITE,
                      scale = 0.5,
                      shadow = true,
                    }
                  },
                }
              },
            }
          },
          {
            n = G.UIT.R,
            config = { align = 'cm' },
            nodes = {
              {
                n = G.UIT.C,
                config = { align = "cm" },
                nodes = {
                  {
                    n = G.UIT.T,
                    config = {
                      text = contributor.role,
                      colour = contributor.colour,
                      scale = 0.35,
                      shadow = true,
                    }
                  },
                }
              },
            }
          },
          {
            n = G.UIT.R,
            config = { padding = .05 },
            nodes = { {
              n = G.UIT.R,
              config = {
                minh = 1.5,
                emboss = -.05,
                r = .1,
                align = 'tm',
                padding = .1,
                colour = G.C.WHITE
              },
              nodes = { {
                n = G.UIT.R,
                config = {
                },
                nodes = text_rows
              } }
            } }
          },
          {
            n = G.UIT.R,
            config = {
              align = "cm",
              padding = -.3,
              no_fill = true
            },
            nodes = {
              {
                n = G.UIT.R,
                nodes = link_nodes
              }
            }
          },
        }
      }
    }
  }
end

function ABN.credits_tab()
  local title_text = DynaText({
    string = "Contributors",
    colours = { G.C.WHITE },
    shadow = true,
    float = true,
    silent = true,
    spacing = 5,
    scale = 1,
    rotate = true,
    pop_in = 0,
  })
  title_text.states.visible = false

  local credit_rows = {}
  local current_row = {}

  for i, contributor in ipairs(ABN.contributors) do
    current_row[#current_row + 1] = ABN.generate_credit_card(contributor)

    if #current_row == 3 or i == #ABN.contributors then
      credit_rows[#credit_rows + 1] = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.05 },
        nodes = current_row
      }
      current_row = {}
    end
  end

  local loc_nodes = {}

  localize {
    type = "descriptions",
    set = "Other",
    key = "abn_credits",
    nodes = loc_nodes,
    vars = {}
  }

  local scrollbox = SMODS.UIScrollBox({
    content = {
      definition = {
        n = G.UIT.ROOT,
        config = { colour = G.C.CLEAR, },
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
              desc_from_rows(loc_nodes, true, 7)
            }
          },
          {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.1 },
            nodes = {
              {
                n = G.UIT.C,
                config = { align = "cm" },
                nodes = credit_rows,
              }
            }
          },
        }
      },
      config = { align = "cm" },
    },
    overflow = {
      node_config = {
        maxh = 7,
        r = 0.1,
      },
    },
  })

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
        config = {
          r = 0.1,
          minw = 4,
          align = "tm",
          padding = 0.2,
          colour = G.C.BLACK
        },
        nodes = {
          {
            n = G.UIT.C,
            config = {
              align = "cm",
              padding = 0.3,
              colour = darken(G.C.BLACK, 0.2),
              emboss = 0.05,
              r = 0.1
            },
            nodes = {
              {
                n = G.UIT.O,
                config = {
                  align = "cm",
                  object = scrollbox,
                },
              },
              {
                n = G.UIT.C,
                config = { align = "cm" },
                nodes = {
                  SMODS.GUI.scrollbar({
                    h = 7,
                    w = 0.3,
                    scroll_mult = 1.5,
                    colour = ABN.badge_colour,
                    bg_colour = G.C.BLACK,
                    scroll_collision_obj = scrollbox,
                  }),
                },
              },
            }
          },
        }
      },
    }
  }
end
