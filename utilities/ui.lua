-- Main Mod Tab
ABN.custom_ui = function(modNodes)
  modNodes[1].nodes[1].config.colour = G.C.BLUE

  G.abn_desc_area = CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    4.25 * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
  )

  local abn_jokers = ABN.get_resource_by_key("j_abn")
  local random_jokers = {}

  pseudoshuffle(abn_jokers, pseudoseed("abn_ui_seed"))
  for i = 1, 5 do
    random_jokers[#random_jokers + 1] = abn_jokers[1]
    table.remove(abn_jokers, 1)
  end

  for i, key in ipairs(random_jokers) do
    local card = Card(G.abn_desc_area.T.x + G.abn_desc_area.T.w / 2, G.abn_desc_area.T.y,
      G.CARD_W, G.CARD_H, G.P_CARDS.empty,
      G.P_CENTERS[key])
    G.abn_desc_area:emplace(card)
    card:juice_up()
  end

  modNodes[#modNodes + 1] = {
    n = G.UIT.R,
    config = { align = "cm", padding = 0.07, no_fill = true },
    nodes = {
      { n = G.UIT.O, config = { object = G.abn_desc_area } }
    }
  }
end
