ChallengeMod = {}
function initChallenges()
  local lovely = require("lovely")
  local nativefs = require("nativefs")
  assert(load(nativefs.read(lovely.mod_dir .. "/ChallengeMod/Challenges.lua")))()
end
