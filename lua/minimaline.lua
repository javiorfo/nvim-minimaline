local statusline = require'minimaline.core'
local M = {}

local function disable_statusline()
    vim.cmd[[
        function! DisableST()
            return " "
        endfunction
        setlocal statusline=%!DisableST()
    ]]
end

function M.setup(opts)
    vim.api.nvim_create_autocmd({"VimEnter", "BufWinEnter", "BufEnter"}, {
          pattern = {"NvimTree_1"}, callback = disable_statusline })
    vim.opt.statusline = statusline.build()
    vim.cmd[[hi link Minimaline Define]]
end

return M
