local _ = require("underscore")

_.map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")
_.map("n", "<ESC>", ":noh<CR>")
