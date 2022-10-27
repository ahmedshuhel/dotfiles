local ok, onedark = pcall(require, "onedark")
local ok1, tint = pcall(require, "tint.transforms")

if not ok or not ok1 then
    return
end

--
-- Lua
onedark.setup {
    -- Main options --
    style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
}

--         LspInlayHint = { link = "Comment" },
--         DiagnosticLineError = { bg = "#2f2424" },
--         DiagnosticLineWarn = { bg = "#2f2b24" },
--         DiagnosticUnderlineError = { sp = tint.transform_color({}, "#2f2424", { tint.saturate(3), tint.tint(40) }) },
--         DiagnosticUnderlineHint = { sp = tint.transform_color({}, "#24282f", { tint.saturate(3), tint.tint(40) }) },
--         DiagnosticUnderlineInfo = { sp = tint.transform_color({}, "#242c2f", { tint.saturate(3), tint.tint(40) }) },
--         DiagnosticUnderlineWarn = { sp = tint.transform_color({}, "#2f2b24", { tint.saturate(3), tint.tint(40) }) },
--         DressingInputFloatBorder = { fg = KANAGAWA_COLORS.sumiInk0, bg = KANAGAWA_COLORS.sumiInk0 },
--         DressingInputNormalFloat = { bg = KANAGAWA_COLORS.sumiInk0 },
--         FloatTitle = { fg = KANAGAWA_COLORS.sumiInk0, bg = KANAGAWA_COLORS.oniViolet, bold = true },
--         Headline = { bg = KANAGAWA_COLORS.winterBlue },
--         IndentBlanklineChar = { fg = KANAGAWA_COLORS.sumiInk2 },
--         IndentBlanklineContextStart = { bold = true, underline = false },
--         LualineGitAdd = { link = "GitSignsAdd" },
--         LualineGitChange = { link = "GitSignsAdd" },
--         LualineGitDelete = { link = "GitSignsDelete" },
--         NeoTreeGitUntracked = { link = "NeoTreeGitModified" },
--         NeoTreeNormal = { bg = KANAGAWA_COLORS.sumiInk0 },
--         NeoTreeNormalNC = { bg = KANAGAWA_COLORS.sumiInk0 },
--         NeoTreeWinSeparator = { fg = KANAGAWA_COLORS.sumiInk1, bg = KANAGAWA_COLORS.sumiInk1 },
--         NeotestAdapterName = { fg = KANAGAWA_COLORS.autumnRed },
--         NeotestDir = { link = "Directory" },
--         NeotestExpandMarker = { fg = KANAGAWA_COLORS.sumiInk2 },
--         NeotestFailed = { fg = KANAGAWA_COLORS.samuraiRed },
--         NeotestFile = { link = "Directory" },
--         NeotestFocused = { underline = false, bold = true },
--         NeotestIndent = { fg = KANAGAWA_COLORS.sumiInk2 },
--         NeotestMarked = { fg = KANAGAWA_COLORS.springBlue },
--         NeotestNamespace = { bold = true, fg = KANAGAWA_COLORS.dragonBlue },
--         NeotestPassed = { fg = KANAGAWA_COLORS.springGreen },
--         NeotestRunning = { fg = KANAGAWA_COLORS.autumnYellow },
--         NeotestSkipped = { fg = KANAGAWA_COLORS.springViolet1 },
--         NeotestTarget = { fg = KANAGAWA_COLORS.roninYellow },
--         NeotestWinSelect = { fg = KANAGAWA_COLORS.sumiInk0, bg = KANAGAWA_COLORS.waveBlue2 },
--         NotifierContentError = { fg = KANAGAWA_COLORS.autumnRed },
--         NotifierContentWarn = { fg = KANAGAWA_COLORS.autumnYellow },
--         NotifierTitle = { link = "Comment" },
--         WinBarActive = { fg = KANAGAWA_COLORS.sumiInk2, bg = KANAGAWA_COLORS.sumiInk1 },
--         WinBarActiveMuted = { fg = KANAGAWA_COLORS.katanaGray },
--         WinBarInactive = { fg = KANAGAWA_COLORS.sumiInk2, bg = KANAGAWA_COLORS.sumiInk1 },
--         WinBarInactiveMuted = { fg = KANAGAWA_COLORS.winterYellow },
--         WinBarTextActive = { fg = KANAGAWA_COLORS.springBlue, bg = KANAGAWA_COLORS.sumiInk2, bold = true },
--         WinBarTextInactive = { fg = KANAGAWA_COLORS.fujiGray, bg = KANAGAWA_COLORS.sumiInk2 },
--         WinSeparator = { fg = KANAGAWA_COLORS.sumiInk3 },

vim.cmd.colorscheme { "onedark" }
