local statusline = require'minimaline.core'
local color = require'minimaline.color'
local util = require'minimaline.util'
local M = {}

M.DEFAULT = { lsp_colors_enabled = false }

local function disable_statusline()
    vim.cmd[[
        function! DisableST()
            return " "
        endfunction
        setlocal statusline=%!DisableST()
    ]]
end

local function validate(opts)
    if opts.disabled_filetypes then
        if next(opts.disabled_filetypes) ~= nil and type(opts.disabled_filetypes) == "table" then
            M.DEFAULT.disabled_filetypes = opts.disabled_filetypes
        else
            vim.notify("Minimaline   Setup Error: property 'disabled_filetypes' must be a non-empty table'", vim.log.levels.ERROR)
            return false
        end
    end

    if opts.style then
        if next(opts.style) ~= nil and type(opts.style) == "table" then
            M.DEFAULT.style = opts.style
        else
            vim.notify("Minimaline   Setup Error: property 'style' must be a non-empty table'", vim.log.levels.ERROR)
            return false
        end
    end

    if opts.lsp_colors_enabled ~= nil then
        if type(opts.lsp_colors_enabled) == "boolean" then
            M.DEFAULT.lsp_colors_enabled = opts.lsp_colors_enabled
        else
            vim.notify("Minimaline   Setup Error: property 'lsp_colors_enabled' must be a boolean value'", vim.log.levels.ERROR)
            return false
        end
    end
    return true
end

function M.setup(opts)
    if not validate(opts) then return end

    if M.DEFAULT.disabled_filetypes then
        vim.api.nvim_create_autocmd({"VimEnter", "BufWinEnter", "BufEnter"}, {
            pattern = M.DEFAULT.disabled_filetypes, callback = disable_statusline })
    end

    if M.DEFAULT.lsp_colors_enabled then
        local error = { fg = 9 }
        local warn = { fg = 11 }
        local hint = { fg = 15 }
        local info = { fg = 14 }

        if M.DEFAULT.style and M.DEFAULT.style.bg then
            error.bg = M.DEFAULT.style.bg
            warn.bg = M.DEFAULT.style.bg
            hint.bg = M.DEFAULT.style.bg
            info.bg = M.DEFAULT.style.bg
        end

        color.highlight(util.MINIMALINE_LSP_ERROR, error)
        color.highlight(util.MINIMALINE_LSP_WARN, warn)
        color.highlight(util.MINIMALINE_LSP_HINT, hint)
        color.highlight(util.MINIMALINE_LSP_INFO, info)
    end

    vim.opt.statusline = statusline.build()

    color.highlight("Minimaline", M.DEFAULT.style)
end

return M
