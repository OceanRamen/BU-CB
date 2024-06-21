return {
  name = "Series Funding",
  id = "c_mod_series_funding_1",
  rules = {
    modifiers = {
      { id = "dollars", value = 20 },
    },
    custom = {
      { id = "chips_dollar_cap" },
      { id = "cm_mult_dollar_cap" },
      { id = "no_interest" },
      -- { id = "no_reward" },
      {
        id = "cm_credit",
        value = "sharktamer",
      },
    },
  },
  jokers = {
    { id = "j_popcorn" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "j_burglar" },
      { id = "v_grabber" },
      { id = "v_nacho_tong" },
    },
  },
}
