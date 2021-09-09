local g = vim.g

local function config()
    g.tmux_navigator_no_mappings = 1
end

return {
  config = config
}
