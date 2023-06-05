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

function M.setup()
    vim.api.nvim_create_autocmd({"VimEnter", "BufWinEnter", "BufEnter"}, {
          pattern = {"NvimTree*"}, callback = disable_statusline })
    vim.opt.statusline = statusline.build()
end

return M
