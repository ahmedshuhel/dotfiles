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
    formatting = {
      format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
    },
    completion = {
      keyword_length = 2,
    },
    experimental = {
      ghost_text = true,
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
        c = cmp.mapping.confirm({ select = true }),
      }),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif ls.expand_or_jumpable() then
          ls.expand_or_jump()
        elseif _.has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif ls.jumpable(-1) then
          ls.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp", max_item_count = 10 },
      { name = "luasnip", max_item_count = 5 },
      { name = "nvim_lua", max_item_count = 10 },
      { name = "path", max_item_count = 10 },
      { name = "vim-dadbod-completion", max_item_count = 5 },
    }, {}),
  })

  cmp.setup.filetype('markdown', {
    sources = cmp.config.sources({
      { name = "path", max_item_count = 10 },
    }, {})
  })


  -- Use buffer source for `/`.
  -- cmp.setup.cmdline("/", {
  --   sources = {
  --     { name = "buffer", select = true },
  --   },
  -- })

  -- Use cmdline & path source for ':'.
  -- cmp.setup.cmdline(":", {
  --   sources = cmp.config.sources({
  --     { name = "path", select = true },
  --   }, {
  --     { name = "cmdline" },
  --   }),
  -- })
end

return {
  config = config,
}
