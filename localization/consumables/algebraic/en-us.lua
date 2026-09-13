return {
  descriptions = {
    algebraic = {
      c_abn_euler = {
        name = "Euler",
        text = {
          "The next scoring {C:attention}Straight{}",
          "with no {C:attention}Ranks{} above {C:attention}6{}",
          "gives {C:white,X:chips}X#1#{} Chips",
        },
      },
      c_abn_golden = {
        name = "Golden",
        text = {
          "The next scoring {C:attention}Straight{}",
          "with no {C:attention}Ranks{} above {C:attention}10{}",
          "gives {C:white,X:mult}X#1#{} Mult",
        },
      },
      c_abn_pi = {
        name = "Pi",
        text = {
          "The next scoring {C:attention}High Card{}",
          "gives the {C:chips}Chips{} and {C:mult}Mult{}",
          "of your last scoring {C:attention}Flush{}",
          "{C:inactive}(Currently {C:white,X:mult}#1#{} {C:red}X{} {C:white,X:chips}#2#{} {C:inactive})",
        },
      },
      c_abn_number = {
        name = "Number",
        text = {
          "The next {C:attention}poker hand{} containing",
          "only {C:attention}numbered{} cards has",
          "its level upgraded once per",
          "{C:attention}unique{} number in scoring hand",
        },
      },
    },
  },
}
