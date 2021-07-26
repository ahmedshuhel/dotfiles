local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- load all plugins
require "aqs-config"
require "plugin-list"
require "misc-utils"
require "top-bufferline"

local base16 = require "base16"
base16(base16.themes["onedark"], true)

require "highlights"
require "mappings"
require "file-icons"
require "statusline"

function _G.open_dashboard()
  if vim.fn.argc() == 0 then
    vim.api.nvim_command("Dashboard")
  end
end


vim.api.nvim_exec("au VimEnter * lua open_dashboard()", false)
vim.api.nvim_exec("au BufWritePost plugin-list.lua PackerCompile", false)

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
[[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 
]],
  false
)


function _G.reposition_tree()
 -- vim.api.nvim_command('1wincmd H')
 -- vim.api.nvim_command('vertical 1resize 40')
end


vim.api.nvim_exec(
[[
   augroup nvimtree
     autocmd!
     au BufWinEnter,BufWinLeave * lua reposition_tree()
   augroup END
]],
  false
)

