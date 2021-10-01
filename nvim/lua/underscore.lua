local cmd = vim.cmd
local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fgbg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end


local function config()
  map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")

  -- nvimtree
  map("n", "-", ":NvimTreeFindFile<CR>") -- new tab

  -- bufferline tab stuff
  map("n", "<S-x>", "[[<Cmd>BufDel<CR>]]") -- close tab

  --highlight
  map("n", "<ESC>", ":noh<CR>")

  -- dbui
  map("n", "<Leader>.", ":DBUIToggle<CR>")
end

return {
  config = config,
  fg = fg,
  bg = bg,
  fgbg = fgbg,
  map = map
}
