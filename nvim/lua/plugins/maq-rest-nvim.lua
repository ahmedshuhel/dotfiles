local _ = require("underscore")

local function keymaps()
  _.map("n", "<Leader>ch", "[[:lua require('rest-nvim').run()<CR>]]")
  _.map("n", "<Leader>cp", [[:lua require('rest-nvim').run(true)<CR>)]])
  _.map("n", "<Leader>cl", [[:lua require('rest-nvim').last()<CR>]])
end

local function config()
  require("rest-nvim").setup({
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = true,
    -- Highlight request on run
    highlight = {
      enabled = true,
      timeout = 150,
    },
    -- Jump to request line on run
    jump_to_request = false,
  })
end

return {
  config = config,
  keymaps = keymaps
}
