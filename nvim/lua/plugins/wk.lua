local function config()
  local wk = require("which-key")
  wk.setup({
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  })
end

return {
  config = config,
}
