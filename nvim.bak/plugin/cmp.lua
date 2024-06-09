local ok, cmp = pcall(require, "cmp")
if not ok then
    return
end

local types = require "cmp.types"
local luasnip = require "luasnip"
local cmp_dap = require "cmp_dap"
local mapping = cmp.mapping

local f = require "maq.funcs"

cmp.setup {
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or cmp_dap.is_dap_buffer()
    end,
    formatting = {
        format = require("lspkind").cmp_format {
            with_text = false,
            maxwidth = 50,
        },
    },
    completion = {
        keyword_length = 2,
    },
    experimental = {
        ghost_text = true,
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = mapping(mapping.scroll_docs(8), { "i" }),
        ["<C-u>"] = mapping(mapping.scroll_docs(-8), { "i" }),
        ["<C-k>"] = mapping(function(fallback)
            if cmp.open_docs_preview() then
                cmp.close()
            else
                fallback()
            end
        end),
        ["<C-Space>"] = mapping.complete(),
        ["<C-e>"] = mapping.abort(),
        ["<CR>"] = mapping.confirm { select = false },
        ["<C-n>"] = mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
        ["<C-p>"] = mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
        ["<Tab>"] = mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item { behavior = types.cmp.SelectBehavior.Select }
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif f.has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item { behavior = types.cmp.SelectBehavior.Select }
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp", max_item_count = 10 },
        { name = "luasnip", max_item_count = 5 },
        { name = "nvim_lua", max_item_count = 10 },
        { name = "path", max_item_count = 10 },
        { name = "buffer", max_item_count = 3 },
        { name = "tmux", max_item_count = 5 },
        { name = "rg", max_item_count = 5 },
        { name = "git", max_item_count = 5 },
        { name = "calc" },
    },
}

require("cmp_git").setup {
    enableRemoteUrlRewrites = true,
}

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
        { name = "dap" },
    },
})
