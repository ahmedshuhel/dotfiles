local opt = vim.opt
local _ = require("underscore")

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

local function config()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local ls = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = "menu,menuone,noinsert",
      autocomplete = false,
    },
    formatting = {
      format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          _.feedkeys("<C-n>", "n")
        elseif ls.expand_or_jumpable() then
          _.feedkeys("<Plug>luasnip-expand-or-jump")
        elseif _.has_chars_before() then
          _.feedkeys("<C-Space>")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          _.feedkeys("<C-p>", "n")
        elseif ls.jumpable(-1) then
          _.feedkeys("<Plug>luasnip-jump-prev")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "vim-dadbod-completion" },
    },
  })
end

return {
  config = config,
}
