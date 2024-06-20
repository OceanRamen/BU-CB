return {
  name = "Hands Tied",
  id = "c_mod_hands_tied_1",
  rules = {
    custom = {
      {
        id = "cm_hand_kills",
        value = "Straight",
      },
      {
        id = "cm_credit",
        value = "Wingcap",
      },
    },
    modifiers = {
      { id = "hands", value = 6 },
      { id = "discards", value = 0 },
    },
  },
  jokers = {
    { id = "j_shortcut", eternal = true, edition = "negative" },
    { id = "j_four_fingers", eternal = true, edition = "negative" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "j_drunkard" },
      { id = "j_merry_andy" },
      { id = "v_wasteful" },
      { id = "v_recyclomancy" },
    },
    banned_tags = {},
    banned_other = {
      { id = "bl_eye", type = "blind" },
      { id = "bl_mouth", type = "blind" },
      { id = "bl_arm", type = "blind" },
      { id = "bl_ox", type = "blind" },
    },
  },
}
