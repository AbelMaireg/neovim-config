deepMerge = function (t1, t2)
    for k, v in pairs (t2) do
        if type (v) == "table" and type (t1[k] or false) == "table" then
            deepMerge (t1[k] or {}, v or {})
        else
            t1[k] = v
        end
    end
    return t1
end

return deepMerge
