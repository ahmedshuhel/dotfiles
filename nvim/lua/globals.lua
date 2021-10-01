local g  = vim.g
local fn = vim.fn

g.mapleader = " "
g.auto_save = false

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
