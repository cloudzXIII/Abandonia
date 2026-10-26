SMODS.Joker {
  key = 'jakdos',
  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 6, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 4 } },


  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    return { vars = { card.ability.extra.xmult, localize({ type = 'name_text', key = "e_abn_chthonian", set = "Edition" }), } }
  end,

  --only appear if you have chthonian
  in_pool = function(self)
    if not G.playing_cards then return false end

    for _, card in ipairs(G.playing_cards) do
      if card and card.edition and card.edition.key == 'e_abn_chthonian' then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      G.E_MANAGER:add_event(Event({
        func = function()
          for _, target_card in ipairs(G.play.cards) do
            -- Check if card is NOT Chthonian
            if not (target_card.edition and target_card.edition.key == 'e_abn_chthonian') then
              target_card.ability.perma_debuff = true
            end
          end
          return true
        end
      }))
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  abn_artist_credits = {
    artist = "im_ener",
  },
}
