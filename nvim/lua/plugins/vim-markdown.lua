local g = vim.g

local function config()
  g.vim_markdown_folding_disabled = 1
  g.vim_markdown_toml_frontmatter = 1
  g.vim_markdown_autowrite = 1

  vim.cmd([[
      augroup MarkdownTextWidth
        autocmd!
        au BufRead,BufNewFile *.md setl textwidth=100
      augroup END
  ]])
end

return {
  config = config
}
