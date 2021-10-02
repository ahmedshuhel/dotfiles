local ts = require("telescope")
local trouble = require("trouble.providers.telescope")
local _ = require("underscore")
local c = require("colors")

local function config()
  _.hi("TelescopeBorder", {fg = c.grey})
  _.hi("TelescopePromptBorder", {fg = c.grey})
  _.hi("TelescopeResultsBorder", {fg = c.grey})
  _.hi("TelescopePreviewBorder", {fg = c.grey})

  ts.setup ({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      prompt_prefix = "  ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120
      },
      file_sorter = require "telescope.sorters".get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
      winblend = 0,
      border = {},
      borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      color_devicons = true,
      use_less = true,
      set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
      file_previewer = require "telescope.previewers".vim_buffer_cat.new,
      grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
      qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
      mappings = {
        i = { ["<c-q>"] = trouble.open_with_trouble },
        n = { ["<c-q>"] = trouble.open_with_trouble },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false
      },
      oldfiles = {
        theme = "dropdown",
        previewer = false
      },
      buffers = {
        theme = "dropdown",
        previewer = false
      },
      lsp_document_symbols = {
        theme = "dropdown",
        previewer = false
      },
      lsp_code_actions = {
        theme = "cursor",
        previewer = false
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    }
  })

  ts.load_extension("fzf")
  ts.load_extension("media_files")

  _.map("n", "<C-p>", [[<Cmd>Telescope find_files<CR>]])
  _.map("n", "<Leader>o", [[<Cmd>Telescope lsp_document_symbols<CR>]])
  _.map("n", "<Leader>g", [[<Cmd>Telescope live_grep<CR>]])
  _.map("n", "<S-t>", [[<Cmd>Telescope buffers<CR>]])
  _.map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]])
  _.map("n", "<Leader>fs", [[<Cmd>Telescope git_status<CR>]])
  _.map("n", "<Leader>fc", [[<Cmd>Telescope git_commits<CR>]])
end

return {
  config = config
}
