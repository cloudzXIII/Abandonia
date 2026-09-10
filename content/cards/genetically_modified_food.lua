
local function modded(card,s)
    s:set_cost()
    SMODS.scale_card(card,{
        ref_table=card.ability.extra,
        ref_value="chips",
        scalar_table={
            x=s.cost
        },
        scalar_value="x",
        message_key="a_chips",
        message_colour=G.C.CHIPS,
    })
end
local function vanilla(card,s)
    s:set_cost()
    SMODS.scale_card(card,{
        ref_table=card.ability.extra,
        ref_value="mult",
        scalar_table={
            x=s.cost
        },
        scalar_value="x",
        message_key="a_mult",
        message_colour=G.C.MULT,
    })
end
local function handle(card,s)
    if s.config and s.config.center and s.config.center.mod then
        if s.config.center.pools and s.config.center.pools["Food"] then
            modded(card,s)
        end
    elseif not s.config.center.mod then
        vanilla(card,s)
    end
end
SMODS.Joker {
  key = 'genetically_modified_food',
  rarity = 1,
  atlas = 'ABNJokerSheet25',
  pos = { x = 0, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips=0,
      mult=0,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
      },
    }
  end,


  calculate = function(self, card, context)
    if context.buying_card then
        handle(card,context.card)
    end
    if context.selling_card then
        handle(card,context.card)
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheedar",
  },
}