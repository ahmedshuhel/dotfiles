local nls = require("null-ls")

local function config()
  nls.config({
    sources = {
      nls.builtins.formatting.stylua
    }
  })
end

return {
  config = config
}
