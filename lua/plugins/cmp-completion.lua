local api = vim.api

return {
    config = function()
      require "cmp".setup {
        formatting = {
          format = function(_, vim_item)
            vim_item.kind = require('lspkind').presets.default[vim_item.kind]
            return vim_item
          end
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'luasnip' }
        }
      }

      api.nvim_exec("autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })", false)
  end
}

