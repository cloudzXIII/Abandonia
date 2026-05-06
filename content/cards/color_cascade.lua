SMODS.Joker {
  key = 'color_cascade',
  rarity = 2,
  atlas = 'ABNJokerSheet8',
  pos = { x = 4, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  abn_artist_credits = {
    artist = "Yahooyowza",
  },
}

local smods_four_fingers_ref = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card("j_abn_color_cascade")) then
        return 1
    end
    return smods_four_fingers_ref()
end