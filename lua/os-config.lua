local os_name = nil

function GetName()
    if not os_name then
        os_name = (vim.fn.has("windows") == 1) and "win" or "mac"
    end
    return os_name
end
