vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.hidden = true
vim.o.updatetime = 500
vim.o.scrolloff = 5
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.inccommand = "split"
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.wo.signcolumn = "yes"
vim.wo.number = true
vim.wo.wrap = true
vim.wo.cursorline = false
vim.wo.relativenumber = true
vim.o.ignorecase = false
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.mouse = "a"
vim.o.errorbells = false
vim.o.title = true
vim.o.ruler = true
vim.o.startofline = false
vim.o.backspace = "indent,eol,start"
vim.o.wildmenu = true
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.formatoptions:remove "t"
vim.opt.formatoptions:remove "o"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
vim.opt.laststatus = 2
vim.o.completeopt = "menu,menuone,noselect"

vim.opt.showmode = false
vim.opt.showcmd = false

vim.opt.shortmess:append "a" -- use abbreviations for messages
vim.opt.shortmess:append "W" -- don't give "written" or "[w]" when writing a file
vim.opt.shortmess:append "s" -- don't give "search hit BOTTOM, continuing at TOP" or "search
vim.opt.shortmess:append "I" -- disable nvim intro
vim.opt.shortmess:append "c" -- Remove `Pattern not found` from compe
vim.opt.shortmess:append "q" -- use "recording" instead of "recording @a"
vim.opt.shortmess:append "F" -- don't give the file info when editing a file, like `:silent`

vim.cmd "let &fcs='eob: '" -- disable ~ end of buffer

--folding
-- opt.foldcolumn = 'auto' // too noisy but works with mouse
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

if vim.fn.has "win32" == 1 then
    vim.o.shell = "powershell.exe"
end

-- Fixate cmdheight to 2
vim.api.nvim_create_autocmd({ "WinScrolled" }, {
    pattern = "*",
    command = "set cmdheight=1",
})
