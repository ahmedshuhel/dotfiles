local api = vim.api
local _ = require("underscore")
local opt = { silent = true, noremap = true }

local function on_attach(_, bufnr)
  local function map(...)
    api.nvim_buf_set_keymap(bufnr, "n", ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  map("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  map("gd", "<Cmd>Trouble lsp_definitions<CR>", opt)
  map("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opt)
  map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  map("gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  map("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
  map("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
  map("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
  map("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
  map("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  map("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  map("gr", "<cmd>Trouble lsp_references<CR>", opt)
  map("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opt)
  map("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opt)
  map("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)
  map("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opt)
  map("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  map("<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opt)

  map("<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opt)
  map("<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opt)
end

local function make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local completionItem = capabilities.textDocument.completion.completionItem
  completionItem.snippetSupport = true
  completionItem.preselectSupport = true
  completionItem.insertReplaceSupport = true
  completionItem.labelDetailsSupport = true
  completionItem.deprecatedSupport = true
  completionItem.commitCharactersSupport = true
  completionItem.tagSupport = { valueSet = { 1 } }
  completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

local function setup_servers()
  require("lspinstall").setup()

  local lspconf = require("lspconfig")
  local servers = require("lspinstall").installed_servers()
  local capabilities = make_capabilities()

  for _, lang in pairs(servers) do
    if lang == "python" then
      lspconf[lang].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        settings = {
          pyright = {
            disableLanguageServices = false,
          },
          python = {
            analysis = {
              logLevel = "Trace",
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportUnusedImport = false,
              },
            },
          },
        },
      }, lspconf["python"]))
    elseif lang == "lua" then
      lspconf[lang].setup({
        flags = { debounce_text_changes = 500 },
        capabilities = capabilities,
        root_dir = vim.loop.cwd,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "jit" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    else
      lspconf[lang].setup({
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
      })
    end
  end

  lspconf["null-ls"].setup({
    on_attach = on_attach,
  })
end

local function lspSymbol(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefaul" .. name })
end

local function config()
  -- Set log level to debug language server
  -- vim.lsp.set_log_level("debug")
  -- Open log using `:lua vim.cmd('e'..vim.lsp.get_log_path())`
  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require("lspinstall").post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- triggers FileType autocmd that starts the server
  end

  lspSymbol("Error", "")
  lspSymbol("Warning", "")
  lspSymbol("Information", "")
  lspSymbol("Hint", "")

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = false,
    -- set this to true if you want diagnostics to show in insert mode
    update_in_insert = false,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })

  -- suppress error messages from lang servers
  vim.notify = function(msg, log_level, _)
    if msg:match("exit code") then
      return
    end
    if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
    else
      vim.api.nvim_echo({ { msg } }, true, {})
    end
  end
end

return {
  config = config,
}
