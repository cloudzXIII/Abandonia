SMODS.Joker {
  key = 'tag_collector',

  loc_vars = function(self, info_queue, card)
    local tags = card.ability.extra.tags
    local max_tags = card.ability.immutable.max_tags
    if tags >max_tags then tags = max_tags end
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
        if tags >max_tags then tags=max_tags end
        for i = 1,tags do
            ABN.add_tag_to_shop(get_next_tag_key(),card.ability.immutable.dollars)
        end
    end
  end,
  abn_artist_credits = {
    artist = "Petalia",
  },
}
