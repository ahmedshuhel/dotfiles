
local function config()
  local lspsignature = require("lsp_signature")

  lspsignature.setup({
    bind = true,
    doc_lines = 2,
    floating_window = true,
    floating_window_above_cur_line = true,
    fix_pos = false,
    hint_enable = false, -- virtual hint enable/disable
    hint_prefix = " ",
    hint_scheme = "String",
    transpancy = 20, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
    hi_parameter = "Search",
    max_height = 22,
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "single", -- double, single, shadow, none
    },
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
  })
end

return {
  config = config,
}
