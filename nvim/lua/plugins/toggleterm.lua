local toggleterm = require("toggleterm")
local _ = require("underscore")

local function config()
  toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = 'rounded',
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      }
    }
  })

  _.map("t", "<c-q>", [[<C-\><C-n>]])       --  Exit terminal mode
  _.map("t", "<C-h>", [[<C-\><C-n><C-w>h]]) --  Navigate left
  _.map("t", "<C-j>", [[<C-\><C-n><C-w>j]]) --  Navigate dwon
  _.map("t", "<C-k>", [[<C-\><C-n><C-w>k]]) --  Navigate up
  _.map("t", "<C-l>", [[<C-\><C-n><C-w>l]]) --  Navigate right
end

return {
  config = config
}
