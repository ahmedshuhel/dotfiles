local g = vim.g
local _ = require("underscore")

local function config()
  g.tmux_navigator_no_mappings = 1

  _.map("n", "<C-h>", [[<Cmd> TmuxNavigateLeft<CR>]])
  _.map("n", "<C-j>", [[<Cmd> TmuxNavigateDown<CR>]])
  _.map("n", "<C-k>", [[<Cmd> TmuxNavigateUp<CR>]])
  _.map("n", "<C-l>", [[<Cmd> TmuxNavigateRight<CR>]])
end

return {
  config = config
}
