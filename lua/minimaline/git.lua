local M = {}

function M.get_git_branch()
    local branch = vim.fn.system[[git rev-parse --abbrev-ref HEAD 2> /dev/null]]
    return branch ~= "" and "  󰊢  " .. vim.trim(branch) or ""
end

return M
