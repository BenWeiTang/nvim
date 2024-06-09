local M = {}

function M.GetCurrentFileName()
    local abs = M.GetCurrentAbsPath()
    abs = vim.fs.normalize(abs)
    local ret = vim.split(abs, "/", { plain=true })
    ret = ret[#ret]
    return ret
end

function M.GetCurrentAbsPath()
    local abs = vim.api.nvim_buf_get_name(0)
    return abs
end

return M
