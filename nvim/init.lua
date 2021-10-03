local exec = vim.api.nvim_command
local fn = vim.fn
local uv = vim.loop
local cmd = vim.cmd
local _ = require("underscore")
local c = require("colors")

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  exec("packadd packer.nvim")
end

require("globals")
require("options")
require("plugin-list")

_.map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")
_.map("n", "<ESC>", ":noh<CR>")

_.hi("Pmenu", { bg = c.one_bg })
_.hi("PmenuSbar", { bg = c.one_bg2 })
_.hi("PmenuSel", { bg = c.green })
_.hi("PmenuThumb", { bg = c.nord_blue })

_.hi("NormalFloat", { bg = c.black2 })
_.hi("FloatBorder", { bg = c.black2 })
_.hi("FloatBorder", { fg = c.black2 })

-- load project local nvimrc
local local_vimrc = fn.getcwd() .. "/.nvim/init.lua"
if uv.fs_stat(local_vimrc) then
  cmd("source " .. local_vimrc)
end
