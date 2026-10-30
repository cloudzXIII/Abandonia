return {
  descriptions = {
    abn_BlindEdition = {
      ble_abn_foil = {
        name = "Foil",
        text = {
          "{C:chips}#1# Chips"
        },
      },
      ble_abn_holo = {
        name = "Holographic",
        text = {
          "{C:mult}#1# Mult"
        },
      },
      ble_abn_poly = {
        name = "Polychrome",
        text = {
          "{X:mult,C:white}X#1#{C:mult} Mult"
        },
      },
      ble_abn_negative = {
        name = "Negative",
        text = {
          "{C:red}Debuffs a random card before scoring,",
          "{C:red}plus 1 per played {C:dark_edition}Negative {C:red}card"
        },
      },
      ble_abn_chthonian = {
        name = "Chthonian",
        text = {
          "{C:attention}X#1# Values",
        },
      },
      ble_abn_iridescent = {
        name = "Iridescent",
        text = {
          "{C:white,X:mult}X#1#{} Mult,",
          "Earn {C:money}$#2#{}",
          "when triggered"
        },
      },
      ble_abn_abandond = {
        name = "Abandoned",
        text = {
          "{C:attention}+#1#{} Retrigger",
          "{C:red}-$#2#{} per retrigger"
        },
      },
      ble_abn_sunscourge = {
        name = "Sunscourge",
        text = {
          "{C:mult}+#1#{} Mult,",
          "{C:chips}+#2#{} Chips,",
          "{C:attention}Doubles{} when",
          "score {C:attention}catches on fire{}"
        }
      },
      ble_abn_gloss = {
        name = "Gloss",
        text = {
          "{C:white,X:chips}X#1#{} Chips,",
          "Earn {C:money}$#2#{}",
          "when triggered"
        }
      },
      ble_abn_pearlescent = {
        name = "Pearlescent",
        text = {
          "{C:mult}+#1#{} Mult,",
          "{C:chips}+#2#{} Chips,",
        }
      },
      ble_abn_chromatic = {
        name = "Chromatic",
        text = {
          "{C:white,X:chips}X#1#{} Chips, {C:white,X:mult}x#2#{} Mult,",
          "and {C:money}$#3#{} when triggered"
        }
      },
      ble_abn_reversal = {
        name = "Reversal",
        text = {
          "Swap {C:chips}Chips{} and {C:mult}Mult",
        }
      },
      ble_abn_bit_rot = {
        name = "Bit Rot",
        text = {
          "{X:mult,C:white}^#1#{} Mult",
        },
      },
      ble_abn_reel = {
        name = "Reel",
        text = {
          "{X:chips,C:white}^#1#{} Chips",
        },
      },
      ble_abn_collodion = {
        name = "Collodion",
        text = {
          "Balances {C:white,X:abn_plasma}#1#%{} of",
          "{C:chips}Chips{} and {C:mult}Mult{}"
        }
      },
      ble_abn_vintage = {
        name = "Vintage",
        text = {
          "{C:money}+$#3#{}, {C:chips}+#2#{} Chips, and {C:mult}+#1#{} Mult",
          "per level of played hand"
        }
      },
      ble_abn_bright = {
        name = "Bright",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "per {C:planet}planet{} {C:attention}rank{}",
          "in scoring {C:diamonds}Light Suits{}"
        }
      },
      ble_abn_opaque = {
        name = "Opaque",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "per {C:planet}planet{} {C:attention}rank{}",
          "in scoring {C:spades}Dark Suits{}"
        }
      },
    },
  },
  misc = {
    v_dictionary = {
      k_abn_edition_after_name = "#1# (#2#)",
      k_abn_retriggers_per_edition = "{C:inactive}(Edition retriggers per scoring {C:dark_edition}#1#{C:inactive} card)",
    }
  }
}
