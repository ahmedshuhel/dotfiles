local _ = require("underscore")
local c = require("colors")

local function config()
  local gs = require("gitsigns")

  gs.setup({
    signs = {
      add = { hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
    },
    numhl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
      ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
      ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    },
    watch_gitdir = {
      interval = 100,
    },
    sign_priority = 5,
    status_formatter = nil, -- Use default
  })
end

local function highlight()
  _.hi("DiffAdd", { fg = c.nord_blue })
  _.hi("DiffChange", { fg = c.grey_fg })
  _.hi("DiffModified", { fg = c.nord_blue })
  _.hi("DiffDelete", { fg = c.red })
end

return {
  config = config,
  highlight = highlight,
}
