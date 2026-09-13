SMODS.Joker {
  key = 'mult_to_chips', -- Bonus Bradly
  rarity = 2,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet23',
  pos = { x = 1, y = 0 },
  --atlas = 'jonklers', -- test sprites from my own mod
  --pos = { x = 5, y = 4 }, -- Cheat Code
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  demicoloncompat = false,
  config = { extra = { chips = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.post_trigger and not context.blueprint then
      local other_ret = context.other_ret.jokers or {}
      local mult = (other_ret.mult or 0) + (other_ret.h_mult or 0) + (other_ret.mult_mod or 0)
      if mult > 0 --[[and not (context.other_card.config.center.key == card.config.center.key)]] then
        return {
          chips = mult,
          message_card = card,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  }
}
