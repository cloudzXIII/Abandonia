-- Calendar (coded by cloudzXIII)
SMODS.Joker {
  key = 'calendar',

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 3, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    return { vars = {}, }
  end,


  calculate = function(self, card, context)
    if G.GAME.blind.in_blind and context.fix_probability and context.trigger_obj and context.trigger_obj.config and context.trigger_obj.config.center and context.trigger_obj.config.center.set and context.trigger_obj.config.center.set == "astro_cards" then
      return { numerator = context.denominator }
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
