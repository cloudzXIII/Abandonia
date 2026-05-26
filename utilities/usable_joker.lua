---@diagnostic disable: duplicate-set-field
-- Modified code from spectrallib
-- Borrowed this modified code Final Mix who modified it from SynthB
-- (check them out here: https://github.com/cloudzXIII/FinalMix and https://github.com/Foo54/SynthB)

G.FUNCS.abn_can_use_joker = function(e)
  local center = e.config.ref_table.config.center
  local card = e.config.ref_table

  local config = center.abn_use_config or {}
  card._abn_use_key = config.text or localize("b_use")

  if center.can_use and center:can_use(e.config.ref_table) and not e.config.ref_table.debuff
      and G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT
      and not (((G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)))
  then
    e.config.colour = config.colour or G.C.RED
    e.config.button = "abn_use_joker"
  else
    e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    e.config.button = nil
  end
end
G.FUNCS.abn_use_joker = function(e)
  local int = G.TAROT_INTERRUPT
  G.TAROT_INTERRUPT = true
  local center = e.config.ref_table.config.center
  if center.use then
    center:use(e.config.ref_table)
  end
  e.config.ref_table:juice_up()
  G.TAROT_INTERRUPT = int
end

local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
  local abc = G_UIDEF_use_and_sell_buttons_ref(card)
  if (card.area == G.jokers and G.jokers and card.config.center.use) and not card.debuff and card.config.center.set == "Joker" then
    local config = card.config.center.abn_use_config or {}
    local text = config.text or localize("b_use")
    local text_colour = config.text_colour or G.C.UI.TEXT_LIGHT
    local cost = config.cost

    local sell = {
      n = G.UIT.C,
      config = { align = "cr" },
      nodes = {
        {
          n = G.UIT.C,
          config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card', handy_insta_action = 'sell' },
          nodes = {
            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
            {
              n = G.UIT.C,
              config = { align = "tm" },
              nodes = {
                {
                  n = G.UIT.R,
                  config = { align = "cm", maxw = 1.25 },
                  nodes = {
                    { n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                  }
                },
                {
                  n = G.UIT.R,
                  config = { align = "cm" },
                  nodes = {
                    { n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4, shadow = true } },
                    { n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55, shadow = true } }
                  }
                }
              }
            }
          }
        },
      }
    }

    local use_button_nodes = {}

    table.insert(use_button_nodes, {
      n = G.UIT.R,
      config = { align = "cm", maxw = 1.25 },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = text,
            colour = text_colour,
            scale = 0.55,
            shadow = true
          }
        }
      }
    })

    if cost then
      table.insert(use_button_nodes, {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
          {
            n = G.UIT.T,
            config = {
              text = localize('$'),
              colour = G.C.WHITE,
              scale = 0.4,
              shadow = true
            }
          },
          {
            n = G.UIT.T,
            config = {
              text = tostring(cost),
              colour = config.cost_colour or G.C.WHITE,
              scale = 0.55,
              shadow = true
            }
          }
        }
      })
    end

    local transition = {
      n = G.UIT.C,
      config = { align = "cr" },
      nodes = {
        {
          n = G.UIT.C,
          config = { ref_table = card, align = "cm", padding = 0.1, r = 0.08, minw = 1.25, minh = 0.8, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, button = 'abn_use_joker', func = "abn_can_use_joker", handy_insta_action = 'use' },
          nodes = {
            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
            {
              n = G.UIT.C,
              config = { align = "cm" },
              nodes = use_button_nodes
            },
          }
        },
      }
    }
    return {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.15, align = 'cl' },
          nodes = {
            {
              n = G.UIT.R,
              config = { align = 'cl' },
              nodes = {
                sell
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cl' },
              nodes = {
                transition
              }
            },
          }
        },
      }
    }
  end
  return abc
end
