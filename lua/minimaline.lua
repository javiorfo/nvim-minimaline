local statusline = require'minimaline.core'
local color = require'minimaline.color'
local M = {}

local function disable_statusline()
    vim.cmd[[
        function! DisableST()
            return " "
        endfunction
        setlocal statusline=%!DisableST()
    ]]
end

M.DEFAULT = { lsp_colors_enabled = false }

local function validate(opts)
    if opts.disabled_filetypes then
        if next(opts.disabled_filetypes) ~= nil and type(opts.disabled_filetypes) == "table" then
            M.DEFAULT.disabled_filetypes = opts.disabled_filetypes
        else
            vim.notify("Minimaline   Setup Error: property 'disabled_filetypes' must be a non-empty table'", vim.log.levels.ERROR)
        end
    end

    if opts.style then
        if next(opts.style) ~= nil and type(opts.style) == "table" then
            M.DEFAULT.style = opts.style
        else
            vim.notify("Minimaline   Setup Error: property 'style' must be a non-empty table'", vim.log.levels.ERROR)
        end
    end

    if opts.lsp_colors_enabled ~= nil then
        if type(opts.lsp_colors_enabled) == "boolean" then
            M.DEFAULT.lsp_colors_enabled = opts.lsp_colors_enabled
        else
            vim.notify("Minimaline   Setup Error: property 'lsp_colors_enabled' must be a boolean value'", vim.log.levels.ERROR)
        end
    end
end

function M.setup(opts)
    validate(opts)

    if M.DEFAULT.disabled_filetypes then
        vim.api.nvim_create_autocmd({"VimEnter", "BufWinEnter", "BufEnter"}, {
            pattern = M.DEFAULT.disabled_filetypes, callback = disable_statusline })
    end

    vim.opt.statusline = statusline.build()

    color.highlight("Minimaline", M.DEFAULT.style)
end

return M
