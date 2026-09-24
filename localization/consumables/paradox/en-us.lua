return {
  descriptions = {
    paradox = {
      c_abn_laplace = {
        name = "Laplace",
        text = {
          {
            "On {C:attention}Even{} Antes all {C:attention}held{}",
            "cards gain {C:attention}Flipped{}"
          },
          {
            "On {C:attention}Odd{} Antes {C:attention}5{} random",
            "cards in {C:attention}deck{} gains {C:attention}Flipped{}"
          }
        }
      },
      c_abn_maxwell = {
        name = "Maxwell",
        text = {
          {
            "On {C:attention}Even{} Antes {C:attention}held",
            "{C:inactive}vanilla{} suits gain {C:chips}+#1#{} Chips"
          },
          {
            "On {C:attention}Odd{} Antes {C:attention}held",
            "{C:dark_edition}modded{} suits gain {C:mult}+#2#{} Mult"
          }
        }
      },
      c_abn_schrodinger = {
        name = "Schrodinger",
        text = {
          {
            "On {C:attention}Even{} Antes give all Jokers",
            "{C:mult}Fragile{} and create a {C:attention}random{}",
            "{C:abn_superrare}Super Rare{} Joker with {C:abn_perishable}Perishable{}"
          },
          {
            "On {C:attention}Odd{} Antes give all Jokers",
            "{C:abn_perishable}Perishable{} and create a {C:attention}random{}",
            "{C:abn_parallelrare}Parallel Rare{} Joker with {C:mult}Fragile"
          },
        }
      },
      c_abn_zeno = {
        name = "Zeno",
        text = {
          {
            "On {C:attention}Even{} Antes copy the",
            "{C:dark_edition}Edition{} of a {C:attention}random{} card in hand",
            "onto a {C:attention}random{} Joker",
          },
          {
            "On {C:attention}Odd{} Antes copy the",
            "{C:dark_edition}Edition{} of a {C:attention}random{} Joker",
            "to a {C:attention}random{} card in hand",
          },
        }
      },
      c_abn_theseus = {
        name = "Theseus",
        text = {
          {
            "On {C:attention}Even{} Antes {C:mult}destroy{} all",
            "cards above rank {C:attention}4{} held in hand",
          },
          {
            "On {C:attention}Odd{} Antes {C:mult}destroy{} all",
            "cards below rank {C:attention}5{} held in hand"
          }
        }
      },
	  c_abn_sortie = {
        name = "Sortie",
        text = {
          {
            "On {C:attention}Even{} Antes {C:attention}increase{}",
            "the Boss Blind {C:attention}requirement{} by {X:mult,C:white}X2{},",
            "but {C:attention}double{} the {C:money}payout{}",
          },
          {
            "On {C:attention}Odd{} Antes {C:attention}reduce{}",
            "the next Boss Blind {C:attention}requirement{} by {C:attention}50%{},",
            "but {C:attention}halve{} the {C:money}payout{}",
          },
        }
      },
	  c_abn_newcomb = {
        name = "Newcomb",
        text = {
          {
            "On {C:attention}Even{} Antes give the {C:dark_edition}Enhancement{}",
            "of the {C:attention}rightmost{} card to the {C:attention}leftmost{} Joker",
          },
          {
            "On {C:attention}Odd{} Antes give the {C:dark_edition}Enhancement{}",
            "of the {C:attention}leftmost{} Joker to the {C:attention}rightmost{} card",
          },
        }
      },
	  c_abn_epimenides = {
        name = "Epimenides",
        text = {
          {
            "On {C:attention}Even{} Antes {C:attention}reduce{} the",
            "{C:attention}rank{} of all cards {C:attention}held in hand{} by {C:attention}2{}"
          },
          {
            "On {C:attention}Odd{} Antes {C:attention}increase{} the",
            "{C:attention}rank{} of all cards {C:attention}held in hand{} by {C:attention}2{}"
          }
        }
      },
	  c_abn_barjavel = {
        name = "Barjavel",
        text = {
          {
            "On {C:attention}Even{} Antes {C:green}reroll{}",
            "the available {C:attention}Boosters{}",
          },
          {
            "On {C:attention}Odd{} Antes {C:green}reroll{}",
            "the available {C:attention}Vouchers{}"
          }
        }
      },
	  c_abn_jevons = {
        name = "Jevons",
        text = {
          {
            "On {C:attention}Even{} Antes go back to Ante {C:attention}2{},",
            "{C:mult}destroy{} all Jokers and gain {C:money}$5{} per Joker {C:mult}destroyed{}",
          },
          {
            "On {C:attention}Odd{} Antes go back to Ante {C:attention}3{},",
            "all Jokers gain {C:abn_eternal}Eternal{} and reduce {C:money}money{} to {C:money}$0{}",
          },
        }
      },
	  c_abn_roko = {
        name = "Roko",
        text = {
          {
            "On {C:attention}Even{} Antes {C:attention}increase{}",
            "the win ante by {C:attention}4{} and",
            "gain {C:attention}+2{} Joker Slots",
          },
          {
            "On {C:attention}Odd{} Antes {C:attention}reduce{}",
            "all {C:attention}blind requirements{} by {C:attention}50%{}",
            "but lose {C:attention}2{} Joker Slots",
          }
        }
      },
    },
  }
}