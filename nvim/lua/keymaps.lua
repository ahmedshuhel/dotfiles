local _ = require("underscore")

require("plugins.bufdel").keymaps()
require("plugins.comment").keymaps()
require("plugins.dadbod-ui").keymaps()
require("plugins.rest-nvim").keymaps()
require("plugins.telescope-nvim").keymaps()
require("plugins.toggleterm").keymaps()
require("plugins.tree-nvim").keymaps()
require("plugins.trouble").keymaps()
require("plugins.zenmode").keymaps()
require("plugins.tmux-navigator").keymaps()

_.map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")
_.map("n", "<ESC>", ":noh<CR>")

