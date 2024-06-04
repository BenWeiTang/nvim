local M = {}

function M.GetIsUnrealProject()
    local uproject = vim.fs.find(function(name, _)
        return name:match(".*%.uproject$")
    end, {
        upward = true,
        type = "file",
    })
    return uproject ~= nil
end

return M
