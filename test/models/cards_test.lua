-- models/cards.lua tests
package.path = package.path .. ";../src/models/cards.lua"
local cards = require("cards")
local Card = cards.Card

test {
    description = "Test 1: Successfully create a card",
    expected    = true,
    result      = function ()
        local card = Card:new("tres", "oros")
        return true
    end
}

-- test {
--     description = "Invalid values yields an error",
--     expected    = nil,
--     result      = nil
-- }

test {
    description = "Test 2: tostring is faithful",
    expected    = "tres de oros",
    result      = function ()
        local card = Card:new("tres", "oros")
        return tostring(card)
    end
}

test {
    description = "Test 3.1: card beats other, none from vira",
    expected    = true,
    result      = function ()
        local card = Card:new("tres", "oros")
        local other = Card:new("siete", "bastos")
        local vira = Card:new("caballo", "espadas")
        return card:beats(other, vira)
    end
}

test {
    description = "Test 3.2: card beats other, none from vira, same suit",
    expected    = true,
    result      = function ()
        local card = Card:new("tres", "oros")
        local other = Card:new("dos", "oros")
        local vira = Card:new("caballo", "espadas")
        return card:beats(other, vira)
    end
}

test {
    description = "Test 3.3: card beats other, card from vira",
    expected    = true,
    result      = function ()
        local card = Card:new("tres", "espadas")
        local other = Card:new("siete", "oros")
        local vira = Card:new("caballo", "espadas")
        return card:beats(other, vira)
    end
}

test {
    description = "Test 3.4: other beats card, other from vira",
    expected    = false,
    result      = function ()
        local card = Card:new("tres", "oros")
        local other = Card:new("siete", "espadas")
        local vira = Card:new("caballo", "espadas")
        return card:beats(other, vira)
    end
}

test {
    description = "Test 3.5: card beats other, both from vira",
    expected    = true,
    result      = function ()
        local card = Card:new("dos", "oros")
        local other = Card:new("rey", "oros")
        local vira = Card:new("caballo", "oros")
        return card:beats(other, vira)
    end
}
