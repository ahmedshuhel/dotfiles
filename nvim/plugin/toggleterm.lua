local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    return
end

local f = require "maq.funcs"

toggleterm.setup {
    insert_mappings = false,
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    env = {
        MANPAGER = "less -X",
    },
    terminal_mappings = false,
    start_in_insert = true,
    persist_mode = true,
    open_mapping = [[<space>t]],
    highlights = {
        CursorLineSign = { link = "DarkenedPanel" },
        -- Normal = { guibg = KANAGAWA_COLORS.sumiInk0 }, Todo: fix
    },
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "rounded",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

f.map("t", "<C-q>", [[<C-\><C-n>]]) --  Exit terminal mode
f.map("t", "<C-h>", [[<C-\><C-n><C-w>h]]) --  Navigate left
f.map("t", "<C-j>", [[<C-\><C-n><C-w>j]]) --  Navigate dwon
f.map("t", "<C-k>", [[<C-\><C-n><C-w>k]]) --  Navigate up
f.map("t", "<C-l>", [[<C-\><C-n><C-w>l]]) --  Navigate right

f.map("n", "<leader>lg", function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
    }
    lazygit:toggle()
end)
