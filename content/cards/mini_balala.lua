if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'mini_balala',
  rarity = 2,
  atlas = 'ABNJokerSheet17', 
  pos = { x = 2, y = 1 }, 
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      gnome_odds = 4,
      bazooka_odds = 7,
      lawsuit_odds = 10
    }
  },

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = G.P_CENTERS.c_fn_LTMGnome
	info_queue[#info_queue + 1] = G.P_CENTERS.c_fn_LTMBazooka
	info_queue[#info_queue + 1] = G.P_CENTERS.c_fn_LTMFTC
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.gnome_odds,
        card.ability.extra.bazooka_odds,
        card.ability.extra.lawsuit_odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.selling_card then
      local sold_card = context.card
      if not sold_card or not sold_card.config or not sold_card.config.center then return end
      if sold_card.config.center.set == "Joker" then
        
        if pseudorandom('mini_balala_gnome') < G.GAME.probabilities.normal / card.ability.extra.gnome_odds then
          if #G.consumeables.cards >= 0 then
            SMODS.add_card({
              set = 'Consumeables',
              key = 'c_fn_LTMGnome',
              area = G.consumeables
            })
            card:juice_up()
          end
        end

        if pseudorandom('mini_balala_bazooka') < G.GAME.probabilities.normal / card.ability.extra.bazooka_odds then
          if #G.consumeables.cards >= 0 then
            SMODS.add_card({
              set = 'Consumeables',
              key = 'c_fn_LTMBazooka',
              area = G.consumeables
            })
            card:juice_up()
          end
        end

        if pseudorandom('mini_balala_lawsuit') < G.GAME.probabilities.normal / card.ability.extra.lawsuit_odds then
          if #G.consumeables.cards >= 0 then
            SMODS.add_card({
              set = 'Consumeables',
              key = 'c_fn_LTMFTC',
              area = G.consumeables
            })
            card:juice_up()
          end
        end

      end
    end
  end,

  abn_artist_credits = {
    artist = "Fridgemancer",
  },
}

end