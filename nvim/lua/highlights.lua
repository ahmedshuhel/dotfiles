local _ = require("underscore")
local c = require("colors")

require("plugins.blankline").highlight()
require("plugins.statusline").highlight()
require("plugins.telescope-nvim").highlight()
require("plugins.tree-nvim").highlight()
require("plugins.gitsigns-nvim").highlight()

_.hi("Pmenu", { bg = c.one_bg })
_.hi("PmenuSbar", { bg = c.one_bg2 })
_.hi("PmenuSel", { bg = c.green })
_.hi("PmenuThumb", { bg = c.nord_blue })

_.hi("FloatBorder", { bg = c.black2 })
_.hi("FloatBorder", { fg = c.black2 })
