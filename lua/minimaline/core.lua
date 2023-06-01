local M = {}

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
        ['r']     = 'REPLACE',
        ['rm']    = 'MORE',
        ['r?']    = 'CONFIRM',
        ['!']     = 'SHELL',
        ['t']     = 'TERMINAL',
    }
    return modes[vim.fn.mode()]
end

function M.build()
    local style = "%#Define#"
    local vim = "  "
    local mode = "%-5{%v:lua.require'minimaline.core'.get_mode()%}"
    local file_name = "%-.16t"
    local buf_nr = "[%n]"
    local modified = " %-m"
    local file_type = " %y"
    local right_align = "%="
    local line_no = "%10([%l/%L%)]"
    local pct_thru_file = "%5p%%"

    return string.format(
        "%s %s %s %s%s%s%s%s%s%s",
        style,
        vim,
        mode,
        file_name,
        buf_nr,
        modified,
        file_type,
        right_align,
        line_no,
        pct_thru_file
    )
end

return M
