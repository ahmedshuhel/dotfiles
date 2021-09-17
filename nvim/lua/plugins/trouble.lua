local api = vim.api
local opt = {silent = true, noremap = true}

local function map(...)
  api.nvim_set_keymap("n", ...)
end

local function config()
  require("trouble").setup({
    position = "bottom", -- position of the list can be: bottom, top, left, right. TODO: add `rightbelow` to play nice with fixed left file tree
    height = 10, -- height of the trouble list when position is top or bottom
    icons = true, -- use devicons for filenames
    auto_close = true,
    auto_preview = false,
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>", "o"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    }
  })

  map("<leader>xx", "<cmd>Trouble<cr>", opt)
  map("<leader>xl", "<cmd>Trouble loclist<cr>", opt)
  map("<leader>xq", "<cmd>Trouble quickfix<cr>", opt)
end

return {
  config = config
}