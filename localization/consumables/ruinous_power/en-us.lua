return {
  descriptions = {
    ruinous_power = {
      c_abn_elder_sign = {
        name = "Elder Sign",
        text = {
          {
            "Scoring cards give {X:mult,C:white}^#1#{} Mult,",
            "{C:mult}destroy{} them after scoring",
          },
          {
            "If your {C:attention}full deck{} contains less",
            "than {C:attention}#2#{} cards, {C:mult}self-destructs{}",
          }
        }
      },
      c_abn_yellow_sign = {
        name = "Yellow Sign",
        text = {
          {
            "Reduce {C:attention}blind requirements{}",
            "by {C:attention}#1#%{} per scoring card",
          },
          {
            "{C:mult}Destroy{} cards in deck equal",
            "to the number of scored cards",
          },
          {
            "If your {C:attention}full deck{} contains less",
            "than {C:attention}#2#{} cards, {C:mult}self-destructs{}",
          }
        }
      },
      c_abn_sacrifice_brand = {
        name = "Sacrifice Brand",
        text = {
          {
            "When {C:attention}Blind{} is selected, {C:mult}destroy{}",
            "{C:attention}2{} random {C:attention}Jokers{} and create",
            "{C:attention}Joker{} and a {C:legendary}Legendary{} Joker",
          },
          {
            "All {C:attention}Jokers{} each give",
            "{X:chips,C:white}^#1#{} Chips and {X:mult,C:white}^#2#{} Mult",
          },
          {
            "If you have less than {C:attention}5{} Jokers",
            "at end of {C:attention}Boss Blind{}, {C:mult}self-destructs{}",
          },
        }
      },
      c_abn_hunter_rune = {
        name = "Hunter Rune",
        text = {
          {
            "Held {C:attention}consumables{} give {X:mult,C:white}^#1#{} Mult",
            "but are {C:mult}destroyed{} at end of round",
          },
          {
            "If {C:attention}Blind{} is selected without",
            "{C:attention}consumables{}, {C:mult,E:1}lose the run",
          }
        }
      },
      c_abn_curse_mark = {
        name = "Curse Mark",
        text = {
          {
            "Scoring cards give their {C:attention}rank{}",
            "as {C:gold}Ascension Power{}, and become",
            "{C:attention}Stone{} cards after scoring",
          },
          {
            "If a {C:attention}Rankless{} card scores,",
            "{C:mult}self-destruct{} and destroy all",
            "{C:attention}Rankless{} cards in your {C:attention}full deck",
          }
        }
      },
      c_abn_geas_mark = {
        name = "Geas Mark",
        text = {
          {
            "{X:mult,C:white}^#2#{} Mult and {X:chips,C:white}^#3#{} Chips",
            "If played hand contains a {V:1}#1#{},",
          },
          {
            "If played hand does {C:attention}not{}",
            "contain a {V:1}#1#{}, {C:mult,E:1}lose the run",
            "{s:0.8}Suit changes on blind selection"
          }
        }
      },
    },
  }
}
