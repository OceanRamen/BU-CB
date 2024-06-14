return {
  name = "Student Loan Debt",
  id = "c_mod_student_loan_debt_1",
  rules = {
    custom = {
      { id = "no_reward" },
      { id = "no_extra_hand_money" },
      { id = "no_interest" },
      { id = "cm_negative_interest" },
      {
        id = "cm_credit",
        value = "CampfireCollective",
      },
    },
    modifiers = {
      { id = "dollars", value = 15 },
    },
  },
  vouchers = {
    { id = "v_seed_money" },
    { id = "v_money_tree" },
  },
  deck = {
    type = "Challenge Deck",
  },
}
