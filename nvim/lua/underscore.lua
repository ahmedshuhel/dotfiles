local cmd = vim.cmd
local api = vim.api
local fn = vim.fn

local M = {}

M.trim = vim.trim

-- Keymap
M.map = function(mode, lhs, rhs, opts)
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
M.hi = function(group_name, highlight)
  local fg = highlight.fg and "guifg=" .. highlight.fg or "guifg=NONE"
  local bg = highlight.bg and "guibg=" .. highlight.bg or "guibg=NONE"
  local sp = highlight.sp and "guisp=" .. highlight.sp or "guisp=NONE"
  cmd("highlight " .. group_name .. " " .. "gui=" .. gui(highlight) .. " " .. fg .. " " .. bg .. " " .. sp)
end

M.t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Clear highlight
M.hic = function(group)
  cmd("hi clear " .. group)
end

M.if_nil = function(val, default)
  if val == nil then
    return default
  end
  return val
end

M.pp = function(obj)
  print(vim.inspect(obj))
end

M.feedkeys = function(keys, mode)
  local m = M.if_nil(mode, "")
  vim.api.nvim_feedkeys(M.t(keys), m, true)
end

M.has_chars_before = function()
  local ln, col = unpack(vim.api.nvim_win_get_cursor(0))
  local chars = vim.trim(vim.api.nvim_buf_get_lines(0, ln - 1, ln, true)[1]:sub(col, col))
  return col ~= 0 and chars:len() > 0
end

return M