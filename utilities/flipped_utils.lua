SMODS.Consumable {
  key = 'flipside',
  set = 'Spectral',
  atlas = "AbandoniaSpectrals",
  pos = { x = 0, y = 0 },
  config = { max_highlighted = 3, },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.max_highlighted } }
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    for _, v in ipairs(G.hand.highlighted) do
      v:flip()
      v.ability.abn_perma_flipped = true
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "lolhappy909_lol"
  },
}

-- HOOKS
local card_flip_ref = Card.flip
function Card:flip(bypass_perma_flipped)
  if not self.ability.abn_perma_flipped or bypass_perma_flipped then
    card_flip_ref(self)
  end
end

--[[ wait nevermind
local has_no_suit_ref = SMODS.has_no_suit
function SMODS.has_no_suit(card)
  if card.ability.abn_perma_flipped then
    return true
  end
  return has_no_suit_ref(card)
end

local has_no_rank_ref = SMODS.has_no_rank
function SMODS.has_no_rank(card)
  if card.ability.abn_perma_flipped then
    return true
  end
  return has_no_rank_ref(card)
end

local always_scores_ref = SMODS.always_scores
function SMODS.always_scores(card)
  if card.ability.abn_perma_flipped then
    return true
  end
  return always_scores_ref(card)
end
--]]

SMODS.Atlas {
  key = "flipped_indicator",
  path = "flipped_indicator.png",
  px = 71,
  py = 95
}

local oldmainmenu = Game.main_menu
function Game:main_menu(change_context)
  local g = oldmainmenu(self, change_context)
  G.shared_abn_flipped_indicator = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["abn_flipped_indicator"],
    { x = 1, y = 0 })
  return g
end

SMODS.DrawStep {
  key = 'flipped_indicator',
  order = 90,
  func = function(self, card)
    if self.ability.abn_perma_flipped then
      G.shared_abn_flipped_indicator.role.draw_major = self
      G.shared_abn_flipped_indicator:draw_shader('dissolve', nil, nil, nil, self.children.center)
    end
  end,
  conditions = { vortex = false, facing = 'back' },
}
