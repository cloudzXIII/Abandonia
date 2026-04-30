local shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed)
  local g = shuffle_ref(self, _seed)
  if self == G.deck then
    local priorities = {}
    local others = {}
    for k, v in pairs(self.cards) do
      if next(SMODS.find_card("j_abn_dark_magokert")) and ABN.is_dark(v) then
        table.insert(priorities, v)
      else
        table.insert(others, v)
      end
    end
    for _, card in ipairs(priorities) do
      table.insert(others, card)
    end
    self.cards = others
    self:set_ranks()
  end
  return g
end

SMODS.Joker {
  key = 'dark_magokert',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = {} }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 0, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
  end,
  abn_artist_credits = {
    artist = "Dr.K.J.Schuester"
  },
}
