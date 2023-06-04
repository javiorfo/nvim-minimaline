local statusline = require'minimaline.core'
local M = {}

function M.setup(opts)

    vim.opt.statusline = statusline.build()
end

return M
