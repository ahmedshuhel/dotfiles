local ls = require("luasnip")

local function config()
  ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
  })

  require("luasnip/loaders/from_vscode").load()
end

return {
  config = config
}
