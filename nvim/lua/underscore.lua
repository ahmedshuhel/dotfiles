local cmd = vim.cmd
local api = vim.api

-- Keymap
local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function gui(highlight)
  if highlight.bold then
    return "bold"
  elseif highlight.underline then
    return "underline"
  elseif highlight.undercurl then
    return "undercurl"
  elseif highlight.italic then
    return "italic"
  elseif highlight.reverse then
    return "reverse"
  else
    return "NONE"
  end
end

-- Apply highlight
local function hi(group_name, highlight)
  local fg = highlight.fg and "guifg=" .. highlight.fg or "guifg=NONE"
  local bg = highlight.bg and "guibg=" .. highlight.bg or "guibg=NONE"
  local sp = highlight.sp and "guisp=" .. highlight.sp or "guisp=NONE"
  cmd("highlight " .. group_name .. " " .. "gui=" .. gui(highlight) .. " " .. fg .. " " .. bg .. " " .. sp)
end

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Clear highlight
local function hic(group)
  cmd("hi clear " .. group)
end

return {
  hi = hi,
  hic = hic,
  map = keymap,
  t = t,
}
