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

opt.shortmess:append("sI") -- disable nvim intro
vim.cmd("let &fcs='eob: '") -- disable ~ end of buffer

-- Numbers
opt.number = true
opt.numberwidth = 4
-- opt.relativenumber = true

opt.signcolumn = "number"
opt.cmdheight = 1
opt.updatetime = 1000 -- update interval for gitsigns
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.clipboard = "unnamedplus"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl")

-- for indenline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- fast render hack
opt.ttimeoutlen = 100
opt.lazyredraw = true


g.mapleader = " "
g.auto_save = false

g.dp_theme = 'onedark'
-- host program
g.node_host_prog = fn.fnamemodify('~', ':p') .. ".nvm/versions/node/v14.15.4/bin/neovim-node-host"
g.python3_host_prog = "/usr/bin/python3"

-- disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
    "python_provider",
    "ruby_provider",
    "perl_provider"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
