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

SMODS.DrawStep {
  key = 'stickers_flipped',
  order = 40,
  func = function(self, layer)
    if self.sticker and G.shared_stickers[self.sticker] then
      G.shared_stickers[self.sticker].role.draw_major = self
      G.shared_stickers[self.sticker]:draw_shader('dissolve', nil, nil, nil, self.children.center)
      G.shared_stickers[self.sticker]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
    elseif (self.sticker_run and G.shared_stickers[self.sticker_run]) and G.SETTINGS.run_stake_stickers then
      G.shared_stickers[self.sticker_run].role.draw_major = self
      G.shared_stickers[self.sticker_run]:draw_shader('dissolve', nil, nil, nil, self.children.center)
      G.shared_stickers[self.sticker_run]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children
        .center)
    end

    for k, v in pairs(SMODS.Stickers) do
      if self.ability[v.key] then
        if v and v.draw and type(v.draw) == 'function' then
          v:draw(self, layer)
        else
          G.shared_stickers[v.key].role.draw_major = self
          G.shared_stickers[v.key]:draw_shader('dissolve', nil, nil, nil, self.children.center)
          G.shared_stickers[v.key]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
        end
      end
    end
  end,
  conditions = { vortex = false, facing = 'back' },
}
