SMODS.Joker {
  key = 'chips_to_mult', -- Mult Matthew
  rarity = 3,
  abn_coder = "ImaginaryNeon",
  atlas = 'ABNJokerSheet23',
  pos = { x = 0, y = 0 },
  --atlas = 'jonklers', -- test sprites from my own mod
  --pos = { x = 2, y = 3 }, -- Stupendi-Joker
  cost = 8,
  discovered = false,
  blueprint_compat = false,
  demicoloncompat = false,
  config = { extra = { mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.post_trigger and not context.blueprint then
      local other_ret = context.other_ret.jokers or {}
      --print("other_ret good")
      if other_ret.chips --[[and not (context.other_card.config.center.key == card.config.center.key)]] then
        --print("other_ret.jokers.chips good")
        return {
          mult = tonumber(other_ret.chips),
          message_card = card,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "GM36",
  }
}
