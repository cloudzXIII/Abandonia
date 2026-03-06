local abn_card_h_popup_ref = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
  local ret_val = abn_card_h_popup_ref(card)
  local obj = card.config.center or (card.config.tag and G.P_TAGS[card.config.tag.key])
  if card.area and card.area.config.collection and not card.config.center.discovered then return ret_val end
  if obj and obj.abn_artist_credits then
    table.insert(ret_val.nodes[1].nodes[1].nodes[1].nodes,
      abn_artist_node(obj.abn_artist_credits, "Art by "))
  end
  return ret_val
end

local abn_create_mod_badges_ref = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
  if not SMODS.config.no_mod_badges and obj and obj.mod and obj.mod.display_name and not obj.no_mod_badges then
    abn_create_mod_badges_ref(obj, badges)
  end
end

function abn_artist_node(artists, header_text)
  if artists.artist then
    artists = { artists }
  end

  local artist_node = {
    n = G.UIT.R,
    config = { align = 'tm' },
    nodes = {
      {
        n = G.UIT.T,
        config = {
          text = header_text or "Art by ",
          shadow = true,
          colour = G.C.UI.BACKGROUND_WHITE,
          scale = 0.27
        }
      }
    }
  }

  for i, artist_data in ipairs(artists) do
    table.insert(artist_node.nodes,
      {
        n = G.UIT.O,
        config = {
          object = DynaText({
            string = artist_data.artist,
            colours = { artist_data.colour or G.C.WHITE },
            bump = true,
            silent = true,
            pop_in = 0,
            pop_in_rate = 4,
            shadow = true,
            y_offset = -0.6,
            scale = 0.27
          })
        }
      }
    )
  end
  return artist_node
end

-- Credits Tab
SMODS.current_mod.credits_tab = function()
  local loc_nodes = {}

  localize {
    type = "descriptions",
    set = "Other",
    key = "abn_credits",
    nodes = loc_nodes,
    vars = {}
  }

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
        nodes =
        {
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
              desc_from_rows(loc_nodes, true, 7)
            }
          },
        }
      },
    }
  }
end
