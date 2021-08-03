
local M = {}

M.config = function()
    local g = vim.g
    g.table_mode_corner='|'
    g.table_mode_corner_corner='+'
    g.table_mode_header_fillchar='-'
end

return M

