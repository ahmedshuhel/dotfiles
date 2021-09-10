local opt = vim.opt
local fn = vim.fn

opt.guicursor = 'n-v-c:block-nCursor,i-ci-ve:ver100-iCursor'

vim.cmd([[
  augroup RestoreCursorShapeOnExit
      au!
      autocmd VimLeave,VimSuspend * set guicursor=a:block-Cursor
  augroup END
]])

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = false -- Highlight the screen line of the cursor with CursorLine
opt.mouse = "a"

opt.showmode = false
opt.showcmd  = false

opt.shortmess:append("sI") -- disable nvim intro
opt.shortmess:append("c") -- Remove `Pattern not found` from compe
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
