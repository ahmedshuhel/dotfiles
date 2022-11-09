local g = vim.g
local fn = vim.fn
local uv = vim.loop
local cmd = vim.cmd
local api = vim.api
local f = require("maq.funcs")

function P(...)
    local args = { n = select("#", ...), ... }
    for i = 1, args.n do
        args[i] = vim.inspect(args[i])
    end
    print(unpack(args))
end

if not pcall(require, "impatient") then
    print "Failed to load impatient."
end

g.node_host_prog = fn.fnamemodify("~", ":p") .. ".nvm/versions/node/v16.13.1/bin/neovim-node-host"
g.python3_host_prog = fn.fnamemodify("~", ":p") .. ".pyenv/versions/py3nvim/bin/python3"

g.nvcode_termcolors = 256
g.mapleader = ","

vim.o.termguicolors = true

-- disable builtin vim plugins
local disabled_builtins = {
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
  "matchit",
}

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 0
end

if f.is_wsl2() then
  g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end


require "maq.plugins"

-- load project local nvimrc
local local_vimrc = fn.getcwd() .. "/.nvim/init.lua"
if uv.fs_stat(local_vimrc) then
  cmd("source " .. local_vimrc)
end
