local nls = require("null-ls")

local function config()
  nls.config({
    sources = {
      nls.builtins.formatting.stylua.with({
        condition = function(utils)
          return utils.root_has_file(".stylua.toml")
        end,
      }),
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.black,
      nls.builtins.formatting.sqlformat,
      nls.builtins.formatting.terraform_fmt,
      nls.builtins.diagnostics.codespell,
      nls.builtins.diagnostics.eslint_d,
    },
  })
end

return {
  config = config,
}
