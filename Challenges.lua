local lovely = require("lovely")
local nativefs = require("nativefs")

function ChallengeMod.addLocalization()
  --  Challenge Names
  G.localization.misc.challenge_names.c_mod_riffraff_1 = "Riff-Raffle"
  G.localization.misc.challenge_names.c_mod_fleeting_1 = "Fleeting Memory"
  G.localization.misc.challenge_names.c_mod_tarot_tycoon_1 = "Tarot Tycoon"
  G.localization.misc.challenge_names.c_mod_unfortunate_1 = "Unfortunate"
  G.localization.misc.challenge_names.c_mod_jimboful_1 = "Jimboful"
  G.localization.misc.challenge_names.c_mod_swapped_pockets_1 = "Swapped Pockets"
  G.localization.misc.challenge_names.c_mod_budgeting_1 = "Budgeting"
  --  Challenge Descriptions
  G.localization.misc.v_text.ch_c_no_shop_planets = { "Planets no longer appear in the {C:attention}shop" }
  G.localization.misc.v_text.ch_c_no_shop_tarots = { "Tarot cards no longer appear in the {C:attention}shop" }
  G.localization.misc.v_text.ch_c_all_perishable = { "All Jokers are {C:perishable}Perishable{}" }
  G.localization.misc.v_text.ch_c_cm_negative_interest = { "Money is lost from interest" }
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

local blind_defeat_ref = Blind.defeat
function Blind:defeat(silent)
  if G.GAME.modifiers.cm_negative_interest then
    ease_dollars(-math.min(math.floor(G.GAME.dollars / 5), G.GAME.interest_cap / 5))
  end

  blind_defeat_ref(self, silent)
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
