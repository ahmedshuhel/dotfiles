local tsconfig = require("nvim-treesitter.configs")
local parsers = require("nvim-treesitter.parsers")

local function config()
  local parser_configs = parsers.get_parser_configs()

  parser_configs.http = {
    install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main",
    },
  }

  tsconfig.setup({
    ensure_installed = {
      "javascript",
      "typescript",
      "html",
      "css",
      "bash",
      "lua",
      "json",
      "python",
      "rust",
      "go",
      "c_sharp",
      "http",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
  })
end

return {
  config = config,
}
