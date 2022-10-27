local _ = require("underscore")

local function keymaps()
  _.map("n", "<leader>/", ":CommentToggle<CR>")
  _.map("v", "<leader>/", ":CommentToggle<CR>")
end

local function config()
  require("nvim_comment").setup()
end

return {
  config = config,
  keymaps = keymaps
}
