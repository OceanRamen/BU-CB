local lovely = require("lovely")
local nativefs = require("nativefs")

CustomChallenges = {
        -- {
        --     name = 'The Omelette',
        --     id = 'c_omelette_1',
        --     rules = {
        --         custom = {
        --             {id = 'no_reward'},
        --             {id = 'no_extra_hand_money'},
        --             {id = 'no_interest'}
        --         },
        --         modifiers = {
        --         }
        --     },
        --     jokers = {
        --         {id = 'j_egg'},
        --         {id = 'j_egg'},
        --         {id = 'j_egg'},
        --         {id = 'j_egg'},
        --         {id = 'j_egg'},
        --     },
        --     consumeables = {
        --     },
        --     vouchers = {
        --     },
        --     deck = {
        --         type = 'Challenge Deck'
        --     },
        --     restrictions = {
        --         banned_cards = {
        --             {id = 'v_seed_money'},
        --             {id = 'v_money_tree'},
        --             {id = 'j_to_the_moon'},
        --             {id = 'j_rocket'},
        --             {id = 'j_golden'},
        --             {id = 'j_satellite'},
        --         },
        --         banned_tags = {
        --         },
        --         banned_other = {
        --         }
        --     }
        -- },
}
for i, v in ipairs(CustomChallenges) do table.insert(G.CHALLENGES, #G.CHALLENGES+1, v) end
