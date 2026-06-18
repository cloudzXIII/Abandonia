SMODS.Joker {
  key = 'tag_collector',

  loc_vars = function(self, info_queue, card)
    local tags = card.ability.extra.tags
    local max_tags = card.ability.immutable.max_tags
    if tags > max_tags then tags = max_tags end
    return {
      vars = {
        tags,
        card.ability.immutable.dollars
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet14',
  pos = { x = 0, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra={
        tags=1,
    },
    immutable={
        max_tags=10,
        dollars=8,
    },
  },

  calculate = function(self, card, context)
    if context.starting_shop then
        local tags = card.ability.extra.tags
        local max_tags = card.ability.immutable.max_tags
        if tags > max_tags then tags=max_tags end
        for i = 1,tags do
            ABN.add_tag_to_shop(get_next_tag_key(), card.ability.immutable.dollars)
        end
    end
  end,
  abn_artist_credits = {
    artist = "Petalia",
  },
}


local old_check_for_buy_space = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.ability and card.ability.is_shop_tag then
        return true
    end
    return old_check_for_buy_space(card)
end

local old_buy_from_shop = G.FUNCS.buy_from_shop
G.FUNCS.buy_from_shop = function(e)
    local card = e.config.ref_table
    
    if card.ability and card.ability.is_shop_tag then
        local cost = card.cost or 8 
        
        if G.GAME.dollars >= cost then
            local tag_key = card.ability.shop_tag_key
            
            ease_dollars(-cost)
            card:start_dissolve()
            
            if tag_key then
                add_tag(Tag(tag_key))
            end
        end
        return
    end

    old_buy_from_shop(e)
end