return {
  descriptions = {
    Edition = {
      e_abn_chthonian = {
        name = "Chthonian",
        text = {
          "{C:attention}X2{} Values*,",
          "{C:attention}+2%{} blind requirements",
          "{C:inactive,s:0.7}*where possible"
        },
      },
      e_abn_iridescent = {
        name = "Iridescent",
        text = {
          "{C:white,X:mult}X#1#{} Mult,",
          "Earn {C:money}$#2#{}",
          "when triggered"
        },
      },
      e_abn_abandond = {
        name = "Abandoned",
        text = {
          "{C:attention}+#1#{} Retrigger",
          "{C:red}-$#2#{} per retrigger"
        },
      },
      e_abn_sunscourge = {
        name = "Sunscourge",
        text = {
          "{C:mult}+#1#{} Mult,",
          "{C:chips}+#2#{} Chips,",
          "{C:attention}Doubles{} when",
          "score {C:attention}catches on fire{}"
        }
      },
      e_abn_gloss = {
        name = "Gloss",
        text = {
          "{C:white,X:chips}X#1#{} Chips,",
          "Earn {C:money}$#2#{}",
          "when triggered"
        }
      },
      e_abn_pearlescent = {
        name = "Pearlescent",
        text = {
          "{C:mult}+#1#{} Mult,",
          "{C:chips}+#2#{} Chips,",
        }
      },
      e_abn_chromatic = {
        name = "Chromatic",
        text = {
          "{C:white,X:chips}X#1#{} Chips, {C:white,X:mult}x#2#{} Mult,",
          "and {C:money}$#3#{} when triggered"
        }
      },
      e_abn_reversal = {
        name = "Reversal",
        text = {
          "Swap {C:chips}Chips{} and {C:mult}Mult",
        }
      },
      e_abn_bit_rot = {
        name = "Bit Rot",
        text = {
          "{X:mult,C:white}^#1#{} Mult",
        },
      },
      e_abn_reel = {
        name = "Reel",
        text = {
          "{X:chips,C:white}^#1#{} Chips",
        },
      },
      e_abn_collodion = {
        name = "Collodion",
        text = {
          "Balances {C:white,X:abn_plasma}#1#%{} of",
          "{C:chips}Chips{} and {C:mult}Mult{}"
        }
      },
      e_abn_vintage = {
        name = "Vintage",
        text = {
          "{C:money}+$#3#{}, {C:chips}+#2#{} Chips, and {C:mult}+#1#{} Mult",
          "per level of played hand"
        }
      },
      e_abn_bright = {
        name = "Bright",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "per {C:planet}planet{} {C:attention}rank{}",
          "in scoring {C:diamonds}Light Suits{}"
        }
      },
      e_abn_opaque = {
        name = "Opaque",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
          "per {C:planet}planet{} {C:attention}rank{}",
          "in scoring {C:spades}Dark Suits{}"
        }
      },
      e_abn_glitter = {
        name = "Glitter",
        text = {
          "Gives {C:purple}+Score{} equal to the sum",
          "of played {C:attention}poker hand{}'s base {C:chips}Chips",
          "and {C:mult}Mult{}, multiplied by {C:purple}X#1#"
        }
      },
      e_abn_sparkling = {
        name = "Sparkling",
        text = {
          "{C:mult}+#1#{} Mult per hand type that",
          "played {C:attention}poker hand{} contains"
        }
      },
      e_abn_rgb = {
        name = "RGB",
        text = {
          "Gives {X:chips,C:white}XChips{} and {X:mult,C:white}XMult{} equal to the",
          "played {C:attention}poker hand{}'s base {C:chips}Chips{} and {C:mult}Mult",
        }
      },
      e_abn_ultraviolet = {
        name = "Ultraviolet",
        text = {
          "Gives {C:chips}Chips{} and {C:mult}Mult{} equal",
          "to the highest level {C:attention}poker",
          "{C:attention}hand{}'s base {C:chips}Chips{} and {C:mult}Mult",
          "{C:inactive}(Pulls from {C:attention}Flush{C:inactive} if all are tied)"
        }
      },
      e_abn_fragmented = {
        name = "Fragmented",
        text = {
          "This card grants {C:chips}#1#%{} more Chips",
          "if it is the {C:attention}leftmost{} card, and",
          "{C:mult}#2#%{} more Mult if it is the {C:attention}rightmost"
        }
      },
      e_abn_fragmented_pc = {
        name = "Fragmented",
        text = {
          "This playing card grants {C:chips}#1#%{} more Chips",
          "if it is the {C:attention}leftmost{} scoring card, and",
          "{C:mult}#2#%{} more Mult if it is the {C:attention}rightmost"
        }
      },
      e_abn_fragmented_joker = {
        name = "Fragmented",
        text = {
          "This joker grants {C:chips}#1#%{} more Chips",
          "if it is the {C:attention}leftmost{} joker, and",
          "{C:mult}#2#%{} more Mult if it is the {C:attention}rightmost"
        }
      },
      e_abn_thermal = {
        name = "Thermal",
        text = {
          "Grants {C:chips}Chips{} and {C:mult}Mult{} equal to the",
          "played {C:attention}poker hand{}'s combined total",
          "{C:chips}Chips{} and {C:mult}Mult{} at every level,",
          "between {C:attention}1{} and its {C:attention}current level",
          "If its {C:attention}current level{} is {C:attention}1{}, it'll",
          "add the base {C:mult}Mult{} and {C:chips}Chips{} twice",
        }
      },
    },
  },
  misc = {
    labels = {
      -- Editions
      abn_chthonian = "Chthonian",
      abn_iridescent = "Iridescent",
      abn_abandond = "Abandoned",
      abn_sunscourge = "Sunscourge",
      abn_gloss = "Gloss",
      abn_pearlescent = "Pearlescent",
      abn_chromatic = "Chromatic",
      abn_reversal = "Reversal",
      abn_bit_rot = "Bit Rot",
      abn_reel = "Reel",
      abn_collodion = "Collodion",
      abn_vintage = "Vintage",
      abn_bright = "Bright",
      abn_opaque = "Opaque",
      abn_rgb = "RGB",
      abn_ultraviolet = "Ultraviolet",
      abn_fragmented = "Fragmented",
      abn_sparkling = "Sparkling",
      abn_glitter = "Glitter",
      abn_thermal = "Thermal",
    }
  }
}
