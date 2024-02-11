local M = {}

local os_name = nil

-- See: ":help keycodes"
local thumb = nil
local pinky = nil

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

function M.ThumbCombo(key)
    if not thumb then
        local os = M.GetName()
        thumb = (os == "win") and "A" or "M"
    end
    return "<" .. thumb .. "-" .. key .. ">"
end

function M.PinkyCombo(key)
    if not pinky then
        local os = M.GetName()
        -- For now there's only windows and mac, both of which use pinky to press Ctrl
        pinky = (os == "win") and "C" or "C"
    end
    return "<" .. pinky .. "-" .. key .. ">"
end

return M
