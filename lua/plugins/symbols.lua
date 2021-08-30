local function config()
    vim.g.symbols_outline = {
        width = 20,
        auto_preview = false,
         keymaps = { -- These keymaps can be a string or a table for multiple keys
            close = {"q"},
         },
        symbol_blacklist = {},

    }
end

return {
  config = config
}
