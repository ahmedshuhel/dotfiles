local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


require("globals")
require("options")
require("plugin-list")
require("underscore").config()

-- load project local nvimrc
local local_vimrc = fn.getcwd()..'/.nvim/init.lua'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '.. local_vimrc)
end
