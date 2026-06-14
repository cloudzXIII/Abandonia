if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'joker_fortnite',
  rarity = 1,
  atlas = 'ABNJokerSheet17', 
  pos = { x = 8, y = 0 }, 
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
		xmult = 1,
		xmultadd = 1,
		mult = 0,
		multadd = 10,
    }
  },

  loc_vars = function(self, info_queue, card)
    local installed = G.GAME.FortniteInstalled
    local status_text = installed and "INSTALLED" or "NOT INSTALLED"
    local badge_colour = installed and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)

    local main_end = {
      {
        n = G.UIT.C,
        config = { align = "bm", minh = 0.4 },
        nodes = {
          {
            n = G.UIT.C,
            config = { 
              ref_table = card, 
              align = "m", 
              colour = badge_colour, 
              r = 0.05, 
              padding = 0.06 
            },
            nodes = {
              { 
                n = G.UIT.T, 
                config = { 
                  text = ' ' .. status_text .. ' ', 
                  colour = G.C.UI.TEXT_LIGHT, 
                  scale = 0.32 * 0.8 
                } 
              },
            }
          }
        }
      }
    }

    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
        card.ability.extra.mult,
        card.ability.extra.multadd,
      },
      main_end = main_end
    }
  end,
  
  update = function(self, card)
    if G.jokers and G.jokers.cards then
      local modded_count = 0

      for _, j in ipairs(G.jokers.cards) do 
        if j.config.center.original_mod then
          modded_count = modded_count + 1
        end
      end

      card.ability.extra.xmult = modded_count * card.ability.extra.xmultadd
      card.ability.extra.mult =  modded_count * card.ability.extra.multadd
    end
  end,

  calculate = function(self, card, context)
	
	--fortnite installed
    if context.joker_main then
		if G.GAME.FortniteInstalled then
			return {
				xmult = card.ability.extra.xmult,
			}
		else
			return {
				mult = card.ability.extra.mult,
			}
        end
    end
	
  end,

  abn_artist_credits = {
    artist = "Pepix",
  },
}

end