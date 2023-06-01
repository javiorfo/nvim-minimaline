local statusline = require'minimaline.core'
local git = require'minimaline.git'
local M = {}

function M.setup(opts)
    vim.opt.statusline = statusline.build()
end

return M

