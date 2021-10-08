local g  = vim.g
local fn = vim.fn
local uv = vim.loop
local cmd = vim.cmd
local api = vim.api

-- disable builtin vim plugins
local disabled_built_ins = {
    "python_provider",
    "ruby_provider",
    "perl_provider",
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
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

g.node_host_prog = fn.fnamemodify('~', ':p') .. ".nvm/versions/node/v14.15.4/bin/neovim-node-host"
g.python3_host_prog = "/usr/bin/python3"

g.mapleader = " "
g.auto_save = false


local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  api.nvim_command("packadd packer.nvim")
end

-- All global options
require("options")

-- Load keymaps before plugins
require("keymaps")

-- Load plugins
require("plugins").load()

-- Override highlights
require("highlights")

-- load project local nvimrc
local local_vimrc = fn.getcwd() .. "/.nvim/init.lua"
if uv.fs_stat(local_vimrc) then
  cmd("source " .. local_vimrc)
end
