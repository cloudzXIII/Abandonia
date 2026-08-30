--track unique tags
local original_add_tag = add_tag
function add_tag(tag, immediate)
  if tag and tag.key then
    G.GAME.abn_SeenTags = G.GAME.abn_SeenTags or {}
    if not G.GAME.abn_SeenTags[tag.key] then
      G.GAME.abn_SeenTags[tag.key] = true
      G.GAME.abn_UniqueTags = (G.GAME.abn_UniqueTags or 0) + 1
    end
  end

  original_add_tag(tag, immediate)
end

SMODS.Enhancement({
  key = "discontinued",
  pos = { x = 5, y = 3 },
  atlas = "AbandoniaEnhancements",
  config = { extra = { ascension = 0, ascensionadd = 0.10, chips = 0, chipsadd = 10, } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local unique_tags = (G.GAME.abn_UniqueTags or 0)
    local asc = cae.ascensionadd * unique_tags
    local chips = cae.chipsadd * unique_tags
    return { vars = { asc, chips, cae.ascensionadd, cae.chipsadd } }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      return {
        asc = card.ability.extra.ascensionadd * (G.GAME.abn_UniqueTags or 0),
        chips = card.ability.extra.chipsadd * (G.GAME.abn_UniqueTags or 0),
      }
    end
  end,
  abn_artist_credits = {
    artist = "Creechie",
  },
})
