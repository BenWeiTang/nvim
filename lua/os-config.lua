local M = {}

local os_name = nil

function M.GetName()
    if not os_name then
        if (vim.fn.has("windows")) then
            os_name = "win"
        elseif (vim.fn.has("macunix")) then
            os_name = "mac"
        end
    end
    return os_name
end

return M
