local opt = vim.opt
local g = vim.g
local fn = vim.fn

opt.guicursor = ''
opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = false -- Highlight the screen line of the cursor with CursorLine
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 4
-- opt.relativenumber = true

opt.signcolumn = "number"
opt.cmdheight = 1
opt.updatetime = 1000 -- update interval for gitsigns
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.clipboard = "unnamedplus"


-- for indenline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- fast render hack
opt.ttimeoutlen = 100
opt.lazyredraw = true

-- disable builtin vim plugins
g.loaded_gzip = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_zipPlugin = 0
g.loaded_2html_plugin = 0
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_spec = 0
g.loaded_python_provider = 0
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.mapleader = " "
g.auto_save = false

-- colorscheme related stuff
g.nvim_theme = "onedark"

-- host program


g.node_host_prog = fn.fnamemodify('~', ':p') .. ".nvm/versions/node/v14.15.4/bin/neovim-node-host"
g.python3_host_prog = "/usr/bin/python3"
