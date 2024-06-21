return {
  name = "Butterfingers",
  id = "c_mod_butterfingers",
  rules = {
    custom = {
      {
        id = "cm_credit",
        value = "sharktamer",
      },
    },
    modifiers = {
      { id = "hand_size", value = 0 },
      { id = "dollars", value = 40 },
    },
  },
  jokers = {
    { id = "j_diet_cola" },
    { id = "j_diet_cola" },
    { id = "j_diet_cola" },
    { id = "j_diet_cola" },
    { id = "j_diet_cola" },
  },
  vouchers = {
    { id = "v_overstock_norm" },
    -- { id = "v_overstock_plus" },
    { id = "v_tarot_merchant" },
    { id = "v_planet_merchant" },
  },
  deck = {
    type = "Anaglyph Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "j_turtle_bean" },
      { id = "j_juggler" },
      { id = "j_troubadour" },
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
        ids = {
          "p_spectral_normal_1",
          "p_spectral_normal_2",
          "p_spectral_jumbo_1",
          "p_spectral_mega_1",
        },
      },
      {
        id = "v_paint_brush",
      },
      {
        id = "v_palette",
      },
    },
    banned_tags = {
      { id = "tag_uncommon" },
      { id = "tag_rare" },
      { id = "tag_negative" },
      { id = "tag_foil" },
      { id = "tag_holo" },
      { id = "tag_polychrome" },
      { id = "tag_investment" },
      { id = "tag_voucher" },
      { id = "tag_boss" },
      { id = "tag_standard" },
      { id = "tag_charm" },
      { id = "tag_meteor" },
      { id = "tag_buffoon" },
      { id = "tag_handy" },
      { id = "tag_garbage" },
      { id = "tag_coupon" },
      { id = "tag_double" },
      { id = "tag_d_six" },
      { id = "tag_top_up" },
      { id = "tag_skip" },
      { id = "tag_orbital" },
      { id = "tag_economy" },
      { id = "tag_ethereal" },
    },
    banned_other = {
      -- { id = "bl_eye", type = "blind" },
    },
  },
}
