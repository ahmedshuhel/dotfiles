local nls = require("null-ls")
local helpers = require("null-ls.helpers")

local function config()
  nls.config({
    sources = {
      nls.builtins.formatting.stylua.with({
        condition = function(utils)
          return utils.root_has_file(".stylua.toml")
        end,
      }),
      helpers.conditional(function(utils)
        return utils.root_has_file(".eslintrc.yml") and nls.builtins.formatting.eslint_d
          or nls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "html" },
          })
      end),
      nls.builtins.formatting.black,
      nls.builtins.formatting.sqlformat.with({
        filetypes = { "sql", "mysql", "pgsql" },
      }),
      nls.builtins.formatting.terraform_fmt,
      nls.builtins.diagnostics.codespell,
      nls.builtins.diagnostics.write_good,
      nls.builtins.diagnostics.stylelint,
    },
  })
end

return {
  config = config,
}
