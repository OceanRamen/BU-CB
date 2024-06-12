return {
  name = "Tarot Tycoon",
  id = "c_mod_tarot_tycoon_1",
  rules = {
    custom = {
      { id = "no_shop_jokers" },
      { id = "no_shop_planets" },
      {
        id = "cm_credit",
        value = "Djynasty",
      },
    },
    modifiers = {},
  },
  jokers = {},
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      {
        id = "p_buffoon_normal_1",
        ids = { "p_buffoon_normal_1", "p_buffoon_normal_2", "p_buffoon_jumbo_1", "p_buffoon_mega_1" },
      },
      {
        id = "p_celestial_normal_1",
        ids = {
          "p_celestial_normal_1",
          "p_celestial_normal_2",
          "p_celestial_normal_3",
          "p_celestial_normal_4",
          "p_celestial_jumbo_1",
          "p_celestial_jumbo_2",
          "p_celestial_mega_1",
          "p_celestial_mega_2",
        },
      },
      {
        id = "v_planet_merchant",
      },
      {
        id = "v_planet_tycoon",
      },
      id = "v_tarot_merchant",
    },
    {
      id = "v_tarot_tycoon",
    },
    banned_tags = {
      {
        id = "tag_rare",
      },
      {
        id = "tag_uncommon",
      },
      {
        id = "tag_holo",
      },
      {
        id = "tag_polychrome",
      },
      {
        id = "tag_negative",
      },
      {
        id = "tag_foil",
      },
      {
        id = "tag_buffoon",
      },
      {
        id = "tag_meteor",
      },
    },
    banned_other = {},
  },
}
