local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    parser_configs.http = {
      install_info = {
        url = "https://github.com/NTBBloodbath/tree-sitter-http",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    ts_config.setup {
        ensure_installed = {
            "javascript",
            "html",
            "css",
            "bash",
            "lua",
            "json",
            "python",
            "rust",
            "go",
            "http"
        },
        highlight = {
            enable = true,
            use_languagetree = true
        }
    }
end

return M
