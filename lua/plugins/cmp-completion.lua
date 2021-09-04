local opt = vim.opt
local cmp = require('cmp')

local M = {}

local icons = {
   Text = "",
   Method = "",
   Function = "",
   Constructor = "",
   Field = "ﰠ",
   Variable = "",
   Class = "ﴯ",
   Interface = "",
   Module = "",
   Property = "ﰠ",
   Unit = "塞",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "פּ",
   Event = "",
   Operator = "",
   TypeParameter = "",
}

M.config = function()
  opt.completeopt = "menuone,noselect"
  cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },
     formatting = {
        format = function(entry, vim_item)
           vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
           vim_item.menu = ({ nvim_lsp = "[LSP]", nvim_lua = "[Lua]", buffer = "[BUF]"})[entry.source.name]
           return vim_item
        end,
     },
     mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<C-j>"] = cmp.mapping.confirm {
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
          },
          ["<Tab>"] = function(fallback)
             if vim.fn.pumvisible() == 1 then
                cmp.mapping.close()
                -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
             end
             if require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
             else
                fallback()
             end
          end,
          ["<S-Tab>"] = function(fallback)
             if vim.fn.pumvisible() == 1 then
                cmp.mapping.close()
                --vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
             end
             if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
             else
                fallback()
             end
          end,
      },
      sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "vim-dadbod-completion"}
      },
  }
end

return M

