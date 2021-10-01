local ts_config = require("nvim-treesitter.configs")

local function config()
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
    },
    highlight = {
      enable = true,
      use_languagetree = true
    }
  }
end

return {
  config = config
}
