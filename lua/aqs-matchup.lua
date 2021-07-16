local M = {}

M.config = function()
    local g = vim.g
    local api = vim.api

    g.matchup_matchparen_offscreen = api.nvim_eval("{'method': 'popup'}")
end

return M
