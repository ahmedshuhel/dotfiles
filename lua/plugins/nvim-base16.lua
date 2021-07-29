local base16 = require("base16")
local theme  = vim.g.db_theme

base16(base16.themes["onedark"], true)
require "highlights"
