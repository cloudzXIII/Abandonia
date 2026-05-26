-- Joker Stamp (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_stamp',

  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 7, y = 1 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  calculate = function(self, card, context)
    if context.create_booster_card and not context.blueprint then
      if pseudorandom("joker_stamp") > 0.8 then
        return {
          booster_create_flags = {
            set = "continent",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "joker_stamp",
          }
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Gud",
  },
}
