return {
  name = "Swapped Pockets",
  id = "c_mod_swapped_pockets_1",
  rules = {
    modifiers = {
      {
        id = "joker_slots",
        value = 2,
      },
      {
        id = "hand_size",
        value = 5,
      },
      {
        id = "consumable_slots",
        value = 8,
      },
      {
        id = "hands",
        value = "3",
      },
      {
        id = "discards",
        value = "4",
      },
    },
    custom = {
      {
        id = "cm_credit",
        value = "CampfireCollective",
      },
    },
  },
  jokers = {},
  consumeables = {
    { id = 'c_empress'},
    { id = 'c_justice'},
    { id = 'c_tower'},
    { id = 'c_chariot'},
    { id = 'c_hermit'},
    { id = 'c_high_priestess'},
    { id = 'c_fool'},
    { id = 'c_aura'},
  },
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {},
}
