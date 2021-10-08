local g = vim.g
local c = require("colors")
local _ = require("underscore")

local function highlight()
  _.hi("IndentBlanklineChar", { fg = c.line })
end

local function config()
  g.indentLine_enabled = 1
  g.indent_blankline_char = "▏"
  g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "toggleterm", "NvimTree" }
  g.indent_blankline_buftype_exclude = { "terminal" }
  g.indent_blankline_show_trailing_blankline_indent = false
  g.indent_blankline_show_first_indent_level = false
end

return {
  config = config,
  highlight = highlight,
}
