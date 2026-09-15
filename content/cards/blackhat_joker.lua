-- Black Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'blackhat_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 3, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 15, mult = 8 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local has_program = false
      local solid_state_count = 0

      for _, consumeable in ipairs(G.consumeables.cards or {}) do
        if consumeable.ability then
          if consumeable.ability.set == "program_pack" then
            has_program = true
          elseif consumeable.ability.set == "solid_state" then
            solid_state_count = solid_state_count + 1
          end
        end
      end

      local ret = {}

      if has_program then
        ret.chips = card.ability.extra.chips
      end

      if solid_state_count > 0 then
        ret.mult = card.ability.extra.mult * solid_state_count
      end

      if ret.chips or ret.mult then
        return ret
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },

  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.program_pack and
        G.GAME.consumeable_usage_total.program_pack > 0
  end,
}