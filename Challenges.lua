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
  table.insert(CustomChallenges, dofile(file_path))
end

function ChallengeMod.addLocalization()
  for i, v in ipairs(CustomChallenges) do
    G.localization.misc.challenge_names[v.id] = v.name
  end

  --  Challenge Descriptions
  G.localization.misc.v_text.ch_c_all_perishable = { "All Jokers are {C:attention}Perishable{}" }
  G.localization.misc.v_text.ch_c_all_rental = { "All Jokers are {C:attention}Rental{}" }
  G.localization.misc.v_text.ch_c_cm_force_hand = { "Only {C:blue}#1#{} hands will score" }
  G.localization.misc.v_text.ch_c_cm_force_hand_contains = { "Played hands must contain a {C:blue}#1#{}" }
  G.localization.misc.v_text.ch_c_cm_negative_interest = { "Money is lost from {C:attention}Interest{}" }
  G.localization.misc.v_text.ch_c_cm_no_overscoring = { "{C:attention}Blind{} score must not exceed {C:green}#1#%{}" }
  G.localization.misc.v_text.ch_c_no_shop_planets = { "Planets no longer appear in the {C:attention}shop{}" }
  G.localization.misc.v_text.ch_c_no_shop_tarots = { "Tarots no longer appear in the {C:attention}shop{}" }
  G.localization.misc.v_text.ch_c_cm_stake = { "Playing on the {C:attention}#2#{} stake" }
  G.localization.misc.v_text.ch_c_cm_scaling = { "Custom ante scaling" }
  G.localization.misc.v_text.ch_c_cm_scaling_manual = { "Custom ante and blind scaling" }
  G.localization.misc.v_text.ch_c_cm_noshop = { "{C:attention}No Shop" }
  G.localization.misc.v_text.ch_c_cm_hand_kills = { "Lose the game if played hand contains a {C:blue}#1#{}" }
  G.localization.misc.v_text.ch_c_cm_all_facedown = { "All cards except those held in hand are face down" }
  G.localization.misc.v_text.ch_c_cm_mult_dollar_cap = { "{C:blue}Mult{} cannot exceed the current {C:money}$" }
  G.localization.misc.v_text.ch_c_cm_deck = { "Played on #1#{}" }
  G.localization.misc.v_text.ch_c_cm_no_after_hand = { "{C:attention}After hand{} Joker abilities are disabled" }
  G.localization.misc.v_text.ch_c_cm_no_after_round = { "{C:attention}After round{} Joker abilities are disabled" }
  G.localization.misc.v_text.ch_c_cm_no_on_discard = { "{C:attention}On discard{} Joker abilities are disabled" }
  --  Credit Tags
  G.localization.misc.v_text.ch_c_cm_credit = { "Concept by: {C:green}#1#{}" }
end

local get_blind_amount_ref = get_blind_amount
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
  end

  return get_blind_amount_ref(ante)
end

function taxedAlert(text)
  G.E_MANAGER:add_event(Event({
    trigger = "after",
    delay = 0.4,
    func = function()
      attention_text({
        text = text,
        scale = 0.8,
        hold = 4,
        major = G.STAGE == G.STAGES.RUN and G.play or G.title_top,
        backdrop_colour = G.C.MONEY,
        align = "cm",
        offset = {
          x = 0,
          y = -3.5,
        },
        silent = true,
      })
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.06 * G.SETTINGS.GAMESPEED,
        blockable = false,
        blocking = false,
        func = function()
          play_sound("coin3", 0.76, 0.4)
          play_sound("coin4", 0.76, 0.4)
          return true
        end,
      }))
      return true
    end,
  }))
end

function Card:set_perishable(_perishable)
  self.ability.perishable = nil
  if (self.config.center.perishable_compat or G.GAME.modifiers.all_perishable) and not self.ability.eternal then
    self.ability.perishable = true
    self.ability.perish_tally = G.GAME.perishable_rounds
  end
end

function ChallengeMod.fold()
  G.STATE = G.STATES.GAME_OVER
  if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
    G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
  end
  G:save_settings()
  G.FILE_HANDLER.force = true
  G.STATE_COMPLETE = false
  G.SETTINGS.paused = false
end

local blind_debuff_hand_ref = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
  if G.GAME.modifiers.cm_force_hand then
    if G.GAME.modifiers.cm_force_hand ~= handname then
      return true
    end
  end

  if G.GAME.modifiers.cm_force_hand_contains then
    if check then
      cards = G.hand.highlighted
    end
    local poker_hands = evaluate_poker_hand(cards)
    if next(poker_hands[G.GAME.modifiers.cm_force_hand_contains]) == nil then
      return true
    end
  end

  if not check then
    if G.GAME.modifiers.cm_hand_kills then
      local poker_hands = evaluate_poker_hand(cards)
      if next(poker_hands[G.GAME.modifiers.cm_hand_kills]) ~= nil then
        ChallengeMod.fold()
      end
    end
  end

  return blind_debuff_hand_ref(self, cards, hand, handname, check)
end

local blind_defeat_ref = Blind.defeat
function Blind:defeat(silent)
  if G.GAME.modifiers.cm_negative_interest then
    local tax = math.min(math.floor(G.GAME.dollars / 5), G.GAME.interest_cap / 5)
    taxedAlert("-$" .. tax)
    ease_dollars(-tax)
  end

  blind_defeat_ref(self, silent)

  if
    G.GAME.modifiers.cm_no_overscoring and (G.GAME.chips > self.chips * (G.GAME.modifiers.cm_no_overscoring / 100))
  then
    ChallengeMod.fold()
  end
end

local mod_mult_ref = mod_mult
function mod_mult(_mult)
  _mult = mod_mult_ref(_mult)

  if G.GAME.modifiers.cm_mult_dollar_cap then
    _mult = math.min(_mult, math.max(G.GAME.dollars, 0))
  end

  return _mult
end

for _, v in pairs(CustomChallenges) do
  if v.deck.type ~= "Challenge Deck" then
    table.insert(v.rules.custom, 1, { id = "cm_deck", value = v.deck.type })
  end

  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, v)
end
