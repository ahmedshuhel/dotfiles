local map = require("utils").map

-- Terminal
map("t", "<c-q>", [[<C-\><C-n>]])       --  Exit terminal mode
map("t", "<C-h>", [[<C-\><C-n><C-w>h]]) --  Navigate left
map("t", "<C-j>", [[<C-\><C-n><C-w>j]]) --  Navigate dwon
map("t", "<C-k>", [[<C-\><C-n><C-w>k]]) --  Navigate up
map("t", "<C-l>", [[<C-\><C-n><C-w>l]]) --  Navigate right

-- Truezen.nvim
map("n", "<leader>zz", ":TZAtaraxis<CR>")
map("n", "<leader>zm", ":TZMinimalist<CR>")
map("n", "<leader>zf", ":TZFocus<CR>")

-- Commenter Keybinding
map("n", "<leader>/", ":CommentToggle<CR>")
map("v", "<leader>/", ":CommentToggle<CR>")

map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")

-- nvimtree
map("n", "-", ":NvimTreeFindFile<CR>") -- new tab

-- format code
map("n", "<Leader>f", [[<Cmd> Format<CR>]])

-- dashboard stuff
-- map("n", "<Leader>db", [[<Cmd> Dashboard<CR>]])
-- map("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]])
-- map("n", "<Leader>bm", [[<Cmd> DashboardJumpMarks<CR>]])
-- map("n", "<C-s>l", [[<Cmd> SessionLoad<CR>]])
-- map("n", "<C-s>s", [[<Cmd> SessionSave<CR>]])

-- Telescope
map("n", "<C-p>", [[<Cmd> Telescope find_files <CR>]])
map("n", "<Leader>o", [[<Cmd> Telescope lsp_document_symbols <CR>]])
map("n", "<Leader>g", [[<Cmd> Telescope live_grep<CR>]])
map("n", "<S-t>", [[<Cmd>Telescope buffers<CR>]]) -- new tab
map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]])
map("n", "<Leader>fs", [[<Cmd> Telescope git_status <CR>]])
map("n", "<Leader>fc", [[<Cmd> Telescope git_commits <CR>]])

-- bufferline tab stuff
map("n", "<S-x>", "[[<Cmd>BufDel<CR>]]") -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]])
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]])

--highlight
map("n", "<ESC>", ":noh<CR>")

--resize window
map("n", "<Leader>]", ":vertical resize -5<CR>")
map("n", "<Leader>[", ":vertical resize +5<CR>")

-- tmux navigator
map("n", "<C-h>", [[<Cmd> TmuxNavigateLeft<CR>]])
map("n", "<C-j>", [[<Cmd> TmuxNavigateDown<CR>]])
map("n", "<C-k>", [[<Cmd> TmuxNavigateUp<CR>]])
map("n", "<C-l>", [[<Cmd> TmuxNavigateRight<CR>]])

-- dbui
map("n", "<Leader>.", ":DBUIToggle<CR>")
