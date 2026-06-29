local config = SMODS.current_mod.config

SMODS.Sound({
  key = 'music_abandonia',
  path = 'music_abandonia.ogg',
  pitch = 1,
  speed = 1,
  select_music_track = function(self)
    -- If it's abandonia time play music
    if G.jokers then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j.config.center.key and j.config.center.key == 'j_abn_abandonia' and config.Music ~= false then
          return 1e10
        end
      end
    end
  end
})


SMODS.Joker {
  key = 'abandonia',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_chips,
        card.ability.extra.mult,
        card.ability.extra.chips,
      }
    }
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet4',
  pos = { x = 2, y = 3 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 2, x_chips = 2, mult = 4, chips = 10, } },

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      return {
        x_chips = card.ability.extra.x_chips,
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end

    if context.before and not context.blueprint then
      if card.edition and card.edition.abn_vintage then
        for _, joker in ipairs(G.jokers.cards) do
          joker.ability.abn_perma_mult = (joker.ability.abn_perma_mult or 0) + card.ability.extra.mult
          joker.ability.abn_perma_bonus = (joker.ability.abn_perma_bonus or 0) + card.ability.extra.chips
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, joker)
        end
      elseif card.edition and card.edition.abn_abandond then
        for _, played_card in ipairs(context.scoring_hand) do
          played_card.ability.perma_mult = (played_card.ability.perma_mult or 0) + card.ability.extra.mult
          played_card.ability.perma_bonus = (played_card.ability.perma_bonus or 0) + card.ability.extra.chips
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, played_card)
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },

  in_pool = function(self, args)
    return not args or args.source ~= "sho"
  end
}
