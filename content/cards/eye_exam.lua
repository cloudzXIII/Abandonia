SMODS.Joker {
  key = 'eye_exam',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 0, y = 1 },
  cost = 2,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { dollars = 1 } },

  abn_artist_credits = {
    artist = "Skittleskitty"
  },
}


--#region eye BUTTON UI
local function xiii_eye_UIButton(card)
  return UIBox {
    definition = {
      n = G.UIT.ROOT,
      config = {
        colour = G.C.CLEAR
      },
      nodes = {
        {
          n = G.UIT.C,
          config = { ref_table = card, align = "cl", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, button = 'eye_exam_button_click', func = 'eye_exam_button_func' },
          nodes = {
            { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
            { n = G.UIT.T, config = { text = "REVEAL", colour = G.C.UI.TEXT_LIGHT, scale = 0.65, shadow = true } },
            { n = G.UIT.T, config = { text = "$1", colour = G.C.UI.TEXT_LIGHT, scale = 0.65, shadow = true } }
          }
        }
      }
    },
    config = {
      align = 'cl',
      major = card,
      parent = card,
      offset = { x = 0.2, y = 0 }
    }
  }
end

G.FUNCS.eye_exam_button_click = function(e)
  local card = e.config and e.config.ref_table
  ease_dollars(-1)
  for i = 1, #G.hand.cards do
    if G.hand.cards[i].facing == 'back' then
      G.hand.cards[i]:flip()
    end
  end
  return {
    message = localize('k_abn_unflipped'),
    colour = G.C.FILTER,
    message_card = card
  }
end

G.FUNCS.eye_exam_button_func = function(e)
  local card = e.config and e.config.ref_table
  local condition = false
  if G.GAME.dollars >= card.ability.extra.dollars and G.hand then
    for i = 1, #G.hand.cards do
      if G.hand.cards[i].facing == 'back' then
        condition = true
      end
    end
    if condition then
      e.config.colour = G.C.RED
      e.config.button = 'eye_exam_button_click'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
  end
end

SMODS.DrawStep {
  key = 'eye_exam_button',
  order = -30,
  func = function(card, layer)
    if card.children.eye_exam_button then
      card.children.eye_exam_button:draw()
    end
  end
}

SMODS.draw_ignore_keys.eye_exam_button = true

local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
  if is_highlighted and self.ability.set == "Joker" and self.area == G.jokers and self.config.center.key == "j_abn_eye_exam" then
    self.children.eye_exam_button = xiii_eye_UIButton(self)
  elseif self.children.eye_exam_button then
    self.children.eye_exam_button:remove()
    self.children.eye_exam_button = nil
  end

  return highlight_ref(self, is_highlighted)
end

--#endregion
