local g = vim.g

return {
    config = function()
        g.db_ui_force_echo_notifications = 1
        g.db_ui_use_nerd_fonts = 1
        g.db_ui_show_help = 0
        g.db_ui_save_location = '~/Workspace/devlife/queries'
        g.db_ui_table_helpers = {
          mysql = {
            Count = 'select count(*) from `{table}`'
          }
        }
    end
}
