local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local f = require "maq.funcs"

local is_win = vim.fn.has "win32" == 1
if not is_win then
    require("telescope").load_extension "fzf"
end

telescope.setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        prompt_prefix = "  ",
        selection_caret = "  ",
        selection_strategy = "reset",
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
        },
        initial_mode = "insert",
        entry_prefix = "  ",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_title = "",
                preview_title = "",
                result_title = "",
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        path_display = { truncate = 3 },
        color_devicons = true,
        use_less = true,
        winblend = 0,
        set_env = { ["COLORTERM"] = "truecolor" },
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
        },
        oldfiles = {
            theme = "dropdown",
            previewer = false,
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
        },
        lsp_document_symbols = {
            theme = "dropdown",
            previewer = false,
        },
        lsp_code_actions = {
            theme = "cursor",
            previewer = false,
        },
    },
    extensions = {
        project = {
            hidden_files = false,
        },
        fzf = is_win and {} or {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}

local dropdown = function(prefix)
    return require("telescope.themes").get_dropdown {
        borderchars = {
            { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        prompt_prefix =  prefix,
        width = 0.8,
        previewer = false,
        prompt_title = false,
    }
end

local full_theme = function(title)
    return {
        winblend = 20,
        width = 0.8,
        show_line = false,
        prompt_prefix =  title,
        prompt_title = "",
        results_title = "",
        preview_title = "",
        borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
    }
end

f.map("n", "<C-P>", function()
    builtin.find_files(dropdown("  "))
end)

f.map("n", "<leader>fs", function()
    builtin.git_status(dropdown("  "))
end)

f.map("n", "<leader>fo", function()
    builtin.oldfiles(dropdown("  "))
end)

f.map("n", "<leader>fc", function()
    builtin.git_commits(dropdown("  "))
end)

f.map("n", "<leader>fg", function()
    builtin.live_grep(full_theme("  "))
end)
