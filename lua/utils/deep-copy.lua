return function (original)
    local copy = {}
    for key, value in pairs (original) do
        if type (value) == "table" then
            copy[key] = deepCopy (value)
        else
            copy[key] = value
        end
    end
    return copy
end
