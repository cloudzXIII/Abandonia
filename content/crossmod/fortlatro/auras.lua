local end_round_original = end_round
function end_round()
    local blind = G.GAME and G.GAME.blind
    local won = false
    local boss_key = nil

    if blind and blind.boss and blind.config and blind.config.blind then
        boss_key = blind.config.blind.key
        local chips, req = G.GAME.chips, blind.chips
        if to_big then chips, req = to_big(chips), to_big(req) end
        won = chips >= req
    end

    end_round_original()

    if won and boss_key then
        G.GAME.abn_seen_bosses = G.GAME.abn_seen_bosses or {}
        G.GAME.abn_unique_bosses = G.GAME.abn_unique_bosses or 0
        if not G.GAME.abn_seen_bosses[boss_key] then
            G.GAME.abn_seen_bosses[boss_key] = true
            G.GAME.abn_unique_bosses = G.GAME.abn_unique_bosses + 1
        end
    end
end

SMODS.Sticker {
  key = "globetrotter_aura",
  set = "aura",
  atlas = "AbandoniaAura",
  pos = { x = 0, y = 0 },
  badge_colour = G.C.GREEN,

  config = {
    extra = {
      ascadd = 0.25,
    },
  },

  set_ability = function(self, card)
    if not card.ability.globetrotter_aura_extra then
      card.ability.globetrotter_aura_extra = {
        ascadd = self.config.extra.ascadd or 0.25,
      }
    end
  end,

  loc_txt = {
    name = "Globetrotter Aura",
    label = "Globetrotter Aura",
    text = {
      "{C:gold}+#1#{} Asc. Power per {C:attention}unique{} Blind defeated this {C:attention}run{}",
      "{C:inactive}Currently:{} {C:gold}+#2#{} {C:inactive}Asc. Power",
    },
  },

  loc_vars = function(self, info_queue, card)
    local extra = card and card.ability and card.ability.globetrotter_aura_extra or self.config.extra
    local n = (G.GAME and G.GAME.abn_unique_bosses) or 0
    return {
      vars = {
        extra.ascadd,
        extra.ascadd * n,
      }
    }
  end,

  draw = function(self, card)
    local notilt = nil
    if card.area and card.area.config.type == "deck" then
      notilt = true
    end
    if not G.shared_stickers["abn_globetrotter_aura2"] then
      G.shared_stickers["abn_globetrotter_aura2"] =
        Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["abn_AbandoniaAura"], { x = 999, y = 999 })
    end

    if G.shared_stickers[self.key] then
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, notilt, card.children.center)
    end

    G.shared_stickers["abn_globetrotter_aura2"].role.draw_major = card

    card.hover_tilt = card.hover_tilt / 2
    G.shared_stickers["abn_globetrotter_aura2"]:draw_shader("dissolve", nil, nil, notilt, card.children.center)
    G.shared_stickers["abn_globetrotter_aura2"]:draw_shader(
      "holo",
      nil,
      card.ARGS.send_to_shader,
      notilt,
      card.children.center
    )
    card.hover_tilt = card.hover_tilt * 2
  end,

  calculate = function(self, card, context)
    if not card.ability.globetrotter_aura_extra then
      card.ability.globetrotter_aura_extra = { ascadd = 0.25 }
    end
    local extra = card.ability.globetrotter_aura_extra

    local n = (G.GAME and G.GAME.abn_unique_bosses) or 0
    if n <= 0 then return end

    local scoring_playing_card = context.main_scoring and context.cardarea == G.play and not context.individual
    local scoring_joker = context.joker_main

    if scoring_playing_card or scoring_joker then
      return {
        asc = extra.ascadd * n,
        colour = G.C.SECONDARY_SET.Spectral,
        card = card,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Tatsu",
  },
}

SMODS.Consumable {
    key = 'creep',
    set = 'nightshift_cards',
    atlas = 'AbandoniaNightshift',
    pos = {x = 5, y = 1},

    config = {
        extra = {
            cards = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_globetrotter_aura", set = "Other", vars = {0.25, 0.25 * (G.GAME.abn_unique_bosses or 0) } }
        return {
            vars = {
                card.ability.extra.cards
            }
        }
    end,

    can_use = function(self, card)
        if card.ability and card.ability.extra then
            local n = (G.hand and #G.hand.highlighted or 0) + (G.jokers and #G.jokers.highlighted or 0)
            return n >= 1 and n <= card.ability.extra.cards
        end
        return false
    end,

    use = function(self, card, area, copier)
        local highlightedCards = {}

        for _, category in ipairs({
            G.hand.highlighted,
            G.jokers.highlighted,
        }) do
            for i = 1, #category do
                table.insert(highlightedCards, category[i])
            end
        end

        for i = 1, math.min(#highlightedCards, card.ability.extra.cards) do
            local c = highlightedCards[i]
            local to_destroy = {}

            if c.ability and c.ability.set == 'Joker' then
                local rarity = c.config.center.rarity
                for _, j in ipairs(G.jokers.cards) do
                    if j ~= c and j.config.center.rarity == rarity then
                        to_destroy[#to_destroy + 1] = j
                    end
                end
            elseif not SMODS.has_no_rank(c) then
                local id = c:get_id()
                for _, area_cards in ipairs({ G.hand.cards, G.deck.cards, G.playing_cards }) do
                    for _, p in ipairs(area_cards) do
                        if p ~= c and not SMODS.has_no_rank(p) and p:get_id() == id then
                            to_destroy[#to_destroy + 1] = p
                        end
                    end
                end
            end

            fn_add_aura(c, "abn_globetrotter_aura")

            if #to_destroy > 0 then
                if SMODS.destroy_cards then
                    SMODS.destroy_cards(to_destroy)
                else
                    for _, v in ipairs(to_destroy) do
                        if not v.ability.eternal then v:start_dissolve() end
                    end
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}