local g = vim.g
local _ = require("underscore")

local function keymaps()
  _.map("n", "<C-h>", [[<Cmd> TmuxNavigateLeft<CR>]])
  _.map("n", "<C-j>", [[<Cmd> TmuxNavigateDown<CR>]])
  _.map("n", "<C-k>", [[<Cmd> TmuxNavigateUp<CR>]])
  _.map("n", "<C-l>", [[<Cmd> TmuxNavigateRight<CR>]])
end

local function config()
  g.tmux_navigator_no_mappings = 1
end

return {
  config = config,
  keymaps = keymaps,
}
