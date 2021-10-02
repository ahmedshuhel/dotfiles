local cmd = vim.cmd
local api = vim.api
local keymap = api.nvim_set_keymap

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  keymap(mode, lhs, rhs, options)
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

local function hi(group_name, highlight)
  local fg = highlight.fg and "guifg=" .. highlight.fg or "guifg=NONE"
  local bg = highlight.bg and "guibg=" .. highlight.bg or "guibg=NONE"
  local sp = highlight.sp and "guisp=" .. highlight.sp or "guisp=NONE"
  cmd("highlight " .. group_name .. " ".."gui="..gui(highlight).." "..fg .. " " .. bg .. " " .. sp)
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

local function clh(group)
  cmd("hi clear " .. group)
end

return {
  hi = hi,
  fg = fg,
  bg = bg,
  fgbg = fgbg,
  clh = clh,
  map = map
}
