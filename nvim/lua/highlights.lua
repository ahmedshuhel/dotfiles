local cmd = vim.cmd

local global_theme = "themes/" .. vim.g.dp_theme
local colors = require(global_theme)

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local grey = colors.grey
local grey_fg = colors.grey_fg
local red = colors.red
local line = colors.line
local green = colors.green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow

-- for guifg , bg

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- blankline

fg("IndentBlanklineChar", line)

-- misc --
fg("LineNr", grey)
fg("Comment", grey_fg)
fg("NvimInternalError", red)

fg("EndOfBuffer", black)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- Statusline/Vertical Split
fg_bg("VertSplit", darker_black, darker_black)

-- inactive statuslines as thin splitlines
-- cmd("hi! StatusLineNC gui=underline guifg=" .. line)

cmd("hi clear StatusLine")
bg("Statusline", darker_black)
bg("StatuslineNC", darker_black)


-- git signs ---
fg_bg("DiffAdd", nord_blue, "none")
fg_bg("DiffChange", grey_fg, "none")
fg_bg("DiffModified", nord_blue, "none")
fg_bg("DiffDelete", red, "none")

-- NvimTree
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeFolderName", blue)
fg("NvimTreeOpenedFolderName", blue)
fg("NvimTreeEmptyFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fg("NvimTreeEndOfBuffer", darker_black)

fg("NvimTreeRootFolder", nord_blue)
bg("NvimTreeNormal", black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", grey)

-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", red)
fg("LspDiagnosticsVirtualTextError", red)
fg("LspDiagnosticsSignWarning", yellow)
fg("LspDiagnosticsVirtualTextWarning", yellow)

-- info
fg("LspDiagnosticsSignInformation", green)
fg("LspDiagnosticsVirtualTextInformation", green)

-- hint
fg("LspDiagnosticsSignHint", green)
fg("LspDiagnosticsVirtualTextHint", grey)

-- dashboard

-- fg("DashboardHeader", nord_blue)
-- fg("DashboardCenter", grey_fg)
-- fg("DashboardShortcut", grey_fg)
-- fg("DashboardFooter", red)

-- packer's floating window

bg("NormalFloat", black2)
bg("FloatBorder", black2)
fg("FloatBorder", black2)

-- set bg color for nvim
-- bg("Normal", black)

-- Cursor
-- line n.o
--cmd "hi clear CursorLine"

fg("CursorLineNr", white)
bg("DpNCursor", nord_blue)
bg("DpICursor", green)