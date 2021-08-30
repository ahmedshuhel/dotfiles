local g = vim.g

local function config()
  g.closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
end

return {
  config = config
}
