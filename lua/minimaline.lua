local statusline = require'minimaline.core'
local M = {}

function M.setup(opts)
--[[     vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "BufWinEnter" }, {
          pattern = { "NvimTree" },
          callback = function(ev)
              vim.opt.laststatus = 0
          end
        }) ]]

    vim.opt.statusline = statusline.build()
end

return M

