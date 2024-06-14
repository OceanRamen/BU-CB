return {
  name = "Budgeting",
  id = "c_mod_budgeting_1",
  rules = {
    custom = {
      { id = "no_reward" },
      { id = "no_extra_hand_money" },
      { id = "no_interest" },
      {
        id = "cm_credit",
        value = "Djynasty",
      },
    },
    modifiers = {
      { id = "dollars", value = 100 },
    },
  },
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "v_seed_money" },
      { id = "v_money_tree" },
      { id = "j_golden" },
      { id = "j_business" },
      { id = "j_egg" },
      { id = "j_riff_raff" },
      { id = "j_ticket" },
      { id = "j_faceless" },
      { id = "j_delayed_grat" },
      { id = "j_cloud_9" },
      { id = "j_midas_mask" },
      { id = "j_gift_card" },
      { id = "j_mail" },
      { id = "j_rough_gem" },
      { id = "j_satellite" },
      { id = "c_temperence" },
      { id = "c_hermit" },
    },
    banned_tags = {
      { id = "tag_investment" },
      { id = "tag_economy" },
    },
    banned_other = {},
  },
}
