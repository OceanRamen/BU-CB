return {
  name = "Jokerless?",
  id = "c_mod_jokerlessq_1",
  rules = {
    custom = {
      { id = "no_shop_jokers" },
      {
        id = "cm_credit",
        value = "Millie",
      },
    },
    modifiers = {},
  },
  jokers = {
    { id = "j_joker", eternal = true, debuff = true },
    { id = "j_joker", eternal = true, debuff = true },
    { id = "j_joker", eternal = true, debuff = true },
    { id = "j_joker", eternal = true, debuff = true },
    { id = "j_joker", eternal = true, debuff = true },
  },
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "c_judgement" },
      { id = "c_wraith" },
      { id = "c_soul" },
      { id = "v_antimatter" },
      {
        id = "p_buffoon_normal_1",
        ids = {
          "p_buffoon_normal_1",
          "p_buffoon_normal_2",
          "p_buffoon_jumbo_1",
          "p_buffoon_mega_1",
        },
      },
    },
    banned_tags = {
      { id = "tag_rare" },
      { id = "tag_uncommon" },
      { id = "tag_holo" },
      { id = "tag_polychrome" },
      { id = "tag_negative" },
      { id = "tag_foil" },
      { id = "tag_buffoon" },
      { id = "tag_top_up" },
    },
    banned_other = {
      { id = "bl_final_acorn", type = "blind" },
      { id = "bl_final_heart", type = "blind" },
      { id = "bl_final_leaf", type = "blind" },
    },
  },
}
