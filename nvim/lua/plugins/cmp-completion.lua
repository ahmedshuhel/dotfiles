local _ = require("underscore")

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
      autocomplete = true,
    },
    formatting = {
      format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
    },
    mapping = {
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable,
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping({
        i = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ select = false }),
      }),
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
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "vim-dadbod-completion" },
    }, {
      { name = "buffer" },
    }),
  })

  -- Use buffer source for `/`.
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return {
  config = config,
}
