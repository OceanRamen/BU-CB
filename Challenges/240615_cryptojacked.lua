return {
  name = "Cryptojacked",
  id = "c_mod_cryptojacked_1",
  rules = {
    custom = {
      {
        id = "cm_credit",
        value = "Millie",
      },
    },
    modifiers = {
      { id = "discards", value = 0 },
    },
  },
  jokers = {
    { id = "j_delayed_grat", eternal = true, debuff = true },
  },
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "j_ring_master" },
      { id = "j_burglar" },
      { id = "j_merry_andy" },
      { id = "j_drunkard" },
      { id = "v_wasteful" },
      { id = "v_recyclomancy" },
    },
    banned_tags = {},
    banned_other = {},
  },
}
