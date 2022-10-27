local _ = require("underscore")

require("plugins.bufdel").keymaps()
require("plugins.comment").keymaps()
require("plugins.dadbod-ui").keymaps()
require("plugins.maq-rest-nvim").keymaps()
require("plugins.telescope-nvim").keymaps()
require("plugins.maq-toggleterm").keymaps()
require("plugins.maq-trouble").keymaps()
require("plugins.zenmode").keymaps()
require("plugins.tmux-navigator").keymaps()

_.map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")
_.map("n", "<ESC>", ":noh<CR>")

