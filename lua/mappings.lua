local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Terminal
map("n", "<leader>tx", [[<Cmd> ToggleTerm<CR>]], opt) -- toggle terminal
map("t", "\\<ESC>", [[<C-\><C-n>]], opt) --  exit terminal mode
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opt) --  Navigate left
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opt) --  Navigate dwon
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opt) --  Navigate up
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], opt) --  Navigate right


-- copy whole file content
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- Truezen.nvim
map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
map("n", "<leader>zf", ":TZFocus<CR>", opt)

map("n", "<C-s>", ":w <CR>", opt)

-- Commenter Keybinding
map("n", "<leader>/", ":CommentToggle<CR>", opt)
map("v", "<leader>/", ":CommentToggle<CR>", opt)

map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>", opt)

-- nvimtree
map("n", "-", ":NvimTreeOpen<CR> :NvimTreeFindFile<CR>", opt) -- new tab

-- format code
map("n", "<Leader>f", [[<Cmd> Format<CR>]], opt)

-- dashboard stuff
map("n", "<Leader>fw", [[<Cmd> Telescope live_grep<CR>]], opt)
map("n", "<Leader>db", [[<Cmd> Dashboard<CR>]], opt)
map("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], opt)
map("n", "<Leader>bm", [[<Cmd> DashboardJumpMarks<CR>]], opt)
map("n", "<C-s>l", [[<Cmd> SessionLoad<CR>]], opt)
map("n", "<C-s>s", [[<Cmd> SessionSave<CR>]], opt)

-- Telescope
map("n", "<Leader>gt", [[<Cmd> Telescope git_status <CR>]], opt)
map("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<C-p>", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], opt)
map("n", "<Leader>fs", [[<Cmd>Telescope grep_string<CR>]], opt)

-- bufferline tab stuff
map("n", "<S-t>", ":tabnew<CR>", opt) -- new tab
map("n", "<S-x>", "[[<Cmd>BufDel<CR>]]", opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

--highlight
map("n", "<ESC>", ":noh<CR>", opt)

--resize window
map("n", "<Leader>]", ":vertical resize -5<CR>")
map("n", "<Leader>[", ":vertical resize +5<CR>")
