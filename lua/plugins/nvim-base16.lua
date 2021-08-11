local base16 = require("base16")
local theme  = vim.g.dp_theme

base16(base16.themes(theme), true)
require "highlights"
