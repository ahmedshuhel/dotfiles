local opt = vim.opt
local cmp = require('cmp')

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

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function jump_next(fallback)
  if vim.fn.pumvisible() == 1 then
    cmp.mapping.close()
    -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
  end
  if require("luasnip").expand_or_jumpable() then
    vim.fn.feedkeys(t"<Plug>luasnip-expand-or-jump", "")
  else
    fallback()
  end
end

local function jump_prev(fallback)
  if vim.fn.pumvisible() == 1 then
    cmp.mapping.close()
    --vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
  end
  if require("luasnip").jumpable(-1) then
    vim.fn.feedkeys(t"<Plug>luasnip-jump-prev", "")
  else
    fallback()
  end
end

local function config()
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
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<C-j>"] = jump_next,
      ["<C-k>"] = jump_prev
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "vim-dadbod-completion"}
    },
  }
end

return {
  config = config
}
