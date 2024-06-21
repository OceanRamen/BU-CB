return {
  name = "Highroll",
  id = "c_mod_highroll_1",
  rules = {
    custom = {
      {
        id = "cm_credit",
        value = "Cheerio1101",
      },
    },
    modifiers = { {
      id = "reroll_cost",
      value = 150,
    } },
  },
  jokers = {},
  consumeables = {},
  vouchers = {
    { id = "v_overstock_norm" },
    { id = "v_overstock_plus" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = 'j_chaos' },
    },
    banned_tags = {
      { id = 'tag_d_six' },
    },
    banned_other = {},
  },
}
