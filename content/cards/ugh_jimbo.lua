if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'ugh_jimbo',
  rarity = 3,
  atlas = 'AbandoniaLegendary', 
  pos = { x = 3, y = 8 }, 
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      emult = 0,
      emultadd = 4,
      quip_index = 1, -- Tracks which line he says next
    }
  },

  calculate = function(self, card, context)
    if context.joker_main then
      local quips_pool = {
        "Hey in other mods I am legendary you know?",
        "They got Deltarune in Fortlatro yet?",
        "You got games on that cellphone?",
        "Yo what up homie. That's what I would say if I had any friends",
        "You play Off? It's good!",
        "What's your bank password? - oops not supposed to ask that",
        "Beep boop I am computer",
        "Psss you wanna buy some mods?"
      }

      local current_quip = quips_pool[card.ability.extra.quip_index]

      card_eval_status_text(card, 'extra', nil, nil, nil, { message = current_quip, colour = G.C.ATTENTION })

      card.ability.extra.quip_index = card.ability.extra.quip_index + 1
      if card.ability.extra.quip_index > #quips_pool then
        card.ability.extra.quip_index = 1
        card.ability.extra.emult = card.ability.extra.emultadd
      end

      if card.ability.extra.emult > 0 then
        return {
          emult = card.ability.extra.emult,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Fridgemancer",
  },
}

end