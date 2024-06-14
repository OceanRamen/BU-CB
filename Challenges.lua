local lovely = require("lovely")
local nativefs = require("nativefs")

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

function ChallengeMod.addLocalization()
  for i, v in pairs(CustomChallenges) do
    G.localization.misc.challenge_names[v.id] = v.name
  end

  --  Challenge Descriptions
  G.localization.misc.v_text.ch_c_all_perishable = { "All Jokers are {C:attention}Perishable{}" }
  G.localization.misc.v_text.ch_c_all_rental = { "All Jokers are {C:attention}Rental{}" }
  G.localization.misc.v_text.ch_c_cm_force_hand = { "Only {C:blue}#1#s{} will score" }
  G.localization.misc.v_text.ch_c_cm_negative_interest = { "Money is lost from {C:attention}Interest{}" }
  G.localization.misc.v_text.ch_c_cm_no_overscoring = { "{C:attention}Blind{} score must not exceed {C:green}#1#%{}" }
  G.localization.misc.v_text.ch_c_no_shop_planets = { "Planets no longer appear in the {C:attention}shop{}" }
  G.localization.misc.v_text.ch_c_no_shop_tarots = { "Tarots no longer appear in the {C:attention}shop{}" }
  G.localization.misc.v_text.ch_c_cm_stake = { "Playing on the #1#{} stake" }
  G.localization.misc.v_text.ch_c_cm_scaling = { "Custom ante scaling" }
  --  Credit Tags
  G.localization.misc.v_text.ch_c_cm_credit = { "Concept by: {C:green}#1#{}" }
end

function ChallengeMod.custom_stake(stake)
  G.GAME.stake = stake
  if G.GAME.stake >= 2 then
    G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
    G.GAME.modifiers.no_blind_reward.Small = true
  end
  if G.GAME.stake >= 3 then
    G.GAME.modifiers.scaling = 2
  end
  if G.GAME.stake >= 4 then
    G.GAME.modifiers.enable_eternals_in_shop = true
  end
  if G.GAME.stake >= 5 then
    G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1
  end
  if G.GAME.stake >= 6 then
    G.GAME.modifiers.scaling = 3
  end
  if G.GAME.stake >= 7 then
    G.GAME.modifiers.enable_perishables_in_shop = true
  end
  if G.GAME.stake >= 8 then
    G.GAME.modifiers.enable_rentals_in_shop = true
  end
  if G.GAME.stake >= 9 then
    G.GAME.modifiers.scaling = 4
  end
end

function get_blind_amount(ante)
  local k = 0.75
  if G.GAME.modifiers.cm_scaling then
    local amounts = G.GAME.modifiers.cm_scaling
    if ante < 1 then
      return 100
    end
    if ante <= 8 then
      return amounts[ante]
    end
    local a, b, c, d = amounts[8], 1.6, ante - 8, 1 + 0.2 * (ante - 8)
    local amount = math.floor(a * (b + (k * c) ^ d) ^ c)
    amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
    return amount
  elseif not G.GAME.modifiers.scaling or G.GAME.modifiers.scaling == 1 then
    local amounts = {
      300,
      800,
      2000,
      5000,
      11000,
      20000,
      35000,
      50000,
    }
    if ante < 1 then
      return 100
    end
    if ante <= 8 then
      return amounts[ante]
    end
    local a, b, c, d = amounts[8], 1.6, ante - 8, 1 + 0.2 * (ante - 8)
    local amount = math.floor(a * (b + (k * c) ^ d) ^ c)
    amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
    return amount
  elseif G.GAME.modifiers.scaling == 2 then
    local amounts = {
      300,
      900,
      2600,
      8000,
      20000,
      36000,
      60000,
      100000,
      --300,  900, 2400,  7000,  18000,  32000,  56000,  90000
    }
    if ante < 1 then
      return 100
    end
    if ante <= 8 then
      return amounts[ante]
    end
    local a, b, c, d = amounts[8], 1.6, ante - 8, 1 + 0.2 * (ante - 8)
    local amount = math.floor(a * (b + (k * c) ^ d) ^ c)
    amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
    return amount
  elseif G.GAME.modifiers.scaling == 3 then
    local amounts = {
      300,
      1000,
      3200,
      9000,
      25000,
      60000,
      110000,
      200000,
      --300,  1000, 3000,  8000,  22000,  50000,  90000,  180000
    }
    if ante < 1 then
      return 100
    end
    if ante <= 8 then
      return amounts[ante]
    end
    local a, b, c, d = amounts[8], 1.6, ante - 8, 1 + 0.2 * (ante - 8)
    local amount = math.floor(a * (b + (k * c) ^ d) ^ c)
    amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
    return amount
  end
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

-- Sort CustomChallenges

for i, v in pairs(CustomChallenges) do
  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, v)
end
