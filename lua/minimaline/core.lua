local devicons_available, devicons = pcall(require, 'nvim-web-devicons')
local util = require'minimaline.util'
local M = {}

function M.get_mode()
    local n = ''
    local v = ''
    local i = ''
    local c = ''
    local modes = {
        ['n']     = n,
        ['no']    = n,
        ['nov']   = n,
        ['noV']   = n,
        ['no\22'] = n,
        ['niI']   = n,
        ['niR']   = n,
        ['niV']   = n,
        ['nt']    = n,
        ['ntT']   = n,
        ['v']     = v,
        ['vs']    = v,
        ['V']     = v,
        ['Vs']    = v,
        ['\22']   = v,
        ['\22s']  = v,
        ['s']     = i,
        ['S']     = i,
        ['\19']   = i,
        ['i']     = i,
        ['ic']    = i,
        ['ix']    = i,
        ['R']     = i,
        ['Rc']    = i,
        ['Rx']    = i,
        ['Rv']    = i,
        ['Rvc']   = i,
        ['Rvx']   = i,
        ['c']     = c,
        ['cv']    = c,
        ['ce']    = c,
        ['r']     = i,
        ['!']     = '󰩌',
        ['t']     = '',
    }
    return modes[vim.fn.mode()]
end

function M.get_icon()
    local default_file_icon = "󰈔"
    if devicons_available then
        return (devicons.get_icon_by_filetype(vim.bo.filetype)) or default_file_icon
    else
        return default_file_icon
    end
end

function M.modified()
    if vim.bo.readonly then
        return ""
    end
    if vim.bo.modifiable then
        return vim.bo.modified and "󰝒" or "󰈖"
    else
        return "󰈛"
    end
end

function M.build()
    local style = util.MINIMALINE_GROUP
    local mode_icon = " "
--     local mode_icon = "󰰑 "
    local mode = "%{%v:lua.require'minimaline.core'.get_mode()%}"
    local git_branch = "%{%v:lua.require'minimaline.git'.get_git_branch()%}"
    local lsp_diagnostics = "%{%v:lua.require'minimaline.lsp'.get_diagnostics()%}"
    local file_icon = "%{%v:lua.require'minimaline.core'.get_icon()%}"
    local file_name = "%t   %n"
    local modified = "%{%v:lua.require'minimaline.core'.modified()%}"
    local line_no = "%( %l/%L   %c%)"
    local encoding = "%{&fileencoding?&fileencoding:&encoding}"

    return string.format(
        "%s %s %s %s %s %s  %s %s   %s  %s",
        style,
        mode_icon,
        mode,
        git_branch,
        lsp_diagnostics,
        file_icon,
        file_name,
        modified,
        line_no,
        encoding
    )
end

return M
