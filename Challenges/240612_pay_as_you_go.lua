return {
  name = "Pay As You Go",
  id = "c_mod_payasyougo_1",
  rules = {
    custom = {
      { id = "all_rental" },
      {
        id = "cm_credit",
        value = "theQial",
      },
    },
    modifiers = {
      { id = "dollars", value = 15 },
      { id = "discards", value = 4 },
    },
  },
  vouchers = {
    { id = "v_seed_money" },
    { id = "v_money_tree" },
  },
  jokers = { {
    id = "j_credit_card",
    edition = "negative",
    eternal = true,
    rental = false,
  } },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {},
    banned_tags = {},
    banned_other = {},
  },
}
