SMODS.Joker {
  key = 'apprentice_wizard',
  rarity = 2,
  atlas = 'ABNJokerSheet22',
  pos = { x = 2, y = 3 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      x_mult=1,
      x_mult_gain=1.3,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult_gain,card.ability.extra.x_mult,
      },
    }
  end,


  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable and context.consumeable.config.center.set == "Spectral" then
        if context.consumeable.config.center.mod then
        SMODS.scale_card(card,{
            ref_table=card.ability.extra,
            ref_value="x_mult",
            scalar_value="x_mult_gain",
            message_key="a_xmult",
            message_colour = G.C.MULT,
        })
        end
        if not context.consumeable.config.center.mod then
            if SMODS.reset_card then
            SMODS.reset_card(card,{
                ref_table=card.ability.extra,
                ref_value="x_mult",
                reset_value=1,
            })
            else
                card.ability.extra.x_mult = 1
            end
        end
    end
    if context.joker_main then
        return {
            x_mult=card.ability.extra.x_mult,
        }
    end
  end,
  in_pool = function (self)
    return G.GAME.abn_spectral_used or false
  end,
  abn_artist_credits = {
    artist = "Tisisrealnow",
  },
}

local l_init_object = Game.init_game_object

function Game:init_game_object(args)
    local ret = l_init_object(self,args)
    ret.abn_spectral_used = false
    return ret
end

local l_use_card = G.FUNCS.use_card
G.FUNCS.use_card = function (e, mute, nosave, amt)
    local card = e.config.ref_table
    if card.config.center.set == "Spectral" then
        G.GAME.abn_spectral_used = true
    end
    return l_use_card(e,mute,nosave,amt)
end