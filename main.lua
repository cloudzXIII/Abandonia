ABN = SMODS.current_mod

ABN.description_loc_vars = function()
  return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

SMODS.Atlas({
  key = "AbandoniaJokers",
  path = "jokers_1.png",
  px = 71,
  py = 95,
})


SMODS.load_file("utilities/credits.lua")()
SMODS.load_file("utilities/functions.lua")()

-- Jokers
local subdir = "cards"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
  assert(SMODS.load_file(subdir .. "/" .. filename))()
end
