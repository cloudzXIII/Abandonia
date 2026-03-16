ABANDONIA = {}

ABN = SMODS.current_mod

ABN.description_loc_vars = function()
  return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

ABN.optional_features = {
  retrigger_joker = true,
  quantum_enhancements = true,
  post_trigger = true,
}

SMODS.Atlas({
  key = "AbandoniaTags",
  path = "tags.png",
  px = 34,
  py = 34,
})

SMODS.Atlas({
  key = "AbandoniaJokers",
  path = "jokers_1.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaReverse",
  path = "reverse_legendary.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = 'AbandoniaBlinds',
  path = 'blinds.png',
  px = 34,
  py = 34,
  frames = 21,
  atlas_table = 'ANIMATION_ATLAS'
})

SMODS.Atlas({
  key = "AbandoniaSpectrals",
  path = "spectrals.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaPlanets",
  path = "planets.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaTarots",
  path = "tarots.png",
  px = 71,
  py = 95,
})

SMODS.Atlas({
  key = "AbandoniaEnhancements",
  path = "enhancements.png",
  px = 71,
  py = 95,
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

local subdir = "content/misc"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
  assert(SMODS.load_file(subdir .. "/" .. filename))()
end
ABN.calculate = function(self, context)
  -- Shadowy Joker
  if #SMODS.find_card("j_abn_shadowy_joker", true) > 0 then
    local card_areas = { G.jokers, G.consumeables, G.shop_jokers, G.pack_cards }
    for _, area in ipairs(card_areas) do
      if area and area.cards then
        for _, v in ipairs(area.cards) do
          if v.facing == "front" then
            v:flip()
            v.shadowy_flipped = true
          end
        end
      end
    end
  end

  if context.individual and context.cardarea == G.play then
    if context.other_card.ability.abn_perma_flipped then
      return {
        x_mult = 1.25
      }
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
