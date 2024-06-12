local lovely = require("lovely")
local nativefs = require("nativefs")

function ChallengeMod.addLocalization()
  --  Challenge Names
  G.localization.misc.challenge_names.c_mod_budgeting_1 = "Budgeting"
  G.localization.misc.challenge_names.c_mod_bullseye_1 = "Bullseye"
  G.localization.misc.challenge_names.c_mod_fleeting_1 = "Fleeting Memory"
  G.localization.misc.challenge_names.c_mod_jimboful_1 = "Jimboful"
  G.localization.misc.challenge_names.c_mod_load_bearing_1 = "Load Bearing"
  G.localization.misc.challenge_names.c_mod_riffraff_1 = "Riff-Raffle"
  G.localization.misc.challenge_names.c_mod_student_loan_debt_1 = "Student Loan Debt"
  G.localization.misc.challenge_names.c_mod_swapped_pockets_1 = "Swapped Pockets"
  G.localization.misc.challenge_names.c_mod_tarot_tycoon_1 = "Tarot Tycoon"
  G.localization.misc.challenge_names.c_mod_unfortunate_1 = "Unfortunate"
  G.localization.misc.challenge_names.c_mod_examination_1 = "Examination"
  G.localization.misc.challenge_names.c_mod_payasyougo_1 = "Pay As You Go"
  --  Challenge Descriptions
  G.localization.misc.v_text.ch_c_gold_stake = { "Playing on the {C:attention}Gold Stake" }
  G.localization.misc.v_text.ch_c_exam_stake = { "Playing on the {C:attention}Examination Stake" }
  G.localization.misc.v_text.ch_c_all_perishable = { "All Jokers are {C:perishable}Perishable{}" }
  G.localization.misc.v_text.ch_c_all_rental = { "All Jokers are {C:rental}Rental{}" }
  G.localization.misc.v_text.ch_c_cm_force_hand = { "Only #1#{}s will score" }
  G.localization.misc.v_text.ch_c_cm_negative_interest = { "Money is lost from interest" }
  G.localization.misc.v_text.ch_c_cm_no_overscoring = { "Final blind score must be lower than #1#{}%" }
  G.localization.misc.v_text.ch_c_no_shop_planets = { "Planets no longer appear in the {C:attention}shop" }
  G.localization.misc.v_text.ch_c_no_shop_tarots = { "Tarot cards no longer appear in the {C:attention}shop" }
  --  Credit Tag
  G.localization.misc.v_text.ch_c_cm_credit = { "Concept by: {C:green}#1#{}" }
end

function Card:set_perishable(_perishable)
  self.ability.perishable = nil
  if (self.config.center.perishable_compat or G.GAME.modifiers.all_perishable) and not self.ability.eternal then
    self.ability.perishable = true
    self.ability.perish_tally = G.GAME.perishable_rounds
  end
end

local blind_debuff_hand_ref = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
  if G.GAME.modifiers.cm_force_hand then
    if G.GAME.modifiers.cm_force_hand ~= handname then
      return true
    end
  end

  return blind_debuff_hand_ref(self, cards, hand, handname, check)
end

local blind_defeat_ref = Blind.defeat
function Blind:defeat(silent)
  if G.GAME.modifiers.cm_negative_interest then
    ease_dollars(-math.min(math.floor(G.GAME.dollars / 5), G.GAME.interest_cap / 5))
  end

  blind_defeat_ref(self, silent)

  if
    G.GAME.modifiers.cm_no_overscoring and (G.GAME.chips > self.chips * (G.GAME.modifiers.cm_no_overscoring / 100))
  then
    G.STATE = G.STATES.GAME_OVER
    if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
      G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
    end
    G:save_settings()
    G.FILE_HANDLER.force = true
    G.STATE_COMPLETE = false
    G.SETTINGS.paused = false
  end
end

local function get_chal_files(directory)
  local files = {}
  local items = nativefs.getDirectoryItems(directory)
  for _, item in ipairs(items) do
    if item:match("%.lua$") then
      table.insert(files, item)
    end
  end
  return files
end

local directory = lovely.mod_dir .. "/ChallengeMod/Challenges/"

local lua_files = get_chal_files(directory)

local CustomChallenges = {}

for _, file in ipairs(lua_files) do
  local file_path = directory .. "/" .. file
  local variable_name = file:gsub("%.lua$", "")
  CustomChallenges[variable_name] = dofile(file_path)
end

for i, v in pairs(CustomChallenges) do
  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, v)
end
