return {
  description = {
    Enhanced = {
      m_abn_wallpaper = {
        name = "Wallpaper Card",
        text = {
          "Gains {C:mult}+#2#{} Mult per {C:attention}seal{}",
          "in scoring hand, {C:chips}+#4#{} Chips ",
          "per {C:attention}seal{} held in hand",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips, {C:mult}+#3#{C:inactive} Mult)",
        }
      },
      m_abn_reinforcement = {
        name = "Reinforcement Card",
        text = {
          "{C:mult}+#1#{} Mult, {C:chips}+#2#{} Chips,",
          "and {C:money}$#3#{} per {C:attention}sticker{}",
          "among your {C:attention}Jokers{}",
          "{C:red,E:1,s:0.85}self destructs if Mult is",
          "{C:red,E:1,s:0.85}greater than Chips after scoring"
        }
      },
      m_abn_kinship = {
        name = "Kinship Card",
        text = {
          "Gains {C:white,X:mult}X#2#{} Mult for every",
          "card with the same {C:attention}suit{}",
          "or {C:dark_edition}Edition{} as this card",
          "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive})"
        }
      },
      m_abn_zen = {
        name = "Zen Card",
        text = {
          'When held in hand, {C:mult}+#3#{} Mult,',
          '{C:mult}+#2#{} more for each other',
          '{C:attention}Zen{} card held in hand',
          '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'
        }
      },
      m_abn_ocean = {
        name = "Ocean Card",
        text = {
          "Gains {C:chips}+#2#{} Chips per scoring card",
          "to the {C:attention}left{} of this card",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
      },
      m_abn_mountain = {
        name = "Mountain Card",
        text = {
          "Gains {C:mult}+#2#{} Mult per scoring card",
          "to the {C:attention}right{} of this card",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
      },
      m_abn_teatag = {
        name = "Tea Tag Card",
        text = {
          "Gives {C:chips}+#1#{} chips per",
          "{C:attention,s:0.85}Tea Tag Card{} in your {C:attention}full deck{}",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
          "{C:inactive}({C:attention}#2#{C:inactive} hands left)"
        }
      },
      m_abn_teastain = {
        name = "Tea Stain",
        text = {
          "{C:white,X:mult}X#1#{} Mult, gives an",
          "additional {C:white,X:mult}X#2#{} per",
          "{C:attention,s:0.85}Tea Stain{} in your {C:attention}full deck{}"
        }
      },
      m_abn_polkadot = {
        name = "Polkadot Card",
        text = {
          "{C:chips}+#1#{} Chips, gains",
          "{C:chips}+#2#{} Chips when scored",
          "no rank or suit"
        }
      },
      m_abn_petroleum = {
        name = "Petroleum Card",
        text = {
          "{C:chips}+#1#{} Chips",
          "{C:money}+$#2#{}",
          "Turns into {C:attention}Oilfire{}",
          "if the score catches fire",
          "no rank or suit"
        },
      },
      m_abn_oilfire = {
        name = "Oilfire Card",
        text = {
          "{C:mult}+#1#{} Mult",
          "{C:red}-$#2#{}",
          "{C:green}#3# in #4#{} Chance",
          "to {C:red}self-destruct{}",
          "no rank or suit",
        },
      },
      m_abn_fossil = {
        name = "Fossil Card",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "{C:money}+$#2#{}",
          "has a {C:green}#3# in #4#{} chance",
          "to {C:red}self-destruct{}"
        },
      },
      m_abn_mercurial = {
        name = "Mercurial Card",
        text = {
          "Gains {C:chips}+#2#{} Chips",
          "for each unique {C:attention}suit",
          "in scoring hand",
          "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        },
      },
      m_abn_hot_iron = {
        name = "Hot Iron Card",
        text = {
          "{X:mult,C:white}X#2#{} Mult if held in hand",
          "{C:green}#4# in #5#{} chance to give {C:chips}+#1#{} Chips",
          "{C:green}#6# in #7#{} chance to gain {X:mult,C:white}X#3#{} Mult",
          "{C:inactive}Does not score when played{}"
        },
      },
      m_abn_infra = {
        name = "Infra Card",
        text = {
          "Gain {C:mult}+#2#{} Mult and {C:chips}+#4#{} Chips per scoring card",
          "{C:mult}Self-destruct{} if played with {C:attention}3{} or less scoring cards",
          "{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult{} {C:chips}+#3# {C:inactive}Chips)",
        },
      },
      m_abn_hazard = {
        name = "Hazard Card",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "Add {X:mult,C:white}+X#2#{} Mult for each other scoring Hazard card",
          "{C:green}#3# in #4#{} chance to {C:attention}retrigger{}",
          "Increase {C:attention}blind requirement{} by {C:attention}10%{}",
        },
      },
      m_abn_contagion_seal = {
        name = "Contagion Seal",
        text = {
          "Gains {X:mult,C:white}^#2#{} Mult when",
          "an {X:mult,C:white}XMult{} effect triggers",
          "{C:inactive}(Currently {X:mult,C:white}^#1#{C:inactive} Mult)",
        },
      },
      m_abn_contagion_bonus = {
        name = "Contagion Bonus",
        text = {
          "Gives {X:spectral,C:white}^Chips{} equal to",
          "the number of cards played",
        },
      },
      m_abn_contagion_mult = {
        name = "Contagion Mult",
        text = {
          "{X:mult,C:white}^#1#{} Mult",
        },
      },
      m_abn_monitor = {
        name = "Monitor Card",
        text = {
          "Gives {X:mult,C:white}^Mult{} equal to",
          "number of scoring {V:1}#1#{}",
          "{s:0.8}Suit changes every round",
          "no rank or suit",
        },
      },
      m_abn_cotton = {
        name = "Cotton Card",
        text = {
          "Doubles the {C:planet}planet{} {C:attention}ranks{}",
          "of {C:attention}Cotton{} cards",
          "held in hand",
        },
      },
      m_abn_sew = {
        name = "Sew Card",
        text = {
          "Each time this card triggers it gains {C:chips}+#4#{} Chips and {C:mult}+#3#{} Mult",
          "Retrigger each Sew card for each played Sew card",
          "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips,{} {C:mult}+#1#{} {C:inactive}Mult){}",
        },
      },
      m_abn_darkner = {
        name = "Darkner Card",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult per played and held {C:spades}Dark Suits{}",
          "{C:mult}Self-destruct{} if played with {C:attention}#3#{} or more {C:diamonds}Light Suits",
        },
      },
      m_abn_lightner = {
        name = "Lightner Card",
        text = {
          "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult per played and held {C:diamonds}Light Suits{}",
          "{C:mult}Self-destruct{} if played with {C:attention}#3#{} or more {C:spades}Dark Suits",
        },
      },
      m_abn_kintsugi = {
        name = "Kintsugi Card",
        text = {
          "Gives {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, and {C:money}$#3#{}",
          "{C:green}#4# in #5#{} chance to create a copy of this card",
          "when another card is {C:mult}destroyed{}",
          "{C:green}#6# in #7#{} chance for this card to {C:attention}double{} its {C:attention}values{}",
        },
      },
      m_abn_first_aid = {
        name = "First Aid",
        text = {
          "If played with {C:mult}debuffed{} cards gain {C:mult}+#4#{} Mult",
          "If a card is {C:mult}destroyed{} gain {C:chips}+#3#{} Chips",
          "{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult,{} {C:chips}+#1#{} {C:inactive}Chips){}",
        },
      },
      m_abn_plank = {
        name = "Plank",
        text = {
          "Gives {C:gold}+#1#{} Ascension Power{}",
        }
      },
      m_abn_flux = {
        name = "Flux",
        text = {
          "{C:purple}+#1#{} Score, gains {C:purple}+#2#{} Score",
          "if part of the {C:attention}winning hand{}",
        }
      },
      m_abn_discontinued = {
        name = "Discontinued",
        text = {
          "{C:gold}+#3#{} Asc. Power and {C:chips}+#4#{} Chips",
          "per unique {C:attention}Tag{} obtained this run",
          "{C:inactive}(Currently {C:gold}+#1#{C:inactive},{} {C:chips}+#2#{C:inactive})",
        }
      },
      m_abn_tile = {
        name = "Tile",
        text = {
          "Returns to {C:attention}Deck{} when {C:attention}played{}",
        }
      },
      m_abn_papermache = {
        name = "Papermache",
        text = {
          "{X:chips,C:white}X#1#{} Chips if unscoring on an {C:attention}Odd{} card",
          "{X:mult,C:white}X#2#{} Mult if unscoring on an {C:attention}Even{} card",
        }
      },
      m_abn_honey = {
        name = "Honey",
        text = {
          "This card is {C:attention}always{} drawn to hand",
          "If this card is in {C:attention}hand{} during scoring {C:attention}play{} it",
          "{C:green}#1# in #2#{} chance to turn other scoring cards into {C:attention}Honey{} cards",
        }
      },
      m_abn_bubble = {
        name = "Bubble",
        text = {
          "Gives {C:chips}+#1#{} Chips per {C:attention}different{} scoring {C:dark_edition}enhancement{}",
          "and {C:mult}+#2#{} Mult per {C:attention}different{} scoring {C:dark_edition}edition{}",
          "If this card is {C:mult}destroyed{} all scoring cards gain {C:chips}+#3#{} Chips",
        }
      },
      m_abn_bramble = {
        name = "Bramble",
        text = {
          "If this is a {C:inactive}Vanilla{} suit it {C:attention}Always scores{}",
          "If this is on a {C:dark_edition}Modded{} suit increase hand level by {C:attention}#1#{}",
        }
      },
    },
  },
}
