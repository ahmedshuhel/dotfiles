local g = vim.g
local fn = vim.fn

local config = function()
  local dir = fn.finddir('.git/..', fn.expand('%:p:h'))
  g.db_ui_win_position = 'right'
  g.db_ui_force_echo_notifications = 1
  g.db_ui_use_nerd_fonts = 1
  g.db_ui_show_help = 0
  g.db_ui_save_location = dir .. '/.nvim/db'
  g.db_ui_table_helpers = {
    mysql = {
      Count = 'select count(*) from `{table}`'
    }
  }
end

return {
  config = config
}
