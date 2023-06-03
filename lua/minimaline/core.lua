local M = {}
local devicons = require'nvim-web-devicons'

function M.get_mode()
    local modes = {
        ['n']     = 'NOR',
        ['no']    = 'O-P',
        ['nov']   = 'O-P',
        ['noV']   = 'O-P',
        ['no\22'] = 'O-P',
        ['niI']   = 'NOR',
        ['niR']   = 'NOR',
        ['niV']   = 'NOR',
        ['nt']    = 'NOR',
        ['ntT']   = 'NOR',
        ['v']     = 'VIS',
        ['vs']    = 'VIS',
        ['V']     = 'V-L',
        ['Vs']    = 'V-L',
        ['\22']   = 'V-B',
        ['\22s']  = 'V-B',
        ['s']     = 'SEL',
        ['S']     = 'S-L',
        ['\19']   = 'S-B',
        ['i']     = 'INS',
        ['ic']    = 'INS',
        ['ix']    = 'INS',
        ['R']     = 'REP',
        ['Rc']    = 'REP',
        ['Rx']    = 'REP',
        ['Rv']    = 'V-R',
        ['Rvc']   = 'V-R',
        ['Rvx']   = 'V-R',
        ['c']     = 'COM',
        ['cv']    = 'EX',
        ['ce']    = 'EX',
        ['r']     = 'REP',
        ['rm']    = 'MOR',
        ['r?']    = 'CON',
        ['!']     = 'SHE',
        ['t']     = 'TER',
    }
    return modes[vim.fn.mode()]
end

function M.get_icon()
    return (devicons.get_icon_by_filetype(vim.bo.filetype)) or ""
end

function M.build()
    local style = "%#Define#"
    local vim = "  "
    local mode = "%-5{%v:lua.require'minimaline.core'.get_mode()%}"
    local git_branch = "%-5{%v:lua.require'minimaline.git'.get_git_branch()%}"
    local lsp_diagnostics = "%-1{%v:lua.require'minimaline.lsp'.get_diagnostics()%}"
    local file_type = " %-2{%v:lua.require'minimaline.core'.get_icon()%}"
    local file_name = "%-.16t"
    local buf_nr = "[%n]"
    local modified = " %-m"
    local right_align = "%="
    local line_no = "%10([%l/%L%)]"
    local pct_thru_file = "%5p%%"

    return string.format(
        "%s %s %s %s %s %s %s %s %s %s %s %s",
        style,
        vim,
        mode,
        git_branch,
        lsp_diagnostics,
        file_type,
        file_name,
        buf_nr,
        modified,
        right_align,
        line_no,
        pct_thru_file
    )
end

return M
