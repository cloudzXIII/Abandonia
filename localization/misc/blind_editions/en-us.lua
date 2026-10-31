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
          "{C:red}Debuffs a random card before scoring",
          "{C:inactive}(Edition retriggers per {C:dark_edition}Negative{C:inactive} card in scoring hand)",
        },
      },
      ble_abn_chthonian = {
        name = "Chthonian",
        text = {
          "{C:red}X#1# Blind Size after hand played",
        },
      },
      ble_abn_iridescent = {
        name = "Iridescent",
        text = {
          "{C:white,X:mult}X#1#{C:mult} Mult{}, {C:money}-$#2#{}"
        },
      },
      ble_abn_abandond = {
        name = "Abandoned",
        text = {
          "{C:attention}First Retrigger scores negative values",
          "{C:inactive}(Edition retriggers per {C:dark_edition}Abandoned{C:inactive} card in scoring hand)"
        },
      },
      ble_abn_sunscourge = {
        name = "Sunscourge",
        text = {
          "{C:attention}Double blind requirements the next",
          "{C:attention}time your score catches fire",
          "{C:inactive}(Doubles again if the hand that catches",
          "{C:inactive} fire contains a scoring {C:dark_edition}Sunscourge {C:inactive}card)"
        }
      },
      ble_abn_gloss = {
        name = "Gloss",
        text = {
          "{C:white,X:chips}X#1#{C:chips} Chips{}, {C:money}-$#2#{}"
        }
      },
      ble_abn_pearlescent = {
        name = "Pearlescent",
        text = {
          "{C:mult}#1# Mult{}, {C:chips}#2# Chips,",
        }
      },
      ble_abn_chromatic = {
        name = "Chromatic",
        text = {
          "{C:white,X:chips}X#1#{C:chips} Chips{}, {C:white,X:mult}X#2#{C:mult} Mult{}, {C:money}-$#3#{}"
        }
      },
      ble_abn_reversal = {
        name = "Reversal",
        text = {
          "{C:chips}First hand doesn't gain Chips",
          "{C:inactive}(Applies to next hand if you play and score any {C:dark_edition}Reversal{C:inactive} card)"
        }
      },
      ble_abn_bit_rot = {
        name = "Bit Rot",
        text = {
          "{X:mult,C:white}^#1#{C:mult} Mult",
        },
      },
      ble_abn_reel = {
        name = "Reel",
        text = {
          "{X:chips,C:white}^#1#{C:chips} Chips",
        },
      },
      ble_abn_collodion = {
        name = "Collodion",
        text = {
          "{C:mult}First hand doesn't gain Mult",
          "{C:inactive}(Applies to next hand if you play and score any {C:dark_edition}Collodion{C:inactive} card)"
        }
      },
      ble_abn_vintage = {
        name = "Vintage",
        text = {
          "{C:money}-$#1#{}, {C:chips}#2# Chips{}, {C:mult}#3# Mult",
          "{C:attention}per level of played hand"
        }
      },
      ble_abn_bright = {
        name = "Bright",
        text = {
          "{C:chips}#1# Chips{}, {C:mult}#2# Mult {C:planet}per Planet", -- -20, -8
          "{C:planet}rank in scoring {C:diamonds}Light Suits"
        }
      },
      ble_abn_opaque = {
        name = "Opaque",
        text = {
          "{C:chips}#1# Chips{}, {C:mult}#2# Mult {C:planet}per Planet", -- -20, -8
          "{C:planet}rank in scoring {C:spades}Dark Suits"
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
