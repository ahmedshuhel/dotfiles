local f = require "maq.funcs"
local keymap = vim.keymap.set

local function goto_prev_error()
    vim.diagnostic.goto_prev { severity = "Error" }
end

local function goto_next_error()
    vim.diagnostic.goto_next { severity = "Error" }
end

keymap({ "n", "v" }, "[e", goto_prev_error)
keymap({ "n", "v" }, "]e", goto_next_error)
keymap({ "n", "v" }, "[d", vim.diagnostic.goto_prev)
keymap({ "n", "v" }, "]d", vim.diagnostic.goto_next)

keymap("n", "].", vim.diagnostic.open_float)

keymap("n", "<space>d", function()
    require("telescope.builtin").diagnostics { bufnr = 0 }
end)

keymap("n", "<C-w>z", "<cmd>MaximizerToggle!<CR>")


f.map("n", "<C-h>", [[<Cmd> TmuxNavigateLeft<CR>]])
f.map("n", "<C-j>", [[<Cmd> TmuxNavigateDown<CR>]])
f.map("n", "<C-k>", [[<Cmd> TmuxNavigateUp<CR>]])
f.map("n", "<C-l>", [[<Cmd> TmuxNavigateRight<CR>]])
