local api = vim.api
local g = vim.g
local fn = vim.fn

local function is_buffer_empty()
    -- Check whether the current buffer is empty
    return fn.empty(vim.fn.expand("%:t")) == 1
end

local function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return fn.winwidth(0) / 2 > cols
end

-- file extension specific tabbing
-- vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])

-- blankline config

local blankline = function()
    g.indentLine_enabled = 1
    g.indent_blankline_char = "▏"

    g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
    g.indent_blankline_buftype_exclude = {"terminal"}

    g.indent_blankline_show_trailing_blankline_indent = false
    g.indent_blankline_show_first_indent_level = false
end


return {
  blankline = blankline,
  is_buffer_empty = is_buffer_empty,
  has_width_gt = has_width_gt,
}
