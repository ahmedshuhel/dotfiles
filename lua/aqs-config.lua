local opt = vim.opt
local g = vim.g

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"

-- Numbers
opt.number = true
opt.numberwidth = 2
-- opt.relativenumber = true

-- for indenline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

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
g.node_host_prog = "/home/ahmedshuhel/.nvm/versions/node/v14.15.4/bin/neovim-node-host"
g.python3_host_prog = "/usr/bin/python3"
