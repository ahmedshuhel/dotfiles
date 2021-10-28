local opt = vim.opt

opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver100-iCursor"

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = false -- Highlight the screen line of the cursor with CursorLine
opt.mouse = "a"

opt.showmode = false
opt.showcmd = false

-- opt.completeopt = "menu,menuone,noselect"
opt.completeopt = "noselect"

opt.shortmess:append("a") -- use abbreviations for messages
opt.shortmess:append("W") -- don't give "written" or "[w]" when writing a file
opt.shortmess:append("s") -- don't give "search hit BOTTOM, continuing at TOP" or "search
opt.shortmess:append("I") -- disable nvim intro
opt.shortmess:append("c") -- Remove `Pattern not found` from compe
opt.shortmess:append("q") -- use "recording" instead of "recording @a"
opt.shortmess:append("F") -- don't give the file info when editing a file, like `:silent`

vim.cmd("let &fcs='eob: '") -- disable ~ end of buffer

-- Numbers
opt.number = true

opt.numberwidth = 3
opt.signcolumn = "yes:1"
opt.cmdheight = 1
opt.updatetime = 500 -- update interval for gitsigns
opt.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.clipboard = "unnamedplus"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- opt.whichwrap:append("<>hl")

-- for indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- swapfile
opt.swapfile = false

-- fast render hack
opt.ttimeoutlen = 100
opt.lazyredraw = true

--folding
-- opt.foldcolumn = 'auto' // too noisy but works with mouse
opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd([[
augroup RestoreCursorShapeOnExit
  au!
  au VimLeave,VimSuspend * set guicursor=a:ver100-iCursor
augroup END
]])
