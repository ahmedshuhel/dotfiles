local M = {}

M.config = function()
    local g = vim.g

    g.dashboard_disable_at_vimenter = 1
    g.dashboard_disable_statusline = 1
    g.dashboard_default_executive = "telescope"
    g.dashboard_custom_header = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                           ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡨⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⡀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⠀⠄⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣔⡆⠀⠀⠀⠀⠀⢀⣴⣶⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣦⡀⢰⡀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⡄⡆⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡇⠀⡇⠀⠀⠀⠀⠀",
        "⠀⠀⢀⠤⠤⢤⣤⠀⠀⠀⠀⠘⣶⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⢠⣿⣿⣿⣿⡇⠀⡃⠀⠀⠀⠀⠀",
        "⠀⠀⠃⠀⠀⠀⣠⣭⣭⣭⠝⠋⠉⠃⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⠿⣿⣿⡇⠀⠀⠀⣼⡿⢿⣿⣿⡇⢸⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠾⠰⠶⢤⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡏⠀⣼⣿⠃⠀⠀⢀⣿⠀⣰⣿⣿⡇⡸⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠈⠙⠻⢿⣧⠀⠀⠀⢠⣷⣄⠀⠹⣿⣿⣿⣿⣿⣿⣶⣿⡏⠀⠀⠀⠸⣿⣿⣿⣿⣟⡔⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠈⠑⠲⣿⣿⣿⣷⣄⠈⠻⠟⠛⠛⠿⠿⠟⠀⠀⠀⠀⠀⠙⠿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣿⣿⣿⣿⡿⢄⠀⠂⠄⠂⠀⠀⠀⣶⣶⣶⣶⠀⠀⠈⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠁⠙⠛⣿⣿⠤⡼⠀⠀⠀⠀⠑⢀⣼⣿⣿⣿⡿⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠙⠀⠀⠀⠀⠛⠃⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⠿⠃⠤⠀⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢍⠀⣀⠀⠈⢀⡀⠀⠀⠀⢃⣥⣌⡀⠄⠀⠀⠛⠛⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⡇⢰⣿⣿⣾⣿⠋⠀⠀⠀⢿⣿⣿⡇⠀⠀⠀⠀⠀⢮⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠣⣸⣿⣿⣿⠁⠀⠠⠀⠀⠊⠍⠍⠀⠀⠰⣄⣀⡀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣤⣖⣰⠋⠁⠒⠒⢦⠀⠀⠀⣿⣿⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢸⣷⣶⣾⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⠿⠏⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠿⠿⠿⠿⠿⠃⠀⠀            ",
        "                                            "
      }

    g.dashboard_custom_section = {
        a = {description = {"  Find File                 CTR + p"}, command = "Telescope find_files"},
        b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
        c = {description = {"  Find Word                 SPC f w"}, command = "Telescope live_grep"},
        d = {description = {"ﱐ  New File                  SPC f n"}, command = "DashboardNewFile"},
        e = {description = {"  Bookmarks                 SPC b m"}, command = "Telescope marks"},
        f = {description = {"  Load Last Session         SPC s l"}, command = "SessionLoad"}
    }

    g.dashboard_custom_footer = {
        "   ",
        "@ahmedshuhel"
    }


function _G.open_dashboard()
  if vim.fn.argc() == 0 then
    vim.api.nvim_command("Dashboard")
  end
end


vim.api.nvim_exec("au VimEnter * lua open_dashboard()", false)

end

return M
