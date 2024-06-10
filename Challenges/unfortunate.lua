return {
  name = "Unfortunate",
  id = "c_mod_unfortunate_1",
  rules = {
    custom = {
      { id = "no_shop_jokers" },
      { id = "no_shop_planets" },
      {
        id = "cm_credit",
        value = "DrSpectred",
      },
    },
    modifiers = {
      { id = "discards", value = 1 },
      { id = "hands", value = 1 },
    },
  },
  jokers = {},
  consumeables = {},
  vouchers = {
    { id = "v_crystal_ball" },
    { id = "v_omen_globe" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      {
        id = "p_buffoon_normal_1",
        ids = { "p_buffoon_normal_1", "p_buffoon_normal_2", "p_buffoon_jumbo_1", "p_buffoon_mega_1" },
      },
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
    },
    banned_other = {},
  },
}
