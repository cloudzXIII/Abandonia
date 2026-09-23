return {
  descriptions = {
    continent = {
      --#region Classic Continents
      c_abn_africa = {
        name = "Africa",
        text = {
          {
            "Apply {C:diamonds}Diamond Sticker{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "All {C:diamonds}Diamonds{} held",
            "permanently gain {C:mult}+#1#{} Mult"
          }
        },
      },
      c_abn_australia = {
        name = "Australia",
        text = {
          {
            "Apply {C:spades}Spade Sticker{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "All {C:spades}Spades{} held",
            "permanently gain {C:mult}+#1#{} Mult"
          }
        },
      },
      c_abn_asia = {
        name = "Asia",
        text = {
          {
            "Apply {C:attention}Day Time{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "All {C:diamonds}Light Suits{} held",
            "permanently gain {C:chips}+#1#{} Chips"
          }
        },
      },
      c_abn_europe = {
        name = "Europe",
        text = {
          {
            "Apply {C:clubs}Club Sticker{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "All {C:clubs}Clubs{} held",
            "permanently gain {C:mult}+#1#{} Mult"
          }
        },
      },
      c_abn_antarctica = {
        name = "Antarctica",
        text = {
          {
            "Apply {C:attention}Night Time{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "All {C:spades}Dark Suits{} held",
            "permanently gain {C:chips}+#1#{} Chips"
          }
        },
      },
      c_abn_south_america = {
        name = "South America",
        text = {
          {
            "Apply {C:hearts}Heart Sticker{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "All {C:hearts}Hearts{} held",
            "permanently gain {C:mult}+#1#{} Mult"
          }
        },
      },
      c_abn_north_america = {
        name = "North America",
        text = {
          {
            "Apply {C:attention}Jimbo Legacy{} to",
            "the {C:attention}rightmost{} Joker",
          },
          {
            "Add {C:money}$#1#{} of {C:attention}sell value",
            "to every {C:attention}Joker{}",
          }
        },
      },
      --#endregion
      --#region Unusual Continents
      c_abn_atlantis = {
        name = "Atlantis",
        text = {
          {
            "Apply {C:attention}Weight{} to",
            "the {C:attention}rightmost{} Joker,",
            "{C:attention}Fragile{} to {C:attention}leftmost{}"
          },
          {
            "All {C:abn_penumbra}Penumbras{} held",
            "permanently gain {C:mult}+#1#{} Mult",
            "and {C:chips}+#2#{} Chips"
          }
        },
      },
      c_abn_hyperborea = {
        name = "Hyperborea",
        text = {
          {
            "Apply {C:attention}Even Legacy{} to",
            "the {C:attention}rightmost{} Joker,",
            "{C:money}Rental{} and {C:abn_perishable}Perishable{}",
            "to {C:attention}leftmost{}"
          },
          {
            "All {C:abn_snow}Snows{} held",
            "permanently gain {C:mult}+#1#{} Mult",
            "and {C:chips}+#2#{} Chips"
          }
        },
      },
      c_abn_lemuria = {
        name = "Lemuria",
        text = {
          {
            "Apply {C:attention}Odd Legacy{} to",
            "the {C:attention}rightmost{} Joker,",
            "{C:abn_eternal}Eternal{} and {C:attention}Downgrade{}",
            "to {C:attention}leftmost{}"
          },
          {
            "All {C:abn_bow}Bows{} held",
            "permanently gain {C:mult}+#1#{} Mult",
            "and {C:chips}+#2#{} Chips"
          }
        },
      },
      c_abn_mu = {
        name = "Mu",
        text = {
          {
            "Apply {C:attention}Rejok Legacy{} to",
            "the {C:attention}rightmost{} Joker,",
            "{C:abn_eternal}Eternal{} and {C:money}Rental{}",
            "to {C:attention}leftmost{}"
          },
          {
            "All {C:abn_tie}Ties{} held",
            "permanently gain {C:mult}+#1#{} Mult",
            "and {C:chips}+#2#{} Chips"
          }
        },
      },
      c_abn_asgard = {
        name = "Asgard",
        text = {
          {
            "Apply {C:attention}Obmij Legacy{} to",
            "the {C:attention}rightmost{} Joker,",
            "{C:attention}Fragile{} and {C:money}Rental{}",
            "to {C:attention}leftmost{}"
          },
          {
            "All {C:abn_suitless}Nulls{} held",
            "permanently gain {C:mult}+#1#{} Mult",
            "and {C:chips}+#2#{} Chips"
          }
        },
      },
      c_abn_shangrila = {
        name = "Shangrila",
        text = {
          {
            "Destroy {C:attention}rightmost{} Joker",
            "if it is {C:common}Common{}, create a",
            "{C:uncommon}Uncommon{} Joker with {C:attention}Lucky{}",
            "and {C:attention}Possibility{}",
          },
          {
            "Apply {C:attention}Eraser{} and {C:abn_eternal}Eternal{}",
            "to {C:attention}leftmost{} Joker"
          },
        },
      },
      c_abn_ker_is = {
        name = "Ker Is",
        text = {
          {
            "Destroy {C:attention}rightmost{} Joker",
            "if it is {C:uncommon}Uncommon{}, create a",
            "{C:rare}Rare{} Joker with {C:attention}Bullseye{}",
            "and {C:attention}Glove Hand{}",
          },
          {
            "Apply {C:attention}Eraser{} and {C:money}Rental{}",
            "to {C:attention}leftmost{} Joker"
          },
        },
      },
      c_abn_avalon = {
        name = "Avalon",
        text = {
          {
            "Destroy {C:attention}rightmost{} Joker",
            "if it is {C:rare}Rare{}, create a",
            "{C:abn_superrare}Super Rare{} Joker with",
            "{C:attention}Jester Legacy{} and {C:attention}Shovel{}",
          },
          {
            "Apply {C:abn_eternal}Eternal{} and {C:attention}Chain{}",
            "to {C:attention}leftmost{} Joker"
          },
        },
      },
      c_abn_el_dorado = {
        name = "El Dorado",
        text = {
          {
            "Apply {C:attention}Immortal{}, {C:attention}Cat Eye{},",
            "and {C:attention}Odd Legacy{}",
            "to {C:attention}rightmost{} Joker"
          },
          {
            "Apply {C:abn_eternal}Eternal{}, {C:attention}Lightning Bolt{},",
            "and {C:attention}Even Legacy{}",
            "to {C:attention}leftmost{} Joker"
          },
        }
      },
      --#endregion
      --#region Newestia
      c_abn_pangea = {
        name = "Pangea",
        text = {
          {
            "Replace all Jokers with {C:abn_superrare}Super Rare",
            "Jokers with {C:attention}Jester Legacy"
          },
          {
            "Increase all future {C:attention}Blind",
            "{C:attention}requirements{} by {X:black,C:white}X#1#",
            "per replaced Joker"
          },
        },
      },
    },
    --#endregion
  },
}
