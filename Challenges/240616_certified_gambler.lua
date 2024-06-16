return {
  name = "Certified Gambler",
  id = "c_mod_certified_gambler_1",
  rules = {
    custom = {
      {
        id = "cm_credit",
        value = "CampfireCollective",
      },
    },
  },
  jokers = {
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
  },
  deck = {
    cards = {
      { s = "S", r = "Q" },
      { s = "H", r = "J" },
      { s = "C", r = "T" },
      { s = "D", r = "9" },
      { s = "S", r = "8" },
    },
    type = "Challenge Deck",
  },
}
