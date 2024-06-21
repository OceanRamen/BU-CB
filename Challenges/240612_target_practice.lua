return {
  name = "Target Practice",
  id = "c_mod_target_practice_1",
  rules = {
    custom = {
      {
        id = "cm_no_overscoring",
        value = "10000",
      },
      { id = "no_shop_jokers" },
      { id = "no_shop_tarots" },
      { id = "no_reward" },
      { id = "no_extra_hand_money" },
      { id = "no_interest" },
      {
        id = "cm_scaling",
        value = {
          5,
          5 * (10 ^ 9),
          5 * (10 ^ 19),
          5 * (10 ^ 29),
          5 * (10 ^ 39),
          5 * (10 ^ 49),
          5 * (10 ^ 59),
          5 * (10 ^ 69),
        },
      },
      {
        id = "cm_credit",
        value = "Millie",
      },
    },

    modifiers = {
      {
        id = "dollars",
        value = 0,
      },
      {
        id = "discards",
        value = 1,
      },
      {
        id = "hands",
        value = 3,
      },
      {
        id = "joker_slots",
        value = 8,
      },
      {
        id = "hand_size",
        value = 1,
      },
      {
        id = "consumable_slots",
        value = 1,
      },
    },
  },
  jokers = {
    {
      id = "j_astronomer",
      eternal = true,
    },
    {
      id = "j_blueprint",
      eternal = true,
    },
    {
      id = "j_blueprint",
      eternal = true,
    },
    {
      id = "j_blueprint",
      eternal = true,
    },
    {
      id = "j_blueprint",
      eternal = true,
    },
    {
      id = "j_perkeo",
      eternal = true,
    },
    {
      id = "j_mime",
      eternal = true,
    },
    {
      id = "j_baron",
      eternal = true,
    },
  },
  consumeables = {
    {
      id = "c_cryptid",
    },
  },
  vouchers = {},
  deck = {
    cards = {
      { s = "S", r = "K", e = "m_steel" },
    },
    type = "Plasma Deck",
  },
  restrictions = {
    banned_cards = {
      {
        id = "p_buffoon_normal_1",
        ids = { "p_buffoon_normal_1", "p_buffoon_normal_2", "p_buffoon_jumbo_1", "p_buffoon_mega_1" },
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
        id = "p_celestial_mega_1",
        ids = {
          "p_celestial_mega_1",
          "p_celestial_mega_2",
        },
      },
      {
        id = "p_spectral_normal_1",
        ids = {
          "p_spectral_normal_1",
          "p_spectral_normal_2",
          "p_spectral_jumbo_1",
          "p_spectral_mega_1",
        },
      },
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
        id = "c_mercury",
      },
      {
        id = "c_venus",
      },
      {
        id = "c_earth",
      },
      {
        id = "c_mars",
      },
      {
        id = "c_jupiter",
      },
      {
        id = "c_saturn",
      },
      {
        id = "c_uranus",
      },
      {
        id = "c_neptune",
      },
      {
        id = "c_planet_x",
      },
      {
        id = "c_ceres",
      },
      {
        id = "c_eris",
      },
    },
    banned_tags = {
      {
        id = "tag_uncommon",
      },
      {
        id = "tag_rare",
      },
      {
        id = "tag_investment",
      },
      {
        id = "tag_voucher",
      },
      {
        id = "tag_boss",
      },
      {
        id = "tag_standard",
      },
      {
        id = "tag_charm",
      },
      {
        id = "tag_meteor",
      },
      {
        id = "tag_buffoon",
      },
      {
        id = "tag_handy",
      },
      {
        id = "tag_garbage",
      },
      {
        id = "tag_ethereal",
      },
      {
        id = "tag_coupon",
      },
      {
        id = "tag_double",
      },
      {
        id = "tag_juggle",
      },
      {
        id = "tag_d_six",
      },
      {
        id = "tag_top_up",
      },
      {
        id = "tag_skip",
      },
      {
        id = "tag_orbital",
      },
      {
        id = "tag_economy",
      },
    },
    banned_other = {
      { id = "bl_psychic", type = "blind" },
      { id = "bl_goad", type = "blind" },
      { id = "bl_manacle", type = "blind" },
      { id = "bl_plant", type = "blind" },
      { id = "bl_pillar", type = "blind" },
    },
  },
}