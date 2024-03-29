local ok, dialmap = pcall(require, "dial.map")
if not ok then
    return
end

local augend = require "dial.augend"
require("dial.config").augends:register_group {
    default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 5, ...)
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.integer.alias.hex, -- nonnegative hex number  (0x04, 0x1a31, etc.)
        augend.date.alias["%Y/%m/%d"], -- date (2026/05/25, etc.)
        augend.hexcolor.new {
            case = "lower",
        },
    },
}

vim.keymap.set("n", "<C-a>", dialmap.inc_normal())
vim.keymap.set("n", "<C-x>", dialmap.dec_normal())
vim.keymap.set("v", "<C-a>", dialmap.inc_visual())
vim.keymap.set("v", "<C-x>", dialmap.dec_visual())
vim.keymap.set("v", "g<C-a>", dialmap.inc_gvisual())
vim.keymap.set("v", "g<C-x>", dialmap.dec_gvisual())
