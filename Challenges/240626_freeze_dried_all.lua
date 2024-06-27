return {
  name = "Freeze Dried (All Jokers)",
  id = "c_mod_freeze_dried_all_1",
  rules = {
    custom = {
	  {
        id = "cm_no_after_hand",
        value = true,
      },
	  {
        id = "cm_no_after_round",
        value = true,
      },
	  {
        id = "cm_no_on_discard",
        value = true,
      },
      {
        id = "cm_credit",
        value = "Millie",
      },
    },
    modifiers = {
    },
  },
  jokers = {
  },
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {},
    banned_tags = {},
    banned_other = {},
  },
}
