local config = SMODS.current_mod.config

SMODS.Sound({
  key = 'music_happy',
  path = 'music_happy.ogg',
  pitch = 1,
  speed = 1,
  select_music_track = function(self)
    -- If it's happy time play music
    if G.jokers then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j.config.center.key and j.config.center.key == 'j_abn_marmalize_joker' and config.Music ~= false then
          return 1e10
        end
      end
    end
  end
})

local Card_set_debuff = Card.set_debuff
function Card:set_debuff(should_debuff)
  if self.config and self.config.center and self.config.center.set == "Joker" and next(SMODS.find_card("j_abn_marmalize_joker")) then -- joker can't be debuffed
    self.debuff = false
    return
  end
  Card_set_debuff(self, should_debuff)
end

SMODS.Joker {
  key = 'marmalize_joker',
  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet5',
  pos = { x = 6, y = 4 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 20, chips = 30, owned = 0 } },

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
      }
    }
  end,

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
    if card.ability.owned == 1 then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        -- Remove all stickers
        for _, sticker in ipairs(SMODS.Sticker.obj_buffer) do
          if j.ability[sticker] then j:remove_sticker(sticker) end
        end
      end
    end
  end,

  add_to_deck = function(self, card)
    card.ability.owned = 1
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]

        -- Gain chips and mult
        j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
        j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
      end
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
