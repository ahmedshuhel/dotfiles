local g = vim.g
local c = require("colors")
local _ = require("underscore")

local function config()
  g.indentLine_enabled = 1
  g.indent_blankline_char = "▏"
  g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
  g.indent_blankline_buftype_exclude = {"terminal"}
  g.indent_blankline_show_trailing_blankline_indent = false
  g.indent_blankline_show_first_indent_level = false

  _.hi("IndentBlanklineChar", {fg = c.line})
end

return {
  config = config
}
