-- Meta class
local Card = {suit = "", value = ""}

local mt = {
    __index = Card,
    __tostring = function (self) 
        return self.value .. " de " .. self.suit
    end,
    __eq = function (self, other)
        return self.value == other.value and self.suit == other.suit
    end
} 

local suits = {"copas", "bastos", "oros", "espadas"}
local values = {
    dos     = 1,
    tres    = 2,
    cuatro  = 3,
    cinco   = 4,
    seis    = 5, 
    siete   = 6,
    as      = 7,
    sota    = 8,
    caballo = 9,
    rey     = 10,
}

-- Constructor

function Card:new (value, suit)
    o = {}
    setmetatable(o, mt)
    o.suit = suit
    o.value = value

    return o
end

-- Methods

function Card:beats (other, vira)
    if self.suit ~= vira.suit and other.suit ~= vira.suit then
        if self.suit == other.suit then
            return values[self.value] > values[other.value]
        else
            return true
        end
    elseif other.suit ~= vira.suit then
        return true
    elseif self.suit ~= vira.suit then
        return false
    else
        if self.value == "dos" then
            return true
        elseif other.value == "dos" then
            return false
        else
            return values[self.value] > values[other.value]
        end
    end
end


return {
    Card = Card
}