return {
  descriptions = {
    Back = {
      b_abn_das_goodtime = {
        name = "Das Goodtime",
        text = {
          "Start with a full set of",
          "{C:abn_florette}Florettes{}, {C:abn_acorn}Acorns{},",
          "{C:abn_bell}Bells{} and {C:abn_leaf}Leaves{}",
          "{C:attention}+#1#{} hand size,",
          "{C:red}-4{} Discard limit"
        }
      },
      b_abn_glue_deck = {
        name = "Glue Deck",
        text = {
          "Start run with the",
          "{C:attention,T:v_abn_gold_tree}#1#{} voucher",
          "Cards cannot be deselected",
          "{C:attention}Jokers{} cannot move"
        }
      },
      b_abn_woebegone = {
        name = "Woebegone Deck",
        text = {
          "Start with {C:tarot,T:v_abn_tarot_master}#1#{}",
          "and a full set of",
          "{C:inactive}Vanilla{} and {C:attention}Spanish{} suits",
          "Earn no {C:attention}interest{}",
          "Earn {C:money}$2{} when {C:mult}Discarding {C:attention}5{} Cards"
        }
      },
      b_abn_calamity = {
        name = "Calamity Deck",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "destroy discarded cards",
          "When {C:attention}Blind{} is selected,",
          "create a random {C:dark_edition}Negative{} {C:sigils}Sigil{} Card"
        }
      },
      b_abn_cyber = {
        name = "Cyber Deck",
        text = {
          "{C:solid_state}Solid State{} cards may",
          "appear in the shop,",
          "start with a {C:solid_state,T:c_abn_database}Database{} card",
        }
      },
      b_abn_CrimsonDeck = {
        name = "Crimson Deck",
        text = {
          "Base {C:chips}Chips{} for",
          "Poker hands are {C:attention}halved{}",
          "{X:mult,C:white}X2{} Mult",
          "{C:red}X1.7{} base Blind size",
        }
      },
      b_abn_AzulDeck = {
        name = "Azul Deck",
        text = {
          "Can {C:chips}play{} and {C:mult}discard{} {C:attention}6{} cards",
          "lose {C:money}$3{} when playing less then {C:attention}6{} cards",
        }
      },
      b_abn_GoldenDeck = {
        name = "Golden Deck",
        text = {
          "Gain {C:money}$1{} per played card",
          "If money reaches {C:money}$0{}",
          "automatically lose the round",
        }
      },
      b_abn_EmeraldDeck = {
        name = "Emerald Deck",
        text = {
          "Start with {C:green,T:v_reroll_surplus}Reroll Surplus{}",
          "and {C:green,T:v_reroll_glut}Reroll Glut{}",
          "{C:attention}0{} Consumable slots",
        }
      },
      b_abn_WhiteDeck = {
        name = "White Deck",
        text = {
          "{C:attention}-2{} Joker Slots",
          "Jokers are {C:attention}2X{} more likely",
          "to be {C:dark_edition}Negative{}",
        }
      },
      b_abn_EvenOddDeck = {
        name = "Even and Odd deck",
        text = {
          "Start run with",
          "only {C:attention}numbered{} cards",
          "in your deck",
        }
      },
      b_abn_SnowDeck = {
        name = "Snow Deck",
        text = {
          "Start with an additional",
          "set of {C:abn_snow}Snow{} cards",
          "and {C:spectral,T:v_omen_globe}#1#{}",
          "{C:green}#2# in #3#{} chance to convert",
          "a {C:attention}non-{C:abn_snow}Snow{} card into",
          "a {C:abn_snow}Snow{} at end of round"
        }
      },
      b_abn_PenumbraDeck = {
        name = "Penumbra Deck",
        text = {
          "Start with an additional",
          "set of {C:abn_penumbra}Penumbra{} cards",
        }
      },
      b_abn_DarkNebulaDeck = {
        name = "Dark Nebula Deck",
        text = {
          "{C:planet}Planet{} Packs don't appear in the shop",
          "{C:astro_cards}Astro{} Cards appear {C:attention}2X{} more often",
        }
      },
      b_abn_PoltergiestDeck = {
        name = "Poltergiest Deck",
        text = {
          "{C:nightshift_cards}Nightshift{} cards appear more often",
          "Each used {C:attention}consumable{} increases",
          "{C:attention}blind requirements{} by {X:attention,C:white}x0.02{}",
        }
      },
      b_abn_InvertedQualia = {
        name = "Inverted Qualia",
        text = {
          "After every {C:attention}Ante{}",
          "choose a random {C:attention}Suit{}",
          "This suit counts as {C:attention}ALL{} suits",
          "Current Suit: #1#",
        }
      },
      b_abn_OxidizedDeck = {
        name = "Oxidized Deck",
        text = {
          "{C:dark_edition}Enhanced{} Cards are",
          "{C:mult}debuffed{} after {C:attention}scoring",
          "Non-Enhanced cards can't be {C:mult}debuffed{}",
        }
      },
      b_abn_PlatinumDeck = {
        name = "Platinum Deck",
        text = {
          "Start with {C:red}Hone{} and {C:red}Glow Up{}",
          "{C:green}1 in 5{} chance for Jokers",
          "without {C:dark_edition}editions{} to be {C:mult}destroyed",
        }
      },
      b_abn_ConvergenceDeck = {
        name = "Convergence Deck",
        text = {
          "Swap {C:chips}Chips{} and {C:mult}Mult{}",
          "before scoring",
          "{C:mult}X2.5 Blind size",
        }
      },
      b_abn_JugglerDeck = {
        name = "Juggler Deck",
        text = {
          "Start with {C:attention}10{} {C:chips}Hands{}",
          "{C:chips}Hands{} save between rounds",
          "Selling Jokers gives {C:chips}Hands{}"
        }
      },
      b_abn_ensnared = {
        name = "Ensnared Deck",
        text = {
          "{C:attention}#1#{} consumable slots,",
          "increases by {C:attention}+#2#{} when",
          "{C:attention}Boss Blind{} defeated",
          "Go up to {C:red}-$#3#{} in debt"
        }
      },
      b_abn_treaty = {
        name = "Treaty of Colours",
        text = {
          "Start with all {C:inactive}Vanilla{} suits,",
          "{C:abn_snow}Snows{}, {C:abn_penumbra}Penumbras{},",
          "{C:abn_tie}Ties{} and {C:abn_bow}Bows{}",
        }
      },
      b_abn_photometry = {
        name = "Photometry Deck",
        text = {
          "Start with {C:abn_snow}Snows{}, {C:abn_penumbra}Penumbras{},",
          "{C:abn_tie}Ties{}, {C:abn_bow}Bows{} and {C:inactive}Nulls{}",
          "No {C:inactive}Vanilla{} suits",
        }
      },
      b_abn_synesthic = {
        name = "Synesthetic Circle",
        text = {
          "Start with",
          "{C:abn_chalice}Chalices{}, {C:abn_baton}Batons{}, {C:abn_coin}Coins{}, {C:abn_sword}Swords{}",
          "{C:abn_bow}Bows{}, {C:abn_tie}Ties{}, {C:abn_penumbra}Penumbras{} and {C:abn_snow}Snows",
          "Without {C:attention}Face{} cards",
          "{C:attention}+1{} hand selection",
          "Increase {C:attention}blind requirements{} by {C:white,X:mult}X1.3{}",
          "when {C:attention}Boss Blind{} is defeated"
        }
      },
      b_abn_epoch = {
        name = "New Epoch",
        text = {
          "Start with a full set of",
          "{C:inactive}Vanilla{}, {C:abn_talon}Talons{},",
          "{C:abn_crown}Crowns{}, {C:abn_moon}Moons,",
          "and {C:abn_star}Stars{}",
          "{C:white,X:mult}+X1{} to all {C:attention}Blind requirements{}",
          "for each blind {C:attention}skipped{} this run",
        }
      },
      b_abn_untamed = {
        name = "Untamed Deck",
        text = {
          "Start with {C:planet,T:v_abn_satellite}#1#{}",
          "and {C:sigils,T:v_abn_chaos}#2#{}",
          "{C:chips}Small Blinds{} are now {C:attention}Big Blinds{}",
        }
      },
      b_abn_shackle = {
        name = "Shackle Maniac",
        text = {
          "Start with only {C:spades}Dark Suits",
          "with {C:dark_edition}Chthonian Editon{}",
        }
      },
      b_abn_poneglyph = {
        name = "Poneglyph",
        text = {
          "Start with a full set of",
          "{C:attention}Stone{}, {C:attention}Petroleum,",
          "{C:attention}Polkadot{} and {C:inactive}Null{} cards ",
        }
      },
    },
  },
}
