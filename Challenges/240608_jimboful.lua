return {
  name = "Jimboful",
  id = "c_mod_jimboful_1",
  rules = {
    custom = {
      { id = "no_shop_planets" },
      { id = "no_shop_tarots" },
      -- { id = "cm_stake", value = 8, name = "Gold" },
      {
        id = "cm_credit",
        value = "Djynasty",
      },
    },
    modifiers = {
      {
        id = "consumable_slots",
        value = 0,
      },
    },
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
        id = "p_standard_normal_1",
        ids = {
          "p_standard_normal_1",
          "p_standard_normal_2",
          "p_standard_normal_3",
          "p_standard_normal_4",
          "p_standard_jumbo_1",
          "p_standard_jumbo_2",
          "p_standard_mega_1",
          "p_standard_mega_2",
        },
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
        id = "p_arcana_normal_1",
        ids = {
          "p_arcana_normal_1",
          "p_arcana_normal_2",
          "p_arcana_normal_3",
          "p_arcana_normal_4",
          "p_arcana_jumbo_1",
          "p_arcana_jumbo_2",
          "p_arcana_mega_1",
          "p_arcana_mega_2",
        },
      },
      {
        id = "p_spectral_normal_1",
        ids = { "p_spectral_normal_1", "p_spectral_normal_2", "p_spectral_jumbo_1", "p_spectral_mega_1" },
      },
      {
        id = "j_sixth_sense",
      },
      {
        id = "j_superposition",
      },
      {
        id = "j_vagabond",
      },
      {
        id = "j_hallucination",
      },
      {
        id = "j_cartomancer",
      },
      {
        id = "j_astronomer",
      },
      {
        id = "j_burnt",
      },
      {
        id = "j_space",
      },
      {
        id = "j_8_ball",
      },
      {
        id = "v_tarot_merchant",
      },
      {
        id = "v_planet_merchant",
      },
      {
        id = "v_omen_globe",
      },
      {
        id = "v_telescope",
      },
      {
        id = "j_stone",
      },
      {
        id = "j_vampire",
      },
      {
        id = "j_marble",
      },
      {
        id = "j_certificate",
      },
      {
        id = "j_glass",
      },
      {
        id = "j_steel_joker",
      },
      {
        id = "j_drivers_license",
      },
    },
    banned_tags = {
      {
        id = "tag_meteor",
      },
      {
        id = "tag_charm",
      },
      {
        id = "tag_etherial",
      },
      {
        id = "tag_orbital",
      },
    },
    banned_other = {},
  },
}
