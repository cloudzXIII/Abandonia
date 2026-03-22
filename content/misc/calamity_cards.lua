loc_colour()
G.C.CALAMITY = HEX("c39854")
G.C.CALAMITY_SECONDARY = HEX("c3a37a")
G.ARGS.LOC_COLOURS["abn_Calamity"] = G.C.CALAMITY

SMODS.ConsumableType {
  key = "calamity_cards",
  collection_rows = { 6, 2 },
  shop_rate = 0.0,
  primary_colour = G.C.CALAMITY,
  secondary_colour = G.C.CALAMITY_SECONDARY,
  loc_txt = {
    collection = "Calamity Cards",
    name = "Calamity",
    undiscovered = {
      name = "Not Discovered",
      text = {
        "Purchase or use",
        "this card in an",
        "unseeded run to",
        "learn what it does"
      }
    },
  },
}

SMODS.Consumable {
  key = "cyclone",
  set = "calamity_cards",
  config = { extra = {} },
  pos = { x = 0, y = 0 },
  --atlas = "AbandoniaTarots",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  can_use = function(self, card)
    local edition = false
    for _, v in ipairs(G.jokers.cards) do
      if v.edition then
        edition = true
      end
    end
    for _, v in ipairs(G.playing_cards) do
      if v.edition then
        edition = true
      end
    end
    return edition
  end,
  use = function(self, card)
    for _, v in ipairs(G.jokers.cards) do
      if v.edition then
        SMODS.destroy_cards(v)
      end
    end
    for _, v in ipairs(G.playing_cards) do
      if v.edition then
        SMODS.destroy_cards(v)
      end
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        ease_dollars(G.GAME.dollars)
        return true
      end
    }))
    delay(0.6)
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}
