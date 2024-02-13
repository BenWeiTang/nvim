local M = {}

local os_name = nil

-- See: ":help keycodes"
local thumb = nil
local pinky = nil

function M.Init()
    if not os_name then
        if (package.config:sub(1,1) == "\\") then
            os_name = "win"
        else
            os_name = "mac"
        end
    end
end

-- Get the name of the OS, e.g., win or mac
function M.GetName()
    if not os_name then
        M.Init()
    end
    return os_name
end

-- Get the keycode of the thumb key, e.g., A or M
function M.GetThumbKey()
    if not thumb then
        local os = M.GetName()
        thumb = (os == "win") and "A" or "M"
        -- M is actually Meta key, which is Option on Mac by Neovim's default
        -- Because Cmd key is reserved for a lot of tasks, it's better to use the Option key 
        -- This API assumes the terminal app remaps Cmd to Opt (See: GetThumbkeyName)
        -- so a lot of the action key combos can still be triggered by pressing Cmd
    end
    return thumb;
end

-- Get the keycode of the pinky key, e.g., C
function M.GetPinkyKey()
    if not pinky then
        local os = M.GetName()
        -- For now there's only windows and mac, both of which use pinky to press Ctrl
        pinky = (os == "win") and "C" or "C"
    end
    return pinky;
end

-- Get the name of the thumb key, e.g., Alt or Cmd
function M.GetThumbKeyName()
    return (M.GetThumbKey() == "A") and "Alt" or "Cmd"
end

-- Get the name of the Pinky key, e.g., Ctrl
function M.GetPinkyKeyName()
    return (M.GetPinkyKey() == "C") and "Ctrl" or "Ctrl"
end

-- Get the keycode of thumb key combo, e.g., <A-key> or <M-key>
function M.ThumbCombo(key)
    return "<" .. M.GetThumbKey() .. "-" .. key .. ">"
end

-- Get the keycode of pinky key combo, e.g., <C-key>
function M.PinkyCombo(key)
    return "<" .. M.GetPinkyKey() .. "-" .. key .. ">"
end

return M
