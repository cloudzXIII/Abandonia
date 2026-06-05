SMODS.Joker {
  key = 'ballistic_glass_joker',
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    return {
      vars = {
        card.ability.extra.h_x_mult,
        card.ability.extra.x_chips,
        card.ability.extra.dollars,
      },
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 2, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      h_x_mult=1.5,
      x_chips=2,
      dollars=5,
    },

  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_glass") then
        return {
          x_chips=card.ability.extra.x_chips,
          dollars=-card.ability.extra.dollars,
        }
      end
    end
    if context.individual and context.cardarea == G.hand then
        if SMODS.has_enhancement(context.other_card,"m_glass") then
        if context.other_card.debuff then
            return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED,
                    card = self,
            }
        end
        return {
            x_mult=card.ability.extra.h_x_mult,
        }
        end
    end
  end,

  enhancement_gate = "m_glass",

  abn_artist_credits = {
    artist = "Ricottakitten",
  },
}

local l_pseudorandom_probability=SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
    local ret = l_pseudorandom_probability(trigger_obj,seed,base_numerator,base_denominator,identifier,no_mod)
    if seed == "glass" and next(SMODS.find_card("j_abn_ballistic_glass_joker")) then
        ret=false
    end
    return ret
end