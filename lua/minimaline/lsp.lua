local M = {}

local function lsp()
    local error_count, warning_count, info_count, hint_count
    local diagnostics = vim.diagnostic.get(0)
    local count = { 0, 0, 0, 0 }
    for _, diagnostic in ipairs(diagnostics) do
        if vim.startswith(vim.diagnostic.get_namespace(diagnostic.namespace).name, 'vim.lsp') then
            count[diagnostic.severity] = count[diagnostic.severity] + 1
        end
    end
    error_count = count[vim.diagnostic.severity.ERROR]
    warning_count = count[vim.diagnostic.severity.WARN]
    info_count = count[vim.diagnostic.severity.INFO]
    hint_count = count[vim.diagnostic.severity.HINT]
    return error_count, warning_count, info_count, hint_count
end

function M.get_diagnostics()
    local signs = { error = "   ", warn = "   ", hint = "  ", info = "   " }
    local error, warn, info, hint = lsp()
    local result =  (error > 0 and signs.error .. error or "")
        .. (warn > 0 and signs.warn .. warn or "")
        .. (hint > 0 and signs.hint .. hint or "")
        .. (info > 0 and signs.info .. info or "")

    if result ~= "" then result = "" .. result .. " " end
    return result
end

return M
